import NoThreeLine.LineSectionCreditGap

/-! The actual terminal credit and the additionally frozen root credit
have the same weighted mean on bounded tests of the saved snapshot. This is
derived from actual restart laws and completion, rather than assumed as a
pointwise credit invariant. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set ProbabilityTheory Filter
open scoped Topology

namespace NoThreeLine

theorem RecycledBoardProcess.bounded_signed_expected {S W : Type*}
    [MeasurableSpace S] [MeasurableSpace W] (F : S × W → S × W) (hF : Measurable F)
    (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun w => F (s,w)) = (ν.map (fun w => (F (s,w)).1)).prod ν)
    (z : S → ℝ) (hz : Measurable z) (D : ℝ) (hb : ∀ s, ‖z s‖ ≤ D)
    (hmean : ∀ s, (∫ w, z (F (s,w)).1 ∂ν) = z s) (s : S) (k : ℕ) :
    (∫ w, z (RecycledBoardProcess.state F s k w) ∂ν) = z s := by
  induction k with
  | zero => simp [RecycledBoardProcess.state,RecycledBoardProcess.iterate]
  | succ k ih =>
    let v := RecycledBoardProcess.iterate F s k
    have hv : Measurable v := RecycledBoardProcess.iterate_measurable F hF s k
    let μ := ν.map (RecycledBoardProcess.state F s k)
    letI : IsProbabilityMeasure μ := Measure.isProbabilityMeasure_map hv.fst.aemeasurable
    have hp : ν.map v = μ.prod ν := by
      change ν.map (RecycledBoardProcess.iterate F s k) =
        (ν.map (fun ω => (RecycledBoardProcess.iterate F s k ω).1)).prod ν
      rw [RecycledBoardProcess.iterate_state_map F hF ν hsection s k]
      exact RecycledBoardProcess.iterate_map F hF ν hsection s k
    have hi : Integrable (fun x : S × W => z (F x).1) (μ.prod ν) :=
      (integrable_const D).mono' (hz.comp hF.fst).aestronglyMeasurable (ae_of_all _ (fun x => hb _))
    calc
      _ = ∫ x, z (F x).1 ∂ν.map v :=
        (integral_map_of_stronglyMeasurable hv (hz.comp hF.fst).stronglyMeasurable).symm
      _ = ∫ a, ∫ w, z (F (a,w)).1 ∂ν ∂μ := by rw [hp,integral_prod _ hi]
      _ = ∫ a, z a ∂μ := by simp_rw [hmean]
      _ = ∫ w, z (RecycledBoardProcess.state F s k w) ∂ν :=
        integral_map_of_stronglyMeasurable hv.fst hz.stronglyMeasurable
      _ = _ := ih

namespace BirthWitness
open AuxiliaryODE EtaMixedGenerator

theorem lineSectionCreditGap_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (F : AugmentedState n → ℝ) (hF : Measurable F) :
    Measurable (lineSectionCreditGap cfg p F) := by
  have hc : Measurable (fun s : LineSectionObservation cfg => (s.2.2.physical.process.accounts p).credit) :=
    CreditAccount.measurable_credit.comp ((ProcessState.measurable_account n p).comp
    ((ExtendedState.measurable_process n).comp
      ((AugmentedState.measurable_physical n).comp measurable_snd.snd)))
  exact (((augTimedCredit_measurable cfg p).comp measurable_fst.fst).sub hc).mul
    (hF.comp measurable_snd.snd)

theorem lineSectionCreditGap_norm_le {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (F : AugmentedState n → ℝ) (D : ℝ)
    (hF : ∀ a, a.Valid cfg.B → |F a| ≤ D)
    (s : LineSectionObservation cfg) (hs : LineSectionInvariant cfg p s) :
    ‖lineSectionCreditGap cfg p F s‖ ≤ cfg.B * D := by
  have hcur := augTimedCredit_bounds cfg p s.1.1
  have hsave := (s.2.2.physical.process.accounts p).credit_bounds cfg.B (hs.saved.1.2.1.1 p)
  have hgap : |augTimedCredit cfg p s.1.1 - (s.2.2.physical.process.accounts p).credit| ≤ cfg.B :=
    abs_le.mpr ⟨by linarith,by linarith⟩
  simpa only [lineSectionCreditGap,Real.norm_eq_abs,abs_mul] using
    mul_le_mul hgap (hF s.2.2 hs.saved) (abs_nonneg _) (hcur.1.trans hcur.2)

theorem goodLineSectionCreditGap_expected {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (F : AugmentedState n → ℝ) (hF : Measurable F) (D : ℝ)
    (hFD : ∀ a, a.Valid cfg.B → |F a| ≤ D)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodLineSectionObservation cfg p) (k : ℕ) :
    (∫ ω, lineSectionCreditGap cfg p F
      (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).val
      ∂boardClockMeasure n (cfg.B/n)) = lineSectionCreditGap cfg p F s.val := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact RecycledBoardProcess.bounded_signed_expected _
    (goodLineSectionRestart_measurable cfg ε M start L p E A hn) _
    (goodLineSectionRestart_map cfg ε M start L p E A hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    (fun x : GoodLineSectionObservation cfg p => lineSectionCreditGap cfg p F x.val)
    ((lineSectionCreditGap_measurable cfg p F hF).comp measurable_subtype_coe) (cfg.B*D)
    (fun x => lineSectionCreditGap_norm_le cfg p F D hFD x.val x.property.1)
    (fun x => lineSectionCreditGap_step_mean cfg ε M start L p E A F hn hB hm x.val x.property.1) s k

theorem lineSectionTerminal_full_stable_ae {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (hn : 0 < n) (hB : 0 < cfg.B) (s : GoodLineSectionObservation cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), ∀ᶠ k in atTop,
      RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω =
        lineSectionTerminal cfg ε M start L p E A hn s ω := by
  filter_upwards [lineSectionTerminal_stable_ae cfg ε M start L p E A hn hB s,
    observedRecycledTerminalPair_stable_ae cfg ε M start hn hB s.val.1] with ω hs hp
  filter_upwards [hs,hp] with k hsk hpk
  apply Subtype.ext
  apply Prod.ext
  · rw [lineSectionTerminal_projection]
    exact (congrArg Prod.fst (goodLineSectionRecycled_projection cfg ε M start L p E A hn s k ω)).trans
      (congrArg Prod.fst hpk)
  · exact hsk

theorem lineSectionTerminal_creditGap_mean {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (F : AugmentedState n → ℝ) (hF : Measurable F) (D : ℝ)
    (hFD : ∀ a, a.Valid cfg.B → |F a| ≤ D)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodLineSectionObservation cfg p) :
    (∫ ω, lineSectionCreditGap cfg p F (lineSectionTerminal cfg ε M start L p E A hn s ω).val
      ∂boardClockMeasure n (cfg.B/n)) = lineSectionCreditGap cfg p F s.val := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let R := goodLineSectionRestart cfg ε M start L p E A hn
  let z := fun x : GoodLineSectionObservation cfg p => lineSectionCreditGap cfg p F x.val
  have hzm : Measurable z := (lineSectionCreditGap_measurable cfg p F hF).comp measurable_subtype_coe
  have hlim : ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n),
      Tendsto (fun k => z (RecycledBoardProcess.state R s k ω)) atTop
        (𝓝 (z (lineSectionTerminal cfg ε M start L p E A hn s ω))) := by
    filter_upwards [lineSectionTerminal_full_stable_ae cfg ε M start L p E A hn hB s] with ω hω
    exact tendsto_const_nhds.congr' (hω.mono (fun k hk => congrArg z hk.symm))
  have hi := tendsto_integral_of_dominated_convergence (fun _ : BoardClockPath n => cfg.B*D)
    (fun k => (hzm.comp (RecycledBoardProcess.state_measurable R
      (goodLineSectionRestart_measurable cfg ε M start L p E A hn) s k)).aestronglyMeasurable)
    (integrable_const _) (fun k => ae_of_all _ (fun ω =>
      lineSectionCreditGap_norm_le cfg p F D hFD _ (RecycledBoardProcess.state R s k ω).property.1)) hlim
  have he : ∀ k, (∫ ω, z (RecycledBoardProcess.state R s k ω) ∂boardClockMeasure n (cfg.B/n)) = z s :=
    goodLineSectionCreditGap_expected cfg ε M start L p E A F hF D hFD hn hB hm s
  exact tendsto_nhds_unique hi (tendsto_const_nhds.congr'
    (Filter.Eventually.of_forall (fun k => (he k).symm)))

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.RecycledBoardProcess.bounded_signed_expected
#print axioms NoThreeLine.BirthWitness.lineSectionTerminal_creditGap_mean
