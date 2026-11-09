import NoThreeLine.ReferenceCommonGrid

/-! A partial phase integral is dominated by the full literal reference prefix
at the enclosing phase endpoint. Time scaling appears once in the duration
comparison. The order map is injective because it is strictly increasing. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine
namespace FinitePhase

theorem Schedule.cumulative_le_cut {J : ℕ} (s : Schedule J) (c : Fin J → ℝ)
    (hc : ∀ j, 0 ≤ c j) (k : Fin J) (T : ℝ) (hT : 0 ≤ T) (hTk : T ≤ s.hi k) :
    s.cumulative c T ≤ ∑ j ∈ Finset.Iic k, s.duration j*c j := by
  rw [Schedule.cumulative,cumulative_eq_sum _ _ _ _ _ hT]
  have hz (j : Fin J) (hj : j ∉ Finset.Iic k) : elapsed (s.lo j) (s.hi j) T = 0 := by
    have hkj : k < j := lt_of_not_ge (by simpa using hj)
    have hkl : s.hi k ≤ s.lo j := s.increasing.monotone (by
      simp only [Fin.le_def,Fin.val_succ,Fin.val_castSucc]
      exact hkj)
    unfold elapsed
    rw [max_eq_right (s.lo_nonneg j)]
    exact max_eq_left (sub_nonpos.mpr ((min_le_left _ _).trans (hTk.trans hkl)))
  rw [← Finset.sum_subset (Finset.subset_univ (Finset.Iic k)) (fun j _ hj => by rw [hz j hj,zero_mul])]
  apply Finset.sum_le_sum
  intro j hj
  apply mul_le_mul_of_nonneg_right _ (hc j)
  unfold elapsed Schedule.duration
  rw [max_eq_right (s.lo_nonneg j)]
  exact max_le (sub_nonneg.mpr (s.lo_lt_hi j).le) (sub_le_sub_right (min_le_right _ _) _)

end FinitePhase
namespace FrozenReference
open FinitePhase

theorem phaseTypeWeight_nonneg (j : Fin 15348) (r : Fin 4) (cell : Grid 128) :
    0 ≤ phaseTypeWeight j r cell := by
  unfold phaseTypeWeight
  split_ifs
  · exact (coarseOrbitWeight_bounds _ _).1
  · exact le_rfl

theorem referenceMask_nonneg (j : Fin 15348) (r : Fin 4) (x y : ℝ) :
    0 ≤ referenceMask j r x y := by
  classical
  unfold referenceMask eraseGrid
  split_ifs
  · exact le_rfl
  · unfold rectangleField
    apply Finset.sum_nonneg
    intro cell _
    unfold Rect.field
    split_ifs
    · exact phaseTypeWeight_nonneg _ _ _
    · exact le_rfl

def fullTypeWeight (last : Fin 15348) (r : Fin 4) (cell : Grid 128) : ℝ :=
  ∑ j ∈ Finset.Iic last, (phaseUnits j : ℝ)/100000000*phaseTypeWeight j r cell

def fullPhasePrefix (last : Fin 15348) (r : Fin 4) (x y : ℝ) : ℝ :=
  ∑ j ∈ Finset.Iic last, (phaseUnits j : ℝ)/100000000*referenceMask j r x y

theorem fullPhasePrefix_eq_field (last : Fin 15348) (r : Fin 4) (x y : ℝ) :
    fullPhasePrefix last r x y =
      eraseGrid (commonGridLines 32768) (commonGridLines 32768)
        (rectangleField Finset.univ coarseGridRect (fullTypeWeight last r)) x y :=
  (maskedField_sum_weights Finset.univ coarseGridRect _ _ (Finset.Iic last)
    (fun j => (phaseUnits j : ℝ)/100000000) (fun j => phaseTypeWeight j r) x y).symm

theorem referencePrefix_le_fullPhasePrefix {J : ℕ} (s : Schedule J)
    (index : Fin J → Fin 15348) (hi : StrictMono index) (scale : ℝ) (hscale : 0 ≤ scale)
    (hd : ∀ j, s.duration j ≤ scale*((phaseUnits (index j) : ℝ)/100000000))
    (k : Fin J) (last : Fin 15348) (hkl : index k ≤ last)
    (T : ℝ) (hT : 0 ≤ T) (hTk : T ≤ s.hi k) (r : Fin 4) (x y : ℝ) :
    referencePrefix s index T r x y ≤ scale*fullPhasePrefix last r x y := by
  classical
  have hsub : (Finset.Iic k).image index ⊆ Finset.Iic last := by
    intro j hj
    rcases Finset.mem_image.mp hj with ⟨i,hi',rfl⟩
    exact Finset.mem_Iic.mpr ((hi.monotone (Finset.mem_Iic.mp hi')).trans hkl)
  calc
    referencePrefix s index T r x y ≤
        ∑ j ∈ Finset.Iic k, s.duration j*referenceMask (index j) r x y :=
      s.cumulative_le_cut _ (fun j => referenceMask_nonneg _ _ _ _) k T hT hTk
    _ ≤ ∑ j ∈ Finset.Iic k,
        (scale*((phaseUnits (index j) : ℝ)/100000000))*referenceMask (index j) r x y :=
      Finset.sum_le_sum (fun j _ => mul_le_mul_of_nonneg_right (hd j) (referenceMask_nonneg _ _ _ _))
    _ = ∑ j ∈ (Finset.Iic k).image index,
        (scale*((phaseUnits j : ℝ)/100000000))*referenceMask j r x y := by
      rw [Finset.sum_image hi.injective.injOn]
    _ ≤ ∑ j ∈ Finset.Iic last,
        (scale*((phaseUnits j : ℝ)/100000000))*referenceMask j r x y := by
      exact Finset.sum_le_sum_of_subset_of_nonneg hsub (fun j _ _ =>
        mul_nonneg (mul_nonneg hscale (div_nonneg (Nat.cast_nonneg _) (by norm_num)))
          (referenceMask_nonneg _ _ _ _))
    _ = scale*fullPhasePrefix last r x y := by
      unfold fullPhasePrefix
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j hj
      ring

theorem acceptedPrefix_le_fullPhasePrefix {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀ j, PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (scale : ℝ) (hscale : 0 ≤ scale)
    (hd : ∀ j, s.duration j ≤ scale*((phaseUnits (index j) : ℝ)/100000000))
    (k : Fin J) (last : Fin 15348) (hkl : index k ≤ last)
    (T : ℝ) (hT : 0 ≤ T) (hTk : T ≤ s.hi k) (r : Fin 4) (x y : ℝ) :
    s.acceptedPrefix (fun j => (a j).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) T r x y ≤
      scale*fullPhasePrefix last r x y :=
  (acceptedPrefix_le_reference s a index hm T hT r x y).trans
    (referencePrefix_le_fullPhasePrefix s index hi scale hscale hd k last hkl T hT hTk r x y)

end FrozenReference
end NoThreeLine

#print axioms NoThreeLine.FrozenReference.acceptedPrefix_le_fullPhasePrefix
