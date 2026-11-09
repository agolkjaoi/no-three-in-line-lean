import NoThreeLine.ScheduledStarEarlyMean
import NoThreeLine.ScheduledStarLateTail

/-! Exact early/late partition of the actual integrated masked intensity.
The shared cutoff is elapsed time. Both canonical pieces include the final
1/n normalization; the generic late-window path remains unnormalized. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

def latePhaseStart {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (τ : ℝ) (N : ℕ) : ℝ :=
  max 0 (τ-phaseEndpoint cs 0 N)

theorem latePhaseStart_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (τ : ℝ) (N : ℕ) :
    0≤latePhaseStart cs τ N := le_max_left _ _

theorem latePhaseStart_elapsed {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (τ start : ℝ) (N : ℕ) :
    τ≤phaseEndpoint cs start N-start+latePhaseStart cs τ N := by
  have he : phaseEndpoint cs start N-start=phaseEndpoint cs 0 N := by simp [phaseEndpoint]
  rw [he]
  have hh : τ-phaseEndpoint cs 0 N≤latePhaseStart cs τ N := le_max_right _ _
  linarith

theorem integral_Ioo_clamped_split (f : ℝ→ℝ) (hf : Measurable f) (F : ℝ)
    (hF : ∀t,0≤f t ∧ f t≤F) (a H : ℝ) (ha : 0≤a) (hH : 0≤H) :
    (∫t in Ioo 0 (min H a),f t)+(∫t in Ioo a H,f t)=∫t in Ioo 0 H,f t := by
  by_cases haH : a≤H
  · have hi (x y : ℝ) (hxy : x≤y) : IntervalIntegrable f volume x y :=
      (intervalIntegrable_iff_integrableOn_Ioo_of_le hxy).mpr
        (GenericCreditIteration.bounded_nonnegative_integrable _ _ hf F hF)
    have hh := intervalIntegral.integral_add_adjacent_intervals (hi 0 a ha) (hi a H haH)
    simpa only [min_eq_right haH,intervalIntegral.integral_of_le ha,intervalIntegral.integral_of_le haH,
      intervalIntegral.integral_of_le hH,integral_Ioc_eq_integral_Ioo] using hh
  · have hHa : H≤a := (lt_of_not_ge haH).le
    simp [min_eq_left hHa,Ioo_eq_empty_of_le hHa]

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem scheduledStarPhasePath_early_add_late {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (N : ℕ) (ω : BoardClockPath n) :
    scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N 0 (earlyPhaseLength cs τ N) ω+
    scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N (latePhaseStart cs τ N) (cs N).horizon ω=
    scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N 0 (cs N).horizon ω := by
  exact integral_Ioo_clamped_split _
    (((weightedStarIntensity_measurable Γ p H (fun s=>(cs N).mask s.val.1)).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)).comp
        (measurable_const.prodMk measurable_id)) _
    (fun t=>weightedStarIntensity_bounds Γ p H _
      (fun s=>⟨(cs N).mask_nonneg s.val.1,(cs N).mask_le_one s.val.1⟩) _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N (ω,t)))
    _ _ (latePhaseStart_nonneg cs τ N) (cs N).horizon.coe_nonneg

def scheduledStarFullPath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  (∑N∈Finset.range J,scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N 0 (cs N).horizon ω)/n

def scheduledStarCanonicalLatePath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  scheduledStarLatePath cs ε M deadline start hn hB Γ p H J
    (fun N=>latePhaseStart cs τ N) (fun N=>(cs N).horizon) ω/n

theorem scheduledStar_early_add_late_eq_full {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (J : ℕ) (ω : BoardClockPath n) :
    scheduledStarEarlyPath cs ε M deadline start hn hB Γ p H τ J ω+
    scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p H τ J ω=
    scheduledStarFullPath cs ε M deadline start hn hB Γ p H J ω := by
  unfold scheduledStarEarlyPath scheduledStarCanonicalLatePath scheduledStarFullPath scheduledStarLatePath
  dsimp only
  rw [Fin.sum_univ_eq_sum_range (fun N : ℕ=>scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N
    (latePhaseStart cs τ N) (cs N).horizon ω),←add_div,←Finset.sum_add_distrib]
  congr 1
  exact Finset.sum_congr rfl (fun N _=>scheduledStarPhasePath_early_add_late cs ε M deadline start hn hB Γ p H τ N ω)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarPhasePath_early_add_late
#print axioms NoThreeLine.ShortStars.scheduledStar_early_add_late_eq_full
