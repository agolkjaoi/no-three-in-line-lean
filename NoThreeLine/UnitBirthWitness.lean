import NoThreeLine.RootPhaseMomentExpansion
import NoThreeLine.ScheduledRetentionPrice

/-! Retention one is the actual selected-point indicator in a consistent
saved birth record. Its unit source price is the original integrated input
rate divided by n; no positive lower bound on that rate is required. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness

def unitBirthRetention (n : ℕ) : Retention n where
  value _ _ := 1
  measurable_value _ := measurable_const
  bounds _ _ := ⟨zero_le_one,le_rfl⟩

theorem savedWitness_unit_retained {n : ℕ} (s : SavedObservation n) (hs : SavedConsistent s) (q : Grid n) :
    (savedWitness (unitBirthRetention n) s).retained q=
      if q∈s.1.physical.process.selected then 1 else 0 := by
  simp only [savedWitness,recordedValue,unitBirthRetention,hs q]

theorem initial_rootPhaseWitness_unit_retained {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (N : ℕ) (ω : BoardClockPath n) (q : Grid n) :
    (initialRootPhaseWitness cs ε M deadline start p hn hB (unitBirthRetention n) N ω).retained q=
      if q∈(initialRootPhaseWitness cs ε M deadline start p hn hB (unitBirthRetention n) N ω).augmented.physical.process.selected
      then 1 else 0 :=
  savedWitness_unit_retained _ (rootPhaseRecycledState cs ε M deadline start p hn
    (initialGoodPhaseRootObservation B hB p deadline start) N ω).property.1.saved.2 q

theorem unitBirthRetention_accumulated_price {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start : ℝ)
    (N : ℕ) (q : Grid n) :
    accumulatedPhaseUnitPrice cs start (unitBirthRetention n) N q=
      (∑j∈Finset.range N,(cs j).horizon*(cs j).mask q)/n := by
  simp only [accumulatedPhaseUnitPrice,phaseUnitCoefficient,unitBirthRetention,mul_one,
    intervalIntegral.integral_const,sub_zero,smul_eq_mul,mul_div_assoc,Finset.sum_div]

theorem unitBirthRetention_schedule_price {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset (ℤ×ℤ)) (B K ρ : ℝ) (q : Grid n) :
    accumulatedPhaseUnitPrice (scheduleSharedPhases s mask hm Γ B K ρ) 0 (unitBirthRetention n) J q=
      s.cumulative (fun j=>mask j q) s.total/n := by
  rw [schedule_accumulated_unit_price s mask hm Γ B K ρ _ q (continuous_const)]
  simp only [unitBirthRetention,mul_one,intervalIntegral.integral_div]
  rfl

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_rootPhaseWitness_unit_retained
#print axioms NoThreeLine.BirthWitness.unitBirthRetention_accumulated_price
#print axioms NoThreeLine.BirthWitness.unitBirthRetention_schedule_price
