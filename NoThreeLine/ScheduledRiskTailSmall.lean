import NoThreeLine.ScheduledRiskSavedMain
import NoThreeLine.JointSavedTailSmall

/-! Uniform tail smallness for the actual full-schedule outside risk.
The sole pair-budget input is the deterministic root-deadline quantity.
The threshold is uniform in schedules, masks, roots and phase counts. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase FiniteDirections FiniteWitnessMoments ShortStars

theorem exists_uniform_actual_outsideRisk_tail_threshold
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
        {ω | r*Real.log n≤scheduledOutsideRiskPath cs ((n:ℝ)^(-ζ)) M
          (scheduleProcessDeadline s mask) 0 hn hB Γ p J ω}<κ := by
  let b : ℝ := (a+r)/2
  have hb : 0<b := by dsimp [b]; linarith
  have hab : a<b := by dsimp [b]; linarith
  have hbr : 0<r-b := by dsimp [b]; linarith
  have hκ2 : 0<κ/2 := half_pos hκ
  have hρ : 0<ρ := lt_of_lt_of_le hδ hδρ
  obtain ⟨N₁,hN₁2,hN₁⟩ := exists_uniform_savedLong_prefixLate_tail_threshold
    Γ K T ξ ρ δ d γ ζ a b (κ/2) hξ hξ1 hd hγ hζ ha hb hab hκ2
    hK0 hK2 hρ1 hδ hδ1 hδρ hδK
  obtain ⟨N₂,hN₂2,hN₂⟩ := exists_uniform_deadlinePrefixRiskError_tail_threshold
    T d γ ζ ρ (r-b) (κ/2) (hd.trans hγ) hγ hζ hρ hbr hκ2
  refine ⟨max N₁ N₂,hN₁2.trans (Nat.le_max_left _ _),?_⟩
  intro n hnN J s mask hmask B M hB p k hk hBd hp hdeadline hT hQ
  have hn₁ : N₁≤n := (Nat.le_max_left _ _).trans hnN
  have hn₂ : N₂≤n := (Nat.le_max_right _ _).trans hnN
  have hn2 : 2≤n := hN₁2.trans hn₁
  have hn : 0<n := by omega
  have hB0 : 0≤B := by linarith
  have hlog : 0≤Real.log n := (log_nat_pos hn2).le
  let cs := scheduleSharedPhases s mask hmask Γ B K ρ
  have hep : phaseEndpoint cs 0 k=(s.prefix k hk).total :=
    scheduleSharedPhases_endpoint s mask hmask Γ B K ρ k hk
  have hΓ : ∀j,(cs j).directions=Γ := scheduleSharedPhases_directions s mask hmask Γ B K ρ
  have hKcs : ∀j,(cs j).K<2 := by
    intro j
    dsimp [cs,scheduleSharedPhases]
    split <;> exact hK2
  have hmain := hN₁ n hn₁ J s mask hmask B M hB p (B*Real.log n) k hk
    (mul_nonneg hB0 hlog) (by nlinarith) hBd hp hdeadline hT hQ
  have herr := hN₂ n hn₂ B cs M (scheduleProcessDeadline s mask) 0 hn hB Γ p k J hk
    (by rw [hep,hdeadline]) hΓ hKcs (by rw [hep,hdeadline]; exact hT) hBd
  have htail := scheduledOutsideRiskPath_tail_le_saved_main_error s mask hmask Γ B K ρ
    ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) p hn hB hρ hK2 k hk
    hdeadline.symm.le (Real.log n) ((n:ℝ)^(γ-1)) (b*Real.log n) ((r-b)*Real.log n)
  have hsplit : b*Real.log n+(r-b)*Real.log n=r*Real.log n := by ring
  dsimp only at htail hmain
  rw [hsplit] at htail
  exact htail.trans_lt (by linarith)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.exists_uniform_actual_outsideRisk_tail_threshold
