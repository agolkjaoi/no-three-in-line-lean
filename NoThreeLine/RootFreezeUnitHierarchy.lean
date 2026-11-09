import NoThreeLine.RootFreezeHierarchy
import NoThreeLine.UnitSourceProduct

/-! On separated labels, the same actual frozen-source comparison leads
to the sharp unit-price hierarchy, without dropping any price by fiat. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

theorem calendarMeanSource_le_unitHierarchyMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCD : Disjoint C D) (hsep : SeparatedLabels cfg.directions (C∪D))
    (t : ℝ) (ht : t≤s.val.1.val.2) :
    calendarMeanSource cfg ε M start e C D L hn s t≤
      unitHierarchyMean cfg ε M start e C D L hn s t := by
  simpa only [NNReal.coe_zero,sub_zero,sourceRestrictGood_zero] using
    restricted_calendarMeanSource_le_unitHierarchyMean cfg ε M start e C D L hn hB s hm hK hCD hsep
      0 s.val.1.property.2.1 t (by simpa only [NNReal.coe_zero,sub_zero] using ht)

theorem terminal_expected_rootMixed_unit_hierarchy {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (hsep : SeparatedLabels cfg.directions (C∪D))
    (s : GoodRootObservation cfg p) :
    (∫ω,mixed cfg.directions C D L (rootBoundaryWitness cfg ε M start e p hn s.val ω)
      ∂boardClockMeasure n (cfg.B/n))≤goodRootMixed cfg p e C D L s+
        ∫t in (0:ℝ)..s.val.1.1.val.2,
          unitHierarchyMean cfg ε M start e C D L hn (goodRootActual cfg p s) t := by
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
    (unitHierarchyMean_intervalIntegrable cfg ε M start e C D L hn hB a hm 0 a.val.1.val.2)
    (fun t ht=>calendarMeanSource_le_unitHierarchyMean cfg ε M start e C D L hn hB a hm hK hCD hsep t ht.2.le)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminal_expected_rootMixed_unit_hierarchy
