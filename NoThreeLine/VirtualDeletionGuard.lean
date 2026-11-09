import NoThreeLine.ModeFlowSelection

/-! The actual virtual deletion mass on a designated line: a hypothetical
external birth removes active leaves along non-designated occupied lines.
The reciprocal protection factor is polynomial in the clock coordinate. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators

namespace NoThreeLine.AuxiliaryODE

def normalizedLineWeight {n : ℕ} (s : ProcessState n) (z : Coordinates n)
    (L : LineIndex n) (p : Grid n) : ℝ :=
  z.1 p * (2-z.2.1 L) / (2-(occupancy s L : ℝ))

theorem normalizedLineWeight_eq {n : ℕ} (s : ProcessState n) (z : Coordinates n)
    (L : LineIndex n) (p : Grid n) :
    normalizedLineWeight s z L p = z.1 p / protection (occupancy s L) (z.2.1 L) := by
  rw [protection,div_div_eq_mul_div]
  rfl

def virtualLeaf {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (y q : Grid n) : Prop :=
  (s.accounts y).status = .active ∧ ¬specifiedPair Γ y q ∧ selectedWitness s.selected y q

instance {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint) (y q : Grid n) :
    Decidable (virtualLeaf s Γ y q) := Classical.propDecidable _

theorem virtualLeaf_iff_geometric_death {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (hs : s.Valid) (y q : Grid n)
    (hq : (s.accounts q).status = .active) (hyq : y ≠ q) :
    virtualLeaf s Γ y q ↔ (s.accounts y).status = .active ∧ ¬specifiedPair Γ y q ∧
      GeometricallyDead (insert q s.selected) y := by
  by_cases hy : (s.accounts y).status = .active
  · have hgeom := geometric_death_after_birth_iff s.selected y q (hs.2.1 y hy) (hs.2.1 q hq).1 hyq
    simp only [virtualLeaf,hgeom]
  · simp [virtualLeaf,hy]

def virtualMass {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (z : Coordinates n) (L : LineIndex n) (q : Grid n) : ℝ :=
  if s.stopped = false ∧ specified Γ L ∧ occupancy s L ≤ 1 ∧ q ∉ L.val ∧
      (s.accounts q).status = .active then
    ∑ y ∈ L.val, if virtualLeaf s Γ y q then normalizedLineWeight s z L y else 0
  else 0

theorem virtualMass_contDiff {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (L : LineIndex n) (q : Grid n) : ContDiff ℝ 1 (fun z => virtualMass s Γ z L q) := by
  unfold virtualMass
  split_ifs
  · apply ContDiff.sum
    intro y _
    split_ifs
    · unfold normalizedLineWeight
      fun_prop
    · exact contDiff_const
  · exact contDiff_const

theorem normalizedLineWeight_nonneg {n : ℕ} (s : ProcessState n) (z : Coordinates n)
    (L : LineIndex n) (p : Grid n) (hw : 0 ≤ z.1 p) (hk : z.2.1 L ≤ 2)
    (hN : occupancy s L ≤ 1) : 0 ≤ normalizedLineWeight s z L p := by
  have hNr : (occupancy s L : ℝ) ≤ 1 := by exact_mod_cast hN
  exact div_nonneg (mul_nonneg hw (sub_nonneg.mpr hk)) (by linarith)

theorem virtualMass_nonneg {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (z : Coordinates n) (L : LineIndex n) (q : Grid n)
    (hw : ∀ p, 0 ≤ z.1 p) (hk : z.2.1 L ≤ 2) : 0 ≤ virtualMass s Γ z L q := by
  unfold virtualMass
  split_ifs with h
  · apply Finset.sum_nonneg
    intro y _
    split_ifs
    · exact normalizedLineWeight_nonneg s z L y (hw y) hk h.2.2.1
    · exact le_rfl
  · exact le_rfl

theorem virtualMass_stopped {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (z : Coordinates n) (L : LineIndex n) (q : Grid n) (hs : s.stopped = true) :
    virtualMass s Γ z L q = 0 := by simp [virtualMass,hs]

theorem virtualMass_mode {n : ℕ} (e : ExtendedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (z : Coordinates n) (L : LineIndex n) (q : Grid n) :
    virtualMass (modeSkeleton e.mode) Γ z L q = virtualMass e.process Γ z L q := rfl

def virtualGuard {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (M : ℝ) : Set (Coordinates n) :=
  ⋃ L : LineIndex n, ⋃ q : Grid n, {z | M ≤ virtualMass s Γ z L q}

theorem virtualGuard_closed {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (M : ℝ) : IsClosed (virtualGuard s Γ M) := by
  apply isClosed_iUnion_of_finite
  intro L
  apply isClosed_iUnion_of_finite
  intro q
  exact isClosed_le continuous_const (virtualMass_contDiff s Γ L q).continuous

theorem outside_virtualGuard {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (M : ℝ) (z : Coordinates n) : z ∉ virtualGuard s Γ M ↔
      ∀ L q, virtualMass s Γ z L q < M := by
  simp only [virtualGuard,mem_iUnion,mem_setOf_eq,not_exists,not_le]

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.virtualLeaf_iff_geometric_death
#print axioms NoThreeLine.AuxiliaryODE.virtualMass_contDiff
#print axioms NoThreeLine.AuxiliaryODE.virtualMass_nonneg
#print axioms NoThreeLine.AuxiliaryODE.virtualGuard_closed
