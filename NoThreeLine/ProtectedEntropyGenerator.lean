import NoThreeLine.ProtectedEntropyLedger
import NoThreeLine.ProtectedLineFlow

/-! The real external-birth entropy generator. At zero, slope is only the
zero-compatible algebraic extension, not a claim of differentiability. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

@[simp] theorem protectedEntropySlope_zero (B : ℝ) : protectedEntropySlope B 0=0 := by
  simp [protectedEntropySlope]

def protectedEntropyExternalRate {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (p : Grid n) (B : ℝ) : ℝ :=
  ∑q∈e.process.activeEvents,if q∈L.val then 0 else e.process.birthRate mask q*
    (protectedLineEntropy L (e.birth Γ q (positive q))
      (protectedLineSave L e (e.birth Γ q (positive q)) saved) B p-protectedLineEntropy L e saved B p)

def protectedEntropyPointCostRate {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) : ℝ :=
  ∑q∈e.process.activeEvents,if q∈L.val then 0 else e.process.birthRate mask q*
    (specifiedLineWeight e L p*protectedEntropyCost (birthMultiplier Γ e.process.selected p q))

theorem protectedEntropy_external_rate_identity {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (p : Grid n) (B : ℝ) (hB : 0<B)
    (he : e.process.Valid) (hs : e.process.stopped=false) (hp : (e.process.accounts p).status=.active) :
    protectedEntropyExternalRate e saved Γ mask positive L p B=
      protectedEntropySlope B (specifiedLineWeight e L p)*protectedLedgerExternalJumpRate e saved Γ mask positive L p-
        protectedEntropyPointCostRate e Γ mask L p := by
  unfold protectedEntropyExternalRate protectedLedgerExternalJumpRate protectedEntropyPointCostRate
  rw [Finset.mul_sum,←Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro q hq
  by_cases hqL : q∈L.val
  · simp only [if_pos hqL,mul_zero,sub_zero]
  · simp only [if_neg hqL,protectedLineEntropy]
    rw [protectedLineCredit_external_birth L e saved Γ q p (positive q) he hs hq
      ((e.process.mem_activeEvents p).mpr hp) hqL,protectedLineCredit_active L e saved p hp]
    have hi := protectedEntropy_birth_identity B (specifiedLineWeight e L p)
      (birthMultiplier Γ e.process.selected p q) hB
    calc
      _ = e.process.birthRate mask q*
          (protectedEntropySlope B (specifiedLineWeight e L p)*
            (birthMultiplier Γ e.process.selected p q*specifiedLineWeight e L p-specifiedLineWeight e L p)-
              specifiedLineWeight e L p*protectedEntropyCost (birthMultiplier Γ e.process.selected p q)) := by
        congr 1
        nlinarith [hi]
      _ = _ := by ring

theorem protectedEntropy_generator {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (p : Grid n) (B : ℝ) (hB : 0<B)
    (he : e.process.Valid) (hs : e.process.stopped=false) (hp : (e.process.accounts p).status=.active)
    (hpL : p∈L.val) (hsp : specified Γ L) :
    protectedEntropySlope B (specifiedLineWeight e L p)*protectedLineContinuousDrift e Γ mask L p+
      protectedEntropyExternalRate e saved Γ mask positive L p B=
      protectedEntropySlope B (specifiedLineWeight e L p)*protectedLinePositiveDrift e mask L p-
        protectedEntropyPointCostRate e Γ mask L p := by
  rw [protectedEntropy_external_rate_identity e saved Γ mask positive L p B hB he hs hp]
  rw [←add_sub_assoc,←mul_add,protectedLedger_generator e saved Γ mask positive L p he hs hp hpL hsp]

theorem selected_protectedEntropy_hasDerivAt {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (p : Grid n)
    (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (hB : 0<cfg.B) (t : ℝ)
    (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x))
    (hc : 0<specifiedLineWeight (selectedTrajectory cfg (x,t)) L p) :
    HasDerivAt (fun u=>protectedEntropy cfg.B (specifiedLineWeight (selectedTrajectory cfg (x,u)) L p))
      (protectedEntropySlope cfg.B (specifiedLineWeight (selectedTrajectory cfg (x,t)) L p)*
        protectedLineContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p) t := by
  simpa only [Function.comp_def] using
    (protectedEntropy_hasDerivAt cfg.B (specifiedLineWeight (selectedTrajectory cfg (x,t)) L p) hB hc).comp t
      (selected_specifiedLineWeight_hasDerivAt cfg x he L p hs hsp hN t ht)

end NoThreeLine
#print axioms NoThreeLine.protectedEntropy_external_rate_identity
#print axioms NoThreeLine.protectedEntropy_generator
#print axioms NoThreeLine.selected_protectedEntropy_hasDerivAt
