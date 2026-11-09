import NoThreeLine.EtaRateCost
import NoThreeLine.BirthRunningRate

/-! The pair-rate on the actual capped physical curve is measurable and
bounded. Its integral equals the executed eta cost, including done steps. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE PairWitness BirthWitness

def pairRateCap (n : ℕ) (B : ℝ) : ℝ := (Fintype.card (Grid n):ℝ)*(B/n)

theorem pairRateCap_nonneg (n : ℕ) (B : ℝ) (hB : 0≤B) : 0≤pairRateCap n B :=
  mul_nonneg (Nat.cast_nonneg _) (div_nonneg hB (Nat.cast_nonneg n))

theorem state_pairRate_bounds {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (a b : Grid n) (e : ExtendedState n)
    (B : ℝ) (hB : 0<B) (he : e.Valid B) :
    0≤pairRate e.process Γ mask e.coordinates a b ∧
      pairRate e.process Γ mask e.coordinates a b≤pairRateCap n B := by
  have hrate (q : Grid n) : e.process.birthRate mask q≤B/n := by
    have hα := e.process.acceptance_bounds mask B hB hm (fun q _=>he.2.1.1 q) q
    rw [←ProcessState.candidate_rate_times_acceptance e.process mask B hB.ne' q]
    exact mul_le_of_le_one_right (div_nonneg hB.le (Nat.cast_nonneg n)) hα.2
  refine ⟨pairRate_nonneg _ _ _ _ (fun q=>(hm q).1) (fun q=>(he.2.1.1 q).1) a b,?_⟩
  apply (pairRate_le_total e.process Γ mask e.coordinates (fun q=>(hm q).1)
    (fun q=>(he.2.1.1 q).1) a b).trans
  calc
    _ ≤ ∑_q : Grid n,B/n := Finset.sum_le_sum (fun q _=>hrate q)
    _ = _ := by simp [pairRateCap]

def cappedPairRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n)
    (x : AugTimedState cfg×ℝ) : ℝ :=
  let e := selectedTrajectory cfg ((augTimedInput cfg x.1).1.1,
    augAdvance cfg ε M (augTimedInput cfg x.1,x.2))
  pairRate e.process cfg.directions cfg.mask e.coordinates a b

theorem cappedPairRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n) :
    Measurable (cappedPairRate cfg ε M a b) :=
  (state_pairRate_measurable cfg.directions cfg.mask a b).comp
    ((selectedTrajectory_measurable cfg).comp
      ((((augTimedInput_measurable cfg).comp measurable_fst).fst.fst).prodMk
        ((augAdvance_measurable cfg ε M).comp
          (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd))))

theorem cappedPairRate_eq_flow {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n)
    (s : AugTimedState cfg) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg s))) :
    cappedPairRate cfg ε M a b (s,t)=selectedPairRate cfg (augTimedInput cfg s).1.1 a b t := by
  unfold cappedPairRate
  have ha : augAdvance cfg ε M (augTimedInput cfg s,t)=t := by
    change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) t)=t
    rw [min_eq_right ht.2,max_eq_right ht.1]
  rw [ha,selectedTrajectory_pairRate]

theorem cappedPairRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (x : AugTimedState cfg×ℝ) :
    0≤cappedPairRate cfg ε M a b x ∧ cappedPairRate cfg ε M a b x≤pairRateCap n cfg.B := by
  have ht := augAdvance_mem cfg ε M (augTimedInput cfg x.1) x.1.property.1.1 x.2
  exact state_pairRate_bounds cfg.directions cfg.mask (fun q=>⟨cfg.mask_nonneg q,hm q⟩) a b _
    cfg.B hB (selectedTrajectory_valid cfg (augTimedInput cfg x.1).1.1 x.1.property.1.1 _
      ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M _ x.1.property.1.1).2⟩)

theorem augTimedPairCost_capped_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (s : AugTimedState cfg) (z : CandidateData n) :
    augTimedPairCost cfg ε M a b s z=
      ∫u in (0:ℝ)..birthElapsed cfg ε M (s,z),cappedPairRate cfg ε M a b (s,u) := by
  unfold augTimedPairCost birthElapsed birthDone
  split_ifs
  · simp
  · unfold selectedPairCost
    apply intervalIntegral.integral_congr
    intro u hu
    have ht := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    rw [uIcc_of_le ht.1] at hu
    exact (cappedPairRate_eq_flow cfg ε M a b s u ⟨hu.1,hu.2.trans ht.2⟩).symm

end NoThreeLine

#print axioms NoThreeLine.state_pairRate_bounds
#print axioms NoThreeLine.cappedPairRate_measurable
#print axioms NoThreeLine.cappedPairRate_bounds
#print axioms NoThreeLine.augTimedPairCost_capped_integral
