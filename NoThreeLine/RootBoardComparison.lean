import NoThreeLine.RootPhaseWeightFloor

/-! The same dimension-free density comparison holds on the actual saved
root snapshot. This is a measure comparison on active-snapshot support,
not a proof that a particular stopping event lies in that support. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem initial_rootPhase_board_integral_le_point {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (p : Grid n) (k : ℕ) (e : Retention n) (f : BoardClockPath n → ℝ) (hf : Measurable f)
    (A : ℝ) (hb : ∀ω,0≤f ω ∧ f ω≤A)
    (hs : ∀ω, ((initialRootPhaseWitness cs ε M deadline start p hn hB e k ω).augmented.physical.process.accounts p).status≠.active →
      f ω=0) :
    (∫ω,f ω ∂boardClockMeasure n (B/n)) ≤
      (2:ℝ)^Γ.card * ∫ω,f ω ∂phasePointMeasure cs ε M deadline start hn hB p k := by
  let Z := phasePointCredit cs ε M deadline start hn hB p k
  let W := initialRootPhaseWitness cs ε M deadline start p hn hB e k
  let ν := boardClockMeasure n (B/n)
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  letI := boardClockMeasure_probability n (B/n) (div_pos hB0 (by exact_mod_cast hn))
  have hZ : Measurable Z := phasePointCredit_measurable cs ε M deadline start hn hB p k
  have hbZ (ω) : 0≤Z ω ∧ Z ω≤B := phasePointCredit_bounds cs ε M deadline start hn hB p k ω
  have hi : Integrable f ν := GenericCreditIteration.bounded_nonnegative_integrable ν f hf A hb
  have hiZ : Integrable (fun ω=>Z ω*f ω) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _ (hZ.mul hf) (B*A)
      (fun ω=>⟨mul_nonneg (hbZ ω).1 (hb ω).1,
        mul_le_mul (hbZ ω).2 (hb ω).2 (hb ω).1 hB0.le⟩)
  have hpwise (ω) : f ω≤(2:ℝ)^Γ.card*(Z ω*f ω) := by
    by_cases ha : ((W ω).augmented.physical.process.accounts p).status=.active
    · have hfloor := initialRootPhaseWitness_active_weight_lower cs ε M deadline start p hn hB e
        Γ hΓ k ω p ha
      have hz : Z ω=((W ω).augmented.physical.process.accounts p).weight := by
        have he := initial_rootPhaseWitness_credit cs ε M deadline start p hn hB e k ω
        change ((W ω).augmented.physical.process.accounts p).credit=Z ω at he
        rw [←he]
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

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_rootPhase_board_integral_le_point
