import NoThreeLine.JointTailThreshold

/-! Uniform smallness for the actual saved-long plus prefix-late tail,
conditional only on an explicit deterministic deadline pair-budget bound.
The board threshold precedes all schedules, roots, masks and thresholds. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase FiniteDirections FiniteWitnessMoments ShortStars

theorem exists_uniform_savedLong_prefixLate_tail_threshold
    (Γ : Finset ZPoint) (K T ξ ρ δ d γ ζ a r κ : ℝ) (hξ : 0<ξ)
    (hξ1 : ξ<1) (hd : d<γ) (hγ : γ<1) (hζ : 0<ζ)
    (ha : 0≤a) (hr : 0<r) (har : a<r) (hκ : 0<κ)
    (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2) :
    ∃N : ℕ, ∃hN2 : 2≤N, ∀n (hnN : N≤n), ∀(J : ℕ) (s : Schedule J)
      (mask : Fin J→Grid n→ℝ) (hmask : ∀j q,0≤mask j q ∧ mask j q≤1)
      (B M : ℝ) (hB : 1≤B) (p : Grid n) (H : ℝ) (k : ℕ) (hk : k≤J),
      0≤H → H≤B*(1+Real.log n) → B≤(n:ℝ)^d →
      ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active →
      (s.prefix k hk).total=scheduleProcessDeadline s mask p → scheduleProcessDeadline s mask p≤T →
      normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p))≤a*Real.log n →
      let hn : 0<n := by omega
      let cs := scheduleSharedPhases s mask hmask Γ B K ρ
      let e := longWitnessRetention (s.prefix k hk) (prefixMask hk mask) (prefixMask_bounds hk mask hmask) Γ p H
      let w := longWitnessWeight (s.prefix k hk) Γ p H
      (phasePointMeasure cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 hn hB p J).real
        {ω | r*Real.log n≤witnessSum w (initialRootPhaseWitness cs ((n:ℝ)^(-ζ)) M
            (scheduleProcessDeadline s mask) 0 p hn hB e J ω)+
          scheduledStarCanonicalLatePath cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0
            hn hB Γ p H ((n:ℝ)^(γ-1)) k ω}<κ := by
  obtain ⟨m,N,hm,hN2,hN⟩ := exists_fixed_joint_moment_tail_threshold Γ K T ξ hξ
    δ d γ ζ a r κ hξ1 hd hγ hζ ha hr har hκ
  refine ⟨N,hN2,?_⟩
  intro n hnN J s mask hmask B M hB p H k hk hH hHlog hBd hp hdeadline hT hQ
  have hn : 2≤n := hN2.trans hnN
  have htail := longSaved_add_prefixLate_log_tail ξ hξ s mask hmask Γ B K ρ δ d γ ζ T M p H
    hn hB hH hK0 hK2 hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ hp k hk hdeadline hT m hm r hr
  have hQ0 : 0≤normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p)) :=
    normalizedPairSum_nonneg p _ (fun q=>(s.cumulative_bounds _ (fun j=>hmask j q) _
      (s.deadline_nonneg (fun j=>mask j p))).1)
  exact htail.trans_lt (hN n hnN _ (div_nonneg hQ0 (log_nat_pos hn).le)
    ((div_le_iff₀ (log_nat_pos hn)).mpr hQ))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.exists_uniform_savedLong_prefixLate_tail_threshold
