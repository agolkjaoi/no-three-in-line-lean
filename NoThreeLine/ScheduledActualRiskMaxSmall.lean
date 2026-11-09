import NoThreeLine.ScheduledActualRiskCrossing
import NoThreeLine.ScheduledRiskTailSmall

/-! Actual risk crossing probability, uniform over all physical cut times
for each root, under the original full-schedule point law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase FiniteDirections FiniteWitnessMoments

theorem exists_uniform_actual_outsideRisk_crossing_threshold
    (Γ : Finset ZPoint) (K T ξ ρ δ d γ ζ a r κ : ℝ) (hξ : 0<ξ)
    (hξ1 : ξ<1) (hd : d<γ) (hγ : γ<1) (hζ : 0<ζ)
    (ha : 0≤a) (hr : 0<r) (har : a<r) (hκ : 0<κ)
    (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2) :
    ∃N : ℕ, ∃hN2 : 2≤N, ∀n (hnN : N≤n), ∀(J : ℕ) (s : Schedule J)
      (mask : Fin J→Grid n→ℝ) (hmask : ∀j q,0≤mask j q ∧ mask j q≤1)
      (B M : ℝ) (hB : 1≤B) (p : Grid n) (k : ℕ) (hk : k≤J),
      B≤(n:ℝ)^d →
      ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active →
      (s.prefix k hk).total=scheduleProcessDeadline s mask p → scheduleProcessDeadline s mask p≤T →
      normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p))≤a*Real.log n →
      let hn : 0<n := by omega
      let cs := scheduleSharedPhases s mask hmask Γ B K ρ
      (phasePointMeasure cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 hn hB p J).real
        (scheduledActualRiskCrossing cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0
          hn hB Γ p J (r*Real.log n))<κ := by
  obtain ⟨N,hN2,hN⟩ := exists_uniform_actual_outsideRisk_tail_threshold
    Γ K T ξ ρ δ d γ ζ a r κ hξ hξ1 hd hγ hζ ha hr har hκ
    hK0 hK2 hρ1 hδ hδ1 hδρ hδK
  refine ⟨N,hN2,?_⟩
  intro n hnN J s mask hmask B M hB p k hk hBd hp hdeadline hT hQ
  have hn : 0<n := by omega
  let cs := scheduleSharedPhases s mask hmask Γ B K ρ
  let μ := phasePointMeasure cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs _ M
    (scheduleProcessDeadline s mask) 0 hn hB p J
  exact (scheduledActualRiskCrossing_measure_le cs ((n:ℝ)^(-ζ)) M
    (scheduleProcessDeadline s mask) 0 hn hB Γ p J (r*Real.log n) μ).trans_lt
      (hN n hnN J s mask hmask B M hB p k hk hBd hp hdeadline hT hQ)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.exists_uniform_actual_outsideRisk_crossing_threshold
