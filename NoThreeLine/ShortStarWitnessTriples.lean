import NoThreeLine.ShortStarTransverse

/-! C18(iv): ordered triples with the third witness on the connecting line
of two leaves from different root lines. All stars are actual short stars. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines

def distinctRootPairs {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    Finset ((Grid n×Grid n)×(Grid n×Grid n)) := by
  classical
  exact ((shortStars Γ p H).product (shortStars Γ p H)).filter
    (fun st => lineThrough p st.1.1≠lineThrough p st.2.1)

def witnessTriples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    Finset (((Grid n×Grid n)×(Grid n×Grid n))×(Grid n×Grid n)) := by
  classical
  exact ((distinctRootPairs Γ p H).product (shortStars Γ p H)).filter
    (fun stu => stu.2.2∈lineThrough stu.1.1.1 stu.1.2.1)

def freshWitnessTriples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    Finset (((Grid n×Grid n)×(Grid n×Grid n))×(Grid n×Grid n)) := by
  classical
  exact (witnessTriples Γ p H).filter
    (fun stu => stu.2.2≠stu.1.1.2 ∧ stu.2.2≠stu.1.2.2 ∧ stu.2≠stu.1.1 ∧ stu.2≠stu.1.2)

@[simp] theorem mem_distinctRootPairs {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (s t : Grid n×Grid n) :
    (s,t)∈distinctRootPairs Γ p H ↔ s∈shortStars Γ p H ∧ t∈shortStars Γ p H ∧
      lineThrough p s.1≠lineThrough p t.1 := by simp [distinctRootPairs,and_assoc]

@[simp] theorem mem_witnessTriples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (s t u : Grid n×Grid n) :
    ((s,t),u)∈witnessTriples Γ p H ↔ (s,t)∈distinctRootPairs Γ p H ∧
      u∈thirdWitnessPartners Γ p H s t := by
  simp [witnessTriples,thirdWitnessPartners,witnessOn,and_assoc]

theorem freshWitnessTriples_eq {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    freshWitnessTriples Γ p H=witnessTriples Γ p H := by
  classical
  apply Finset.filter_eq_self.mpr
  intro stu h
  have hm := (mem_witnessTriples Γ p H stu.1.1 stu.1.2 stu.2).mp h
  have hp := (mem_distinctRootPairs Γ p H stu.1.1 stu.1.2).mp hm.1
  exact thirdWitnessPartners_fresh Γ p H stu.1.1 stu.1.2 stu.2 hp.1 hp.2.1 hp.2.2 hm.2

theorem witnessTriples_card_eq_sum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    ((witnessTriples Γ p H).card : ℝ)=
      ∑st∈distinctRootPairs Γ p H,((thirdWitnessPartners Γ p H st.1 st.2).card : ℝ) := by
  classical
  calc
    _ = ∑stu∈(distinctRootPairs Γ p H).product (shortStars Γ p H),
        if stu.2.2∈lineThrough stu.1.1.1 stu.1.2.1 then (1 : ℝ) else 0 := by simp [witnessTriples]
    _ = ∑st∈distinctRootPairs Γ p H,∑u∈shortStars Γ p H,
        if u.2∈lineThrough st.1.1 st.2.1 then (1 : ℝ) else 0 := Finset.sum_product _ _ _
    _ = _ := by
      apply Finset.sum_congr rfl
      intro st _
      rw [←Finset.sum_filter]
      simp only [thirdWitnessPartners,witnessOn,Finset.sum_const,nsmul_eq_mul,mul_one]

theorem distinctRootPairs_card_le_square {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    ((distinctRootPairs Γ p H).card : ℝ)≤((shortStars Γ p H).card : ℝ)^2 := by
  classical
  have hc : (distinctRootPairs Γ p H).card≤(shortStars Γ p H).card*(shortStars Γ p H).card := by
    calc
      _ ≤ ((shortStars Γ p H).product (shortStars Γ p H)).card := Finset.card_filter_le _ _
      _ = _ := Finset.card_product _ _
  simpa only [pow_two] using (show ((distinctRootPairs Γ p H).card : ℝ)≤
    ((shortStars Γ p H).card : ℝ)*(shortStars Γ p H).card by exact_mod_cast hc)

theorem witnessTriples_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃C : ℝ,0<C ∧ ∀(n : ℕ)(Γ : Finset ZPoint)(p : Grid n)(H : ℝ),
      ((witnessTriples Γ p H).card : ℝ)≤((shortStars Γ p H).card : ℝ)^2*(C*(n : ℝ)^(1+ξ)) := by
  obtain ⟨C,hC,hbound⟩ := thirdWitnessPartners_card_le_const_rpow ξ hξ
  refine ⟨C,hC,?_⟩
  intro n Γ p H
  rw [witnessTriples_card_eq_sum]
  calc
    _ ≤ ∑st∈distinctRootPairs Γ p H,C*(n : ℝ)^(1+ξ) := by
      apply Finset.sum_le_sum
      intro st hst
      have hh := (mem_distinctRootPairs Γ p H st.1 st.2).mp hst
      exact hbound n Γ p H st.1 st.2 hh.1 hh.2.1 hh.2.2
    _ = ((distinctRootPairs Γ p H).card : ℝ)*(C*(n : ℝ)^(1+ξ)) := by
      simp only [Finset.sum_const,nsmul_eq_mul]
    _ ≤ _ := mul_le_mul_of_nonneg_right (distinctRootPairs_card_le_square Γ p H) (by positivity)

theorem freshWitnessTriples_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃C : ℝ,0<C ∧ ∀(n : ℕ)(Γ : Finset ZPoint)(p : Grid n)(H : ℝ),
      ((freshWitnessTriples Γ p H).card : ℝ)≤((shortStars Γ p H).card : ℝ)^2*(C*(n : ℝ)^(1+ξ)) := by
  simp_rw [freshWitnessTriples_eq]
  exact witnessTriples_card_le_const_rpow ξ hξ

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.freshWitnessTriples_eq
#print axioms NoThreeLine.ShortStars.witnessTriples_card_le_const_rpow
