import NoThreeLine.ProtectedLedgerMarkMean
import NoThreeLine.ProtectedLineLikelihoodFlow

/-! The saved ledger has zero drift after retirement. Along the actual
selected flow, likelihood times ledger credit has precisely the killed
mark-generator compensation with the actual positive source. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

def protectedLedgerContinuousDrift {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) : ℝ :=
  if (e.process.accounts p).status=.active then protectedLineContinuousDrift e Γ mask L p else 0

theorem protectedLedger_generator_all {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (p : Grid n) (he : e.process.Valid) (hs : e.process.stopped=false)
    (hpL : p∈L.val) (hsp : specified Γ L) :
    protectedLedgerContinuousDrift e Γ mask L p+protectedLedgerExternalJumpRate e saved Γ mask positive L p=
      protectedLinePositiveDrift e mask L p := by
  by_cases hp : (e.process.accounts p).status=.active
  · rw [protectedLedgerContinuousDrift,if_pos hp]
    exact protectedLedger_generator e saved Γ mask positive L p he hs hp hpL hsp
  · have hj : protectedLedgerExternalJumpRate e saved Γ mask positive L p=0 := by
      unfold protectedLedgerExternalJumpRate
      apply Finset.sum_eq_zero
      intro q _
      split_ifs
      · rfl
      · rw [protectedLineCredit_birth_inactive L e saved Γ q p (positive q) hp]
        ring
    simp only [protectedLedgerContinuousDrift,if_neg hp,hj,add_zero,protectedLinePositiveDrift,
      ProcessState.birthRate,hp,and_false,if_false,zero_mul]

theorem protectedLedgerCandidateMean_compensation_all {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (hn : 0<n) (hB : 0<B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hw : e.Valid B)
    (positive : Grid n→Grid n→Bool) (p : Grid n) (hs : e.process.stopped=false)
    (hpL : p∈L.val) (hsp : specified Γ L) :
    protectedLedgerContinuousDrift e Γ mask L p+
      lineIntensity e.process mask e.coordinates L*protectedLineCredit L e saved p+
      ((n:ℝ)*B)*(protectedLedgerCandidateMean L e saved Γ mask B positive p-protectedLineCredit L e saved p)=
        protectedLinePositiveDrift e mask L p := by
  rw [protectedLedgerCandidateMean_generator L e saved Γ mask B hn hB hm hw positive p]
  have h := protectedLedger_generator_all e saved Γ mask positive L p hw.1 hs hpL hsp
  linarith

theorem selectedProtectedLedger_hasDerivAt {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (p : Grid n)
    (saved : Grid n→ℝ) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>protectedLineCredit L (selectedTrajectory cfg (x,u)) saved p)
      (protectedLedgerContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p) t := by
  by_cases hp : (x.val.process.accounts p).status=.active
  · have heq : (fun u=>protectedLineCredit L (selectedTrajectory cfg (x,u)) saved p)=
        (fun u=>specifiedLineWeight (selectedTrajectory cfg (x,u)) L p) :=
      funext (fun u=>protectedLineCredit_active L _ saved p hp)
    rw [heq]
    have hd := selected_specifiedLineWeight_hasDerivAt cfg x he L p hs hsp hN t ht
    simpa only [protectedLedgerContinuousDrift,show ((selectedTrajectory cfg (x,t)).process.accounts p).status=.active from hp,
      if_true] using hd
  · have heq : (fun u=>protectedLineCredit L (selectedTrajectory cfg (x,u)) saved p)=
        (fun _ : ℝ=>protectedLineCredit L x.val saved p) := by
      funext u
      cases hstatus : (x.val.process.accounts p).status <;>
        simp_all [protectedLineCredit,selectedTrajectory,ExtendedState.withCoordinates,ProcessState.withWeights,CreditAccount.credit]
    rw [heq]
    have hzero : protectedLedgerContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p=0 :=
      if_neg hp
    rw [hzero]
    exact hasDerivAt_const t _

theorem selectedProtectedLedger_likelihood_generator {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (p : Grid n) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hpL : p∈L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : Grid n→Grid n→Bool) (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>selectedLineLikelihood cfg x L u*protectedLineCredit L (selectedTrajectory cfg (x,u)) saved p)
      (selectedLineLikelihood cfg x L t*
        (protectedLinePositiveDrift (selectedTrajectory cfg (x,t)) cfg.mask L p-
          ((n:ℝ)*cfg.B)*(protectedLedgerCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B positive p-
            protectedLineCredit L (selectedTrajectory cfg (x,t)) saved p))) t := by
  have hl := selectedLineLikelihood_hasDerivAt cfg x he K hKcfg hK L hs hsp hN hk t ht
  have hc := selectedProtectedLedger_hasDerivAt cfg x he L p saved hs hsp hN t ht
  have hg := protectedLedgerCandidateMean_compensation_all L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
    (selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩) positive p hs hpL hsp
  apply (hl.mul hc).congr_deriv
  change (lineIntensity (selectedTrajectory cfg (x,t)).process cfg.mask (selectedTrajectory cfg (x,t)).coordinates L*
    selectedLineLikelihood cfg x L t)*protectedLineCredit L (selectedTrajectory cfg (x,t)) saved p+
    selectedLineLikelihood cfg x L t*protectedLedgerContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p=_
  have hg' : protectedLedgerContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p+
      lineIntensity (selectedTrajectory cfg (x,t)).process cfg.mask (selectedTrajectory cfg (x,t)).coordinates L*
        protectedLineCredit L (selectedTrajectory cfg (x,t)) saved p=
      protectedLinePositiveDrift (selectedTrajectory cfg (x,t)) cfg.mask L p-
        ((n:ℝ)*cfg.B)*(protectedLedgerCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B positive p-
          protectedLineCredit L (selectedTrajectory cfg (x,t)) saved p) := by linarith
  rw [←hg']
  ring

end NoThreeLine

#print axioms NoThreeLine.protectedLedger_generator_all
#print axioms NoThreeLine.selectedProtectedLedger_likelihood_generator
