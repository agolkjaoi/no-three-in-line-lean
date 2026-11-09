import NoThreeLine.ProtectedWholeSquareMeasurable
import NoThreeLine.ProtectedWholeEnergy
import NoThreeLine.ProtectedWholeSquareUniformBounds

/-! A source depending on physical state and old saved credits is
reconstructed from two consecutive real protected states. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedStatePairGenericSource {n : ℕ} (cfg : FlowConfig n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (x : ProtectedTimedState cfg×ProtectedTimedState cfg) : ℝ :=
  ∫t in (0:ℝ)..max 0 (x.1.1.val.2-x.2.1.val.2),
    F (selectedTrajectory cfg ((augTimedInput cfg x.1.1).1.1,t),x.1.2)

def protectedClockStateSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hn : 0<n) (x : ProtectedTimedState cfg×BoardClockPath n) : ℝ :=
  protectedRunningScalarSource cfg ε M x.1.1
    (fun t=>F (selectedTrajectory cfg ((augTimedInput cfg x.1.1).1.1,t),x.1.2))
    (WinnerMarkLaw.firstMarkedRace hn x.2)

theorem protectedStatePairGenericSource_measurable {n : ℕ} (cfg : FlowConfig n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hF : Measurable F) :
    Measurable (protectedStatePairGenericSource cfg F) := by
  have hA : Measurable (fun x : ProtectedTimedState cfg×ProtectedTimedState cfg=>max 0 (x.1.1.val.2-x.2.1.val.2)) :=
    measurable_const.max ((measurable_subtype_coe.snd.comp measurable_fst.fst).sub
      (measurable_subtype_coe.snd.comp measurable_snd.fst))
  have hi : Measurable (fun z : (ProtectedTimedState cfg×ProtectedTimedState cfg)×ℝ=>
      ((augTimedInput cfg z.1.1.1).1.1,z.2)) :=
    ((((augTimedInput_measurable cfg).comp measurable_fst.fst.fst).fst.fst).prodMk measurable_snd)
  have hf := hF.comp (((selectedTrajectory_measurable cfg).comp hi).prodMk measurable_fst.fst.snd)
  exact variable_running_integral_measurable _ hA (fun _=>le_max_left _ _) _ hf

theorem protectedStatePairGenericSource_actual {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (F : ExtendedState n×(Grid n→ℝ)→ℝ) (s : ProtectedTimedState cfg) (z : CandidateData n) :
    protectedStatePairGenericSource cfg F (s,protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z)))=
      protectedRunningScalarSource cfg ε M s.1
        (fun t=>F (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t),s.2)) z := by
  rw [protectedRunningScalarSource_eq_elapsed]
  unfold protectedStatePairGenericSource
  change (∫t in (0:ℝ)..max 0 (s.1.val.2-(augTimedStep cfg ε M (s.1,z)).val.2),
    F (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t),s.2))=_
  rw [←birthElapsed_eq_remaining_drop cfg ε M (s.1,z),max_eq_right (birthElapsed_mem cfg ε M (s.1,z)).1]

theorem protectedClockStateSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hF : Measurable F) (hn : 0<n) :
    Measurable (protectedClockStateSource cfg ε M F hn) :=
  (protectedRunningStateSource_joint_measurable cfg ε M F hF).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

theorem protectedClockStateSource_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hF : Measurable F)
    (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (fun ω=>protectedClockStateSource cfg ε M F hn (protectedRecycledPair cfg ε M L hn s k ω)) := by
  have hk : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (fun ω=>(protectedRecycledPair cfg ε M L hn s k ω).1) :=
    (protectedState_measurable_history cfg ε M L hn s k).mono
      ((protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k)) le_rfl
  have hj := protectedState_measurable_history cfg ε M L hn s (k+1)
  convert (protectedStatePairGenericSource_measurable cfg F hF).comp (hk.prodMk hj) using 1
  funext ω
  exact (protectedStatePairGenericSource_actual cfg ε M L F _ _).symm

theorem protectedStateSource_elapsed_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (E : Finset (Grid n)) (F : ExtendedState n×(Grid n→ℝ)→ℝ) (C : ℝ)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (z : CandidateData n) :
    ‖protectedRunningScalarSource cfg ε M s.1
      (fun t=>F (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t),s.2)) z‖≤
      birthElapsed cfg ε M (s.1,z)*C := by
  rw [protectedRunningScalarSource_eq_elapsed]
  have ha := birthElapsed_mem cfg ε M (s.1,z)
  have hg := augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1
  have hb := intervalIntegral.norm_integral_le_of_norm_le_const
    (f:=fun t=>F (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t),s.2))
    (a:=0) (b:=birthElapsed cfg ε M (s.1,z))
    (fun t ht=>by
      rw [uIoc_of_le ha.1] at ht
      exact hF _ s.2 (selectedTrajectory_valid cfg (augTimedInput cfg s.1).1.1 s.1.property.1.1 t
        ⟨ht.1.le,ht.2.trans (ha.2.trans hg.2)⟩) hsv)
  simpa only [sub_zero,abs_of_nonneg ha.1,mul_comm] using hb

end NoThreeLine
#print axioms NoThreeLine.protectedStatePairGenericSource_actual
#print axioms NoThreeLine.protectedClockStateSource_measurable_history
#print axioms NoThreeLine.protectedStateSource_elapsed_bound
