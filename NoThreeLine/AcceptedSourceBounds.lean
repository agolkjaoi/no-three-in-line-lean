import NoThreeLine.AcceptedCommonGrid

/-! A structural list checker supplies the remaining scalar source bounds.
It does not inspect or assume a geometric or probabilistic conclusion. -/
set_option autoImplicit false
namespace NoThreeLine

def CheckedAcceptedPhase.sourceBoundsBool {G L : ℕ} (a : CheckedAcceptedPhase G L) : Bool :=
  decide (a.phase.sx < 128 ∧ a.phase.sy < 128)

theorem checkedSourceBounds_of_list {G L : ℕ} (a : List (CheckedAcceptedPhase G L))
    (hc : a.all CheckedAcceptedPhase.sourceBoundsBool = true) (i : Fin a.length) :
    (a.get i).phase.sx < 128 ∧ (a.get i).phase.sy < 128 := by
  have h := List.all_eq_true.mp hc (a.get i) (List.get_mem a i)
  exact of_decide_eq_true h

end NoThreeLine

#print axioms NoThreeLine.checkedSourceBounds_of_list
