import NoThreeLine.LatticeRiemann

/-! Sampling actual finite rectangle fields on moving parity lattices. The
support is constructed from the rectangles, not supplied as an error estimate. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine

def rectangleLatticeSupport {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (shift step v u : ℝ) (ε : ℤ) : Finset ℤ := by
  classical
  exact S.biUnion (fun i => parityLatticeIndices shift step
    ((R i).lower v u) ((R i).upper v u) ε)

def rectangleLatticeSum {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (shift step v u : ℝ) (ε : ℤ) : ℝ :=
  ∑ k ∈ rectangleLatticeSupport S R shift step v u ε,
    rectangleField S R w (shift+step*k) (v+u*(shift+step*k))

theorem rectangleLatticeSupport_parity {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (shift step v u : ℝ) (hs : 0 < step) (ε : ℤ) (hε : 0 ≤ ε ∧ ε < 2)
    (k : ℤ) (hk : k ∈ rectangleLatticeSupport S R shift step v u ε) : k%2=ε := by
  classical
  obtain ⟨i,hi,hki⟩ := Finset.mem_biUnion.mp hk
  exact ((mem_parityLatticeIndices shift step _ _ hs ε hε k).mp hki).2.2

theorem rectangleLatticeSum_eq_counts {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (shift step v u : ℝ) (hs : 0 < step) (hu : 0 < u)
    (ε : ℤ) (hε : 0 ≤ ε ∧ ε < 2) :
    rectangleLatticeSum S R w shift step v u ε =
      ∑ i ∈ S, w i * ((parityLatticeIndices shift step
        ((R i).lower v u) ((R i).upper v u) ε).card:ℝ) := by
  classical
  unfold rectangleLatticeSum rectangleField
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i hi
  let D := parityLatticeIndices shift step ((R i).lower v u) ((R i).upper v u) ε
  have hsub : D ⊆ rectangleLatticeSupport S R shift step v u ε := by
    intro k hk
    exact Finset.mem_biUnion.mpr ⟨i,hi,hk⟩
  have he : (∑ k ∈ rectangleLatticeSupport S R shift step v u ε,
      (R i).field (w i) (shift+step*k) (v+u*(shift+step*k))) =
      ∑ k ∈ D, (R i).field (w i) (shift+step*k) (v+u*(shift+step*k)) := by
    symm
    apply Finset.sum_subset hsub
    intro k hk hnot
    have hp := rectangleLatticeSupport_parity S R shift step v u hs ε hε k hk
    have hn : ¬(R i).contains (shift+step*k) (v+u*(shift+step*k)) := by
      intro hc
      have hc' := (Rect.line_mem_iff (R i) v u (shift+step*k) hu).mp hc
      apply hnot
      exact (mem_parityLatticeIndices shift step _ _ hs ε hε k).mpr
        ⟨hc'.1,hc'.2,hp⟩
    simp [Rect.field, hn]
  rw [he]
  calc
    _ = ∑ _k ∈ D, w i := by
      apply Finset.sum_congr rfl
      intro k hk
      have hp := (mem_parityLatticeIndices shift step _ _ hs ε hε k).mp hk
      have hc := (Rect.line_mem_iff (R i) v u (shift+step*k) hu).mpr ⟨hp.1,hp.2.1⟩
      simp [Rect.field, hc]
    _ = _ := by simp [D, mul_comm]

theorem rectangleLatticeSum_error {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (shift step v u M : ℝ) (hs : 0 < step) (hu : 0 < u)
    (ε : ℤ) (hε : 0 ≤ ε ∧ ε < 2) (hw : ∀ i ∈ S, |w i| ≤ M) :
    |rectangleLatticeSum S R w shift step v u ε -
      (∫ t : ℝ, rectangleField S R w t (v+u*t))/(2*step)| ≤ 2*S.card*M := by
  classical
  rw [rectangleLatticeSum_eq_counts S R w shift step v u hs hu ε hε,
    rectangleField_chord S R w v u hu, Finset.sum_div, ← Finset.sum_sub_distrib]
  calc
    _ ≤ ∑ i ∈ S, |w i * ((parityLatticeIndices shift step
        ((R i).lower v u) ((R i).upper v u) ε).card:ℝ) -
        w i*(R i).chordLength v u/(2*step)| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _i ∈ S, 2*M := by
      apply Finset.sum_le_sum
      intro i hi
      have he := parityLatticeIndices_card_error shift step ((R i).lower v u)
        ((R i).upper v u) hs ε
      have hx : w i*((parityLatticeIndices shift step ((R i).lower v u)
          ((R i).upper v u) ε).card:ℝ) - w i*(R i).chordLength v u/(2*step) =
          w i*(((parityLatticeIndices shift step ((R i).lower v u)
          ((R i).upper v u) ε).card:ℝ) - (R i).chordLength v u/(2*step)) := by ring
      rw [hx, abs_mul]
      exact (mul_le_mul_of_nonneg_left he (abs_nonneg _)).trans (by nlinarith [hw i hi])
    _ = _ := by simp; ring

theorem twoParityRectangleSum_error {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w₀ w₁ : ι → ℝ) (shift step v u M : ℝ) (hs : 0 < step) (hu : 0 < u)
    (hw₀ : ∀ i ∈ S, |w₀ i| ≤ M) (hw₁ : ∀ i ∈ S, |w₁ i| ≤ M) :
    |rectangleLatticeSum S R w₀ shift step v u 0 +
       rectangleLatticeSum S R w₁ shift step v u 1 -
       (∫ t : ℝ, rectangleField S R (fun i => w₀ i+w₁ i) t (v+u*t))/(2*step)|
      ≤ 4*S.card*M := by
  have h0 := rectangleLatticeSum_error S R w₀ shift step v u M hs hu 0 (by norm_num) hw₀
  have h1 := rectangleLatticeSum_error S R w₁ shift step v u M hs hu 1 (by norm_num) hw₁
  have hc : (∫ t : ℝ, rectangleField S R (fun i => w₀ i+w₁ i) t (v+u*t)) =
      (∫ t : ℝ, rectangleField S R w₀ t (v+u*t)) +
      (∫ t : ℝ, rectangleField S R w₁ t (v+u*t)) := by
    rw [rectangleField_chord S R (fun i => w₀ i+w₁ i) v u hu,
      rectangleField_chord S R w₀ v u hu, rectangleField_chord S R w₁ v u hu]
    simp_rw [add_mul]
    exact Finset.sum_add_distrib
  rw [hc]
  have he := abs_add_le
    (rectangleLatticeSum S R w₀ shift step v u 0 -
      (∫ t : ℝ, rectangleField S R w₀ t (v+u*t))/(2*step))
    (rectangleLatticeSum S R w₁ shift step v u 1 -
      (∫ t : ℝ, rectangleField S R w₁ t (v+u*t))/(2*step))
  have hx : rectangleLatticeSum S R w₀ shift step v u 0 +
      rectangleLatticeSum S R w₁ shift step v u 1 -
      ((∫ t : ℝ, rectangleField S R w₀ t (v+u*t)) +
        (∫ t : ℝ, rectangleField S R w₁ t (v+u*t)))/(2*step) =
      (rectangleLatticeSum S R w₀ shift step v u 0 -
        (∫ t : ℝ, rectangleField S R w₀ t (v+u*t))/(2*step)) +
      (rectangleLatticeSum S R w₁ shift step v u 1 -
        (∫ t : ℝ, rectangleField S R w₁ t (v+u*t))/(2*step)) := by ring
  rw [hx]
  linarith

def rectangleLatticeSumExceptRoot {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (shift step v u : ℝ) (ε : ℤ) : ℝ :=
  ∑ k ∈ (rectangleLatticeSupport S R shift step v u ε).erase 0,
    rectangleField S R w (shift+step*k) (v+u*(shift+step*k))

theorem rectangleLatticeSumExceptRoot_even {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (shift step v u : ℝ) (hs : 0 < step) (hu : 0 < u) :
    rectangleLatticeSumExceptRoot S R w shift step v u 0 =
      rectangleLatticeSum S R w shift step v u 0 -
        rectangleField S R w shift (v+u*shift) := by
  classical
  by_cases hz : 0 ∈ rectangleLatticeSupport S R shift step v u 0
  · have he := Finset.sum_erase_add (rectangleLatticeSupport S R shift step v u 0)
      (fun k : ℤ => rectangleField S R w (shift+step*k) (v+u*(shift+step*k))) hz
    simp only [Int.cast_zero, mul_zero, add_zero] at he
    unfold rectangleLatticeSumExceptRoot rectangleLatticeSum
    linarith
  · have hf : rectangleField S R w shift (v+u*shift) = 0 := by
      apply Finset.sum_eq_zero
      intro i hi
      have hn : ¬ (R i).contains shift (v+u*shift) := by
        intro hc
        have hc' := (Rect.line_mem_iff (R i) v u shift hu).mp hc
        apply hz
        apply Finset.mem_biUnion.mpr
        refine ⟨i,hi,?_⟩
        apply (mem_parityLatticeIndices shift step _ _ hs 0 (by norm_num) 0).mpr
        simpa using And.intro hc'.1 (And.intro hc'.2 (by norm_num : (0:ℤ)%2=0))
      simp [Rect.field, hn]
    simp [rectangleLatticeSumExceptRoot, rectangleLatticeSum, Finset.erase_eq_of_notMem hz, hf]

theorem rectangleLatticeSumExceptRoot_odd {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (shift step v u : ℝ) (hs : 0 < step) :
    rectangleLatticeSumExceptRoot S R w shift step v u 1 =
      rectangleLatticeSum S R w shift step v u 1 := by
  have hn : 0 ∉ rectangleLatticeSupport S R shift step v u 1 := by
    intro hz
    have he := rectangleLatticeSupport_parity S R shift step v u hs 1 (by norm_num) 0 hz
    norm_num at he
  simp [rectangleLatticeSumExceptRoot, rectangleLatticeSum, Finset.erase_eq_of_notMem hn]

theorem twoParityRectangleSumExceptRoot_error {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w₀ w₁ : ι → ℝ) (shift step v u M : ℝ) (hs : 0 < step) (hu : 0 < u)
    (hw₀ : ∀ i ∈ S, |w₀ i| ≤ M) (hw₁ : ∀ i ∈ S, |w₁ i| ≤ M)
    (hroot : |rectangleField S R w₀ shift (v+u*shift)| ≤ M) :
    |rectangleLatticeSumExceptRoot S R w₀ shift step v u 0 +
       rectangleLatticeSumExceptRoot S R w₁ shift step v u 1 -
       (∫ t : ℝ, rectangleField S R (fun i => w₀ i+w₁ i) t (v+u*t))/(2*step)|
      ≤ (4*S.card+1)*M := by
  have he := twoParityRectangleSum_error S R w₀ w₁ shift step v u M hs hu hw₀ hw₁
  rw [rectangleLatticeSumExceptRoot_even S R w₀ shift step v u hs hu,
    rectangleLatticeSumExceptRoot_odd S R w₁ shift step v u hs]
  have ha := abs_sub_le
    (rectangleLatticeSum S R w₀ shift step v u 0 +
      rectangleLatticeSum S R w₁ shift step v u 1 -
      (∫ t : ℝ, rectangleField S R (fun i => w₀ i+w₁ i) t (v+u*t))/(2*step))
    0
    (rectangleField S R w₀ shift (v+u*shift))
  simp only [sub_zero, zero_sub, abs_neg] at ha
  have hx : rectangleLatticeSum S R w₀ shift step v u 0 -
      rectangleField S R w₀ shift (v+u*shift) +
      rectangleLatticeSum S R w₁ shift step v u 1 -
      (∫ t : ℝ, rectangleField S R (fun i => w₀ i+w₁ i) t (v+u*t))/(2*step) =
      (rectangleLatticeSum S R w₀ shift step v u 0 +
        rectangleLatticeSum S R w₁ shift step v u 1 -
        (∫ t : ℝ, rectangleField S R (fun i => w₀ i+w₁ i) t (v+u*t))/(2*step)) -
        rectangleField S R w₀ shift (v+u*shift) := by ring
  rw [hx]
  nlinarith

/-- G13's normalization for a positive-slope chart. Integer-line coordinates
and the two actual parity samples are explicit; no primitive-direction
bijection or truncation to a finite square is presumed here. -/
theorem rectangle_G13_positive_chart {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w₀ w₁ : ι → ℝ) (x y u M : ℝ) (n h : ℕ) (hn : 0 < n) (hh : 0 < h)
    (hu : 0 < u) (hw₀ : ∀ i ∈ S, |w₀ i| ≤ M) (hw₁ : ∀ i ∈ S, |w₁ i| ≤ M)
    (hroot : |rectangleField S R w₀ x y| ≤ M) :
    |rectangleLatticeSumExceptRoot S R w₀ x ((h:ℝ)/n) (y-u*x) u 0 +
       rectangleLatticeSumExceptRoot S R w₁ x ((h:ℝ)/n) (y-u*x) u 1 -
       ((n:ℝ)/(2*h))*fieldChord S R (fun i => w₀ i+w₁ i) x y u|
      ≤ (4*S.card+1)*M := by
  have hn' : (0:ℝ) < n := by exact_mod_cast hn
  have hh' : (0:ℝ) < h := by exact_mod_cast hh
  have hroot' : |rectangleField S R w₀ x (y-u*x+u*x)| ≤ M := by
    have he : y-u*x+u*x=y := by ring
    simpa only [he] using hroot
  have he := twoParityRectangleSumExceptRoot_error S R w₀ w₁ x ((h:ℝ)/n)
    (y-u*x) u M (div_pos hh' hn') hu hw₀ hw₁ hroot'
  have hscale (C : ℝ) : C/(2*((h:ℝ)/n)) = ((n:ℝ)/(2*h))*C := by
    field_simp
  simpa only [hscale, fieldChord] using he

end NoThreeLine

#print axioms NoThreeLine.rectangleLatticeSum_eq_counts
#print axioms NoThreeLine.rectangleLatticeSum_error
#print axioms NoThreeLine.twoParityRectangleSum_error
#print axioms NoThreeLine.twoParityRectangleSumExceptRoot_error
#print axioms NoThreeLine.rectangle_G13_positive_chart
