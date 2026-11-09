import NoThreeLine.FrozenReferenceTables
import NoThreeLine.AcceptedCommonGrid

/-! The common literal reference tables supply the coarse phase field.
Matching only source/type/units is sufficient for geometric domination:
the accepted union itself remains the checked union from the actual phase.
This is not yet an identity with the external compressed certificate arrays. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.FrozenReference
open FinitePhase PrimitiveLines

def phasePoint (j : Fin 15348) : Grid 128 :=
  (⟨(phaseSource j).1, (phaseSource_bounds j).1⟩,
   ⟨(phaseSource j).2, (phaseSource_bounds j).2⟩)

def phaseTypeWeight (j : Fin 15348) (r : Fin 4) (cell : Grid 128) : ℝ :=
  if r = rootType j then coarseOrbitWeight (phasePoint j) cell else 0

def phaseWeight (j : Fin 15348) (r : ZPoint) : Grid 128 → ℝ :=
  phaseTypeWeight j (GridArea.codeZ r)

def referenceMask (j : Fin 15348) (r : Fin 4) (x y : ℝ) : ℝ :=
  eraseGrid (commonGridLines 32768) (commonGridLines 32768)
    (rectangleField Finset.univ coarseGridRect (phaseTypeWeight j r)) x y

theorem PhaseMatches.commonTypeWeight_eq (a : CheckedAcceptedPhase 32768 8)
    (j : Fin 15348) (h : PhaseMatches a j)
    (hx : a.phase.sx < 128) (hy : a.phase.sy < 128) :
    a.phase.commonTypeWeight hx hy = phaseTypeWeight j := by
  have hp : a.phase.sourcePoint hx hy = phasePoint j := by
    apply Prod.ext <;> apply Fin.ext
    · exact h.2.2.2.1
    · exact h.2.2.2.2
  funext r cell
  unfold AcceptedPhase.commonTypeWeight phaseTypeWeight
  rw [h.2.2.1, hp]

theorem PhaseMatches.coarseMask_eq_reference (a : CheckedAcceptedPhase 32768 8)
    (j : Fin 15348) (h : PhaseMatches a j) (r : Fin 4) (x y : ℝ) :
    a.phase.coarseMask 32768 (commonGridLines 32768) (commonGridLines 32768) r x y =
      referenceMask j r x y := by
  have hb := h.source_bounds a j
  rw [a.phase.coarseMask_eq_commonField hb.1 hb.2 r x y,
    h.commonTypeWeight_eq a j hb.1 hb.2]
  rfl

theorem PhaseMatches.mask_le_reference (a : CheckedAcceptedPhase 32768 8)
    (j : Fin 15348) (h : PhaseMatches a j) (r : Fin 4) (x y : ℝ) :
    a.phase.mask 32768 (commonGridLines 32768) (commonGridLines 32768) r x y ≤
      referenceMask j r x y := by
  rw [← h.coarseMask_eq_reference a j r x y]
  exact a.phase.mask_le_coarse 32768 (by decide) _ _ r x y

def referencePrefix {J : ℕ} (s : Schedule J) (index : Fin J → Fin 15348)
    (T : ℝ) (r : Fin 4) (x y : ℝ) : ℝ :=
  s.cumulative (fun k => referenceMask (index k) r x y) T

theorem coarseAcceptedPrefix_eq_reference {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀ k, PhaseMatches (a k) (index k)) (T : ℝ) (r : Fin 4) (x y : ℝ) :
    s.coarseAcceptedPrefix (fun k => (a k).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) T r x y =
      referencePrefix s index T r x y := by
  unfold Schedule.coarseAcceptedPrefix referencePrefix
  apply congrArg (fun f => s.cumulative f T)
  funext k
  exact (hm k).coarseMask_eq_reference (a k) (index k) r x y

theorem acceptedPrefix_le_reference {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀ k, PhaseMatches (a k) (index k)) (T : ℝ) (hT : 0 ≤ T)
    (r : Fin 4) (x y : ℝ) :
    s.acceptedPrefix (fun k => (a k).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) T r x y ≤
      referencePrefix s index T r x y := by
  unfold Schedule.acceptedPrefix referencePrefix
  exact s.cumulative_mono _ _ (fun k => (hm k).mask_le_reference (a k) (index k) r x y) T hT

end NoThreeLine.FrozenReference

#print axioms NoThreeLine.FrozenReference.acceptedPrefix_le_reference
