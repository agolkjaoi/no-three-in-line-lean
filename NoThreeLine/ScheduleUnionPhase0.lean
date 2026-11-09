import NoThreeLine.GridUnionCertificate

/-! Explicit integer-coordinate frozen phase 0 union fixture.
The normalization and actual integral are kernel checked. Leaf/orbit decoding
and all-phase order/prefix bindings remain separate input-bridge obligations. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory

namespace NoThreeLine.ScheduleUnionPhase0

def rawData : Array GridBox := #[
  ⟨16128,16384,16384,16640⟩,
  ⟨16384,16640,16128,16384⟩,
  ⟨16384,16640,16128,16384⟩,
  ⟨16128,16384,16384,16640⟩]
def outputData : Array GridBox := #[
  ⟨16128,16384,16384,16640⟩,
  ⟨16384,16640,16128,16384⟩]
def raw (i : Fin 4) : GridBox := rawData.getD i.val ⟨0,0,0,0⟩
def output (i : Fin 2) : GridBox := outputData.getD i.val ⟨0,0,0,0⟩
def coverData : Array ℕ := #[0,1,1,0]
def sourceData : Array ℕ := #[0,1]
def cover (i : Fin 4) : Fin 2 :=
  ⟨coverData.getD i.val 0 % 2,Nat.mod_lt _ (by decide)⟩
def source (j : Fin 2) : Fin 4 :=
  ⟨sourceData.getD j.val 0 % 4,Nat.mod_lt _ (by decide)⟩

theorem union_checked : gridUnionCheck 32768 raw output cover source = true := by
  unfold gridUnionCheck
  apply decide_eq_true_eq.mpr
  refine ⟨?_,?_,?_,?_⟩
  all_goals decide +kernel

theorem area_units_checked : gridUnionAreaUnits output = 131072 := by decide +kernel

theorem actual_union_area :
    (∫ z : ℝ × ℝ, rectangleUnionMask Finset.univ (fun i => ((raw i).qrect 32768).real)
      (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) = (1/8192 : ℝ) := by
  rw [gridUnionCheck_area 32768 (by decide) raw output cover source union_checked,area_units_checked]
  norm_num

end NoThreeLine.ScheduleUnionPhase0

#print axioms NoThreeLine.ScheduleUnionPhase0.union_checked
#print axioms NoThreeLine.ScheduleUnionPhase0.actual_union_area
