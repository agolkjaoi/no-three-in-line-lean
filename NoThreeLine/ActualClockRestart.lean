import NoThreeLine.FixedWinnerRestart

/-! Actual first-event residual clocks, using the already fixed tie rule.
The winning site consumes its first wait and mark. Losing sites retain
their marks and subtract the first time from only their first wait. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine.ActualClockRestart
open ClockRestartBase DeterministicClockRestart FiniteClockRestart
open FirstEventSections FixedWinnerRestart VariableResidualSection
open BoardFirstCandidate BoardWinnerLaw WinnerMarkLaw

theorem restartAt_joint_measurable {n : ℕ} (p : Grid n) :
    Measurable (fun z : ℝ × BoardClockPath n => restartAt p z.1 z.2) := by
  unfold restartAt
  apply (joinSite_measurable p).comp
  apply Measurable.prodMk
  · exact (tail_measurable.comp (measurable_fst.comp ((measurable_pi_apply p).comp measurable_snd))).prodMk
      (tail_measurable.comp (measurable_snd.comp ((measurable_pi_apply p).comp measurable_snd)))
  · exact (residualFamily_joint_measurable (OtherSites p)).comp
      (measurable_fst.prodMk (measurable_pi_lambda _
        (fun q => (measurable_pi_apply q.val).comp measurable_snd)))

def restartedBoard {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) : BoardClockPath n :=
  restartAt (winner hn ω) (firstTime hn ω) ω

theorem restartedBoard_apply {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (q : Grid n) :
    restartedBoard hn ω q =
      if q = winner hn ω then (tail (ω q).1,tail (ω q).2)
      else residualMarked (firstTime hn ω) (ω q) := by
  classical
  by_cases h : q = winner hn ω
  · simp [restartedBoard, restartAt, joinSite, h]
  · simp [restartedBoard, restartAt, joinSite, h]

theorem restartedBoard_measurable {n : ℕ} (hn : 0 < n) : Measurable (restartedBoard hn) := by
  classical
  apply measurable_pi_lambda
  intro q
  simp_rw [restartedBoard_apply]
  apply Measurable.ite (measurableSet_eq_fun measurable_const (winner_measurable hn))
  · exact (tail_measurable.comp (measurable_fst.comp (measurable_pi_apply q))).prodMk
      (tail_measurable.comp (measurable_snd.comp (measurable_pi_apply q)))
  · exact (residual_joint_measurable.comp
      ((firstTime_measurable hn).prodMk (measurable_fst.comp (measurable_pi_apply q)))).prodMk
        (measurable_snd.comp (measurable_pi_apply q))

theorem winner_eq_of_strict {n : ℕ} (hn : 0 < n) (p : Grid n)
    (ω : BoardClockPath n) (h : ω ∈ strictWinner p) : winner hn ω = p := by
  by_contra hne
  have hs := h ⟨winner hn ω,hne⟩
  have hl := firstTime_le_firstWait hn ω p
  rw [← winner_attains hn ω] at hl
  simp only [firstWait_eq] at hl
  exact (not_lt_of_ge hl) hs

theorem winner_fiber_ae_strict {n : ℕ} (hn : 0 < n) (p : Grid n)
    (rate : ℝ) (hr : 0 < rate) :
    {ω : BoardClockPath n | winner hn ω = p} =ᵐ[boardClockMeasure n rate] strictWinner p := by
  filter_upwards [firstWait_ae_distinct n rate hr] with ω hd
  apply propext
  constructor
  · intro hp q
    have hl := firstTime_le_firstWait hn ω q.val
    rw [← winner_attains hn ω, hp] at hl
    have hne := hd p q.val (Ne.symm q.property)
    simpa only [firstWait_eq] using lt_of_le_of_ne hl hne
  · exact winner_eq_of_strict hn p ω

def sectionPairOutput {n : ℕ} (p : Grid n) (ω : BoardClockPath n) :
    (ℝ × ℝ) × BoardClockPath n :=
  (((ω p).1 0,(ω p).2 0),restartAt p ((ω p).1 0) ω)

theorem sectionPairOutput_measurable {n : ℕ} (p : Grid n) : Measurable (sectionPairOutput p) := by
  unfold sectionPairOutput
  have htime : Measurable (fun ω : BoardClockPath n => (ω p).1 0) := by
    simpa only [firstWait_eq] using firstWait_measurable p
  exact (((measurable_pi_apply 0).comp (measurable_fst.comp (measurable_pi_apply p))).prodMk
    ((measurable_pi_apply 0).comp (measurable_snd.comp (measurable_pi_apply p)))).prodMk
      ((restartAt_joint_measurable p).comp (htime.prodMk measurable_id))

theorem section_pair_map {n : ℕ} (p : Grid n) (rate : ℝ) (hr : 0 < rate) :
    ((boardClockMeasure n rate).restrict (strictWinner p)).map (sectionPairOutput p) =
      (Fintype.card (OtherSites p) + 1 : ℝ≥0∞)⁻¹ •
        (((expMeasure (((Fintype.card (OtherSites p) : ℝ)+1)*rate)).prod markMeasure).prod
          (boardClockMeasure n rate)) := by
  letI := boardClockMeasure_probability n rate hr
  have hr' : 0 < ((Fintype.card (OtherSites p) : ℝ)+1)*rate := mul_pos (by positivity) hr
  letI := isProbabilityMeasure_expMeasure hr'
  have ha := MeasurePreserving.symm MeasurableEquiv.prodAssoc
    (measurePreserving_prodAssoc (expMeasure (((Fintype.card (OtherSites p) : ℝ)+1)*rate))
      markMeasure (boardClockMeasure n rate))
  have hm := congrArg (fun μ => μ.map MeasurableEquiv.prodAssoc.symm)
    (fixed_winner_restart_map p rate hr)
  have hs : Measurable (sectionOutput p) :=
    MeasurableEquiv.prodAssoc.measurable.comp (sectionPairOutput_measurable p)
  rw [Measure.map_map ha.measurable hs, Measure.map_smul, ha.map_eq] at hm
  exact hm

def timeMarkRestart {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) :
    (ℝ × ℝ) × BoardClockPath n :=
  ((firstTime hn ω,winnerMark hn ω),restartedBoard hn ω)

theorem timeMarkRestart_measurable {n : ℕ} (hn : 0 < n) : Measurable (timeMarkRestart hn) :=
  ((firstTime_measurable hn).prodMk (winnerMark_measurable hn)).prodMk (restartedBoard_measurable hn)

theorem fixed_actual_pair_map {n : ℕ} (hn : 0 < n) (p : Grid n) (rate : ℝ) (hr : 0 < rate) :
    ((boardClockMeasure n rate).restrict {ω | winner hn ω = p}).map (timeMarkRestart hn) =
      (Fintype.card (OtherSites p) + 1 : ℝ≥0∞)⁻¹ •
        (((expMeasure (((Fintype.card (OtherSites p) : ℝ)+1)*rate)).prod markMeasure).prod
          (boardClockMeasure n rate)) := by
  rw [Measure.restrict_congr_set (winner_fiber_ae_strict hn p rate hr)]
  have he : timeMarkRestart hn =ᵐ[(boardClockMeasure n rate).restrict (strictWinner p)]
      sectionPairOutput p := by
    filter_upwards [ae_restrict_mem (strictWinner_measurable p)] with ω hω
    have hp := winner_eq_of_strict hn p ω hω
    have ht := winner_attains hn ω
    rw [hp, firstWait_eq] at ht
    simp [timeMarkRestart, sectionPairOutput, restartedBoard, winnerMark, candidateMark, hp, ← ht]
  rw [Measure.map_congr he]
  exact section_pair_map p rate hr

end NoThreeLine.ActualClockRestart

#print axioms NoThreeLine.ActualClockRestart.fixed_actual_pair_map
