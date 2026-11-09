import NoThreeLine.ProtectedEntropyRegularity

/-! The entropy source is continuous through zero credit. The logarithmic
slope only occurs multiplied by the physical positive drift. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines LineDrift

theorem protectedEntropySlope_mul (B c : ℝ) (hB : 0<B) :
    protectedEntropySlope B c*c=protectedEntropy B c-c := by
  rw [protectedEntropy_eq B c hB]
  unfold protectedEntropySlope
  ring

def protectedEntropySource {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) (B : ℝ) : ℝ :=
  protectedEntropySlope B (protectedLineCredit L e saved p)*protectedLinePositiveDrift e mask L p-
    protectedEntropyLedgerCostRate e Γ mask L p

theorem protectedEntropySource_shape {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) (B : ℝ) (hB : 0<B) :
    protectedEntropySource e saved Γ mask L p B=
      e.process.birthRate mask p*(1-b (occupancy e.process L))*
        (protectedLineEntropy L e saved B p-protectedLineCredit L e saved p)-
          protectedEntropyLedgerCostRate e Γ mask L p := by
  unfold protectedEntropySource protectedLinePositiveDrift protectedLineEntropy
  by_cases hp : (e.process.accounts p).status=.active
  · rw [protectedLineCredit_active L e saved p hp,←protectedEntropySlope_mul B _ hB]
    ring
  · simp only [ProcessState.birthRate,hp,and_false,if_false,zero_mul,mul_zero]

theorem protectedEntropyLedgerCostRate_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) :
    Continuous (fun z : Coordinates n=>protectedEntropyLedgerCostRate (e.withCoordinates z) Γ mask L p) := by
  change Continuous (fun z : Coordinates n=>if (e.process.accounts p).status=.active then
    ∑q∈e.process.activeEvents,if q∈L.val then 0 else phaseRate e.process mask z.1 q*
      (specifiedLineWeight (e.withCoordinates z) L p*protectedEntropyCost (birthMultiplier Γ e.process.selected p q)) else 0)
  split_ifs with hp
  · have hc : Continuous (fun z : Coordinates n=>specifiedLineWeight (e.withCoordinates z) L p) := by
      have h := protectedLineCredit_withCoordinates_continuous e L (fun _=>0) p
      have heq : (fun z : Coordinates n=>protectedLineCredit L (e.withCoordinates z) (fun _=>0) p)=
          (fun z : Coordinates n=>specifiedLineWeight (e.withCoordinates z) L p) :=
        funext (fun z=>protectedLineCredit_active L (e.withCoordinates z) (fun _=>0) p hp)
      rw [heq] at h
      exact h
    apply continuous_finsetSum
    intro q _
    split_ifs
    · exact continuous_const
    · exact (phaseRate_contDiff e.process mask q).continuous.mul (hc.mul_const _)
  · exact continuous_const

theorem protectedEntropySource_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n)
    (B : ℝ) (hB : 0<B) :
    Continuous (fun z : Coordinates n=>protectedEntropySource (e.withCoordinates z) saved Γ mask L p B) := by
  simp_rw [protectedEntropySource_shape _ saved Γ mask L p B hB]
  change Continuous (fun z : Coordinates n=>phaseRate e.process mask z.1 p*(1-b (occupancy e.process L))*
    (protectedEntropy B (protectedLineCredit L (e.withCoordinates z) saved p)-
      protectedLineCredit L (e.withCoordinates z) saved p)-protectedEntropyLedgerCostRate (e.withCoordinates z) Γ mask L p)
  have hc := protectedLineCredit_withCoordinates_continuous e L saved p
  exact (((phaseRate_contDiff e.process mask p).continuous.mul_const _).mul
    (((protectedEntropy_continuous B).comp hc).sub hc)).sub
      (protectedEntropyLedgerCostRate_withCoordinates_continuous e Γ mask L p)

theorem selectedProtectedEntropySource_continuous {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (L : LineIndex n) (saved : Grid n→ℝ) (p : Grid n) (hB : 0<cfg.B) :
    Continuous (fun t=>protectedEntropySource (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask L p cfg.B) :=
  (protectedEntropySource_withCoordinates_continuous x.val saved cfg.directions cfg.mask L p cfg.B hB).comp
    (selectedLedgerCurve_continuous cfg x)

end NoThreeLine
#print axioms NoThreeLine.protectedEntropySource_shape
#print axioms NoThreeLine.selectedProtectedEntropySource_continuous
