import NoThreeLine.CutPointWitnessProduct
import NoThreeLine.WitnessProductExpansion

/-! Arbitrary fixed powers of an actual retained-witness sum, under the
constructed point law while the root is active. Repeated labels remain in
the exact finite expansion and pay their distinct-label degree. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem activeWitness_zero_of_root_mem {n : ℕ} (D : Finset (Grid n)) (p : Grid n)
    (a : WitnessState n) (B : ℝ) (ha : a.Valid B) (hpD : p∈D) : activeWitness D p a=0 := by
  unfold activeWitness
  split_ifs with hp
  · exact witnessProduct_active_zero a B ha D p (ProcessState.mem_activeEvents _ p |>.mpr hp) hpD
  · rfl

def cutActiveWitnessPower {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) : ℝ :=
  activeWitnessPower w m p
    (observedWitness cfg e (sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2))

theorem cutActiveWitnessPower_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (cutActiveWitnessPower cfg ε M start e w m p hn s) :=
  (activeWitnessPower_measurable w m p).comp
    ((observedWitness_measurable cfg e).comp (sourceCutTerminal_joint_measurable cfg ε M start hn s))

theorem cutPoint_activeWitness_all_labels_coarse {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a b,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0)
    (t : ℝ) (ht : t∈Icc (0:ℝ) s.val.1.val.2) :
    (∫ω,cutActiveWitness cfg ε M start e D p hn s (elapsedCutAmount s.val.1.val.2 t,ω)
      ∂cutPointMeasure cfg ε M start hn s p (elapsedCutAmount s.val.1.val.2 t))≤
      (t*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^D.card/
        (1-ε)^(insert p D).card.choose 2 := by
  by_cases hpD : p∈D
  · have he (ω : BoardClockPath n) :
        cutActiveWitness cfg ε M start e D p hn s (elapsedCutAmount s.val.1.val.2 t,ω)=0 :=
      activeWitness_zero_of_root_mem D p _ cfg.B (observedWitness_valid cfg e _
        (sourceCutTerminal_consistent cfg ε M start _ _ hn s ω)) hpD
    simp_rw [he]
    simp only [integral_zero]
    apply div_nonneg _ (pow_nonneg (sub_nonneg.mpr hε.le) _)
    exact pow_nonneg (mul_nonneg ht.1 (mul_nonneg (div_nonneg zero_le_one (Nat.cast_nonneg n))
      (pow_nonneg (le_trans zero_le_one (le_max_left _ _)) _))) _
  · exact cutPoint_activeWitness_coarse_bound cfg ε M start e D (insert p D) p hn hB hm hK hpD
      Finset.Subset.rfl s hs hε (fun a _ b _ hab=>hinit a b hab) hS hw hk t ht

theorem cutPoint_activeWitnessPower_moment {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a b,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (hS : s.val.1.val.1.physical.process.selected=∅)
    (hw : ∀q,(s.val.1.val.1.physical.process.accounts q).weight≤1)
    (hk : ∀J,s.val.1.val.1.physical.clocks J=0) (hw0 : ∀q,0≤w q)
    (t : ℝ) (ht : t∈Icc (0:ℝ) s.val.1.val.2) :
    (∫ω,cutActiveWitnessPower cfg ε M start e w m p hn s (elapsedCutAmount s.val.1.val.2 t,ω)
      ∂cutPointMeasure cfg ε M start hn s p (elapsedCutAmount s.val.1.val.2 t))≤
      ∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
        ((t*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^(Finset.univ.image f).card/
          (1-ε)^(insert p (Finset.univ.image f)).card.choose 2) := by
  classical
  let δ := elapsedCutAmount s.val.1.val.2 t
  let ν := cutPointMeasure cfg ε M start hn s p δ
  letI := cutPointMeasure_probability cfg ε M start hn hB hm s p hs δ
  have hvalid (ω : BoardClockPath n) := observedWitness_valid cfg e _
    (sourceCutTerminal_consistent cfg ε M start δ δ.coe_nonneg hn s ω)
  have hi : Integrable (fun ω=>cutActiveWitnessPower cfg ε M start e w m p hn s (δ,ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((cutActiveWitnessPower_measurable cfg ε M start e w m p hn s).comp
        (measurable_const.prodMk measurable_id)) ((∑q,w q)^m)
      (fun ω=>activeWitnessPower_bounds w m p _ cfg.B (hvalid ω) hw0)
  have hj (f : Fin m→Grid n) : Integrable
      (fun ω=>(∏i : Fin m,w (f i))*cutActiveWitness cfg ε M start e (Finset.univ.image f) p hn s (δ,ω)) ν := by
    apply Integrable.const_mul
    exact GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((cutActiveWitness_measurable cfg ε M start e (Finset.univ.image f) p hn s).comp
        (measurable_const.prodMk measurable_id)) 1
      (fun ω=>cutActiveWitness_bounds cfg ε M start e (Finset.univ.image f) p hn s (δ,ω))
  calc
    _≤∫ω,(∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
        cutActiveWitness cfg ε M start e (Finset.univ.image f) p hn s (δ,ω)) ∂ν :=
      integral_mono hi (integrable_finsetSum _ (fun f _=>hj f))
        (fun ω=>activeWitnessPower_expansion_bound w m p _ cfg.B (hvalid ω) hw0)
    _=(∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
        ∫ω,cutActiveWitness cfg ε M start e (Finset.univ.image f) p hn s (δ,ω) ∂ν) := by
      rw [integral_finsetSum _ (fun f _=>hj f)]
      simp_rw [integral_const_mul]
    _≤_ := Finset.sum_le_sum (fun f _=>mul_le_mul_of_nonneg_left
      (cutPoint_activeWitness_all_labels_coarse cfg ε M start e (Finset.univ.image f) p hn hB hm hK
        s hs hε hinit hS hw hk t ht) (Finset.prod_nonneg (fun i _=>hw0 (f i))))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cutPoint_activeWitness_all_labels_coarse
#print axioms NoThreeLine.BirthWitness.cutPoint_activeWitnessPower_moment
