import NoThreeLine.ScheduledStarCanonicalMoment
import NoThreeLine.ScheduledStarPrefixBudget

/-! The root-deadline prefix of the actual late observable is evaluated
under the original full-schedule point measure. Later stars are not set to
zero: the observable explicitly contains only the first k phases. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteMomentIntegral

def canonicalLateCap {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (k : ℕ) : ℝ :=
  (∑N : Fin k,(volume.restrict (Ioo (latePhaseStart cs τ N) ((cs N).horizon:ℝ))).real univ*
    (((shortStars Γ p H).card:ℝ)*B))/n

theorem scheduledStarCanonicalLatePath_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (k : ℕ) :
    Measurable (scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p H τ k) :=
  (Finset.measurable_sum (Finset.univ : Finset (Fin k)) (fun N _=>scheduledStarPhasePath_measurable cs ε M deadline start hn hB
    Γ p H N (latePhaseStart cs τ N) (cs N).horizon)).div_const n

theorem canonicalLateCap_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (hB : 0≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) (k : ℕ) :
    0≤canonicalLateCap cs Γ p H τ k :=
  div_nonneg (Finset.sum_nonneg (fun _ _=>mul_nonneg ENNReal.toReal_nonneg
    (mul_nonneg (Nat.cast_nonneg _) hB))) (Nat.cast_nonneg n)

theorem scheduledStarCanonicalLatePath_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ)
    (k : ℕ) (ω : BoardClockPath n) :
    0≤scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p H τ k ω ∧
      scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p H τ k ω≤canonicalLateCap cs Γ p H τ k := by
  constructor
  · exact div_nonneg (Finset.sum_nonneg (fun N _=>(scheduledStarPhasePath_bounds cs ε M deadline start hn hB
      Γ p H N (latePhaseStart cs τ N) (cs N).horizon ω).1)) (Nat.cast_nonneg n)
  · exact div_le_div_of_nonneg_right (Finset.sum_le_sum (fun N _=>(scheduledStarPhasePath_bounds cs ε M deadline start hn hB
      Γ p H N (latePhaseStart cs τ N) (cs N).horizon ω).2)) (Nat.cast_nonneg n)

theorem scheduledStarCanonicalLatePath_deadline_log_moment (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (k J m : ℕ) (hk : k≤J) (hm : 3≤m)
    (hp : deadline p≤phaseEndpoint cs start k) (hT : phaseEndpoint cs start k-start≤T) :
    (∫ω,(scheduledStarCanonicalLatePath cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB Γ p H
      ((n:ℝ)^(γ-1)) k ω)^m
      ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J)≤
    (positiveMomentRoot m (starEtaMultiplier ζ m n)*
        (starLatePrice cs Γ p H k (fun N=>latePhaseStart cs ((n:ℝ)^(γ-1)) N) (fun N=>(cs N).horizon)/n)+
      positiveMomentRoot m (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n)*
        (T^2*Real.log n))^m := by
  rw [phasePointMeasure_deadline_stable cs ((n:ℝ)^(-ζ)) M deadline start p (by omega : 0<n) hB k J hk hp]
  exact scheduledStarCanonicalLatePath_log_moment ξ hξ cs M deadline start K ρ δ d γ ζ T p hn hB Γ H hH
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ k m hm hT

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarCanonicalLatePath_measurable
#print axioms NoThreeLine.ShortStars.scheduledStarCanonicalLatePath_bounds
#print axioms NoThreeLine.ShortStars.scheduledStarCanonicalLatePath_deadline_log_moment
