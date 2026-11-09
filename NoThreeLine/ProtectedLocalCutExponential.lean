import NoThreeLine.ProtectedFirstCutIntegral
import NoThreeLine.ProtectedExponentialFirstMean

/-! Actual candidate-before-cut and surviving-flow terms are integrated
as one first-forbidden-law observable. The cut is deterministic given the
incoming state; no union over time or extra factor is introduced. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem firstLineForbiddenLaw_protectedCreditExp_cut_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (θ : ℝ) (hθ : 0≤θ) (u : ℝ) (hd : ¬birthDone cfg s.1) (hu : 0≤u)
    (hug : u≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (∫ω,protectedFirstCutValue
      (protectedTimedExponential cfg ε M L E id (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E) (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E) θ s)
      u (Real.exp (θ*(protectedCreditTotal L E (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2-
        selectedCreditSourceIntegral cfg (augTimedInput cfg s.1).1.1 L E u)-(θ^2/2)*selectedCreditEnergyIntegral cfg (augTimedInput cfg s.1).1.1 L E u))
      (WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤
      Real.exp (θ*protectedCreditTotal L E s.1.val.1.physical s.2) := by
  let S := fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E
  let V := fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E
  have hS : Continuous S := (selectedCreditSource_continuous cfg (augTimedInput cfg s.1).1.1 L E)
  have hV : Continuous V := selectedCreditEnergy_continuous cfg (augTimedInput cfg s.1).1.1 L E
  obtain ⟨A,hA⟩ := protectedTimedWeightedExponential_exists_bound cfg ε M K hKcfg hK L hsp E hE id
    S V θ (2*cfg.B) (fun c hc=>hc) hS hV s hN hk hsv
  rw [protectedFirstCutValue_integral cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk hd
    (protectedTimedExponential cfg ε M L E id S V θ s)
    (protectedTimedExponential_measurable cfg ε M L E id S V θ measurable_id hS hV s) A
    (fun z=>by
      change ‖protectedTimedWeightedExponential cfg ε M L E id S V θ s z‖≤A
      rw [Real.norm_eq_abs,abs_of_nonneg (hA z).1]
      exact (hA z).2) u _ hu hug]
  have heq : (∫t,(if t≤u then
      (∑q : Grid n,∫z,protectedTimedWeightedExponential cfg ε M L E id S V θ s ((t,q),z) ∂markMeasure)/(n:ℝ)^2
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L u*
        Real.exp (θ*(protectedCreditTotal L E (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2-
          selectedCreditSourceIntegral cfg (augTimedInput cfg s.1).1.1 L E u)-(θ^2/2)*selectedCreditEnergyIntegral cfg (augTimedInput cfg s.1).1.1 L E u))
      ∂expMeasure ((n:ℝ)*cfg.B))=
      ∫t,(if t≤u then selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
        protectedObservableCandidateMean L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask cfg.B
          (fun _ _=>false) (fun v a=>Real.exp (θ*(protectedCreditTotal L E v a-selectedCreditSourceIntegral cfg (augTimedInput cfg s.1).1.1 L E t)-
            (θ^2/2)*selectedCreditEnergyIntegral cfg (augTimedInput cfg s.1).1.1 L E t))
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L u*
        Real.exp (θ*(protectedCreditTotal L E (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2-
          selectedCreditSourceIntegral cfg (augTimedInput cfg s.1).1.1 L E u)-(θ^2/2)*selectedCreditEnergyIntegral cfg (augTimedInput cfg s.1).1.1 L E u))
      ∂expMeasure ((n:ℝ)*cfg.B) := by
    apply integral_congr_ae
    filter_upwards [expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos (by exact_mod_cast hn) hB)] with t ht
    by_cases htu : t≤u
    · simp only [if_pos htu]
      rw [protectedTimedWeightedExponential_candidate_mean cfg ε M L E id S V θ s hn hd t ht,
        if_pos (htu.trans hug)]
      rfl
    · simp only [if_neg htu]
  simp only [protectedTimedWeightedExponential] at heq
  rw [heq]
  have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
  exact selectedProtectedCreditExp_first_mean cfg (augTimedInput cfg s.1).1.1 s.1.property.1.1
    K hKcfg hK L E s.2 hn hB hm hs hsp hE hN hk θ hθ (fun _ _ _=>false) u hu
    (hug.trans (augGuardTime_mem cfg ε M _ s.1.property.1.1).2)

theorem firstLineForbiddenLaw_protectedEntropyExp_cut_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (θ : ℝ) (hθ : 0≤θ) (u : ℝ) (hd : ¬birthDone cfg s.1) (hu : 0≤u)
    (hug : u≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (∫ω,protectedFirstCutValue
      (protectedTimedExponential cfg ε M L E (protectedEntropy cfg.B) (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B) (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B) θ s)
      u (Real.exp (θ*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2-
        selectedEntropySourceIntegral cfg (augTimedInput cfg s.1).1.1 L E s.2 u)-(θ^2/2)*selectedEntropyEnergyIntegral cfg (augTimedInput cfg s.1).1.1 L E u))
      (WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤
      Real.exp (θ*protectedEntropyTotal L E cfg.B s.1.val.1.physical s.2) := by
  let S := fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B
  let V := fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B
  have hS : Continuous S := (selectedEntropySource_continuous cfg (augTimedInput cfg s.1).1.1 L E s.2 hB)
  have hV : Continuous V := selectedEntropyEnergy_continuous cfg (augTimedInput cfg s.1).1.1 L E
  obtain ⟨A,hA⟩ := protectedTimedWeightedExponential_exists_bound cfg ε M K hKcfg hK L hsp E hE (protectedEntropy cfg.B)
    S V θ (2*cfg.B) (fun c hc=>protectedEntropy_bounds cfg.B c hB hc.1 hc.2) hS hV s hN hk hsv
  rw [protectedFirstCutValue_integral cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk hd
    (protectedTimedExponential cfg ε M L E (protectedEntropy cfg.B) S V θ s)
    (protectedTimedExponential_measurable cfg ε M L E (protectedEntropy cfg.B) S V θ (protectedEntropy_continuous cfg.B).measurable hS hV s) A
    (fun z=>by
      change ‖protectedTimedWeightedExponential cfg ε M L E (protectedEntropy cfg.B) S V θ s z‖≤A
      rw [Real.norm_eq_abs,abs_of_nonneg (hA z).1]
      exact (hA z).2) u _ hu hug]
  have heq : (∫t,(if t≤u then
      (∑q : Grid n,∫z,protectedTimedWeightedExponential cfg ε M L E (protectedEntropy cfg.B) S V θ s ((t,q),z) ∂markMeasure)/(n:ℝ)^2
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L u*
        Real.exp (θ*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2-
          selectedEntropySourceIntegral cfg (augTimedInput cfg s.1).1.1 L E s.2 u)-(θ^2/2)*selectedEntropyEnergyIntegral cfg (augTimedInput cfg s.1).1.1 L E u))
      ∂expMeasure ((n:ℝ)*cfg.B))=
      ∫t,(if t≤u then selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
        protectedObservableCandidateMean L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask cfg.B
          (fun _ _=>false) (fun v a=>Real.exp (θ*(protectedEntropyTotal L E cfg.B v a-selectedEntropySourceIntegral cfg (augTimedInput cfg s.1).1.1 L E s.2 t)-
            (θ^2/2)*selectedEntropyEnergyIntegral cfg (augTimedInput cfg s.1).1.1 L E t))
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L u*
        Real.exp (θ*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2-
          selectedEntropySourceIntegral cfg (augTimedInput cfg s.1).1.1 L E s.2 u)-(θ^2/2)*selectedEntropyEnergyIntegral cfg (augTimedInput cfg s.1).1.1 L E u))
      ∂expMeasure ((n:ℝ)*cfg.B) := by
    apply integral_congr_ae
    filter_upwards [expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos (by exact_mod_cast hn) hB)] with t ht
    by_cases htu : t≤u
    · simp only [if_pos htu]
      rw [protectedTimedWeightedExponential_candidate_mean cfg ε M L E (protectedEntropy cfg.B) S V θ s hn hd t ht,
        if_pos (htu.trans hug)]
      rfl
    · simp only [if_neg htu]
  simp only [protectedTimedWeightedExponential] at heq
  rw [heq]
  have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
  exact selectedProtectedEntropyExp_first_mean cfg (augTimedInput cfg s.1).1.1 s.1.property.1.1
    K hKcfg hK L E s.2 hn hB hm hs hsp hE hN hk θ hθ (fun _ _ _=>false) u hu
    (hug.trans (augGuardTime_mem cfg ε M _ s.1.property.1.1).2)

end NoThreeLine
#print axioms NoThreeLine.firstLineForbiddenLaw_protectedCreditExp_cut_mean
#print axioms NoThreeLine.firstLineForbiddenLaw_protectedEntropyExp_cut_mean
