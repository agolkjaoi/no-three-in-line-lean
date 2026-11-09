import NoThreeLine.UnitSourceMean

/-! Unit-price Volterra inequality for the actual same-board cut process
when no distinct labels share a specified line. -/
set_option autoImplicit false
set_option maxHeartbeats 400000
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness

theorem restricted_calendarMeanSource_le_unitHierarchyMean {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCD : Disjoint C D) (hsep : SeparatedLabels cfg.directions (C∪D)) (δ : ℝ≥0)
    (hδR : (δ:ℝ)≤s.val.1.val.2) (u : ℝ) (hu : u≤s.val.1.val.2-δ) :
    calendarMeanSource cfg ε M (start-δ) e C D L hn (sourceRestrictGood cfg δ δ.coe_nonneg s) u≤
      unitHierarchyMean cfg ε M start e C D L hn s u := by
  let b : ℝ≥0 := ⟨s.val.1.val.2-δ-u,by linarith⟩
  have hR : (sourceRestrictGood cfg δ δ.coe_nonneg s).val.1.val.2=s.val.1.val.2-δ :=
    sourceRestrictState_remaining cfg δ δ.coe_nonneg s.val.1 hδR
  have hab : δ+b=elapsedCutAmount s.val.1.val.2 u := by
    apply NNReal.eq
    change (δ:ℝ)+(s.val.1.val.2-δ-u)=max 0 (s.val.1.val.2-u)
    rw [max_eq_right (by linarith [δ.coe_nonneg])]
    ring
  have htime : (start-(δ:ℝ))+cfg.horizon-b=observationTime cfg start s.val.1+u := by
    change (start-(δ:ℝ))+cfg.horizon-(s.val.1.val.2-δ-u)=start+cfg.horizon-s.val.1.val.2+u
    ring
  have hsub : (sourceRestrictGood cfg δ δ.coe_nonneg s).val.1.val.2-b=u := by
    rw [hR]
    change s.val.1.val.2-δ-(s.val.1.val.2-δ-u)=u
    ring
  have hh := calendarMeanSource_le_unitCutMean cfg ε M (start-δ) e C D L hn hB
    (sourceRestrictGood cfg δ δ.coe_nonneg s) hm hK hCD hsep b
  rw [hsub] at hh
  simp only [cutMixedMean_add,htime,hab] at hh
  exact hh

theorem elapsedMixedMean_unit_volterra {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D)
    (hsep : SeparatedLabels cfg.directions (C∪D)) (s : GoodObservation cfg)
    (t : ℝ) (ht : t∈Icc (0:ℝ) s.val.1.val.2) :
    elapsedMixedMean cfg ε M start e C D L hn s t≤goodMixed cfg e C D L s+
      ∫u in (0:ℝ)..t,unitHierarchyMean cfg ε M start e C D L hn s u := by
  let δ := elapsedCutAmount s.val.1.val.2 t
  have hδ : (δ:ℝ)=s.val.1.val.2-t := elapsedCutAmount_coe _ _ ht.2
  have hδR : (δ:ℝ)≤s.val.1.val.2 := by rw [hδ]; linarith [ht.1]
  have hr : max 0 (s.val.1.val.2-δ)=t := by
    rw [hδ]
    have he : s.val.1.val.2-(s.val.1.val.2-t)=t := by ring
    rw [he,max_eq_right ht.1]
  have hh := sourceCutTerminal_expected_mixed_bound cfg ε M start δ δ.coe_nonneg e C D L hn
    hB hm hK hCL hCD s
  rw [hr] at hh
  change elapsedMixedMean cfg ε M start e C D L hn s t≤goodMixed cfg e C D L s+
    ∫u in (0:ℝ)..t,calendarMeanSource cfg ε M (start-δ) e C D L hn
      (sourceRestrictGood cfg δ δ.coe_nonneg s) u at hh
  apply hh.trans
  apply add_le_add le_rfl
  have hfi : IntervalIntegrable (calendarMeanSource cfg ε M (start-δ) e C D L hn
      (sourceRestrictGood cfg δ δ.coe_nonneg s)) volume 0 t :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le ht.1).mpr
      (integrableOn_of_nonneg_bound volume (Ioo 0 t) measurableSet_Ioo _
        (calendarMeanSource_measurable cfg ε M (start-δ) e C D L hn hB (sourceRestrictGood cfg δ δ.coe_nonneg s)) _
        (fun u _=>calendarMeanSource_bounds cfg ε M (start-δ) e C D L hn hB
          (sourceRestrictGood cfg δ δ.coe_nonneg s) hm hK u))
  apply intervalIntegral.integral_mono_on_of_le_Ioo ht.1 hfi
    (unitHierarchyMean_intervalIntegrable cfg ε M start e C D L hn hB s hm 0 t)
  intro u hu
  apply restricted_calendarMeanSource_le_unitHierarchyMean cfg ε M start e C D L hn hB s hm hK hCD hsep δ hδR u
  rw [hδ]
  linarith [hu.2]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.elapsedMixedMean_unit_volterra
