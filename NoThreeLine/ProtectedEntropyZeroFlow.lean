import NoThreeLine.ProtectedEntropyGenerator
import NoThreeLine.ProtectedLedgerRegularity
import NoThreeLine.SelectedLineClockBound

/-! At a zero protected weight the actual multiplicative flow is zero on
its whole selected interval, so its entropy composition has derivative zero.
This does not assert that the scalar entropy is differentiable at zero. -/
set_option autoImplicit false
noncomputable section
open Set Filter
open scoped Topology
namespace NoThreeLine
open AuxiliaryODE

theorem selected_protectedWeight_zero_on {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (p : Grid n)
    (hN : occupancy x.val.process L≤1) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x))
    (hk : (selectedCurve cfg (x,t)).2.1 L<2)
    (hz : specifiedLineWeight (selectedTrajectory cfg (x,t)) L p=0) :
    ∀u∈Icc (0:ℝ) (selectedGuardTime cfg x),
      specifiedLineWeight (selectedTrajectory cfg (x,u)) L p=0 := by
  have ha : (selectedCurve cfg (x,t)).1 p=0 := by
    change (selectedCurve cfg (x,t)).1 p/protection (occupancy x.val.process L)
      ((selectedCurve cfg (x,t)).2.1 L)=0 at hz
    exact (div_eq_zero_iff).mp hz |>.resolve_right (protection_pos _ _ hN hk).ne'
  rw [selectedCurve_weight_eq_exp cfg x he p t ht] at ha
  have hinit : (x.val.process.accounts p).weight=0 :=
    (mul_eq_zero.mp ha).resolve_right (Real.exp_ne_zero _)
  intro u hu
  change (selectedCurve cfg (x,u)).1 p/protection (occupancy x.val.process L)
    ((selectedCurve cfg (x,u)).2.1 L)=0
  rw [selectedCurve_weight_eq_exp cfg x he p u hu,hinit,zero_mul,zero_div]

theorem selected_protectedEntropy_zero_hasDerivAt {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (p : Grid n)
    (hN : occupancy x.val.process L≤1) (t : ℝ)
    (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x))
    (hk : (selectedCurve cfg (x,t)).2.1 L<2)
    (hz : specifiedLineWeight (selectedTrajectory cfg (x,t)) L p=0) :
    HasDerivAt (fun u=>protectedEntropy cfg.B (specifiedLineWeight (selectedTrajectory cfg (x,u)) L p)) 0 t := by
  apply (hasDerivAt_const t (0:ℝ)).congr_of_eventuallyEq
  filter_upwards [Icc_mem_nhds ht.1 ht.2] with u hu
  rw [selected_protectedWeight_zero_on cfg x he L p hN t ⟨ht.1.le,ht.2.le⟩ hk hz u hu]
  simp

theorem selected_protectedLedgerEntropy_hasDerivAt {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (p : Grid n)
    (saved : Grid n→ℝ) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (hclock : x.val.clocks L≤K) (hB : 0<cfg.B)
    (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>protectedLineEntropy L (selectedTrajectory cfg (x,u)) saved cfg.B p)
      (protectedEntropySlope cfg.B (protectedLineCredit L (selectedTrajectory cfg (x,t)) saved p)*
        protectedLedgerContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p) t := by
  by_cases hp : (x.val.process.accounts p).status=.active
  · have heq : (fun u=>protectedLineEntropy L (selectedTrajectory cfg (x,u)) saved cfg.B p)=
        (fun u=>protectedEntropy cfg.B (specifiedLineWeight (selectedTrajectory cfg (x,u)) L p)) :=
      funext (fun _=>congrArg (protectedEntropy cfg.B) (protectedLineCredit_active L _ saved p hp))
    rw [heq,protectedLineCredit_active L (selectedTrajectory cfg (x,t)) saved p hp,
      protectedLedgerContinuousDrift,if_pos (show ((selectedTrajectory cfg (x,t)).process.accounts p).status=.active from hp)]
    have hcl := selectedCurve_specifiedClock_le cfg x he K hKcfg L hsp hN hclock t ⟨ht.1.le,ht.2.le⟩
    have hcur := selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩
    have hnonneg := (specifiedLineWeight_bounds _ L p cfg.B K hcur hN hcl hK).1
    by_cases hz : specifiedLineWeight (selectedTrajectory cfg (x,t)) L p=0
    · rw [hz,protectedEntropySlope_zero,zero_mul]
      exact selected_protectedEntropy_zero_hasDerivAt cfg x he L p hN t ht (hcl.trans_lt hK) hz
    · have hpos : 0<specifiedLineWeight (selectedTrajectory cfg (x,t)) L p :=
        lt_of_le_of_ne hnonneg (Ne.symm hz)
      exact selected_protectedEntropy_hasDerivAt cfg x he L p hs hsp hN hB t ht hpos
  · have heq : (fun u=>protectedLineEntropy L (selectedTrajectory cfg (x,u)) saved cfg.B p)=
        (fun _ : ℝ=>protectedLineEntropy L x.val saved cfg.B p) := by
      funext u
      unfold protectedLineEntropy
      congr 1
      cases hstatus : (x.val.process.accounts p).status <;>
        simp_all [protectedLineCredit,selectedTrajectory,ExtendedState.withCoordinates,ProcessState.withWeights,CreditAccount.credit]
    rw [heq]
    have hd : protectedLedgerContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p=0 := if_neg hp
    rw [hd,mul_zero]
    exact hasDerivAt_const t _

theorem selectedProtectedEntropy_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (saved : Grid n→ℝ) (B : ℝ) (p : Grid n) :
    Continuous (fun t=>protectedLineEntropy L (selectedTrajectory cfg (x,t)) saved B p) :=
  (protectedEntropy_continuous B).comp (selectedProtectedLedger_continuous cfg x L saved p)

end NoThreeLine
#print axioms NoThreeLine.selected_protectedWeight_zero_on
#print axioms NoThreeLine.selected_protectedLedgerEntropy_hasDerivAt
#print axioms NoThreeLine.selectedProtectedEntropy_continuous
