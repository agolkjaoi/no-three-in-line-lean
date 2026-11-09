import NoThreeLine.DyadicPhaseContainment
import NoThreeLine.ScheduleInputDomination

/-! Literal accepted phase data have a mask constructed from their dyadic
leaves. Their actual cumulative input is dominated by the corresponding
coarse-source prefix at every time. Equality to an externally compressed
certificate reference field is deliberately not asserted here. -/
set_option autoImplicit false
open MeasureTheory Set
noncomputable section
namespace NoThreeLine

structure AcceptedPhase (L : ℕ) where
  count : ℕ
  sx : ℕ
  sy : ℕ
  rootType : Fin 4
  leaves : Fin count → DyadicLeaf
  valid : ∀ i, (leaves i).Valid L

def AcceptedPhase.mask {L : ℕ} (a : AcceptedPhase L) (G : ℕ)
    (V H : Finset ℝ) (r : Fin 4) (x y : ℝ) : ℝ :=
  if r=a.rootType then rectangleUnionMask Finset.univ
    (fun i => ((phaseImageBoxes G L a.sx a.sy a.leaves i).qrect G).real) V H x y else 0

def AcceptedPhase.coarseMask {L : ℕ} (a : AcceptedPhase L) (G : ℕ)
    (V H : Finset ℝ) (r : Fin 4) (x y : ℝ) : ℝ :=
  if r=a.rootType then rectangleUnionMask Finset.univ
    (fun f => ((phaseCoarseBoxes G L a.sx a.sy f).qrect G).real) V H x y else 0

theorem AcceptedPhase.mask_bounds {L : ℕ} (a : AcceptedPhase L) (G : ℕ)
    (V H : Finset ℝ) (r : Fin 4) (x y : ℝ) :
    0 ≤ a.mask G V H r x y ∧ a.mask G V H r x y ≤ 1 := by
  unfold AcceptedPhase.mask
  split_ifs
  · exact rectangleUnionMask_bounds _ _ _ _ _ _
  · exact ⟨le_rfl,zero_le_one⟩

theorem AcceptedPhase.mask_le_coarse {L : ℕ} (a : AcceptedPhase L) (G : ℕ)
    (hG : 0 < G) (V H : Finset ℝ) (r : Fin 4) (x y : ℝ) :
    a.mask G V H r x y ≤ a.coarseMask G V H r x y := by
  unfold AcceptedPhase.mask AcceptedPhase.coarseMask
  split_ifs
  · exact phaseUnionMask_le_coarse G L a.sx a.sy hG a.leaves a.valid V H x y
  · exact le_rfl

namespace FinitePhase

def Schedule.acceptedPrefix {J L : ℕ} (s : Schedule J) (a : Fin J → AcceptedPhase L)
    (G : ℕ) (V H : Finset ℝ) (T : ℝ) (r : Fin 4) (x y : ℝ) : ℝ :=
  s.cumulative (fun j => (a j).mask G V H r x y) T

def Schedule.coarseAcceptedPrefix {J L : ℕ} (s : Schedule J) (a : Fin J → AcceptedPhase L)
    (G : ℕ) (V H : Finset ℝ) (T : ℝ) (r : Fin 4) (x y : ℝ) : ℝ :=
  s.cumulative (fun j => (a j).coarseMask G V H r x y) T

theorem Schedule.acceptedPrefix_bounds {J L : ℕ} (s : Schedule J)
    (a : Fin J → AcceptedPhase L) (G : ℕ) (V H : Finset ℝ) (T : ℝ) (hT : 0 ≤ T)
    (r : Fin 4) (x y : ℝ) :
    0 ≤ s.acceptedPrefix a G V H T r x y ∧ s.acceptedPrefix a G V H T r x y ≤ T :=
  s.cumulative_bounds _ (fun j => (a j).mask_bounds G V H r x y) T hT

theorem Schedule.acceptedPrefix_le_coarse {J L : ℕ} (s : Schedule J)
    (a : Fin J → AcceptedPhase L) (G : ℕ) (hG : 0 < G)
    (V H : Finset ℝ) (T : ℝ) (hT : 0 ≤ T) (r : Fin 4) (x y : ℝ) :
    s.acceptedPrefix a G V H T r x y ≤ s.coarseAcceptedPrefix a G V H T r x y :=
  s.cumulative_mono _ _ (fun j => (a j).mask_le_coarse G hG V H r x y) T hT

end FinitePhase
end NoThreeLine

#print axioms NoThreeLine.FinitePhase.Schedule.acceptedPrefix_le_coarse
