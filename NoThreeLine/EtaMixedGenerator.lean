import NoThreeLine.EtaPairProduct
import NoThreeLine.AugmentedState

/-! The D-empty eta-corrected mixed observable on the actual augmented
state. The actual eta drift pays the actual mixed birth generator. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.EtaMixedGenerator
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct

def correctedPhi {n : ℕ} (Γ : Finset ZPoint) (C L : Finset (Grid n)) (a : AugmentedState n) : ℝ :=
  etaProduct L a.eta * phi Γ C a.physical

def augmentedBirthSnapshot {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint) (q : Grid n) : AugmentedState n :=
  ⟨birthSnapshot a.physical Γ q,a.eta⟩

theorem augmentedBirthSnapshot_eta {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint) (q : Grid n) :
    (augmentedBirthSnapshot a Γ q).eta=a.eta := rfl

def correctedContinuousDrift {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask : Grid n → ℝ) : ℝ :=
  correctedPhi Γ C L a *
    (phiGrowth a.physical.process Γ C mask a.physical.coordinates -
      pairRateSum L a.physical.process Γ mask a.physical.coordinates)

def correctedJumpGenerator {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask : Grid n → ℝ) : ℝ :=
  ∑ q : Grid n,phaseRate a.physical.process mask a.physical.coordinates.1 q *
    (correctedPhi Γ C L (augmentedBirthSnapshot a Γ q)-correctedPhi Γ C L a)

def correctedGenerator {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask : Grid n → ℝ) : ℝ :=
  correctedContinuousDrift a Γ C L mask + correctedJumpGenerator a Γ C L mask

theorem correctedPhi_flow_hasDerivAt {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask : Grid n → ℝ) (z : ℝ → Coordinates n)
    (η : ℝ → EtaCoordinates n) (t : ℝ)
    (hd : HasDerivAt z (vectorField e.process Γ mask (z t)) t)
    (hη : HasDerivAt η (etaRHS e.process Γ mask (z t) (η t)) t) :
    HasDerivAt (fun u=>correctedPhi Γ C L ⟨e.withCoordinates (z u),η u⟩)
      (correctedContinuousDrift ⟨e.withCoordinates (z t),η t⟩ Γ C L mask) t := by
  have hE := etaProduct_hasDerivAt L e.process Γ mask (z t) η t hη
  have hP := phi_flow_hasDerivAt e Γ C mask z t hd
  change HasDerivAt (fun u=>etaProduct L (η u)*phi Γ C (e.withCoordinates (z u)))
    ((etaProduct L (η t)*phi Γ C (e.withCoordinates (z t))) *
      (phiGrowth e.process Γ C mask (z t)-pairRateSum L e.process Γ mask (z t))) t
  exact (hE.mul hP).congr_deriv (by ring)

theorem correctedPhi_etaAlong_hasDerivAt {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask : Grid n → ℝ) (z : ℝ → Coordinates n)
    (hz : Continuous z) (η₀ : EtaCoordinates n) (t : ℝ)
    (hd : HasDerivAt z (vectorField e.process Γ mask (z t)) t) :
    HasDerivAt (fun u=>correctedPhi Γ C L
      ⟨e.withCoordinates (z u),etaAlong e.process Γ mask z η₀ u⟩)
      (correctedContinuousDrift
        ⟨e.withCoordinates (z t),etaAlong e.process Γ mask z η₀ t⟩ Γ C L mask) t :=
  correctedPhi_flow_hasDerivAt e Γ C L mask z _ t hd (etaAlong_hasDerivAt e.process Γ mask z hz η₀ t)

theorem correctedPhi_external_birth {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (q : Grid n) (hs : a.physical.process.Valid)
    (hstop : a.physical.process.stopped=false) (hq : q∈a.physical.process.activeEvents)
    (hC : C⊆a.physical.process.activeEvents) (hqC : q∉C) :
    correctedPhi Γ C L (augmentedBirthSnapshot a Γ q)=correctedPhi Γ C L a *
      ∏ K∈BirthLineGroups.rootGroups C q,BirthLineGroups.groupMultiplier Γ a.physical.process.selected C q K := by
  unfold correctedPhi augmentedBirthSnapshot
  rw [phi_external_birth a.physical Γ C q hs hstop hq hC hqC]
  ring

theorem correctedJumpGenerator_eq {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask : Grid n → ℝ) :
    correctedJumpGenerator a Γ C L mask=etaProduct L a.eta*phiJumpGenerator a.physical Γ C mask := by
  unfold correctedJumpGenerator phiJumpGenerator
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q _
  unfold correctedPhi augmentedBirthSnapshot
  ring

theorem correctedGenerator_eq {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask : Grid n → ℝ) :
    correctedGenerator a Γ C L mask=etaProduct L a.eta *
      (phiGenerator a.physical Γ C mask - phi Γ C a.physical *
        pairRateSum L a.physical.process Γ mask a.physical.coordinates) := by
  rw [correctedGenerator,correctedJumpGenerator_eq]
  unfold correctedContinuousDrift correctedPhi phiGenerator
  ring

theorem correctedGenerator_nonpos {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask : Grid n → ℝ) (B : ℝ) (ha : a.Valid B)
    (hstop : a.physical.process.stopped=false) (hC : C⊆a.physical.process.activeEvents)
    (hCL : C⊆L) (hm : ∀p,0≤mask p) : correctedGenerator a Γ C L mask≤0 := by
  rw [correctedGenerator_eq,pairRateSum_half]
  exact mul_nonpos_of_nonneg_of_nonpos (etaProduct_nonneg L a.eta (fun p q=>(ha.2 p q).1))
    (eta_corrected_phiGenerator_nonpos a.physical Γ C L mask B ha.1 hstop hC hCL hm)

theorem correctedPhi_nonneg {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (B : ℝ) (ha : a.Valid B) : 0≤correctedPhi Γ C L a :=
  mul_nonneg (etaProduct_nonneg L a.eta (fun p q=>(ha.2 p q).1)) (phi_nonneg a.physical Γ C B ha.1)

theorem correctedPhi_resolve_eta_factor {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (L : Finset (Grid n)) (B K ρ ε M : ℝ) :
    etaProduct L (a.resolve Γ B K ρ ε M).eta=etaProduct L a.eta := by
  rw [AugmentedState.resolve_eta]

end NoThreeLine.EtaMixedGenerator

#print axioms NoThreeLine.EtaMixedGenerator.correctedPhi_flow_hasDerivAt
#print axioms NoThreeLine.EtaMixedGenerator.correctedPhi_etaAlong_hasDerivAt
#print axioms NoThreeLine.EtaMixedGenerator.correctedGenerator_nonpos
