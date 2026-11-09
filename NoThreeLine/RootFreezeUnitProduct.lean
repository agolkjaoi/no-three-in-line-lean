import NoThreeLine.RootFreezeUnitHierarchy
import NoThreeLine.RootFreezePointProduct

/-! Sharp frozen-boundary products when distinct labels do not share a
specified line. Separation is inherited by every lower hierarchy label
set; the unchanged coarse theorem remains available for other labels. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

theorem unitHierarchyMean_integral_product_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCD : Disjoint C D) (hCDL : C∪D⊆L)
    (hsep : SeparatedLabels cfg.directions (C∪D))
    (s : GoodObservation cfg) (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀p,(s.val.1.val.1.physical.process.accounts p).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) (hD : D.Nonempty) :
    (∫t in (0:ℝ)..s.val.1.val.2,unitHierarchyMean cfg ε M start e C D L hn s t)≤
      ∏q∈D,∫u in (0:ℝ)..s.val.1.val.2,unitSourceCoefficient cfg start e s q u := by
  classical
  let β := unitSourceCoefficient cfg start e s
  let R := s.val.1.val.2
  have hβ (q : Grid n) (_ : q∈D) : IntervalIntegrable (β q) volume 0 R :=
    unitSourceCoefficient_intervalIntegrable cfg start e s hm q 0 R
  have hprod := FiniteSourceHierarchy.primitive_product_identity_nonempty D hD β 0 R hβ
  change (∫t in (0:ℝ)..R,unitHierarchyMean cfg ε M start e C D L hn s t)≤
    ∏q∈D,FiniteSourceHierarchy.primitive β 0 q R
  rw [←hprod]
  have hi : IntervalIntegrable
      (fun t=>∑q∈D,β q t*(∏j∈D.erase q,FiniteSourceHierarchy.primitive β 0 j t)) volume 0 R := by
    simpa only [Finset.sum_fn] using
      (IntervalIntegrable.sum D (fun q hq=>FiniteSourceHierarchy.primitive_product_term_integrable D β 0 R hβ q hq))
  apply intervalIntegral.integral_mono_on_of_le_Ioo s.val.1.property.2.1
    (unitHierarchyMean_intervalIntegrable cfg ε M start e C D L hn hB s hm 0 R) hi
  intro t ht
  apply Finset.sum_le_sum
  intro q hq
  have hdis : Disjoint (insert q C) (D.erase q) := by
    apply Finset.disjoint_left.mpr
    intro r hr hre
    rcases Finset.mem_insert.mp hr with rfl | hrC
    · exact (Finset.mem_erase.mp hre).1 rfl
    · exact Finset.disjoint_left.mp hCD hrC (Finset.mem_of_mem_erase hre)
  have hsub : insert q C∪D.erase q⊆C∪D := by
    intro r hr
    rcases Finset.mem_union.mp hr with hr | hr
    · rcases Finset.mem_insert.mp hr with rfl | hrC
      · exact Finset.mem_union_right C hq
      · exact Finset.mem_union_left D hrC
    · exact Finset.mem_union_right C (Finset.mem_of_mem_erase hr)
  exact mul_le_mul_of_nonneg_left
    (elapsedMixedMean_unit_product cfg ε M start e (insert q C) (D.erase q) L hn hB hm hK
      hdis (hsub.trans hCDL) (SeparatedLabels.mono cfg.directions _ _ hsep hsub)
      s hS hw hk t ⟨ht.1.le,ht.2.le⟩)
    (unitSourceCoefficient_bounds cfg start e s hm q t).1

theorem rootBoundaryMixed_unit_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCD : Disjoint C D) (hCDL : C∪D⊆L)
    (hsep : SeparatedLabels cfg.directions (C∪D))
    (s : GoodObservation cfg) (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) :
    (∫ω,mixed cfg.directions C D L
      (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂boardClockMeasure n (cfg.B/n))≤
        ∏q∈D,∫u in (0:ℝ)..s.val.1.val.2,unitSourceCoefficient cfg start e s q u := by
  have hh := terminal_expected_rootMixed_unit_hierarchy cfg ε M start p e C D L hn hB hm hK
    (Finset.subset_union_left.trans hCDL) hCD hsep (goodRootInitial cfg p s)
  rw [goodRootInitial_mixed,goodRootInitial_actual] at hh
  rcases D.eq_empty_or_nonempty with rfl | hD
  · simp only [unitHierarchyMean,Finset.sum_empty,intervalIntegral.integral_zero,add_zero] at hh
    simpa only [Finset.prod_empty] using hh.trans (goodMixed_empty_le_one_of_initial cfg e C L s hS hw hk)
  · obtain ⟨q,hq⟩ := hD
    rw [goodMixed_eq_zero_of_unborn cfg e C D L s q hq (by simp [hS]),zero_add] at hh
    exact hh.trans (unitHierarchyMean_integral_product_bound cfg ε M start e C D L hn hB hm hK
      hCD hCDL hsep s hS hw hk ⟨q,hq⟩)

theorem rootPoint_activeWitness_unit_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (hsep : SeparatedLabels cfg.directions (insert p D))
    (s : GoodObservation cfg) (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) :
    (∫ω,activeWitness D p
      (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        (∏q∈D,∫u in (0:ℝ)..s.val.1.val.2,unitSourceCoefficient cfg start e s q u)/
          (1-ε)^L.card.choose 2 := by
  apply (rootPoint_activeWitness_mean_bound cfg ε M start e D L p hn hB hm
    (goodRootInitial cfg p s).val (goodRootInitial cfg p s).property.1 hs hε hinit hinit).trans
  apply div_le_div_of_nonneg_right _ (pow_nonneg (sub_nonneg.mpr hε.le) _)
  exact rootBoundaryMixed_unit_product cfg ε M start p e {p} D L hn hB hm hK
    (Finset.disjoint_singleton_left.mpr hpD) (by simpa only [Finset.singleton_union] using hDL)
    (by simpa only [Finset.singleton_union] using hsep) s hS hw hk

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.unitHierarchyMean_integral_product_bound
#print axioms NoThreeLine.BirthWitness.rootBoundaryMixed_unit_product
#print axioms NoThreeLine.BirthWitness.rootPoint_activeWitness_unit_product
