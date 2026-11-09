import NoThreeLine.ProtectedLedgerGlobalBounds
import NoThreeLine.BirthRunningRate

/-! The real running source is recovered from two successive physical
states by their remaining-time difference. It is therefore observable
in the actual protected ledger history after the update. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedRunningSource_eq_elapsed {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (x : AugTimedState cfg×CandidateData n) :
    protectedRunningSource cfg ε M L p x=
      ∫t in (0:ℝ)..birthElapsed cfg ε M x,
        protectedLinePositiveDrift (selectedTrajectory cfg ((augTimedInput cfg x.1).1.1,t)) cfg.mask L p := by
  by_cases hd : birthDone cfg x.1
  · simp only [protectedRunningSource,birthElapsed,birthDone] at hd ⊢
    simp only [if_pos hd,intervalIntegral.integral_same]
  · simp only [protectedRunningSource,birthElapsed,birthDone] at hd ⊢
    simp only [if_neg hd]

theorem protectedRunningSource_elapsed_bounds_all {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1) (x : AugTimedState cfg×CandidateData n) :
    0≤protectedRunningSource cfg ε M L p x ∧
      protectedRunningSource cfg ε M L p x≤birthElapsed cfg ε M x*((cfg.B/n)*cfg.B) := by
  rw [protectedRunningSource_eq_elapsed]
  have ha := birthElapsed_mem cfg ε M x
  have hT := augGuardTime_mem cfg ε M (augTimedInput cfg x.1) x.1.property.1.1
  exact integral_initial_segment_bounds _ _ ha.1 le_rfl _
    (selectedProtectedSource_continuous cfg (augTimedInput cfg x.1).1.1 L p).measurable
    ((cfg.B/n)*cfg.B) (mul_nonneg (div_nonneg hB (Nat.cast_nonneg n)) hB)
    (fun t ht=>protectedLinePositiveDrift_bounds_all _ cfg.directions cfg.mask L hsp p hpL cfg.B
      (selectedTrajectory_valid cfg (augTimedInput cfg x.1).1.1 x.1.property.1.1 t
        ⟨ht.1.le,ht.2.le.trans (ha.2.trans hT.2)⟩)
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩))

theorem protectedRunningSource_bounds_all {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1) (x : AugTimedState cfg×CandidateData n) :
    0≤protectedRunningSource cfg ε M L p x ∧
      protectedRunningSource cfg ε M L p x≤(cfg.horizon:ℝ)*((cfg.B/n)*cfg.B) := by
  have hb := protectedRunningSource_elapsed_bounds_all cfg ε M L hsp p hpL hB hm x
  refine ⟨hb.1,hb.2.trans ?_⟩
  exact mul_le_mul_of_nonneg_right ((birthElapsed_mem cfg ε M x).2.trans
    ((augGuardTime_le_remaining cfg ε M _ x.1.property.2.1).trans x.1.property.2.2))
    (mul_nonneg (div_nonneg hB (Nat.cast_nonneg n)) hB)

def protectedStatePairSource {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (x : AugTimedState cfg×AugTimedState cfg) : ℝ :=
  ∫t in (0:ℝ)..max 0 (x.1.val.2-x.2.val.2),
    protectedLinePositiveDrift (selectedTrajectory cfg ((augTimedInput cfg x.1).1.1,t)) cfg.mask L p

theorem protectedStatePairSource_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) : Measurable (protectedStatePairSource cfg L p) := by
  have hA : Measurable (fun x : AugTimedState cfg×AugTimedState cfg=>max 0 (x.1.val.2-x.2.val.2)) :=
    measurable_const.max ((measurable_subtype_coe.snd.comp measurable_fst).sub
      (measurable_subtype_coe.snd.comp measurable_snd))
  have hx : Measurable (fun z : (AugTimedState cfg×AugTimedState cfg)×ℝ=>
      ((augTimedInput cfg z.1.1).1.1,z.2)) :=
    (((augTimedInput_measurable cfg).comp measurable_fst.fst).fst.fst).prodMk measurable_snd
  exact variable_running_integral_measurable _ hA (fun _=>le_max_left _ _) _
    ((protectedLinePositiveDrift_measurable cfg.mask L p).comp ((selectedTrajectory_measurable cfg).comp hx))

theorem protectedStatePairSource_actual {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (s : AugTimedState cfg) (z : CandidateData n) :
    protectedStatePairSource cfg L p (s,augTimedStep cfg ε M (s,z))=
      protectedRunningSource cfg ε M L p (s,z) := by
  rw [protectedRunningSource_eq_elapsed]
  unfold protectedStatePairSource
  rw [← birthElapsed_eq_remaining_drop cfg ε M (s,z),max_eq_right (birthElapsed_mem cfg ε M (s,z)).1]

def protectedClockRunningSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (x : ProtectedTimedState cfg×BoardClockPath n) : ℝ :=
  protectedRunningSource cfg ε M L p (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem protectedClockRunningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) : Measurable (protectedClockRunningSource cfg ε M L p hn) :=
  (protectedRunningSource_measurable cfg ε M L p).comp
    (measurable_fst.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

theorem protectedState_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance
      (fun ω=>(protectedRecycledPair cfg ε M L hn s k ω).1) :=
  StateHistory.state_measurable _ _ k

theorem protectedClockRunningSource_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (fun ω=>protectedClockRunningSource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω)) := by
  have hk : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (fun ω=>(protectedRecycledPair cfg ε M L hn s k ω).1.1) :=
    (protectedState_measurable_history cfg ε M L hn s k).fst.mono
      ((protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k)) le_rfl
  have hj := (protectedState_measurable_history cfg ε M L hn s (k+1)).fst
  convert (protectedStatePairSource_measurable cfg L p).comp (hk.prodMk hj) using 1
  funext ω
  exact (protectedStatePairSource_actual cfg ε M L p _ _).symm

end NoThreeLine

#print axioms NoThreeLine.protectedRunningSource_elapsed_bounds_all
#print axioms NoThreeLine.protectedStatePairSource_actual
#print axioms NoThreeLine.protectedClockRunningSource_measurable_history
