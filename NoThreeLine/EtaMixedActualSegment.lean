import NoThreeLine.EtaMixedGenerator
import NoThreeLine.AugmentedCappedSegment

/-! Instantiate the eta-corrected mixed observable on the actual selected
augmented flow and its capped pre-state and postgeometry birth snapshot. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators

namespace NoThreeLine.EtaMixedGenerator
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct

def selectedAugmentedCurve {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg) (t : ℝ) : AugmentedState n :=
  ⟨selectedTrajectory cfg (x.1,t),selectedEtaCurve cfg (x,t)⟩

theorem selectedAugmentedCurve_valid {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (he : x.1.val.Valid cfg.B) (hη : ∀a b,0≤x.2 a b ∧ x.2 a b≤1)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x.1)) :
    (selectedAugmentedCurve cfg x t).Valid cfg.B :=
  ⟨selectedTrajectory_valid cfg x.1 he t ht,
    selectedEtaCurve_bounds cfg x he hη t ht⟩

theorem selectedCorrectedPhi_hasDerivAt {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (C L : Finset (Grid n)) (he : x.1.val.Valid cfg.B)
    (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x.1)) :
    HasDerivAt (fun u=>correctedPhi cfg.directions C L (selectedAugmentedCurve cfg x u))
      (correctedContinuousDrift (selectedAugmentedCurve cfg x t) cfg.directions C L cfg.mask) t := by
  have hd := ((selectedCurve_spec cfg x.1 he.2.1).2.2.1 t ⟨ht.1.le,ht.2.le⟩).2.2.hasDerivAt
    (Icc_mem_nhds ht.1 ht.2)
  exact correctedPhi_flow_hasDerivAt x.1.val cfg.directions C L cfg.mask
    (fun u=>selectedCurve cfg (x.1,u)) (fun u=>selectedEtaCurve cfg (x,u)) t hd
      (selectedEtaCurve_hasDerivAt cfg x t)

theorem selectedCorrectedGenerator_nonpos {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (C L : Finset (Grid n)) (he : x.1.val.Valid cfg.B)
    (hη : ∀a b,0≤x.2 a b ∧ x.2 a b≤1) (hstop : x.1.val.process.stopped=false)
    (hC : C⊆x.1.val.process.activeEvents) (hCL : C⊆L)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x.1)) :
    correctedGenerator (selectedAugmentedCurve cfg x t) cfg.directions C L cfg.mask≤0 :=
  correctedGenerator_nonpos _ _ _ _ _ cfg.B (selectedAugmentedCurve_valid cfg x he hη t ht)
    hstop hC hCL cfg.mask_nonneg

theorem augPreState_selectedAugmentedCurve {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ × Grid n) × ℝ) :
    augPreState cfg ε M (x,z)=selectedAugmentedCurve cfg x.1 (augAdvance cfg ε M (x,z.1.1)) := rfl

theorem augPreState_correctedGenerator_nonpos {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ × Grid n) × ℝ) (C L : Finset (Grid n))
    (he : x.1.1.val.Valid cfg.B) (hη : ∀a b,0≤x.1.2 a b ∧ x.1.2 a b≤1)
    (hstop : x.1.1.val.process.stopped=false) (hC : C⊆x.1.1.val.process.activeEvents) (hCL : C⊆L) :
    correctedGenerator (augPreState cfg ε M (x,z)) cfg.directions C L cfg.mask≤0 := by
  rw [augPreState_selectedAugmentedCurve]
  have ht := augAdvance_mem cfg ε M x he z.1.1
  exact selectedCorrectedGenerator_nonpos cfg x.1 C L he hη hstop hC hCL _
    ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M x he).2⟩

theorem augRawOutcome_accepted_snapshot {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ × Grid n) × ℝ)
    (hwindow : 0<z.1.1 ∧ z.1.1≤augGuardTime cfg ε M x)
    (haccept : z.2≤(augPreState cfg ε M (x,z)).physical.process.acceptance cfg.mask cfg.B z.1.2) :
    augRawOutcome cfg ε M (x,z)=augmentedBirthSnapshot (augPreState cfg ε M (x,z)) cfg.directions z.1.2 := by
  rw [augRawOutcome,if_pos hwindow,ExtendedState.candidateUpdate_eq,if_pos haccept]
  rfl

theorem augRawOutcome_rejected_snapshot {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ × Grid n) × ℝ)
    (hreject : ¬z.2≤(augPreState cfg ε M (x,z)).physical.process.acceptance cfg.mask cfg.B z.1.2) :
    augRawOutcome cfg ε M (x,z)=augPreState cfg ε M (x,z) := by
  unfold augRawOutcome
  split_ifs
  · rw [ExtendedState.candidateUpdate_eq,if_neg hreject]
  · rfl

theorem augRawOutcome_etaProduct {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ × Grid n) × ℝ) (L : Finset (Grid n)) :
    etaProduct L (augRawOutcome cfg ε M (x,z)).eta=etaProduct L (augPreState cfg ε M (x,z)).eta := by
  unfold augRawOutcome
  split_ifs <;> rfl

theorem augOutcome_etaProduct {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ × Grid n) × ℝ) (L : Finset (Grid n)) :
    etaProduct L (augOutcome cfg ε M (x,z)).eta=etaProduct L (augPreState cfg ε M (x,z)).eta := by
  rw [augOutcome,AugmentedState.resolve_eta,augRawOutcome_etaProduct]

theorem augOutcome_etaProduct_floor {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ × Grid n) × ℝ) (L : Finset (Grid n))
    (he : x.1.1.val.Valid cfg.B) (hε : ε≤1)
    (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤x.1.2 a b) :
    (1-ε)^(L.card.choose 2)≤etaProduct L (augOutcome cfg ε M (x,z)).eta := by
  apply etaProduct_floor L _ ε hε
  intro a ha b hb hab
  exact augOutcome_eta_lower cfg ε M x he a b hab (hinit a ha b hb hab) z

theorem augOutcome_etaProduct_pos {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ × Grid n) × ℝ) (L : Finset (Grid n))
    (he : x.1.1.val.Valid cfg.B) (hε : ε<1)
    (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤x.1.2 a b) :
    0<etaProduct L (augOutcome cfg ε M (x,z)).eta :=
  (pow_pos (sub_pos.mpr hε) _).trans_le (augOutcome_etaProduct_floor cfg ε M x z L he hε.le hinit)

end NoThreeLine.EtaMixedGenerator

#print axioms NoThreeLine.EtaMixedGenerator.selectedCorrectedPhi_hasDerivAt
#print axioms NoThreeLine.EtaMixedGenerator.augPreState_correctedGenerator_nonpos
#print axioms NoThreeLine.EtaMixedGenerator.augRawOutcome_accepted_snapshot
#print axioms NoThreeLine.EtaMixedGenerator.augOutcome_etaProduct_floor
