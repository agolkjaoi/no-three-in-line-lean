import NoThreeLine.ProtectedSelectedExponentialMean
import NoThreeLine.ExponentialLiveSurvival

/-! Survival-weighted exponential bounds on the actual selected trajectory,
including the zero endpoint. The candidate term is internally nonnegative. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE

theorem selectedProtectedCreditExp_live_survival {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (θ : ℝ) (hθ : 0≤θ) (T : ℝ) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    Real.exp (-((n:ℝ)*cfg.B*T))*selectedLineLikelihood cfg x L T*
      Real.exp (θ*(protectedCreditTotal L E (selectedTrajectory cfg (x,T)) saved-selectedCreditSourceIntegral cfg x L E T)-
        (θ^2/2)*selectedCreditEnergyIntegral cfg x L E T)≤
      Real.exp (θ*protectedCreditTotal L E x.val saved) := by
  have hZ := (selectedLineLikelihood_continuousOn cfg x he K hKcfg hK L hsp hN hk).mono
    (Icc_subset_Icc le_rfl hTg)
  have hF := selectedProtectedCreditTotal_continuous cfg x L E saved
  have hU := selectedCreditSourceIntegral_continuous cfg x L E
  have hW := sourcePrimitive_continuous _ (selectedCreditEnergy_continuous cfg x L E)
  have hz := hZ.mul (Real.continuous_exp.comp (((hF.sub hU).const_mul θ).sub (hW.const_mul (θ^2/2)))).continuousOn
  have hh := exponential_live_survival_le ((n:ℝ)*cfg.B) T (mul_nonneg (Nat.cast_nonneg _) hB.le) hT _ _ hz
    (fun t _=>mul_nonneg (Real.exp_nonneg _) (protectedObservableCandidateMean_nonneg L
      (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (fun _ _=>false) _
      (fun _ _=>Real.exp_nonneg _)))
    (fun t ht=>selectedProtectedCreditExponential_generator cfg x he K hKcfg hK L E saved hn hB hm
      hs hsp hE hN hk θ hθ (fun _ _=>false) t ⟨ht.1,ht.2.trans_le hTg⟩)
  simpa only [Pi.mul_apply,Pi.sub_apply,Function.comp_apply,selectedCreditSourceIntegral,selectedCreditEnergyIntegral,
    sourcePrimitive_zero,sub_zero,mul_zero,selectedLineLikelihood_zero cfg x he L,one_mul,
    protectedCreditTotal,selectedProtectedLedger_zero cfg x he L saved,mul_assoc] using hh

theorem selectedProtectedEntropyExp_live_survival {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (θ : ℝ) (hθ : 0≤θ) (T : ℝ) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    Real.exp (-((n:ℝ)*cfg.B*T))*selectedLineLikelihood cfg x L T*
      Real.exp (θ*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,T)) saved-selectedEntropySourceIntegral cfg x L E saved T)-
        (θ^2/2)*selectedEntropyEnergyIntegral cfg x L E T)≤
      Real.exp (θ*protectedEntropyTotal L E cfg.B x.val saved) := by
  have hZ := (selectedLineLikelihood_continuousOn cfg x he K hKcfg hK L hsp hN hk).mono
    (Icc_subset_Icc le_rfl hTg)
  have hF := selectedProtectedEntropyTotal_continuous cfg x L E saved cfg.B
  have hU := selectedEntropySourceIntegral_continuous cfg x L E saved hB
  have hW := sourcePrimitive_continuous _ (selectedEntropyEnergy_continuous cfg x L E)
  have hz := hZ.mul (Real.continuous_exp.comp (((hF.sub hU).const_mul θ).sub (hW.const_mul (θ^2/2)))).continuousOn
  have hh := exponential_live_survival_le ((n:ℝ)*cfg.B) T (mul_nonneg (Nat.cast_nonneg _) hB.le) hT _ _ hz
    (fun t _=>mul_nonneg (Real.exp_nonneg _) (protectedObservableCandidateMean_nonneg L
      (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (fun _ _=>false) _
      (fun _ _=>Real.exp_nonneg _)))
    (fun t ht=>selectedProtectedEntropyExponential_generator cfg x he K hKcfg hK L E saved hn hB hm
      hs hsp hE hN hk θ hθ (fun _ _=>false) t ⟨ht.1,ht.2.trans_le hTg⟩)
  simpa only [Pi.mul_apply,Pi.sub_apply,Function.comp_apply,selectedEntropySourceIntegral,selectedEntropyEnergyIntegral,
    sourcePrimitive_zero,sub_zero,mul_zero,selectedLineLikelihood_zero cfg x he L,one_mul,
    protectedEntropyTotal,protectedLineEntropy,selectedProtectedLedger_zero cfg x he L saved,mul_assoc] using hh

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedCreditExp_live_survival
#print axioms NoThreeLine.selectedProtectedEntropyExp_live_survival
