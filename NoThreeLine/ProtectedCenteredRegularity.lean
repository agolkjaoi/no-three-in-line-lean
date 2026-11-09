import NoThreeLine.ProtectedCenteredGenerator

/-! Time-dependent centering of the actual candidate observable preserves
continuity on the real guard interval, without regular retirement flags. -/
set_option autoImplicit false
noncomputable section
open Set
namespace NoThreeLine
open AuxiliaryODE

theorem selectedProtectedCenteredCandidate_continuousOn_of_loss {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (saved : Grid n→ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (F : ExtendedState n→(Grid n→ℝ)→ℝ) (loss : ExtendedState n→Grid n→ℝ)
    (hF : Continuous (fun z : Coordinates n=>F (x.val.withCoordinates z) saved))
    (hl : ∀q,Continuous (fun z : Coordinates n=>loss (x.val.withCoordinates z) q))
    (U : ℝ→ℝ) (hU : Continuous U) (positive : ℝ→Grid n→Grid n→Bool)
    (hactual : ∀t∈Icc (0:ℝ) (selectedGuardTime cfg x),∀q∈(selectedTrajectory cfg (x,t)).process.activeEvents,
      q∉L.val→F (selectedTrajectory cfg (x,t)) saved-
        F ((selectedTrajectory cfg (x,t)).birth cfg.directions q (positive t q))
          (protectedLineSave L (selectedTrajectory cfg (x,t))
            ((selectedTrajectory cfg (x,t)).birth cfg.directions q (positive t q)) saved)=loss (selectedTrajectory cfg (x,t)) q) :
    ContinuousOn (fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) (fun v a=>(F v a-U t)^2)) (Icc 0 (selectedGuardTime cfg x)) := by
  let C := fun t=>(F (selectedTrajectory cfg (x,t)) saved-U t)^2
  let G := fun t=>protectedExternalEventRate (selectedTrajectory cfg (x,t)) cfg.mask L
    (fun q=>(F (selectedTrajectory cfg (x,t)) saved-U t-loss (selectedTrajectory cfg (x,t)) q)^2-C t)
  let Λ := fun t=>lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L
  have hfc : Continuous (fun t=>F (selectedTrajectory cfg (x,t)) saved) :=
    hF.comp (selectedLedgerCurve_continuous cfg x)
  have hc : Continuous C := (hfc.sub hU).pow 2
  have hg : Continuous G := by
    change Continuous (fun t=>∑q∈x.val.process.activeEvents,if q∈L.val then 0 else
      phaseRate x.val.process cfg.mask (selectedCurve cfg (x,t)).1 q*
        ((F (selectedTrajectory cfg (x,t)) saved-U t-loss (selectedTrajectory cfg (x,t)) q)^2-C t))
    apply continuous_finsetSum
    intro q _
    split_ifs
    · exact continuous_const
    · exact ((phaseRate_contDiff x.val.process cfg.mask q).continuous.comp
        (selectedLedgerCurve_continuous cfg x)).mul
        ((((hfc.sub hU).sub ((hl q).comp (selectedLedgerCurve_continuous cfg x))).pow 2).sub hc)
  have hΛ : Continuous Λ := (lineIntensity_contDiff x.val.process cfg.mask L).continuous.comp
    (selectedLedgerCurve_continuous cfg x)
  have hr : (n:ℝ)*cfg.B≠0 := (mul_pos (by exact_mod_cast hn) hB).ne'
  have hproxy : Continuous (fun t=>C t+(G t-Λ t*C t)/((n:ℝ)*cfg.B)) := by fun_prop
  apply hproxy.continuousOn.congr
  intro t ht
  have hh := protectedObservableCandidateMean_generator L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
    (selectedTrajectory_valid cfg x he t ht) (positive t) (fun v a=>(F v a-U t)^2)
  have hex : protectedObservableExternalRate (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask
      (positive t) L (fun v a=>(F v a-U t)^2)=G t := by
    unfold protectedObservableExternalRate G protectedExternalEventRate
    apply Finset.sum_congr rfl
    intro q hq
    by_cases hqL : q∈L.val
    · simp only [if_pos hqL]
    · simp only [if_neg hqL]
      have heq := hactual t ht q hq hqL
      have hnext : F ((selectedTrajectory cfg (x,t)).birth cfg.directions q (positive t q))
          (protectedLineSave L (selectedTrajectory cfg (x,t))
            ((selectedTrajectory cfg (x,t)).birth cfg.directions q (positive t q)) saved)=
          F (selectedTrajectory cfg (x,t)) saved-loss (selectedTrajectory cfg (x,t)) q := by linarith only [heq]
      rw [hnext]
      dsimp only [C]
      ring
  rw [hex] at hh
  change ((n:ℝ)*cfg.B)*(protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B (positive t) (fun v a=>(F v a-U t)^2)-C t)=G t-Λ t*C t at hh
  have heq : protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) (fun v a=>(F v a-U t)^2)-C t=(G t-Λ t*C t)/((n:ℝ)*cfg.B) := by
    apply (eq_div_iff hr).mpr
    nlinarith only [hh]
  linarith only [heq]

theorem selectedProtectedCreditCenteredCandidate_continuousOn {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (E : Finset (Grid n))
    (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hs : x.val.process.stopped=false) (positive : ℝ→Grid n→Grid n→Bool) :
    ContinuousOn (fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t)
      (fun v a=>(protectedCreditTotal L E v a-selectedCreditSourceIntegral cfg x L E t)^2))
      (Icc 0 (selectedGuardTime cfg x)) := by
  apply selectedProtectedCenteredCandidate_continuousOn_of_loss cfg x he L saved hn hB hm
    (protectedCreditTotal L E) (fun v q=>protectedExternalDeletion v cfg.directions L E q)
    (protectedCreditTotal_withCoordinates_continuous x.val L E saved)
    (fun q=>protectedExternalDeletion_withCoordinates_continuous x.val cfg.directions L E q)
    _ (selectedCreditSourceIntegral_continuous cfg x L E) positive
  intro t ht q hq hqL
  exact protectedLedger_external_total_loss _ cfg.directions L E saved q (positive t q)
    (selectedTrajectory_valid cfg x he t ht).1 hs hq hqL

theorem selectedProtectedEntropyCenteredCandidate_continuousOn {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (E : Finset (Grid n))
    (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hs : x.val.process.stopped=false) (positive : ℝ→Grid n→Grid n→Bool) :
    ContinuousOn (fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t)
      (fun v a=>(protectedEntropyTotal L E cfg.B v a-selectedEntropySourceIntegral cfg x L E saved t)^2))
      (Icc 0 (selectedGuardTime cfg x)) := by
  apply selectedProtectedCenteredCandidate_continuousOn_of_loss cfg x he L saved hn hB hm
    (protectedEntropyTotal L E cfg.B) (fun v q=>protectedEntropyDeletion v cfg.directions L E q cfg.B)
    (protectedEntropyTotal_withCoordinates_continuous x.val L E saved cfg.B)
    (fun q=>protectedEntropyDeletion_withCoordinates_continuous x.val cfg.directions L E q cfg.B)
    _ (selectedEntropySourceIntegral_continuous cfg x L E saved hB) positive
  intro t ht q hq hqL
  exact protectedLedger_external_entropy_loss _ cfg.directions L E saved q cfg.B (positive t q)
    (selectedTrajectory_valid cfg x he t ht).1 hs hq hqL

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedCreditCenteredCandidate_continuousOn
#print axioms NoThreeLine.selectedProtectedEntropyCenteredCandidate_continuousOn
