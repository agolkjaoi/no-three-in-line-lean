import NoThreeLine.SourceHierarchyBase
import NoThreeLine.FiniteVolterraHierarchy

/-! Instantiate the finite Volterra induction with the actual cut process.
All analytic source/base hypotheses are proved from its state and guard laws.
Only deterministic initial coordinates are supplied by the caller. -/
set_option autoImplicit false
set_option maxHeartbeats 400000
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem elapsedSourceCoefficient_intervalIntegrable {n : ℕ} (cfg : FlowConfig n) (start : ℝ)
    (e : Retention n) (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1) (q : Grid n) (a b : ℝ) :
    IntervalIntegrable (elapsedSourceCoefficient cfg start e s q) volume a b := by
  rw [intervalIntegrable_iff,uIoc]
  exact integrableOn_of_nonneg_bound volume (Ioc (min a b) (max a b)) measurableSet_Ioc _
    (elapsedSourceCoefficient_measurable cfg start e s q) _
    (fun t _=>elapsedSourceCoefficient_bounds cfg start e s hm q t)

theorem elapsedHierarchyTerm_intervalIntegrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1) (q : Grid n) (a b : ℝ) :
    IntervalIntegrable (fun t=>elapsedSourceCoefficient cfg start e s q t*
      elapsedMixedMean cfg ε M start e C D L hn s t) volume a b := by
  rw [intervalIntegrable_iff,uIoc]
  apply integrableOn_of_nonneg_bound volume (Ioc (min a b) (max a b)) measurableSet_Ioc _
    ((elapsedSourceCoefficient_measurable cfg start e s q).mul
      (elapsedMixedMean_measurable cfg ε M start e C D L hn hB s))
    (((1:ℝ)/n)*max 1 (protection 1 cfg.K)^cfg.directions.card*mixedCap C cfg.B)
  intro t _
  have hc := elapsedSourceCoefficient_bounds cfg start e s hm q t
  have hu := elapsedMixedMean_bounds cfg ε M start e C D L hn hB s t
  exact ⟨mul_nonneg hc.1 hu.1,mul_le_mul hc.2 hu.2 hu.1 (hc.1.trans hc.2)⟩

theorem elapsedMixedMean_subsets_product_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (A L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hAL : A⊆L) (s : GoodObservation cfg)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀p,(s.val.1.val.1.physical.process.accounts p).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) :
    ∀E⊆A,∀t∈Icc (0:ℝ) s.val.1.val.2,
      elapsedMixedMean cfg ε M start e (A\E) E L hn s t≤
        ∏q∈E,∫u in (0:ℝ)..t,elapsedSourceCoefficient cfg start e s q u := by
  classical
  let β := elapsedSourceCoefficient cfg start e s
  let U := fun E t=>elapsedMixedMean cfg ε M start e (A\E) E L hn s t
  have hbase : ∀t∈Icc (0:ℝ) s.val.1.val.2,U ∅ t≤1 := by
    intro t ht
    change elapsedMixedMean cfg ε M start e (A\∅) ∅ L hn s t≤1
    rw [Finset.sdiff_empty]
    exact (elapsedMixedMean_empty_le cfg ε M start e A L hn hB hm hK hAL s t ht).trans
      (goodMixed_empty_le_one_of_initial cfg e A L s hS hw hk)
  have hstep : ∀E⊆A,E.Nonempty→∀t∈Icc (0:ℝ) s.val.1.val.2,
      U E t≤∑q∈E,∫u in (0:ℝ)..t,β q u*U (E.erase q) u := by
    intro E hEA hE t ht
    obtain ⟨q0,hq0⟩ := hE
    have hEL : A\E⊆L := (Finset.sdiff_subset).trans hAL
    have hdis : Disjoint (A\E) E := Finset.disjoint_left.mpr
      (fun p hp hpe=>(Finset.mem_sdiff.mp hp).2 hpe)
    have hh := elapsedMixedMean_unborn_volterra cfg ε M start e (A\E) E L hn hB hm hK hEL hdis s
      q0 hq0 (by simp [hS]) t ht
    simp only [elapsedHierarchyMean] at hh
    rw [intervalIntegral.integral_finsetSum
      (fun q _=>elapsedHierarchyTerm_intervalIntegrable cfg ε M start e (insert q (A\E)) (E.erase q) L hn hB s hm q 0 t)] at hh
    apply hh.trans_eq
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
  have hh := FiniteSourceHierarchy.triangular_volterra_bound A β U 0 s.val.1.val.2 s.val.1.property.2.1
    (fun q _=>elapsedSourceCoefficient_intervalIntegrable cfg start e s hm q 0 s.val.1.val.2)
    (fun q _ t _=>(elapsedSourceCoefficient_bounds cfg start e s hm q t).1) hbase hstep
    (fun E _ q _=>elapsedHierarchyTerm_intervalIntegrable cfg ε M start e (A\(E.erase q)) (E.erase q) L hn hB s hm q 0 s.val.1.val.2)
  simpa only [FiniteSourceHierarchy.primitive] using hh

theorem elapsedMixedMean_product_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCD : Disjoint C D) (hCDL : C∪D⊆L)
    (s : GoodObservation cfg) (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀p,(s.val.1.val.1.physical.process.accounts p).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0)
    (t : ℝ) (ht : t∈Icc (0:ℝ) s.val.1.val.2) :
    elapsedMixedMean cfg ε M start e C D L hn s t≤
      ∏q∈D,∫u in (0:ℝ)..t,elapsedSourceCoefficient cfg start e s q u := by
  have hh := elapsedMixedMean_subsets_product_bound cfg ε M start e (C∪D) L hn hB hm hK hCDL s hS hw hk
    D Finset.subset_union_right t ht
  have he : (C∪D)\D=C := by
    ext p
    simp only [Finset.mem_sdiff,Finset.mem_union]
    exact ⟨fun h=>h.1.resolve_right h.2,fun h=>⟨Or.inl h,fun hp=>Finset.disjoint_left.mp hCD h hp⟩⟩
  rw [he] at hh
  exact hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.elapsedMixedMean_subsets_product_bound
#print axioms NoThreeLine.BirthWitness.elapsedMixedMean_product_bound
