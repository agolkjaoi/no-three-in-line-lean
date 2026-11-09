import NoThreeLine.BoardWinnerLaw

/-! The mark attached to the actual winning first candidate is independent
of the first time and winner, by the actual wait/mark product decomposition. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine
namespace WinnerMarkLaw
open BoardFirstCandidate BoardWinnerLaw

abbrev BoardSequence (n : ℕ) := Grid n → ClockPath

def boardWaitMeasure (n : ℕ) (rate : ℝ) : Measure (BoardSequence n) :=
  Measure.infinitePi (fun _ : Grid n => clockMeasure rate)

def boardMarkMeasure (n : ℕ) : Measure (BoardSequence n) :=
  Measure.infinitePi (fun _ : Grid n => markSequenceMeasure)

theorem boardWaitMeasure_probability (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    IsProbabilityMeasure (boardWaitMeasure n rate) := by
  letI := clockMeasure_probability rate hr
  unfold boardWaitMeasure
  infer_instance

instance boardMarkMeasure_probability (n : ℕ) : IsProbabilityMeasure (boardMarkMeasure n) := by
  unfold boardMarkMeasure
  infer_instance

def splitBoard {n : ℕ} (ω : BoardClockPath n) : BoardSequence n × BoardSequence n :=
  (fun p => (ω p).1, fun p => (ω p).2)

theorem splitBoard_measurable (n : ℕ) : Measurable (@splitBoard n) := by
  unfold splitBoard
  fun_prop

theorem splitBoard_preserving (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    MeasurePreserving (@splitBoard n) (boardClockMeasure n rate)
      ((boardWaitMeasure n rate).prod (boardMarkMeasure n)) := by
  letI := clockMeasure_probability rate hr
  letI := markedClockMeasure_probability rate hr
  have hp := measurePreserving_arrowProdEquivProdArrow ClockPath ClockPath (Grid n)
    (fun _ => clockMeasure rate) (fun _ => markSequenceMeasure)
  have he : (MeasurableEquiv.arrowProdEquivProdArrow ClockPath ClockPath (Grid n) :
      BoardClockPath n → BoardSequence n × BoardSequence n) = splitBoard := rfl
  rw [he] at hp
  simpa only [boardClockMeasure, markedClockMeasure, boardWaitMeasure, boardMarkMeasure,
    Measure.infinitePi_eq_pi] using hp

def waitOnly {n : ℕ} (W : BoardSequence n) : BoardClockPath n := fun p => (W p, fun _ => 0)

theorem waitOnly_measurable (n : ℕ) : Measurable (@waitOnly n) := by
  unfold waitOnly
  fun_prop

def raceFromWaits {n : ℕ} (hn : 0 < n) (W : BoardSequence n) : ℝ × Grid n :=
  firstRace hn (waitOnly W)

theorem raceFromWaits_measurable {n : ℕ} (hn : 0 < n) : Measurable (raceFromWaits hn) :=
  (firstRace_measurable hn).comp (waitOnly_measurable n)

@[simp] theorem raceFromWaits_split {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) :
    raceFromWaits hn (splitBoard ω).1 = firstRace hn ω := rfl

theorem boardWaits_preserving (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    MeasurePreserving (fun ω : BoardClockPath n => (splitBoard ω).1)
      (boardClockMeasure n rate) (boardWaitMeasure n rate) := by
  have hf : MeasurePreserving Prod.fst
      ((boardWaitMeasure n rate).prod (boardMarkMeasure n)) (boardWaitMeasure n rate) := by
    refine ⟨measurable_fst, ?_⟩
    simp [Measure.map_fst_prod]
  exact hf.comp (splitBoard_preserving n rate hr)

theorem raceFromWaits_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    (boardWaitMeasure n rate).map (raceFromWaits hn) =
      (expMeasure ((n : ℝ)^2 * rate)).prod (uniformGrid hn) := by
  rw [← (boardWaits_preserving n rate hr).map_eq,
    Measure.map_map (raceFromWaits_measurable hn) (boardWaits_preserving n rate hr).measurable]
  exact firstRace_map hn rate hr

theorem boardMark_eval_preserving {n : ℕ} (p : Grid n) :
    MeasurePreserving (fun M : BoardSequence n => M p 0) (boardMarkMeasure n) markMeasure := by
  have hp : MeasurePreserving (fun M : BoardSequence n => M p)
      (boardMarkMeasure n) markSequenceMeasure :=
    ⟨measurable_pi_apply p, Measure.infinitePi_map_eval _ p⟩
  have hz : MeasurePreserving (fun M : ClockPath => M 0) markSequenceMeasure markMeasure :=
    ⟨measurable_pi_apply 0, markSequenceMeasure_map 0⟩
  exact hz.comp hp

def selectedMark {n : ℕ} (hn : 0 < n) (z : BoardSequence n × BoardSequence n) : ℝ :=
  z.2 (raceFromWaits hn z.1).2 0

theorem selectedMark_measurable {n : ℕ} (hn : 0 < n) : Measurable (selectedMark hn) := by
  classical
  have he : selectedMark hn = fun z : BoardSequence n × BoardSequence n =>
      ∑ p : Grid n, if (raceFromWaits hn z.1).2 = p then z.2 p 0 else 0 := by
    funext z
    simp [selectedMark]
  rw [he]
  apply Finset.measurable_sum
  intro p _
  apply Measurable.ite
  · exact (measurableSet_singleton p).preimage
      ((raceFromWaits_measurable hn).comp measurable_fst).snd
  · fun_prop
  · fun_prop

def markedRaceFromSplit {n : ℕ} (hn : 0 < n)
    (z : BoardSequence n × BoardSequence n) : (ℝ × Grid n) × ℝ :=
  (raceFromWaits hn z.1, selectedMark hn z)

theorem markedRaceFromSplit_measurable {n : ℕ} (hn : 0 < n) :
    Measurable (markedRaceFromSplit hn) :=
  ((raceFromWaits_measurable hn).comp measurable_fst).prodMk (selectedMark_measurable hn)

theorem markedRaceFromSplit_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    ((boardWaitMeasure n rate).prod (boardMarkMeasure n)).map (markedRaceFromSplit hn) =
      ((boardWaitMeasure n rate).map (raceFromWaits hn)).prod markMeasure := by
  letI := boardWaitMeasure_probability n rate hr
  apply Measure.ext_prod
  intro A U hA hU
  rw [Measure.map_apply (markedRaceFromSplit_measurable hn) (hA.prod hU), Measure.prod_prod,
    Measure.prod_apply ((hA.prod hU).preimage (markedRaceFromSplit_measurable hn))]
  have hsec (W : BoardSequence n) :
      boardMarkMeasure n (Prod.mk W ⁻¹' (markedRaceFromSplit hn ⁻¹' (A ×ˢ U))) =
        (raceFromWaits hn ⁻¹' A).indicator (fun _ => markMeasure U) W := by
    by_cases h : raceFromWaits hn W ∈ A
    · have he : Prod.mk W ⁻¹' (markedRaceFromSplit hn ⁻¹' (A ×ˢ U)) =
          (fun M : BoardSequence n => M (raceFromWaits hn W).2 0) ⁻¹' U := by
        ext M
        simp [markedRaceFromSplit, selectedMark, h]
      rw [he, ← (boardMark_eval_preserving (raceFromWaits hn W).2).map_eq,
        Measure.map_apply (boardMark_eval_preserving (raceFromWaits hn W).2).measurable hU]
      rw [Set.indicator_of_mem (show W ∈ raceFromWaits hn ⁻¹' A from h)]
    · have he : Prod.mk W ⁻¹' (markedRaceFromSplit hn ⁻¹' (A ×ˢ U)) = ∅ := by
        ext M
        simp [markedRaceFromSplit, h]
      rw [he, measure_empty,
        Set.indicator_of_notMem (show W ∉ raceFromWaits hn ⁻¹' A from h)]
  simp_rw [hsec]
  rw [lintegral_indicator (hA.preimage (raceFromWaits_measurable hn)), lintegral_const,
    Measure.restrict_apply_univ, Measure.map_apply (raceFromWaits_measurable hn) hA]
  exact mul_comm _ _

def winnerMark {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) : ℝ :=
  candidateMark ω (winner hn ω, 0)

def firstMarkedRace {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) : (ℝ × Grid n) × ℝ :=
  (firstRace hn ω, winnerMark hn ω)

theorem firstMarkedRace_measurable {n : ℕ} (hn : 0 < n) : Measurable (firstMarkedRace hn) := by
  have he : firstMarkedRace hn = markedRaceFromSplit hn ∘ splitBoard := rfl
  rw [he]
  exact (markedRaceFromSplit_measurable hn).comp (splitBoard_measurable n)

theorem firstMarkedRace_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    (boardClockMeasure n rate).map (firstMarkedRace hn) =
      ((expMeasure ((n : ℝ)^2 * rate)).prod (uniformGrid hn)).prod markMeasure := by
  have he : firstMarkedRace hn = markedRaceFromSplit hn ∘ splitBoard := rfl
  rw [he, ← Measure.map_map (markedRaceFromSplit_measurable hn) (splitBoard_measurable n),
    (splitBoard_preserving n rate hr).map_eq, markedRaceFromSplit_map hn rate hr,
    raceFromWaits_map hn rate hr]

theorem candidate_firstMarkedRace_map {n : ℕ} (hn : 0 < n) (B : ℝ) (hB : 0 < B) :
    (boardClockMeasure n (B/n)).map (firstMarkedRace hn) =
      ((expMeasure (n * B)).prod (uniformGrid hn)).prod markMeasure := by
  rw [firstMarkedRace_map hn (B/n) (div_pos hB (by exact_mod_cast hn))]
  have hn0 : (n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  congr 3
  field_simp

theorem winnerMark_measurable {n : ℕ} (hn : 0 < n) : Measurable (winnerMark hn) :=
  (firstMarkedRace_measurable hn).snd

theorem winnerMark_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    (boardClockMeasure n rate).map (winnerMark hn) = markMeasure := by
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  letI := isProbabilityMeasure_expMeasure (mul_pos (sq_pos_of_pos hnR) hr)
  have hm := congrArg (fun μ : Measure ((ℝ × Grid n) × ℝ) => μ.map Prod.snd)
    (firstMarkedRace_map hn rate hr)
  rw [Measure.map_map measurable_snd (firstMarkedRace_measurable hn)] at hm
  simpa only [firstMarkedRace, Function.comp_def, Measure.map_snd_prod,
    measure_univ, one_smul] using hm

theorem firstRace_winnerMark_independent {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    IndepFun (firstRace hn) (winnerMark hn) (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  apply (indepFun_iff_map_prod_eq_prod_map_map
    (firstRace_measurable hn).aemeasurable (winnerMark_measurable hn).aemeasurable).mpr
  rw [firstRace_map hn rate hr, winnerMark_map hn rate hr]
  exact firstMarkedRace_map hn rate hr

end WinnerMarkLaw
end NoThreeLine

#print axioms NoThreeLine.WinnerMarkLaw.candidate_firstMarkedRace_map
#print axioms NoThreeLine.WinnerMarkLaw.firstRace_winnerMark_independent
