import NoThreeLine.ScheduledStarFirstMoment
import NoThreeLine.CalendarEarlyLength
import NoThreeLine.ScheduledStarLatePath
import NoThreeLine.CalendarMeanBound

/-! The early part of the actual masked intensity is small in L1 under
the same full-J law. One elapsed-time cutoff is shared by every phase. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness CalendarIntegral

def scheduledStarEarlyPath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  (∑N∈Finset.range J,scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N 0
    (earlyPhaseLength cs τ N) ω)/n

theorem scheduledStarEarlyPath_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (J : ℕ) (ω : BoardClockPath n) :
    0≤scheduledStarEarlyPath cs ε M deadline start hn hB Γ p H τ J ω :=
  div_nonneg (Finset.sum_nonneg (fun N _=>
    (scheduledStarPhasePath_bounds cs ε M deadline start hn hB Γ p H N 0 _ ω).1)) (Nat.cast_nonneg n)

theorem scheduledStarEarlyPath_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (J : ℕ) :
    Measurable (scheduledStarEarlyPath cs ε M deadline start hn hB Γ p H τ J) :=
  (Finset.measurable_sum _ (fun N _=>scheduledStarPhasePath_measurable cs ε M deadline start
    hn hB Γ p H N 0 _)).div_const n

theorem scheduledStarPhasePath_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (N : ℕ) (a b : ℝ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N a b) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    (scheduledStarPhasePath_measurable cs ε M deadline start hn hB Γ p H N a b) _
    (scheduledStarPhasePath_bounds cs ε M deadline start hn hB Γ p H N a b)

theorem scheduledStarEarlyPath_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (J : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledStarEarlyPath cs ε M deadline start hn hB Γ p H τ J) μ :=
  (integrable_finsetSum _ (fun N _=>scheduledStarPhasePath_integrable cs ε M deadline start
    hn hB Γ p H N 0 _ μ)).div_const n

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem scheduledStarEarlyPhase_mean_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (N J : ℕ) (hNJ : N<J) :
    (∫ω,scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N 0 (earlyPhaseLength cs τ N) ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)≤
      earlyPhaseLength cs τ N*(16*τ*(n:ℝ)*(1+Real.log n)/(1-ε)^3) := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  let X := fun x : BoardClockPath n×ℝ=>weightedStarIntensity Γ p H (fun s=>(cs N).mask s.val.1)
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N x)
  have hX : Measurable X := (weightedStarIntensity_measurable Γ p H _).comp
    (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)
  have hXb (x) : 0≤X x ∧ X x≤((shortStars Γ p H).card:ℝ)*B :=
    weightedStarIntensity_bounds Γ p H _
      (fun s=>⟨(cs N).mask_nonneg s.val.1,(cs N).mask_le_one s.val.1⟩) _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N x)
  have hlog : 0≤1+Real.log (n:ℝ) := by
    have hh : 1≤(n:ℝ) := by exact_mod_cast (show 1≤n by omega)
    linarith [Real.log_nonneg hh]
  have hc : ∀ᵐt : ℝ ∂volume,t∈Ioo (0:ℝ) (earlyPhaseLength cs τ N) →
      (∫ω,X (ω,t) ∂μ)≤16*τ*(n:ℝ)*(1+Real.log n)/(1-ε)^3 := by
    filter_upwards [scheduledStar_future_firstMoment_ae cs ε M deadline start hn hB Γ p H
      hΓ hK hε0 hε N J hNJ] with t htower
    intro ht
    apply (htower ⟨ht.1,ht.2.trans_le (earlyPhaseLength_bounds cs τ N).2⟩).trans
    apply div_le_div_of_nonneg_right _ (pow_nonneg (sub_nonneg.mpr hε.le) _)
    exact mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_left (elapsed_lt_of_early cs τ start N t ht).le (by norm_num))
        (Nat.cast_nonneg n)) hlog
  have hh := (expected_interval_integral_bounds_ae μ (earlyPhaseLength cs τ N)
    (earlyPhaseLength_bounds cs τ N).1 X hX _ hXb _ hc).2
  simpa only [scheduledStarPhasePath,intervalIntegral.integral_of_le (earlyPhaseLength_bounds cs τ N).1,
    integral_Ioc_eq_integral_Ioo] using hh

theorem scheduledStarEarlyPath_mean_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (hτ : 0≤τ)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (J : ℕ) :
    (∫ω,scheduledStarEarlyPath cs ε M deadline start hn hB Γ p H τ J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)≤16*τ^2*(1+Real.log n)/(1-ε)^3 := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hN : 0<(n:ℝ) := by exact_mod_cast hn
  let C := 16*τ*(n:ℝ)*(1+Real.log n)/(1-ε)^3
  have hC : 0≤C := by
    have hh : 1≤(n:ℝ) := by exact_mod_cast (show 1≤n by omega)
    have hl := Real.log_nonneg hh
    dsimp only [C]
    positivity
  unfold scheduledStarEarlyPath
  rw [integral_div,integral_finsetSum _ (fun N _=>
    scheduledStarPhasePath_integrable cs ε M deadline start hn hB Γ p H N 0 _ μ)]
  calc
    _ ≤ (∑N∈Finset.range J,earlyPhaseLength cs τ N*C)/n := by
      apply div_le_div_of_nonneg_right _ hN.le
      exact Finset.sum_le_sum (fun N hNJ=>scheduledStarEarlyPhase_mean_bound cs ε M deadline start
        hn hB Γ p H τ hΓ hK hε0 hε N J (Finset.mem_range.mp hNJ))
    _ = (∑N∈Finset.range J,earlyPhaseLength cs τ N)*C/n := by rw [Finset.sum_mul]
    _ ≤ τ*C/n := div_le_div_of_nonneg_right
      (mul_le_mul_of_nonneg_right (sum_earlyPhaseLength_le cs τ hτ J) hC) hN.le
    _ = _ := by dsimp only [C]; field_simp <;> ring

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarEarlyPath_integrable
#print axioms NoThreeLine.ShortStars.scheduledStarEarlyPath_mean_bound
