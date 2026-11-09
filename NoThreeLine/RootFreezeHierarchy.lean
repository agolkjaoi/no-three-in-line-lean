import NoThreeLine.RootFreezeSourceTerminal
import NoThreeLine.PhaseCutEndpoint

/-! Dominate the actual frozen source by the already proved unfrozen
source on the same original board and physical completion index. This
connects the frozen terminal snapshot to the solved elapsed hierarchy;
it does not assume a restart law at a random frozen time. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

theorem terminalRootRunningSource_le_actual {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodRootObservation cfg p) (ω : BoardClockPath n) :
    terminalRootRunningSource cfg ε M start p e C D L hn s ω≤
      terminalRunningSource cfg ε M start e C D L hn (goodRootActual cfg p s) ω :=
  cumulativeRootRunningSource_le_actual cfg ε M start p e C D L hn hm hK s _ ω

theorem terminalRootRunningSource_mean_le_actual {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodRootObservation cfg p) :
    (∫ω,terminalRootRunningSource cfg ε M start p e C D L hn s ω ∂boardClockMeasure n (cfg.B/n))≤
      ∫ω,terminalRunningSource cfg ε M start e C D L hn (goodRootActual cfg p s) ω
        ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hf : Integrable (terminalRootRunningSource cfg ε M start p e C D L hn s)
      (boardClockMeasure n (cfg.B/n)) := GenericCreditIteration.bounded_nonnegative_integrable _ _
    (terminalRootRunningSource_measurable cfg ε M start p e C D L hn s)
    ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
    (fun ω=>cumulativeRootRunningSource_bounds cfg ε M start p e C D L hn hm hK s _ ω)
  have hg : Integrable (terminalRunningSource cfg ε M start e C D L hn (goodRootActual cfg p s))
      (boardClockMeasure n (cfg.B/n)) := GenericCreditIteration.bounded_nonnegative_integrable _ _
    (terminalRunningSource_measurable cfg ε M start e C D L hn (goodRootActual cfg p s))
    ((cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K)
    (fun ω=>cumulativeRunningSource_bounds cfg ε M start e C D L hn hm hK (goodRootActual cfg p s) _ ω)
  exact integral_mono hf hg (terminalRootRunningSource_le_actual cfg ε M start p e C D L hn hm hK s)

theorem calendarMeanSource_le_elapsedHierarchyMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (t : ℝ) (ht : t≤s.val.1.val.2) :
    calendarMeanSource cfg ε M start e C D L hn s t≤
      elapsedHierarchyMean cfg ε M start e C D L hn s t := by
  simpa only [NNReal.coe_zero,sub_zero,sourceRestrictGood_zero] using
    restricted_calendarMeanSource_le_elapsedHierarchyMean cfg ε M start e C D L hn hB s hm hK
      0 s.val.1.property.2.1 t (by simpa only [NNReal.coe_zero,sub_zero] using ht)

theorem terminal_expected_rootMixed_hierarchy_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodRootObservation cfg p) :
    (∫ω,mixed cfg.directions C D L (rootBoundaryWitness cfg ε M start e p hn s.val ω)
      ∂boardClockMeasure n (cfg.B/n))≤goodRootMixed cfg p e C D L s+
        ∫t in (0:ℝ)..s.val.1.1.val.2,
          elapsedHierarchyMean cfg ε M start e C D L hn (goodRootActual cfg p s) t := by
  have hh := terminal_expected_rootMixed_running_bound cfg ε M start p e C D L hn hB hm hK hCL hCD s
  apply hh.trans
  apply add_le_add le_rfl
  apply (terminalRootRunningSource_mean_le_actual cfg ε M start p e C D L hn hB hm hK s).trans
  rw [terminalRunningSource_mean_eq_timeIntegral cfg ε M start e C D L hn hB (goodRootActual cfg p s) hm hK]
  let a := goodRootActual cfg p s
  have hR : 0≤a.val.1.val.2 := a.val.1.property.2.1
  have hi : IntervalIntegrable (calendarMeanSource cfg ε M start e C D L hn a) volume 0 a.val.1.val.2 :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le hR).mpr
      (integrableOn_of_nonneg_bound volume (Ioo 0 a.val.1.val.2) measurableSet_Ioo _
        (calendarMeanSource_measurable cfg ε M start e C D L hn hB a) _
        (fun t _=>calendarMeanSource_bounds cfg ε M start e C D L hn hB a hm hK t))
  exact intervalIntegral.integral_mono_on_of_le_Ioo hR hi
    (elapsedHierarchyMean_intervalIntegrable cfg ε M start e C D L hn hB a hm 0 a.val.1.val.2)
    (fun t ht=>calendarMeanSource_le_elapsedHierarchyMean cfg ε M start e C D L hn hB a hm hK t ht.2.le)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminalRootRunningSource_le_actual
#print axioms NoThreeLine.BirthWitness.terminal_expected_rootMixed_hierarchy_bound
