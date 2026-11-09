import NoThreeLine.RootFreezePointProduct
import NoThreeLine.CutWitnessMoments

/-! Every fixed weighted witness moment at the actual frozen root boundary.
The finite expansion keeps all repeated-label maps and their deterministic
weight factors. No geometric smallness of the resulting sum is asserted. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem rootPoint_activeWitness_all_labels_coarse {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a b,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) :
    (∫ω,activeWitness D p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        (s.val.1.val.2*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^D.card/
          (1-ε)^(insert p D).card.choose 2 := by
  by_cases hpD : p∈D
  · have he (ω : BoardClockPath n) :
        activeWitness D p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)=0 :=
      activeWitness_zero_of_root_mem D p _ cfg.B
        (rootBoundaryWitness_valid cfg ε M start e p hn _ (goodRootInitial cfg p s).property.1 ω) hpD
    simp_rw [he]
    simp only [integral_zero]
    apply div_nonneg _ (pow_nonneg (sub_nonneg.mpr hε.le) _)
    exact pow_nonneg (mul_nonneg s.val.1.property.2.1
      (mul_nonneg (div_nonneg zero_le_one (Nat.cast_nonneg n))
        (pow_nonneg (le_trans zero_le_one (le_max_left _ _)) _))) _
  · exact rootPoint_activeWitness_coarse_bound cfg ε M start e D (insert p D) p hn hB hm hK hpD
      Finset.Subset.rfl s hs hε (fun a _ b _ hab=>hinit a b hab) hS hw hk

theorem rootPoint_activeWitnessPower_moment {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a b,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) (hw0 : ∀q,0≤w q) :
    (∫ω,activeWitnessPower w m p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        ∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
          ((s.val.1.val.2*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^(Finset.univ.image f).card/
            (1-ε)^(insert p (Finset.univ.image f)).card.choose 2) := by
  classical
  let W := rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val
  let ν := withinPhasePointMeasure cfg ε M hn s.val.1 p
  letI := withinPhasePointMeasure_probability cfg ε M hn hB hm s.val.1 p hs
  have hW : Measurable W := rootBoundaryWitness_measurable cfg ε M start e p hn _
  have hv (ω : BoardClockPath n) : (W ω).Valid cfg.B :=
    rootBoundaryWitness_valid cfg ε M start e p hn _ (goodRootInitial cfg p s).property.1 ω
  have hi : Integrable (fun ω=>activeWitnessPower w m p (W ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((activeWitnessPower_measurable w m p).comp hW) ((∑q,w q)^m)
      (fun ω=>activeWitnessPower_bounds w m p _ cfg.B (hv ω) hw0)
  have hj (f : Fin m→Grid n) : Integrable
      (fun ω=>(∏i : Fin m,w (f i))*activeWitness (Finset.univ.image f) p (W ω)) ν := by
    apply Integrable.const_mul
    exact GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((activeWitness_measurable (Finset.univ.image f) p).comp hW) 1
      (fun ω=>activeWitness_bounds (Finset.univ.image f) p _ cfg.B (hv ω))
  calc
    _≤∫ω,(∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*activeWitness (Finset.univ.image f) p (W ω)) ∂ν :=
      integral_mono hi (integrable_finsetSum _ (fun f _=>hj f))
        (fun ω=>activeWitnessPower_expansion_bound w m p _ cfg.B (hv ω) hw0)
    _=(∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*∫ω,activeWitness (Finset.univ.image f) p (W ω) ∂ν) := by
      rw [integral_finsetSum _ (fun f _=>hj f)]
      simp_rw [integral_const_mul]
    _≤_ := Finset.sum_le_sum (fun f _=>mul_le_mul_of_nonneg_left
      (rootPoint_activeWitness_all_labels_coarse cfg ε M start e (Finset.univ.image f) p hn hB hm hK
        s hs hε hinit hS hw hk) (Finset.prod_nonneg (fun i _=>hw0 (f i))))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rootPoint_activeWitness_all_labels_coarse
#print axioms NoThreeLine.BirthWitness.rootPoint_activeWitnessPower_moment
