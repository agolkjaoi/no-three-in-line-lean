import NoThreeLine.ScheduledWeightFloor
import NoThreeLine.ScheduledCutPhysicalCoarse

/-! Recover the original board law from the actual cut point law for an
observable supported on an active root. Its only cost is 2^|Gamma|, derived
from actual pathwise weight floors rather than an extra density assumption. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem initial_scheduledCut_board_integral_le_point {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (p : Grid n) (k : ℕ) (t : ℝ) (f : BoardClockPath n → ℝ) (hf : Measurable f)
    (A : ℝ) (hb : ∀ω,0≤f ω ∧ f ω≤A)
    (hs : ∀ω, ((scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical.process.accounts p).status≠.active →
      f ω=0) :
    (∫ω,f ω ∂boardClockMeasure n (B/n)) ≤
      (2:ℝ)^Γ.card * ∫ω,f ω ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t := by
  let s := initialGoodPhaseObservation B hB deadline start
  let Z := fun ω : BoardClockPath n => scheduledCutCredit cs ε M deadline start hn s p k (ω,t)
  let W := fun ω : BoardClockPath n =>
    scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn s k (ω,t)
  let ν := boardClockMeasure n (B/n)
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  letI := boardClockMeasure_probability n (B/n) (div_pos hB0 (by exact_mod_cast hn))
  have hZ : Measurable Z := (scheduledCutCredit_measurable cs ε M deadline start hn s p k).comp
    (measurable_id.prodMk measurable_const)
  have hbZ (ω) : 0≤Z ω ∧ Z ω≤B := scheduledCutCredit_bounds cs ε M deadline start hn s p k (ω,t)
  have hi : Integrable f ν := GenericCreditIteration.bounded_nonnegative_integrable ν f hf A hb
  have hiZ : Integrable (fun ω=>Z ω*f ω) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _ (hZ.mul hf) (B*A)
      (fun ω=>⟨mul_nonneg (hbZ ω).1 (hb ω).1,
        mul_le_mul (hbZ ω).2 (hb ω).2 (hb ω).1 hB0.le⟩)
  have hpwise (ω) : f ω≤(2:ℝ)^Γ.card*(Z ω*f ω) := by
    by_cases ha : ((W ω).augmented.physical.process.accounts p).status=.active
    · have hfloor := initial_scheduledCutWitness_active_weight_lower cs ε M deadline start
        (unitBirthRetention n) hn hB Γ hΓ k (ω,t) p ha
      have hz : Z ω=((W ω).augmented.physical.process.accounts p).weight := by
        change ((W ω).augmented.physical.process.accounts p).credit = _
        simp only [CreditAccount.credit, ha, true_or, if_true]
      have h1 : 1≤(2:ℝ)^Γ.card*Z ω := by
        rw [hz]
        calc
          1 = (2:ℝ)^Γ.card*(1/2:ℝ)^Γ.card := by rw [←mul_pow]; norm_num
          _ ≤ _ := mul_le_mul_of_nonneg_left hfloor (by positivity)
      simpa only [one_mul, mul_assoc] using mul_le_mul_of_nonneg_right h1 (hb ω).1
    · rw [hs ω ha, mul_zero, mul_zero]
  change (∫ω,f ω ∂ν)≤(2:ℝ)^Γ.card*(∫ω,f ω ∂savedCreditMeasure ν Z)
  rw [savedCreditMeasure_integral ν Z hZ (fun ω=>(hbZ ω).1) f, ←integral_const_mul]
  exact integral_mono hi (hiZ.const_mul _) hpwise

theorem initial_scheduledCutBoard_physicalLeaf_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (hCDL : C∪D⊆L)
    (hΓ : ∀j,(cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫ω,physicalLeafProduct C D p
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
      ∂boardClockMeasure n (B/n)) ≤
      (2:ℝ)^Γ.card * ((δ^(C.card^3))⁻¹*
        ((∏q∈D,cutSelectedCoarsePrice cs start k t q)/(1-ε)^L.card.choose 2)) := by
  let W := fun ω : BoardClockPath n =>
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
  have hW : Measurable W := (AugmentedState.measurable_physical n).comp
    ((WitnessState.measurable_augmented n).comp
      ((scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ k).comp
        (measurable_id.prodMk measurable_const)))
  have hb (ω) := physicalLeafProduct_bounds C D p (W ω) B
    (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ k (ω,t)).1.1
  have hcomp := initial_scheduledCut_board_integral_le_point cs ε M deadline start hn hB Γ hΓ
    p k t (fun ω=>physicalLeafProduct C D p (W ω)) ((physicalLeafProduct_measurable C D p).comp hW)
    ((max 1 B)^(C.erase p).card) hb (by
      intro ω ha
      have hnot : ¬C⊆(W ω).process.activeEvents := fun hC=>
        ha ((ProcessState.mem_activeEvents _ p).mp (hC hp))
      exact if_neg hnot)
  exact hcomp.trans (mul_le_mul_of_nonneg_left
    (initial_scheduledCutPoint_physicalLeaf_coarse_product cs ε M deadline start K ρ δ p hn hB Γ
      C D L hp hCDL hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht) (by positivity))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCut_board_integral_le_point
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutBoard_physicalLeaf_coarse_product
