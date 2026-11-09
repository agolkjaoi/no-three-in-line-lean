import NoThreeLine.ScheduledCreditLossPrefix

/-! Crossing at any actual phase cut is controlled without a time union
bound. For a nonempty finite schedule the nonnegative cumulative loss has
its maximum at the terminal endpoint, so the crossing event is measurable
and has the same terminal tail bound. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def scheduledRootCreditLossCrossing {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (a : ℝ) :
    Set (BoardClockPath n) :=
  {ω | ∃ N < J, ∃ t ∈ Icc (0 : ℝ) (cs N).horizon,
    a ≤ scheduledRootCreditLossPrefix cs ε M deadline start hn hB Γ p N t ω}

theorem scheduledRootCreditLossCrossing_subset {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) (a : ℝ) :
    scheduledRootCreditLossCrossing cs ε M deadline start hn hB Γ p J a ⊆
      {ω | a ≤ scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω} := by
  rintro ω ⟨N,hN,t,ht,hω⟩
  exact hω.trans (scheduledRootCreditLossPrefix_le_full cs ε M deadline start hn hB Γ hΓ p N J hN t ht ω)

theorem scheduledRootCreditLossCrossing_eq_terminal_event {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) (hJ : 0 < J) (a : ℝ) :
    scheduledRootCreditLossCrossing cs ε M deadline start hn hB Γ p J a =
      {ω | a ≤ scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω} := by
  apply Set.Subset.antisymm (scheduledRootCreditLossCrossing_subset cs ε M deadline start hn hB Γ hΓ p J a)
  intro ω hω
  have hN : J-1 < J := by omega
  have hNJ : J-1+1 = J := by omega
  refine ⟨J-1,hN,(cs (J-1)).horizon,⟨(cs (J-1)).horizon.coe_nonneg,le_rfl⟩,?_⟩
  rw [scheduledRootCreditLossPrefix_horizon,hNJ]
  exact hω

theorem scheduledRootCreditLossCrossing_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) (a : ℝ) :
    MeasurableSet (scheduledRootCreditLossCrossing cs ε M deadline start hn hB Γ p J a) := by
  by_cases hJ : J = 0
  · subst J
    have he : scheduledRootCreditLossCrossing cs ε M deadline start hn hB Γ p 0 a = ∅ := by
      ext ω
      simp [scheduledRootCreditLossCrossing]
    rw [he]
    exact MeasurableSet.empty
  · rw [scheduledRootCreditLossCrossing_eq_terminal_event cs ε M deadline start hn hB Γ hΓ p J (Nat.pos_of_ne_zero hJ) a]
    exact measurableSet_le measurable_const
      (scheduledRootCreditLossPath_measurable cs ε M deadline start hn hB Γ hΓ p J)

theorem scheduledRootCreditLossCrossing_tail_le_mean {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) (a : ℝ) (ha : 0 < a) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      (scheduledRootCreditLossCrossing cs ε M deadline start hn hB Γ p J a) ≤
    (∫ ω, scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)/a := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  exact (measureReal_mono (μ := μ) (scheduledRootCreditLossCrossing_subset cs ε M deadline start hn hB Γ hΓ p J a)).trans
    (scheduledRootCreditLoss_tail_le_mean cs ε M deadline start hn hB Γ hΓ p J a ha)

theorem exists_uniform_rootCreditLoss_crossing_threshold (T δ ζ a κ : ℝ)
    (hδ : δ < 1) (hζ : 0 < ζ) (ha : 0 < a) (hκ : 0 < κ) :
    ∃ N : ℕ, 2 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀ j, (cs j).directions=Γ) → (∀ j, (cs j).K < 2) → phaseEndpoint cs 0 J ≤ T → B ≤ (n : ℝ)^δ →
        (phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J).real
          (scheduledRootCreditLossCrossing cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J (a*Real.log (n : ℝ))) < κ := by
  obtain ⟨N,hN,h⟩ := exists_uniform_rootCreditLoss_tail_threshold T δ ζ a κ hδ hζ ha hκ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  let μ := phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs _ M deadline start hn hB p J
  exact (measureReal_mono (μ := μ) (scheduledRootCreditLossCrossing_subset cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ hΓ
    p J (a*Real.log (n : ℝ)))).trans_lt (h n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledRootCreditLossCrossing_eq_terminal_event
#print axioms NoThreeLine.BirthWitness.scheduledRootCreditLossCrossing_measurableSet
#print axioms NoThreeLine.BirthWitness.exists_uniform_rootCreditLoss_crossing_threshold
