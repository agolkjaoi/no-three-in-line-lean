import NoThreeLine.ScheduledTerminalRootMoment

/-! Uniform o(log n) for the actual integrated C11 first/second-moment
budget, including B times the first moment. Phase count, masks, deadlines
and root may vary with n; the time bound and exponents are fixed first. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections FiniteWitnessMoments

def terminalRootMomentEnvelope (T δ ζ : ℝ) (n : ℕ) : ℝ :=
  (2*T^2/(1-(n : ℝ)^(-ζ))^6)*
    ((64+16*((n : ℝ)^δ/n)*(1+Real.log (n : ℝ)))/Real.log (n : ℝ))

theorem tendsto_terminalRootMomentEnvelope (T δ ζ : ℝ) (hδ : δ < 1) (hζ : 0 < ζ) :
    Tendsto (terminalRootMomentEnvelope T δ ζ) atTop (𝓝 (0 : ℝ)) := by
  have hd : Tendsto (fun n : ℕ => (1-(n : ℝ)^(-ζ))^6) atTop (𝓝 (1 : ℝ)) := by
    simpa only [sub_zero, one_pow] using
      ((tendsto_const_nhds : Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 (1 : ℝ))).sub
        (tendsto_nat_rpow_negative ζ hζ)).pow 6
  have hc : Tendsto (fun n : ℕ => 2*T^2/(1-(n : ℝ)^(-ζ))^6) atTop (𝓝 (2*T^2)) := by
    have hh := (tendsto_const_nhds : Tendsto (fun _ : ℕ => 2*T^2) atTop (𝓝 (2*T^2))).div hd
      (by norm_num : (1 : ℝ) ≠ 0)
    change Tendsto (fun n : ℕ => 2*T^2/(1-(n : ℝ)^(-ζ))^6) atTop (𝓝 (2*T^2/1)) at hh
    simpa only [div_one] using hh
  change Tendsto (fun n : ℕ => (2*T^2/(1-(n : ℝ)^(-ζ))^6)*
    ((64+16*((n : ℝ)^δ/n)*(1+Real.log (n : ℝ)))/Real.log (n : ℝ))) atTop (𝓝 (0 : ℝ))
  simpa only [mul_zero] using
    hc.mul (tendsto_lineCreditErrorEnvelope δ hδ)

theorem scheduledTerminalRootMoment_normalized_le_envelope {n : ℕ} {B : ℝ}
    (mask : ℕ → Grid n → ℝ) (hm : ∀ N q, 0 ≤ mask N q ∧ mask N q ≤ 1)
    (Γ : Finset ZPoint) (p : Grid n) (cs : ℕ → SharedPhase n B)
    (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (T δ ζ : ℝ) (J : ℕ) (hT : phaseEndpoint cs 0 J ≤ T)
    (hBn : B ≤ (n : ℝ)^δ) (hn2 : 2 ≤ n) (hε : (n : ℝ)^(-ζ) < 1) :
    scheduledTerminalRootMoment cs ((n : ℝ)^(-ζ)) M deadline start hn hB mask Γ p J /
      Real.log (n : ℝ) ≤ terminalRootMomentEnvelope T δ ζ n := by
  have hlog : 0 < Real.log (n : ℝ) := log_nat_pos hn2
  have hε0 := Real.rpow_nonneg (Nat.cast_nonneg n) (-ζ)
  have hb := scheduledTerminalRootMoment_envelope mask hm Γ p cs _ M deadline start hn hB
    hΓ hK hε0 hε J
  have hsq : (phaseEndpoint cs 0 J)^2 ≤ T^2 :=
    pow_le_pow_left₀ (phaseEndpoint_zero_nonneg cs J) hT 2
  have hc : 2*(phaseEndpoint cs 0 J)^2/(1-(n : ℝ)^(-ζ))^6 ≤ 2*T^2/(1-(n : ℝ)^(-ζ))^6 :=
    div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hsq (by norm_num)) (by positivity)
  have hg : 64+16*(B/n)*(1+Real.log (n : ℝ)) ≤
      64+16*((n : ℝ)^δ/n)*(1+Real.log (n : ℝ)) := by
    gcongr
  have hlarge := mul_le_mul hc hg (by positivity : 0 ≤ 64+16*(B/n)*(1+Real.log (n : ℝ)))
    (by positivity : 0 ≤ 2*T^2/(1-(n : ℝ)^(-ζ))^6)
  exact (div_le_div_of_nonneg_right (hb.trans hlarge) hlog.le).trans_eq
    (by unfold terminalRootMomentEnvelope; ring)

theorem exists_uniform_terminalRootMoment_threshold (T δ ζ ρ : ℝ)
    (hδ : δ < 1) (hζ : 0 < ζ) (hρ : 0 < ρ) :
    ∃ N : ℕ, 2 ≤ N ∧ ∀ n : ℕ, N ≤ n →
      ∀ (B : ℝ) (cs : ℕ → SharedPhase n B) (M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
        (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀ k q, 0 ≤ mask k q ∧ mask k q ≤ 1) → (∀ j, (cs j).directions=Γ) →
        (∀ j, (cs j).K < 2) → phaseEndpoint cs 0 J ≤ T → B ≤ (n : ℝ)^δ →
        scheduledTerminalRootMoment cs ((n : ℝ)^(-ζ)) M deadline start hn hB mask Γ p J /
          Real.log (n : ℝ) < ρ := by
  have ha := (tendsto_terminalRootMomentEnvelope T δ ζ hδ hζ).eventually (gt_mem_nhds hρ)
  have he : ∀ᶠ n : ℕ in atTop, (n : ℝ)^(-ζ) < 1 :=
    (tendsto_nat_rpow_negative ζ hζ).eventually (gt_mem_nhds zero_lt_one)
  obtain ⟨N,hN⟩ := eventually_atTop.mp (ha.and he)
  refine ⟨max N 2, le_max_right _ _, ?_⟩
  intro n hNn B cs M deadline start hn hB mask Γ p J hm hΓ hK hT hBn
  have hh := hN n ((le_max_left _ _).trans hNn)
  exact (scheduledTerminalRootMoment_normalized_le_envelope mask hm Γ p cs M deadline start hn hB
    hΓ hK T δ ζ J hT hBn ((le_max_right _ _).trans hNn) hh.2).trans_lt hh.1

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.tendsto_terminalRootMomentEnvelope
#print axioms NoThreeLine.BirthWitness.exists_uniform_terminalRootMoment_threshold
