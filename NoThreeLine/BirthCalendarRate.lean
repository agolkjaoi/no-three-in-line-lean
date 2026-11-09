import NoThreeLine.BirthCalendarTime

/-! Glue the actual birth-rate segments in real time. The value is zero at
segment endpoints; those finitely many points do not affect the integral.
This is an expected-count identity, not a predictable-filtration theorem. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def finiteBirthCalendarRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (x : BoardClockPath n × ℝ) : ℝ :=
  ∑j∈Finset.range k,birthCalendarSegment cfg ε M p hn s j x

theorem finiteBirthCalendarRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) :
    Measurable (finiteBirthCalendarRate cfg ε M p hn s k) :=
  Finset.measurable_sum _ (fun j _=>birthCalendarSegment_measurable cfg ε M p hn s j)

theorem finiteBirthCalendarRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (k : ℕ) (x : BoardClockPath n × ℝ) :
    0≤finiteBirthCalendarRate cfg ε M p hn s k x ∧
      finiteBirthCalendarRate cfg ε M p hn s k x≤cfg.B/n := by
  exact CalendarIntegral.sum_shiftedSegment_bounds
    (fun j=>birthCalendarTime cfg ε M hn s j x.1) (birthCalendarTime_monotone cfg ε M hn s x.1) k
    (fun j t=>cappedBirthRate cfg ε M p ((augRecycledPair cfg ε M hn s j x.1).1,t))
    (cfg.B/n) (div_nonneg hB.le (by positivity))
    (fun j _ t _=>cappedBirthRate_bounds cfg ε M p hn hB hm _) x.2

theorem finiteBirthCalendarRate_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    (∫t in (0:ℝ)..(cfg.horizon:ℝ),finiteBirthCalendarRate cfg ε M p hn s k (ω,t))=
      cumulativeBirthRate cfg ε M p hn s k ω := by
  have h := CalendarIntegral.sum_shiftedSegment_integral
    (fun j=>birthCalendarTime cfg ε M hn s j ω) (birthCalendarTime_monotone cfg ε M hn s ω) k
    (cfg.horizon:ℝ) (by rw [birthCalendarTime_zero]) (birthCalendarTime_mem cfg ε M hn s k ω).2
    (fun j t=>cappedBirthRate cfg ε M p ((augRecycledPair cfg ε M hn s j ω).1,t))
    (fun j _=>(cappedBirthRate_measurable cfg ε M p).comp (measurable_const.prodMk measurable_id))
    (cfg.B/n) (div_nonneg hB.le (by positivity))
    (fun j _ t _=>cappedBirthRate_bounds cfg ε M p hn hB hm _)
  change (∫t in (0:ℝ)..(cfg.horizon:ℝ),finiteBirthCalendarRate cfg ε M p hn s k (ω,t))=_ at h
  rw [h]
  unfold cumulativeBirthRate
  apply Finset.sum_congr rfl
  intro j _
  rw [birthCalendarTime_succ_sub]
  rfl

def terminalBirthCalendarRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n)
    (s : AugTimedState cfg) (x : BoardClockPath n × ℝ) : ℝ :=
  finiteBirthCalendarRate cfg ε M p hn s (augRecycledCompletionIndex cfg ε M hn s x.1) x

theorem terminalBirthCalendarRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (s : AugTimedState cfg) :
    Measurable (terminalBirthCalendarRate cfg ε M p hn s) := by
  classical
  exact Measurable.find (finiteBirthCalendarRate_measurable cfg ε M p hn s)
    (fun k=>((augRecycledCompletionPredicate_measurable cfg ε M hn s k).comp measurable_fst).setOf)
    (fun x : BoardClockPath n × ℝ=>augRecycledCompletionPredicate_exists cfg ε M hn s x.1)

theorem terminalBirthCalendarRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (x : BoardClockPath n × ℝ) :
    0≤terminalBirthCalendarRate cfg ε M p hn s x ∧ terminalBirthCalendarRate cfg ε M p hn s x≤cfg.B/n :=
  finiteBirthCalendarRate_bounds cfg ε M p hn hB hm s _ x

theorem terminalBirthCalendarRate_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ω : BoardClockPath n) :
    (∫t in (0:ℝ)..(cfg.horizon:ℝ),terminalBirthCalendarRate cfg ε M p hn s (ω,t))=
      terminalBirthRate cfg ε M p hn s ω := by
  unfold terminalBirthCalendarRate terminalBirthRate
  exact finiteBirthCalendarRate_integral cfg ε M p hn hB hm s
    (augRecycledCompletionIndex cfg ε M hn s ω) ω

theorem terminal_selectedIndicator_calendar_compensation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    (∫ω,selectedIndicator cfg p (augRecycledTerminal cfg ε M hn s ω) ∂boardClockMeasure n (cfg.B/n))=
      selectedIndicator cfg p s+
        ∫ω,(∫t in (0:ℝ)..(cfg.horizon:ℝ),terminalBirthCalendarRate cfg ε M p hn s (ω,t))
          ∂boardClockMeasure n (cfg.B/n) := by
  simp_rw [terminalBirthCalendarRate_integral cfg ε M p hn hB hm s]
  exact terminal_selectedIndicator_compensation cfg ε M p hn hB hm s

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminalBirthCalendarRate_measurable
#print axioms NoThreeLine.BirthWitness.terminalBirthCalendarRate_integral
#print axioms NoThreeLine.BirthWitness.terminal_selectedIndicator_calendar_compensation
