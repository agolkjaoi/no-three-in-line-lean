import NoThreeLine.ProtectedLedgerLikelihoodFlow

/-! Regularity of the real saved-ledger observables along a fixed physical
mode. The killed candidate mean is continuous even for arbitrary
time-dependent positive-retirement flags: its actual generator formula
eliminates those flags on the valid selected flow. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE LineDrift

theorem protectedLineCredit_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (L : LineIndex n) (saved : Grid n→ℝ) (p : Grid n) :
    Continuous (fun z : Coordinates n=>protectedLineCredit L (e.withCoordinates z) saved p) := by
  cases hp : (e.process.accounts p).status <;>
    simp only [protectedLineCredit,ExtendedState.withCoordinates,ProcessState.withWeights,
      CreditAccount.credit,hp,reduceCtorEq,or_self,true_or,or_true,if_true,if_false,zero_div]
  · change Continuous (fun z : Coordinates n=>z.1 p/((2-(occupancy e.process L:ℝ))/(2-z.2.1 L)))
    simp only [div_eq_mul_inv,mul_inv_rev,inv_inv]
    fun_prop
  all_goals exact continuous_const

theorem protectedLedgerContinuousDrift_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) :
    Continuous (fun z : Coordinates n=>protectedLedgerContinuousDrift (e.withCoordinates z) Γ mask L p) := by
  by_cases hp : (e.process.accounts p).status=.active
  · simp only [protectedLedgerContinuousDrift,show ∀z : Coordinates n,
        ((e.withCoordinates z).process.accounts p).status=.active from fun _=>hp,if_true,
      protectedLineContinuousDrift,specifiedLineWeight_withCoordinates]
    change Continuous (fun z : Coordinates n=>
      (e.process.withWeights z.1).continuousCreditDrift Γ ((e.process.withWeights z.1).birthRate mask) p/
        ((2-(occupancy e.process L:ℝ))/(2-z.2.1 L))-
      lineIntensity e.process mask z L*b (occupancy e.process L)*
        (z.1 p*(2-z.2.1 L)/(2-(occupancy e.process L:ℝ))))
    simp only [ProcessState.withWeights_continuousCreditDrift,div_eq_mul_inv,mul_inv_rev,inv_inv]
    have hv : Continuous (fun z : Coordinates n=>e.process.compensatedVectorField Γ mask z.1 p) :=
      (continuous_apply p).comp ((e.process.compensatedVectorField_contDiff Γ mask).continuous.comp continuous_fst)
    have hl := (lineIntensity_contDiff e.process mask L).continuous
    fun_prop
  · have heq : (fun z : Coordinates n=>protectedLedgerContinuousDrift (e.withCoordinates z) Γ mask L p)=
        (fun _ : Coordinates n=>(0:ℝ)) := funext (fun _=>if_neg hp)
    rw [heq]
    exact continuous_const

theorem protectedLinePositiveDrift_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) :
    Continuous (fun z : Coordinates n=>protectedLinePositiveDrift (e.withCoordinates z) mask L p) := by
  simp only [protectedLinePositiveDrift,specifiedLineWeight_withCoordinates]
  change Continuous (fun z : Coordinates n=>phaseRate e.process mask z.1 p*
    (1-b (occupancy e.process L))*(z.1 p*(2-z.2.1 L)/(2-(occupancy e.process L:ℝ))))
  have hr := (phaseRate_contDiff e.process mask p).continuous
  fun_prop

theorem selectedLedgerCurve_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box) :
    Continuous (fun t : ℝ=>selectedCurve cfg (x,t)) := by
  change Continuous (fun t : ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,t))
  exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)

theorem selectedProtectedLedger_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (saved : Grid n→ℝ) (p : Grid n) :
    Continuous (fun t=>protectedLineCredit L (selectedTrajectory cfg (x,t)) saved p) :=
  (protectedLineCredit_withCoordinates_continuous x.val L saved p).comp (selectedLedgerCurve_continuous cfg x)

theorem selectedProtectedLedgerDrift_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (p : Grid n) :
    Continuous (fun t=>protectedLedgerContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p) :=
  (protectedLedgerContinuousDrift_withCoordinates_continuous x.val cfg.directions cfg.mask L p).comp
    (selectedLedgerCurve_continuous cfg x)

theorem selectedProtectedSource_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (p : Grid n) :
    Continuous (fun t=>protectedLinePositiveDrift (selectedTrajectory cfg (x,t)) cfg.mask L p) :=
  (protectedLinePositiveDrift_withCoordinates_continuous x.val cfg.mask L p).comp
    (selectedLedgerCurve_continuous cfg x)

theorem selectedProtectedCandidateMean_continuousOn {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (p : Grid n)
    (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L) (hpL : p∈L.val)
    (positive : ℝ→Grid n→Grid n→Bool) :
    ContinuousOn (fun t=>protectedLedgerCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) p) (Icc 0 (selectedGuardTime cfg x)) := by
  let C := fun t=>protectedLineCredit L (selectedTrajectory cfg (x,t)) saved p
  let D := fun t=>protectedLedgerContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p
  let G := fun t=>protectedLinePositiveDrift (selectedTrajectory cfg (x,t)) cfg.mask L p
  let Λ := fun t=>lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L
  have hc : Continuous C := selectedProtectedLedger_continuous cfg x L saved p
  have hd : Continuous D := selectedProtectedLedgerDrift_continuous cfg x L p
  have hg : Continuous G := selectedProtectedSource_continuous cfg x L p
  have hl : Continuous Λ := (lineIntensity_contDiff x.val.process cfg.mask L).continuous.comp
    (selectedLedgerCurve_continuous cfg x)
  have hr : (n:ℝ)*cfg.B≠0 := (mul_pos (by exact_mod_cast hn) hB).ne'
  have hf : Continuous (fun t=>C t+(G t-D t-Λ t*C t)/((n:ℝ)*cfg.B)) := by fun_prop
  apply hf.continuousOn.congr
  intro t ht
  have h := protectedLedgerCandidateMean_compensation_all L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
    (selectedTrajectory_valid cfg x he t ht) (positive t) p hs hpL hsp
  change D t+Λ t*C t+((n:ℝ)*cfg.B)*
    (protectedLedgerCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (positive t) p-C t)=G t at h
  have hj : protectedLedgerCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B
      (positive t) p-C t=(G t-D t-Λ t*C t)/((n:ℝ)*cfg.B) := by
    apply (eq_div_iff hr).mpr
    nlinarith only [h]
  linarith only [hj]

end NoThreeLine

#print axioms NoThreeLine.selectedProtectedCandidateMean_continuousOn
