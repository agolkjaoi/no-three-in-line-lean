import NoThreeLine.LatticeRectangle

/-! Open rectangle sections for every real slope, including horizontal axes.
These are geometric definitions with proved pointwise identities. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine

def Rect.sectionLower (R : Rect) (v u : ℝ) : ℝ :=
  if 0 < u then R.lower v u else
  if u < 0 then max R.x0 ((R.y1-v)/u) else
  if R.y0 < v ∧ v < R.y1 then R.x0 else 0

def Rect.sectionUpper (R : Rect) (v u : ℝ) : ℝ :=
  if 0 < u then R.upper v u else
  if u < 0 then min R.x1 ((R.y0-v)/u) else
  if R.y0 < v ∧ v < R.y1 then R.x1 else 0

theorem Rect.line_mem_section (R : Rect) (v u t : ℝ) :
    R.contains t (v+u*t) ↔
      t ∈ Ioo (R.sectionLower v u) (R.sectionUpper v u) := by
  by_cases hu : 0 < u
  · simpa [Rect.sectionLower, Rect.sectionUpper, hu] using R.line_mem_iff v u t hu
  · by_cases hn : u < 0
    · simp only [Rect.sectionLower, Rect.sectionUpper, if_neg hu, if_pos hn,
        Rect.contains, mem_Ioo, max_lt_iff, lt_min_iff]
      rw [div_lt_iff_of_neg hn, lt_div_iff_of_neg hn]
      constructor
      · rintro ⟨hx0,hx1,hy0,hy1⟩
        constructor <;> constructor <;> nlinarith
      · rintro ⟨⟨hx0,hy1⟩,hx1,hy0⟩
        exact ⟨hx0,hx1,by nlinarith,by nlinarith⟩
    · have he : u=0 := by linarith
      subst u
      by_cases hv : R.y0<v ∧ v<R.y1
      · simp [Rect.sectionLower, Rect.sectionUpper, Rect.contains, hv]
      · simp only [Rect.sectionLower, Rect.sectionUpper, lt_self_iff_false,
          if_false, if_neg hv, zero_mul, add_zero, mem_Ioo]
        constructor
        · intro hc
          exact False.elim (hv ⟨hc.2.2.1,hc.2.2.2⟩)
        · intro ht
          linarith [ht.1,ht.2]

/-- A diagonal rectangle whose line section is exactly the original section. -/
def Rect.sectionRect (R : Rect) (v u : ℝ) : Rect :=
  ⟨R.sectionLower v u, R.sectionUpper v u,
   R.sectionLower v u, R.sectionUpper v u⟩

theorem Rect.sectionRect_field (R : Rect) (w v u t : ℝ) :
    (R.sectionRect v u).field w t t = R.field w t (v+u*t) := by
  classical
  have hm : (R.sectionRect v u).contains t t ↔ R.contains t (v+u*t) := by
    rw [R.line_mem_section v u t]
    simp only [Rect.sectionRect, Rect.contains, mem_Ioo]
    tauto
  simp only [Rect.field, hm]

theorem sectionRect_field {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (v u t : ℝ) :
    rectangleField S (fun i => (R i).sectionRect v u) w t t =
      rectangleField S R w t (v+u*t) := by
  apply Finset.sum_congr rfl
  intro i _
  exact (R i).sectionRect_field (w i) v u t

def lineLatticeSupport {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (shift step v u : ℝ) (ε : ℤ) : Finset ℤ :=
  rectangleLatticeSupport S (fun i => (R i).sectionRect v u) shift step 0 1 ε

def lineLatticeSumExceptRoot {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (shift step v u : ℝ) (ε : ℤ) : ℝ :=
  ∑ k ∈ (lineLatticeSupport S R shift step v u ε).erase 0,
    rectangleField S R w (shift+step*k) (v+u*(shift+step*k))

theorem lineLatticeSumExceptRoot_eq {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (shift step v u : ℝ) (ε : ℤ) :
    lineLatticeSumExceptRoot S R w shift step v u ε =
      rectangleLatticeSumExceptRoot S (fun i => (R i).sectionRect v u) w
        shift step 0 1 ε := by
  unfold lineLatticeSumExceptRoot rectangleLatticeSumExceptRoot lineLatticeSupport
  apply Finset.sum_congr rfl
  intro k _
  simp only [one_mul, zero_add, sectionRect_field]

/-- Every nonzero sample of the specified parity belongs to the constructed
finite support. The sum is therefore the actual full integer-line sample. -/
theorem lineLatticeSupport_complete {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (shift step v u : ℝ) (hs : 0 < step) (ε : ℤ) (hε : 0 ≤ ε ∧ ε < 2)
    (k : ℤ) (hk : k%2=ε) :
    k ∈ lineLatticeSupport S R shift step v u ε ↔
      ∃ i ∈ S, (R i).contains (shift+step*k) (v+u*(shift+step*k)) := by
  classical
  unfold lineLatticeSupport rectangleLatticeSupport
  simp only [Finset.mem_biUnion]
  apply exists_congr
  intro i
  apply and_congr_right
  intro _
  rw [mem_parityLatticeIndices shift step _ _ hs ε hε k]
  rw [(R i).line_mem_section v u (shift+step*k)]
  simp [Rect.sectionRect, Rect.lower, Rect.upper, hk]

theorem lineLatticeSumExceptRoot_error {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w₀ w₁ : ι → ℝ) (shift step v u M : ℝ) (hs : 0 < step)
    (hw₀ : ∀ i ∈ S, |w₀ i| ≤ M) (hw₁ : ∀ i ∈ S, |w₁ i| ≤ M)
    (hroot : |rectangleField S R w₀ shift (v+u*shift)| ≤ M) :
    |lineLatticeSumExceptRoot S R w₀ shift step v u 0 +
       lineLatticeSumExceptRoot S R w₁ shift step v u 1 -
       (∫ t : ℝ, rectangleField S R (fun i => w₀ i+w₁ i) t (v+u*t))/(2*step)|
      ≤ (4*S.card+1)*M := by
  rw [lineLatticeSumExceptRoot_eq, lineLatticeSumExceptRoot_eq]
  have hroot' : |rectangleField S (fun i => (R i).sectionRect v u) w₀
      shift (0+1*shift)| ≤ M := by
    simpa only [one_mul, zero_add, sectionRect_field] using hroot
  have he := twoParityRectangleSumExceptRoot_error S (fun i => (R i).sectionRect v u)
    w₀ w₁ shift step 0 1 M hs (by norm_num) hw₀ hw₁ hroot'
  simpa only [one_mul, zero_add, sectionRect_field] using he

/-- G13 in the horizontal major-coordinate chart, for every signed slope,
including the actual horizontal axis. The primitive lattice parametrization
and finite-square restriction are independent subsequent obligations. -/
theorem rectangle_G13_all_slopes {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w₀ w₁ : ι → ℝ) (x y u M : ℝ) (n h : ℕ) (hn : 0 < n) (hh : 0 < h)
    (hw₀ : ∀ i ∈ S, |w₀ i| ≤ M) (hw₁ : ∀ i ∈ S, |w₁ i| ≤ M)
    (hroot : |rectangleField S R w₀ x y| ≤ M) :
    |lineLatticeSumExceptRoot S R w₀ x ((h:ℝ)/n) (y-u*x) u 0 +
       lineLatticeSumExceptRoot S R w₁ x ((h:ℝ)/n) (y-u*x) u 1 -
       ((n:ℝ)/(2*h))*fieldChord S R (fun i => w₀ i+w₁ i) x y u|
      ≤ (4*S.card+1)*M := by
  have hn' : (0:ℝ) < n := by exact_mod_cast hn
  have hh' : (0:ℝ) < h := by exact_mod_cast hh
  have hroot' : |rectangleField S R w₀ x (y-u*x+u*x)| ≤ M := by
    have he : y-u*x+u*x=y := by ring
    simpa only [he] using hroot
  have he := lineLatticeSumExceptRoot_error S R w₀ w₁ x ((h:ℝ)/n)
    (y-u*x) u M (div_pos hh' hn') hw₀ hw₁ hroot'
  have hscale (C : ℝ) : C/(2*((h:ℝ)/n)) = ((n:ℝ)/(2*h))*C := by field_simp
  simpa only [hscale, fieldChord] using he

def Rect.swap (R : Rect) : Rect := ⟨R.y0,R.y1,R.x0,R.x1⟩

theorem Rect.swap_field (R : Rect) (w x y : ℝ) :
    R.swap.field w y x = R.field w x y := by
  classical
  have he : R.swap.contains y x ↔ R.contains x y := by
    simp only [Rect.swap, Rect.contains]
    tauto
  simp only [Rect.field, he]

theorem rectangleField_swap {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (x y : ℝ) : rectangleField S (fun i => (R i).swap) w y x =
      rectangleField S R w x y := by
  apply Finset.sum_congr rfl
  intro i _
  exact (R i).swap_field (w i) x y

def verticalLatticeSumExceptRoot {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (shift step v u : ℝ) (ε : ℤ) : ℝ :=
  ∑ k ∈ (lineLatticeSupport S (fun i => (R i).swap) shift step v u ε).erase 0,
    rectangleField S R w (v+u*(shift+step*k)) (shift+step*k)

theorem verticalLatticeSumExceptRoot_eq {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (shift step v u : ℝ) (ε : ℤ) :
    verticalLatticeSumExceptRoot S R w shift step v u ε =
      lineLatticeSumExceptRoot S (fun i => (R i).swap) w shift step v u ε := by
  unfold verticalLatticeSumExceptRoot lineLatticeSumExceptRoot
  apply Finset.sum_congr rfl
  intro k _
  exact (rectangleField_swap S R w _ _).symm

/-- The same G13 statement in the vertical major coordinate. At u=0 this
is the actual vertical axis, not a null-set convention. -/
theorem rectangle_G13_vertical_all_slopes {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w₀ w₁ : ι → ℝ) (x y u M : ℝ) (n h : ℕ) (hn : 0 < n) (hh : 0 < h)
    (hw₀ : ∀ i ∈ S, |w₀ i| ≤ M) (hw₁ : ∀ i ∈ S, |w₁ i| ≤ M)
    (hroot : |rectangleField S R w₀ x y| ≤ M) :
    |verticalLatticeSumExceptRoot S R w₀ y ((h:ℝ)/n) (x-u*y) u 0 +
       verticalLatticeSumExceptRoot S R w₁ y ((h:ℝ)/n) (x-u*y) u 1 -
       ((n:ℝ)/(2*h))*(∫ t : ℝ,
         rectangleField S R (fun i => w₀ i+w₁ i) (x-u*y+u*t) t)|
      ≤ (4*S.card+1)*M := by
  rw [verticalLatticeSumExceptRoot_eq, verticalLatticeSumExceptRoot_eq]
  have hroot' : |rectangleField S (fun i => (R i).swap) w₀ y x| ≤ M := by
    simpa only [rectangleField_swap] using hroot
  have he := rectangle_G13_all_slopes S (fun i => (R i).swap) w₀ w₁ y x u M n h
    hn hh hw₀ hw₁ hroot'
  simpa only [fieldChord, rectangleField_swap] using he

end NoThreeLine

#print axioms NoThreeLine.Rect.line_mem_section
#print axioms NoThreeLine.lineLatticeSupport_complete
#print axioms NoThreeLine.rectangle_G13_all_slopes
#print axioms NoThreeLine.rectangle_G13_vertical_all_slopes
