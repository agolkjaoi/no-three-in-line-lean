import NoThreeLine.ProtectedEntropySource

/-! Actual saved credit and entropy summed over a fixed set of labels.
Their squared continuous derivatives retain every cross term. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def protectedCreditTotal {n : ℕ} (L : LineIndex n) (E : Finset (Grid n))
    (e : ExtendedState n) (saved : Grid n→ℝ) : ℝ :=
  ∑p∈E,protectedLineCredit L e saved p

def protectedEntropyTotal {n : ℕ} (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ)
    (e : ExtendedState n) (saved : Grid n→ℝ) : ℝ :=
  ∑p∈E,protectedLineEntropy L e saved B p

def protectedCreditTotalDrift {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) : ℝ :=
  ∑p∈E,protectedLedgerContinuousDrift e Γ mask L p

def protectedEntropyTotalDrift {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) : ℝ :=
  ∑p∈E,protectedEntropySlope B (protectedLineCredit L e saved p)*protectedLedgerContinuousDrift e Γ mask L p

def protectedCreditTotalSource {n : ℕ} (e : ExtendedState n) (mask : Grid n→ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) : ℝ :=
  ∑p∈E,protectedLinePositiveDrift e mask L p

def protectedEntropyTotalSource {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) : ℝ :=
  ∑p∈E,protectedEntropySource e saved Γ mask L p B

theorem selectedProtectedCreditTotal_continuous {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) :
    Continuous (fun t=>protectedCreditTotal L E (selectedTrajectory cfg (x,t)) saved) :=
  continuous_finsetSum _ (fun p _=>selectedProtectedLedger_continuous cfg x L saved p)

theorem selectedProtectedEntropyTotal_continuous {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (B : ℝ) :
    Continuous (fun t=>protectedEntropyTotal L E B (selectedTrajectory cfg (x,t)) saved) :=
  continuous_finsetSum _ (fun p _=>selectedProtectedEntropy_continuous cfg x L saved B p)

theorem selectedProtectedCreditTotal_hasDerivAt {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (E : Finset (Grid n))
    (saved : Grid n→ℝ) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>protectedCreditTotal L E (selectedTrajectory cfg (x,u)) saved)
      (protectedCreditTotalDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E) t := by
  apply HasDerivAt.fun_sum
  intro p _
  exact selectedProtectedLedger_hasDerivAt cfg x he L p saved hs hsp hN t ht

theorem selectedProtectedEntropyTotal_hasDerivAt {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (E : Finset (Grid n))
    (saved : Grid n→ℝ) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (hclock : x.val.clocks L≤K) (hB : 0<cfg.B)
    (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,u)) saved)
      (protectedEntropyTotalDrift (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L E cfg.B) t := by
  apply HasDerivAt.fun_sum
  intro p _
  exact selected_protectedLedgerEntropy_hasDerivAt cfg x he L p saved K hKcfg hK hs hsp hN hclock hB t ht

theorem selectedProtectedCreditTotal_square_hasDerivAt {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (E : Finset (Grid n))
    (saved : Grid n→ℝ) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>(protectedCreditTotal L E (selectedTrajectory cfg (x,u)) saved)^2)
      (2*protectedCreditTotal L E (selectedTrajectory cfg (x,t)) saved*
        protectedCreditTotalDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E) t := by
  convert! (selectedProtectedCreditTotal_hasDerivAt cfg x he L E saved hs hsp hN t ht).pow 2 using 1 <;>
    simp only [Pi.pow_apply,Nat.reduceSub,pow_one,Nat.cast_ofNat]

theorem selectedProtectedEntropyTotal_square_hasDerivAt {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (E : Finset (Grid n))
    (saved : Grid n→ℝ) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (hclock : x.val.clocks L≤K) (hB : 0<cfg.B)
    (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,u)) saved)^2)
      (2*protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,t)) saved*
        protectedEntropyTotalDrift (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L E cfg.B) t := by
  convert! (selectedProtectedEntropyTotal_hasDerivAt cfg x he L E saved K hKcfg hK hs hsp hN hclock hB t ht).pow 2 using 1 <;>
    simp only [Pi.pow_apply,Nat.reduceSub,pow_one,Nat.cast_ofNat]

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedCreditTotal_square_hasDerivAt
#print axioms NoThreeLine.selectedProtectedEntropyTotal_square_hasDerivAt
