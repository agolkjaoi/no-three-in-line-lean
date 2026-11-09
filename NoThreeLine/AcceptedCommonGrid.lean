import NoThreeLine.AcceptedPhasePacket
import NoThreeLine.CoarseReferenceGrid
import NoThreeLine.ScheduleTypeCode

/-! Actual accepted masks are dominated by a single separated 128 by 128
cell family.  Coefficients come from the deduplicated source orbit and the
actual parity label.  This supplies phase domination internally to S6;
the external compressed certificate-prefix identity remains separate. -/
set_option autoImplicit false
open MeasureTheory
noncomputable section
namespace NoThreeLine
open PrimitiveLines FiniteDirections GridChord

def AcceptedPhase.sourcePoint (a : AcceptedPhase 8) (hx : a.sx < 128) (hy : a.sy < 128) :
    Grid 128 := (⟨a.sx,hx⟩,⟨a.sy,hy⟩)

def AcceptedPhase.commonTypeWeight (a : AcceptedPhase 8)
    (hx : a.sx < 128) (hy : a.sy < 128) (r : Fin 4) (cell : Grid 128) : ℝ :=
  if r=a.rootType then coarseOrbitWeight (a.sourcePoint hx hy) cell else 0

def AcceptedPhase.commonWeight (a : AcceptedPhase 8)
    (hx : a.sx < 128) (hy : a.sy < 128) (r : ZPoint) : Grid 128 → ℝ :=
  a.commonTypeWeight hx hy (GridArea.codeZ r)

theorem AcceptedPhase.commonWeight_bounds (a : AcceptedPhase 8)
    (hx : a.sx < 128) (hy : a.sy < 128) (r : ZPoint) (cell : Grid 128) :
    0 ≤ a.commonWeight hx hy r cell ∧ a.commonWeight hx hy r cell ≤ 1 := by
  unfold commonWeight commonTypeWeight
  split_ifs
  · exact coarseOrbitWeight_bounds _ _
  · norm_num

theorem AcceptedPhase.coarseMask_eq_commonField (a : AcceptedPhase 8)
    (hx : a.sx < 128) (hy : a.sy < 128) (r : Fin 4) (x y : ℝ) :
    a.coarseMask 32768 (commonGridLines 32768) (commonGridLines 32768) r x y =
    eraseGrid (commonGridLines 32768) (commonGridLines 32768)
      (rectangleField Finset.univ coarseGridRect (a.commonTypeWeight hx hy r)) x y := by
  by_cases hr : r=a.rootType
  · have he := congrFun (congrFun (coarseUnion_eq_commonField (a.sourcePoint hx hy)) x) y
    have hw : a.commonTypeWeight hx hy r = coarseOrbitWeight (a.sourcePoint hx hy) := by
      funext cell
      exact if_pos hr
    unfold AcceptedPhase.coarseMask
    rw [if_pos hr, hw]
    exact he
  · simp [AcceptedPhase.coarseMask, AcceptedPhase.commonTypeWeight, hr,
      rectangleField, Rect.field, eraseGrid]

theorem AcceptedPhase.mask_le_commonField (a : AcceptedPhase 8)
    (hx : a.sx < 128) (hy : a.sy < 128) (r : Fin 4) (x y : ℝ) :
    a.mask 32768 (commonGridLines 32768) (commonGridLines 32768) r x y ≤
    eraseGrid (commonGridLines 32768) (commonGridLines 32768)
      (rectangleField Finset.univ coarseGridRect (a.commonTypeWeight hx hy r)) x y := by
  rw [← a.coarseMask_eq_commonField hx hy r x y]
  exact a.mask_le_coarse 32768 (by decide) _ _ r x y

def AcceptedPhase.boardInput {n : ℕ} (a : AcceptedPhase 8) (q : Grid n) : ℝ :=
  a.mask 32768 (commonGridLines 32768) (commonGridLines 32768)
    (GridArea.typeCode (GridArea.pointType q)) (normX n (gridEmbed q)) (normY n (gridEmbed q))

theorem AcceptedPhase.boardInput_nonneg {n : ℕ} (a : AcceptedPhase 8) (q : Grid n) :
    0 ≤ a.boardInput q := (a.mask_bounds _ _ _ _ _ _).1

theorem AcceptedPhase.boardInput_le_common {n : ℕ} (a : AcceptedPhase 8)
    (hx : a.sx < 128) (hy : a.sy < 128) (q : Grid n) :
    a.boardInput q ≤ maskedTypedBoardWeight Finset.univ coarseGridRect
      (a.commonWeight hx hy) (commonGridLines 32768) (commonGridLines 32768) q := by
  unfold boardInput maskedTypedBoardWeight commonWeight
  rw [GridArea.codeZ_grid_parity]
  exact a.mask_le_commonField hx hy _ _ _

namespace FinitePhase

theorem Schedule.accepted_inputDeadline_upper {J n : ℕ} (s : Schedule J)
    (a : Fin J → AcceptedPhase 8) (hx : ∀ j, (a j).sx < 128) (hy : ∀ j, (a j).sy < 128)
    (p : Grid n) (hN : ConcreteSieve.Q ≤ n) :
    timePairRisk Finset.univ s.lo s.hi (fun j => (a j).boardInput) p
      (s.deadline (fun j => (a j).boardInput p)) ≤
    ((76/125 : ℝ)/24)*typedAngularIntegralSum Finset.univ coarseGridRect
      (s.prefixWeights (fun j => (a j).commonWeight (hx j) (hy j))
        (s.deadline (fun j => (a j).boardInput p)))
      (commonGridLines 32768) (commonGridLines 32768) p*Real.log n +
      ((4*(Finset.univ : Finset (Grid 128)).card+1)*s.total)^2 +
      5*s.total*((4*(Finset.univ : Finset (Grid 128)).card+1)*s.total) + 10*s.total^2 +
      6*25586*(4*((Finset.univ : Finset (Grid 128)).card : ℝ)+3)*s.total^2 := by
  exact s.dominated_inputDeadline_upper (fun j => (a j).boardInput) Finset.univ
    coarseGridRect (fun j => (a j).commonWeight (hx j) (hy j))
    (commonGridLines 32768) (commonGridLines 32768)
    (fun j q => (a j).boardInput_nonneg q)
    (fun j q => (a j).boardInput_le_common (hx j) (hy j) q) p
    coarseGridRect_separated (fun i _ => coarseGridRect_inUnit i)
    (fun j r i _ => (a j).commonWeight_bounds (hx j) (hy j) r i) hN

end FinitePhase
end NoThreeLine

#print axioms NoThreeLine.AcceptedPhase.coarseMask_eq_commonField
#print axioms NoThreeLine.FinitePhase.Schedule.accepted_inputDeadline_upper
