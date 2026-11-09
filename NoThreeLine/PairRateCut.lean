import NoThreeLine.PairRateCalendar
import NoThreeLine.BirthCalendarCut
import NoThreeLine.CalendarIntegralFubini

/-! The actual pair-rate at a same-board calendar cut agrees
a.e. in time with the glued original pair-rate path, including early stopping. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def physicalPairRate {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ)
    (a b : Grid n) (e : ExtendedState n) : ℝ := pairRate e.process Γ mask e.coordinates a b

theorem physicalPairRate_stopped {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ)
    (a b : Grid n) (e : ExtendedState n) (hs : e.process.stopped=true) :
    physicalPairRate Γ mask a b e=0 := pairRate_stopped _ _ _ _ _ _ hs

theorem physicalPairRate_measurable {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ)
    (a b : Grid n) : Measurable (physicalPairRate Γ mask a b) :=
  PairWitness.state_pairRate_measurable Γ mask a b

theorem cappedPairRate_eq_physical {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (s : AugTimedState cfg) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg s))) :
    cappedPairRate cfg ε M a b (s,t)=physicalPairRate cfg.directions cfg.mask a b
      (selectedTrajectory cfg ((augTimedInput cfg s).1.1,t)) := by
  rw [cappedPairRate_eq_flow cfg ε M a b s t ht]
  exact (selectedTrajectory_pairRate cfg (augTimedInput cfg s).1.1 t a b).symm

def cutCalendarPairRate {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (s : GoodObservation cfg) (x : BoardClockPath n × ℝ) : ℝ :=
  physicalPairRate cfg.directions cfg.mask a b
    (sourceCutTerminal cfg ε M start (calendarCut s x.2) (calendarCut s x.2).coe_nonneg hn s x.1).1.val.1.physical

theorem cutCalendarPairRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (s : GoodObservation cfg) :
    Measurable (cutCalendarPairRate cfg ε M start a b hn s) := by
  let g : BoardClockPath n × ℝ → ℝ≥0 × BoardClockPath n := fun x => (calendarCut s x.2,x.1)
  have hg : Measurable g := ((calendarCut_measurable s).comp measurable_snd).prodMk measurable_fst
  have hc : Measurable (fun y : ℝ≥0 × BoardClockPath n =>
      (sourceCutTerminal cfg ε M start y.1 y.1.coe_nonneg hn s y.2).1.val.1.physical) :=
    (AugmentedState.measurable_physical n).comp
      (measurable_subtype_coe.fst.comp (sourceCutTerminal_base_joint_measurable cfg ε M start hn s))
  have hh := (physicalPairRate_measurable cfg.directions cfg.mask a b).comp (hc.comp hg)
  convert hh using 1
  rfl

theorem cutCalendarPairRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) (x : BoardClockPath n × ℝ) :
    0 ≤ cutCalendarPairRate cfg ε M start a b hn s x ∧
      cutCalendarPairRate cfg ε M start a b hn s x ≤ pairRateCap n cfg.B :=
  state_pairRate_bounds cfg.directions cfg.mask
    (fun q => ⟨cfg.mask_nonneg q,hm q⟩) a b _ cfg.B hB
    (sourceCutTerminal cfg ε M start (calendarCut s x.2) (calendarCut s x.2).coe_nonneg hn s x.1).1.property.1.1

theorem cutPairRate_eq_capped_interior {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (a b : Grid n) (hn : 0 < n) (s : GoodObservation cfg) (δ : ℝ≥0) (j : ℕ)
    (ω : BoardClockPath n)
    (ht : s.val.1.val.2-δ ∈ Ioo (elapsedTime cfg ε M start hn s j ω)
      (elapsedTime cfg ε M start hn s (j+1) ω)) :
    physicalPairRate cfg.directions cfg.mask a b
      (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω).1.val.1.physical =
        cappedPairRate cfg ε M a b ((augRecycledPair cfg ε M hn s.val.1 j ω).1,
          (s.val.1.val.2-δ)-birthCalendarTime cfg ε M hn s.val.1 j ω) := by
  have hh := (sourceCutTerminal_interior cfg ε M start δ δ.coe_nonneg hn s j ω ht).1
  have hc := (elapsed_segment_context cfg ε M start hn s j ω (s.val.1.val.2-δ) ht).2
  rw [← goodObservedRecycled_base cfg ε M start hn s j ω,
    ← elapsedTime_eq_birthCalendarTime cfg ε M start hn s j ω,
    cappedPairRate_eq_physical cfg ε M a b _ _ ⟨hc.1.le,hc.2.le⟩]
  exact congrArg (fun x : AugmentedState n × ℝ => physicalPairRate cfg.directions cfg.mask a b x.1.physical) hh

theorem terminalPairCalendarRate_eq_cut_of_avoids {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (a b : Grid n) (hn : 0 < n) (s : GoodObservation cfg)
    (ω : BoardClockPath n) (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω))
    (t : ℝ) (ht : t ∈ Ioc (0 : ℝ) s.val.1.val.2)
    (hne : ∀ j, t ≠ elapsedTime cfg ε M start hn s j ω) :
    terminalPairCalendarRate cfg ε M a b hn s.val.1 (ω,t) =
      cutCalendarPairRate cfg ε M start a b hn s (ω,t) := by
  let N := augRecycledCompletionIndex cfg ε M hn s.val.1 ω
  have hc := calendarCut_time s t ht.2
  by_cases h : t < elapsedTime cfg ε M start hn s N ω
  · obtain ⟨j,hj,hjt⟩ := CalendarIntegral.exists_open_segment
      (fun k => elapsedTime cfg ε M start hn s k ω) N t
      ⟨by simpa only [elapsedTime_zero] using ht.1,h⟩ (fun j _ => hne j)
    have hjc : s.val.1.val.2-calendarCut s t ∈ Ioo (elapsedTime cfg ε M start hn s j ω)
        (elapsedTime cfg ε M start hn s (j+1) ω) := by rw [hc]; exact hjt
    have hcut := cutPairRate_eq_capped_interior cfg ε M start a b hn s (calendarCut s t) j ω hjc
    rw [hc] at hcut
    change _ = physicalPairRate cfg.directions cfg.mask a b _
    rw [hcut]
    exact CalendarIntegral.sum_shiftedSegment_at_interior
      (fun k => birthCalendarTime cfg ε M hn s.val.1 k ω) (birthCalendarTime_monotone cfg ε M hn s.val.1 ω) N
      (fun k u => cappedPairRate cfg ε M a b ((augRecycledPair cfg ε M hn s.val.1 k ω).1,u)) j hj t
      (by simpa only [elapsedTime_eq_birthCalendarTime] using hjt)
  · have hgt : elapsedTime cfg ε M start hn s N ω < t :=
      lt_of_le_of_ne (le_of_not_gt h) (hne N).symm
    have hz : terminalPairCalendarRate cfg ε M a b hn s.val.1 (ω,t) = 0 := by
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
    unfold cutCalendarPairRate
    rw [he,physicalPairRate_stopped cfg.directions cfg.mask a b _ hstop]

theorem terminalPairCalendarRate_eq_cut_ae_time {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (a b : Grid n) (hn : 0 < n) (s : GoodObservation cfg)
    (ω : BoardClockPath n) (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω)) :
    ∀ᵐ t : ℝ ∂volume, t ∈ Ioc (0 : ℝ) s.val.1.val.2 →
      terminalPairCalendarRate cfg ε M a b hn s.val.1 (ω,t) =
        cutCalendarPairRate cfg ε M start a b hn s (ω,t) := by
  filter_upwards [CalendarIntegral.ae_avoids_endpoints
    (fun j => elapsedTime cfg ε M start hn s j ω)] with t ht hmem
  exact terminalPairCalendarRate_eq_cut_of_avoids cfg ε M start a b hn s ω hd t hmem ht

theorem terminalPairCost_cut_integral {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (a b : Grid n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω)) :
    terminalPairCost cfg ε M hn a b s.val.1 ω =
      ∫ t in (0 : ℝ)..s.val.1.val.2, cutCalendarPairRate cfg ε M start a b hn s (ω,t) := by
  rw [← terminalPairCalendarRate_integral cfg ε M a b hn hB hm s.val.1 ω]
  apply intervalIntegral.integral_congr_ae
  simpa only [uIoc_of_le s.val.1.property.2.1] using
    terminalPairCalendarRate_eq_cut_ae_time cfg ε M start a b hn s ω hd

theorem terminalPairCost_cut_integral_ae {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (a b : Grid n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : GoodObservation cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), terminalPairCost cfg ε M hn a b s.val.1 ω =
      ∫ t in (0 : ℝ)..s.val.1.val.2, cutCalendarPairRate cfg ε M start a b hn s (ω,t) := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.val.1] with ω hω
  exact terminalPairCost_cut_integral cfg ε M start a b hn hB hm s ω hω

end NoThreeLine

#print axioms NoThreeLine.cutCalendarPairRate_measurable
#print axioms NoThreeLine.cutPairRate_eq_capped_interior
#print axioms NoThreeLine.terminalPairCalendarRate_eq_cut_ae_time
#print axioms NoThreeLine.terminalPairCost_cut_integral
#print axioms NoThreeLine.terminalPairCost_cut_integral_ae
