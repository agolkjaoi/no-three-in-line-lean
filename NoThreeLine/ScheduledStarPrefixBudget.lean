import NoThreeLine.ScheduledStarMeanBudget
import NoThreeLine.LongLineDeadlineMoments
import NoThreeLine.SchedulePrefixCumulative

/-! Prefix prices use the original phase array and physical deadlines.
Only the analytic sum is stopped at the root's deadline prefix. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FinitePhase FiniteDirections

theorem cutUnitPrice_eq_of_prefix {n : ℕ} {B : ℝ} (cs ds : ℕ→SharedPhase n B)
    (k : ℕ) (hc : ∀j<k,cs j=ds j) (N : ℕ) (hN : N<k) (t : ℝ) (q : Grid n) :
    cutUnitPrice cs N t q=cutUnitPrice ds N t q := by
  unfold cutUnitPrice
  rw [hc N hN]
  congr 2
  apply Finset.sum_congr rfl
  intro j hj
  rw [hc j ((Finset.mem_range.mp hj).trans hN)]

theorem starLatePrice_eq_of_prefix {n : ℕ} {B : ℝ} (cs ds : ℕ→SharedPhase n B)
    (k : ℕ) (hc : ∀j<k,cs j=ds j) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (a b : Fin k→ℝ) : starLatePrice cs Γ p H k a b=starLatePrice ds Γ p H k a b := by
  apply Finset.sum_congr rfl
  intro N _
  apply setIntegral_congr_fun measurableSet_Ioo
  intro t _
  unfold maskedCutStarPriceSum
  apply Finset.sum_congr rfl
  intro v _
  rw [hc N N.isLt,cutUnitPrice_eq_of_prefix cs ds k hc N N.isLt]

theorem starCanonicalLatePrice_eq_of_prefix {n : ℕ} {B : ℝ} (cs ds : ℕ→SharedPhase n B)
    (k : ℕ) (hc : ∀j<k,cs j=ds j) (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ) :
    starLatePrice cs Γ p H k (fun N=>latePhaseStart cs τ N) (fun N=>(cs N).horizon)=
      starLatePrice ds Γ p H k (fun N=>latePhaseStart ds τ N) (fun N=>(ds N).horizon) := by
  have ha : (fun N : Fin k=>latePhaseStart cs τ N)=(fun N : Fin k=>latePhaseStart ds τ N) := by
    funext N
    unfold latePhaseStart
    rw [phaseEndpoint_eq_of_prefix cs ds 0 k hc N N.isLt.le]
  have hb : (fun N : Fin k=>((cs N).horizon:ℝ))=(fun N : Fin k=>((ds N).horizon:ℝ)) := by
    funext N
    rw [hc N N.isLt]
  rw [ha,hb]
  exact starLatePrice_eq_of_prefix cs ds k hc Γ p H _ _

theorem starCanonicalLatePrice_prefix_schedule_le_shortTimeMean {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (H B K ρ τ : ℝ) (k : ℕ) (hk : k≤J) :
    starLatePrice (scheduleSharedPhases s mask hm Γ B K ρ) Γ p H k
      (fun N=>latePhaseStart (scheduleSharedPhases s mask hm Γ B K ρ) τ N)
      (fun N=>(scheduleSharedPhases s mask hm Γ B K ρ N).horizon)/n≤
      shortTimeMean (s.prefix k hk) (prefixMask hk mask) Γ p H := by
  rw [starCanonicalLatePrice_eq_of_prefix (scheduleSharedPhases s mask hm Γ B K ρ)
    (scheduleSharedPhases (s.prefix k hk) (prefixMask hk mask) (prefixMask_bounds hk mask hm) Γ B K ρ)
    k (fun j hj=>(scheduleSharedPhases_prefix_eq s mask hm Γ B K ρ k hk j hj).symm)]
  exact starCanonicalLatePrice_schedule_le_shortTimeMean (s.prefix k hk) (prefixMask hk mask)
    (prefixMask_bounds hk mask hm) Γ p H B K ρ τ

theorem long_prefix_mean_add_starLatePrice_le_deadline_pairSum {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (H B K ρ τ : ℝ) (k : ℕ) (hk : k≤J)
    (hT : (s.prefix k hk).total=scheduleProcessDeadline s mask p) :
    (∑z : Grid n,longBirthPrice (s.prefix k hk) (prefixMask hk mask) Γ p H z)+
      starLatePrice (scheduleSharedPhases s mask hm Γ B K ρ) Γ p H k
        (fun N=>latePhaseStart (scheduleSharedPhases s mask hm Γ B K ρ) τ N)
        (fun N=>(scheduleSharedPhases s mask hm Γ B K ρ N).horizon)/n≤
      normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p)) := by
  have hh := (add_le_add le_rfl
    (starCanonicalLatePrice_prefix_schedule_le_shortTimeMean s mask hm Γ p H B K ρ τ k hk)).trans
      (long_short_mean_le_normalizedPairSum (s.prefix k hk) (prefixMask hk mask)
        (prefixMask_bounds hk mask hm) Γ p H)
  have he : (fun q=>(s.prefix k hk).cumulative (fun j=>prefixMask hk mask j q) (s.prefix k hk).total)=
      (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p)) := by
    funext q
    simpa only [prefixMask,hT] using s.prefix_cumulative_total k hk (fun j=>mask j q)
  rwa [he] at hh

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.starCanonicalLatePrice_eq_of_prefix
#print axioms NoThreeLine.ShortStars.starCanonicalLatePrice_prefix_schedule_le_shortTimeMean
#print axioms NoThreeLine.ShortStars.long_prefix_mean_add_starLatePrice_le_deadline_pairSum
