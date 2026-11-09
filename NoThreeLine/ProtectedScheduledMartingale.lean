import NoThreeLine.ProtectedScheduledBaseMartingale
import NoThreeLine.BoundedDensityMartingaleTransfer

/-! Under the existing scheduled forbidden-line law, the actual saved
credit minus the running source accumulated over the finite prefix is
a martingale at phase boundaries on the full protected history. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem protectedScheduledDensity_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (p : Grid n) (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) (k : ℕ) (hk : k≤J) :
    protectedScheduledDensity cs ε M K deadline start L N p hn J s k=
      scheduledLineStageDensity cs ε M K deadline start hn L N s.1 k := by
  funext ω
  exact congrArg (fun r : (ℕ × ValidAugmentedState n B) × BoardClockPath n=>
    validLineStageDensity K L N s.1 r.1.2)
    (protectedScheduledIterate_projection cs ε M deadline start L p hn J s k hk ω)

theorem protectedScheduled_compensated_martingale {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<B) (hN : N≤1) (J : ℕ)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (hsp : ∀j,specified (cs j).directions L)
    (s : ProtectedPhaseState n B) (ho : occupancy s.1.val.physical.process L=N)
    (hk : s.1.val.physical.clocks L≤K) (hsv : 0≤s.2.1 p ∧ s.2.1 p≤2*B)
    (hA : s.2.2=0) :
    Martingale (protectedScheduledCompensated cs ε M deadline start L p hn J s)
      (protectedScheduledFiltration cs ε M deadline start L p hn J s)
      (scheduledLineForbiddenLaw cs ε M K deadline start hn L N s.1 J) := by
  let ν := boardClockMeasure n (B/n)
  let Z := scheduledLineStageDensity cs ε M K deadline start hn L N s.1 J
  let D := protectedScheduledDensity cs ε M K deadline start L N p hn J s
  let H := protectedScheduledCompensated cs ε M deadline start L p hn J s
  let F := protectedScheduledFiltration cs ε M deadline start L p hn J s
  let P := protectedScheduledStep cs ε M deadline start L p hn J
  have hP : Measurable P := protectedScheduledStep_measurable cs ε M deadline start L p hn J
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure (savedCreditMeasure ν Z) :=
    scheduledLineForbiddenLaw_probability cs ε M K deadline start hn hB hKcfg hK L hsp N hN s.1 ho hk J
  have hs := protectedScheduleRegion_initial cs start K L N p J s ⟨ho.ge,fun _=>hk⟩ hsv hA
  have hm := protectedScheduled_base_martingales cs ε M K deadline start L N p hpL hn hB hN J
    hKcfg hK hsp s hs hk
  have hHm (k : ℕ) : @Measurable _ _ (F k) inferInstance (H k) :=
    ((protectedPhaseCompensated_measurable L p).comp measurable_snd).comp
      (StateHistory.state_measurable (state P (0,s)) (state_measurable P hP (0,s)) k)
  have hbD (k : ℕ) (ω : BoardClockPath n) : ‖D k ω‖≤(2/(2-K))^2 := by
    have hb := validLineStageDensity_bounds K hK L N hN s.1
      (protectedScheduledIterate cs ε M deadline start L p hn J s k ω).1.2.1 hk
    exact (show ‖D k ω‖≤_ by
      rw [Real.norm_eq_abs,abs_of_nonneg (show 0≤D k ω from hb.1)]
      exact hb.2)
  have hbH (k : ℕ) (ω : BoardClockPath n) : ‖H k ω‖≤2*B+protectedScheduleBudget cs start J := by
    let a := state P (0,s) k ω
    have hr := iterate_region P (protectedScheduleRegion cs start K L N p J)
      (protectedScheduleRegion_step cs ε M K deadline start L p hpL hn hB.le N hN J hKcfg hsp) (0,s) hs k ω
    change protectedScheduleRegion cs start K L N p J a at hr
    have hc := protectedLineCredit_bounds_all L a.2.1.val.physical a.2.2.1
      (cs 0).directions (hsp 0) p hpL B a.2.1.property.1 hr.2.2.1
    have ha := hr.2.2.2.2.trans (protectedScheduleBudget_mono cs start hB.le hr.1)
    change ‖protectedLineCredit L a.2.1.val.physical a.2.2.1 p-a.2.2.2‖≤_
    exact (norm_sub_le _ _).trans (by
      simpa only [Real.norm_eq_abs,abs_of_nonneg hc.1,abs_of_nonneg hr.2.2.2.1] using add_le_add hc.2 ha)
  have hstable : ∀ᵐω∂ν,∀ᶠk in atTop,D k ω=Z ω := ae_of_all _ (fun ω=>by
    filter_upwards [eventually_ge_atTop J] with k hj
    calc
      D k ω = D J ω := congrArg (fun a : (ℕ × ProtectedPhaseState n B) × BoardClockPath n=>
        validLineStageDensity K L N s.1 a.1.2.1)
        (protectedScheduledIterate_stable cs ε M deadline start L p hn J s ω k hj)
      _ = Z ω := congrFun (protectedScheduledDensity_projection cs ε M K deadline start L N p hn J s J le_rfl) ω)
  exact bounded_density_martingale_transfer ν F D H hm.1 hm.2 _ _ hbD hbH hHm Z
    (scheduledLineStageDensity_measurable cs ε M K deadline start hn L N s.1 J)
    (scheduledLineStageDensity_integrable cs ε M K deadline start hn hB hK L N hN s.1 hk J)
    (fun ω=>(validLineStageDensity_bounds K hK L N hN s.1 _ hk).1) hstable

theorem protectedScheduled_compensated_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<B) (hN : N≤1) (J : ℕ)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (hsp : ∀j,specified (cs j).directions L)
    (s : ProtectedPhaseState n B) (ho : occupancy s.1.val.physical.process L=N)
    (hk : s.1.val.physical.clocks L≤K) (hsv : 0≤s.2.1 p ∧ s.2.1 p≤2*B)
    (hA : s.2.2=0) (k : ℕ) :
    (∫ω,protectedScheduledCompensated cs ε M deadline start L p hn J s k ω
      ∂scheduledLineForbiddenLaw cs ε M K deadline start hn L N s.1 J)=protectedPhaseCredit L p s := by
  letI := scheduledLineForbiddenLaw_probability cs ε M K deadline start hn hB hKcfg hK L hsp N hN s.1 ho hk J
  have hm := protectedScheduled_compensated_martingale cs ε M K deadline start L N p hpL hn hB hN J
    hKcfg hK hsp s ho hk hsv hA
  have h := (hm.setIntegral_eq (Nat.zero_le k) MeasurableSet.univ).symm
  simp only [setIntegral_univ] at h
  rw [h]
  change (∫_ω : BoardClockPath n,protectedPhaseCredit L p s-s.2.2
    ∂scheduledLineForbiddenLaw cs ε M K deadline start hn L N s.1 J)=_
  simp [hA]

end NoThreeLine

#print axioms NoThreeLine.protectedScheduledDensity_projection
#print axioms NoThreeLine.protectedScheduled_compensated_martingale
#print axioms NoThreeLine.protectedScheduled_compensated_mean
