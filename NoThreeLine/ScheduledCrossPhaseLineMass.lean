import NoThreeLine.ActiveLineMassIntegral
import NoThreeLine.ScheduledCrossPhaseFutureLeaf

/-! Aggregate actual two-label cross-phase leaves on a non-specified root
line. Both sides use the same full terminal point law and only one eta
factor is lost. The time a.e. order remains old time, then future time. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem scheduled_cross_phase_lineMass_le_ae_times {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2) (j k r : ℕ)
    (L : LineIndex n) (hL : ¬specified Γ L) (p : Grid n) (hpL : p ∈ L.val)
    (hε0 : 0 ≤ ε) (hε : ε < 1)
    (F : ℝ → TimedObservation (cs j).config → ℝ) (hF : ∀ u, Measurable (F u))
    (A : ℝ) (hFA : ∀ u x, 0 ≤ F u x ∧ F u x ≤ A) :
    ∀ᵐ u : ℝ ∂volume, ∀ᵐ v : ℝ ∂volume, u ∈ Ioo 0 ((cs j).horizon : ℝ) →
      v ∈ Ioo 0 ((cs (j+1+k)).horizon : ℝ) →
    (∫ ω, observedActiveLineMass (cs (j+1+k)).config L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) (j+1+k) (ω,v))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r)) ≤
    (∫ ω, observedActiveLineMass (cs j).config L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r))/(1-ε) := by
  classical
  have hq (q : Grid n) := scheduled_cross_phase_future_leaf_le_ae_times cs ε M deadline start hn hB Γ
    (unitBirthRetention n) {p,q} {p,q} (Finset.Subset.refl _) hΓ hK j k r p (by simp) hε0 hε F hF A hFA
  have hall := ae_all_iff.mpr hq
  filter_upwards [hall] with u hu
  filter_upwards [ae_all_iff.mpr hu] with v hv huI hvI
  let μ := phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r)
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p (j+1+k+1+r)
  let s := initialGoodPhaseObservation B hB deadline start
  let U := fun t ω => scheduledCutObservation cs ε M deadline start hn s j (ω,t)
  let V := fun t ω => scheduledCutObservation cs ε M deadline start hn s (j+1+k) (ω,t)
  have hU (t : ℝ) : Measurable (U t) :=
    (scheduledCutObservation_measurable cs ε M deadline start hn s j).comp (measurable_id.prodMk measurable_const)
  have hV (t : ℝ) : Measurable (V t) :=
    (scheduledCutObservation_measurable cs ε M deadline start hn s (j+1+k)).comp (measurable_id.prodMk measurable_const)
  let G := fun ω => F u (U u ω)
  have hG : Measurable G := (hF u).comp (hU u)
  have hGA (ω : BoardClockPath n) : 0 ≤ G ω ∧ G ω ≤ A := hFA u (U u ω)
  have hLj : ¬specified (cs j).config.directions L := by simpa only [SharedPhase.config,hΓ j] using hL
  have hLk : ¬specified (cs (j+1+k)).config.directions L := by simpa only [SharedPhase.config,hΓ (j+1+k)] using hL
  change (∫ ω, observedActiveLineMass (cs (j+1+k)).config L p (V v ω)*G ω ∂μ) ≤
    (∫ ω, observedActiveLineMass (cs j).config L p (U u ω)*G ω ∂μ)/(1-ε)
  rw [observedActiveLineMass_mul_integral_eq_sum μ (cs (j+1+k)).config L hLk p hpL (V v) (hV v) G hG A hGA,
    observedActiveLineMass_mul_integral_eq_sum μ (cs j).config L hLj p hpL (U u) (hU u) G hG A hGA,
    Finset.sum_div]
  apply Finset.sum_le_sum
  intro q hqL
  have hcard : ({p,q} : Finset (Grid n)).card = 2 :=
    Finset.card_pair (Ne.symm (Finset.ne_of_mem_erase hqL))
  have hpair : (∫ ω, observedRootLeaf (cs (j+1+k)).config {p,q} p (V v ω)*G ω ∂μ) ≤
      (∫ ω, observedCorrectedRootLeaf (cs j).config {p,q} {p,q} p (U u ω)*G ω ∂μ)/(1-ε) := by
    simpa only [hcard,Nat.choose_self,pow_one] using hv q huI hvI
  exact hpair.trans (div_le_div_of_nonneg_right
    (observedCorrectedRootLeaf_mul_integral_le μ (cs j).config {p,q} {p,q} p (U u) (hU u) G hG A hGA)
    (sub_nonneg.mpr hε.le))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduled_cross_phase_lineMass_le_ae_times
