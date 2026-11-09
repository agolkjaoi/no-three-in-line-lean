import NoThreeLine.ScheduledWeightCapTailSmall
import NoThreeLine.ScheduledContinuousWeightHit

/-! Uniform smallness for actual continuous-or-raw weight-cap events with B=n^d.
The deterministic root-deadline pair budget remains explicit. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase FiniteDirections FiniteWitnessMoments ShortStars

theorem exists_uniform_actual_weightCap_tail_threshold
    (Γ : Finset ZPoint) (K T ξ ρ δ d γ ζ a r κ : ℝ) (hξ : 0<ξ)
    (hξ1 : ξ<1) (hd : d<γ) (hγ : γ<1) (hζ : 0<ζ)
    (ha : 0≤a) (hr : 0<r) (har : a<r) (hrd : r<d) (hκ : 0<κ)
    (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2) :
    ∃N : ℕ, ∃hN2 : 2≤N, ∀n (hnN : N≤n),
      let B : ℝ := (n:ℝ)^d
      let hB : 1≤B := Real.one_le_rpow (by exact_mod_cast (show 1≤n by omega)) (hr.trans hrd).le
      let hn : 0<n := by omega
      ∀(J : ℕ) (s : Schedule J) (mask : Fin J→Grid n→ℝ)
        (hmask : ∀j q,0≤mask j q ∧ mask j q≤1) (M : ℝ) (p : Grid n) (k : ℕ) (hk : k≤J),
      ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active →
      (s.prefix k hk).total=scheduleProcessDeadline s mask p → s.total≤T →
      normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p))≤a*Real.log n →
      let cs := scheduleSharedPhases s mask hmask Γ B K ρ
      (phasePointMeasure cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 hn hB p J).real
        (scheduledActualWeightCapBefore cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 hn
          (augInitialState B hB (scheduleProcessDeadline s mask) 0) p J)<κ := by
  obtain ⟨N,hN2,hN⟩ := exists_uniform_raw_weightCap_tail_threshold Γ K T ξ ρ δ d γ ζ a r κ
    hξ hξ1 hd hγ hζ ha hr har hrd hκ hK0 hK2 hρ1 hδ hδ1 hδρ hδK
  refine ⟨N,hN2,?_⟩
  intro n hnN
  dsimp only
  intro J s mask hmask M p k hk hp hdeadline hT hQ
  have hn : 0<n := by omega
  let B : ℝ := (n:ℝ)^d
  have hB : 1≤B := Real.one_le_rpow (by exact_mod_cast (show 1≤n by omega)) (hr.trans hrd).le
  let cs := scheduleSharedPhases s mask hmask Γ B K ρ
  letI := phasePointMeasure_probability cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 hn hB p J
  have he := initial_scheduledActualWeightCapBefore_measure_le_raw cs ((n:ℝ)^(-ζ)) M
    (scheduleProcessDeadline s mask) 0 hn hB p p J J
  have hrisk := ENNReal.toReal_mono (measure_ne_top _ _) he
  exact hrisk.trans_lt (hN n hnN J s mask hmask M p k hk hp hdeadline hT hQ)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.exists_uniform_actual_weightCap_tail_threshold
