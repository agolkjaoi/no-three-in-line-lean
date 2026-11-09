import NoThreeLine.ProtectedScheduledMartingale

/-! Start the protected book at the actual canonical initialization.
Initial deadline retirees save their protected credit at time zero. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedScheduleInitial {n : ℕ} (B : ℝ) (hB : 1≤B) (L : LineIndex n)
    (deadline : Grid n→ℝ) (start : ℝ) : ProtectedPhaseState n B :=
  protectedDeadlineBook L deadline start
    (⟨AugmentedState.initial n,AugmentedState.initial_valid n B hB⟩,(fun _=>0,0))

theorem protectedScheduleInitial_credit {n : ℕ} (B : ℝ) (hB : 1≤B) (L : LineIndex n)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) :
    protectedPhaseCredit L p (protectedScheduleInitial B hB L deadline start)=1 := by
  rw [protectedScheduleInitial,protectedDeadlineBook_credit]
  norm_num [protectedPhaseCredit,protectedLineCredit,AugmentedState.initial,ExtendedState.initial,
    ProcessState.initial,CreditAccount.credit,occupancy,protection] <;> decide

theorem protectedScheduleInitial_compensated_mean_one {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hpL : p∈L.val) (hn : 0<n) (hB : 1≤B) (J : ℕ)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (hsp : ∀j,specified (cs j).directions L)
    (hK0 : 0≤K) (k : ℕ) :
    (∫ω,protectedScheduledCompensated cs ε M deadline start L p hn J
      (protectedScheduleInitial B hB L deadline start) k ω
      ∂scheduledLineForbiddenLaw cs ε M K deadline start hn L 0 (augInitialState B hB deadline start) J)=1 := by
  let s := protectedScheduleInitial B hB L deadline start
  have hpos : 0<B := zero_lt_one.trans_le hB
  have hphys : s.1=augInitialState B hB deadline start := rfl
  have ho : occupancy s.1.val.physical.process L=0 := by
    rw [hphys]
    simp only [occupancy,augInitialState_selected,Finset.empty_inter,Finset.card_empty]
  have hk : s.1.val.physical.clocks L≤K := by
    rw [hphys,augInitialState,augValidDeadlineRetirement_clocks]
    exact hK0
  have hsv : 0≤s.2.1 p ∧ s.2.1 p≤2*B :=
    protectedDeadlineBook_saved_bounds L (cs 0).directions (hsp 0) p hpL deadline start _
      ⟨le_rfl,mul_nonneg (by norm_num) hpos.le⟩
  change (∫ω,protectedScheduledCompensated cs ε M deadline start L p hn J s k ω
    ∂scheduledLineForbiddenLaw cs ε M K deadline start hn L 0 s.1 J)=1
  rw [protectedScheduled_compensated_mean cs ε M K deadline start L 0 p hpL hn hpos (by omega) J
    hKcfg hK hsp s ho hk hsv rfl]
  exact protectedScheduleInitial_credit B hB L deadline start p

end NoThreeLine

#print axioms NoThreeLine.protectedScheduleInitial_credit
#print axioms NoThreeLine.protectedScheduleInitial_compensated_mean_one
