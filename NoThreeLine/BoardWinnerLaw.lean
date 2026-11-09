import NoThreeLine.BoardFirstCandidate
import Mathlib.Probability.Distributions.Uniform
import Mathlib.Data.Finset.Max

/-! Actual first-candidate label, with a fixed finite-enumeration tie rule. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine
namespace BoardWinnerLaw
open BoardFirstCandidate

def rank {n : ℕ} : Grid n ≃ Fin (Fintype.card (Grid n)) := Fintype.equivFin _

def minimizerIndices {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) :
    Finset (Fin (Fintype.card (Grid n))) := by
  classical
  exact Finset.univ.filter (fun i => firstWait ω (rank.symm i) = firstTime hn ω)

theorem minimizerIndices_nonempty {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) :
    (minimizerIndices hn ω).Nonempty := by
  classical
  obtain ⟨p, hp⟩ := firstTime_attained hn ω
  exact ⟨rank p, by simp [minimizerIndices, hp]⟩

/-- Ties use the least rank in the fixed `Fintype.equivFin` enumeration. -/
def winner {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) : Grid n :=
  rank.symm ((minimizerIndices hn ω).min' (minimizerIndices_nonempty hn ω))

theorem winner_eq_iff {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (p : Grid n) :
    winner hn ω = p ↔ firstWait ω p = firstTime hn ω ∧
      ∀ q : Grid n, firstWait ω q = firstTime hn ω → rank p ≤ rank q := by
  classical
  rw [winner, Equiv.symm_apply_eq, Finset.min'_eq_iff]
  simp only [minimizerIndices, Finset.mem_filter, Finset.mem_univ, true_and,
    Equiv.symm_apply_apply]
  constructor
  · rintro ⟨hp, hq⟩
    exact ⟨hp, fun q h => hq (rank q) (by simpa using h)⟩
  · rintro ⟨hp, hq⟩
    exact ⟨hp, fun i hi => by simpa using hq (rank.symm i) hi⟩

theorem winner_attains {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) :
    firstWait ω (winner hn ω) = firstTime hn ω :=
  ((winner_eq_iff hn ω _).mp rfl).1

theorem winner_measurable {n : ℕ} (hn : 0 < n) : Measurable (winner hn) := by
  apply measurable_to_countable'
  intro p
  have he (q : Grid n) : MeasurableSet {ω : BoardClockPath n |
      firstWait ω q = firstTime hn ω} :=
    measurableSet_eq_fun (firstWait_measurable q) (firstTime_measurable hn)
  have hh : winner hn ⁻¹' {p} = {ω | firstWait ω p = firstTime hn ω} ∩
      ⋂ q : Grid n, {ω | firstWait ω q ≠ firstTime hn ω ∨ rank p ≤ rank q} := by
    ext ω
    simp only [mem_preimage, mem_singleton_iff, winner_eq_iff, mem_inter_iff,
      mem_setOf_eq, mem_iInter]
    simp only [← imp_iff_not_or]
  rw [hh]
  apply (he p).inter
  apply MeasurableSet.iInter
  intro q
  by_cases h : rank p ≤ rank q
  · simp [h]
  · simpa only [h, or_false, compl_setOf] using (he q).compl

theorem winner_eq_of_unique {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (hd : ∀ p q : Grid n, p ≠ q → firstWait ω p ≠ firstWait ω q)
    (p : Grid n) (hp : firstWait ω p = firstTime hn ω) : winner hn ω = p := by
  by_contra hne
  exact hd _ _ hne ((winner_attains hn ω).trans hp.symm)

def relabel {n : ℕ} (e : Equiv.Perm (Grid n)) (ω : BoardClockPath n) : BoardClockPath n :=
  fun p => ω (e p)

theorem relabel_preserving {n : ℕ} (rate : ℝ) (hr : 0 < rate)
    (e : Equiv.Perm (Grid n)) :
    MeasurePreserving (relabel e) (boardClockMeasure n rate) (boardClockMeasure n rate) := by
  letI := markedClockMeasure_probability rate hr
  refine ⟨by unfold relabel; fun_prop, ?_⟩
  exact Measure.map_infinitePi_infinitePi_of_inj (P := fun _ => markedClockMeasure rate) e.injective

theorem firstTime_relabel {n : ℕ} (hn : 0 < n) (e : Equiv.Perm (Grid n))
    (ω : BoardClockPath n) : firstTime hn (relabel e ω) = firstTime hn ω := by
  apply le_antisymm
  · obtain ⟨p, hp⟩ := firstTime_attained hn ω
    have h := firstTime_le_firstWait hn (relabel e ω) (e.symm p)
    simpa [firstWait, relabel, hp] using h
  · obtain ⟨p, hp⟩ := firstTime_attained hn (relabel e ω)
    have h := firstTime_le_firstWait hn ω (e p)
    simpa [firstWait, relabel] using h.trans_eq hp.symm

theorem winner_relabel {n : ℕ} (hn : 0 < n) (e : Equiv.Perm (Grid n))
    (ω : BoardClockPath n)
    (hd : ∀ p q : Grid n, p ≠ q → firstWait ω p ≠ firstWait ω q) :
    winner hn (relabel e ω) = e.symm (winner hn ω) := by
  apply winner_eq_of_unique
  · intro p q hpq
    exact hd (e p) (e q) (fun h => hpq (e.injective h))
  · simpa [firstWait, relabel, firstTime_relabel] using winner_attains hn ω

theorem winner_time_fiber_measure_eq {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate)
    (A : Set ℝ) (hA : MeasurableSet A) (p q : Grid n) :
    boardClockMeasure n rate {ω | firstTime hn ω ∈ A ∧ winner hn ω = p} =
      boardClockMeasure n rate {ω | firstTime hn ω ∈ A ∧ winner hn ω = q} := by
  let e := Equiv.swap p q
  have hs : MeasurableSet {ω : BoardClockPath n | firstTime hn ω ∈ A ∧ winner hn ω = p} :=
    (hA.preimage (firstTime_measurable hn)).inter
      ((measurableSet_singleton p).preimage (winner_measurable hn))
  have hm := (relabel_preserving rate hr e).map_eq
  have hv := congrArg (fun μ : Measure (BoardClockPath n) =>
    μ {ω | firstTime hn ω ∈ A ∧ winner hn ω = p}) hm
  rw [Measure.map_apply (relabel_preserving rate hr e).measurable hs] at hv
  rw [← hv]
  apply measure_congr
  filter_upwards [firstWait_ae_distinct n rate hr] with ω hd
  change (firstTime hn (relabel e ω) ∈ A ∧ winner hn (relabel e ω) = p) =
    (firstTime hn ω ∈ A ∧ winner hn ω = q)
  simp only [firstTime_relabel, winner_relabel hn e ω hd]
  have he : e.symm (winner hn ω) = p ↔ winner hn ω = q := by
    rw [Equiv.symm_apply_eq]
    simp [e]
  rw [he]

theorem winner_time_fiber_measure {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate)
    (A : Set ℝ) (hA : MeasurableSet A) (p : Grid n) :
    boardClockMeasure n rate {ω | firstTime hn ω ∈ A ∧ winner hn ω = p} =
      boardClockMeasure n rate (firstTime hn ⁻¹' A) * (Fintype.card (Grid n) : ℝ≥0∞)⁻¹ := by
  have hu : firstTime hn ⁻¹' A =
      ⋃ q : Grid n, {ω | firstTime hn ω ∈ A ∧ winner hn ω = q} := by
    ext ω
    simp
  have hd : Pairwise (Disjoint on (fun q : Grid n =>
      {ω : BoardClockPath n | firstTime hn ω ∈ A ∧ winner hn ω = q})) := by
    intro q r hqr
    apply Set.disjoint_left.mpr
    intro ω hq hr
    exact hqr (hq.2.symm.trans hr.2)
  have hm (q : Grid n) : MeasurableSet
      {ω : BoardClockPath n | firstTime hn ω ∈ A ∧ winner hn ω = q} :=
    (hA.preimage (firstTime_measurable hn)).inter
      ((measurableSet_singleton q).preimage (winner_measurable hn))
  have hs : boardClockMeasure n rate (firstTime hn ⁻¹' A) =
      (Fintype.card (Grid n) : ℝ≥0∞) *
        boardClockMeasure n rate {ω | firstTime hn ω ∈ A ∧ winner hn ω = p} := by
    rw [hu, measure_iUnion hd hm, tsum_fintype]
    simp_rw [winner_time_fiber_measure_eq hn rate hr A hA _ p]
    simp
  have hc : (Fintype.card (Grid n) : ℝ≥0∞) ≠ 0 := by
    simp only [Fintype.card_prod, Fintype.card_fin, Nat.cast_mul, ne_eq, mul_eq_zero,
      Nat.cast_eq_zero]
    exact not_or.mpr ⟨Nat.ne_of_gt hn, Nat.ne_of_gt hn⟩
  rw [hs, mul_comm (Fintype.card (Grid n) : ℝ≥0∞), mul_assoc,
    ENNReal.mul_inv_cancel hc (ENNReal.natCast_ne_top _), mul_one]

def uniformGrid {n : ℕ} (hn : 0 < n) : Measure (Grid n) :=
  letI : Nonempty (Grid n) := ⟨(⟨0, hn⟩, ⟨0, hn⟩)⟩
  (PMF.uniformOfFintype (Grid n)).toMeasure

instance uniformGrid_probability {n : ℕ} (hn : 0 < n) :
    IsProbabilityMeasure (uniformGrid hn) := by
  unfold uniformGrid
  infer_instance

theorem uniformGrid_apply {n : ℕ} (hn : 0 < n) (S : Set (Grid n))
    (hS : MeasurableSet S) [Fintype S] :
    uniformGrid hn S = (Fintype.card S : ℝ≥0∞) / Fintype.card (Grid n) := by
  letI : Nonempty (Grid n) := ⟨(⟨0, hn⟩, ⟨0, hn⟩)⟩
  unfold uniformGrid
  exact PMF.toMeasure_uniformOfFintype_apply S hS

theorem winner_time_rectangle {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate)
    (A : Set ℝ) (hA : MeasurableSet A) (S : Set (Grid n)) (hS : MeasurableSet S) :
    boardClockMeasure n rate {ω | firstTime hn ω ∈ A ∧ winner hn ω ∈ S} =
      expMeasure ((n : ℝ)^2 * rate) A * uniformGrid hn S := by
  classical
  letI : Fintype S := Fintype.ofFinite S
  have hu : {ω : BoardClockPath n | firstTime hn ω ∈ A ∧ winner hn ω ∈ S} =
      ⋃ q : S, {ω | firstTime hn ω ∈ A ∧ winner hn ω = q.val} := by
    ext ω
    simp
  have hd : Pairwise (Disjoint on (fun q : S =>
      {ω : BoardClockPath n | firstTime hn ω ∈ A ∧ winner hn ω = q.val})) := by
    intro q r hqr
    apply Set.disjoint_left.mpr
    intro ω hq hr
    exact hqr (Subtype.ext (hq.2.symm.trans hr.2))
  have hm (q : S) : MeasurableSet
      {ω : BoardClockPath n | firstTime hn ω ∈ A ∧ winner hn ω = q.val} :=
    (hA.preimage (firstTime_measurable hn)).inter
      ((measurableSet_singleton q.val).preimage (winner_measurable hn))
  have htime : boardClockMeasure n rate (firstTime hn ⁻¹' A) =
      expMeasure ((n : ℝ)^2 * rate) A := by
    rw [← firstTime_map hn rate hr, Measure.map_apply (firstTime_measurable hn) hA]
  rw [hu, measure_iUnion hd hm, tsum_fintype]
  simp_rw [winner_time_fiber_measure hn rate hr A hA, htime]
  rw [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, uniformGrid_apply hn S hS]
  simp only [div_eq_mul_inv]
  ring

def firstRace {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) : ℝ × Grid n :=
  (firstTime hn ω, winner hn ω)

theorem firstRace_measurable {n : ℕ} (hn : 0 < n) : Measurable (firstRace hn) :=
  (firstTime_measurable hn).prodMk (winner_measurable hn)

theorem firstRace_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    (boardClockMeasure n rate).map (firstRace hn) =
      (expMeasure ((n : ℝ)^2 * rate)).prod (uniformGrid hn) := by
  letI := boardClockMeasure_probability n rate hr
  apply Measure.ext_prod
  intro A S hA hS
  rw [Measure.map_apply (firstRace_measurable hn) (hA.prod hS), Measure.prod_prod]
  exact winner_time_rectangle hn rate hr A hA S hS

theorem candidate_firstRace_map {n : ℕ} (hn : 0 < n) (B : ℝ) (hB : 0 < B) :
    (boardClockMeasure n (B/n)).map (firstRace hn) =
      (expMeasure (n * B)).prod (uniformGrid hn) := by
  rw [firstRace_map hn (B/n) (div_pos hB (by exact_mod_cast hn))]
  have hn0 : (n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  congr 2
  field_simp

end BoardWinnerLaw
end NoThreeLine

#print axioms NoThreeLine.BoardWinnerLaw.candidate_firstRace_map
