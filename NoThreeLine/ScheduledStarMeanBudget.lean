import NoThreeLine.ScheduledStarPriceIdentity
import NoThreeLine.ScheduledStarPartition

/-! A late current-mask price is bounded by the full short-time mean for
the same actual finite schedule. Long and short share one pair budget. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FinitePhase FiniteDirections

theorem starLatePrice_le_full {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (J : ℕ) (a b : Fin J→ℝ)
    (ha : ∀N,0≤a N) (hb : ∀N,b N≤(cs N).horizon) :
    starLatePrice cs Γ p H J a b≤
      starLatePrice cs Γ p H J (fun _=>0) (fun N=>(cs N).horizon) := by
  apply Finset.sum_le_sum
  intro N _
  apply setIntegral_mono_set
  · exact (maskedCutStarPriceSum_continuous Γ p H cs N).continuousOn.integrableOn_Icc.mono_set
      Ioo_subset_Icc_self
  · filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
    exact Finset.sum_nonneg (fun s _=>mul_nonneg ((cs N).mask_nonneg s.1)
      (cutUnitPrice_nonneg cs N t ht.1.le s.2))
  · exact Filter.Eventually.of_forall (fun t ht=>⟨lt_of_le_of_lt (ha N) ht.1,
      lt_of_lt_of_le ht.2 (hb N)⟩)

theorem starLatePrice_schedule_le_shortTimeMean {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (H B K ρ : ℝ) (a b : Fin J→ℝ)
    (ha : ∀N,0≤a N) (hb : ∀N,b N≤s.duration N) :
    starLatePrice (scheduleSharedPhases s mask hm Γ B K ρ) Γ p H J a b/n≤
      shortTimeMean s mask Γ p H := by
  have hhor : (fun N : Fin J=>((scheduleSharedPhases s mask hm Γ B K ρ N).horizon:ℝ))=
      (fun N=>s.duration N) := funext (scheduleSharedPhases_horizon s mask hm Γ B K ρ)
  have hb' (N : Fin J) : b N≤(scheduleSharedPhases s mask hm Γ B K ρ N).horizon := by
    rw [scheduleSharedPhases_horizon]
    exact hb N
  have hh := starLatePrice_le_full (scheduleSharedPhases s mask hm Γ B K ρ) Γ p H J a b ha hb'
  rw [hhor] at hh
  exact (div_le_div_of_nonneg_right hh (Nat.cast_nonneg n)).trans_eq
    (starFullPrice_schedule_eq_shortTimeMean s mask hm Γ p H B K ρ)

theorem starCanonicalLatePrice_schedule_le_shortTimeMean {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (H B K ρ τ : ℝ) :
    starLatePrice (scheduleSharedPhases s mask hm Γ B K ρ) Γ p H J
      (fun N=>latePhaseStart (scheduleSharedPhases s mask hm Γ B K ρ) τ N)
      (fun N=>(scheduleSharedPhases s mask hm Γ B K ρ N).horizon)/n≤
      shortTimeMean s mask Γ p H :=
  starLatePrice_schedule_le_shortTimeMean s mask hm Γ p H B K ρ _ _
    (fun N=>latePhaseStart_nonneg _ τ N)
    (fun N=>(scheduleSharedPhases_horizon s mask hm Γ B K ρ N).le)

theorem long_mean_add_starLatePrice_le_normalizedPairSum {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (H B K ρ : ℝ) (a b : Fin J→ℝ)
    (ha : ∀N,0≤a N) (hb : ∀N,b N≤s.duration N) :
    (∑z : Grid n,longBirthPrice s mask Γ p H z)+
      starLatePrice (scheduleSharedPhases s mask hm Γ B K ρ) Γ p H J a b/n≤
      normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) s.total) :=
  (add_le_add le_rfl (starLatePrice_schedule_le_shortTimeMean s mask hm Γ p H B K ρ a b ha hb)).trans
    (long_short_mean_le_normalizedPairSum s mask hm Γ p H)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.starLatePrice_le_full
#print axioms NoThreeLine.ShortStars.starLatePrice_schedule_le_shortTimeMean
#print axioms NoThreeLine.ShortStars.starCanonicalLatePrice_schedule_le_shortTimeMean
#print axioms NoThreeLine.ShortStars.long_mean_add_starLatePrice_le_normalizedPairSum
