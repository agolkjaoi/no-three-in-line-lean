import NoThreeLine.ScheduledEtaActualEvent
import NoThreeLine.ScheduledEtaSmall

/-! C3 for all actual continuous-or-raw eta contacts, without an active
observer gate. Time contacts are reduced pathwise to the actual endpoint. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Filter
open scoped BigOperators Topology

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness FiniteMomentIntegral

theorem anyActualEtaHit_pair_union {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ)
    (A : ℝ) (hA : 0≤A)
    (hpair : ∀a b : Grid n,a≠b→(boardClockMeasure n (B/n)).real
      {ω | ε≤scheduledPairPath cs ε M deadline start hn hB a b J ω}≤A) :
    (boardClockMeasure n (B/n)).real (anyActualEtaHit cs ε M deadline start hn hB J)≤(n:ℝ)^4*A := by
  classical
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  let E := fun a b : Grid n=>if a≠b then
    {ω | ε≤scheduledPairPath cs ε M deadline start hn hB a b J ω} else ∅
  have hsub : anyActualEtaHit cs ε M deadline start hn hB J≤ᵐ[μ] ⋃a,⋃b,E a b := by
    have ha := anyActualEtaHit_path_ae cs ε M deadline start hn hB J
    filter_upwards [ha] with ω hω
    intro hp
    obtain ⟨a,b,hab,hc⟩ := hω hp
    exact Set.mem_iUnion.mpr ⟨a,Set.mem_iUnion.mpr ⟨b,by simpa [E,hab] using hc⟩⟩
  have hb (a b : Grid n) : μ.real (E a b)≤A := by
    by_cases hab : a≠b
    · simpa only [E,if_pos hab] using hpair a b hab
    · simpa only [E,if_neg hab,measureReal_empty] using hA
  calc
    _ ≤ μ.real (⋃a,⋃b,E a b) := ENNReal.toReal_mono (measure_ne_top μ _) (measure_mono_ae hsub)
    _ ≤ ∑a : Grid n,μ.real (⋃b,E a b) := measureReal_iUnion_fintype_le _
    _ ≤ ∑a : Grid n,∑b : Grid n,μ.real (E a b) := Finset.sum_le_sum (fun a _=>measureReal_iUnion_fintype_le _)
    _ ≤ ∑_a : Grid n,∑_b : Grid n,A := Finset.sum_le_sum (fun a _=>Finset.sum_le_sum (fun b _=>hb a b))
    _ = _ := by simp only [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,Grid,Fintype.card_prod,Fintype.card_fin,Nat.cast_mul]; ring

theorem anyActualEtaHit_C3 (ξ : ℝ) (hξ : 0<ξ)
    (Γ : Finset ZPoint) (K δ T : ℝ) (hT : 0≤T) (m : ℕ) (hm : 2≤m) :
    ∃ Cm : ℝ,0<Cm ∧ ∀ (n : ℕ) (B : ℝ) (cs : ℕ→SharedPhase n B)
      (ε M : ℝ) (deadline : Grid n→ℝ) (start ρ : ℝ) (hn : 0<n) (hB : 1≤B),
      (∀j,(cs j).directions=Γ) → 0≤K → K<2 → (∀j,(cs j).K≤K) →
      (∀j,ρ≤(cs j).rho) → ρ≤1 → 0<δ → δ≤1 → δ≤ρ → δ≤(2-K)/2 →
      0<ε → ε≤1/2 → ∀J, phaseEndpoint cs start J-start≤T →
      (boardClockMeasure n (B/n)).real (anyActualEtaHit cs ε M deadline start hn hB J)≤
        (n:ℝ)^4*(T^m*Cm*(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ)*B^(m-1)/ε^m) := by
  obtain ⟨Cm,hCm,hMoment⟩ := initial_scheduledPairPath_moment ξ hξ Γ K δ T hT m hm
  refine ⟨Cm,hCm,?_⟩
  intro n B cs ε M deadline start ρ hn hB hΓ hK0 hK2 hK hρ hρ1
    hδ hδ1 hδρ hδK hε0 hε J htotal
  have hA : 0≤T^m*Cm*(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ)*B^(m-1)/ε^m :=
    div_nonneg (mul_nonneg (mul_nonneg (mul_nonneg (pow_nonneg hT m) hCm.le)
      (Real.rpow_nonneg (Nat.cast_nonneg n) _)) (pow_nonneg (zero_le_one.trans hB) _))
      (pow_nonneg hε0.le m)
  apply anyActualEtaHit_pair_union cs ε M deadline start hn hB J _ hA
  intro a b hab
  exact (scheduledPairPath_tail_le_moment cs ε M deadline start hn hB a b J m ε hε0).trans
    (div_le_div_of_nonneg_right (hMoment n B cs ε M deadline start ρ a b hab hn hB hΓ
      hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0.le hε J htotal) (pow_nonneg hε0.le m))

theorem anyActualEtaHit_uniform_polynomial_tail
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
          (anyActualEtaHit cs ((n:ℝ)^(-ζ)) M deadline start hn hB J)≤(n:ℝ)^(-r) := by
  obtain ⟨m,hm,hexp⟩ := exists_C3_degree d ξ ζ r hgap
  obtain ⟨Cm,hCm,hC3⟩ := anyActualEtaHit_C3 ξ hξ Γ K δ T hT m hm
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

#print axioms NoThreeLine.PairWitness.anyActualEtaHit_pair_union
#print axioms NoThreeLine.PairWitness.anyActualEtaHit_C3
#print axioms NoThreeLine.PairWitness.anyActualEtaHit_uniform_polynomial_tail
