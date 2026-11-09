import NoThreeLine.MaskedPairBound
import NoThreeLine.AngularSieve

/-! Literal reindexing of the four primitive direction families into the
three nonzero mod-two direction types. Partner types come from p+d. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FiniteDirections
open PrimitiveLines GridChord

def nonzeroParityNat (j : Fin 3) : ℕ × ℕ := ![(1,0),(0,1),(1,1)] j
def nonzeroParity (j : Fin 3) : ZPoint :=
  ((nonzeroParityNat j).1,(nonzeroParityNat j).2)

/-- The sieve convention is (height parity, minor-coordinate parity). -/
def familyEpsilon (f : Fin 4) (j : Fin 3) : ℕ :=
  if f.val < 2 then (nonzeroParityNat j).1 else (nonzeroParityNat j).2
def familyEta (f : Fin 4) (j : Fin 3) : ℕ :=
  if f.val < 2 then (nonzeroParityNat j).2 else (nonzeroParityNat j).1

def typedPartners {ι : Type*} {n : ℕ} (w : ZPoint → ι → ℝ) (p : Grid n)
    (j : Fin 3) : ι → ℝ := w (parity (gridEmbed p+nonzeroParity j))

theorem familyEpsilon_le (f : Fin 4) (j : Fin 3) : familyEpsilon f j ≤ 1 := by
  fin_cases f <;> fin_cases j <;> decide

theorem familyEta_le (f : Fin 4) (j : Fin 3) : familyEta f j ≤ 1 := by
  fin_cases f <;> fin_cases j <;> decide

theorem neg_mod_two (a : ℤ) : (-a)%2=a%2 := by omega

theorem family_partner_of_parity (p : ZPoint) (f : Fin 4) (j : Fin 3) (a h : ℕ)
    (hh : h%2=familyEpsilon f j) (ha : a%2=familyEta f j) :
    parity (p+familyVector (f,(a,h))) = parity (p+nonzeroParity j) := by
  fin_cases f <;> fin_cases j <;>
    norm_num [familyEpsilon,familyEta,nonzeroParityNat] at hh ha <;>
    apply Prod.ext <;>
    norm_num [parity,familyVector,nonzeroParity,nonzeroParityNat] <;> omega

theorem coprime_parity_nonzero (a h : ℕ) (hc : Nat.Coprime a h) :
    ¬(a%2=0 ∧ h%2=0) := by
  rintro ⟨ha,hh⟩
  have hd : 2 ∣ Nat.gcd a h := Nat.dvd_gcd (Nat.dvd_of_mod_eq_zero ha) (Nat.dvd_of_mod_eq_zero hh)
  rw [hc.gcd_eq_one] at hd
  norm_num at hd

theorem primitive_parity_partition (f : Fin 4) (a h : ℕ) (hc : Nat.Coprime a h) :
    (∑ j : Fin 3, if h%2=familyEpsilon f j ∧ a%2=familyEta f j then (1 : ℝ) else 0)=1 := by
  have hnonzero := coprime_parity_nonzero a h hc
  have ha : a%2=0 ∨ a%2=1 := by omega
  have hh : h%2=0 ∨ h%2=1 := by omega
  rcases ha with ha | ha <;> rcases hh with hh | hh
  · exact (hnonzero ⟨ha,hh⟩).elim
  all_goals
    fin_cases f <;>
      rw [Fin.sum_univ_succ,Fin.sum_univ_succ,Fin.sum_univ_succ] <;>
      norm_num [familyEpsilon,familyEta,nonzeroParityNat,ha,hh] <;> decide

theorem primitiveParityK_eq_familyDomain (N ε η : ℕ) (g : ℝ → ℝ) :
    primitiveParityK N ε η g = ∑ q ∈ familyDomain (N+1),
      if q.2%2=ε ∧ q.1%2=η then g ((q.1 : ℝ)/(q.2 : ℝ))/(q.2 : ℝ)^2 else 0 := by
  classical
  have hi : Finset.Ico 1 (N+1) = Finset.Icc 1 N := by ext k; simp
  unfold primitiveParityK sieveDomain familyDomain
  rw [hi]
  simp only [Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro q hq
  by_cases hl : q.1 ≤ q.2 <;> by_cases hc : Nat.Coprime q.1 q.2 <;>
    by_cases he : q.2%2=ε <;> by_cases ht : q.1%2=η <;>
    simp [hl,hc,he,ht,directionWeight,div_eq_mul_inv,mul_comm]

theorem maskedFamilyChord_square_of_parity {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι → Rect) (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n)
    (f : Fin 4) (j : Fin 3) (a h : ℕ)
    (hh : h%2=familyEpsilon f j) (ha : a%2=familyEta f j) :
    (maskedFamilyChord S R w V H p (f,(a,h)))^2 =
      pairAngularSquare S R (w (parity (gridEmbed p))) (typedPartners w p j) f V H
        (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((a : ℝ)/(h : ℝ)) := by
  unfold maskedFamilyChord pairAngularSquare directionPairWeight typedPartners
  rw [family_partner_of_parity (gridEmbed p) f j a h hh ha]
  rw [rectangleField_add_weights]

theorem family_term_parity_partition {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι → Rect) (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n)
    (f : Fin 4) (a h : ℕ) (hc : Nat.Coprime a h) :
    (maskedFamilyChord S R w V H p (f,(a,h)))^2/(h : ℝ)^2 =
      ∑ j : Fin 3, if h%2=familyEpsilon f j ∧ a%2=familyEta f j then
        pairAngularSquare S R (w (parity (gridEmbed p))) (typedPartners w p j) f V H
          (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((a : ℝ)/(h : ℝ))/(h : ℝ)^2
      else 0 := by
  calc
    _ = (∑ j : Fin 3, if h%2=familyEpsilon f j ∧ a%2=familyEta f j then (1 : ℝ) else 0) *
        ((maskedFamilyChord S R w V H p (f,(a,h)))^2/(h : ℝ)^2) := by
      rw [primitive_parity_partition f a h hc,one_mul]
    _ = _ := by
      rw [Finset.sum_mul]
      apply Finset.sum_congr rfl
      intro j hj
      split_ifs with he
      · rw [one_mul,maskedFamilyChord_square_of_parity S R w V H p f j a h he.1 he.2]
      · rw [zero_mul]

/-- Exact equality, retaining every diagonal term in the full four-family sum. -/
theorem four_family_main_eq_primitiveParityK {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι → Rect) (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n) (N : ℕ) :
    (∑ z ∈ familyLabels (N+1), (maskedFamilyChord S R w V H p z)^2/(z.2.2 : ℝ)^2) =
      ∑ z : Fin 4 × Fin 3, primitiveParityK N (familyEpsilon z.1 z.2) (familyEta z.1 z.2)
        (pairAngularSquare S R (w (parity (gridEmbed p))) (typedPartners w p z.2) z.1 V H
          (normX n (gridEmbed p)) (normY n (gridEmbed p))) := by
  classical
  simp only [familyLabels,Finset.product_eq_sprod,Finset.sum_product,Fintype.sum_prod_type]
  apply Finset.sum_congr rfl
  intro f hf
  simp_rw [primitiveParityK_eq_familyDomain]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro q hq
  have hc : Nat.Coprime q.1 q.2 := (Finset.mem_filter.mp hq).2.2
  exact family_term_parity_partition S R w V H p f q.1 q.2 hc

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.family_partner_of_parity
#print axioms NoThreeLine.FiniteDirections.primitive_parity_partition
#print axioms NoThreeLine.FiniteDirections.four_family_main_eq_primitiveParityK
