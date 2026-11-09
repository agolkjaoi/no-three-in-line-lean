import NoThreeLine.FiniteSchedule
import NoThreeLine.TimePairSymmetry
import NoThreeLine.MaskedAreaRiemann

/-! One common finite spatial partition and time partition connect the actual
phase integrals to the verified S6 and area Riemann estimates. Concrete masks,
all accepted boxes, and their phase deadline certificates are not supplied here. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.FinitePhase
open PrimitiveLines FiniteDirections GridArea

theorem maskedField_sum_weights {ι K : Type*} (S : Finset ι) (R : ι → Rect)
    (V H : Finset ℝ) (P : Finset K) (a : K → ℝ) (c : K → ι → ℝ) (x y : ℝ) :
    eraseGrid V H (rectangleField S R (fun i => ∑ j ∈ P, a j*c j i)) x y =
      ∑ j ∈ P, a j*eraseGrid V H (rectangleField S R (c j)) x y := by
  classical
  unfold eraseGrid
  by_cases hb : x ∈ V ∨ y ∈ H
  · simp [hb]
  · simp only [hb,ite_false]
    unfold rectangleField
    simp_rw [Finset.mul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro i hi
    by_cases hc : (R i).contains x y <;> simp [Rect.field,hc]

def Schedule.prefixWeights {J : ℕ} {ι : Type*} (s : Schedule J)
    (c : Fin J → ZPoint → ι → ℝ) (T : ℝ) (r : ZPoint) (i : ι) : ℝ :=
  s.cumulative (fun j => c j r i) T

def Schedule.phaseField {J : ℕ} {ι : Type*} (s : Schedule J) (S : Finset ι) (R : ι → Rect)
    (c : Fin J → ZPoint → ι → ℝ) (V H : Finset ℝ) (r : ZPoint) (t x y : ℝ) : ℝ :=
  s.rate (fun j => eraseGrid V H (rectangleField S R (c j r)) x y) t

theorem Schedule.integral_phaseField {J : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (r : ZPoint) (x y T : ℝ) (hT : 0 ≤ T) :
    (∫ t in (0 : ℝ)..T, s.phaseField S R c V H r t x y) =
      eraseGrid V H (rectangleField S R (s.prefixWeights c T r)) x y := by
  change FinitePhase.cumulative Finset.univ s.lo s.hi _ T = _
  rw [cumulative_eq_sum _ _ _ _ _ hT]
  unfold Schedule.prefixWeights Schedule.cumulative
  simp_rw [cumulative_eq_sum _ _ _ _ _ hT]
  exact (maskedField_sum_weights S R V H Finset.univ _ _ x y).symm

theorem Schedule.integral_phaseBoard {J n : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (q : Grid n) (T : ℝ) (hT : 0 ≤ T) :
    s.cumulative (fun j => maskedTypedBoardWeight S R (c j) V H q) T =
      maskedTypedBoardWeight S R (s.prefixWeights c T) V H q :=
  s.integral_phaseField S R c V H (parity (gridEmbed q))
    (GridChord.normX n (gridEmbed q)) (GridChord.normY n (gridEmbed q)) T hT

theorem Schedule.prefixWeights_bounds {J : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (c : Fin J → ZPoint → ι → ℝ)
    (hc : ∀ j r i, i ∈ S → 0 ≤ c j r i ∧ c j r i ≤ 1)
    (T : ℝ) (hT : 0 ≤ T) (hTs : T ≤ s.total) (r : ZPoint) (i : ι) (hi : i ∈ S) :
    0 ≤ s.prefixWeights c T r i ∧ s.prefixWeights c T r i ≤ s.total := by
  have h := s.cumulative_bounds (fun j => c j r i) (fun j => hc j r i hi) T hT
  exact ⟨h.1,h.2.trans hTs⟩

def Schedule.boardTimeRisk {J n : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (p : Grid n) (T : ℝ) : ℝ :=
  timePairRisk Finset.univ s.lo s.hi
    (fun j => maskedTypedBoardWeight S R (c j) V H) p T

theorem Schedule.boardTimeRisk_eq_terminal {J n : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (p : Grid n) (T : ℝ) (hT : 0 ≤ T) :
    s.boardTimeRisk S R c V H p T =
      normalizedPairSum p (maskedTypedBoardWeight S R (s.prefixWeights c T) V H) := by
  unfold Schedule.boardTimeRisk
  rw [timePairRisk_eq_terminal]
  congr 1
  funext q
  exact s.integral_phaseBoard S R c V H q T hT

/-- S6 is applied once, at the same root deadline in both factors. -/
theorem Schedule.boardTimeRisk_sieve_upper {J n : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (p : Grid n) (T : ℝ) (hT : 0 ≤ T) (hTs : T ≤ s.total)
    (hsep : RectanglesSeparated S R) (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hc : ∀ j r i, i ∈ S → 0 ≤ c j r i ∧ c j r i ≤ 1) (hN : ConcreteSieve.Q ≤ n) :
    s.boardTimeRisk S R c V H p T ≤
      ((76/125 : ℝ)/24)*typedAngularIntegralSum S R (s.prefixWeights c T) V H p*Real.log n +
      ((4*S.card+1)*s.total)^2 + 5*s.total*((4*S.card+1)*s.total) + 10*s.total^2 +
      6*25586*(4*(S.card : ℝ)+3)*s.total^2 := by
  rw [s.boardTimeRisk_eq_terminal S R c V H p T hT]
  exact masked_board_sieve_upper S R (s.prefixWeights c T) V H p s.total s.total_nonneg
    hsep (s.prefixWeights_bounds S c hc T hT hTs) hR hN

/-- The true four-type area of the cumulative actual masked field. -/
def Schedule.areaMass {J : ℕ} {ι : Type*} (s : Schedule J) (S : Finset ι) (R : ι → Rect)
    (c : Fin J → ZPoint → ι → ℝ) (V H : Finset ℝ) : ℝ :=
  (1/4 : ℝ)*maskedTypedAreaIntegralSum S R (s.prefixWeights c s.total) V H

theorem Schedule.terminal_type_area_eq {J : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (r : ZPoint) :
    (∫ z : ℝ × ℝ, eraseGrid V H (rectangleField S R (s.prefixWeights c s.total r)) z.1 z.2) =
      ∑ j : Fin J, s.duration j*
        (∫ z : ℝ × ℝ, eraseGrid V H (rectangleField S R (c j r)) z.1 z.2) := by
  simp_rw [eraseGrid_plane_integral_eq,rectangleField_plane_integral,
    Schedule.prefixWeights,s.cumulative_total,Finset.sum_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro j hj
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  ring

/-- Exact phase arithmetic for the actual cumulative area, with union semantics
provided by the disjoint common cells rather than overlapping box counts. -/
theorem Schedule.areaMass_eq_phase_sum {J : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ) (V H : Finset ℝ) :
    s.areaMass S R c V H = ∑ j : Fin J,
      s.duration j*((1/4 : ℝ)*maskedTypedAreaIntegralSum S R (c j) V H) := by
  unfold Schedule.areaMass maskedTypedAreaIntegralSum
  simp_rw [s.terminal_type_area_eq S R c V H]
  rw [Finset.sum_comm]
  simp_rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  apply Finset.sum_congr rfl
  intro r hr
  ring

/-- No extra elapsed-time factor multiplies this terminal prefix. -/
theorem Schedule.normalized_board_mass_error {J n : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (hn : 0 < n) (hsep : RectanglesSeparated S R)
    (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hc : ∀ j r i, i ∈ S → 0 ≤ c j r i ∧ c j r i ≤ 1) :
    |(∑ q : Grid n, s.cumulative (fun j => maskedTypedBoardWeight S R (c j) V H q) s.total)/
      (n : ℝ)^2 - s.areaMass S R c V H| ≤
        s.total*(12*(S.card : ℝ)+(V.card : ℝ)+(H.card : ℝ))/(n : ℝ) := by
  simp_rw [s.integral_phaseBoard S R c V H _ s.total s.total_nonneg]
  exact masked_board_normalized_area_error n S R (s.prefixWeights c s.total) V H s.total
    hn s.total_nonneg hsep hR (s.prefixWeights_bounds S c hc s.total s.total_nonneg le_rfl)

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.Schedule.boardTimeRisk_sieve_upper
#print axioms NoThreeLine.FinitePhase.Schedule.normalized_board_mass_error
