import NoThreeLine.RootFreezeHierarchy
import NoThreeLine.SourceInitialProduct

/-! A product bound for the actual root-frozen terminal witness. The
root-dependent freeze is handled by source domination, and the remaining
integral uses the proved unfrozen hierarchy and finite-product identity.
Only initial physical coordinates are required, not a moment premise. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem goodRootInitial_actual {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (s : GoodObservation cfg) :
    goodRootActual cfg p (goodRootInitial cfg p s)=s := rfl

theorem goodRootInitial_mixed {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodObservation cfg) :
    goodRootMixed cfg p e C D L (goodRootInitial cfg p s)=goodMixed cfg e C D L s := rfl

theorem elapsedHierarchyMean_integral_product_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCD : Disjoint C D) (hCDL : C∪D⊆L)
    (s : GoodObservation cfg) (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀p,(s.val.1.val.1.physical.process.accounts p).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) (hD : D.Nonempty) :
    (∫t in (0:ℝ)..s.val.1.val.2,elapsedHierarchyMean cfg ε M start e C D L hn s t)≤
      ∏q∈D,∫u in (0:ℝ)..s.val.1.val.2,elapsedSourceCoefficient cfg start e s q u := by
  classical
  let β := elapsedSourceCoefficient cfg start e s
  let R := s.val.1.val.2
  have hβ (q : Grid n) (_ : q∈D) : IntervalIntegrable (β q) volume 0 R :=
    elapsedSourceCoefficient_intervalIntegrable cfg start e s hm q 0 R
  have hprod := FiniteSourceHierarchy.primitive_product_identity_nonempty D hD β 0 R hβ
  change (∫t in (0:ℝ)..R,elapsedHierarchyMean cfg ε M start e C D L hn s t)≤
    ∏q∈D,FiniteSourceHierarchy.primitive β 0 q R
  rw [←hprod]
  have hi : IntervalIntegrable
      (fun t=>∑q∈D,β q t*(∏j∈D.erase q,FiniteSourceHierarchy.primitive β 0 j t)) volume 0 R := by
    simpa only [Finset.sum_fn] using
      (IntervalIntegrable.sum D (fun q hq=>FiniteSourceHierarchy.primitive_product_term_integrable D β 0 R hβ q hq))
  apply intervalIntegral.integral_mono_on_of_le_Ioo s.val.1.property.2.1
    (elapsedHierarchyMean_intervalIntegrable cfg ε M start e C D L hn hB s hm 0 R) hi
  intro t ht
  apply Finset.sum_le_sum
  intro q hq
  have hdis : Disjoint (insert q C) (D.erase q) := by
    apply Finset.disjoint_left.mpr
    intro r hr hre
    rcases Finset.mem_insert.mp hr with rfl | hrC
    · exact (Finset.mem_erase.mp hre).1 rfl
    · exact Finset.disjoint_left.mp hCD hrC (Finset.mem_of_mem_erase hre)
  have hsub : insert q C∪D.erase q⊆L := by
    intro r hr
    rcases Finset.mem_union.mp hr with hr | hr
    · rcases Finset.mem_insert.mp hr with rfl | hrC
      · exact hCDL (Finset.mem_union_right C hq)
      · exact hCDL (Finset.mem_union_left D hrC)
    · exact hCDL (Finset.mem_union_right C (Finset.mem_of_mem_erase hr))
  exact mul_le_mul_of_nonneg_left
    (elapsedMixedMean_product_bound cfg ε M start e (insert q C) (D.erase q) L hn hB hm hK
      hdis hsub s hS hw hk t ⟨ht.1.le,ht.2.le⟩)
    (elapsedSourceCoefficient_bounds cfg start e s hm q t).1

theorem rootBoundaryMixed_product_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCD : Disjoint C D) (hCDL : C∪D⊆L)
    (s : GoodObservation cfg) (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) :
    (∫ω,mixed cfg.directions C D L
      (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂boardClockMeasure n (cfg.B/n))≤
        ∏q∈D,∫u in (0:ℝ)..s.val.1.val.2,elapsedSourceCoefficient cfg start e s q u := by
  have hh := terminal_expected_rootMixed_hierarchy_bound cfg ε M start p e C D L hn hB hm hK
    (Finset.subset_union_left.trans hCDL) hCD (goodRootInitial cfg p s)
  rw [goodRootInitial_mixed,goodRootInitial_actual] at hh
  rcases D.eq_empty_or_nonempty with rfl | hD
  · simp only [elapsedHierarchyMean,Finset.sum_empty,intervalIntegral.integral_zero,add_zero] at hh
    simpa only [Finset.prod_empty] using hh.trans (goodMixed_empty_le_one_of_initial cfg e C L s hS hw hk)
  · obtain ⟨q,hq⟩ := hD
    rw [goodMixed_eq_zero_of_unborn cfg e C D L s q hq (by simp [hS]),zero_add] at hh
    exact hh.trans (elapsedHierarchyMean_integral_product_bound cfg ε M start e C D L hn hB hm hK
      hCD hCDL s hS hw hk ⟨q,hq⟩)

theorem initial_rootBoundaryMixed_product_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 1≤cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCD : Disjoint C D) (hCDL : C∪D⊆L)
    (deadline : Grid n→ℝ) :
    (∫ω,mixed cfg.directions C D L
      (rootBoundaryWitness cfg ε M start e p hn
        (goodRootInitial cfg p (initialGoodObservation cfg ε M hB deadline start)).val ω)
      ∂boardClockMeasure n (cfg.B/n))≤
        ∏q∈D,∫u in (0:ℝ)..(cfg.horizon:ℝ),(cfg.mask q*e.value q (start+u)/n)*
          max 1 (protection 1 cfg.K)^cfg.directions.card := by
  have hh := rootBoundaryMixed_product_bound cfg ε M start p e C D L hn (lt_of_lt_of_le zero_lt_one hB)
    hm hK hCD hCDL (initialGoodObservation cfg ε M hB deadline start)
    (initialGoodObservation_selected cfg ε M hB deadline start)
    (fun q=>(initialGoodObservation_weight cfg ε M hB deadline start q).le)
    (initialGoodObservation_clock cfg ε M hB deadline start)
  have hR : (initialGoodObservation cfg ε M hB deadline start).val.1.val.2=(cfg.horizon:ℝ) := rfl
  simpa only [elapsedSourceCoefficient,initialGoodObservation_time,hR] using hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.elapsedHierarchyMean_integral_product_bound
#print axioms NoThreeLine.BirthWitness.rootBoundaryMixed_product_bound
#print axioms NoThreeLine.BirthWitness.initial_rootBoundaryMixed_product_bound
