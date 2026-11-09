import NoThreeLine.RootFreezePointSupport
import NoThreeLine.LabelMomentEtaBound

/-! Sum all repeated witness-label maps for the actual frozen boundary,
retaining each deterministic integrated birth price. The result has one
main power plus an explicit collision error; geometric prices are not
silently replaced by unit prices. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments

def rootWitnessPrice {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n)
    (s : GoodObservation cfg) (q : Grid n) : ℝ :=
  ∫u in (0:ℝ)..s.val.1.val.2,elapsedSourceCoefficient cfg start e s q u

theorem rootWitnessPrice_nonneg {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n)
    (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1) (q : Grid n) : 0≤rootWitnessPrice cfg start e s q :=
  (elapsedSourcePrimitive_bounds cfg start e s hm q s.val.1.val.2 s.val.1.property.2.1).1

theorem rootPoint_activeWitness_all_labels_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a b,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) :
    (∫ω,activeWitness D p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        (∏q∈D,rootWitnessPrice cfg start e s q)/(1-ε)^(insert p D).card.choose 2 := by
  by_cases hpD : p∈D
  · have he (ω : BoardClockPath n) :
        activeWitness D p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)=0 :=
      activeWitness_zero_of_root_mem D p _ cfg.B
        (rootBoundaryWitness_valid cfg ε M start e p hn _ (goodRootInitial cfg p s).property.1 ω) hpD
    simp_rw [he]
    simp only [integral_zero]
    exact div_nonneg (Finset.prod_nonneg (fun q _=>rootWitnessPrice_nonneg cfg start e s hm q))
      (pow_nonneg (sub_nonneg.mpr hε.le) _)
  · exact rootPoint_activeWitness_product_bound cfg ε M start e D (insert p D) p hn hB hm hK hpD
      Finset.Subset.rfl s hs hε (fun a _ b _ hab=>hinit a b hab) hS hw hk

theorem rootPoint_activeWitnessPower_label_sum {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a b,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) (hw0 : ∀q,0≤w q) :
    (∫ω,activeWitnessPower w m p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        ∑f : Fin m→Grid n,tuplePrice ∅ w (rootWitnessPrice cfg start e s) f/
          (1-ε)^(insert p (tupleLabels f)).card.choose 2 := by
  classical
  let Z := rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val
  let ν := withinPhasePointMeasure cfg ε M hn s.val.1 p
  letI := withinPhasePointMeasure_probability cfg ε M hn hB hm s.val.1 p hs
  have hZ : Measurable Z := rootBoundaryWitness_measurable cfg ε M start e p hn _
  have hv (ω : BoardClockPath n) : (Z ω).Valid cfg.B :=
    rootBoundaryWitness_valid cfg ε M start e p hn _ (goodRootInitial cfg p s).property.1 ω
  have hi : Integrable (fun ω=>activeWitnessPower w m p (Z ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((activeWitnessPower_measurable w m p).comp hZ) ((∑q,w q)^m)
      (fun ω=>activeWitnessPower_bounds w m p _ cfg.B (hv ω) hw0)
  have hj (f : Fin m→Grid n) : Integrable
      (fun ω=>(∏i : Fin m,w (f i))*activeWitness (tupleLabels f) p (Z ω)) ν := by
    apply Integrable.const_mul
    exact GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((activeWitness_measurable (tupleLabels f) p).comp hZ) 1
      (fun ω=>activeWitness_bounds (tupleLabels f) p _ cfg.B (hv ω))
  calc
    _≤∫ω,(∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*activeWitness (tupleLabels f) p (Z ω)) ∂ν :=
      integral_mono hi (integrable_finsetSum _ (fun f _=>hj f))
        (fun ω=>activeWitnessPower_expansion_bound w m p _ cfg.B (hv ω) hw0)
    _=(∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*∫ω,activeWitness (tupleLabels f) p (Z ω) ∂ν) := by
      rw [integral_finsetSum _ (fun f _=>hj f)]
      simp_rw [integral_const_mul]
    _≤∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
        ((∏q∈tupleLabels f,rootWitnessPrice cfg start e s q)/(1-ε)^(insert p (tupleLabels f)).card.choose 2) :=
      Finset.sum_le_sum (fun f _=>mul_le_mul_of_nonneg_left
        (rootPoint_activeWitness_all_labels_product cfg ε M start e (tupleLabels f) p hn hB hm hK
          s hs hε hinit hS hw hk) (Finset.prod_nonneg (fun i _=>hw0 (f i))))
    _=_ := by simp only [tuplePrice,Finset.sdiff_empty,mul_div_assoc]

theorem rootPoint_activeWitnessPower_main_add_error {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε0 : 0≤ε) (hε : ε<1)
    (hinit : ∀a b,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) (hw0 : ∀q,0≤w q)
    (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) :
    let A := ∑q,w q*rootWitnessPrice cfg start e s q
    (∫ω,activeWitnessPower w m p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        (A^m+(m:ℝ)^2*W*(A+(m:ℝ)*W)^(m-1))/(1-ε)^(m+1).choose 2 :=
  (rootPoint_activeWitnessPower_label_sum cfg ε M start e w m p hn hB hm hK s hs hε hinit hS hw hk hw0).trans
    (tupleMoment_eta_sum_le_main_add_error w (rootWitnessPrice cfg start e s) hw0
      (rootWitnessPrice_nonneg cfg start e s hm) p m (1-ε) (sub_pos.mpr hε)
      (sub_le_self _ hε0) W hW0 hW)

theorem rootBoundary_witnessPower_main_add_error {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hp : (s.val.1.val.1.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (hinit : ∀a b,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) (hw0 : ∀q,0≤w q)
    (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) :
    let A := ∑q,w q*rootWitnessPrice cfg start e s q
    (∫ω,witnessSum w (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)^m
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        (A^m+(m:ℝ)^2*W*(A+(m:ℝ)*W)^(m-1))/(1-ε)^(m+1).choose 2 := by
  dsimp only
  rw [rootPoint_boundary_power_mean_eq cfg ε M start e w m p hn s hp]
  exact rootPoint_activeWitnessPower_main_add_error cfg ε M start e w m p hn hB hm hK s hs hε0 hε hinit hS hw hk hw0 W hW0 hW

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rootPoint_activeWitnessPower_label_sum
#print axioms NoThreeLine.BirthWitness.rootBoundary_witnessPower_main_add_error
