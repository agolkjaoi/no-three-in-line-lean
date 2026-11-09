import NoThreeLine.FiniteCollinearPairs
import NoThreeLine.FiniteDirectionError
import NoThreeLine.GridChordEstimate
import NoThreeLine.AngularChartsBV

/-! The finite direction error is instantiated with actual parity-typed
board weights and actual rectangle-field chords. Neither G13 nor a chord
cap is a hypothesis of the final theorem. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FiniteDirections
open PrimitiveLines GridChord

def typedBoardWeight {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (q : Grid n) : ℝ :=
  rectangleField S R (w (parity (gridEmbed q)))
    (normX n (gridEmbed q)) (normY n (gridEmbed q))

def directionPairWeight {ι : Type*} {n : ℕ} (w : ZPoint → ι → ℝ)
    (p : Grid n) (d : ZPoint) (i : ι) : ℝ :=
  w (parity (gridEmbed p)) i + w (parity (gridEmbed p+d)) i

def shellChord {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (d : Σ _h : ℕ, ZPoint) : ℝ :=
  if d.2.1 = (d.1 : ℤ) then
    directionalChord 0 (rectangleField S R (directionPairWeight w p d.2))
      (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((d.2.2 : ℝ)/(d.1 : ℝ))
  else
    directionalChord 2 (rectangleField S R (directionPairWeight w p d.2))
      (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((d.2.1 : ℝ)/(d.1 : ℝ))

theorem fieldChord_eq_directional_zero {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (x y u : ℝ) :
    fieldChord S R w x y u = directionalChord 0 (rectangleField S R w) x y u := by
  change (∫ t : ℝ, rectangleField S R w t (y-u*x+u*t)) =
    ∫ t : ℝ, rectangleField S R w t (y+u*(t-x))
  congr 1
  funext t
  congr 1
  ring

theorem shellChord_G13 {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (d : Σ _h : ℕ, ZPoint) (M : ℝ)
    (hd : d ∈ directionIndices n) (hn : 0 < n)
    (hR : ∀ i ∈ S, RectInUnit (R i)) (hdis : DisjointRects S R) (hM : 0 ≤ M)
    (hw : ∀ r i, i ∈ S → |w r i| ≤ M) :
    |typedGridLineSum S R w p d.2 - (n : ℝ)/(2*(d.1 : ℝ))*shellChord S R w p d| ≤
      (4*S.card+1)*M := by
  classical
  have hh := (Finset.mem_Ico.mp (Finset.mem_sigma.mp hd).1).1
  have hparts := Finset.mem_filter.mp (Finset.mem_sigma.mp hd).2
  have hs := (mem_rawShell d.1 d.2).mp hparts.1
  by_cases hx : d.2.1 = (d.1 : ℤ)
  · have he : d.2 = ((d.1 : ℤ),d.2.2) := Prod.ext hx rfl
    have hg := horizontal_G13 S R w p d.1 d.2.2 M hn hh (by rw [← he]; exact hparts.2)
      hR hdis hM hw
    rw [fieldChord_eq_directional_zero] at hg
    simp only [shellChord,if_pos hx,directionPairWeight]
    rw [he]
    exact hg
  · have hy : d.2.2 = (d.1 : ℤ) := by rcases hs with hs | hs; exact (hx hs.1).elim; exact hs.1
    have he : d.2 = (d.2.1,(d.1 : ℤ)) := Prod.ext rfl hy
    have hg := vertical_G13 S R w p d.1 d.2.1 M hn hh (by rw [← he]; exact hparts.2)
      hR hdis hM hw
    have hv (ww : ι → ℝ) (x y u : ℝ) :
        (∫ t : ℝ, rectangleField S R ww (x-u*y+u*t) t) =
          directionalChord 2 (rectangleField S R ww) x y u := by
      change (∫ t : ℝ, rectangleField S R ww (x-u*y+u*t) t) =
        ∫ t : ℝ, rectangleField S R ww (x+u*(t-y)) t
      congr 1
      funext t
      congr 1
      ring
    rw [hv] at hg
    simp only [shellChord,if_neg hx,directionPairWeight]
    rw [he]
    exact hg

theorem shellChord_square_cap {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (d : Σ _h : ℕ, ZPoint) (M : ℝ)
    (hM : 0 ≤ M) (hsep : RectanglesSeparated S R)
    (hw : ∀ r i, i ∈ S → 0 ≤ w r i ∧ w r i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    (shellChord S R w p d)^2 ≤ 4*M^2 := by
  have hwp : ∀ i ∈ S, 0 ≤ directionPairWeight w p d.2 i ∧ directionPairWeight w p d.2 i ≤ 2*M := by
    intro i hi
    have h1 := hw (parity (gridEmbed p)) i hi
    have h2 := hw (parity (gridEmbed p+d.2)) i hi
    dsimp [directionPairWeight]
    constructor <;> linarith
  unfold shellChord
  split_ifs
  · have hb := (directionalChord_square_bounds S R _ 0 (2*M)
      (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((d.2.2 : ℝ)/(d.1 : ℝ))
      (by positivity) hsep hwp hR).2
    nlinarith
  · have hb := (directionalChord_square_bounds S R _ 2 (2*M)
      (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((d.2.1 : ℝ)/(d.1 : ℝ))
      (by positivity) hsep hwp hR).2
    nlinarith

/-- A true finite-board pair bound. The error is smaller than the safe
`E^2+5*M*E+10*M^2`; the two axis main terms are still present here. -/
theorem typed_collinear_pair_bound {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (p : Grid n) (M : ℝ) (hn : 0 < n)
    (hM : 0 ≤ M) (hsep : RectanglesSeparated S R)
    (hw : ∀ r i, i ∈ S → 0 ≤ w r i ∧ w r i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    normalizedPairSum p (typedBoardWeight S R w) ≤
      (1/8 : ℝ)*(∑ d ∈ directionIndices n, (shellChord S R w p d)^2/(d.1 : ℝ)^2) +
        ((4*S.card+1)*M)^2 + 4*M*((4*S.card+1)*M) := by
  have hnonneg (q : Grid n) : 0 ≤ typedBoardWeight S R w q :=
    (rectangleField_point_bounds S R _ M _ _ hM hsep (hw _) ).1
  apply (normalizedPairSum_le p (typedBoardWeight S R w) hnonneg).trans
  apply finite_direction_square_error n (fun d => lineWeight p d.2 (typedBoardWeight S R w))
    (shellChord S R w p) M ((4*S.card+1)*M) hn hM (by positivity)
  · intro d hd
    exact shellChord_square_cap S R w p d M hM hsep hw hR
  · intro d hd
    exact shellChord_G13 S R w p d M hd hn
      (fun i hi => ⟨(hR i hi).1,(hR i hi).2.2.1,(hR i hi).2.2.2.1,(hR i hi).2.2.2.2.2⟩)
      (fun i hi j hj hij x y => (R i).separated_not_both_contains (R j) x y (hsep i hi j hj hij))
      hM (fun r i hi => by rw [abs_of_nonneg (hw r i hi).1]; exact (hw r i hi).2)

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.shellChord_G13
#print axioms NoThreeLine.FiniteDirections.typed_collinear_pair_bound
