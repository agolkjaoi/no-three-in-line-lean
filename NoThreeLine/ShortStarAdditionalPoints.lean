import NoThreeLine.ShortStarWitnessTriples

/-! C18(iii): additional board-point candidates on a bounded connecting
leaf line. This is a static count; no birth price or time law is asserted. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines

def shortLeafPairs {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) :
    Finset ((Grid n×Grid n)×(Grid n×Grid n)) := by
  classical
  exact (distinctRootPairs Γ p H).filter (fun st => ((lineThrough st.1.1 st.2.1).card : ℝ)≤R)

def extraPointTriples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) :
    Finset (((Grid n×Grid n)×(Grid n×Grid n))×Grid n) := by
  classical
  exact ((shortLeafPairs Γ p H R).product Finset.univ).filter
    (fun stv => stv.2∈lineThrough stv.1.1.1 stv.1.2.1)

def freshExtraPointTriples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) :
    Finset (((Grid n×Grid n)×(Grid n×Grid n))×Grid n) := by
  classical
  exact (extraPointTriples Γ p H R).filter (fun stv =>
    stv.2≠p ∧ stv.2≠stv.1.1.1 ∧ stv.2≠stv.1.2.1 ∧ stv.2≠stv.1.1.2 ∧ stv.2≠stv.1.2.2)

@[simp] theorem mem_extraPointTriples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (s t : Grid n×Grid n) (v : Grid n) :
    ((s,t),v)∈extraPointTriples Γ p H R ↔
      (s,t)∈distinctRootPairs Γ p H ∧ ((lineThrough s.1 t.1).card : ℝ)≤R ∧ v∈lineThrough s.1 t.1 := by
  simp [extraPointTriples,shortLeafPairs,and_assoc]

theorem extraPointTriples_card_eq_sum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) :
    ((extraPointTriples Γ p H R).card : ℝ)=
      ∑st∈shortLeafPairs Γ p H R,((lineThrough st.1.1 st.2.1).card : ℝ) := by
  classical
  calc
    _ = ∑stv∈(shortLeafPairs Γ p H R).product (Finset.univ : Finset (Grid n)),
        if stv.2∈lineThrough stv.1.1.1 stv.1.2.1 then (1 : ℝ) else 0 := by simp [extraPointTriples]
    _ = ∑st∈shortLeafPairs Γ p H R,∑v : Grid n,
        if v∈lineThrough st.1.1 st.2.1 then (1 : ℝ) else 0 := Finset.sum_product _ _ _
    _ = _ := by simp

theorem extraPointTriples_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (hR : 0≤R) :
    ((extraPointTriples Γ p H R).card : ℝ)≤((shortStars Γ p H).card : ℝ)^2*R := by
  classical
  have hc : ((shortLeafPairs Γ p H R).card : ℝ)≤((distinctRootPairs Γ p H).card : ℝ) := by
    exact_mod_cast (Finset.card_filter_le (distinctRootPairs Γ p H)
      (fun st => ((lineThrough st.1.1 st.2.1).card : ℝ)≤R))
  rw [extraPointTriples_card_eq_sum]
  calc
    _ ≤ ∑st∈shortLeafPairs Γ p H R,R := Finset.sum_le_sum (fun st hst => (Finset.mem_filter.mp hst).2)
    _ = ((shortLeafPairs Γ p H R).card : ℝ)*R := by simp only [Finset.sum_const,nsmul_eq_mul]
    _ ≤ ((shortStars Γ p H).card : ℝ)^2*R :=
      mul_le_mul_of_nonneg_right (hc.trans (distinctRootPairs_card_le_square Γ p H)) hR

theorem freshExtraPointTriples_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (hR : 0≤R) :
    ((freshExtraPointTriples Γ p H R).card : ℝ)≤((shortStars Γ p H).card : ℝ)^2*R := by
  have hc : (freshExtraPointTriples Γ p H R).card≤(extraPointTriples Γ p H R).card := Finset.card_filter_le _ _
  exact (show ((freshExtraPointTriples Γ p H R).card : ℝ)≤(extraPointTriples Γ p H R).card by
    exact_mod_cast hc).trans (extraPointTriples_card_le Γ p H R hR)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.extraPointTriples_card_le
#print axioms NoThreeLine.ShortStars.freshExtraPointTriples_card_le
