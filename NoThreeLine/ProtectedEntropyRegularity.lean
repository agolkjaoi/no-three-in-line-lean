import NoThreeLine.ProtectedEntropyZeroFlow
import NoThreeLine.ProtectedEntropyMarkMean

/-! The actual killed-mark mean is continuous along the selected flow,
including zero credits and arbitrary time-dependent retirement flags. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def protectedEntropyExternalShape {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) (B : ℝ) : ℝ :=
  ∑q∈e.process.activeEvents,if q∈L.val then 0 else e.process.birthRate mask q*
    (protectedEntropy B (birthMultiplier Γ e.process.selected p q*protectedLineCredit L e saved p)-
      protectedEntropy B (protectedLineCredit L e saved p))

theorem protectedEntropyExternalRate_shape {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (p : Grid n) (B : ℝ) (he : e.process.Valid) (hs : e.process.stopped=false) :
    protectedEntropyExternalRate e saved Γ mask positive L p B=
      if (e.process.accounts p).status=.active then protectedEntropyExternalShape e saved Γ mask L p B else 0 := by
  by_cases hp : (e.process.accounts p).status=.active
  · rw [if_pos hp]
    unfold protectedEntropyExternalRate protectedEntropyExternalShape protectedLineEntropy
    apply Finset.sum_congr rfl
    intro q hq
    by_cases hqL : q∈L.val
    · simp only [if_pos hqL]
    · rw [if_neg hqL,if_neg hqL,protectedLineCredit_external_birth L e saved Γ q p (positive q)
        he hs hq ((e.process.mem_activeEvents p).mpr hp) hqL]
  · rw [if_neg hp]
    unfold protectedEntropyExternalRate protectedLineEntropy
    apply Finset.sum_eq_zero
    intro q _
    split_ifs
    · rfl
    · rw [protectedLineCredit_birth_inactive L e saved Γ q p (positive q) hp]
      ring

def protectedEntropyLedgerCostRate {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) : ℝ :=
  if (e.process.accounts p).status=.active then protectedEntropyPointCostRate e Γ mask L p else 0

theorem protectedEntropy_generator_all {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (p : Grid n) (B : ℝ) (hB : 0<B)
    (he : e.process.Valid) (hs : e.process.stopped=false) (hpL : p∈L.val) (hsp : specified Γ L) :
    protectedEntropySlope B (protectedLineCredit L e saved p)*protectedLedgerContinuousDrift e Γ mask L p+
      protectedEntropyExternalRate e saved Γ mask positive L p B=
      protectedEntropySlope B (protectedLineCredit L e saved p)*protectedLinePositiveDrift e mask L p-
        protectedEntropyLedgerCostRate e Γ mask L p := by
  by_cases hp : (e.process.accounts p).status=.active
  · rw [protectedLineCredit_active L e saved p hp,protectedLedgerContinuousDrift,if_pos hp,
      protectedEntropyLedgerCostRate,if_pos hp]
    exact protectedEntropy_generator e saved Γ mask positive L p B hB he hs hp hpL hsp
  · rw [protectedEntropyExternalRate_shape e saved Γ mask positive L p B he hs,if_neg hp]
    simp only [protectedLedgerContinuousDrift,protectedEntropyLedgerCostRate,if_neg hp,mul_zero,
      add_zero,protectedLinePositiveDrift,ProcessState.birthRate,hp,and_false,if_false,zero_mul,sub_zero]

theorem protectedEntropyCandidateMean_compensation_all {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (hn : 0<n) (hB : 0<B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hw : e.Valid B)
    (positive : Grid n→Grid n→Bool) (p : Grid n) (hs : e.process.stopped=false)
    (hpL : p∈L.val) (hsp : specified Γ L) :
    protectedEntropySlope B (protectedLineCredit L e saved p)*protectedLedgerContinuousDrift e Γ mask L p+
      lineIntensity e.process mask e.coordinates L*protectedLineEntropy L e saved B p+
      ((n:ℝ)*B)*(protectedEntropyCandidateMean L e saved Γ mask B positive p-protectedLineEntropy L e saved B p)=
      protectedEntropySlope B (protectedLineCredit L e saved p)*protectedLinePositiveDrift e mask L p-
        protectedEntropyLedgerCostRate e Γ mask L p := by
  rw [protectedEntropyCandidateMean_generator L e saved Γ mask B hn hB hm hw positive p]
  have h := protectedEntropy_generator_all e saved Γ mask positive L p B hB hw.1 hs hpL hsp
  linarith

theorem protectedEntropyExternalShape_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) (B : ℝ) :
    Continuous (fun z : Coordinates n=>protectedEntropyExternalShape (e.withCoordinates z) saved Γ mask L p B) := by
  change Continuous (fun z : Coordinates n=>∑q∈e.process.activeEvents,if q∈L.val then 0 else
    phaseRate e.process mask z.1 q*(protectedEntropy B (birthMultiplier Γ e.process.selected p q*
      protectedLineCredit L (e.withCoordinates z) saved p)-protectedEntropy B (protectedLineCredit L (e.withCoordinates z) saved p)))
  apply continuous_finsetSum
  intro q _
  split_ifs
  · exact continuous_const
  · have hc := protectedLineCredit_withCoordinates_continuous e L saved p
    have h1 := (protectedEntropy_continuous B).comp (hc.const_mul (birthMultiplier Γ e.process.selected p q))
    have h2 := (protectedEntropy_continuous B).comp hc
    have hr : Continuous (fun z : Coordinates n=>phaseRate e.process mask z.1 q) :=
      (phaseRate_contDiff e.process mask q).continuous
    exact hr.mul (h1.sub h2)

theorem selectedProtectedEntropyCandidateMean_continuousOn {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (p : Grid n)
    (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hs : x.val.process.stopped=false) (positive : ℝ→Grid n→Grid n→Bool) :
    ContinuousOn (fun t=>protectedEntropyCandidateMean L (selectedTrajectory cfg (x,t)) saved
      cfg.directions cfg.mask cfg.B (positive t) p) (Icc 0 (selectedGuardTime cfg x)) := by
  let C := fun t=>protectedLineEntropy L (selectedTrajectory cfg (x,t)) saved cfg.B p
  let G := fun t=>if (x.val.process.accounts p).status=.active then
    protectedEntropyExternalShape (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L p cfg.B else 0
  let Λ := fun t=>lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L
  have hc : Continuous C := selectedProtectedEntropy_continuous cfg x L saved cfg.B p
  have hg : Continuous G := by
    dsimp only [G]
    split_ifs
    · exact (protectedEntropyExternalShape_withCoordinates_continuous x.val saved cfg.directions cfg.mask L p cfg.B).comp
        (selectedLedgerCurve_continuous cfg x)
    · exact continuous_const
  have hl : Continuous Λ := (lineIntensity_contDiff x.val.process cfg.mask L).continuous.comp
    (selectedLedgerCurve_continuous cfg x)
  have hr : (n:ℝ)*cfg.B≠0 := (mul_pos (by exact_mod_cast hn) hB).ne'
  have hf : Continuous (fun t=>C t+(G t-Λ t*C t)/((n:ℝ)*cfg.B)) := by fun_prop
  apply hf.continuousOn.congr
  intro t ht
  have hcur := selectedTrajectory_valid cfg x he t ht
  have h := protectedEntropyCandidateMean_generator L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hcur (positive t) p
  rw [protectedEntropyExternalRate_shape _ saved cfg.directions cfg.mask (positive t) L p cfg.B hcur.1 hs] at h
  change ((n:ℝ)*cfg.B)*(protectedEntropyCandidateMean L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B (positive t) p-C t)=G t-Λ t*C t at h
  have hj : protectedEntropyCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B
      (positive t) p-C t=(G t-Λ t*C t)/((n:ℝ)*cfg.B) := by
    apply (eq_div_iff hr).mpr
    nlinarith only [h]
  linarith only [hj]

end NoThreeLine
#print axioms NoThreeLine.protectedEntropy_generator_all
#print axioms NoThreeLine.protectedEntropyCandidateMean_compensation_all
#print axioms NoThreeLine.selectedProtectedEntropyCandidateMean_continuousOn
