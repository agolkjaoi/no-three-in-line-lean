import NoThreeLine.ProtectedEntropyRunningBounds
import NoThreeLine.ProtectedRunningHistory

/-! The actual signed entropy source is reconstructed from consecutive
protected states, including the old saved ledger and remaining-time drop. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedRunningEntropySource_eq_elapsed {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (s : ProtectedTimedState cfg) (z : CandidateData n) :
    protectedRunningEntropySource cfg ε M L p s z=
      ∫t in (0:ℝ)..birthElapsed cfg ε M (s.1,z),
        protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L p cfg.B := by
  by_cases hd : birthDone cfg s.1
  · simp only [protectedRunningEntropySource,birthElapsed,birthDone] at hd ⊢
    simp only [if_pos hd,intervalIntegral.integral_same]
  · simp only [protectedRunningEntropySource,birthElapsed,birthDone] at hd ⊢
    simp only [if_neg hd]

theorem protectedRunningEntropySource_elapsed_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg) (z : CandidateData n) :
    ‖protectedRunningEntropySource cfg ε M L p s z‖≤
      birthElapsed cfg ε M (s.1,z)*protectedEntropySourceCap n cfg.B := by
  rw [protectedRunningEntropySource_eq_elapsed]
  have ha := birthElapsed_mem cfg ε M (s.1,z)
  have hg := augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1
  have hb := intervalIntegral.norm_integral_le_of_norm_le_const
    (f:=fun t=>protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L p cfg.B)
    (a:=0) (b:=birthElapsed cfg ε M (s.1,z))
    (fun t ht=>by
      rw [uIoc_of_le ha.1] at ht
      exact protectedEntropySource_bounds_all _ s.2 cfg.directions cfg.mask L hsp p hpL cfg.B hB
        (selectedTrajectory_valid cfg (augTimedInput cfg s.1).1.1 s.1.property.1.1 t
          ⟨ht.1.le,ht.2.trans (ha.2.trans hg.2)⟩) (fun q=>⟨cfg.mask_nonneg q,hm q⟩))
  simpa only [sub_zero,abs_of_nonneg ha.1,mul_comm] using hb

def protectedStatePairEntropySource {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (x : ProtectedTimedState cfg×ProtectedTimedState cfg) : ℝ :=
  ∫t in (0:ℝ)..max 0 (x.1.1.val.2-x.2.1.val.2),
    protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg x.1.1).1.1,t)) x.1.2 cfg.directions cfg.mask L p cfg.B

attribute [local irreducible] protectedEntropySource

theorem protectedStatePairEntropySource_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) : Measurable (protectedStatePairEntropySource cfg L p) := by
  have hA : Measurable (fun x : ProtectedTimedState cfg×ProtectedTimedState cfg=>max 0 (x.1.1.val.2-x.2.1.val.2)) :=
    measurable_const.max ((measurable_subtype_coe.snd.comp measurable_fst.fst).sub
      (measurable_subtype_coe.snd.comp measurable_snd.fst))
  have hx : Measurable (fun z : (ProtectedTimedState cfg×ProtectedTimedState cfg)×ℝ=>
      (((augTimedInput cfg z.1.1.1).1.1,z.1.1.2),z.2)) :=
    ((((augTimedInput_measurable cfg).comp measurable_fst.fst.fst).fst.fst).prodMk measurable_fst.fst.snd).prodMk measurable_snd
  exact variable_running_integral_measurable _ hA (fun _=>le_max_left _ _) _
    ((selectedProtectedEntropySource_joint_measurable cfg L p).comp hx)

theorem protectedStatePairEntropySource_actual {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (s : ProtectedTimedState cfg) (z : CandidateData n) :
    protectedStatePairEntropySource cfg L p (s,protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z)))=
      protectedRunningEntropySource cfg ε M L p s z := by
  rw [protectedRunningEntropySource_eq_elapsed]
  unfold protectedStatePairEntropySource
  change (∫t in (0:ℝ)..max 0 (s.1.val.2-(augTimedStep cfg ε M (s.1,z)).val.2),
    protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L p cfg.B)=_
  rw [←birthElapsed_eq_remaining_drop cfg ε M (s.1,z),max_eq_right (birthElapsed_mem cfg ε M (s.1,z)).1]

def protectedClockRunningEntropySource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (x : ProtectedTimedState cfg×BoardClockPath n) : ℝ :=
  protectedRunningEntropySource cfg ε M L p x.1 (WinnerMarkLaw.firstMarkedRace hn x.2)

theorem protectedClockRunningEntropySource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) : Measurable (protectedClockRunningEntropySource cfg ε M L p hn) :=
  (protectedRunningEntropySource_joint_measurable cfg ε M L p).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

theorem protectedClockRunningEntropySource_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (fun ω=>protectedClockRunningEntropySource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω)) := by
  have hk : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (fun ω=>(protectedRecycledPair cfg ε M L hn s k ω).1) :=
    (protectedState_measurable_history cfg ε M L hn s k).mono
      ((protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k)) le_rfl
  have hj := protectedState_measurable_history cfg ε M L hn s (k+1)
  convert (protectedStatePairEntropySource_measurable cfg L p).comp (hk.prodMk hj) using 1
  funext ω
  exact (protectedStatePairEntropySource_actual cfg ε M L p _ _).symm

end NoThreeLine
#print axioms NoThreeLine.protectedRunningEntropySource_elapsed_bound
#print axioms NoThreeLine.protectedStatePairEntropySource_actual
#print axioms NoThreeLine.protectedClockRunningEntropySource_measurable_history
