import NoThreeLine.SelectedLineRegularity

/-! Measurable positive excess of the actual active-root, selected-witness
line mass. The witness gate is retained in the observable. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def selectedLineExcess {n : ℕ} (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n)
    (a : WitnessState n) : ℝ :=
  selectedLineGate p z a*max (boardLineMass mask L p a-∑q∈lineLeafSites L p z,mask q) 0

theorem selectedLineExcess_measurable {n : ℕ} (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) :
    Measurable (selectedLineExcess mask L p z) :=
  (selectedLineGate_measurable p z).mul
    (((boardLineMass_measurable mask L p).sub measurable_const).max measurable_const)

theorem selectedLineExcess_bounds {n : ℕ} (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1)
    (L : LineIndex n) (p z : Grid n) (a : WitnessState n) (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    0≤selectedLineExcess mask L p z a ∧ selectedLineExcess mask L p z a≤B*(L.val.card:ℝ) := by
  have hg := selectedLineGate_bounds p z a
  have hH := boardLineMass_bounds mask hm L p a B hB ha
  have hD : 0≤∑q∈lineLeafSites L p z,mask q := Finset.sum_nonneg (fun q _=>(hm q).1)
  have hx : max (boardLineMass mask L p a-∑q∈lineLeafSites L p z,mask q) 0≤boardLineMass mask L p a :=
    max_le (sub_le_self _ hD) hH.1
  exact ⟨mul_nonneg hg.1 (le_max_right _ _),
    (mul_le_of_le_one_left (le_max_right _ _) hg.2).trans (hx.trans hH.2)⟩

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.selectedLineExcess_measurable
#print axioms NoThreeLine.BirthWitness.selectedLineExcess_bounds
