import NoThreeLine.ProtectedCenteredRegularity

/-! The actual first-exponential centered square identity.  The source
centering cancels every drift cross term, leaving whole-event energy. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE

theorem selectedProtectedCreditCentered_first_exponential_mean {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : ℝ→Grid n→Grid n→Bool) (T : ℝ) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    (∫t,(if t≤T then selectedLineLikelihood cfg x L t*
      protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (positive t)
        (fun v a=>(protectedCreditTotal L E v a-selectedCreditSourceIntegral cfg x L E t)^2)
      else selectedLineLikelihood cfg x L T*
        (protectedCreditTotal L E (selectedTrajectory cfg (x,T)) saved-selectedCreditSourceIntegral cfg x L E T)^2)
      ∂expMeasure ((n:ℝ)*cfg.B))=
      (protectedCreditTotal L E x.val saved)^2+
        ∫t in (0:ℝ)..T,Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedLineLikelihood cfg x L t*
          protectedCreditEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E := by
  have hZ := (selectedLineLikelihood_continuousOn cfg x he K hKcfg hK L hsp hN hk).mono
    (Icc_subset_Icc le_rfl hTg)
  have hV : Continuous (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E) :=
    (protectedCreditEnergyRate_withCoordinates_continuous x.val cfg.directions cfg.mask L E).comp
      (selectedLedgerCurve_continuous cfg x)
  have hA := (selectedProtectedCreditCenteredCandidate_continuousOn cfg x he L E saved hn hB hm hs positive).mono
    (Icc_subset_Icc le_rfl hTg)
  have hh := weighted_centered_square_first_mean ((n:ℝ)*cfg.B) T
    (mul_pos (by exact_mod_cast hn) hB) hT _ _ _ _ _ hZ
    (selectedProtectedCreditTotal_continuous cfg x L E saved).continuousOn
    (selectedCreditSourceIntegral_continuous cfg x L E).continuousOn hV.continuousOn hA
    (fun t ht=>selectedProtectedCreditCentered_likelihood_generator cfg x he K hKcfg hK L E saved hn hB hm
      hs hsp hE hN hk (positive t) t ⟨ht.1,ht.2.trans_le hTg⟩)
  simpa only [selectedCreditSourceIntegral,sourcePrimitive_zero,sub_zero,
    selectedLineLikelihood_zero cfg x he L,one_mul,protectedCreditTotal,
    selectedProtectedLedger_zero cfg x he L saved] using hh

theorem selectedProtectedEntropyCentered_first_exponential_mean {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : ℝ→Grid n→Grid n→Bool) (T : ℝ) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    (∫t,(if t≤T then selectedLineLikelihood cfg x L t*
      protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (positive t)
        (fun v a=>(protectedEntropyTotal L E cfg.B v a-selectedEntropySourceIntegral cfg x L E saved t)^2)
      else selectedLineLikelihood cfg x L T*
        (protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,T)) saved-selectedEntropySourceIntegral cfg x L E saved T)^2)
      ∂expMeasure ((n:ℝ)*cfg.B))=
      (protectedEntropyTotal L E cfg.B x.val saved)^2+
        ∫t in (0:ℝ)..T,Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedLineLikelihood cfg x L t*
          protectedEntropyEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E cfg.B := by
  have hZ := (selectedLineLikelihood_continuousOn cfg x he K hKcfg hK L hsp hN hk).mono
    (Icc_subset_Icc le_rfl hTg)
  have hV : Continuous (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E cfg.B) :=
    (protectedEntropyEnergyRate_withCoordinates_continuous x.val cfg.directions cfg.mask L E cfg.B).comp
      (selectedLedgerCurve_continuous cfg x)
  have hA := (selectedProtectedEntropyCenteredCandidate_continuousOn cfg x he L E saved hn hB hm hs positive).mono
    (Icc_subset_Icc le_rfl hTg)
  have hh := weighted_centered_square_first_mean ((n:ℝ)*cfg.B) T
    (mul_pos (by exact_mod_cast hn) hB) hT _ _ _ _ _ hZ
    (selectedProtectedEntropyTotal_continuous cfg x L E saved cfg.B).continuousOn
    (selectedEntropySourceIntegral_continuous cfg x L E saved hB).continuousOn hV.continuousOn hA
    (fun t ht=>selectedProtectedEntropyCentered_likelihood_generator cfg x he K hKcfg hK L E saved hn hB hm
      hs hsp hE hN hk (positive t) t ⟨ht.1,ht.2.trans_le hTg⟩)
  simpa only [selectedEntropySourceIntegral,sourcePrimitive_zero,sub_zero,
    selectedLineLikelihood_zero cfg x he L,one_mul,protectedEntropyTotal,protectedLineEntropy,
    selectedProtectedLedger_zero cfg x he L saved] using hh

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedCreditCentered_first_exponential_mean
#print axioms NoThreeLine.selectedProtectedEntropyCentered_first_exponential_mean
