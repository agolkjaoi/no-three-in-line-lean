import NoThreeLine.LineCreditCalendar
import NoThreeLine.PhysicalLineCreditRate
import NoThreeLine.BirthCalendarCut
import NoThreeLine.CalendarIntegralFubini

/-! The actual line-credit decay rate at a same-board calendar cut agrees
a.e. in time with the glued original path, including early stopping. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def cutCalendarLineCreditRate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (s : GoodObservation cfg) (x : BoardClockPath n × ℝ) : ℝ :=
  physicalLineCreditRate cfg.directions cfg.mask L
    (sourceCutTerminal cfg ε M start (calendarCut s x.2) (calendarCut s x.2).coe_nonneg hn s x.1).1.val.1.physical

theorem cutCalendarLineCreditRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (s : GoodObservation cfg) :
    Measurable (cutCalendarLineCreditRate cfg ε M start L hn s) := by
  let g : BoardClockPath n × ℝ → ℝ≥0 × BoardClockPath n := fun x => (calendarCut s x.2,x.1)
  have hg : Measurable g := ((calendarCut_measurable s).comp measurable_snd).prodMk measurable_fst
  have hc : Measurable (fun y : ℝ≥0 × BoardClockPath n =>
      (sourceCutTerminal cfg ε M start y.1 y.1.coe_nonneg hn s y.2).1.val.1.physical) :=
    (AugmentedState.measurable_physical n).comp
      (measurable_subtype_coe.fst.comp (sourceCutTerminal_base_joint_measurable cfg ε M start hn s))
  have hh := (physicalLineCreditRate_measurable cfg.directions cfg.mask L).comp (hc.comp hg)
  convert hh using 1
  rfl

theorem cutCalendarLineCreditRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) (x : BoardClockPath n × ℝ) :
    0 ≤ cutCalendarLineCreditRate cfg ε M start L hn s x ∧
      cutCalendarLineCreditRate cfg ε M start L hn s x ≤ (L.val.card : ℝ) * (cfg.B/n) :=
  physicalLineCreditRate_bounds cfg.directions cfg.mask L _ cfg.B hB
    (fun q => ⟨cfg.mask_nonneg q,hm q⟩)
    (sourceCutTerminal cfg ε M start (calendarCut s x.2) (calendarCut s x.2).coe_nonneg hn s x.1).1.property.1.1

theorem cutLineCreditRate_eq_capped_interior {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (s : GoodObservation cfg) (δ : ℝ≥0) (j : ℕ)
    (ω : BoardClockPath n)
    (ht : s.val.1.val.2-δ ∈ Ioo (elapsedTime cfg ε M start hn s j ω)
      (elapsedTime cfg ε M start hn s (j+1) ω)) :
    physicalLineCreditRate cfg.directions cfg.mask L
      (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω).1.val.1.physical =
        cappedLineCreditRate cfg ε M L ((augRecycledPair cfg ε M hn s.val.1 j ω).1,
          (s.val.1.val.2-δ)-birthCalendarTime cfg ε M hn s.val.1 j ω) := by
  have hh := (sourceCutTerminal_interior cfg ε M start δ δ.coe_nonneg hn s j ω ht).1
  have hc := (elapsed_segment_context cfg ε M start hn s j ω (s.val.1.val.2-δ) ht).2
  rw [← goodObservedRecycled_base cfg ε M start hn s j ω,
    ← elapsedTime_eq_birthCalendarTime cfg ε M start hn s j ω,
    cappedLineCreditRate_eq_flow cfg ε M L _ _ ⟨hc.1.le,hc.2.le⟩]
  rw [← physicalLineCreditRate_selected]
  exact congrArg (fun x : AugmentedState n × ℝ => physicalLineCreditRate cfg.directions cfg.mask L x.1.physical) hh

theorem terminalLineCreditCalendarRate_eq_cut_of_avoids {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (hn : 0 < n) (s : GoodObservation cfg)
    (ω : BoardClockPath n) (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω))
    (t : ℝ) (ht : t ∈ Ioc (0 : ℝ) s.val.1.val.2)
    (hne : ∀ j, t ≠ elapsedTime cfg ε M start hn s j ω) :
    terminalLineCreditCalendarRate cfg ε M L hn s.val.1 (ω,t) =
      cutCalendarLineCreditRate cfg ε M start L hn s (ω,t) := by
  let N := augRecycledCompletionIndex cfg ε M hn s.val.1 ω
  have hc := calendarCut_time s t ht.2
  by_cases h : t < elapsedTime cfg ε M start hn s N ω
  · obtain ⟨j,hj,hjt⟩ := CalendarIntegral.exists_open_segment
      (fun k => elapsedTime cfg ε M start hn s k ω) N t
      ⟨by simpa only [elapsedTime_zero] using ht.1,h⟩ (fun j _ => hne j)
    have hjc : s.val.1.val.2-calendarCut s t ∈ Ioo (elapsedTime cfg ε M start hn s j ω)
        (elapsedTime cfg ε M start hn s (j+1) ω) := by rw [hc]; exact hjt
    have hcut := cutLineCreditRate_eq_capped_interior cfg ε M start L hn s (calendarCut s t) j ω hjc
    rw [hc] at hcut
    change _ = physicalLineCreditRate cfg.directions cfg.mask L _
    rw [hcut]
    exact CalendarIntegral.sum_shiftedSegment_at_interior
      (fun k => birthCalendarTime cfg ε M hn s.val.1 k ω) (birthCalendarTime_monotone cfg ε M hn s.val.1 ω) N
      (fun k u => cappedLineCreditRate cfg ε M L ((augRecycledPair cfg ε M hn s.val.1 k ω).1,u)) j hj t
      (by simpa only [elapsedTime_eq_birthCalendarTime] using hjt)
  · have hgt : elapsedTime cfg ε M start hn s N ω < t :=
      lt_of_le_of_ne (le_of_not_gt h) (hne N).symm
    have hz : terminalLineCreditCalendarRate cfg ε M L hn s.val.1 (ω,t) = 0 := by
      apply CalendarIntegral.sum_shiftedSegment_zero_after
        (fun k => birthCalendarTime cfg ε M hn s.val.1 k ω) (birthCalendarTime_monotone cfg ε M hn s.val.1 ω) N
      rw [← elapsedTime_eq_birthCalendarTime cfg ε M start hn s N ω]
      exact hgt.le
    have hr : 0 < (augRecycledTerminal cfg ε M hn s.val.1 ω).val.2 := by
      rw [elapsedTime_eq_birthCalendarTime] at hgt
      change s.val.1.val.2-(augRecycledTerminal cfg ε M hn s.val.1 ω).val.2 < t at hgt
      linarith [ht.2]
    have hstop := hd.resolve_left (ne_of_gt hr)
    have he := sourceCutTerminal_after_completion_augmented cfg ε M start (calendarCut s t)
      (calendarCut s t).coe_nonneg hn s ω hd (by rw [hc]; exact hgt)
    rw [hz]
    unfold cutCalendarLineCreditRate
    rw [he,physicalLineCreditRate_stopped cfg.directions cfg.mask L _ hstop]

theorem terminalLineCreditCalendarRate_eq_cut_ae_time {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (hn : 0 < n) (s : GoodObservation cfg)
    (ω : BoardClockPath n) (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω)) :
    ∀ᵐ t : ℝ ∂volume, t ∈ Ioc (0 : ℝ) s.val.1.val.2 →
      terminalLineCreditCalendarRate cfg ε M L hn s.val.1 (ω,t) =
        cutCalendarLineCreditRate cfg ε M start L hn s (ω,t) := by
  filter_upwards [CalendarIntegral.ae_avoids_endpoints
    (fun j => elapsedTime cfg ε M start hn s j ω)] with t ht hmem
  exact terminalLineCreditCalendarRate_eq_cut_of_avoids cfg ε M start L hn s ω hd t hmem ht

theorem terminalLineCredit_decrement_cut_integral {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω)) :
    augTimedLineCredit cfg L s.val.1 - augTimedLineCredit cfg L (augRecycledTerminal cfg ε M hn s.val.1 ω) =
      ∫ t in (0 : ℝ)..s.val.1.val.2, cutCalendarLineCreditRate cfg ε M start L hn s (ω,t) := by
  rw [← terminalLineCreditCalendarRate_integral cfg ε M L hn hB hm s.val.1 ω]
  apply intervalIntegral.integral_congr_ae
  simpa only [uIoc_of_le s.val.1.property.2.1] using
    terminalLineCreditCalendarRate_eq_cut_ae_time cfg ε M start L hn s ω hd

end NoThreeLine

#print axioms NoThreeLine.cutCalendarLineCreditRate_measurable
#print axioms NoThreeLine.cutLineCreditRate_eq_capped_interior
#print axioms NoThreeLine.terminalLineCreditCalendarRate_eq_cut_ae_time
#print axioms NoThreeLine.terminalLineCredit_decrement_cut_integral
