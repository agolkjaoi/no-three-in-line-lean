import NoThreeLine481.AngularTransfer
import NoThreeLine481.FineGridOutput
import NoThreeLine481.FineRankGeometry
import NoThreeLine481.RankedPhases

/-! For a ranked fine-grid field, only its continuum angular estimates
remain as hypotheses of the final output theorem. -/
set_option autoImplicit false
set_option maxRecDepth 2000
set_option maxHeartbeats 1900000
noncomputable section
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine PrimitiveLines GridChord FiniteDirections FinitePhase FrozenCapacity GridArea

private def coarseWeightValue (u : Fin 4 × Fin 256) : ℝ :=
  (249/250:ℝ)*((cellUnits u.1 u.2:ℝ)/100000000)

private def coarsePositiveWeights : Finset ℝ := by
  classical
  exact (Finset.univ.image coarseWeightValue).filter (fun w => 0 < w)

private def coarseLevels : List ℝ := coarsePositiveWeights.sort

private theorem coarseLevels_pos {w : ℝ} (hw : w ∈ coarseLevels) : 0 < w := by
  have hmem : w ∈ coarsePositiveWeights := (Finset.mem_sort _).mp hw
  unfold coarsePositiveWeights at hmem
  exact (Finset.mem_filter.mp hmem).2

private theorem coarseLevels_ne_nil : coarseLevels ≠ [] := by
  let w := coarseWeightValue (0,1)
  have hu : cellUnits 0 1 = 470107046 := by decide +kernel
  have hpos : 0 < w := by norm_num [w, coarseWeightValue, hu]
  have hw : w ∈ coarseLevels := by
    apply (Finset.mem_sort _).mpr
    unfold coarsePositiveWeights
    exact Finset.mem_filter.mpr ⟨Finset.mem_image.mpr ⟨(0,1),Finset.mem_univ _,rfl⟩, hpos⟩
  intro h
  simp [h] at hw

private def fineExposure (n : ℕ) : ExposurePhase (Grid n) where
  weight := fineGridTerminal
  levels := coarseLevels
  ordered := List.pairwise_cons.mpr ⟨fun _ => coarseLevels_pos, (Finset.sortedLT_sort coarsePositiveWeights).pairwise⟩
  covers q := by
    by_cases hzero : fineGridTerminal q = 0
    · exact Or.inl hzero
    · right
      have hpos := lt_of_le_of_ne (fineGridTerminal_bounds q).1 (Ne.symm hzero)
      have hq : ¬onFineGrid q := fun h => hzero (fineGridTerminal_zero_of_onFineGrid q h)
      have heq := fineGridTerminal_eq_fineWeight q hq
      apply (Finset.mem_sort _).mpr
      unfold coarsePositiveWeights
      refine Finset.mem_filter.mpr ⟨?_, hpos⟩
      apply Finset.mem_image.mpr
      refine ⟨(codeZ (parity (gridEmbed q)),coarseParent (fineCell q)),Finset.mem_univ _,?_⟩
      exact heq.symm

/-- Angular bounds on the original phase endpoints at active roots. -/
def FineAngularCertificate {J : ℕ} (rank : Fin 4 → Grid 256 → Fin J) : Prop :=
  ∀ (n : ℕ) (p : Grid n), 0 < fineGridTerminal p →
    ((76/125:ℝ)/24)*typedAngularIntegralSum fineCells fineRect
      (finePrefixWeights rank (boardRank rank p)) (commonGridLines 256) (commonGridLines 256) p
      ≤ (9999/10000:ℝ)

theorem target_of_fine_angular_certificate {J : ℕ} (hJ : 0 < J)
    (rank : Fin 4 → Grid 256 → Fin J) (hangle : FineAngularCertificate rank) :
    NoThreeLine.Target := by
  let T : ℝ := J*coarseLevels.getLastD 0
  have hLast : 0 ≤ coarseLevels.getLastD (0:ℝ) := by
    rcases List.mem_cons.mp (List.getLastD_mem_cons (l := coarseLevels) (a := (0:ℝ))) with h | h
    · rw [h]
    · exact (coarseLevels_pos h).le
  have hLength : 0 < coarseLevels.length := List.length_pos_iff.mpr coarseLevels_ne_nil
  obtain ⟨N,hN⟩ := eventually_pair_budget_of_angular fineCells fineRect
    (commonGridLines 256) (commonGridLines 256) 12 (9999/10000) (319969/320000)
    (by norm_num) (by norm_num) fineRect_separated (fun i _ => fineRect_inUnit i)
  apply target_of_eventual_fineGridSchedules T (J*coarseLevels.length)
    (mul_nonneg (Nat.cast_nonneg _) hLast) (Nat.mul_pos hJ hLength)
  refine ⟨N, ?_⟩
  intro n hn
  let data := fineExposure n
  let rho := boardRank rank (n := n)
  let phases := rankedExposurePhases data rho
  have hlen : (refinePhases phases).length = J*coarseLevels.length :=
    rankedExposurePhases_refined_length data rho
  rw [← hlen]
  refine ⟨{
    schedule := refinedSchedule phases
    mask := refinedScheduleMask phases
    binary := refinedScheduleMask_binary phases
    total_le := (rankedExposurePhases_total data rho).le
    terminal := rankedExposurePhases_terminal data rho
    pairs := ?_
  }⟩
  intro p hp
  have hw := rankedExposurePhases_weight_pos_of_deadline data rho p hp
  have hbound := hN n hn p (finePrefixWeights rank (rho p))
    (fun z i _ => finePrefixWeights_bounds rank (rho p) z i) (hangle n p hw)
  refine (rankedExposurePhases_deadline_pairSum data rho p).trans ?_
  have he : maskedTypedBoardWeight fineCells fineRect (finePrefixWeights rank (rho p))
      (commonGridLines 256) (commonGridLines 256) =
      (fun q => if rho q ≤ rho p then data.weight q else 0) :=
    funext (fun q => finePrefixWeights_eval rank (rho p) q)
  rwa [he] at hbound

#print axioms target_of_fine_angular_certificate

end NoThreeLine481
