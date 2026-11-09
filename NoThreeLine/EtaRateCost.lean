import NoThreeLine.PairHistoryMoment
import NoThreeLine.AugmentedTimedState

/-! The actual selected-flow eta loss is paid by the actual pair-rate
integral. Discrete birth, resolution and stopping preserve eta exactly. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE PairWitness BirthWitness

def selectedPairRate {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (a b : Grid n) (t : ℝ) : ℝ :=
  pairRate x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,t)) a b

def selectedPairCost {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (a b : Grid n) (t : ℝ) : ℝ := ∫u in (0:ℝ)..t,selectedPairRate cfg x a b u

theorem selectedTrajectory_pairRate {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (t : ℝ) (a b : Grid n) :
    pairRate (selectedTrajectory cfg (x,t)).process cfg.directions cfg.mask
      (selectedTrajectory cfg (x,t)).coordinates a b=selectedPairRate cfg x a b t := by
  change pairRate (x.val.withCoordinates (selectedCurve cfg (x,t))).process cfg.directions cfg.mask
    (x.val.withCoordinates (selectedCurve cfg (x,t))).coordinates a b=_
  rw [ExtendedState.withCoordinates_coordinates]
  rfl

theorem selectedPairRate_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (a b : Grid n) : Continuous (selectedPairRate cfg x a b) := by
  have hz : Continuous (fun t=>selectedCurve cfg (x,t)) := by
    change Continuous (fun t=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,t))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  exact (pairRate_contDiff x.val.process cfg.directions cfg.mask a b).continuous.comp hz

theorem selectedPairRate_nonneg {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (a b : Grid n) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) : 0≤selectedPairRate cfg x a b t :=
  pairRate_nonneg x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,t)) cfg.mask_nonneg
    (fun q=>((selectedCurve_spec cfg x he.2.1).2.2.1 t ht).1.1 q |>.1) a b

theorem selectedPairCost_nonneg {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (a b : Grid n) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) : 0≤selectedPairCost cfg x a b t :=
  intervalIntegral.integral_nonneg ht.1 (fun u hu=>selectedPairRate_nonneg cfg x he a b u
    ⟨hu.1,hu.2.trans ht.2⟩)

theorem selectedEtaCurve_loss_le_cost {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (he : x.1.val.Valid cfg.B) (a b : Grid n) (hη : 0≤x.2 a b ∧ x.2 a b≤1)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x.1)) :
    x.2 a b-selectedEtaCurve cfg (x,t) a b≤selectedPairCost cfg x.1 a b t := by
  have hc := selectedPairCost_nonneg cfg x.1 he a b t ht
  have he0 : 0≤1-Real.exp (-selectedPairCost cfg x.1 a b t) :=
    sub_nonneg.mpr (Real.exp_le_one_iff.mpr (neg_nonpos.mpr hc))
  have hex := Real.add_one_le_exp (-selectedPairCost cfg x.1 a b t)
  rw [selectedEtaCurve_eq]
  change x.2 a b-x.2 a b*Real.exp (-selectedPairCost cfg x.1 a b t)≤_
  calc
    _ = x.2 a b*(1-Real.exp (-selectedPairCost cfg x.1 a b t)) := by ring
    _ ≤ 1-Real.exp (-selectedPairCost cfg x.1 a b t) := mul_le_of_le_one_left he0 hη.2
    _ ≤ _ := by linarith

theorem selectedEtaCurve_le_input {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (he : x.1.val.Valid cfg.B) (a b : Grid n) (hη : 0≤x.2 a b)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x.1)) :
    selectedEtaCurve cfg (x,t) a b≤x.2 a b := by
  rw [selectedEtaCurve_eq]
  exact etaAlong_le_initial _ _ _ _ _ _ ht.1 cfg.mask_nonneg
    (fun u hu q=>((selectedCurve_spec cfg x.1 he.2.1).2.2.1 u ⟨hu.1,hu.2.trans ht.2⟩).1.1 q |>.1)
    a b hη

theorem augRawOutcome_eta_eq_curve {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : CandidateData n) :
    (augRawOutcome cfg ε M (x,z)).eta=
      selectedEtaCurve cfg (x.1,augAdvance cfg ε M (x,z.1.1)) := by
  unfold augRawOutcome
  split_ifs <;> rfl

theorem augRawOutcome_eta_loss_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (z : CandidateData n)
    (a b : Grid n) (hη : 0≤x.1.2 a b ∧ x.1.2 a b≤1) :
    x.1.2 a b-(augRawOutcome cfg ε M (x,z)).eta a b≤
      selectedPairCost cfg x.1.1 a b (augAdvance cfg ε M (x,z.1.1)) := by
  rw [augRawOutcome_eta_eq_curve]
  have ht := augAdvance_mem cfg ε M x he z.1.1
  exact selectedEtaCurve_loss_le_cost cfg x.1 he a b hη _
    ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M x he).2⟩

def augTimedPairCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (s : AugTimedState cfg) (z : CandidateData n) : ℝ :=
  if s.val.2≤0 ∨ s.val.1.physical.process.stopped=true then 0 else
    selectedPairCost cfg (augTimedInput cfg s).1.1 a b
      (augAdvance cfg ε M (augTimedInput cfg s,z.1.1))

theorem augTimedPairCost_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (s : AugTimedState cfg) (z : CandidateData n) :
    0≤augTimedPairCost cfg ε M a b s z := by
  unfold augTimedPairCost
  split_ifs
  · exact le_rfl
  · have ht := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    exact selectedPairCost_nonneg cfg _ s.property.1.1 a b _
      ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M _ s.property.1.1).2⟩

theorem augTimedStep_eta_loss_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (s : AugTimedState cfg) (z : CandidateData n) :
    s.val.1.eta a b-(augTimedStep cfg ε M (s,z)).val.1.eta a b≤augTimedPairCost cfg ε M a b s z := by
  unfold augTimedPairCost augTimedStep augTimedStepPair
  split_ifs with hd
  · simp
  · rw [augOutcome_eta]
    have hh := augRawOutcome_eta_loss_le cfg ε M (augTimedInput cfg s) s.property.1.1 z a b (s.property.1.2 a b)
    rw [augRawOutcome_eta_eq_curve] at hh
    exact hh

theorem augTimedStep_eta_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (s : AugTimedState cfg) (z : CandidateData n) :
    (augTimedStep cfg ε M (s,z)).val.1.eta a b≤s.val.1.eta a b := by
  unfold augTimedStep augTimedStepPair
  split_ifs
  · exact le_rfl
  · rw [augOutcome_eta]
    have ht := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    exact selectedEtaCurve_le_input cfg _ s.property.1.1 a b (s.property.1.2 a b).1 _
      ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M _ s.property.1.1).2⟩

end NoThreeLine

#print axioms NoThreeLine.selectedTrajectory_pairRate
#print axioms NoThreeLine.augRawOutcome_eta_loss_le
#print axioms NoThreeLine.augTimedStep_eta_loss_le
#print axioms NoThreeLine.augTimedStep_eta_le
