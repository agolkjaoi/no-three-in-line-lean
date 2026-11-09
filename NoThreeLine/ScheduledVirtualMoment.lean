import NoThreeLine.VirtualFixedIntegral
import NoThreeLine.ScheduledVirtualAnchor

/-! Finite-degree virtual-mass moments at deterministic scheduled cuts,
under the original board law. Distinct witness prices are paid a times;
only repeated physical leaves pay B. No maximum or hitting time is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness

attribute [local irreducible] scheduledCutWitness

theorem initial_scheduledCutBoard_virtual_finite_bound {n m : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ : ℝ)
    (q : Grid n) (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (L : LineIndex n) (hqL : q ∉ L.val) (hm : 0 < m)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK0 : 0 ≤ K) (hK2 : K < 2)
    (hK : ∀ j, (cs j).K ≤ K) (hρ : ∀ j, ρ ≤ (cs j).rho) (hρ1 : ρ ≤ 1)
    (hδ : 0 < δ) (hδ1 : δ ≤ 1) (hδρ : δ ≤ ρ) (hδK : δ ≤ (2-K)/2)
    (hε0 : 0 ≤ ε) (hε : ε ≤ 1/2) (k : ℕ) (t : ℝ) (ht : t ∈ Icc (0:ℝ) (cs k).horizon) :
    (∫ ω, let e := (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
      virtualMass e.process Γ e.coordinates L q ^ m
      ∂boardClockMeasure n (B/n)) ≤
      2^m * ∑ a ∈ Finset.Icc 1 m, B^(m-a) * (a : ℝ)^m *
        (((candidates L q).card : ℝ)^a *
          (physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start k-start+t)/n)^a)) := by
  let W := fun ω : BoardClockPath n =>
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
  let ν := boardClockMeasure n (B/n)
  have hB0 : 0 < B := lt_of_lt_of_le zero_lt_one hB
  letI := boardClockMeasure_probability n (B/n) (div_pos hB0 (by exact_mod_cast hn))
  have hW : Measurable W := (AugmentedState.measurable_physical n).comp
    ((WitnessState.measurable_augmented n).comp
      ((scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ k).comp
        (measurable_id.prodMk measurable_const)))
  have hv (ω) : (W ω).Valid B :=
    (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ k (ω,t)).1.1
  have hτ := scheduled_elapsed_nonneg cs start k t ht.1
  have hsum (a : ℕ) : (∑ g ∈ anchors L q a, ∫ ω, anchorProduct g (W ω) ∂ν) ≤
      ((candidates L q).card : ℝ)^a *
        (physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start k-start+t)/n)^a) := by
    have hcost : 0 ≤ physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start k-start+t)/n)^a :=
      mul_nonneg (physicalBoardConstant_pos Γ K δ hδ a).le
        (pow_nonneg (div_nonneg hτ (Nat.cast_nonneg _)) _)
    calc
      _ ≤ ∑ _g ∈ anchors L q a,
          physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start k-start+t)/n)^a :=
        Finset.sum_le_sum (fun g hg => initial_scheduledCutBoard_anchor_time_bound
          cs ε M deadline start K ρ δ q hn hB Γ L hqL g hg hΓ hK0 hK2 hK hρ hρ1
          hδ hδ1 hδρ hδK hε0 hε k t ht)
      _ = ((anchors L q a).card : ℝ) *
          (physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start k-start+t)/n)^a) := by simp
      _ ≤ _ := mul_le_mul_of_nonneg_right
        (by exact_mod_cast (show (anchors L q a).card ≤ (candidates L q).card^a by
          simpa using Finset.card_le_univ (anchors L q a))) hcost
  apply (virtualMass_pow_integral_le ν W hW Γ L q B hB0 hm hv).trans
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  exact Finset.sum_le_sum (fun a _ => mul_le_mul_of_nonneg_left (hsum a)
    (mul_nonneg (pow_nonneg hB0.le _) (by positivity)))

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.initial_scheduledCutBoard_virtual_finite_bound
