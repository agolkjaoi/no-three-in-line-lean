import NoThreeLine.ScheduledPairHistoryMoment

/-! C2 for the actual eta pair-rate at every deterministic scheduled cut.
The finite history geometry, original board law, distinct witness prices,
and repeated physical cause cost are all supplied internally. This is not
yet an eta hitting-time bound or a uniform-in-time moment assertion. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness

theorem initial_scheduledCutBoard_pairRate_C2 (ξ : ℝ) (hξ : 0<ξ)
    (Γ : Finset ZPoint) (K δ T : ℝ) (hT : 0≤T) (m : ℕ) (hm : 0<m) :
    ∃ Cm : ℝ,0<Cm ∧ ∀ (n : ℕ) (B : ℝ) (cs : ℕ→SharedPhase n B)
      (ε M : ℝ) (deadline : Grid n→ℝ) (start ρ : ℝ) (a b : Grid n)
      (hab : a≠b) (hn : 0<n) (hB : 1≤B),
      (∀j,(cs j).directions=Γ) → 0≤K → K<2 → (∀j,(cs j).K≤K) →
      (∀j,ρ≤(cs j).rho) → ρ≤1 → 0<δ → δ≤1 → δ≤ρ → δ≤(2-K)/2 →
      0≤ε → ε≤1/2 → ∀ (k : ℕ) (t : ℝ), t∈Icc (0:ℝ) (cs k).horizon →
      phaseEndpoint cs start k-start+t≤T →
      (∫ω,(initialCutPairRate cs ε M deadline start hn hB k t a b ω)^m
        ∂boardClockMeasure n (B/n)) ≤ Cm*(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ)*B^(m-1) := by
  obtain ⟨C,hC,hprice⟩ := all_history_source_price_bound (2*ξ) (by positivity)
  let A := edgePriceConstant Γ C T m
  let Cm := causePriceCap Γ K δ m*A^m
  have hA : 0<A := edgePriceConstant_pos Γ C T m hC.le hT
  have hCm : 0<Cm := mul_pos (causePriceCap_pos Γ K δ m) (pow_pos hA m)
  refine ⟨Cm,hCm,?_⟩
  intro n B cs ε M deadline start ρ a b hab hn hB hΓ hK0 hK2 hK hρ hρ1
    hδ hδ1 hδρ hδK hε0 hε k t ht hτT
  have hb := initial_scheduledCutBoard_pairRate_history_bound cs ε M deadline start K ρ δ T a b
    hab hn hB hm Γ hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht hτT
  have hp := hprice n Γ a b T hT m
  have hN : (0:ℝ)<n := by exact_mod_cast hn
  have hc : 0≤B^(m-1)/(n:ℝ)^m := div_nonneg (pow_nonneg (zero_le_one.trans hB) _) (by positivity)
  have hr : (n:ℝ)^((m:ℝ)*(2*ξ))/(n:ℝ)^m=(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ) := by
    rw [←Real.rpow_natCast (n:ℝ) m,←Real.rpow_sub hN]
    congr 1
    ring
  apply hb.trans
  calc
    _ ≤ B^(m-1)/(n:ℝ)^m*(causePriceCap Γ K δ m*(A^m*(n:ℝ)^((m:ℝ)*(2*ξ)))) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hp (causePriceCap_pos Γ K δ m).le) hc
    _ = Cm*((n:ℝ)^((m:ℝ)*(2*ξ))/(n:ℝ)^m)*B^(m-1) := by dsimp [Cm]; ring
    _ = _ := by rw [hr]

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.initial_scheduledCutBoard_pairRate_C2
