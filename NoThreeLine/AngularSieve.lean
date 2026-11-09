import NoThreeLine.AngularChartsBV
import NoThreeLine.ConcreteSieve

/-! Concrete finite-sieve estimates applied to actual squared rectangle chords.
This module does not identify the chart sums with all primitive lattice directions. -/
set_option autoImplicit false
noncomputable section
open Set MeasureTheory
open scoped BigOperators Interval

namespace NoThreeLine

def angularSquare {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (f : Fin 4) (V H : Finset ℝ) (x y u : ℝ) : ℝ :=
  (directionalChord f (eraseGrid V H (rectangleField S R w)) x y u)^2

/-- A concrete FS1 bound with all BV and amplitude inputs proved from the cells. -/
theorem angular_primitiveParityK_upper {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (f : Fin 4) (V H : Finset ℝ)
    (M x y : ℝ) (N ε η : ℕ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hN : ConcreteSieve.Q ≤ N) (hε : ε ≤ 1) (hη : η ≤ 1) :
    primitiveParityK N ε η (angularSquare S R w f V H x y) ≤
      (76/375 : ℝ) * (∫ u in (0 : ℝ)..1, angularSquare S R w f V H x y u) * Real.log N +
        25586*(4*(S.card : ℝ)+3)*M^2 := by
  have hBV := erased_directionalChord_square_boundedVariationOn S R w f V H M x y hM hsep hw hR
  have hbound := fun u (_ : u ∈ Icc (0 : ℝ) 1) =>
    erased_directionalChord_square_bounds S R w f V H M x y u hM hsep hw hR
  have hbase := ConcreteSieve.concrete_finite_sieve_BV_upper_bound N ε η
    (angularSquare S R w f V H x y) (M^2) hN hε hη hBV hbound
  have hv := erased_directionalChord_square_variation_real S R w f V H M x y hM hsep hw hR
  apply hbase.trans
  apply add_le_add (le_refl _)
  change 25586*(M^2+(eVariationOn
    (fun u => (directionalChord f (eraseGrid V H (rectangleField S R w)) x y u)^2)
    (Icc (0 : ℝ) 1)).toReal) ≤ _
  calc
    _ ≤ 25586*(M^2+(4*(S.card : ℝ)+2)*M^2) :=
      mul_le_mul_of_nonneg_left (add_le_add (le_refl _) hv) (by norm_num)
    _ = _ := by ring

def pairAngularSquare {ι : Type*} (S : Finset ι) (R : ι → Rect) (w w' : ι → ℝ)
    (f : Fin 4) (V H : Finset ℝ) (x y u : ℝ) : ℝ :=
  (directionalChord f (eraseGrid V H
    (fun a b => rectangleField S R w a b + rectangleField S R w' a b)) x y u)^2

theorem pairAngularSquare_eq_add_weights {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w w' : ι → ℝ) (f : Fin 4) (V H : Finset ℝ) (x y : ℝ) :
    pairAngularSquare S R w w' f V H x y =
      angularSquare S R (fun i => w i+w' i) f V H x y := by
  unfold pairAngularSquare angularSquare
  rw [rectangleField_add_weights]

theorem pairAngular_primitiveParityK_upper {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w w' : ι → ℝ) (f : Fin 4) (V H : Finset ℝ)
    (M x y : ℝ) (N ε η : ℕ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R)
    (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M) (hw' : ∀ i ∈ S, 0 ≤ w' i ∧ w' i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hN : ConcreteSieve.Q ≤ N) (hε : ε ≤ 1) (hη : η ≤ 1) :
    primitiveParityK N ε η (pairAngularSquare S R w w' f V H x y) ≤
      (76/375 : ℝ) * (∫ u in (0 : ℝ)..1, pairAngularSquare S R w w' f V H x y u) * Real.log N +
        4*25586*(4*(S.card : ℝ)+3)*M^2 := by
  have hww : ∀ i ∈ S, 0 ≤ w i+w' i ∧ w i+w' i ≤ 2*M := by
    intro i hi
    have h1 := hw i hi
    have h2 := hw' i hi
    constructor <;> linarith
  have hb := angular_primitiveParityK_upper S R (fun i => w i+w' i) f V H
    (2*M) x y N ε η (by positivity) hsep hww hR hN hε hη
  rw [pairAngularSquare_eq_add_weights]
  convert hb using 1
  ring

/-- The three partner fields and four charts give twelve nonnegative direction sums.
Parity labels are arbitrary binary labels; the geometric lattice reindexing is separate. -/
theorem twelve_pair_angular_sieve_upper {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (partners : Fin 3 → ι → ℝ)
    (V H : Finset ℝ) (M x y : ℝ) (N : ℕ)
    (ε η : Fin 4 × Fin 3 → ℕ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hpartners : ∀ j i, i ∈ S → 0 ≤ partners j i ∧ partners j i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) (hN : ConcreteSieve.Q ≤ N)
    (hε : ∀ z, ε z ≤ 1) (hη : ∀ z, η z ≤ 1) :
    (1/8 : ℝ) * (∑ z : Fin 4 × Fin 3, primitiveParityK N (ε z) (η z)
      (pairAngularSquare S R w (partners z.2) z.1 V H x y)) ≤
    ((76/125 : ℝ)/24) *
      (∑ z : Fin 4 × Fin 3, ∫ u in (0 : ℝ)..1,
        pairAngularSquare S R w (partners z.2) z.1 V H x y u) * Real.log N +
      6*25586*(4*(S.card : ℝ)+3)*M^2 := by
  have hsum := Finset.sum_le_sum (s := (Finset.univ : Finset (Fin 4 × Fin 3)))
    (fun z _ => pairAngular_primitiveParityK_upper S R w (partners z.2) z.1 V H
      M x y N (ε z) (η z) hM hsep hw (hpartners z.2) hR hN (hε z) (hη z))
  apply (mul_le_mul_of_nonneg_left hsum (by norm_num : (0 : ℝ) ≤ 1/8)).trans_eq
  rw [Finset.sum_add_distrib,Finset.sum_const,← Finset.sum_mul,← Finset.mul_sum]
  simp only [Finset.card_univ,Fintype.card_prod,Fintype.card_fin,nsmul_eq_mul]
  norm_num
  ring

end NoThreeLine

#print axioms NoThreeLine.angular_primitiveParityK_upper
#print axioms NoThreeLine.pairAngular_primitiveParityK_upper
#print axioms NoThreeLine.twelve_pair_angular_sieve_upper
