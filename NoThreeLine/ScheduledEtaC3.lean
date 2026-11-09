import NoThreeLine.ScheduledEtaTail

/-! C3 for the actual scheduled raw eta cause: actual C2, time integration,
Markov, and the finite n^4 pair union, with no core moment hypothesis. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness

theorem anyRawEtaCause_C3 (ξ : ℝ) (hξ : 0<ξ)
    (Γ : Finset ZPoint) (K δ T : ℝ) (hT : 0≤T) (m : ℕ) (hm : 2≤m) :
    ∃ Cm : ℝ,0<Cm ∧ ∀ (n : ℕ) (B : ℝ) (cs : ℕ→SharedPhase n B)
      (ε M : ℝ) (deadline : Grid n→ℝ) (start ρ : ℝ) (hn : 0<n) (hB : 1≤B),
      (∀j,(cs j).directions=Γ) → 0≤K → K<2 → (∀j,(cs j).K≤K) →
      (∀j,ρ≤(cs j).rho) → ρ≤1 → 0<δ → δ≤1 → δ≤ρ → δ≤(2-K)/2 →
      0<ε → ε≤1/2 → ∀J, phaseEndpoint cs start J-start≤T →
      (boardClockMeasure n (B/n)).real (anyRawEtaCause cs ε M deadline start hn hB J)≤
        (n:ℝ)^4*(T^m*Cm*(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ)*B^(m-1)/ε^m) := by
  obtain ⟨Cm,hCm,hMoment⟩ := initial_scheduledPairPath_moment ξ hξ Γ K δ T hT m hm
  refine ⟨Cm,hCm,?_⟩
  intro n B cs ε M deadline start ρ hn hB hΓ hK0 hK2 hK hρ hρ1
    hδ hδ1 hδρ hδK hε0 hε J htotal
  have hA : 0≤T^m*Cm*(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ)*B^(m-1)/ε^m :=
    div_nonneg (mul_nonneg (mul_nonneg (mul_nonneg (pow_nonneg hT m) hCm.le)
      (Real.rpow_nonneg (Nat.cast_nonneg n) _)) (pow_nonneg (zero_le_one.trans hB) _))
      (pow_nonneg hε0.le m)
  apply anyRawEtaCause_pair_union cs ε M deadline start hn hB J _ hA
  intro a b hab
  exact (scheduledPairPath_tail_le_moment cs ε M deadline start hn hB a b J m ε hε0).trans
    (div_le_div_of_nonneg_right (hMoment n B cs ε M deadline start ρ a b hab hn hB hΓ
      hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0.le hε J htotal) (pow_nonneg hε0.le m))

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.anyRawEtaCause_C3
