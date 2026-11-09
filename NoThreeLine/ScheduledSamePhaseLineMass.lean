import NoThreeLine.ActiveLineMassIntegral
import NoThreeLine.ScheduledFutureTwoLeaf

/-! Actual same-phase C10 line-mass comparison under one full terminal point
law. Summing two-label leaves retains the active-root gate and costs only
one eta factor, independently of the number of leaves on the line. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem scheduled_same_phase_lineMass_le_ae_times {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (j k : ℕ) (hK : (cs j).config.K < 2)
    (L : LineIndex n) (hL : ¬specified (cs j).directions L) (p : Grid n) (hpL : p ∈ L.val)
    (hε0 : 0 ≤ ε) (hε : ε < 1)
    (F : ℝ → TimedObservation (cs j).config → ℝ) (hF : ∀ u, Measurable (F u))
    (A : ℝ) (hFA : ∀ u x, 0 ≤ F u x ∧ F u x ≤ A) :
    ∀ᵐ v : ℝ ∂volume, ∀ᵐ u : ℝ ∂volume, v ∈ Ioo 0 ((cs j).horizon : ℝ) → u ∈ Ioo 0 v →
    (∫ ω, observedActiveLineMass (cs j).config L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,v))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k)) ≤
    (∫ ω, observedActiveLineMass (cs j).config L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k))/(1-ε) := by
  classical
  have hq (q : Grid n) := scheduled_future_two_leaf_le_ae_times cs ε M deadline start hn hB j k
    (unitBirthRetention n) {p,q} {p,q} (Finset.Subset.refl _) hK p (by simp) hε0 hε F hF A hFA
  have hall := ae_all_iff.mpr hq
  filter_upwards [hall] with v hv
  filter_upwards [ae_all_iff.mpr hv] with u hu hvI huI
  let μ := phasePointMeasure cs ε M deadline start hn hB p (j+1+k)
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p (j+1+k)
  let V := fun t ω => scheduledCutObservation cs ε M deadline start hn
    (initialGoodPhaseObservation B hB deadline start) j (ω,t)
  have hV (t : ℝ) : Measurable (V t) :=
    (scheduledCutObservation_measurable cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) j).comp (measurable_id.prodMk measurable_const)
  let G := fun ω => F u (V u ω)
  have hG : Measurable G := (hF u).comp (hV u)
  have hGA (ω : BoardClockPath n) : 0 ≤ G ω ∧ G ω ≤ A := hFA u (V u ω)
  change (∫ ω, observedActiveLineMass (cs j).config L p (V v ω)*G ω ∂μ) ≤
    (∫ ω, observedActiveLineMass (cs j).config L p (V u ω)*G ω ∂μ)/(1-ε)
  rw [observedActiveLineMass_mul_integral_eq_sum μ (cs j).config L hL p hpL (V v) (hV v) G hG A hGA,
    observedActiveLineMass_mul_integral_eq_sum μ (cs j).config L hL p hpL (V u) (hV u) G hG A hGA,
    Finset.sum_div]
  apply Finset.sum_le_sum
  intro q hqL
  have hcard : ({p,q} : Finset (Grid n)).card = 2 :=
    Finset.card_pair (Ne.symm (Finset.ne_of_mem_erase hqL))
  have hpair : (∫ ω, observedRootLeaf (cs j).config {p,q} p (V v ω)*G ω ∂μ) ≤
      (∫ ω, observedCorrectedRootLeaf (cs j).config {p,q} {p,q} p (V u ω)*G ω ∂μ)/(1-ε) := by
    simpa only [hcard,Nat.choose_self,pow_one] using hu q hvI huI
  exact hpair.trans (div_le_div_of_nonneg_right
    (observedCorrectedRootLeaf_mul_integral_le μ (cs j).config {p,q} {p,q} p (V u) (hV u) G hG A hGA)
    (sub_nonneg.mpr hε.le))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduled_same_phase_lineMass_le_ae_times
