import NoThreeLine.ProtectedCenteredRegularity

/-! The actual killed candidate mean for an exponential observable is
continuous on the real selected guard interval. The actual loss identity
removes arbitrary time-dependent retirement flags from the proxy. -/
set_option autoImplicit false
noncomputable section
open Set
namespace NoThreeLine
open AuxiliaryODE

theorem selectedProtectedExponentialCandidate_continuousOn_of_loss {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (saved : Grid n→ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (F : ExtendedState n→(Grid n→ℝ)→ℝ) (loss : ExtendedState n→Grid n→ℝ)
    (hF : Continuous (fun z : Coordinates n=>F (x.val.withCoordinates z) saved))
    (hl : ∀q,Continuous (fun z : Coordinates n=>loss (x.val.withCoordinates z) q))
    (θ : ℝ) (A : ℝ→ℝ) (hA : Continuous A) (positive : ℝ→Grid n→Grid n→Bool)
    (hactual : ∀t∈Icc (0:ℝ) (selectedGuardTime cfg x),∀q∈(selectedTrajectory cfg (x,t)).process.activeEvents,
      q∉L.val→F (selectedTrajectory cfg (x,t)) saved-
        F ((selectedTrajectory cfg (x,t)).birth cfg.directions q (positive t q))
          (protectedLineSave L (selectedTrajectory cfg (x,t))
            ((selectedTrajectory cfg (x,t)).birth cfg.directions q (positive t q)) saved)=loss (selectedTrajectory cfg (x,t)) q) :
    ContinuousOn (fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) (fun v a=>Real.exp (θ*F v a-A t)))
      (Icc 0 (selectedGuardTime cfg x)) := by
  let C := fun t=>Real.exp (θ*F (selectedTrajectory cfg (x,t)) saved-A t)
  let G := fun t=>protectedExternalEventRate (selectedTrajectory cfg (x,t)) cfg.mask L
    (fun q=>Real.exp (θ*(F (selectedTrajectory cfg (x,t)) saved-loss (selectedTrajectory cfg (x,t)) q)-A t)-C t)
  let Λ := fun t=>lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L
  have hfc : Continuous (fun t=>F (selectedTrajectory cfg (x,t)) saved) :=
    hF.comp (selectedLedgerCurve_continuous cfg x)
  have hc : Continuous C := Real.continuous_exp.comp ((hfc.const_mul θ).sub hA)
  have hg : Continuous G := by
    change Continuous (fun t=>∑q∈x.val.process.activeEvents,if q∈L.val then 0 else
      phaseRate x.val.process cfg.mask (selectedCurve cfg (x,t)).1 q*
        (Real.exp (θ*(F (selectedTrajectory cfg (x,t)) saved-loss (selectedTrajectory cfg (x,t)) q)-A t)-C t))
    apply continuous_finsetSum
    intro q _
    split_ifs
    · exact continuous_const
    · exact ((phaseRate_contDiff x.val.process cfg.mask q).continuous.comp
        (selectedLedgerCurve_continuous cfg x)).mul
        ((Real.continuous_exp.comp
          (((hfc.sub ((hl q).comp (selectedLedgerCurve_continuous cfg x))).const_mul θ).sub hA)).sub hc)
  have hΛ : Continuous Λ := (lineIntensity_contDiff x.val.process cfg.mask L).continuous.comp
    (selectedLedgerCurve_continuous cfg x)
  have hr : (n:ℝ)*cfg.B≠0 := (mul_pos (by exact_mod_cast hn) hB).ne'
  have hproxy : Continuous (fun t=>C t+(G t-Λ t*C t)/((n:ℝ)*cfg.B)) := by fun_prop
  apply hproxy.continuousOn.congr
  intro t ht
  have hh := protectedObservableCandidateMean_generator L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
    (selectedTrajectory_valid cfg x he t ht) (positive t) (fun v a=>Real.exp (θ*F v a-A t))
  have hex : protectedObservableExternalRate (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask
      (positive t) L (fun v a=>Real.exp (θ*F v a-A t))=G t := by
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
  rw [hex] at hh
  change ((n:ℝ)*cfg.B)*(protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B (positive t) (fun v a=>Real.exp (θ*F v a-A t))-C t)=G t-Λ t*C t at hh
  have heq : protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) (fun v a=>Real.exp (θ*F v a-A t))-C t=
        (G t-Λ t*C t)/((n:ℝ)*cfg.B) := by
    apply (eq_div_iff hr).mpr
    nlinarith only [hh]
  linarith only [heq]

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedExponentialCandidate_continuousOn_of_loss
