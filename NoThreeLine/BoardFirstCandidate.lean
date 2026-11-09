import NoThreeLine.CandidateClockEvents

/-! The first race is derived from the actual independent board clocks.
The winning label and its joint law with the mark are not asserted here. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped ENNReal Topology BigOperators

namespace NoThreeLine
namespace BoardFirstCandidate

def firstWait {n : ℕ} (ω : BoardClockPath n) (p : Grid n) : ℝ :=
  candidateTime (ω p).1 0

@[simp] theorem firstWait_eq {n : ℕ} (ω : BoardClockPath n) (p : Grid n) :
    firstWait ω p = (ω p).1 0 := by simp [firstWait]

theorem firstWait_measurable {n : ℕ} (p : Grid n) :
    Measurable (fun ω : BoardClockPath n => firstWait ω p) := by
  simp only [firstWait_eq]
  exact (measurable_pi_apply 0).comp
    (measurable_fst.comp (measurable_pi_apply p))

theorem firstWait_preserving {n : ℕ} (rate : ℝ) (hr : 0 < rate) (p : Grid n) :
    MeasurePreserving (fun ω : BoardClockPath n => firstWait ω p)
      (boardClockMeasure n rate) (expMeasure rate) := by
  letI := markedClockMeasure_probability rate hr
  have hp : MeasurePreserving (fun ω : BoardClockPath n => ω p)
      (boardClockMeasure n rate) (markedClockMeasure rate) :=
    ⟨measurable_pi_apply p, Measure.infinitePi_map_eval _ p⟩
  have hw : MeasurePreserving (fun ω : ClockPath => ω 0)
      (clockMeasure rate) (expMeasure rate) :=
    ⟨measurable_pi_apply 0, clockMeasure_map_wait rate hr 0⟩
  simpa only [Function.comp_def, firstWait_eq] using
    hw.comp ((markedClockMeasure_fst rate hr).comp hp)

theorem firstWait_independent (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    iIndepFun (fun p : Grid n => fun ω : BoardClockPath n => firstWait ω p)
      (boardClockMeasure n rate) := by
  simpa only [Function.comp_def, firstWait_eq] using
    (boardClockMeasure_independent n rate hr).comp
      (fun _ (ω : MarkedClockPath) => ω.1 0) (fun _ => by fun_prop)

theorem firstWait_Ioi_measure {n : ℕ} (rate : ℝ) (hr : 0 < rate)
    (p : Grid n) (T : ℝ) :
    boardClockMeasure n rate {ω | T < firstWait ω p} = expMeasure rate (Ioi T) := by
  rw [← (firstWait_preserving rate hr p).map_eq,
    Measure.map_apply (firstWait_measurable p) measurableSet_Ioi]
  rfl

theorem all_firstWait_survival (n : ℕ) (rate T : ℝ) (hr : 0 < rate) (hT : 0 ≤ T) :
    (boardClockMeasure n rate).real {ω | ∀ p : Grid n, T < firstWait ω p} =
      Real.exp (-((n : ℝ)^2 * rate * T)) := by
  have hprod := (firstWait_independent n rate hr).meas_iInter
    (s := fun p => {ω | T < firstWait ω p}) (fun p =>
      measurableSet_Ioi.preimage (comap_measurable (fun ω => firstWait ω p)))
  have hset : {ω : BoardClockPath n | ∀ p, T < firstWait ω p} =
      ⋂ p : Grid n, {ω | T < firstWait ω p} := by ext ω; simp
  rw [measureReal_def, hset, hprod, ENNReal.toReal_prod]
  simp_rw [firstWait_Ioi_measure rate hr]
  change (∏ _p : Grid n, (expMeasure rate).real (Ioi T)) = _
  rw [expMeasure_real_Ioi rate T hr hT]
  simp only [Finset.prod_const, Finset.card_univ, Fintype.card_prod, Fintype.card_fin,
    ← Real.exp_nat_mul, Nat.cast_mul]
  congr 1
  ring

theorem grid_univ_nonempty {n : ℕ} (hn : 0 < n) :
    (Finset.univ : Finset (Grid n)).Nonempty :=
  ⟨(⟨0, hn⟩, ⟨0, hn⟩), Finset.mem_univ _⟩

def firstTime {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) : ℝ :=
  Finset.univ.inf' (grid_univ_nonempty hn) (firstWait ω)

theorem lt_firstTime_iff {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (T : ℝ) :
    T < firstTime hn ω ↔ ∀ p : Grid n, T < firstWait ω p := by
  simp [firstTime, Finset.lt_inf'_iff]

theorem firstTime_measurable {n : ℕ} (hn : 0 < n) : Measurable (firstTime hn) := by
  apply measurable_of_Ioi
  intro T
  have hs : firstTime hn ⁻¹' Ioi T = ⋂ p : Grid n, {ω | T < firstWait ω p} := by
    ext ω
    simp [lt_firstTime_iff]
  rw [hs]
  exact MeasurableSet.iInter (fun p => measurableSet_lt measurable_const (firstWait_measurable p))

theorem firstTime_survival {n : ℕ} (hn : 0 < n) (rate T : ℝ)
    (hr : 0 < rate) (hT : 0 ≤ T) :
    (boardClockMeasure n rate).real {ω | T < firstTime hn ω} =
      Real.exp (-((n : ℝ)^2 * rate * T)) := by
  simp_rw [lt_firstTime_iff]
  exact all_firstWait_survival n rate T hr hT

theorem candidate_firstTime_survival {n : ℕ} (hn : 0 < n) (B T : ℝ)
    (hB : 0 < B) (hT : 0 ≤ T) :
    (boardClockMeasure n (B/n)).real {ω | T < firstTime hn ω} =
      Real.exp (-(n * B * T)) := by
  rw [firstTime_survival hn (B/n) T (div_pos hB (by exact_mod_cast hn)) hT]
  congr 1
  have hn0 : (n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  field_simp

theorem expMeasure_singleton (rate x : ℝ) : expMeasure rate {x} = 0 := by
  unfold expMeasure gammaMeasure
  exact measure_singleton x

theorem expMeasure_prod_diagonal (rate : ℝ) (hr : 0 < rate) :
    ((expMeasure rate).prod (expMeasure rate)) {z : ℝ × ℝ | z.1 = z.2} = 0 := by
  letI := isProbabilityMeasure_expMeasure hr
  rw [Measure.prod_apply (isClosed_eq continuous_fst continuous_snd).measurableSet]
  have hs (x : ℝ) : Prod.mk x ⁻¹' {z : ℝ × ℝ | z.1 = z.2} = {x} := by
    ext y
    simp [eq_comm]
  simp_rw [hs, expMeasure_singleton]
  simp

theorem firstWait_tie_zero {n : ℕ} (rate : ℝ) (hr : 0 < rate)
    (p q : Grid n) (hpq : p ≠ q) :
    boardClockMeasure n rate {ω | firstWait ω p = firstWait ω q} = 0 := by
  letI := boardClockMeasure_probability n rate hr
  have hm := ((firstWait_independent n rate hr).indepFun hpq).map_prod_eq_prod_map_map
    (firstWait_measurable p).aemeasurable (firstWait_measurable q).aemeasurable
  rw [(firstWait_preserving rate hr p).map_eq,
    (firstWait_preserving rate hr q).map_eq] at hm
  have hz := expMeasure_prod_diagonal rate hr
  rw [← hm, Measure.map_apply ((firstWait_measurable p).prodMk (firstWait_measurable q))
    (isClosed_eq continuous_fst continuous_snd).measurableSet] at hz
  exact hz

theorem firstWait_ae_distinct (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂boardClockMeasure n rate, ∀ p q : Grid n,
      p ≠ q → firstWait ω p ≠ firstWait ω q := by
  apply ae_all_iff.mpr
  intro p
  apply ae_all_iff.mpr
  intro q
  by_cases hpq : p = q
  · exact Filter.Eventually.of_forall (by simp [hpq])
  · have hh : ∀ᵐ ω ∂boardClockMeasure n rate, firstWait ω p ≠ firstWait ω q := by
      rw [ae_iff]
      simpa only [not_not] using firstWait_tie_zero rate hr p q hpq
    filter_upwards [hh] with ω hω
    exact fun _ => hω

theorem firstTime_attained {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) :
    ∃ p : Grid n, firstTime hn ω = firstWait ω p := by
  obtain ⟨p, _, hp⟩ := Finset.exists_mem_eq_inf' (grid_univ_nonempty hn) (firstWait ω)
  exact ⟨p, hp⟩

theorem firstTime_le_firstWait {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (p : Grid n) : firstTime hn ω ≤ firstWait ω p :=
  Finset.inf'_le _ (Finset.mem_univ p)

theorem firstTime_ae_positive {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂boardClockMeasure n rate, 0 < firstTime hn ω := by
  filter_upwards [boardCandidateTime_positive n rate hr] with ω hω
  exact (lt_firstTime_iff hn ω 0).mpr (fun p => (hω p).1 0)

theorem firstTime_real_Iic {n : ℕ} (hn : 0 < n) (rate T : ℝ) (hr : 0 < rate) :
    (boardClockMeasure n rate).real {ω | firstTime hn ω ≤ T} =
      if 0 ≤ T then 1 - Real.exp (-((n : ℝ)^2 * rate * T)) else 0 := by
  letI := boardClockMeasure_probability n rate hr
  by_cases hT : 0 ≤ T
  · have hc : {ω : BoardClockPath n | firstTime hn ω ≤ T} =
        {ω | T < firstTime hn ω}ᶜ := by ext ω; simp
    rw [if_pos hT, hc, measureReal_compl
      (measurableSet_lt measurable_const (firstTime_measurable hn)), probReal_univ,
      firstTime_survival hn rate T hr hT]
  · rw [if_neg hT]
    apply (measureReal_eq_zero_iff).mpr
    have hp := firstTime_ae_positive hn rate hr
    rw [ae_iff] at hp
    exact measure_mono_null (fun ω hω => by
      change ¬ 0 < firstTime hn ω
      have hneg : T < 0 := lt_of_not_ge hT
      exact not_lt_of_ge (hω.trans hneg.le)) hp

/-- Exact pushforward law of the actual first board candidate time. -/
theorem firstTime_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    (boardClockMeasure n rate).map (firstTime hn) = expMeasure ((n : ℝ)^2 * rate) := by
  letI := boardClockMeasure_probability n rate hr
  letI := Measure.isProbabilityMeasure_map
    (μ := boardClockMeasure n rate) (firstTime_measurable hn).aemeasurable
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have htotal : 0 < (n : ℝ)^2 * rate := mul_pos (sq_pos_of_pos hnR) hr
  letI := isProbabilityMeasure_expMeasure htotal
  apply Measure.ext_of_Iic
  intro T
  apply (measureReal_eq_measureReal_iff).mp
  rw [measureReal_def, Measure.map_apply (firstTime_measurable hn) measurableSet_Iic]
  change (boardClockMeasure n rate).real {ω | firstTime hn ω ≤ T} = _
  rw [firstTime_real_Iic hn rate T hr, expMeasure_real_Iic _ T htotal]

theorem candidate_firstTime_map {n : ℕ} (hn : 0 < n) (B : ℝ) (hB : 0 < B) :
    (boardClockMeasure n (B/n)).map (firstTime hn) = expMeasure (n * B) := by
  rw [firstTime_map hn (B/n) (div_pos hB (by exact_mod_cast hn))]
  congr 1
  have hn0 : (n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  field_simp

/-- Almost surely the minimum of wait0 is the unique first candidate of the
whole board, not just a minimum in an unrelated finite sample. -/
theorem firstTime_ae_first_candidate {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂boardClockMeasure n rate,
      0 < firstTime hn ω ∧
      (∀ z : Grid n × ℕ, firstTime hn ω ≤ candidateTime (ω z.1).1 z.2) ∧
      ∃! z : Grid n × ℕ, candidateTime (ω z.1).1 z.2 = firstTime hn ω := by
  filter_upwards [boardCandidateTime_positive n rate hr,
    firstWait_ae_distinct n rate hr, firstTime_ae_positive hn rate hr] with ω hpos hdist ht
  have hle (z : Grid n × ℕ) : firstTime hn ω ≤ candidateTime (ω z.1).1 z.2 :=
    (firstTime_le_firstWait hn ω z.1).trans ((hpos z.1).2.1.monotone (Nat.zero_le _))
  obtain ⟨p, hp⟩ := firstTime_attained hn ω
  refine ⟨ht, hle, (p, 0), hp.symm, ?_⟩
  rintro ⟨q, k⟩ hqk
  have hk : k = 0 := by
    by_contra hk
    have hs := (hpos q).2.1 (Nat.pos_of_ne_zero hk)
    have hq := firstTime_le_firstWait hn ω q
    change candidateTime (ω q).1 k = firstTime hn ω at hqk
    change firstTime hn ω ≤ candidateTime (ω q).1 0 at hq
    linarith
  subst k
  have hqp : q = p := by
    by_contra hqp
    exact hdist q p hqp (hqk.trans hp)
  subst q
  rfl

end BoardFirstCandidate
end NoThreeLine

#print axioms NoThreeLine.BoardFirstCandidate.candidate_firstTime_survival
#print axioms NoThreeLine.BoardFirstCandidate.firstWait_tie_zero
#print axioms NoThreeLine.BoardFirstCandidate.firstWait_ae_distinct
#print axioms NoThreeLine.BoardFirstCandidate.firstTime_ae_first_candidate
#print axioms NoThreeLine.BoardFirstCandidate.candidate_firstTime_map
