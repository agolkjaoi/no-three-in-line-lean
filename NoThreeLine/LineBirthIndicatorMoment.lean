import NoThreeLine.LineLeafSetMoment
import NoThreeLine.UnitBirthWitness

/-! Actual saved selected-witness indicator and physical line-leaf moment.
The source is the original integrated phase input divided by n. All state and
clock factors come from one common saved snapshot. Calendar-time transport
and the continuous C14/C15 integral statements remain separate. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

def selectedLineLeafPower {n : ℕ} (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n)
    (k : ℕ) (a : WitnessState n) : ℝ :=
  if p∈a.augmented.physical.process.activeEvents ∧ z∈a.augmented.physical.process.selected then
    (a.augmented.physical.lineCredits L*∑q∈L.val.erase p,mask q*activeLeafWeight q a)^k else 0

theorem initial_rootPhaseWitness_selectedLine_eq {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p z : Grid n) (hn : 0<n) (hB : 1≤B)
    (N k : ℕ) (ω : BoardClockPath n) (mask : Grid n→ℝ) (L : LineIndex n) :
    selectedLineLeafPower mask L p z k
      (initialRootPhaseWitness cs ε M deadline start p hn hB (unitBirthRetention n) N ω)=
    boardLineLeafPower mask L p z k
      (initialRootPhaseWitness cs ε M deadline start p hn hB (unitBirthRetention n) N ω) := by
  rw [boardLineLeafPower,initial_rootPhaseWitness_unit_retained]
  unfold selectedLineLeafPower
  by_cases hp : p∈(initialRootPhaseWitness cs ε M deadline start p hn hB (unitBirthRetention n) N ω).augmented.physical.process.activeEvents
  · simp only [hp,true_and,if_true]
    split_ifs <;> simp
  · simp only [hp,false_and,if_false]

theorem initial_rootPhasePoint_selectedLineLeafPower_bound {n : ℕ} {B : ℝ}
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p∈L.val) (hzL : z∈L.val) (hpz : p≠z)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k N : ℕ) (hBL : B≤(L.val.card:ℝ)) :
    (∫ω,selectedLineLeafPower mask L p z k
      (initialRootPhaseWitness cs ε M deadline start p hn hB (unitBirthRetention n) N ω)
      ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      (((∑j∈Finset.range N,(cs j).horizon*(cs j).mask z)/n)/(1-ε)^(k+2).choose 2)*
        ((∑q∈lineLeafSites L p z,mask q)^k+physicalRepeatErrorConstant k*B*(L.val.card:ℝ)^(k-1)) := by
  have hh := initial_rootPhasePoint_boardLineLeafPower_bound mask hm L p z Γ hL hpL hzL hpz
    cs ε M deadline start hn hB (unitBirthRetention n) hΓ hK hε0 hε k N hBL
  simp_rw [initial_rootPhaseWitness_selectedLine_eq]
  simpa only [unitBirthRetention_accumulated_price] using hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_rootPhaseWitness_selectedLine_eq
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_selectedLineLeafPower_bound
