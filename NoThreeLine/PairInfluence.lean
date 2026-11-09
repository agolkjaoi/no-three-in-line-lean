import NoThreeLine.ClockInvariants

/-! The manuscript's actual off-baseline common-change rate for a pair of
active roots. The rate is derived from the actual birth multipliers and
finite board rates, rather than introduced as an abstract moment input. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators

namespace NoThreeLine.AuxiliaryODE

def commonChange {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (S : Finset (Grid n))
    (a b q : Grid n) : Prop :=
  orientedArea a b q ≠ 0 ∧ birthMultiplier Γ S a q < 1 ∧ birthMultiplier Γ S b q < 1

instance {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (S : Finset (Grid n)) (a b q : Grid n) :
    Decidable (commonChange Γ S a b q) := Classical.propDecidable _

def pairRate {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (a b : Grid n) : ℝ :=
  if (s.accounts a).status = .active ∧ (s.accounts b).status = .active then
    ∑ q : Grid n, if commonChange Γ s.selected a b q then phaseRate s mask z.1 q else 0
  else 0

theorem pairRate_at_state {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (k r : LineIndex n → ℝ) (a b : Grid n) :
    pairRate s Γ mask ((fun p => (s.accounts p).weight),(k,r)) a b =
      if (s.accounts a).status = .active ∧ (s.accounts b).status = .active then
        ∑ q : Grid n, if commonChange Γ s.selected a b q then s.birthRate mask q else 0
      else 0 := rfl

theorem commonChange_symm {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (S : Finset (Grid n))
    (a b q : Grid n) : commonChange Γ S a b q ↔ commonChange Γ S b a q := by
  unfold commonChange
  rw [orientedArea_swap_first]
  simp only [neg_ne_zero]
  tauto

theorem pairRate_symm {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (a b : Grid n) :
    pairRate s Γ mask z a b = pairRate s Γ mask z b a := by
  simp only [pairRate,commonChange_symm Γ s.selected a b,and_comm]

theorem pairRate_inactive_left {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (a b : Grid n)
    (ha : (s.accounts a).status ≠ .active) : pairRate s Γ mask z a b = 0 := by
  simp [pairRate,ha]

theorem pairRate_stopped {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (a b : Grid n) (hs : s.stopped = true) :
    pairRate s Γ mask z a b = 0 := by
  simp [pairRate,phaseRate,hs]

theorem phaseRate_nonneg {n : ℕ} (s : ProcessState n) (mask w : Grid n → ℝ)
    (hm : ∀ p, 0 ≤ mask p) (hw : ∀ p, 0 ≤ w p) (q : Grid n) :
    0 ≤ phaseRate s mask w q := by
  unfold phaseRate
  split_ifs
  · exact div_nonneg (mul_nonneg (hm q) (hw q)) (Nat.cast_nonneg n)
  · exact le_rfl

theorem pairRate_nonneg {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (hm : ∀ p, 0 ≤ mask p)
    (hw : ∀ p, 0 ≤ z.1 p) (a b : Grid n) : 0 ≤ pairRate s Γ mask z a b := by
  unfold pairRate
  split_ifs
  · apply Finset.sum_nonneg
    intro q _
    split_ifs
    · exact phaseRate_nonneg s mask z.1 hm hw q
    · exact le_rfl
  · exact le_rfl

theorem pairRate_le_total {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (hm : ∀ p, 0 ≤ mask p)
    (hw : ∀ p, 0 ≤ z.1 p) (a b : Grid n) :
    pairRate s Γ mask z a b ≤ ∑ q : Grid n, phaseRate s mask z.1 q := by
  unfold pairRate
  split_ifs
  · apply Finset.sum_le_sum
    intro q _
    split_ifs
    · exact le_rfl
    · exact phaseRate_nonneg s mask z.1 hm hw q
  · exact Finset.sum_nonneg (fun q _ => phaseRate_nonneg s mask z.1 hm hw q)

theorem pairRate_contDiff {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (a b : Grid n) :
    ContDiff ℝ 1 (fun z : Coordinates n => pairRate s Γ mask z a b) := by
  unfold pairRate
  split_ifs
  · apply ContDiff.sum
    intro q _
    split_ifs
    · exact phaseRate_contDiff s mask q
    · exact contDiff_const
  · exact contDiff_const

abbrev EtaCoordinates (n : ℕ) := Grid n → Grid n → ℝ
abbrev EtaSystemCoordinates (n : ℕ) := Coordinates n × EtaCoordinates n

def etaRHS {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (η : EtaCoordinates n) (a b : Grid n) : ℝ :=
  η a b * (-pairRate s Γ mask z a b)

def etaSystemField {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : EtaSystemCoordinates n) : EtaSystemCoordinates n :=
  (vectorField s Γ mask z.1,etaRHS s Γ mask z.1 z.2)

theorem etaSystemField_contDiff {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) : ContDiff ℝ 1 (etaSystemField s Γ mask) := by
  apply ContDiff.prodMk
  · exact (vectorField_contDiff s Γ mask).comp contDiff_fst
  · apply contDiff_pi.mpr
    intro a
    apply contDiff_pi.mpr
    intro b
    have hp : ContDiff ℝ 1 (fun z : EtaSystemCoordinates n => z.2 a b) := by fun_prop
    exact hp.mul
      (((pairRate_contDiff s Γ mask a b).comp contDiff_fst).neg)

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.pairRate_at_state
#print axioms NoThreeLine.AuxiliaryODE.pairRate_symm
#print axioms NoThreeLine.AuxiliaryODE.pairRate_le_total
#print axioms NoThreeLine.AuxiliaryODE.etaSystemField_contDiff
