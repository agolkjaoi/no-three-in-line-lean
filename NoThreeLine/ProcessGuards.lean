import NoThreeLine.ClosedGuardHit

/-! The manuscript's upper weight/clock and lower line-credit guards are
closed subsets of the actual finite coordinate space. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine.AuxiliaryODE

def weightGuard {n : ℕ} (s : ProcessState n) (B : ℝ) : Set (Coordinates n) :=
  ⋃ p : Grid n, {z | (s.accounts p).status = .active ∧ B ≤ z.1 p}

def clockGuard {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (K : ℝ) : Set (Coordinates n) :=
  ⋃ L : LineIndex n, {z | specified Γ L ∧ occupancy s L ≤ 1 ∧ K ≤ z.2.1 L}

def lineCreditGuard {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (ρ : ℝ) : Set (Coordinates n) :=
  ⋃ L : LineIndex n, {z | ¬specified Γ L ∧ occupancy s L = 1 ∧ z.2.2 L ≤ ρ}

def processGuard {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ : ℝ) : Set (Coordinates n) :=
  weightGuard s B ∪ clockGuard s Γ K ∪ lineCreditGuard s Γ ρ

theorem weightGuard_closed {n : ℕ} (s : ProcessState n) (B : ℝ) : IsClosed (weightGuard s B) := by
  apply isClosed_iUnion_of_finite
  intro p
  by_cases hp : (s.accounts p).status = .active
  · simpa only [hp,true_and] using
      (isClosed_le continuous_const (by fun_prop : Continuous (fun z : Coordinates n => z.1 p)))
  · simp only [hp,false_and,setOf_false]
    exact isClosed_empty

theorem clockGuard_closed {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (K : ℝ) : IsClosed (clockGuard s Γ K) := by
  apply isClosed_iUnion_of_finite
  intro L
  by_cases hL : specified Γ L ∧ occupancy s L ≤ 1
  · simpa only [hL.1,hL.2,true_and] using
      (isClosed_le continuous_const (by fun_prop : Continuous (fun z : Coordinates n => z.2.1 L)))
  · have he : {z : Coordinates n | specified Γ L ∧ occupancy s L ≤ 1 ∧ K ≤ z.2.1 L} = ∅ := by
      ext z
      simp only [mem_setOf_eq,mem_empty_iff_false,iff_false]
      exact fun h => hL ⟨h.1,h.2.1⟩
    rw [he]
    exact isClosed_empty

theorem lineCreditGuard_closed {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (ρ : ℝ) : IsClosed (lineCreditGuard s Γ ρ) := by
  apply isClosed_iUnion_of_finite
  intro L
  by_cases hL : ¬specified Γ L ∧ occupancy s L = 1
  · have hc : IsClosed {z : Coordinates n | z.2.2 L ≤ ρ} :=
      isClosed_le (by fun_prop : Continuous (fun z : Coordinates n => z.2.2 L)) continuous_const
    simpa only [hL.1,hL.2,not_false_eq_true,true_and] using hc
  · have he : {z : Coordinates n | ¬specified Γ L ∧ occupancy s L = 1 ∧ z.2.2 L ≤ ρ} = ∅ := by
      ext z
      simp only [mem_setOf_eq,mem_empty_iff_false,iff_false]
      exact fun h => hL ⟨h.1,h.2.1⟩
    rw [he]
    exact isClosed_empty

theorem processGuard_closed {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ : ℝ) : IsClosed (processGuard s Γ B K ρ) :=
  ((weightGuard_closed s B).union (clockGuard_closed s Γ K)).union (lineCreditGuard_closed s Γ ρ)

theorem outside_processGuard {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ : ℝ) (z : Coordinates n) : z ∉ processGuard s Γ B K ρ ↔
      (∀ p, (s.accounts p).status = .active → z.1 p < B) ∧
      (∀ L, specified Γ L → occupancy s L ≤ 1 → z.2.1 L < K) ∧
      (∀ L, ¬specified Γ L → occupancy s L = 1 → ρ < z.2.2 L) := by
  simp only [processGuard,weightGuard,clockGuard,lineCreditGuard,mem_union,mem_iUnion,
    mem_setOf_eq,not_or,not_exists,not_and,not_le,and_assoc]

def boxedProcessGuard {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ C : ℝ) : Set (Coordinates n) := processGuard s Γ B K ρ ∪ {z | C ≤ ‖z‖}

theorem boxedProcessGuard_closed {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ C : ℝ) : IsClosed (boxedProcessGuard s Γ B K ρ C) :=
  (processGuard_closed s Γ B K ρ).union (isClosed_le continuous_const continuous_norm)

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.processGuard_closed
#print axioms NoThreeLine.AuxiliaryODE.outside_processGuard
