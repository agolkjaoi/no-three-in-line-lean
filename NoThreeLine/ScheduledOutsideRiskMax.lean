import NoThreeLine.ScheduledOutsideRiskPrefix
import NoThreeLine.ScheduledOutsideRiskErrorTail
import NoThreeLine.ScheduledCreditLossMax

/-! All actual phase-cut error crossings are measurable without assuming
measurability of an uncountable supremum. Nonnegative error increments
identify the event with the terminal event (nonempty schedule); the actual
prefix domination also sends each crossing to a line-credit-loss crossing. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def scheduledOutsideRiskErrorCrossing {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (a : ℝ) :
    Set (BoardClockPath n) :=
  {ω | ∃ N < J, ∃ t ∈ Icc (0:ℝ) (cs N).horizon,
    a ≤ scheduledOutsideRiskPrefix cs ε M deadline start hn hB Γ p N t ω -
      scheduledOutsideProxyPrefix cs ε M deadline start hn hB Γ p N t ω}

theorem scheduledOutsideRiskErrorCrossing_subset_terminal {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (a : ℝ) :
    scheduledOutsideRiskErrorCrossing cs ε M deadline start hn hB Γ p J a ⊆
      {ω | a ≤ scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
        scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω} := by
  rintro ω ⟨N,hN,t,ht,hω⟩
  exact hω.trans (scheduledOutsideErrorPrefix_le_full cs ε M deadline start hn hB Γ p N J hN t ht ω)

theorem scheduledOutsideRiskErrorCrossing_eq_terminal {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (hJ : 0 < J) (a : ℝ) :
    scheduledOutsideRiskErrorCrossing cs ε M deadline start hn hB Γ p J a =
      {ω | a ≤ scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
        scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω} := by
  apply Set.Subset.antisymm (scheduledOutsideRiskErrorCrossing_subset_terminal cs ε M deadline start hn hB Γ p J a)
  intro ω hω
  have hN : J-1 < J := by omega
  have hNJ : J-1+1 = J := by omega
  refine ⟨J-1,hN,(cs (J-1)).horizon,⟨(cs (J-1)).horizon.coe_nonneg,le_rfl⟩,?_⟩
  rw [(scheduledOutsidePrefixes_horizon cs ε M deadline start hn hB Γ p (J-1) ω).1,
    (scheduledOutsidePrefixes_horizon cs ε M deadline start hn hB Γ p (J-1) ω).2,hNJ]
  exact hω

theorem scheduledOutsideRiskErrorCrossing_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (a : ℝ) :
    MeasurableSet (scheduledOutsideRiskErrorCrossing cs ε M deadline start hn hB Γ p J a) := by
  by_cases hJ : J = 0
  · subst J
    have he : scheduledOutsideRiskErrorCrossing cs ε M deadline start hn hB Γ p 0 a = ∅ := by
      ext ω
      simp [scheduledOutsideRiskErrorCrossing]
    rw [he]
    exact MeasurableSet.empty
  · rw [scheduledOutsideRiskErrorCrossing_eq_terminal cs ε M deadline start hn hB Γ p J (Nat.pos_of_ne_zero hJ) a]
    exact scheduledOutsideRiskError_measurableSet cs ε M deadline start hn hB Γ p J a

theorem scheduledOutsideRiskErrorCrossing_subset_creditLoss {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (p : Grid n) (J : ℕ) (a : ℝ) :
    scheduledOutsideRiskErrorCrossing cs ε M deadline start hn hB Γ p J a ⊆
      scheduledRootCreditLossCrossing cs ε M deadline start hn hB Γ p J (ρ*a) := by
  rintro ω ⟨N,hN,t,ht,hω⟩
  refine ⟨N,hN,t,ht,?_⟩
  have hh := (le_div_iff₀ hρ).mp (hω.trans
    (scheduledOutsideRiskPrefix_proxy_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p N t ht ω).2)
  simpa only [mul_comm] using hh

theorem scheduledOutsideRiskErrorCrossing_measure_le {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (p : Grid n) (J : ℕ) (a : ℝ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    μ.real (scheduledOutsideRiskErrorCrossing cs ε M deadline start hn hB Γ p J a) ≤
      μ.real (scheduledRootCreditLossCrossing cs ε M deadline start hn hB Γ p J (ρ*a)) :=
  measureReal_mono (μ := μ)
    (scheduledOutsideRiskErrorCrossing_subset_creditLoss cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p J a)

theorem exists_uniform_outsideRiskError_crossing_threshold (T δ ζ ρ a κ : ℝ)
    (hδ : δ < 1) (hζ : 0 < ζ) (hρ : 0 < ρ) (ha : 0 < a) (hκ : 0 < κ) :
    ∃ N : ℕ, 2 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀ j, (cs j).directions=Γ) → (∀ j, (cs j).K < 2) → (∀ j, ρ ≤ (cs j).rho) →
        phaseEndpoint cs 0 J ≤ T → B ≤ (n : ℝ)^δ →
        (phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J).real
          (scheduledOutsideRiskErrorCrossing cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J (a*Real.log (n : ℝ))) < κ := by
  obtain ⟨N,hN,h⟩ := exists_uniform_rootCreditLoss_crossing_threshold T δ ζ (ρ*a) κ hδ hζ (mul_pos hρ ha) hκ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hρcfg hT hBn
  let μ := phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs _ M deadline start hn hB p J
  apply (scheduledOutsideRiskErrorCrossing_measure_le cs ((n : ℝ)^(-ζ)) M deadline start ρ
    hn hB hρ Γ hΓ hK hρcfg p J (a*Real.log (n : ℝ)) μ).trans_lt
  simpa only [mul_assoc] using h n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskErrorCrossing_eq_terminal
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskErrorCrossing_measurableSet
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskErrorCrossing_subset_creditLoss
#print axioms NoThreeLine.BirthWitness.exists_uniform_outsideRiskError_crossing_threshold
