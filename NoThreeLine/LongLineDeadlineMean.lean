import NoThreeLine.SchedulePrefixCumulative
import NoThreeLine.LongLineMean
import NoThreeLine.ScheduleInputDomination

/-! The actual root-deadline long mean is bounded by the original schedule's
common-deadline pair risk, then by S6 from phase-mask domination. The leading
angular coefficient and factor one half are preserved; no risk conclusion is
assumed and no physical deadline is recomputed from the analytic prefix. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open FinitePhase FiniteDirections PrimitiveLines

theorem long_prefix_mean_le_original_deadline_risk {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (threshold : ℝ) (k : ℕ) (hk : k≤J)
    (hT : (s.prefix k hk).total=scheduleProcessDeadline s mask p) :
    (∑z : Grid n,longBirthPrice (s.prefix k hk) (prefixMask hk mask) Γ p threshold z)≤
      timePairRisk Finset.univ s.lo s.hi mask p (scheduleProcessDeadline s mask p) := by
  have hh := longBirthMean_le_normalizedPairSum (s.prefix k hk) (prefixMask hk mask)
    (prefixMask_bounds hk mask hm) Γ p threshold
  have he : (fun q=>(s.prefix k hk).cumulative (fun j=>prefixMask hk mask j q) (s.prefix k hk).total)=
      (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p)) := by
    funext q
    simpa only [prefixMask,hT] using s.prefix_cumulative_total k hk (fun j=>mask j q)
  rw [he] at hh
  simpa only [timePairRisk_eq_terminal,Schedule.cumulative] using hh

theorem long_prefix_mean_sieve_upper {J n : ℕ} {ι : Type*} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (threshold : ℝ) (k : ℕ) (hk : k≤J)
    (hT : (s.prefix k hk).total=scheduleProcessDeadline s mask p)
    (S : Finset ι) (R : ι→Rect) (c : Fin J→ZPoint→ι→ℝ) (V H : Finset ℝ)
    (hdom : ∀j q,mask j q≤maskedTypedBoardWeight S R (c j) V H q)
    (hsep : RectanglesSeparated S R) (hR : ∀i∈S,(R i).InUnitSquare)
    (hc : ∀j r i,i∈S→0≤c j r i ∧ c j r i≤1) (hN : ConcreteSieve.Q≤n) :
    (∑z : Grid n,longBirthPrice (s.prefix k hk) (prefixMask hk mask) Γ p threshold z)≤
      ((76/125 : ℝ)/24)*typedAngularIntegralSum S R
        (s.prefixWeights c (scheduleProcessDeadline s mask p)) V H p*Real.log n +
      ((4*S.card+1)*s.total)^2 + 5*s.total*((4*S.card+1)*s.total) + 10*s.total^2 +
      6*25586*(4*(S.card : ℝ)+3)*s.total^2 :=
  (long_prefix_mean_le_original_deadline_risk s mask hm Γ p threshold k hk hT).trans
    (s.dominated_inputDeadline_upper mask S R c V H (fun j q=>(hm j q).1) hdom p hsep hR hc hN)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.long_prefix_mean_le_original_deadline_risk
#print axioms NoThreeLine.BirthWitness.long_prefix_mean_sieve_upper
