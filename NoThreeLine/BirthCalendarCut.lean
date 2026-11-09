import NoThreeLine.BirthCalendarProjection
import NoThreeLine.SourceCutAfterCompletion

/-! Identification of the actual calendar birth rate with the same-board
cut state, outside its countably many update endpoints. Early stopping is
included; no assertion that deterministic times avoid random updates is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped NNReal

namespace NoThreeLine.BirthWitness

def calendarCut {n : ℕ} {cfg : FlowConfig n} (s : GoodObservation cfg) (t : ℝ) : ℝ≥0 :=
  Real.toNNReal (s.val.1.val.2-t)

theorem calendarCut_measurable {n : ℕ} {cfg : FlowConfig n} (s : GoodObservation cfg) :
    Measurable (calendarCut s) := (measurable_const.sub measurable_id).real_toNNReal

theorem calendarCut_time {n : ℕ} {cfg : FlowConfig n} (s : GoodObservation cfg)
    (t : ℝ) (ht : t≤s.val.1.val.2) : s.val.1.val.2-calendarCut s t=t := by
  rw [calendarCut,Real.coe_toNNReal _ (sub_nonneg.mpr ht)]
  ring

def cutCalendarBirthRate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : GoodObservation cfg) (x : BoardClockPath n × ℝ) : ℝ :=
  (cutProcess cfg ε M start hn s (calendarCut s x.2,x.1)).birthRate cfg.mask p

theorem cutCalendarBirthRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (cutCalendarBirthRate cfg ε M start p hn s) :=
  (process_birthRate_measurable cfg.mask p).comp
    ((cutProcess_measurable cfg ε M start hn s).comp
      (((calendarCut_measurable s).comp measurable_snd).prodMk measurable_fst))

theorem cutProcess_birthRate_zero_after_completion {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (δ : ℝ≥0) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω))
    (ht : elapsedTime cfg ε M start hn s
      (augRecycledCompletionIndex cfg ε M hn s.val.1 ω) ω<s.val.1.val.2-δ) :
    (cutProcess cfg ε M start hn s (δ,ω)).birthRate cfg.mask p=0 := by
  have hr : 0<(augRecycledTerminal cfg ε M hn s.val.1 ω).val.2 := by
    rw [elapsedTime_eq_birthCalendarTime] at ht
    change s.val.1.val.2-(augRecycledTerminal cfg ε M hn s.val.1 ω).val.2<s.val.1.val.2-δ at ht
    linarith [δ.coe_nonneg]
  have hs := hd.resolve_left (ne_of_gt hr)
  have he := sourceCutTerminal_after_completion_augmented cfg ε M start δ δ.coe_nonneg hn s ω hd ht
  have hstop : (cutProcess cfg ε M start hn s (δ,ω)).stopped=true := by
    unfold cutProcess
    rw [he]
    exact hs
  simp only [ProcessState.birthRate,hstop,Bool.true_eq_false, false_and,ite_false]

theorem terminalBirthCalendarRate_eq_cut_of_avoids {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω))
    (t : ℝ) (ht : t∈Ioc (0:ℝ) s.val.1.val.2)
    (hne : ∀j,t≠elapsedTime cfg ε M start hn s j ω) :
    terminalBirthCalendarRate cfg ε M p hn s.val.1 (ω,t)=
      cutCalendarBirthRate cfg ε M start p hn s (ω,t) := by
  let N := augRecycledCompletionIndex cfg ε M hn s.val.1 ω
  have hc := calendarCut_time s t ht.2
  by_cases h : t<elapsedTime cfg ε M start hn s N ω
  · obtain ⟨j,hj,hjt⟩ := CalendarIntegral.exists_open_segment
      (fun k=>elapsedTime cfg ε M start hn s k ω) N t
      ⟨by simpa only [elapsedTime_zero] using ht.1,h⟩ (fun j _=>hne j)
    have hjc : s.val.1.val.2-calendarCut s t∈Ioo (elapsedTime cfg ε M start hn s j ω)
        (elapsedTime cfg ε M start hn s (j+1) ω) := by rw [hc]; exact hjt
    have he := terminalBirthCalendarRate_eq_cut_interior cfg ε M start p hn s (calendarCut s t) j ω hj hjc
    rw [hc] at he
    exact he
  · have hgt : elapsedTime cfg ε M start hn s N ω<t :=
      lt_of_le_of_ne (le_of_not_gt h) (hne N).symm
    have hz : terminalBirthCalendarRate cfg ε M p hn s.val.1 (ω,t)=0 := by
      apply finiteBirthCalendarRate_zero_after
      rw [←elapsedTime_eq_birthCalendarTime cfg ε M start hn s N ω]
      exact hgt.le
    rw [hz]
    exact (cutProcess_birthRate_zero_after_completion cfg ε M start p hn s (calendarCut s t) ω hd
      (by rw [hc]; exact hgt)).symm

theorem terminalBirthCalendarRate_eq_cut_ae_time {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω)) :
    ∀ᵐt : ℝ ∂volume,t∈Ioc (0:ℝ) s.val.1.val.2→
      terminalBirthCalendarRate cfg ε M p hn s.val.1 (ω,t)=
        cutCalendarBirthRate cfg ε M start p hn s (ω,t) := by
  filter_upwards [CalendarIntegral.ae_avoids_endpoints
    (fun j=>elapsedTime cfg ε M start hn s j ω)] with t ht hmem
  exact terminalBirthCalendarRate_eq_cut_of_avoids cfg ε M start p hn s ω hd t hmem ht

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cutCalendarBirthRate_measurable
#print axioms NoThreeLine.BirthWitness.terminalBirthCalendarRate_eq_cut_ae_time
