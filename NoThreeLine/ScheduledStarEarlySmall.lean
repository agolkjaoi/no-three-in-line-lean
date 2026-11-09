import NoThreeLine.ScheduledStarEarlyMean

/-! Uniform early-time L1 decay and Markov control. Only gamma<1 and
zeta>0 enter this error; no high-moment assumption is used at early times. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Filter
open scoped Topology

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteWitnessMoments

def earlyStarEnvelope (γ ζ : ℝ) (n : ℕ) : ℝ :=
  16*((n:ℝ)^(γ-1))^2/(1-(n:ℝ)^(-ζ))^3*((1+Real.log n)/Real.log n)

theorem tendsto_earlyStarEnvelope (γ ζ : ℝ) (hγ : γ<1) (hζ : 0<ζ) :
    Tendsto (earlyStarEnvelope γ ζ) atTop (𝓝 0) := by
  unfold earlyStarEnvelope
  have ht : Tendsto (fun n : ℕ=>(n:ℝ)^(γ-1)) atTop (𝓝 (0:ℝ)) := by
    simpa only [neg_sub] using tendsto_nat_rpow_negative (1-γ) (sub_pos.mpr hγ)
  have hden : Tendsto (fun n : ℕ=>(1-(n:ℝ)^(-ζ))^3) atTop (𝓝 (1:ℝ)) := by
    simpa only [sub_zero,one_pow] using
      ((tendsto_const_nhds (x:=(1:ℝ))).sub (tendsto_nat_rpow_negative ζ hζ)).pow 3
  have hlog : Tendsto (fun n : ℕ=>(1+Real.log n)/Real.log n) atTop (𝓝 (1:ℝ)) := by
    simpa only [one_mul,add_comm] using tendsto_affine_log_ratio 1 1
  have hh := (((ht.pow 2).const_mul 16).div hden (by norm_num : (1:ℝ)≠0)).mul hlog
  simpa only [earlyStarEnvelope,Pi.div_apply,zero_pow (by decide : (2:ℕ)≠0),mul_zero,zero_div,zero_mul] using hh

theorem scheduledStarEarlyPath_normalized_le {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H γ ζ : ℝ)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hn2 : 2≤n) (hε : (n:ℝ)^(-ζ)<1) (J : ℕ) :
    (∫ω,scheduledStarEarlyPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p H ((n:ℝ)^(γ-1)) J ω
      ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log n≤earlyStarEnvelope γ ζ n := by
  have hh := scheduledStarEarlyPath_mean_bound cs _ M deadline start hn hB Γ p H ((n:ℝ)^(γ-1))
    (Real.rpow_nonneg (Nat.cast_nonneg n) _) hΓ hK (Real.rpow_nonneg (Nat.cast_nonneg n) _) hε J
  exact (div_le_div_of_nonneg_right hh (log_nat_pos hn2).le).trans_eq (by unfold earlyStarEnvelope; ring)

theorem exists_uniform_earlyStar_mean_threshold (γ ζ κ : ℝ)
    (hγ : γ<1) (hζ : 0<ζ) (hκ : 0<κ) :
    ∃ N : ℕ,2≤N ∧ ∀n : ℕ,N≤n →
      ∀(B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (J : ℕ),
        (∀j,(cs j).directions=Γ) → (∀j,(cs j).K<2) →
        (∫ω,scheduledStarEarlyPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p H ((n:ℝ)^(γ-1)) J ω
          ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log n<κ := by
  have he := (tendsto_earlyStarEnvelope γ ζ hγ hζ).eventually (gt_mem_nhds hκ)
  have hε := (tendsto_nat_rpow_negative ζ hζ).eventually (gt_mem_nhds zero_lt_one)
  obtain ⟨N,hN⟩ := eventually_atTop.mp (he.and hε)
  refine ⟨max N 2,le_max_right _ _,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p H J hΓ hK
  have hh := hN n ((le_max_left _ _).trans hNn)
  exact (scheduledStarEarlyPath_normalized_le cs M deadline start hn hB Γ p H γ ζ hΓ hK
    ((le_max_right _ _).trans hNn) hh.2 J).trans_lt hh.1

theorem scheduledStarEarlyPath_tail_le_mean {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ)
    (J : ℕ) (a : ℝ) (ha : 0<a) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | a≤scheduledStarEarlyPath cs ε M deadline start hn hB Γ p H τ J ω}≤
    (∫ω,scheduledStarEarlyPath cs ε M deadline start hn hB Γ p H τ J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)/a := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hh := mul_meas_ge_le_integral_of_nonneg
    (Eventually.of_forall (scheduledStarEarlyPath_nonneg cs ε M deadline start hn hB Γ p H τ J))
    (scheduledStarEarlyPath_integrable cs ε M deadline start hn hB Γ p H τ J μ) a
  apply (le_div_iff₀ ha).mpr
  simpa only [mul_comm] using hh

theorem exists_uniform_earlyStar_tail_threshold (γ ζ a κ : ℝ)
    (hγ : γ<1) (hζ : 0<ζ) (ha : 0<a) (hκ : 0<κ) :
    ∃ N : ℕ,2≤N ∧ ∀n : ℕ,N≤n →
      ∀(B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (J : ℕ),
        (∀j,(cs j).directions=Γ) → (∀j,(cs j).K<2) →
        (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J).real
          {ω | a*Real.log n≤scheduledStarEarlyPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p H ((n:ℝ)^(γ-1)) J ω}<κ := by
  obtain ⟨N,hN,hh⟩ := exists_uniform_earlyStar_mean_threshold γ ζ (a*κ) hγ hζ (mul_pos ha hκ)
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p H J hΓ hK
  have hlog := log_nat_pos (hN.trans hNn)
  have he := hh n hNn B cs M deadline start hn hB Γ p H J hΓ hK
  apply (scheduledStarEarlyPath_tail_le_mean cs _ M deadline start hn hB Γ p H _ J
    (a*Real.log n) (mul_pos ha hlog)).trans_lt
  calc
    _ = ((∫ω,scheduledStarEarlyPath cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p H ((n:ℝ)^(γ-1)) J ω
        ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log n)/a := by ring
    _ < (a*κ)/a := div_lt_div_of_pos_right he ha
    _ = κ := by field_simp

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.tendsto_earlyStarEnvelope
#print axioms NoThreeLine.ShortStars.exists_uniform_earlyStar_mean_threshold
#print axioms NoThreeLine.ShortStars.exists_uniform_earlyStar_tail_threshold
