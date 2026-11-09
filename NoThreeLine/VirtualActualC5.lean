import NoThreeLine.VirtualActualHitUnion
import NoThreeLine.VirtualC5Decay

/-! C5 polynomial tails for actual continuous-or-raw virtual hits on the
original board law. Degree and cutoff precede all board and schedule data.
The time bound is the full physical elapsed horizon, not a root deadline. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Filter
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness SpecifiedBoardCount

def hitTailConstant (Γ : Finset ZPoint) (K δ T ξ : ℝ) (hξ : 0<ξ) (m : ℕ) : ℝ :=
  (lineCountConstant Γ : ℝ)*momentConstant Γ K δ T ξ hξ m

theorem anyActualVirtualHit_power_tail {n m : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε : ℝ) (deadline : Grid n → ℝ) (start K ρ δ T ξ d γ : ℝ)
    (hξ : 0<ξ) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (hm : 0<m)
    (hBd : B≤(n:ℝ)^d) (hξd : ξ≤d)
    (hΓ : ∀ j, (cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀ j, (cs j).K≤K) (hρ : ∀ j, ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε≤1/2) (J : ℕ) (hT : phaseEndpoint cs start J-start≤T) :
    (boardClockMeasure n (B/n)).real
      (anyActualVirtualHit cs ε ((n:ℝ)^γ) deadline start hn hB J) ≤
      hitTailConstant Γ K δ T ξ hξ m*(m:ℝ)*(n:ℝ)^(3-(m:ℝ)*(γ-d)) := by
  have hT0 : 0≤T := (show 0≤phaseEndpoint cs start J-start by
    simpa only [add_zero] using scheduled_elapsed_nonneg cs start J 0 le_rfl).trans hT
  have hC : 0≤hitTailConstant Γ K δ T ξ hξ m :=
    mul_nonneg (Nat.cast_nonneg _) (momentConstant_pos Γ K δ T ξ hξ hδ hT0 m).le
  apply (anyActualVirtualHit_C4_tail cs ε ((n:ℝ)^γ) deadline start K ρ δ T ξ hξ hn hB Γ hm
    (Real.rpow_pos_of_pos (by exact_mod_cast hn) _) hΓ hK0 hK2 hK hρ hρ1
    hδ hδ1 hδρ hδK hε0 hε J hT).trans
  have he := scalar_C5_power_le (hitTailConstant Γ K δ T ξ hξ m) B d γ ξ
    (show 1≤n by omega) hC (zero_le_one.trans hB) hBd hξd (m:=m)
  calc
    _ = hitTailConstant Γ K δ T ξ hξ m*(n:ℝ)^3*
        (∑ a ∈ Finset.Icc 1 m, B^(m-a)*(n:ℝ)^((a:ℝ)*ξ)) / ((n:ℝ)^γ)^m := by
      unfold hitTailConstant
      ring
    _ ≤ _ := he

theorem anyActualVirtualHit_uniform_polynomial_tail
    (Γ : Finset ZPoint) (K ρ δ T ξ d γ r : ℝ) (hξ : 0<ξ) (hξd : ξ<d) (hdγ : d<γ)
    (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2) :
    ∃ m : ℕ, 0<m ∧ ∃ N : ℕ, 1≤N ∧
      ∀ n≥N, ∀ (B ε : ℝ) (cs : ℕ → SharedPhase n B)
        (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ),
        B≤(n:ℝ)^d → (∀ j, (cs j).directions=Γ) → (∀ j, (cs j).K≤K) →
        (∀ j, ρ≤(cs j).rho) → 0≤ε → ε≤1/2 → phaseEndpoint cs start J-start≤T →
        (boardClockMeasure n (B/n)).real
          (anyActualVirtualHit cs ε ((n:ℝ)^γ) deadline start hn hB J) ≤ (n:ℝ)^(-r) := by
  obtain ⟨m,hm,hexp⟩ := exists_C5_degree d γ r hdγ
  obtain ⟨N,hN⟩ := eventually_atTop.mp
    (C5_power_eventually_le (hitTailConstant Γ K δ T ξ hξ m) d γ r m hexp)
  refine ⟨m,hm,max N 1,le_max_right _ _,?_⟩
  intro n hnN B ε cs deadline start hn hB J hBd hΓ hK hρ hε0 hε hT
  exact (anyActualVirtualHit_power_tail cs ε deadline start K ρ δ T ξ d γ hξ hn hB Γ hm
    hBd hξd.le hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε J hT).trans
    (hN n ((le_max_left N 1).trans hnN))

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.anyActualVirtualHit_power_tail
#print axioms NoThreeLine.VirtualWitness.anyActualVirtualHit_uniform_polynomial_tail
