import NoThreeLine.CoarseRandomPhaseHierarchy

/-! Actual coarse-price phase kernels propagate inherited product bounds.
No label-separation assumption is used. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness

theorem phaseCoarseCoefficient_bounds {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n)
    (hm : ∀q,cfg.mask q≤1) (q : Grid n) (t : ℝ) :
    0≤phaseCoarseCoefficient cfg start e q t ∧ phaseCoarseCoefficient cfg start e q t≤(1/n)*max 1 (AuxiliaryODE.protection 1 cfg.K)^cfg.directions.card := by
  have h := phaseUnitCoefficient_bounds cfg start e hm q t
  have hp : 0≤max 1 (AuxiliaryODE.protection 1 cfg.K)^cfg.directions.card :=
    pow_nonneg (le_max_of_le_left zero_le_one) _
  exact ⟨mul_nonneg h.1 hp,mul_le_mul_of_nonneg_right h.2 hp⟩

theorem phaseCoarseCoefficient_intervalIntegrable {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n)
    (hm : ∀q,cfg.mask q≤1) (q : Grid n) (a b : ℝ) :
    IntervalIntegrable (phaseCoarseCoefficient cfg start e q) volume a b := by
  rw [intervalIntegrable_iff,uIoc]
  exact integrableOn_of_nonneg_bound volume (Ioc (min a b) (max a b)) measurableSet_Ioc _
    (phaseCoarseCoefficient_measurable cfg start e q) _
    (fun t _=>phaseCoarseCoefficient_bounds cfg start e hm q t)

theorem phaseKernelCoarseHierarchyTerm_intervalIntegrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ]
    (hm : ∀q,cfg.mask q≤1) (q : Grid n) (a b : ℝ) :
    IntervalIntegrable (fun t=>phaseCoarseCoefficient cfg start e q t*
      phaseKernelMixedMean cfg ε M start e C D L hn μ t) volume a b := by
  rw [intervalIntegrable_iff,uIoc]
  apply integrableOn_of_nonneg_bound volume (Ioc (min a b) (max a b)) measurableSet_Ioc _
    ((phaseCoarseCoefficient_measurable cfg start e q).mul
      (phaseKernelMixedMean_measurable cfg ε M start e C D L hn hB μ)) ((((1:ℝ)/n)*max 1 (AuxiliaryODE.protection 1 cfg.K)^cfg.directions.card)*mixedCap C cfg.B)
  intro t _
  have hc := phaseCoarseCoefficient_bounds cfg start e hm q t
  have hu := phaseKernelMixedMean_bounds cfg ε M start e C D L hn hB μ t
  exact ⟨mul_nonneg hc.1 hu.1,mul_le_mul hc.2 hu.2 hu.1 (hc.1.trans hc.2)⟩

theorem phaseKernelMixedMean_subsets_coarse_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (A L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hAL : A⊆L)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ] (c : Grid n→ℝ)
    (hinit : ∀E⊆A,(∫s,goodPhaseMixed cfg.directions e (A\E) E L s ∂μ)≤∏q∈E,c q) :
    ∀E⊆A,∀t∈Icc (0:ℝ) cfg.horizon,
      phaseKernelMixedMean cfg ε M start e (A\E) E L hn μ t≤
        ∏q∈E,(c q+∫u in (0:ℝ)..t,phaseCoarseCoefficient cfg start e q u) := by
  classical
  let β := phaseCoarseCoefficient cfg start e
  let U := fun E t=>phaseKernelMixedMean cfg ε M start e (A\E) E L hn μ t
  have hbase : ∀t∈Icc (0:ℝ) cfg.horizon,U ∅ t≤1 := by
    intro t ht
    have hh := phaseKernelMixedMean_coarse_volterra cfg ε M start e A ∅ L hn hB hm hK hAL
      (Finset.disjoint_empty_right A) μ t ht
    have h0 := hinit ∅ (Finset.empty_subset _)
    simp only [Finset.sdiff_empty,Finset.prod_empty] at h0
    simp only [Finset.sum_empty,intervalIntegral.integral_zero,add_zero] at hh
    simpa only [U,Finset.sdiff_empty] using hh.trans h0
  have hstep : ∀E⊆A,E.Nonempty→∀t∈Icc (0:ℝ) cfg.horizon,
      U E t≤(∏q∈E,c q)+∑q∈E,∫u in (0:ℝ)..t,β q u*U (E.erase q) u := by
    intro E hEA _ t ht
    have hdis : Disjoint (A\E) E := Finset.disjoint_left.mpr
      (fun p hp hpe=>(Finset.mem_sdiff.mp hp).2 hpe)
    have hh := phaseKernelMixedMean_coarse_volterra cfg ε M start e (A\E) E L hn hB hm hK
      (Finset.sdiff_subset.trans hAL) hdis μ t ht
    rw [intervalIntegral.integral_finsetSum
      (fun q _=>phaseKernelCoarseHierarchyTerm_intervalIntegrable cfg ε M start e (insert q (A\E)) (E.erase q) L
        hn hB μ hm q 0 t)] at hh
    apply hh.trans
    apply add_le_add (hinit E hEA)
    apply le_of_eq
    apply Finset.sum_congr rfl
    intro q hq
    have hsets : insert q (A\E)=A\(E.erase q) := by
      ext p
      simp only [Finset.mem_insert,Finset.mem_sdiff,Finset.mem_erase]
      have hqA := hEA hq
      constructor
      · rintro (rfl | ⟨hpA,hpE⟩)
        · exact ⟨hqA,fun h=>h.1 rfl⟩
        · exact ⟨hpA,fun h=>hpE h.2⟩
      · rintro ⟨hpA,hpE⟩
        by_cases hpq : p=q
        · exact Or.inl hpq
        · exact Or.inr ⟨hpA,fun h=>hpE ⟨hpq,h⟩⟩
    rw [hsets]
  have hh := FiniteSourceHierarchy.shifted_triangular_volterra_bound A c β U 0 cfg.horizon cfg.horizon.coe_nonneg
    (fun q _=>phaseCoarseCoefficient_intervalIntegrable cfg start e hm q 0 cfg.horizon)
    (fun q _ t _=>(phaseCoarseCoefficient_bounds cfg start e hm q t).1) hbase hstep
    (fun E _ q _=>phaseKernelCoarseHierarchyTerm_intervalIntegrable cfg ε M start e (A\(E.erase q)) (E.erase q) L
      hn hB μ hm q 0 cfg.horizon)
  simpa only [FiniteSourceHierarchy.shiftedPrimitive,FiniteSourceHierarchy.primitive] using hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseKernelMixedMean_subsets_coarse_product
