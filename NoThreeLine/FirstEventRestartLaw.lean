import NoThreeLine.ActualClockRestart

/-! Sum the exact fixed-winner sections. This proves a first-event restart
law for the original infinite board clock paths, including the consumed
mark. It does not yet construct an iterated state process. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine.FirstEventRestartLaw
open FiniteClockRestart FixedWinnerRestart ActualClockRestart
open BoardFirstCandidate BoardWinnerLaw WinnerMarkLaw

theorem measure_sum_winner_fibers {n : ℕ} (hn : 0 < n) (μ : Measure (BoardClockPath n))
    (E : Set (BoardClockPath n)) (hE : MeasurableSet E) :
    μ E = ∑ p : Grid n, μ (E ∩ {ω | winner hn ω = p}) := by
  classical
  have hu : E = ⋃ p : Grid n, E ∩ {ω | winner hn ω = p} := by ext ω; simp
  have hd : Pairwise (Disjoint on (fun p : Grid n => E ∩ {ω | winner hn ω = p})) := by
    intro p q hpq
    apply Set.disjoint_left.mpr
    intro ω hp hq
    exact hpq (hp.2.symm.trans hq.2)
  conv_lhs => rw [hu]
  rw [measure_iUnion hd (fun p => hE.inter
    ((measurableSet_singleton p).preimage (winner_measurable hn))), tsum_fintype]

theorem fixed_winner_factor {n : ℕ} (hn : 0 < n) (p : Grid n) (rate : ℝ) (hr : 0 < rate)
    (A : Set ((ℝ × Grid n) × ℝ)) (B : Set (BoardClockPath n))
    (hA : MeasurableSet A) (hB : MeasurableSet B) :
    boardClockMeasure n rate ((firstMarkedRace hn ⁻¹' A ∩ restartedBoard hn ⁻¹' B) ∩
      {ω | winner hn ω = p}) =
    boardClockMeasure n rate (firstMarkedRace hn ⁻¹' A ∩ {ω | winner hn ω = p}) *
      boardClockMeasure n rate B := by
  letI := boardClockMeasure_probability n rate hr
  let Ap : Set (ℝ × ℝ) := {z | ((z.1,p),z.2) ∈ A}
  have hAp : MeasurableSet Ap := hA.preimage
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  have hset (D : Set (BoardClockPath n)) :
      (timeMarkRestart hn ⁻¹' (Ap ×ˢ D)) ∩ {ω | winner hn ω = p} =
      (firstMarkedRace hn ⁻¹' A ∩ restartedBoard hn ⁻¹' D) ∩
        {ω | winner hn ω = p} := by
    ext ω
    by_cases hp : winner hn ω = p <;>
      simp [timeMarkRestart, Ap, firstMarkedRace, firstRace, hp]
  have hm (D : Set (BoardClockPath n)) (hD : MeasurableSet D) :=
    congrArg (fun ν : Measure ((ℝ × ℝ) × BoardClockPath n) => ν (Ap ×ˢ D))
      (fixed_actual_pair_map hn p rate hr)
  have hB' := hm B hB
  have hU := hm univ MeasurableSet.univ
  rw [Measure.map_apply (timeMarkRestart_measurable hn) (hAp.prod hB),
    Measure.restrict_apply ((hAp.prod hB).preimage (timeMarkRestart_measurable hn)),
    hset B, Measure.smul_apply, smul_eq_mul, Measure.prod_prod] at hB'
  rw [Measure.map_apply (timeMarkRestart_measurable hn) (hAp.prod MeasurableSet.univ),
    Measure.restrict_apply ((hAp.prod MeasurableSet.univ).preimage (timeMarkRestart_measurable hn)),
    hset univ, Measure.smul_apply, smul_eq_mul, Measure.prod_prod] at hU
  simp only [preimage_univ, inter_univ, measure_univ, mul_one] at hU
  rw [hB', hU, mul_assoc]

theorem first_event_restart_rectangle {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate)
    (A : Set ((ℝ × Grid n) × ℝ)) (B : Set (BoardClockPath n))
    (hA : MeasurableSet A) (hB : MeasurableSet B) :
    boardClockMeasure n rate (firstMarkedRace hn ⁻¹' A ∩ restartedBoard hn ⁻¹' B) =
      boardClockMeasure n rate (firstMarkedRace hn ⁻¹' A) * boardClockMeasure n rate B := by
  classical
  have hE := hA.preimage (firstMarkedRace_measurable hn)
  have hR := hB.preimage (restartedBoard_measurable hn)
  rw [measure_sum_winner_fibers hn _ _ (hE.inter hR)]
  simp_rw [fixed_winner_factor hn _ rate hr A B hA hB]
  rw [← Finset.sum_mul, ← measure_sum_winner_fibers hn _ _ hE]

def firstRestart {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) :
    ((ℝ × Grid n) × ℝ) × BoardClockPath n :=
  (firstMarkedRace hn ω,restartedBoard hn ω)

theorem firstRestart_measurable {n : ℕ} (hn : 0 < n) : Measurable (firstRestart hn) :=
  (firstMarkedRace_measurable hn).prodMk (restartedBoard_measurable hn)

theorem first_event_restart_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    (boardClockMeasure n rate).map (firstRestart hn) =
      (((expMeasure ((n : ℝ)^2*rate)).prod (uniformGrid hn)).prod markMeasure).prod
        (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  have hm : (boardClockMeasure n rate).map (firstRestart hn) =
      ((boardClockMeasure n rate).map (firstMarkedRace hn)).prod (boardClockMeasure n rate) := by
    apply Measure.ext_prod
    intro A B hA hB
    rw [Measure.map_apply (firstRestart_measurable hn) (hA.prod hB), Measure.prod_prod,
      Measure.map_apply (firstMarkedRace_measurable hn) hA]
    exact first_event_restart_rectangle hn rate hr A B hA hB
  rw [firstMarkedRace_map hn rate hr] at hm
  exact hm

theorem candidate_first_event_restart_map {n : ℕ} (hn : 0 < n) (B : ℝ) (hB : 0 < B) :
    (boardClockMeasure n (B/n)).map (firstRestart hn) =
      (((expMeasure (n*B)).prod (uniformGrid hn)).prod markMeasure).prod
        (boardClockMeasure n (B/n)) := by
  rw [first_event_restart_map hn (B/n) (div_pos hB (by exact_mod_cast hn))]
  have hn0 : (n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  have he : (n : ℝ)^2*(B/n) = n*B := by field_simp
  rw [he]

theorem restartedBoard_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    (boardClockMeasure n rate).map (restartedBoard hn) = boardClockMeasure n rate := by
  letI := boardClockMeasure_probability n rate hr
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  letI := isProbabilityMeasure_expMeasure (mul_pos (sq_pos_of_pos hnR) hr)
  have hm := congrArg (fun ν => ν.map Prod.snd) (first_event_restart_map hn rate hr)
  rw [Measure.map_map measurable_snd (firstRestart_measurable hn), Measure.map_snd_prod,
    measure_univ, one_smul] at hm
  exact hm

theorem first_event_restart_independent {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    IndepFun (firstMarkedRace hn) (restartedBoard hn) (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  apply (indepFun_iff_map_prod_eq_prod_map_map
    (firstMarkedRace_measurable hn).aemeasurable (restartedBoard_measurable hn).aemeasurable).mpr
  rw [firstMarkedRace_map hn rate hr, restartedBoard_map hn rate hr]
  exact first_event_restart_map hn rate hr

end NoThreeLine.FirstEventRestartLaw

#print axioms NoThreeLine.FirstEventRestartLaw.candidate_first_event_restart_map
#print axioms NoThreeLine.FirstEventRestartLaw.first_event_restart_independent
