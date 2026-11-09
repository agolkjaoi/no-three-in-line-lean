import NoThreeLine.FirstEventRestartLaw

/-! Combine actual first-candidate restart and actual no-arrival residual
clocks at a deterministic cap. The observed capped update is independent
of the actual remaining board, whose law is the original board law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal

namespace NoThreeLine.CappedClockRestart
open BoardFirstCandidate BoardWinnerLaw WinnerMarkLaw FiniteClockRestart
open ActualClockRestart FirstEventRestartLaw

abbrev Event (n : ℕ) := (ℝ × Grid n) × ℝ

def observe {n : ℕ} {X : Type*} (hn : 0 < n) (T : ℝ) (f : Event n → X) (b : X)
    (ω : BoardClockPath n) : X :=
  if firstTime hn ω ≤ T then f (firstMarkedRace hn ω) else b

def residualBoard {n : ℕ} (hn : 0 < n) (T : ℝ) (ω : BoardClockPath n) : BoardClockPath n :=
  if firstTime hn ω ≤ T then restartedBoard hn ω else residualFamily T ω

theorem observe_measurable {n : ℕ} {X : Type*} [MeasurableSpace X]
    (hn : 0 < n) (T : ℝ) (f : Event n → X) (b : X) (hf : Measurable f) :
    Measurable (observe hn T f b) :=
  Measurable.ite (measurableSet_le (firstTime_measurable hn) measurable_const)
    (hf.comp (firstMarkedRace_measurable hn)) measurable_const

theorem residualBoard_measurable {n : ℕ} (hn : 0 < n) (T : ℝ) :
    Measurable (residualBoard hn T) :=
  Measurable.ite (measurableSet_le (firstTime_measurable hn) measurable_const)
    (restartedBoard_measurable hn) (residualFamily_measurable (Grid n) T)

theorem late_set {n : ℕ} (hn : 0 < n) (T : ℝ) :
    {ω : BoardClockPath n | T < firstTime hn ω} = allSurvive T := by
  ext ω
  simp only [mem_setOf_eq,lt_firstTime_iff,firstWait_eq,allSurvive]

theorem late_rectangle {n : ℕ} (hn : 0 < n) (rate T : ℝ) (hr : 0 < rate) (hT : 0 ≤ T)
    (D : Set (BoardClockPath n)) (hD : MeasurableSet D) :
    boardClockMeasure n rate ({ω | T < firstTime hn ω} ∩ residualFamily T ⁻¹' D) =
      boardClockMeasure n rate {ω | T < firstTime hn ω} * boardClockMeasure n rate D := by
  letI := boardClockMeasure_probability n rate hr
  have hm := board_residual_restrict_map n rate T hr hT
  have hd := congrArg (fun μ : Measure (BoardClockPath n) => μ D) hm
  have hu := congrArg (fun μ : Measure (BoardClockPath n) => μ univ) hm
  rw [Measure.map_apply (residualFamily_measurable (Grid n) T) hD,
    Measure.restrict_apply (hD.preimage (residualFamily_measurable (Grid n) T)),
    Measure.smul_apply,smul_eq_mul] at hd
  rw [Measure.map_apply (residualFamily_measurable (Grid n) T) MeasurableSet.univ,
    preimage_univ,Measure.restrict_apply MeasurableSet.univ,Measure.smul_apply,smul_eq_mul] at hu
  simp only [preimage_univ,univ_inter,measure_univ,mul_one] at hu
  rw [late_set,inter_comm,hd,hu]

theorem capped_rectangle {n : ℕ} {X : Type*} [MeasurableSpace X]
    (hn : 0 < n) (rate T : ℝ) (hr : 0 < rate) (hT : 0 ≤ T)
    (f : Event n → X) (b : X) (hf : Measurable f)
    (A : Set X) (D : Set (BoardClockPath n)) (hA : MeasurableSet A) (hD : MeasurableSet D) :
    boardClockMeasure n rate (observe hn T f b ⁻¹' A ∩ residualBoard hn T ⁻¹' D) =
      boardClockMeasure n rate (observe hn T f b ⁻¹' A) * boardClockMeasure n rate D := by
  let E : Set (Event n) := {z | z.1.1 ≤ T ∧ f z ∈ A}
  let L : Set (BoardClockPath n) := {ω | T < firstTime hn ω}
  have hE : MeasurableSet E :=
    (measurableSet_le measurable_fst.fst measurable_const).inter (hA.preimage hf)
  have hL : MeasurableSet L := measurableSet_lt measurable_const (firstTime_measurable hn)
  have hd : Disjoint (firstMarkedRace hn ⁻¹' E) L := by
    apply Set.disjoint_left.mpr
    intro ω he hl
    exact (not_le_of_gt hl) he.1
  have hd' : Disjoint (firstMarkedRace hn ⁻¹' E ∩ restartedBoard hn ⁻¹' D)
      (L ∩ residualFamily T ⁻¹' D) := hd.mono inter_subset_left inter_subset_left
  by_cases hb : b ∈ A
  · have hobs : observe hn T f b ⁻¹' A = firstMarkedRace hn ⁻¹' E ∪ L := by
      ext ω
      by_cases ht : firstTime hn ω ≤ T
      · simp only [mem_preimage,observe,if_pos ht,mem_union,E,mem_setOf_eq,L]
        change f (firstMarkedRace hn ω) ∈ A ↔ (_ ∧ _) ∨ _
        simp only [show (firstMarkedRace hn ω).1.1 ≤ T from ht,true_and,not_lt_of_ge ht,or_false]
      · simp only [mem_preimage,observe,if_neg ht,mem_union,E,mem_setOf_eq,L]
        exact iff_of_true hb (Or.inr (lt_of_not_ge ht))
    have hboth : observe hn T f b ⁻¹' A ∩ residualBoard hn T ⁻¹' D =
        (firstMarkedRace hn ⁻¹' E ∩ restartedBoard hn ⁻¹' D) ∪ (L ∩ residualFamily T ⁻¹' D) := by
      ext ω
      by_cases ht : firstTime hn ω ≤ T
      · simp only [mem_inter_iff,mem_preimage,observe,residualBoard,if_pos ht,
          mem_union,E,L,mem_setOf_eq]
        change (_ ∧ _) ↔ ((_ ∧ _) ∧ _) ∨ (_ ∧ _)
        simp only [show (firstMarkedRace hn ω).1.1 ≤ T from ht,true_and,not_lt_of_ge ht,false_and,or_false]
      · simp only [mem_inter_iff,mem_preimage,observe,residualBoard,if_neg ht,
          mem_union,E,L,mem_setOf_eq]
        simp only [hb,true_and,show ¬(firstMarkedRace hn ω).1.1 ≤ T from ht,false_and,
          false_or,lt_of_not_ge ht]
    rw [hboth,measure_union hd' ((hL.inter (hD.preimage (residualFamily_measurable (Grid n) T)))),
      first_event_restart_rectangle hn rate hr E D hE hD,
      late_rectangle hn rate T hr hT D hD,hobs,measure_union hd hL,add_mul]
  · have hobs : observe hn T f b ⁻¹' A = firstMarkedRace hn ⁻¹' E := by
      ext ω
      by_cases ht : firstTime hn ω ≤ T
      · simp only [mem_preimage,observe,if_pos ht,E,mem_setOf_eq]
        simp only [show (firstMarkedRace hn ω).1.1 ≤ T from ht,true_and]
      · simp only [mem_preimage,observe,if_neg ht,E,mem_setOf_eq]
        simp only [hb,show ¬(firstMarkedRace hn ω).1.1 ≤ T from ht,false_and]
    have hboth : observe hn T f b ⁻¹' A ∩ residualBoard hn T ⁻¹' D =
        firstMarkedRace hn ⁻¹' E ∩ restartedBoard hn ⁻¹' D := by
      rw [hobs]
      ext ω
      by_cases he : ω ∈ firstMarkedRace hn ⁻¹' E
      · have ht : firstTime hn ω ≤ T := he.1
        simp only [mem_inter_iff,he,true_and,mem_preimage,residualBoard,if_pos ht]
      · simp only [mem_inter_iff,he,false_and]
    rw [hboth,first_event_restart_rectangle hn rate hr E D hE hD,hobs]

theorem capped_restart_map {n : ℕ} {X : Type*} [MeasurableSpace X]
    (hn : 0 < n) (rate T : ℝ) (hr : 0 < rate) (hT : 0 ≤ T)
    (f : Event n → X) (b : X) (hf : Measurable f) :
    (boardClockMeasure n rate).map (fun ω => (observe hn T f b ω,residualBoard hn T ω)) =
      ((boardClockMeasure n rate).map (observe hn T f b)).prod (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  apply Measure.ext_prod
  intro A D hA hD
  rw [Measure.map_apply ((observe_measurable hn T f b hf).prodMk (residualBoard_measurable hn T)) (hA.prod hD),
    Measure.prod_prod,Measure.map_apply (observe_measurable hn T f b hf) hA]
  exact capped_rectangle hn rate T hr hT f b hf A D hA hD

end NoThreeLine.CappedClockRestart

#print axioms NoThreeLine.CappedClockRestart.late_rectangle
#print axioms NoThreeLine.CappedClockRestart.capped_restart_map
