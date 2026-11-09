import NoThreeLine.EtaC3Decay

/-! Fixed-degree polynomial decay for the actual raw eta retirement
cause. The common finite horizon and all actual guard hypotheses remain. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Filter
open scoped Topology

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness

theorem anyRawEtaCause_uniform_polynomial_tail
    (Γ : Finset ZPoint) (K ρ δ T ξ d ζ r : ℝ)
    (hT : 0≤T) (hξ : 0<ξ) (hζ : 0<ζ) (hgap : 0<1-d-2*ξ-ζ)
    (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2) :
    ∃m : ℕ, 2≤m ∧ ∃N : ℕ, 1≤N ∧
      ∀n≥N, ∀(B M : ℝ) (cs : ℕ→SharedPhase n B) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (J : ℕ),
        B≤(n:ℝ)^d → (∀j,(cs j).directions=Γ) → (∀j,(cs j).K≤K) →
        (∀j,ρ≤(cs j).rho) → phaseEndpoint cs start J-start≤T →
        (boardClockMeasure n (B/n)).real
          (anyRawEtaCause cs ((n:ℝ)^(-ζ)) M deadline start hn hB J)≤(n:ℝ)^(-r) := by
  obtain ⟨m,hm,hexp⟩ := exists_C3_degree d ξ ζ r hgap
  obtain ⟨Cm,hCm,hC3⟩ := anyRawEtaCause_C3 ξ hξ Γ K δ T hT m hm
  have hεlim : Tendsto (fun n : ℕ=>(n:ℝ)^(-ζ)) atTop (𝓝 0) :=
    (tendsto_rpow_neg_atTop hζ).comp (tendsto_natCast_atTop_atTop (R:=ℝ))
  have hεevt : ∀ᶠn : ℕ in atTop,(n:ℝ)^(-ζ)≤1/2 :=
    (hεlim.eventually (gt_mem_nhds (show (0:ℝ)<1/2 by norm_num))).mono (fun _ h=>h.le)
  obtain ⟨N,hN⟩ := eventually_atTop.mp
    ((C3_power_eventually_le (T^m*Cm) d ξ ζ r m hexp).and hεevt)
  refine ⟨m,hm,max N 1,le_max_right _ _,?_⟩
  intro n hnN B M cs deadline start hn hB J hBd hΓ hK hρ htotal
  have ht := hN n ((le_max_left N 1).trans hnN)
  have hN0 : 0<(n:ℝ) := by exact_mod_cast hn
  have hA : 0≤T^m*Cm := mul_nonneg (pow_nonneg hT m) hCm.le
  have hbound := hC3 n B cs ((n:ℝ)^(-ζ)) M deadline start ρ hn hB hΓ hK0 hK2 hK hρ hρ1
    hδ hδ1 hδρ hδK (Real.rpow_pos_of_pos hN0 _) ht.2 J htotal
  exact hbound.trans ((scalar_C3_power_le (T^m*Cm) B d ξ ζ (by omega : 1≤n)
    (by omega : 1≤m) hA (zero_le_one.trans hB) hBd).trans ht.1)

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.anyRawEtaCause_uniform_polynomial_tail
