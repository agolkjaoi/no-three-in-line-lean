import NoThreeLine.FiniteDurationSchedule

/-! Refine an exposure phase into binary phases by using the successive
differences of its sorted positive exposure levels as durations. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section

namespace NoThreeLine481
open NoThreeLine.FinitePhase

structure ThresholdLayer where
  threshold : ℝ
  duration : ℝ

def thresholdLayers (base : ℝ) : List ℝ → List ThresholdLayer
  | [] => []
  | w :: ws => ⟨w,w-base⟩ :: thresholdLayers w ws

def layerMask (weight : ℝ) (layer : ThresholdLayer) : ℝ :=
  if layer.threshold ≤ weight then 1 else 0

theorem layerMask_binary (weight : ℝ) (layer : ThresholdLayer) :
    layerMask weight layer = 0 ∨ layerMask weight layer = 1 := by
  unfold layerMask
  split_ifs <;> simp

theorem layer_duration_pos (base : ℝ) (levels : List ℝ)
    (ordered : (base :: levels).Pairwise (· < ·))
    (layer : ThresholdLayer) (mem : layer ∈ thresholdLayers base levels) :
    0 < layer.duration := by
  induction levels generalizing base with
  | nil => simp [thresholdLayers] at mem
  | cons w ws ih =>
      rcases List.pairwise_cons.mp ordered with ⟨hbase,htail⟩
      rcases List.mem_cons.mp mem with he | hm
      · rw [he]
        exact sub_pos.mpr (hbase w (by simp))
      · exact ih w htail hm

theorem layer_durations_sum (base : ℝ) (levels : List ℝ) :
    ((thresholdLayers base levels).map ThresholdLayer.duration).sum =
      levels.getLastD base - base := by
  induction levels generalizing base with
  | nil => simp [thresholdLayers]
  | cons w ws ih =>
      simp only [thresholdLayers,List.map_cons,List.sum_cons,List.getLastD_cons]
      rw [ih]
      ring

theorem exposure_zero_below_levels (base weight : ℝ) (levels : List ℝ)
    (below : ∀ w ∈ levels, weight < w) :
    ((thresholdLayers base levels).map (fun l => l.duration * layerMask weight l)).sum = 0 := by
  induction levels generalizing base with
  | nil => rfl
  | cons w ws ih =>
      have h : ¬ w ≤ weight := not_le_of_gt (below w (by simp))
      simp only [thresholdLayers,List.map_cons,List.sum_cons,layerMask,h,if_false,mul_zero,zero_add]
      exact ih w (fun x hx => below x (List.mem_cons_of_mem _ hx))

theorem exposure_at_level (base weight : ℝ) (levels : List ℝ)
    (ordered : (base :: levels).Pairwise (· < ·)) (member : weight ∈ levels) :
    ((thresholdLayers base levels).map (fun l => l.duration * layerMask weight l)).sum =
      weight-base := by
  induction levels generalizing base with
  | nil => simp at member
  | cons w ws ih =>
      have htail := (List.pairwise_cons.mp ordered).2
      have hstrict := (List.pairwise_cons.mp htail).1
      rcases List.mem_cons.mp member with he | hm
      · subst weight
        simp only [thresholdLayers,List.map_cons,List.sum_cons,layerMask,le_refl,if_true,mul_one]
        change w-base+((thresholdLayers w ws).map (fun l => l.duration * layerMask w l)).sum =
          w-base
        rw [exposure_zero_below_levels w w ws hstrict]
        ring
      · have hw : w ≤ weight := (hstrict weight hm).le
        change (w-base)*layerMask weight ⟨w,w-base⟩ +
          ((thresholdLayers w ws).map (fun l => l.duration * layerMask weight l)).sum =
            weight-base
        rw [show layerMask weight ⟨w,w-base⟩ = 1 by simp [layerMask,hw], ih w htail hm]
        ring

structure ExposurePhase (α : Type*) where
  weight : α → ℝ
  levels : List ℝ
  ordered : ((0:ℝ) :: levels).Pairwise (· < ·)
  covers : ∀ p, weight p = 0 ∨ weight p ∈ levels

def ExposurePhase.duration {α : Type*} (p : ExposurePhase α) : ℝ := p.levels.getLastD 0

structure BinaryPhase (α : Type*) where
  duration : ℝ
  mask : α → ℝ

def ExposurePhase.refine {α : Type*} (p : ExposurePhase α) : List (BinaryPhase α) :=
  (thresholdLayers 0 p.levels).map (fun l => ⟨l.duration,fun q => layerMask (p.weight q) l⟩)

theorem ExposurePhase.refine_duration {α : Type*} (p : ExposurePhase α) :
    (p.refine.map BinaryPhase.duration).sum = p.duration := by
  simpa [ExposurePhase.refine,ExposurePhase.duration,List.map_map,Function.comp_def] using
    layer_durations_sum 0 p.levels

theorem ExposurePhase.refine_exposure {α : Type*} (p : ExposurePhase α) (q : α) :
    (p.refine.map (fun f => f.duration*f.mask q)).sum = p.weight q := by
  rcases p.covers q with hzero | hmem
  · simp only [ExposurePhase.refine,List.map_map,Function.comp_def,hzero]
    exact exposure_zero_below_levels 0 0 p.levels (List.pairwise_cons.mp p.ordered).1
  · simpa [ExposurePhase.refine,List.map_map,Function.comp_def] using
      exposure_at_level 0 (p.weight q) p.levels p.ordered hmem

theorem ExposurePhase.refine_phase {α : Type*} (p : ExposurePhase α) (f : BinaryPhase α)
    (hm : f ∈ p.refine) : 0 < f.duration ∧ ∀ q, f.mask q = 0 ∨ f.mask q = 1 := by
  obtain ⟨l,hl,rfl⟩ := List.mem_map.mp hm
  exact ⟨layer_duration_pos 0 p.levels p.ordered l hl,fun q => layerMask_binary (p.weight q) l⟩

def refinePhases {α : Type*} (phases : List (ExposurePhase α)) : List (BinaryPhase α) :=
  phases.flatMap ExposurePhase.refine

theorem refinePhases_duration {α : Type*} (phases : List (ExposurePhase α)) :
    ((refinePhases phases).map BinaryPhase.duration).sum =
      (phases.map ExposurePhase.duration).sum := by
  induction phases with
  | nil => rfl
  | cons p ps ih =>
      simp only [refinePhases,List.flatMap_cons,List.map_append,List.sum_append,List.map_cons,List.sum_cons]
      rw [p.refine_duration]
      exact congrArg (p.duration + ·) ih

theorem refinePhases_exposure {α : Type*} (phases : List (ExposurePhase α)) (q : α) :
    ((refinePhases phases).map (fun f => f.duration*f.mask q)).sum =
      (phases.map (fun f => f.weight q)).sum := by
  induction phases with
  | nil => rfl
  | cons p ps ih =>
      simp only [refinePhases,List.flatMap_cons,List.map_append,List.sum_append,List.map_cons,List.sum_cons]
      rw [p.refine_exposure]
      exact congrArg (p.weight q + ·) ih

theorem refinePhases_phase {α : Type*} (phases : List (ExposurePhase α)) (f : BinaryPhase α)
    (hm : f ∈ refinePhases phases) : 0 < f.duration ∧ ∀ q, f.mask q = 0 ∨ f.mask q = 1 := by
  obtain ⟨p,_,hp⟩ := List.mem_flatMap.mp hm
  exact p.refine_phase f hp

def refinedSchedule {α : Type*} (phases : List (ExposurePhase α)) :
    Schedule (refinePhases phases).length :=
  scheduleOfDurations (fun j => ((refinePhases phases).get j).duration)
    (fun j => (refinePhases_phase phases _ (List.get_mem _ j)).1)

def refinedScheduleMask {α : Type*} (phases : List (ExposurePhase α))
    (j : Fin (refinePhases phases).length) (q : α) : ℝ :=
  ((refinePhases phases).get j).mask q

theorem refinedScheduleMask_binary {α : Type*} (phases : List (ExposurePhase α))
    (j : Fin (refinePhases phases).length) (q : α) :
    refinedScheduleMask phases j q = 0 ∨ refinedScheduleMask phases j q = 1 :=
  (refinePhases_phase phases _ (List.get_mem _ j)).2 q

private theorem sum_get_map {α : Type*} (xs : List α) (f : α → ℝ) :
    (∑ j : Fin xs.length, f (xs.get j)) = (xs.map f).sum := by
  rw [← Fin.sum_ofFn]
  congr 1
  rw [List.ofFn_comp' xs.get f,List.ofFn_get]

theorem refinedSchedule_total {α : Type*} (phases : List (ExposurePhase α)) :
    (refinedSchedule phases).total = (phases.map ExposurePhase.duration).sum := by
  rw [refinedSchedule,scheduleOfDurations_total,sum_get_map,refinePhases_duration]

theorem refinedSchedule_cumulative_total {α : Type*} (phases : List (ExposurePhase α)) (q : α) :
    (refinedSchedule phases).cumulative (fun j => refinedScheduleMask phases j q)
      (refinedSchedule phases).total = (phases.map (fun f => f.weight q)).sum := by
  rw [Schedule.cumulative_total]
  simp only [refinedSchedule,scheduleOfDurations_duration,refinedScheduleMask]
  exact (sum_get_map (refinePhases phases) (fun f => f.duration*f.mask q)).trans
    (refinePhases_exposure phases q)

#print axioms exposure_at_level
#print axioms refinedScheduleMask_binary
#print axioms refinedSchedule_total
#print axioms refinedSchedule_cumulative_total

end NoThreeLine481
