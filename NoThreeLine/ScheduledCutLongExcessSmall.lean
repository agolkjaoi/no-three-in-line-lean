import NoThreeLine.ScheduledCutLongExcess
import NoThreeLine.CutLongExcessEnvelope

/-! Uniform smallness of the actual current-cut-density long excess.
The total duration is uniformly bounded, and the actual threshold is
B*log(n). No small-loss or moment hypothesis is added to the process. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments FiniteDirections

theorem scheduledCutLongExcess_normalized_le_envelope {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (T ζ δ : ℝ) (k J : ℕ) (hT : phaseEndpoint cs 0 J≤T)
    (hε : (n:ℝ)^(-ζ)<1) (hδ : 0<δ) (hl : 1≤Real.log (n:ℝ)) :
    scheduledCutLongExcess cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p J (Real.log (n:ℝ))/Real.log (n:ℝ)≤
      cutLongExcessEnvelope T ζ δ k n := by
  have hε0 : 0≤(n:ℝ)^(-ζ) := Real.rpow_nonneg (Nat.cast_nonneg n) _
  have hh := (scheduledCutLongExcess_bound cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p
    hΓ hK hε0 hε k J δ (Real.log (n:ℝ)) hδ hl).2
  have hl0 : 0<Real.log (n:ℝ) := zero_lt_one.trans_le hl
  have hsum : 0≤phaseEndpoint cs 0 J := phaseEndpoint_zero_nonneg cs J
  have hsq : (phaseEndpoint cs 0 J)^2≤T^2 := pow_le_pow_left₀ hsum hT 2
  have hF : 0≤lineExcessFactor (physicalRepeatErrorConstant (k+1)) δ (Real.log (n:ℝ)) k :=
    lineExcessFactor_nonneg _ δ _ k (by unfold physicalRepeatErrorConstant; positivity) hδ hl0
  have hlarge : 16*(phaseEndpoint cs 0 J)^2/(1-(n:ℝ)^(-ζ))^(k+3).choose 2*(1+Real.log (n:ℝ))*
      lineExcessFactor (physicalRepeatErrorConstant (k+1)) δ (Real.log (n:ℝ)) k≤
      16*T^2/(1-(n:ℝ)^(-ζ))^(k+3).choose 2*(1+Real.log (n:ℝ))*
        lineExcessFactor (physicalRepeatErrorConstant (k+1)) δ (Real.log (n:ℝ)) k := by
    apply mul_le_mul_of_nonneg_right _ hF
    apply mul_le_mul_of_nonneg_right _ (by linarith : 0≤1+Real.log (n:ℝ))
    exact div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hsq (by norm_num))
      (pow_nonneg (sub_nonneg.mpr hε.le) _)
  calc
    _ ≤ (16*T^2/(1-(n:ℝ)^(-ζ))^(k+3).choose 2*(1+Real.log (n:ℝ))*
        lineExcessFactor (physicalRepeatErrorConstant (k+1)) δ (Real.log (n:ℝ)) k)/Real.log (n:ℝ) :=
      div_le_div_of_nonneg_right (hh.trans hlarge) hl0.le
    _ = _ := by unfold cutLongExcessEnvelope; ring

theorem exists_uniform_cutLongExcess_threshold (T ζ ρ : ℝ) (hζ : 0<ζ) (hρ : 0<ρ) :
    ∃N : ℕ,2≤N ∧ ∀n : ℕ,N≤n→
      ∀(B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ),
        (∀j,(cs j).directions=Γ)→(∀j,(cs j).K<2)→phaseEndpoint cs 0 J≤T→
        scheduledCutLongExcess cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p J (Real.log (n:ℝ))/Real.log (n:ℝ)<ρ := by
  obtain ⟨δ,hδ,k,hk⟩ := exists_fixed_cutLongExcess_parameters T ζ ρ hζ hρ
  have hε : ∀ᶠ n : ℕ in atTop,(n:ℝ)^(-ζ)<1 :=
    (tendsto_nat_rpow_negative ζ hζ).eventually (gt_mem_nhds zero_lt_one)
  have hl : ∀ᶠ n : ℕ in atTop,1≤Real.log (n:ℝ) :=
    tendsto_log_nat_atTop.eventually (eventually_ge_atTop 1)
  obtain ⟨N,hN⟩ := eventually_atTop.mp (hk.and (hε.and hl))
  refine ⟨max N 2,le_max_right _ _,?_⟩
  intro n hnN B cs M deadline start hn hB Γ p J hΓ hK hT
  have hh := hN n ((le_max_left _ _).trans hnN)
  exact (scheduledCutLongExcess_normalized_le_envelope cs M deadline start hn hB Γ p hΓ hK
    T ζ δ k J hT hh.2.1 hδ hh.2.2).trans_lt hh.1

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutLongExcess_normalized_le_envelope
#print axioms NoThreeLine.BirthWitness.exists_uniform_cutLongExcess_threshold
