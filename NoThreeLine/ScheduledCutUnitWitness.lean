import NoThreeLine.UnitBirthWitness
import NoThreeLine.ScheduledCutObservation

/-! Unit retention at the actual inherited scheduled cut is the selected
indicator in that same non-frozen state. Its elapsed source price keeps the
old phase contributions and the current partial phase exactly once. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness

theorem observedWitness_unit_retained {n : ℕ} (cfg : FlowConfig n) (s : TimedObservation cfg)
    (hs : RecordsConsistent cfg s) (q : Grid n) :
    (observedWitness cfg (unitBirthRetention n) s).retained q=
      if q∈s.1.val.1.physical.process.selected then 1 else 0 := by
  simp only [observedWitness,recordedValue,unitBirthRetention,hs q]

theorem scheduledCutWitness_unit_retained {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (s : GoodPhaseObservation n B) (k : ℕ) (x : BoardClockPath n×ℝ) (q : Grid n) :
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn s k x).retained q=
      if q∈(scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn s k x).augmented.physical.process.selected
      then 1 else 0 := by
  apply observedWitness_unit_retained
  exact sourceCutTerminal_consistent (cs k).config ε M _ _ _ hn _ _

theorem scheduled_unitBirth_price {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (k : ℕ) (t : ℝ) (q : Grid n) :
    accumulatedPhaseUnitPrice cs start (unitBirthRetention n) k q+
      (∫u in (0:ℝ)..t,phaseUnitCoefficient (cs k).config (phaseEndpoint cs start k) (unitBirthRetention n) q u)=
      ((∑j∈Finset.range k,(cs j).horizon*(cs j).mask q)+t*(cs k).mask q)/n := by
  rw [unitBirthRetention_accumulated_price]
  simp only [phaseUnitCoefficient,unitBirthRetention,mul_one,intervalIntegral.integral_const,
    sub_zero,smul_eq_mul]
  ring

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledCutWitness_unit_retained
#print axioms NoThreeLine.BirthWitness.scheduled_unitBirth_price
