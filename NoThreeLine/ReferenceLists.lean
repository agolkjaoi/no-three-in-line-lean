import NoThreeLine.FrozenReferenceTables
import NoThreeLine.FiniteInputTree

/-! Ordered concatenation of separately checked reference lookups.
No lookup is discarded, and the second interval starts after the first. -/
set_option autoImplicit false
namespace NoThreeLine.FrozenReference

def PhaseMatchesAt {G L : ℕ} (a : CheckedAcceptedPhase G L) (j : ℕ) : Prop :=
  ∃ h : j < 15348, PhaseMatches a ⟨j,h⟩

def MatchesFrom {G L : ℕ} (start : ℕ) (a : List (CheckedAcceptedPhase G L)) : Prop :=
  ∀ i : Fin a.length, PhaseMatchesAt (a.get i) (start+i.val)

theorem MatchesFrom.append {G L : ℕ} (start : ℕ)
    (a b : List (CheckedAcceptedPhase G L)) (ha : MatchesFrom start a)
    (hb : MatchesFrom (start+a.length) b) : MatchesFrom start (a++b) := by
  intro i
  by_cases hi : i.val < a.length
  · have he : (a++b).get i = a.get ⟨i.val,hi⟩ := by
      exact List.getElem_append_left hi
    rw [he]
    exact ha ⟨i.val,hi⟩
  · have hj : i.val-a.length < b.length := by
      have := i.isLt
      simp only [List.length_append] at this
      omega
    have he : (a++b).get i = b.get ⟨i.val-a.length,hj⟩ := by
      exact List.getElem_append_right (Nat.le_of_not_gt hi)
    rw [he]
    have h := hb ⟨i.val-a.length,hj⟩
    have heq : start+a.length+(i.val-a.length) = start+i.val := by omega
    simpa only [heq] using h

theorem matchesFrom_ofFn {G L N : ℕ} (start : ℕ) (a : Fin N → CheckedAcceptedPhase G L)
    (h : ∀ i, PhaseMatchesAt (a i) (start+i.val)) : MatchesFrom start (List.ofFn a) := by
  intro i
  have hi : i.val < N := by simpa using i.isLt
  simpa only [List.get_eq_getElem, List.getElem_ofFn] using h ⟨i.val,hi⟩

theorem matchesFrom_tree {G L N : ℕ} (start : ℕ) (a : FiniteInputTree (CheckedAcceptedPhase G L) N)
    (h : ∀ i, PhaseMatchesAt (a.get i) (start+i.val)) : MatchesFrom start a.toList := by
  rw [← FiniteInputTree.ofFn_get]
  exact matchesFrom_ofFn start a.get h

theorem MatchesFrom.zero_matches {G L : ℕ} (a : List (CheckedAcceptedPhase G L))
    (ha : MatchesFrom 0 a) (bound : a.length ≤ 15348) (i : Fin a.length) :
    PhaseMatches (a.get i) ⟨i.val,lt_of_lt_of_le i.isLt bound⟩ := by
  obtain ⟨hi,h⟩ := ha i
  simpa only [Nat.zero_add] using h

end NoThreeLine.FrozenReference

#print axioms NoThreeLine.FrozenReference.MatchesFrom.append
