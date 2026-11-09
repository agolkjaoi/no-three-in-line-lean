import NoThreeLine.ProtectedWholeSquareRegularity

/-! Arbitrary retirement flags disappear from actual whole-square candidate
means via the exact loss identity, leaving a continuous coordinate formula. -/
set_option autoImplicit false
noncomputable section
open Set
namespace NoThreeLine
open AuxiliaryODE

theorem selectedProtectedSquareCandidate_continuousOn_of_loss {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (saved : Grid n→ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (F : ExtendedState n→(Grid n→ℝ)→ℝ) (loss : ExtendedState n→Grid n→ℝ)
    (hF : Continuous (fun z : Coordinates n=>F (x.val.withCoordinates z) saved))
    (hl : ∀q,Continuous (fun z : Coordinates n=>loss (x.val.withCoordinates z) q))
    (positive : ℝ→Grid n→Grid n→Bool)
    (hactual : ∀t∈Icc (0:ℝ) (selectedGuardTime cfg x),∀q∈(selectedTrajectory cfg (x,t)).process.activeEvents,
      q∉L.val→F (selectedTrajectory cfg (x,t)) saved-
        F ((selectedTrajectory cfg (x,t)).birth cfg.directions q (positive t q))
          (protectedLineSave L (selectedTrajectory cfg (x,t))
            ((selectedTrajectory cfg (x,t)).birth cfg.directions q (positive t q)) saved)=loss (selectedTrajectory cfg (x,t)) q) :
    ContinuousOn (fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) (fun v a=>(F v a)^2)) (Icc 0 (selectedGuardTime cfg x)) := by
  let C := fun t=>(F (selectedTrajectory cfg (x,t)) saved)^2
  let G := fun t=>protectedExternalEventRate (selectedTrajectory cfg (x,t)) cfg.mask L
    (fun q=>(F (selectedTrajectory cfg (x,t)) saved-loss (selectedTrajectory cfg (x,t)) q)^2-C t)
  let Λ := fun t=>lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L
  have hc : Continuous C := (hF.pow 2).comp (selectedLedgerCurve_continuous cfg x)
  have hgc := protectedEventRate_withCoordinates_continuous x.val cfg.mask L
    (fun v q=>(F v saved-loss v q)^2-(F v saved)^2)
    (fun q=>((hF.sub (hl q)).pow 2).sub (hF.pow 2))
  have hg : Continuous G := hgc.comp (selectedLedgerCurve_continuous cfg x)
  have hΛ : Continuous Λ := (lineIntensity_contDiff x.val.process cfg.mask L).continuous.comp
    (selectedLedgerCurve_continuous cfg x)
  have hr : (n:ℝ)*cfg.B≠0 := (mul_pos (by exact_mod_cast hn) hB).ne'
  have hproxy : Continuous (fun t=>C t+(G t-Λ t*C t)/((n:ℝ)*cfg.B)) := by fun_prop
  apply hproxy.continuousOn.congr
  intro t ht
  have hh := protectedObservableCandidateMean_generator L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
    (selectedTrajectory_valid cfg x he t ht) (positive t) (fun v a=>(F v a)^2)
  rw [protectedObservableSquareExternal_shape _ saved cfg.directions cfg.mask (positive t) L F
    (loss (selectedTrajectory cfg (x,t))) (hactual t ht)] at hh
  change ((n:ℝ)*cfg.B)*(protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B (positive t) (fun v a=>(F v a)^2)-C t)=G t-Λ t*C t at hh
  have heq : protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) (fun v a=>(F v a)^2)-C t=(G t-Λ t*C t)/((n:ℝ)*cfg.B) := by
    apply (eq_div_iff hr).mpr
    nlinarith only [hh]
  linarith only [heq]

theorem selectedProtectedCreditSquareCandidate_continuousOn {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (E : Finset (Grid n))
    (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hs : x.val.process.stopped=false) (positive : ℝ→Grid n→Grid n→Bool) :
    ContinuousOn (fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) (fun v a=>(protectedCreditTotal L E v a)^2))
      (Icc 0 (selectedGuardTime cfg x)) := by
  apply selectedProtectedSquareCandidate_continuousOn_of_loss cfg x he L saved hn hB hm
    (protectedCreditTotal L E) (fun v q=>protectedExternalDeletion v cfg.directions L E q)
    (protectedCreditTotal_withCoordinates_continuous x.val L E saved)
    (fun q=>protectedExternalDeletion_withCoordinates_continuous x.val cfg.directions L E q) positive
  intro t ht q hq hqL
  exact protectedLedger_external_total_loss _ cfg.directions L E saved q (positive t q)
    (selectedTrajectory_valid cfg x he t ht).1 hs hq hqL

theorem selectedProtectedEntropySquareCandidate_continuousOn {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (E : Finset (Grid n))
    (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hs : x.val.process.stopped=false) (positive : ℝ→Grid n→Grid n→Bool) :
    ContinuousOn (fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) (fun v a=>(protectedEntropyTotal L E cfg.B v a)^2))
      (Icc 0 (selectedGuardTime cfg x)) := by
  apply selectedProtectedSquareCandidate_continuousOn_of_loss cfg x he L saved hn hB hm
    (protectedEntropyTotal L E cfg.B) (fun v q=>protectedEntropyDeletion v cfg.directions L E q cfg.B)
    (protectedEntropyTotal_withCoordinates_continuous x.val L E saved cfg.B)
    (fun q=>protectedEntropyDeletion_withCoordinates_continuous x.val cfg.directions L E q cfg.B) positive
  intro t ht q hq hqL
  exact protectedLedger_external_entropy_loss _ cfg.directions L E saved q cfg.B (positive t q)
    (selectedTrajectory_valid cfg x he t ht).1 hs hq hqL

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedCreditSquareCandidate_continuousOn
#print axioms NoThreeLine.selectedProtectedEntropySquareCandidate_continuousOn
