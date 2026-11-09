import NoThreeLine.Target
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Push

/-!
Deterministic geometry of a finite sequence of attempted births. This module
does not identify this algorithm with the stopped stochastic process, assign
birth rates, establish saved-credit identities, or prove a size lower bound.
-/

set_option autoImplicit false

namespace NoThreeLine

theorem orientedArea_cycle {n : ℕ} (p q r : Grid n) :
    orientedArea p q r = orientedArea q r p := by
  unfold orientedArea
  ring

theorem orientedArea_swap_first {n : ℕ} (p q r : Grid n) :
    orientedArea p q r = -orientedArea q p r := by
  unfold orientedArea
  ring

theorem orientedArea_swap_last {n : ℕ} (p q r : Grid n) :
    orientedArea p q r = -orientedArea p r q := by
  unfold orientedArea
  ring

theorem NoThree.mono {n : ℕ} {s t : Finset (Grid n)}
    (ht : NoThree t) (hst : s ⊆ t) : NoThree s := by
  intro p hp q hq r hr hpq hpr hqr
  exact ht p (hst hp) q (hst hq) r (hst hr) hpq hpr hqr

theorem noThree_empty (n : ℕ) : NoThree (∅ : Finset (Grid n)) := by
  simp [NoThree]

/-- A new point is admissible exactly when no existing pair blocks it. -/
def SafeCandidate {n : ℕ} (s : Finset (Grid n)) (v : Grid n) : Prop :=
  v ∉ s ∧ ∀ p ∈ s, ∀ q ∈ s, p ≠ q → orientedArea p q v ≠ 0

instance {n : ℕ} (s : Finset (Grid n)) (v : Grid n) :
    Decidable (SafeCandidate s v) := inferInstanceAs
  (Decidable (v ∉ s ∧ ∀ p ∈ s, ∀ q ∈ s, p ≠ q → orientedArea p q v ≠ 0))

/-- A rejected or already selected point leaves the finite set unchanged. -/
def safeInsert {n : ℕ} (s : Finset (Grid n)) (v : Grid n) : Finset (Grid n) :=
  if SafeCandidate s v then insert v s else s

theorem noThree_insert_of_pair_test {n : ℕ} (s : Finset (Grid n)) (v : Grid n)
    (hs : NoThree s)
    (hpairs : ∀ p ∈ s, ∀ q ∈ s, p ≠ q → orientedArea p q v ≠ 0) :
    NoThree (insert v s) := by
  intro p hp q hq r hr hpq hpr hqr
  simp only [Finset.mem_insert] at hp hq hr
  rcases hp with rfl | hp
  · rcases hq with rfl | hq
    · exact (hpq rfl).elim
    · rcases hr with rfl | hr
      · exact (hpr rfl).elim
      · rw [orientedArea_cycle]
        exact hpairs q hq r hr hqr
  · rcases hq with rfl | hq
    · rcases hr with rfl | hr
      · exact (hqr rfl).elim
      · rw [orientedArea_swap_last]
        exact neg_ne_zero.mpr (hpairs p hp r hr hpr)
    · rcases hr with rfl | hr
      · exact hpairs p hp q hq hpq
      · exact hs p hp q hq r hr hpq hpr hqr

theorem noThree_insert_iff {n : ℕ} (s : Finset (Grid n)) (v : Grid n)
    (hv : v ∉ s) :
    NoThree (insert v s) ↔
      NoThree s ∧ ∀ p ∈ s, ∀ q ∈ s, p ≠ q → orientedArea p q v ≠ 0 := by
  constructor
  · intro h
    refine ⟨h.mono (Finset.subset_insert _ _), ?_⟩
    intro p hp q hq hpq
    have hpv : p ≠ v := by
      intro heq
      subst p
      exact hv hp
    have hqv : q ≠ v := by
      intro heq
      subst q
      exact hv hq
    exact h p (Finset.mem_insert_of_mem hp) q (Finset.mem_insert_of_mem hq)
      v (Finset.mem_insert_self _ _) hpq hpv hqv
  · rintro ⟨hs, hpairs⟩
    exact noThree_insert_of_pair_test s v hs hpairs

theorem safeInsert_noThree {n : ℕ} (s : Finset (Grid n)) (v : Grid n)
    (hs : NoThree s) : NoThree (safeInsert s v) := by
  unfold safeInsert
  split_ifs with h
  · exact noThree_insert_of_pair_test s v hs h.2
  · exact hs

/-- Geometric death refers to an existing, distinct collinear pair. A selected
candidate is handled separately by the membership test in SafeCandidate. -/
def GeometricallyDead {n : ℕ} (s : Finset (Grid n)) (v : Grid n) : Prop :=
  ∃ p ∈ s, ∃ q ∈ s, p ≠ q ∧ orientedArea p q v = 0

instance {n : ℕ} (s : Finset (Grid n)) (v : Grid n) :
    Decidable (GeometricallyDead s v) := inferInstanceAs
  (Decidable (∃ p ∈ s, ∃ q ∈ s, p ≠ q ∧ orientedArea p q v = 0))

theorem not_geometricallyDead_iff {n : ℕ} (s : Finset (Grid n)) (v : Grid n) :
    ¬GeometricallyDead s v ↔
      ∀ p ∈ s, ∀ q ∈ s, p ≠ q → orientedArea p q v ≠ 0 := by
  simp [GeometricallyDead]

theorem safeCandidate_iff_not_dead {n : ℕ} (s : Finset (Grid n)) (v : Grid n) :
    SafeCandidate s v ↔ v ∉ s ∧ ¬GeometricallyDead s v := by
  rw [not_geometricallyDead_iff]
  rfl

theorem geometricallyDead_iff_insert_not_noThree {n : ℕ}
    (s : Finset (Grid n)) (v : Grid n) (hs : NoThree s) (hv : v ∉ s) :
    GeometricallyDead s v ↔ ¬NoThree (insert v s) := by
  constructor
  · intro hd hi
    exact ((not_geometricallyDead_iff s v).mpr ((noThree_insert_iff s v hv).mp hi).2) hd
  · intro hn
    by_contra hd
    exact hn (noThree_insert_of_pair_test s v hs ((not_geometricallyDead_iff s v).mp hd))

/-- This finite deterministic update does not claim to construct the law of
the continuous-time process. -/
def processBirths {n : ℕ} (s : Finset (Grid n)) (births : List (Grid n)) :
    Finset (Grid n) := births.foldl safeInsert s

theorem processBirths_noThree {n : ℕ} (s : Finset (Grid n))
    (births : List (Grid n)) (hs : NoThree s) : NoThree (processBirths s births) := by
  induction births generalizing s with
  | nil => exact hs
  | cons v births ih =>
      exact ih (safeInsert s v) (safeInsert_noThree s v hs)

theorem processBirths_empty_noThree {n : ℕ} (births : List (Grid n)) :
    NoThree (processBirths ∅ births) := processBirths_noThree ∅ births (noThree_empty n)

/-- The height-four collinear triple used by the frozen process fixtures is
rejected at its third attempted birth, independently of a choice of Γ. -/
theorem height_four_example :
    processBirths (∅ : Finset (Grid 9)) [(0,0), (4,1), (8,2)] = {(0,0), (4,1)} := by
  norm_num [processBirths, List.foldl, safeInsert, SafeCandidate, orientedArea]
  decide

theorem noncollinear_example :
    processBirths (∅ : Finset (Grid 9)) [(0,0), (4,1), (8,3)] =
      {(8,3), (4,1), (0,0)} := by
  norm_num [processBirths, List.foldl, safeInsert, SafeCandidate, orientedArea]
  decide

end NoThreeLine

#print axioms NoThreeLine.noThree_insert_iff
#print axioms NoThreeLine.safeInsert_noThree
#print axioms NoThreeLine.geometricallyDead_iff_insert_not_noThree
#print axioms NoThreeLine.processBirths_empty_noThree
#print axioms NoThreeLine.height_four_example
