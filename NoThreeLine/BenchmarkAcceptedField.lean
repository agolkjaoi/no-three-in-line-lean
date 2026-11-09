import NoThreeLine.AcceptedPhasePacket
import NoThreeLine.BenchmarkRiskMonotone

/-! The actual accepted-mask prefix is a finite rectangle field after common
grid erasure. Each normalized output box is retained with its phase index;
overlaps between different phases add with the actual elapsed duration.
No reference-prefix domination or numerical risk estimate is assumed here. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.BenchmarkAccepted
open FinitePhase

abbrev OutputIndex {J G L : ℕ} (a : Fin J → CheckedAcceptedPhase G L) :=
  (j : Fin J) × Fin (a j).outCount

def outputRect {J G L : ℕ} (a : Fin J → CheckedAcceptedPhase G L)
    (z : OutputIndex a) : Rect :=
  (((a z.1).output z.2).qrect G).real

def prefixWeight {J G L : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase G L) (T : ℝ) (r : Fin 4)
    (z : OutputIndex a) : ℝ :=
  if r=(a z.1).phase.rootType then elapsed (s.lo z.1) (s.hi z.1) T else 0

theorem prefixWeight_nonneg {J G L : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase G L) (T : ℝ) (r : Fin 4)
    (z : OutputIndex a) : 0 ≤ prefixWeight s a T r z := by
  unfold prefixWeight
  split_ifs
  · exact le_max_left _ _
  · exact le_rfl

theorem mask_eq_output {G L : ℕ} (a : CheckedAcceptedPhase G L)
    (hG : 0<G) (r : Fin 4) (x y : ℝ) :
    a.phase.mask G (commonGridLines G) (commonGridLines G) r x y =
      eraseGrid (commonGridLines G) (commonGridLines G)
        (rectangleField Finset.univ (fun i => ((a.output i).qrect G).real)
          (fun _ => if r=a.phase.rootType then 1 else 0)) x y := by
  classical
  have he := qUnionNormalizationCheck_mask
    (fun i => ((phaseImageBoxes G L a.phase.sx a.phase.sy a.phase.leaves) i).qrect G)
    (fun i => (a.output i).qrect G) a.cover a.source
    (gridUnionCheck_sound G hG _ _ a.cover a.source a.checked)
    (commonGridLines G) (commonGridLines G)
    (fun i => (a.output i).endpoints_commonGrid G
      (gridUnionCheck_valid G _ _ a.cover a.source a.checked i))
  by_cases hr : r=a.phase.rootType
  · simpa only [AcceptedPhase.mask,if_pos hr] using congrFun (congrFun he x) y
  · simp [AcceptedPhase.mask,hr,eraseGrid,rectangleField,Rect.field]

theorem acceptedPrefix_eq_outputField {J G L : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase G L) (hG : 0<G)
    (T : ℝ) (hT : 0≤T) (r : Fin 4) (x y : ℝ) :
    s.acceptedPrefix (fun j => (a j).phase) G (commonGridLines G)
        (commonGridLines G) T r x y =
      eraseGrid (commonGridLines G) (commonGridLines G)
        (rectangleField Finset.univ (outputRect a) (prefixWeight s a T r)) x y := by
  classical
  unfold Schedule.acceptedPrefix Schedule.cumulative
  rw [cumulative_eq_sum _ _ _ _ _ hT]
  simp_rw [mask_eq_output _ hG]
  by_cases hb : x∈commonGridLines G ∨ y∈commonGridLines G
  · simp [eraseGrid,hb]
  · simp only [eraseGrid,if_neg hb]
    unfold rectangleField
    rw [Fintype.sum_sigma]
    apply Finset.sum_congr rfl
    intro j hj
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i hi
    by_cases hr : r=(a j).phase.rootType
    <;> by_cases hc : (((a j).output i).qrect G).real.contains x y
    <;> simp [Rect.field,outputRect,prefixWeight,hr,hc]

theorem erased_rectangleField_add {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w v : ι → ℝ) (V H : Finset ℝ) (x y : ℝ) :
    eraseGrid V H (rectangleField S R (fun i => w i+v i)) x y =
      eraseGrid V H (rectangleField S R w) x y+
        eraseGrid V H (rectangleField S R v) x y := by
  classical
  by_cases hb : x∈V ∨ y∈H
  · simp [eraseGrid,hb]
  · simp only [eraseGrid,if_neg hb]
    unfold rectangleField
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i hi
    by_cases hc : (R i).contains x y <;> simp [Rect.field,hc]

theorem acceptedPairPrefix_eq_outputField {J G L : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase G L) (hG : 0<G)
    (T : ℝ) (hT : 0≤T) (r q : Fin 4) (x y : ℝ) :
    s.acceptedPrefix (fun j => (a j).phase) G (commonGridLines G)
        (commonGridLines G) T r x y+
      s.acceptedPrefix (fun j => (a j).phase) G (commonGridLines G)
        (commonGridLines G) T q x y =
      eraseGrid (commonGridLines G) (commonGridLines G)
        (rectangleField Finset.univ (outputRect a)
          (fun z => prefixWeight s a T r z+prefixWeight s a T q z)) x y := by
  rw [erased_rectangleField_add,acceptedPrefix_eq_outputField _ _ hG _ hT,
    acceptedPrefix_eq_outputField _ _ hG _ hT]

end NoThreeLine.BenchmarkAccepted

#print axioms NoThreeLine.BenchmarkAccepted.acceptedPrefix_eq_outputField
#print axioms NoThreeLine.BenchmarkAccepted.acceptedPairPrefix_eq_outputField
