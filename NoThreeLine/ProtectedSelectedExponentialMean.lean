import NoThreeLine.ProtectedSelectedExponential
import NoThreeLine.ProtectedExponentialRegularity
import NoThreeLine.ExponentialDerivativeInequality

/-! The actual selected-flow exponential compensation has first-event
mean at most its initial value. No continuity of an entropy derivative
at zero, or conditional exponential-martingale premise, is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE

theorem selectedProtectedCreditExpCandidate_continuousOn {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (E : Finset (Grid n))
    (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hs : x.val.process.stopped=false) (θ : ℝ) (positive : ℝ→Grid n→Grid n→Bool) :
    ContinuousOn (fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) (fun v a=>Real.exp
        (θ*(protectedCreditTotal L E v a-selectedCreditSourceIntegral cfg x L E t)-
          (θ^2/2)*selectedCreditEnergyIntegral cfg x L E t))) (Icc 0 (selectedGuardTime cfg x)) := by
  have hA := (selectedCreditSourceIntegral_continuous cfg x L E).const_mul θ |>.add
    ((sourcePrimitive_continuous _ (selectedCreditEnergy_continuous cfg x L E)).const_mul (θ^2/2))
  have hh := selectedProtectedExponentialCandidate_continuousOn_of_loss cfg x he L saved hn hB hm
    (protectedCreditTotal L E) (fun v q=>protectedExternalDeletion v cfg.directions L E q)
    (protectedCreditTotal_withCoordinates_continuous x.val L E saved)
    (fun q=>protectedExternalDeletion_withCoordinates_continuous x.val cfg.directions L E q)
    θ _ hA positive (fun t ht q hq hqL=>protectedLedger_external_total_loss _ cfg.directions L E saved q (positive t q)
      (selectedTrajectory_valid cfg x he t ht).1 hs hq hqL)
  simpa only [Pi.add_apply,mul_sub,sub_sub,selectedCreditEnergyIntegral] using hh

theorem selectedProtectedEntropyExpCandidate_continuousOn {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (E : Finset (Grid n))
    (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hs : x.val.process.stopped=false) (θ : ℝ) (positive : ℝ→Grid n→Grid n→Bool) :
    ContinuousOn (fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) (fun v a=>Real.exp
        (θ*(protectedEntropyTotal L E cfg.B v a-selectedEntropySourceIntegral cfg x L E saved t)-
          (θ^2/2)*selectedEntropyEnergyIntegral cfg x L E t))) (Icc 0 (selectedGuardTime cfg x)) := by
  have hA := (selectedEntropySourceIntegral_continuous cfg x L E saved hB).const_mul θ |>.add
    ((sourcePrimitive_continuous _ (selectedEntropyEnergy_continuous cfg x L E)).const_mul (θ^2/2))
  have hh := selectedProtectedExponentialCandidate_continuousOn_of_loss cfg x he L saved hn hB hm
    (protectedEntropyTotal L E cfg.B) (fun v q=>protectedEntropyDeletion v cfg.directions L E q cfg.B)
    (protectedEntropyTotal_withCoordinates_continuous x.val L E saved cfg.B)
    (fun q=>protectedEntropyDeletion_withCoordinates_continuous x.val cfg.directions L E q cfg.B)
    θ _ hA positive (fun t ht q hq hqL=>protectedLedger_external_entropy_loss _ cfg.directions L E saved q cfg.B (positive t q)
      (selectedTrajectory_valid cfg x he t ht).1 hs hq hqL)
  simpa only [Pi.add_apply,mul_sub,sub_sub,selectedEntropyEnergyIntegral] using hh

theorem selectedProtectedCreditExp_first_mean {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (θ : ℝ) (hθ : 0≤θ) (positive : ℝ→Grid n→Grid n→Bool)
    (T : ℝ) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    (∫t,(if t≤T then selectedLineLikelihood cfg x L t*
      protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (positive t)
        (fun v a=>Real.exp (θ*(protectedCreditTotal L E v a-selectedCreditSourceIntegral cfg x L E t)-
          (θ^2/2)*selectedCreditEnergyIntegral cfg x L E t))
      else selectedLineLikelihood cfg x L T*Real.exp
        (θ*(protectedCreditTotal L E (selectedTrajectory cfg (x,T)) saved-selectedCreditSourceIntegral cfg x L E T)-
          (θ^2/2)*selectedCreditEnergyIntegral cfg x L E T)) ∂expMeasure ((n:ℝ)*cfg.B))≤
      Real.exp (θ*protectedCreditTotal L E x.val saved) := by
  have hZ := (selectedLineLikelihood_continuousOn cfg x he K hKcfg hK L hsp hN hk).mono
    (Icc_subset_Icc le_rfl hTg)
  have hF := selectedProtectedCreditTotal_continuous cfg x L E saved
  have hU := selectedCreditSourceIntegral_continuous cfg x L E
  have hW := sourcePrimitive_continuous _ (selectedCreditEnergy_continuous cfg x L E)
  have hz := hZ.mul (Real.continuous_exp.comp (((hF.sub hU).const_mul θ).sub (hW.const_mul (θ^2/2)))).continuousOn
  have hJ := hZ.mul ((selectedProtectedCreditExpCandidate_continuousOn cfg x he L E saved hn hB hm hs θ positive).mono
    (Icc_subset_Icc le_rfl hTg))
  have hh := exponential_first_step_nonpos_of_derivative ((n:ℝ)*cfg.B) T
    (mul_pos (by exact_mod_cast hn) hB) hT _ _ hz hJ
    (fun t ht=>selectedProtectedCreditExponential_generator cfg x he K hKcfg hK L E saved hn hB hm
      hs hsp hE hN hk θ hθ (positive t) t ⟨ht.1,ht.2.trans_le hTg⟩)
  simpa only [Pi.mul_apply,Pi.sub_apply,Function.comp_apply,selectedCreditSourceIntegral,selectedCreditEnergyIntegral,sourcePrimitive_zero,
    sub_zero,mul_zero,selectedLineLikelihood_zero cfg x he L,one_mul,protectedCreditTotal,
    selectedProtectedLedger_zero cfg x he L saved] using hh

theorem selectedProtectedEntropyExp_first_mean {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (θ : ℝ) (hθ : 0≤θ) (positive : ℝ→Grid n→Grid n→Bool)
    (T : ℝ) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    (∫t,(if t≤T then selectedLineLikelihood cfg x L t*
      protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (positive t)
        (fun v a=>Real.exp (θ*(protectedEntropyTotal L E cfg.B v a-selectedEntropySourceIntegral cfg x L E saved t)-
          (θ^2/2)*selectedEntropyEnergyIntegral cfg x L E t))
      else selectedLineLikelihood cfg x L T*Real.exp
        (θ*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,T)) saved-selectedEntropySourceIntegral cfg x L E saved T)-
          (θ^2/2)*selectedEntropyEnergyIntegral cfg x L E T)) ∂expMeasure ((n:ℝ)*cfg.B))≤
      Real.exp (θ*protectedEntropyTotal L E cfg.B x.val saved) := by
  have hZ := (selectedLineLikelihood_continuousOn cfg x he K hKcfg hK L hsp hN hk).mono
    (Icc_subset_Icc le_rfl hTg)
  have hF := selectedProtectedEntropyTotal_continuous cfg x L E saved cfg.B
  have hU := selectedEntropySourceIntegral_continuous cfg x L E saved hB
  have hW := sourcePrimitive_continuous _ (selectedEntropyEnergy_continuous cfg x L E)
  have hz := hZ.mul (Real.continuous_exp.comp (((hF.sub hU).const_mul θ).sub (hW.const_mul (θ^2/2)))).continuousOn
  have hJ := hZ.mul ((selectedProtectedEntropyExpCandidate_continuousOn cfg x he L E saved hn hB hm hs θ positive).mono
    (Icc_subset_Icc le_rfl hTg))
  have hh := exponential_first_step_nonpos_of_derivative ((n:ℝ)*cfg.B) T
    (mul_pos (by exact_mod_cast hn) hB) hT _ _ hz hJ
    (fun t ht=>selectedProtectedEntropyExponential_generator cfg x he K hKcfg hK L E saved hn hB hm
      hs hsp hE hN hk θ hθ (positive t) t ⟨ht.1,ht.2.trans_le hTg⟩)
  simpa only [Pi.mul_apply,Pi.sub_apply,Function.comp_apply,selectedEntropySourceIntegral,selectedEntropyEnergyIntegral,sourcePrimitive_zero,
    sub_zero,mul_zero,selectedLineLikelihood_zero cfg x he L,one_mul,protectedEntropyTotal,protectedLineEntropy,
    selectedProtectedLedger_zero cfg x he L saved] using hh

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedCreditExp_first_mean
#print axioms NoThreeLine.selectedProtectedEntropyExp_first_mean
