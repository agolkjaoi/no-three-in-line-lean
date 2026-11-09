import NoThreeLine.ShortStarCounts
import NoThreeLine.LongNeighborCount

/-! Actual ordered short-star pairs whose two leaves have a long connecting
line. The second witness is counted through its actual short-star fibre. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines FiniteDirections

def LongLeafPair {n : ℕ} (R : ℝ) (s t : Grid n×Grid n) : Prop :=
  t.1≠s.1 ∧ R<((lineThrough s.1 t.1).card : ℝ)

def longLeafPartners {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) (s : Grid n×Grid n) :
    Finset (Grid n×Grid n) := leafOn Γ p H (longNeighbors s.1 R)

def longLeafPairs {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) :
    Finset ((Grid n×Grid n)×(Grid n×Grid n)) := by
  classical
  exact ((shortStars Γ p H).product (shortStars Γ p H)).filter (fun st => LongLeafPair R st.1 st.2)

def distinctLineLongLeafPairs {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) :
    Finset ((Grid n×Grid n)×(Grid n×Grid n)) := by
  classical
  exact (longLeafPairs Γ p H R).filter (fun st => lineThrough p st.1.1≠lineThrough p st.2.1)

@[simp] theorem mem_longLeafPartners {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (s t : Grid n×Grid n) :
    t∈longLeafPartners Γ p H R s ↔ t∈shortStars Γ p H ∧ LongLeafPair R s t := by
  simp [longLeafPartners,leafOn,longNeighbors,LongLeafPair]

@[simp] theorem mem_longLeafPairs {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (s t : Grid n×Grid n) :
    (s,t)∈longLeafPairs Γ p H R ↔
      s∈shortStars Γ p H ∧ t∈shortStars Γ p H ∧ LongLeafPair R s t := by
  simp [longLeafPairs,and_assoc]

theorem longLeafPartners_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (hH : 0≤H) (hR : 0<R) (s : Grid n×Grid n) :
    ((longLeafPartners Γ p H R s).card : ℝ)≤16*H*(n : ℝ)^2/R := by
  calc
    _ = ∑q∈longNeighbors s.1 R,((witnesses Γ p H q).card : ℝ) := leafOn_card_eq_sum Γ p H _
    _ ≤ ∑q∈longNeighbors s.1 R,H := Finset.sum_le_sum (fun q _ => witnesses_card_le_threshold Γ p H hH q)
    _ = ((longNeighbors s.1 R).card : ℝ)*H := by simp only [Finset.sum_const,nsmul_eq_mul]
    _ ≤ (16*(n : ℝ)^2/R)*H := mul_le_mul_of_nonneg_right (longNeighbors_card_le s.1 R hR) hH
    _ = _ := by ring

theorem longLeafPairs_card_eq_sum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) :
    ((longLeafPairs Γ p H R).card : ℝ)=
      ∑s∈shortStars Γ p H,((longLeafPartners Γ p H R s).card : ℝ) := by
  classical
  calc
    _ = ∑st∈(shortStars Γ p H).product (shortStars Γ p H),
        if LongLeafPair R st.1 st.2 then (1 : ℝ) else 0 := by simp [longLeafPairs]
    _ = ∑s∈shortStars Γ p H,∑t∈shortStars Γ p H,
        if LongLeafPair R s t then (1 : ℝ) else 0 := Finset.sum_product _ _ _
    _ = _ := by
      apply Finset.sum_congr rfl
      intro s _
      have he : (shortStars Γ p H).filter (LongLeafPair R s)=longLeafPartners Γ p H R s := by
        ext t
        simp only [Finset.mem_filter,mem_longLeafPartners]
      rw [←Finset.sum_filter,he]
      simp

theorem longLeafPairs_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (hH : 0≤H) (hR : 0<R) :
    ((longLeafPairs Γ p H R).card : ℝ)≤
      ((shortStars Γ p H).card : ℝ)*(16*H*(n : ℝ)^2/R) := by
  rw [longLeafPairs_card_eq_sum]
  exact (Finset.sum_le_sum (fun s _ => longLeafPartners_card_le Γ p H R hH hR s)).trans_eq
    (by simp only [Finset.sum_const,nsmul_eq_mul])

theorem distinctLineLongLeafPairs_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (hH : 0≤H) (hR : 0<R) :
    ((distinctLineLongLeafPairs Γ p H R).card : ℝ)≤
      ((shortStars Γ p H).card : ℝ)*(16*H*(n : ℝ)^2/R) := by
  have hs : (distinctLineLongLeafPairs Γ p H R).card≤(longLeafPairs Γ p H R).card := Finset.card_filter_le _ _
  exact (show ((distinctLineLongLeafPairs Γ p H R).card : ℝ)≤(longLeafPairs Γ p H R).card by
    exact_mod_cast hs).trans (longLeafPairs_card_le Γ p H R hH hR)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.longLeafPartners_card_le
#print axioms NoThreeLine.ShortStars.longLeafPairs_card_le
#print axioms NoThreeLine.ShortStars.distinctLineLongLeafPairs_card_le
