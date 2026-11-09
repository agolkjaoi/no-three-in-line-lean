import NoThreeLine.AugmentedLineCreditLoss
import NoThreeLine.BirthRunningRate

/-! A jointly measurable actual line-credit rate, extended by clamping
outside the selected interval. It agrees with the ODE rate inside. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem selectedLineCreditRate_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) :
    Measurable (fun x : StateBall n cfg.box × ℝ => selectedLineCreditRate cfg x.1 L x.2) := by
  have hm : Measurable (fun x : Coordinates n × ProcessMode n =>
      x.1.2.2 L * creditDamping (modeSkeleton x.2) cfg.directions cfg.mask x.1 L) :=
    measurable_from_prod_countable_left (fun m =>
      (((continuous_apply L).comp continuous_snd.snd).mul
        (creditDamping_continuous (modeSkeleton m) cfg.directions cfg.mask L)).measurable)
  exact hm.comp ((selectedCurve_measurable cfg).prodMk
    ((ExtendedState.measurable_mode n).comp (measurable_subtype_coe.comp measurable_fst)))

def cappedLineCreditRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (x : AugTimedState cfg × ℝ) : ℝ :=
  selectedLineCreditRate cfg (augTimedInput cfg x.1).1.1 L
    (augAdvance cfg ε M (augTimedInput cfg x.1,x.2))

theorem cappedLineCreditRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) :
    Measurable (cappedLineCreditRate cfg ε M L) :=
  (selectedLineCreditRate_measurable cfg L).comp
    ((((augTimedInput_measurable cfg).comp measurable_fst).fst.fst).prodMk
      ((augAdvance_measurable cfg ε M).comp
        (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd)))

theorem cappedLineCreditRate_eq_flow {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (s : AugTimedState cfg) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (augGuardTime cfg ε M (augTimedInput cfg s))) :
    cappedLineCreditRate cfg ε M L (s,t) = selectedLineCreditRate cfg (augTimedInput cfg s).1.1 L t := by
  unfold cappedLineCreditRate
  have ha : augAdvance cfg ε M (augTimedInput cfg s,t) = t := by
    change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) t) = t
    rw [min_eq_right ht.2,max_eq_right ht.1]
  rw [ha]

theorem cappedLineCreditRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1) (x : AugTimedState cfg × ℝ) :
    0 ≤ cappedLineCreditRate cfg ε M L x ∧
      cappedLineCreditRate cfg ε M L x ≤ (L.val.card : ℝ) * (cfg.B/n) := by
  have ht := augAdvance_mem cfg ε M (augTimedInput cfg x.1) x.1.property.1.1 x.2
  have hsel := selectedTrajectory_valid cfg (augTimedInput cfg x.1).1.1 x.1.property.1.1 _
    ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M _ x.1.property.1.1).2⟩
  have hr := hsel.2.1.2.2 L
  have hi : lineIntensity (augTimedInput cfg x.1).1.1.val.process cfg.mask
      (selectedCurve cfg ((augTimedInput cfg x.1).1.1,augAdvance cfg ε M (augTimedInput cfg x.1,x.2))) L =
        ∑ q ∈ L.val, cappedBirthRate cfg ε M q x := rfl
  have hsum0 : 0 ≤ ∑ q ∈ L.val, cappedBirthRate cfg ε M q x :=
    Finset.sum_nonneg (fun q _ => (cappedBirthRate_bounds cfg ε M q hn hB hm x).1)
  have hsum : (∑ q ∈ L.val, cappedBirthRate cfg ε M q x) ≤ (L.val.card : ℝ) * (cfg.B/n) := by
    calc
      _ ≤ ∑ _q ∈ L.val, cfg.B/n := Finset.sum_le_sum (fun q _ => (cappedBirthRate_bounds cfg ε M q hn hB hm x).2)
      _ = _ := by simp
  have hcap0 : 0 ≤ (L.val.card : ℝ) * (cfg.B/n) := by positivity
  unfold cappedLineCreditRate selectedLineCreditRate creditDamping
  split_ifs
  · rw [hi]
    exact ⟨mul_nonneg hr.1 hsum0,(mul_le_of_le_one_left hsum0 hr.2).trans hsum⟩
  · simp only [mul_zero]
    exact ⟨le_rfl,hcap0⟩

theorem augTimedLineLoss_capped_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (s : AugTimedState cfg) (z : CandidateData n) :
    augTimedLineLoss cfg ε M L (s,z) =
      ∫ u in (0 : ℝ)..birthElapsed cfg ε M (s,z), cappedLineCreditRate cfg ε M L (s,u) := by
  unfold augTimedLineLoss birthElapsed birthDone
  split_ifs
  · simp
  · apply intervalIntegral.integral_congr
    intro u hu
    have ht := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    rw [uIcc_of_le ht.1] at hu
    exact (cappedLineCreditRate_eq_flow cfg ε M L s u ⟨hu.1,hu.2.trans ht.2⟩).symm

end NoThreeLine

#print axioms NoThreeLine.selectedLineCreditRate_measurable
#print axioms NoThreeLine.cappedLineCreditRate_bounds
#print axioms NoThreeLine.augTimedLineLoss_capped_integral
