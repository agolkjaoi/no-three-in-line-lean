import NoThreeLine.GridShellChord

/-! The four non-axis primitive families. The reduced families omit the
duplicate diagonal in the two vertical charts; nonnegativity then permits
restoring both diagonals in the final upper bound. -/
set_option autoImplicit false
set_option maxHeartbeats 150000
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FiniteDirections
open PrimitiveLines GridChord

abbrev FamilyLabel := Fin 4 × (ℕ × ℕ)

def familyDomain (n : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.Ico 1 n).product (Finset.Ico 1 n)).filter
    (fun z => z.1 ≤ z.2 ∧ Nat.Coprime z.1 z.2)

def familyLabels (n : ℕ) : Finset FamilyLabel :=
  Finset.univ.product (familyDomain n)

def reducedFamilyLabels (n : ℕ) : Finset FamilyLabel :=
  (familyLabels n).filter (fun z => z.1.val < 2 ∨ z.2.1 < z.2.2)

def familyVector (z : FamilyLabel) : ZPoint :=
  ![((z.2.2 : ℤ),(z.2.1 : ℤ)), ((z.2.2 : ℤ),-(z.2.1 : ℤ)),
    ((z.2.1 : ℤ),(z.2.2 : ℤ)), (-(z.2.1 : ℤ),(z.2.2 : ℤ))] z.1

def familyDirection (z : FamilyLabel) : Σ _h : ℕ, ZPoint :=
  ⟨z.2.2,familyVector z⟩

def familyChord {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (z : FamilyLabel) : ℝ :=
  directionalChord z.1 (rectangleField S R (directionPairWeight w p (familyVector z)))
    (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((z.2.1 : ℝ)/(z.2.2 : ℝ))

theorem mem_reducedFamilyLabels (n : ℕ) (z : FamilyLabel) :
    z ∈ reducedFamilyLabels n ↔ 1 ≤ z.2.2 ∧ z.2.2 < n ∧
      1 ≤ z.2.1 ∧ z.2.1 ≤ z.2.2 ∧ Nat.Coprime z.2.1 z.2.2 ∧
        (z.1.val < 2 ∨ z.2.1 < z.2.2) := by
  simp only [reducedFamilyLabels,familyLabels,familyDomain,Finset.mem_filter,
    Finset.product_eq_sprod,Finset.mem_product,Finset.mem_univ,true_and,Finset.mem_Ico]
  omega

#check mem_reducedFamilyLabels

theorem nonaxis_subset_family_image (n : ℕ) :
    (directionIndices n).filter (fun d => d.2.1 ≠ 0 ∧ d.2.2 ≠ 0) ⊆
      (reducedFamilyLabels n).image familyDirection := by
  classical
  intro d hd
  obtain ⟨hd,hnz⟩ := Finset.mem_filter.mp hd
  have hheight := Finset.mem_Ico.mp (Finset.mem_sigma.mp hd).1
  obtain ⟨hs,hp⟩ := Finset.mem_filter.mp (Finset.mem_sigma.mp hd).2
  rcases (mem_rawShell d.1 d.2).mp hs with hs | hs
  · let a := d.2.2.natAbs
    have ha : (a : ℤ)=|d.2.2| := Int.natCast_natAbs _
    have hapos : 1 ≤ a := by
      have := Int.natAbs_pos.mpr hnz.2
      omega
    have hah : a ≤ d.1 := by
      have hb : |d.2.2| ≤ (d.1 : ℤ) := abs_le.mpr hs.2
      omega
    have hcop : Nat.Coprime a d.1 := by
      simpa [Primitive,hs.1,Nat.gcd_comm,Nat.Coprime,a] using hp
    rcases le_total 0 d.2.2 with hsign | hsign
    · refine Finset.mem_image.mpr ⟨(0,(a,d.1)),?_,?_⟩
      · apply (mem_reducedFamilyLabels _ _).mpr
        exact ⟨hheight.1,hheight.2,hapos,hah,hcop,Or.inl (by norm_num)⟩
      · apply Sigma.ext
        · rfl
        · apply heq_of_eq
          apply Prod.ext <;> dsimp [familyDirection,familyVector]
          · exact hs.1.symm
          · rwa [abs_of_nonneg hsign] at ha
    · refine Finset.mem_image.mpr ⟨(1,(a,d.1)),?_,?_⟩
      · apply (mem_reducedFamilyLabels _ _).mpr
        exact ⟨hheight.1,hheight.2,hapos,hah,hcop,Or.inl (by norm_num)⟩
      · apply Sigma.ext
        · rfl
        · apply heq_of_eq
          apply Prod.ext <;> dsimp [familyDirection,familyVector]
          · exact hs.1.symm
          · rw [abs_of_nonpos hsign] at ha
            omega
  · let a := d.2.1.natAbs
    have ha : (a : ℤ)=|d.2.1| := Int.natCast_natAbs _
    have hapos : 1 ≤ a := by
      have := Int.natAbs_pos.mpr hnz.1
      omega
    have hah : a < d.1 := by
      have hb : |d.2.1| < (d.1 : ℤ) := abs_lt.mpr hs.2
      omega
    have hcop : Nat.Coprime a d.1 := by
      simpa [Primitive,hs.1,Nat.Coprime,a] using hp
    rcases le_total 0 d.2.1 with hsign | hsign
    · refine Finset.mem_image.mpr ⟨(2,(a,d.1)),?_,?_⟩
      · apply (mem_reducedFamilyLabels _ _).mpr
        exact ⟨hheight.1,hheight.2,hapos,hah.le,hcop,Or.inr hah⟩
      · apply Sigma.ext
        · rfl
        · apply heq_of_eq
          apply Prod.ext <;> dsimp [familyDirection,familyVector]
          · rwa [abs_of_nonneg hsign] at ha
          · exact hs.1.symm
    · refine Finset.mem_image.mpr ⟨(3,(a,d.1)),?_,?_⟩
      · apply (mem_reducedFamilyLabels _ _).mpr
        exact ⟨hheight.1,hheight.2,hapos,hah.le,hcop,Or.inr hah⟩
      · apply Sigma.ext
        · rfl
        · apply heq_of_eq
          apply Prod.ext <;> dsimp [familyDirection,familyVector]
          · rw [abs_of_nonpos hsign] at ha
            omega
          · exact hs.1.symm

#check nonaxis_subset_family_image

theorem shellChord_family_eq {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (z : FamilyLabel)
    (hz : z ∈ reducedFamilyLabels n) :
    shellChord S R w p (familyDirection z) = familyChord S R w p z := by
  have hz' := (mem_reducedFamilyLabels n z).mp hz
  rcases z with ⟨f,a,h⟩
  fin_cases f
  · simp [shellChord,familyDirection,familyVector,familyChord]
  · simp [shellChord,familyDirection,familyVector,familyChord,directionalChord,
      neg_div,neg_mul,sub_eq_add_neg]
  · have hah : a ≠ h := by dsimp at hz'; omega
    have hahZ : (a : ℤ) ≠ h := by exact_mod_cast hah
    simp [shellChord,familyDirection,familyVector,familyChord,hahZ]
  · have hahZ : -(a : ℤ) ≠ h := by dsimp at hz'; omega
    simp [shellChord,familyDirection,familyVector,familyChord,directionalChord,hahZ,
      neg_div,neg_mul,sub_eq_add_neg]

#check shellChord_family_eq

theorem nonaxis_chord_sum_le_four_families {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι → Rect) (w : ZPoint → ι → ℝ) (p : Grid n) :
    (∑ d ∈ (directionIndices n).filter (fun d => d.2.1 ≠ 0 ∧ d.2.2 ≠ 0),
      (shellChord S R w p d)^2/(d.1 : ℝ)^2) ≤
      ∑ z ∈ familyLabels n, (familyChord S R w p z)^2/(z.2.2 : ℝ)^2 := by
  classical
  calc
    _ ≤ ∑ d ∈ (reducedFamilyLabels n).image familyDirection,
        (shellChord S R w p d)^2/(d.1 : ℝ)^2 :=
      Finset.sum_le_sum_of_subset_of_nonneg (nonaxis_subset_family_image n)
        (fun _ _ _ => by positivity)
    _ ≤ ∑ z ∈ reducedFamilyLabels n,
        (shellChord S R w p (familyDirection z))^2/((familyDirection z).1 : ℝ)^2 :=
      Finset.sum_image_le_of_nonneg (fun _ _ => by positivity)
    _ = ∑ z ∈ reducedFamilyLabels n, (familyChord S R w p z)^2/(z.2.2 : ℝ)^2 := by
      apply Finset.sum_congr rfl
      intro z hz
      rw [shellChord_family_eq S R w p z hz]
      rfl
    _ ≤ _ := Finset.sum_le_sum_of_subset_of_nonneg (Finset.filter_subset _ _)
      (fun _ _ _ => by positivity)

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.nonaxis_subset_family_image
#print axioms NoThreeLine.FiniteDirections.nonaxis_chord_sum_le_four_families
