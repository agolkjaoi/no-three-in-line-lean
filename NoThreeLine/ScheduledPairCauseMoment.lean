import NoThreeLine.PairCauseProduct

/-! C1 for each fixed C2 cause/witness pattern under the actual scheduled
cut board law. Distinct witness labels are charged exactly once. The two
root weight-floor costs are fixed; physical cause weights are retained. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness MixedConnection FiniteWitnessMoments

def causePriceConstant (Γ : Finset ZPoint) (K δ : ℝ) (k d : ℕ) : ℝ :=
  ((2:ℝ)^Γ.card)^2 * (δ^((k+2)^3))⁻¹ * (2:ℝ)^((k+d+2).choose 2) *
    (starPriceMultiplier Γ K)^d

theorem initial_scheduledCutBoard_causeProduct_bound {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ : ℝ)
    (a b : Grid n) (Q D : Finset (Grid n)) (hab : a≠b) (ha : a∉Q) (hb : b∉Q)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀ j, (cs j).K≤K) (hρ : ∀ j, ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε≤1/2) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫ ω, causeProduct a b Q D
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
      ∂boardClockMeasure n (B/n)) ≤
      causePriceConstant Γ K δ Q.card D.card * ((phaseEndpoint cs start k-start+t)/n)^D.card := by
  let W := fun ω : BoardClockPath n =>
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
  let ν := boardClockMeasure n (B/n)
  let C := insert a (insert b Q)
  let U := C∪D
  have hW : Measurable W := (AugmentedState.measurable_physical n).comp
    ((WitnessState.measurable_augmented n).comp
      ((scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ k).comp
        (measurable_id.prodMk measurable_const)))
  have hv (ω) : (W ω).Valid B :=
    (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ k (ω,t)).1.1
  have hbound (ω) : 0≤causeProduct a b Q D (W ω) ∧
      causeProduct a b Q D (W ω)≤(max 1 B)^Q.card := by
    have hw : 0≤rootWeightProduct Q (W ω) := Finset.prod_nonneg (fun q _ => ((hv ω).2.1.1 q).1)
    refine ⟨causeProduct_nonneg a b Q D _ B (hv ω),?_⟩
    apply (mul_le_mul_of_nonneg_right (activeSelectedIndicator_bounds C D (W ω)).2 hw).trans
    simp only [one_mul]
    calc
      _ ≤ ∏ _q∈Q,max 1 B := Finset.prod_le_prod (fun q _ => ((hv ω).2.1.1 q).1)
        (fun q _ => ((hv ω).2.1.1 q).2.trans (le_max_right _ _))
      _ = _ := by simp
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  have hi : Integrable (fun ω => causeProduct a b Q D (W ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _ ((causeProduct_measurable a b Q D).comp hW)
      _ hbound
  have hj := physicalLeafProduct_integrable ν W hW C D a B hv
  have hcomp : (∫ ω,causeProduct a b Q D (W ω) ∂ν) ≤
      (2:ℝ)^Γ.card*(∫ ω,physicalLeafProduct C D a (W ω) ∂ν) := by
    rw [← integral_const_mul]
    exact integral_mono hi (hj.const_mul _) (fun ω => causeProduct_le_physicalLeaf a b Q D hab ha hb
      Γ (W ω) B (hv ω) (initial_scheduledCutWitness_activeWeightFloor cs ε M deadline start
        (unitBirthRetention n) hn hB Γ hΓ k (ω,t)))
  have hbase := initial_scheduledCutBoard_physicalLeaf_coarse_product cs ε M deadline start K ρ δ
    a hn hB Γ C D U (Finset.mem_insert_self _ _) (Finset.Subset.refl _)
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 (by linarith) k t ht
  have hC : C.card=Q.card+2 := by simp [C,ha,hb,hab]
  have hU : U.card≤Q.card+D.card+2 := by
    have hh := Finset.card_union_le C D
    change U.card≤C.card+D.card at hh
    omega
  have hp0 : 0≤∏q∈D,cutSelectedCoarsePrice cs start k t q :=
    Finset.prod_nonneg (fun q _ => cutSelectedCoarsePrice_nonneg cs start k t ht.1 q)
  have hp := cutSelectedCoarsePrice_prod_le_time cs Γ K start k t ht.1 hΓ hK hK2 D
  have hp2 : (2:ℝ)^(U.card.choose 2) ≤ 2^((Q.card+D.card+2).choose 2) :=
    pow_le_pow_right₀ (by norm_num) (Nat.choose_le_choose 2 hU)
  have hr := (div_eta_pow_le_half _ ε hp0 hε (U.card.choose 2)).trans
    (mul_le_mul hp hp2 (by positivity) (hp0.trans hp))
  apply hcomp.trans
  apply (mul_le_mul_of_nonneg_left hbase (by positivity : 0≤(2:ℝ)^Γ.card)).trans
  rw [hC]
  calc
    _ ≤ (2:ℝ)^Γ.card*((2:ℝ)^Γ.card*((δ^((Q.card+2)^3))⁻¹*
        ((((phaseEndpoint cs start k-start+t)/n)*starPriceMultiplier Γ K)^D.card*
          (2:ℝ)^((Q.card+D.card+2).choose 2)))) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_left hr (by positivity)) (by positivity)) (by positivity)
    _ = _ := by unfold causePriceConstant; rw [mul_pow]; ring

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.initial_scheduledCutBoard_causeProduct_bound
