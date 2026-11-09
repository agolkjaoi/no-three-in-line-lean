import NoThreeLine.ScheduledPairCauseMoment

/-! Every fixed repeated C2 cause pattern has an actual board-law bound.
Selected prices use the distinct set D. Repeated causes contribute exactly
B^(m-|image f|), or its coarse B^(m-1) upper bound for positive degree. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness MixedConnection FiniteWitnessMoments

theorem causeProduct_integrable {Ω : Type*} [MeasurableSpace Ω] {n : ℕ}
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω → ExtendedState n) (hW : Measurable W)
    (a b : Grid n) (Q D : Finset (Grid n)) (B : ℝ) (hv : ∀ω,(W ω).Valid B) :
    Integrable (fun ω => causeProduct a b Q D (W ω)) μ := by
  apply GenericCreditIteration.bounded_nonnegative_integrable μ _
    ((causeProduct_measurable a b Q D).comp hW) ((max 1 B)^Q.card)
  intro ω
  have hw : 0≤rootWeightProduct Q (W ω) := Finset.prod_nonneg (fun q _ => ((hv ω).2.1.1 q).1)
  refine ⟨causeProduct_nonneg a b Q D _ B (hv ω),?_⟩
  apply (mul_le_mul_of_nonneg_right (activeSelectedIndicator_bounds _ D (W ω)).2 hw).trans
  simp only [one_mul]
  calc
    _ ≤ ∏ _q∈Q,max 1 B := Finset.prod_le_prod (fun q _ => ((hv ω).2.1.1 q).1)
      (fun q _ => ((hv ω).2.1.1 q).2.trans (le_max_right _ _))
    _ = _ := by simp

theorem causeTupleProduct_integrable {Ω : Type*} [MeasurableSpace Ω] {n m : ℕ}
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω → ExtendedState n) (hW : Measurable W)
    (a b : Grid n) (f : Fin m → Grid n) (D : Finset (Grid n)) (B : ℝ) (hv : ∀ω,(W ω).Valid B) :
    Integrable (fun ω => causeTupleProduct a b f D (W ω)) μ := by
  have hmeas : Measurable (causeTupleProduct a b f D) :=
    (activeSelectedIndicator_measurable _ D).mul
      (Finset.measurable_prod _ (fun i _ => CreditAccount.measurable_weight.comp
        ((ProcessState.measurable_account n (f i)).comp (ExtendedState.measurable_process n))))
  apply GenericCreditIteration.bounded_nonnegative_integrable μ _ (hmeas.comp hW) ((max 1 B)^m)
  intro ω
  have hw : 0≤∏i : Fin m,((W ω).process.accounts (f i)).weight := by
    exact Finset.prod_nonneg (fun i _ => ((hv ω).2.1.1 (f i)).1)
  constructor
  · exact mul_nonneg (activeSelectedIndicator_bounds _ D (W ω)).1 hw
  · apply (mul_le_mul_of_nonneg_right (activeSelectedIndicator_bounds _ D (W ω)).2 hw).trans
    simp only [one_mul]
    calc
      _ ≤ ∏ _i : Fin m,max 1 B := Finset.prod_le_prod (fun i _ => ((hv ω).2.1.1 (f i)).1)
        (fun i _ => ((hv ω).2.1.1 (f i)).2.trans (le_max_right _ _))
      _ = _ := by simp

theorem initial_scheduledCutBoard_causeTuple_bound {n m : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ : ℝ)
    (a b : Grid n) (f : Fin m → Grid n) (D : Finset (Grid n)) (hab : a≠b)
    (ha : a∉tupleLabels f) (hb : b∉tupleLabels f) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀ j, (cs j).K≤K) (hρ : ∀ j, ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε≤1/2) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫ ω, causeTupleProduct a b f D
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
      ∂boardClockMeasure n (B/n)) ≤
      B^(m-(tupleLabels f).card)*causePriceConstant Γ K δ (tupleLabels f).card D.card *
        ((phaseEndpoint cs start k-start+t)/n)^D.card := by
  let W := fun ω : BoardClockPath n =>
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
  let ν := boardClockMeasure n (B/n)
  have hW : Measurable W := (AugmentedState.measurable_physical n).comp
    ((WitnessState.measurable_augmented n).comp
      ((scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ k).comp
        (measurable_id.prodMk measurable_const)))
  have hv (ω) : (W ω).Valid B :=
    (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ k (ω,t)).1.1
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  have hi := causeTupleProduct_integrable ν W hW a b f D B hv
  have hj := causeProduct_integrable ν W hW a b (tupleLabels f) D B hv
  have hh : (∫ω,causeTupleProduct a b f D (W ω) ∂ν) ≤
      B^(m-(tupleLabels f).card)*(∫ω,causeProduct a b (tupleLabels f) D (W ω) ∂ν) := by
    rw [← integral_const_mul]
    exact integral_mono hi (hj.const_mul _) (fun ω => causeTupleProduct_repeat a b f D (W ω) B
      (zero_lt_one.trans_le hB) (hv ω))
  apply hh.trans
  have hbase := initial_scheduledCutBoard_causeProduct_bound cs ε M deadline start K ρ δ a b
    (tupleLabels f) D hab ha hb hn hB Γ hΓ hK0 hK2 hK hρ hρ1
    hδ hδ1 hδρ hδK hε0 hε k t ht
  simpa only [mul_assoc] using mul_le_mul_of_nonneg_left hbase
    (pow_nonneg (zero_le_one.trans hB) (m-(tupleLabels f).card))

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.initial_scheduledCutBoard_causeTuple_bound
