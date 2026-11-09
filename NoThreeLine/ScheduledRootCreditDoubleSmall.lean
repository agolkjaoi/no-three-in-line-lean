import NoThreeLine.ScheduledRootCreditDouble

/-! Uniform o(log n) for all actual phase triangles/rectangles and all
non-specified root lines. The bound is uniform in phase count, masks,
deadlines and root after fixing total time and the two exponents. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Filter
open scoped Topology

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections FiniteWitnessMoments

def rootCreditDoubleEnvelope (T δ ζ : ℝ) (n : ℕ) : ℝ :=
  (2*T^3/(1-(n : ℝ)^(-ζ))^7)*
    ((64+16*((n : ℝ)^δ/n)*(1+Real.log (n : ℝ)))/Real.log (n : ℝ))

theorem tendsto_rootCreditDoubleEnvelope (T δ ζ : ℝ) (hδ : δ < 1) (hζ : 0 < ζ) :
    Tendsto (rootCreditDoubleEnvelope T δ ζ) atTop (𝓝 (0 : ℝ)) := by
  have hd : Tendsto (fun n : ℕ => (1-(n : ℝ)^(-ζ))^7) atTop (𝓝 (1 : ℝ)) := by
    simpa only [sub_zero,one_pow] using
      ((tendsto_const_nhds : Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 (1 : ℝ))).sub
        (tendsto_nat_rpow_negative ζ hζ)).pow 7
  have hc : Tendsto (fun n : ℕ => 2*T^3/(1-(n : ℝ)^(-ζ))^7) atTop (𝓝 (2*T^3)) := by
    have hh := (tendsto_const_nhds : Tendsto (fun _ : ℕ => 2*T^3) atTop (𝓝 (2*T^3))).div hd
      (by norm_num : (1 : ℝ) ≠ 0)
    change Tendsto (fun n : ℕ => 2*T^3/(1-(n : ℝ)^(-ζ))^7) atTop (𝓝 (2*T^3/1)) at hh
    simpa only [div_one] using hh
  change Tendsto (fun n : ℕ => (2*T^3/(1-(n : ℝ)^(-ζ))^7)*
    ((64+16*((n : ℝ)^δ/n)*(1+Real.log (n : ℝ)))/Real.log (n : ℝ))) atTop (𝓝 (0 : ℝ))
  simpa only [mul_zero] using hc.mul (tendsto_lineCreditErrorEnvelope δ hδ)

theorem scheduledRootCreditDoublePath_normalized_le_envelope {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (p : Grid n) (T δ ζ : ℝ) (J : ℕ) (hT : phaseEndpoint cs 0 J ≤ T)
    (hBn : B ≤ (n : ℝ)^δ) (hn2 : 2 ≤ n) (hε : (n : ℝ)^(-ζ) < 1) :
    (∫ ω, scheduledRootCreditDoublePath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω
      ∂phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log (n : ℝ) ≤
      rootCreditDoubleEnvelope T δ ζ n := by
  have hlog : 0 < Real.log (n : ℝ) := log_nat_pos hn2
  have hε0 := Real.rpow_nonneg (Nat.cast_nonneg n) (-ζ)
  have htime := phaseEndpoint_zero_nonneg cs J
  have hT0 : 0 ≤ T := htime.trans hT
  have hb := (scheduledRootCreditDoublePath_terminal_bound cs _ M deadline start hn hB Γ hΓ hK p J hε0 hε).trans
    (mul_le_mul_of_nonneg_left (rootBoardLineErrorBudget_bound p B (zero_le_one.trans hB)) (by positivity))
  have hc : 2*(phaseEndpoint cs 0 J)^3/(1-(n : ℝ)^(-ζ))^7 ≤ 2*T^3/(1-(n : ℝ)^(-ζ))^7 :=
    div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left (pow_le_pow_left₀ htime hT 3) (by norm_num)) (by positivity)
  have hg : 64+16*(B/n)*(1+Real.log (n : ℝ)) ≤
      64+16*((n : ℝ)^δ/n)*(1+Real.log (n : ℝ)) := by gcongr
  have hlarge := mul_le_mul hc hg (by positivity : 0 ≤ 64+16*(B/n)*(1+Real.log (n : ℝ)))
    (by positivity : 0 ≤ 2*T^3/(1-(n : ℝ)^(-ζ))^7)
  exact (div_le_div_of_nonneg_right (hb.trans hlarge) hlog.le).trans_eq
    (by unfold rootCreditDoubleEnvelope; ring)

theorem exists_uniform_rootCreditDouble_threshold (T δ ζ ρ : ℝ)
    (hδ : δ < 1) (hζ : 0 < ζ) (hρ : 0 < ρ) :
    ∃ N : ℕ, 2 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀ j, (cs j).directions=Γ) → (∀ j, (cs j).K < 2) → phaseEndpoint cs 0 J ≤ T → B ≤ (n : ℝ)^δ →
        (∫ ω, scheduledRootCreditDoublePath cs ((n : ℝ)^(-ζ)) M deadline start hn hB Γ p J ω
          ∂phasePointMeasure cs ((n : ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log (n : ℝ) < ρ := by
  have ha := (tendsto_rootCreditDoubleEnvelope T δ ζ hδ hζ).eventually (gt_mem_nhds hρ)
  have he : ∀ᶠ n : ℕ in atTop, (n : ℝ)^(-ζ) < 1 :=
    (tendsto_nat_rpow_negative ζ hζ).eventually (gt_mem_nhds zero_lt_one)
  obtain ⟨N,hN⟩ := eventually_atTop.mp (ha.and he)
  refine ⟨max N 2,le_max_right _ _,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p J hΓ hK hT hBn
  have hh := hN n ((le_max_left _ _).trans hNn)
  exact (scheduledRootCreditDoublePath_normalized_le_envelope cs M deadline start hn hB Γ hΓ hK p
    T δ ζ J hT hBn ((le_max_right _ _).trans hNn) hh.2).trans_lt hh.1

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.tendsto_rootCreditDoubleEnvelope
#print axioms NoThreeLine.BirthWitness.exists_uniform_rootCreditDouble_threshold
