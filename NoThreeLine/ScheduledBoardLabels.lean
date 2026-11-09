import NoThreeLine.ScheduledBoardComparison
import NoThreeLine.ScheduledStarCoarseRow

/-! Coarse joint active/selected-label probabilities under the original
board law. Active labels are removed using the proved uniform physical
weight floor. The result applies whenever the active set is nonempty. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines MixedConnection

def activeSelectedIndicator {n : ℕ} (C D : Finset (Grid n)) (a : ExtendedState n) : ℝ := by
  classical
  exact if C⊆a.process.activeEvents ∧ D⊆a.process.selected then 1 else 0

theorem activeSelectedIndicator_measurable {n : ℕ} (C D : Finset (Grid n)) :
    Measurable (activeSelectedIndicator C D) := by
  classical
  unfold activeSelectedIndicator
  apply Measurable.ite
  · exact (((measurable_of_countable (fun S : Finset (Grid n)=>C⊆S)).comp
      ((activeEvents_measurable n).comp (ExtendedState.measurable_process n))).and
      ((measurable_of_countable (fun S : Finset (Grid n)=>D⊆S)).comp
        ((ProcessState.measurable_selected n).comp (ExtendedState.measurable_process n)))).setOf
  · exact measurable_const
  · exact measurable_const

theorem activeSelectedIndicator_bounds {n : ℕ} (C D : Finset (Grid n)) (a : ExtendedState n) :
    0≤activeSelectedIndicator C D a ∧ activeSelectedIndicator C D a≤1 := by
  unfold activeSelectedIndicator
  split_ifs <;> norm_num

theorem activeSelectedIndicator_le_physicalLeaf {n : ℕ} (C D : Finset (Grid n))
    (p : Grid n) (Γ : Finset ZPoint) (a : ExtendedState n) (B : ℝ) (ha : a.Valid B)
    (hf : a.process.ActiveWeightFloor Γ) :
    activeSelectedIndicator C D a ≤ ((2:ℝ)^Γ.card)^(C.erase p).card * physicalLeafProduct C D p a := by
  classical
  by_cases hh : C⊆a.process.activeEvents ∧ D⊆a.process.selected
  · simp only [activeSelectedIndicator, if_pos hh, physicalLeafProduct, if_pos hh.1,
      selectedLabelProduct_eq_indicator, if_pos hh.2, mul_one]
    calc
      1 = ∏_q∈C.erase p, ((2:ℝ)^Γ.card*(1/2:ℝ)^Γ.card) := by
        simp only [←mul_pow]
        norm_num
      _ ≤ ∏q∈C.erase p, ((2:ℝ)^Γ.card*(a.process.accounts q).weight) := by
        apply Finset.prod_le_prod
        · intro q _; positivity
        · intro q hq
          exact mul_le_mul_of_nonneg_left
            (a.process.activeWeightFloor_uniform Γ hf q ((a.process.mem_activeEvents q).mp
              (hh.1 (Finset.mem_of_mem_erase hq)))) (by positivity)
      _ = _ := by simp only [Finset.prod_mul_distrib, Finset.prod_const, rootWeightProduct]
  · rw [activeSelectedIndicator, if_neg hh]
    exact mul_nonneg (by positivity) (physicalLeafProduct_bounds C D p a B ha).1

theorem initial_scheduledCutBoard_activeSelected_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (hCDL : C∪D⊆L)
    (hΓ : ∀j,(cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫ω,activeSelectedIndicator C D
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
      ∂boardClockMeasure n (B/n)) ≤
      ((2:ℝ)^Γ.card)^C.card * ((δ^(C.card^3))⁻¹*
        ((∏q∈D,cutSelectedCoarsePrice cs start k t q)/(1-ε)^L.card.choose 2)) := by
  let W := fun ω : BoardClockPath n =>
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
  let ν := boardClockMeasure n (B/n)
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  letI := boardClockMeasure_probability n (B/n) (div_pos hB0 (by exact_mod_cast hn))
  have hW : Measurable W := (AugmentedState.measurable_physical n).comp
    ((WitnessState.measurable_augmented n).comp
      ((scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ k).comp
        (measurable_id.prodMk measurable_const)))
  have hv (ω) : (W ω).Valid B :=
    (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ k (ω,t)).1.1
  have hi : Integrable (fun ω=>activeSelectedIndicator C D (W ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      ((activeSelectedIndicator_measurable C D).comp hW) 1
      (fun ω=>activeSelectedIndicator_bounds C D (W ω))
  have hj := physicalLeafProduct_integrable ν W hW C D p B hv
  have hcomp : (∫ω,activeSelectedIndicator C D (W ω) ∂ν) ≤
      ((2:ℝ)^Γ.card)^(C.erase p).card * (∫ω,physicalLeafProduct C D p (W ω) ∂ν) := by
    rw [←integral_const_mul]
    exact integral_mono hi (hj.const_mul _) (fun ω=>activeSelectedIndicator_le_physicalLeaf
      C D p Γ (W ω) B (hv ω)
      (initial_scheduledCutWitness_activeWeightFloor cs ε M deadline start (unitBirthRetention n)
        hn hB Γ hΓ k (ω,t)))
  have hb := initial_scheduledCutBoard_physicalLeaf_coarse_product cs ε M deadline start K ρ δ
    p hn hB Γ C D L hp hCDL hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht
  have hpow : ((2:ℝ)^Γ.card)^(C.erase p).card * (2:ℝ)^Γ.card = ((2:ℝ)^Γ.card)^C.card := by
    rw [←pow_succ, Finset.card_erase_add_one hp]
  calc
    _ ≤ _ := hcomp
    _ ≤ ((2:ℝ)^Γ.card)^(C.erase p).card *
        ((2:ℝ)^Γ.card * ((δ^(C.card^3))⁻¹*
          ((∏q∈D,cutSelectedCoarsePrice cs start k t q)/(1-ε)^L.card.choose 2))) :=
      mul_le_mul_of_nonneg_left hb (by positivity)
    _ = _ := by rw [←mul_assoc, hpow]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.activeSelectedIndicator_le_physicalLeaf
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutBoard_activeSelected_coarse_product
