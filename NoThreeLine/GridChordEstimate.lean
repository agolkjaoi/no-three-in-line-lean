import NoThreeLine.PrimitiveLines
import NoThreeLine.LatticeAllSlopes

/-! Actual finite-board line weights and G13. Unit-square support, normalized
coordinates, the primitive bijection and the real parity labels are proved
before the analytic lattice estimate is applied. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine.GridChord
open PrimitiveLines

def RectInUnit (R : Rect) : Prop :=
  0 ≤ R.x0 ∧ R.x1 ≤ 1 ∧ 0 ≤ R.y0 ∧ R.y1 ≤ 1

def DisjointRects {ι : Type*} (S : Finset ι) (R : ι → Rect) : Prop :=
  ∀ i ∈ S, ∀ j ∈ S, i ≠ j → ∀ x y,
    ¬((R i).contains x y ∧ (R j).contains x y)

def normX (n : ℕ) (z : ZPoint) : ℝ := (z.1:ℝ)/n
def normY (n : ℕ) (z : ZPoint) : ℝ := (z.2:ℝ)/n

def typedGridLineSum {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (d : ZPoint) : ℝ :=
  ∑ q ∈ (gridLinePoints n (gridEmbed p) d).erase p,
    rectangleField S R (w (parity (gridEmbed q)))
      (normX n (gridEmbed q)) (normY n (gridEmbed q))

theorem rectangleField_abs_le {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (M : ℝ) (hM : 0 ≤ M) (hdis : DisjointRects S R)
    (hw : ∀ i ∈ S, |w i| ≤ M) (x y : ℝ) : |rectangleField S R w x y| ≤ M := by
  classical
  by_cases he : ∃ i ∈ S, (R i).contains x y
  · obtain ⟨i,hi,hc⟩ := he
    have hs : rectangleField S R w x y = w i := by
      unfold rectangleField
      rw [Finset.sum_eq_single i]
      · simp [Rect.field, hc]
      · intro j hj hji
        have hn : ¬ (R j).contains x y := by
          intro hjc
          exact hdis j hj i hi hji x y ⟨hjc,hc⟩
        simp [Rect.field, hn]
      · exact fun hn => False.elim (hn hi)
    rw [hs]
    exact hw i hi
  · have hs : rectangleField S R w x y=0 := by
      apply Finset.sum_eq_zero
      intro i hi
      have hn : ¬(R i).contains x y := fun hc => he ⟨i,hi,hc⟩
      simp [Rect.field, hn]
    simpa only [hs, abs_zero] using hM

theorem contains_normalized_inGrid (n : ℕ) (hn : 0 < n) (z : ZPoint)
    (R : Rect) (hR : RectInUnit R) (hz : R.contains (normX n z) (normY n z)) :
    InGrid n z := by
  have hn' : (0:ℝ) < n := by exact_mod_cast hn
  have hx0 : (0:ℝ) < z.1/n := lt_of_le_of_lt hR.1 hz.1
  have hx1 : (z.1:ℝ)/n < 1 := lt_of_lt_of_le hz.2.1 hR.2.1
  have hy0 : (0:ℝ) < z.2/n := lt_of_le_of_lt hR.2.2.1 hz.2.2.1
  have hy1 : (z.2:ℝ)/n < 1 := lt_of_lt_of_le hz.2.2.2 hR.2.2.2
  have hx0' : (0:ℝ) < z.1 := (div_pos_iff_of_pos_right hn').mp hx0
  have hy0' : (0:ℝ) < z.2 := (div_pos_iff_of_pos_right hn').mp hy0
  have hx1' : (z.1:ℝ) < n := by simpa using (div_lt_iff₀ hn').mp hx1
  have hy1' : (z.2:ℝ) < n := by simpa using (div_lt_iff₀ hn').mp hy1
  exact ⟨by exact_mod_cast hx0'.le, by exact_mod_cast hx1',
    by exact_mod_cast hy0'.le, by exact_mod_cast hy1'⟩

theorem lineSupport_parity {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (shift step v u : ℝ) (hs : 0 < step) (ε : ℤ) (hε : 0 ≤ ε ∧ ε < 2)
    (k : ℤ) (hk : k ∈ lineLatticeSupport S R shift step v u ε) : k%2=ε :=
  rectangleLatticeSupport_parity S (fun i => (R i).sectionRect v u)
    shift step 0 1 hs ε hε k hk

theorem lineSum_eq_filter_sum {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (shift step v u : ℝ) (hs : 0 < step)
    (ε : ℤ) (hε : 0 ≤ ε ∧ ε < 2) (K : Finset ℤ)
    (hsub : lineLatticeSupport S R shift step v u ε ⊆ K) :
    lineLatticeSumExceptRoot S R w shift step v u ε =
      ∑ k ∈ (K.erase 0).filter (fun k => k%2=ε),
        rectangleField S R w (shift+step*k) (v+u*(shift+step*k)) := by
  classical
  unfold lineLatticeSumExceptRoot
  apply Finset.sum_subset
  · intro k hk
    obtain ⟨hk0,hks⟩ := Finset.mem_erase.mp hk
    exact Finset.mem_filter.mpr ⟨Finset.mem_erase.mpr ⟨hk0,hsub hks⟩,
      lineSupport_parity S R shift step v u hs ε hε k hks⟩
  · intro k hk hnot
    obtain ⟨hkK,hkp⟩ := Finset.mem_filter.mp hk
    have hk0 := (Finset.mem_erase.mp hkK).1
    have hns : k ∉ lineLatticeSupport S R shift step v u ε := by
      intro hks
      exact hnot (Finset.mem_erase.mpr ⟨hk0,hks⟩)
    apply Finset.sum_eq_zero
    intro i hi
    have hn : ¬(R i).contains (shift+step*k) (v+u*(shift+step*k)) := by
      intro hc
      apply hns
      exact (lineLatticeSupport_complete S R shift step v u hs ε hε k hkp).mpr ⟨i,hi,hc⟩
    simp [Rect.field, hn]

theorem horizontal_normX (n h : ℕ) (p : ZPoint) (a k : ℤ) :
    normX n (linePoint p ((h:ℤ),a) k) = normX n p+((h:ℝ)/n)*k := by
  dsimp [normX, linePoint]
  push_cast
  ring

theorem horizontal_normY (n h : ℕ) (hn : 0 < n) (hh : 0 < h)
    (p : ZPoint) (a k : ℤ) :
    normY n (linePoint p ((h:ℤ),a) k) =
      (normY n p-(a:ℝ)/h*normX n p) +
        (a:ℝ)/h*(normX n p+((h:ℝ)/n)*k) := by
  have hn' : (n:ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  have hh' : (h:ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hh)
  dsimp [normX, normY, linePoint]
  push_cast
  field_simp
  ring

theorem horizontal_support_subset {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (p : Grid n) (h : ℕ) (a : ℤ) (hn : 0 < n) (hh : 0 < h)
    (hd : Primitive ((h:ℤ),a)) (hR : ∀ i ∈ S, RectInUnit (R i))
    (ε : ℤ) (hε : 0 ≤ ε ∧ ε < 2) :
    lineLatticeSupport S R (normX n (gridEmbed p)) ((h:ℝ)/n)
      (normY n (gridEmbed p)-(a:ℝ)/h*normX n (gridEmbed p)) ((a:ℝ)/h) ε ⊆
      gridLineParameters n (gridEmbed p) ((h:ℤ),a) := by
  intro k hk
  have hs : (0:ℝ)<(h:ℝ)/n := by positivity
  have hp := lineSupport_parity S R _ _ _ _ hs ε hε k hk
  obtain ⟨i,hi,hc⟩ := (lineLatticeSupport_complete S R _ _ _ _ hs ε hε k hp).mp hk
  apply (mem_gridLineParameters n (gridEmbed p) _ hd k).mpr
  apply contains_normalized_inGrid n hn _ (R i) (hR i hi)
  rw [horizontal_normX, horizontal_normY n h hn hh]
  exact hc

theorem horizontal_grid_sum_eq_lattice {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (h : ℕ) (a : ℤ) (hn : 0 < n) (hh : 0 < h)
    (hd : Primitive ((h:ℤ),a)) (hR : ∀ i ∈ S, RectInUnit (R i)) :
    typedGridLineSum S R w p ((h:ℤ),a) =
      lineLatticeSumExceptRoot S R (w (parity (gridEmbed p)))
        (normX n (gridEmbed p)) ((h:ℝ)/n)
        (normY n (gridEmbed p)-(a:ℝ)/h*normX n (gridEmbed p)) ((a:ℝ)/h) 0 +
      lineLatticeSumExceptRoot S R (w (parity (gridEmbed p+((h:ℤ),a))))
        (normX n (gridEmbed p)) ((h:ℝ)/n)
        (normY n (gridEmbed p)-(a:ℝ)/h*normX n (gridEmbed p)) ((a:ℝ)/h) 1 := by
  have hs : (0:ℝ)<(h:ℝ)/n := by positivity
  unfold typedGridLineSum
  rw [sum_gridLine_erase_parity_split p ((h:ℤ),a) hd
    (fun r z => rectangleField S R (w r) (normX n z) (normY n z))]
  rw [lineSum_eq_filter_sum S R _ _ _ _ _ hs 0 (by norm_num) _
      (horizontal_support_subset S R p h a hn hh hd hR 0 (by norm_num)),
    lineSum_eq_filter_sum S R _ _ _ _ _ hs 1 (by norm_num) _
      (horizontal_support_subset S R p h a hn hh hd hR 1 (by norm_num))]
  simp_rw [horizontal_normX, horizontal_normY n h hn hh]

theorem horizontal_G13 {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (h : ℕ) (a : ℤ) (M : ℝ)
    (hn : 0 < n) (hh : 0 < h) (hd : Primitive ((h:ℤ),a))
    (hR : ∀ i ∈ S, RectInUnit (R i)) (hdis : DisjointRects S R) (hM : 0 ≤ M)
    (hw : ∀ r i, i ∈ S → |w r i| ≤ M) :
    |typedGridLineSum S R w p ((h:ℤ),a) - ((n:ℝ)/(2*h))*
      fieldChord S R (fun i => w (parity (gridEmbed p)) i +
        w (parity (gridEmbed p+((h:ℤ),a))) i)
        (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((a:ℝ)/h)|
      ≤ (4*S.card+1)*M := by
  rw [horizontal_grid_sum_eq_lattice S R w p h a hn hh hd hR]
  exact rectangle_G13_all_slopes S R _ _ _ _ _ M n h hn hh
    (hw _) (hw _) (rectangleField_abs_le S R _ M hM hdis (hw _) _ _)

theorem vertical_normY (n h : ℕ) (p : ZPoint) (a k : ℤ) :
    normY n (linePoint p (a,(h:ℤ)) k) = normY n p+((h:ℝ)/n)*k := by
  dsimp [normY, linePoint]
  push_cast
  ring

theorem vertical_normX (n h : ℕ) (hn : 0 < n) (hh : 0 < h)
    (p : ZPoint) (a k : ℤ) :
    normX n (linePoint p (a,(h:ℤ)) k) =
      (normX n p-(a:ℝ)/h*normY n p) +
        (a:ℝ)/h*(normY n p+((h:ℝ)/n)*k) := by
  have hn' : (n:ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  have hh' : (h:ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hh)
  dsimp [normX, normY, linePoint]
  push_cast
  field_simp
  ring

theorem vertical_support_subset {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (p : Grid n) (h : ℕ) (a : ℤ) (hn : 0 < n) (hh : 0 < h)
    (hd : Primitive (a,(h:ℤ))) (hR : ∀ i ∈ S, RectInUnit (R i))
    (ε : ℤ) (hε : 0 ≤ ε ∧ ε < 2) :
    lineLatticeSupport S (fun i => (R i).swap) (normY n (gridEmbed p)) ((h:ℝ)/n)
      (normX n (gridEmbed p)-(a:ℝ)/h*normY n (gridEmbed p)) ((a:ℝ)/h) ε ⊆
      gridLineParameters n (gridEmbed p) (a,(h:ℤ)) := by
  intro k hk
  have hs : (0:ℝ)<(h:ℝ)/n := by positivity
  have hp := lineSupport_parity S (fun i => (R i).swap) _ _ _ _ hs ε hε k hk
  obtain ⟨i,hi,hc⟩ := (lineLatticeSupport_complete S (fun i => (R i).swap)
    _ _ _ _ hs ε hε k hp).mp hk
  apply (mem_gridLineParameters n (gridEmbed p) _ hd k).mpr
  apply contains_normalized_inGrid n hn _ (R i) (hR i hi)
  have hc' : (R i).swap.contains (normY n (linePoint (gridEmbed p) (a,(h:ℤ)) k))
      (normX n (linePoint (gridEmbed p) (a,(h:ℤ)) k)) := by
    rw [vertical_normY, vertical_normX n h hn hh]
    exact hc
  exact ⟨hc'.2.2.1,hc'.2.2.2,hc'.1,hc'.2.1⟩

theorem vertical_grid_sum_eq_lattice {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (h : ℕ) (a : ℤ) (hn : 0 < n) (hh : 0 < h)
    (hd : Primitive (a,(h:ℤ))) (hR : ∀ i ∈ S, RectInUnit (R i)) :
    typedGridLineSum S R w p (a,(h:ℤ)) =
      verticalLatticeSumExceptRoot S R (w (parity (gridEmbed p)))
        (normY n (gridEmbed p)) ((h:ℝ)/n)
        (normX n (gridEmbed p)-(a:ℝ)/h*normY n (gridEmbed p)) ((a:ℝ)/h) 0 +
      verticalLatticeSumExceptRoot S R (w (parity (gridEmbed p+(a,(h:ℤ)))))
        (normY n (gridEmbed p)) ((h:ℝ)/n)
        (normX n (gridEmbed p)-(a:ℝ)/h*normY n (gridEmbed p)) ((a:ℝ)/h) 1 := by
  have hs : (0:ℝ)<(h:ℝ)/n := by positivity
  unfold typedGridLineSum
  rw [sum_gridLine_erase_parity_split p (a,(h:ℤ)) hd
    (fun r z => rectangleField S R (w r) (normX n z) (normY n z))]
  rw [verticalLatticeSumExceptRoot_eq, verticalLatticeSumExceptRoot_eq]
  rw [lineSum_eq_filter_sum S (fun i => (R i).swap) _ _ _ _ _ hs 0 (by norm_num) _
      (vertical_support_subset S R p h a hn hh hd hR 0 (by norm_num)),
    lineSum_eq_filter_sum S (fun i => (R i).swap) _ _ _ _ _ hs 1 (by norm_num) _
      (vertical_support_subset S R p h a hn hh hd hR 1 (by norm_num))]
  simp_rw [vertical_normX n h hn hh, vertical_normY, rectangleField_swap]

theorem vertical_G13 {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (h : ℕ) (a : ℤ) (M : ℝ)
    (hn : 0 < n) (hh : 0 < h) (hd : Primitive (a,(h:ℤ)))
    (hR : ∀ i ∈ S, RectInUnit (R i)) (hdis : DisjointRects S R) (hM : 0 ≤ M)
    (hw : ∀ r i, i ∈ S → |w r i| ≤ M) :
    |typedGridLineSum S R w p (a,(h:ℤ)) - ((n:ℝ)/(2*h))*
      (∫ t : ℝ, rectangleField S R (fun i => w (parity (gridEmbed p)) i +
        w (parity (gridEmbed p+(a,(h:ℤ)))) i)
        (normX n (gridEmbed p)-(a:ℝ)/h*normY n (gridEmbed p)+(a:ℝ)/h*t) t)|
      ≤ (4*S.card+1)*M := by
  rw [vertical_grid_sum_eq_lattice S R w p h a hn hh hd hR]
  exact rectangle_G13_vertical_all_slopes S R _ _ _ _ _ M n h hn hh
    (hw _) (hw _) (rectangleField_abs_le S R _ M hM hdis (hw _) _ _)

end NoThreeLine.GridChord

#print axioms NoThreeLine.GridChord.horizontal_support_subset
#print axioms NoThreeLine.GridChord.horizontal_grid_sum_eq_lattice
#print axioms NoThreeLine.GridChord.horizontal_G13
#print axioms NoThreeLine.GridChord.vertical_support_subset
#print axioms NoThreeLine.GridChord.vertical_grid_sum_eq_lattice
#print axioms NoThreeLine.GridChord.vertical_G13
