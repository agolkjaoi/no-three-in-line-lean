import NoThreeLine.ScheduledWeightCapRisk
import NoThreeLine.ScheduledRiskTailSmall
import NoThreeLine.WeightCapThreshold

/-! Uniform smallness for each actual raw weight-cap event with B=n^d.
The deterministic root-deadline pair budget remains explicit. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase FiniteDirections FiniteWitnessMoments ShortStars

theorem exists_uniform_raw_weightCap_tail_threshold
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
        (scheduledRawWeightCapBefore cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 hn
          (augInitialState B hB (scheduleProcessDeadline s mask) 0) p J)<κ := by
  obtain ⟨N₁,hN₁2,hN₁⟩ := exists_uniform_actual_outsideRisk_tail_threshold Γ K T ξ ρ δ d γ ζ a r κ
    hξ hξ1 hd hγ hζ ha hr har hκ hK0 hK2 hρ1 hδ hδ1 hδρ hδK
  obtain ⟨N₂,hN₂2,hN₂⟩ := exists_weightCap_risk_threshold T (Γ.card*K/(2-K)) d r (hd.trans hγ) hrd
  refine ⟨max N₁ N₂,hN₁2.trans (le_max_left _ _),?_⟩
  intro n hnN
  dsimp only
  intro J s mask hmask M p k hk hp hdeadline hT hQ
  have hn₁ : N₁≤n := (le_max_left _ _).trans hnN
  have hn₂ : N₂≤n := (le_max_right _ _).trans hnN
  have hn2 : 2≤n := hN₁2.trans hn₁
  have hn : 0<n := by omega
  let B : ℝ := (n:ℝ)^d
  have hB : 1≤B := Real.one_le_rpow (by exact_mod_cast (show 1≤n by omega)) (hr.trans hrd).le
  let cs := scheduleSharedPhases s mask hmask Γ B K ρ
  have hΓ : ∀j,(cs j).directions=Γ := scheduleSharedPhases_directions s mask hmask Γ B K ρ
  have hKcs : ∀j,(cs j).K≤K := by
    intro j
    dsimp [cs,scheduleSharedPhases]
    split <;> exact le_rfl
  have hρcs : ∀j,ρ≤(cs j).rho := by
    intro j
    dsimp [cs,scheduleSharedPhases]
    split <;> exact le_rfl
  have hfull : phaseEndpoint cs 0 J≤T := (scheduleSharedPhases_total s mask hmask Γ B K ρ).trans_le hT
  have hep : phaseEndpoint cs 0 k=(s.prefix k hk).total := scheduleSharedPhases_endpoint s mask hmask Γ B K ρ k hk
  have hroot : scheduleProcessDeadline s mask p≤T := by
    rw [←hdeadline,←hep]
    exact (phaseEndpoint_mono cs 0 hk).trans hfull
  have htail := hN₁ n hn₁ J s mask hmask B M hB p k hk le_rfl hp hdeadline hroot hQ
  have hcap := initial_scheduledRawWeightCap_point_measure_le cs ((n:ℝ)^(-ζ)) M K ρ T
    (scheduleProcessDeadline s mask) 0 hn hB Γ hΓ hKcs hρcs hK0 hK2 p p J J hfull
    (r*Real.log n) (hN₂ n hn₂)
  exact hcap.trans_lt htail

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.exists_uniform_raw_weightCap_tail_threshold
