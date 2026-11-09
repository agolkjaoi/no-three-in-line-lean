import NoThreeLine.ScheduledEtaActualC3
import NoThreeLine.PointDensityCap

/-! Actual eta retirement causes under the same full-phase saved-credit
point law. Increase the board decay exponent by d before applying density B. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open BirthWitness PrimitiveLines PairWitness

theorem initial_etaCauseBefore_subset_actualHit {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (p : Grid n) (J : ℕ) :
    scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .eta J⊆
      anyActualEtaHit cs ε M deadline start hn hB J := by
  rintro ω ⟨N,hN,k,hd,_,a,b,hab,hη⟩
  exact ⟨N,hN,k,a,b,hab,Or.inl ⟨hd,hη⟩⟩

theorem initial_etaCause_point_le_board_hit {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (p q : Grid n) (J H : ℕ) :
    (phasePointMeasure cs ε M deadline start hn hB q H).real
      (scheduledBoundaryCauseBefore cs ε M deadline start hn (augInitialState B hB deadline start) p .eta J)≤
      B*(boardClockMeasure n (B/n)).real (anyActualEtaHit cs ε M deadline start hn hB J) := by
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  exact (phasePointMeasure_real_le_board cs ε M deadline start hn hB q H _
    (scheduledBoundaryCauseBefore_measurableSet cs ε M deadline start hn _ p .eta J)).trans
      (mul_le_mul_of_nonneg_left
        (measureReal_mono (initial_etaCauseBefore_subset_actualHit cs ε M deadline start hn hB p J))
        (zero_le_one.trans hB))

theorem etaCause_uniform_point_polynomial_tail
    (Γ : Finset ZPoint) (K ρ δ T ξ d ζ r : ℝ)
    (hT : 0≤T) (hξ : 0<ξ) (hζ : 0<ζ) (hgap : 0<1-d-2*ξ-ζ)
    (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2) :
    ∃m : ℕ,2≤m ∧ ∃N : ℕ,1≤N ∧
      ∀n≥N,∀(B M : ℝ) (cs : ℕ→SharedPhase n B) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (p q : Grid n) (J H : ℕ),
        B≤(n:ℝ)^d → (∀j,(cs j).directions=Γ) → (∀j,(cs j).K≤K) →
        (∀j,ρ≤(cs j).rho) → phaseEndpoint cs start J-start≤T →
        (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB q H).real
          (scheduledBoundaryCauseBefore cs ((n:ℝ)^(-ζ)) M deadline start hn
            (augInitialState B hB deadline start) p .eta J)≤(n:ℝ)^(-r) := by
  obtain ⟨m,hm,N,hN,hbound⟩ := anyActualEtaHit_uniform_polynomial_tail
    Γ K ρ δ T ξ d ζ (r+d) hT hξ hζ hgap hK0 hK2 hρ1 hδ hδ1 hδρ hδK
  refine ⟨m,hm,N,hN,?_⟩
  intro n hnN B M cs deadline start hn hB p q J H hBd hΓ hK hρ htotal
  have hn0 : (0:ℝ)<n := by exact_mod_cast hn
  have ht := hbound n hnN B M cs deadline start hn hB J hBd hΓ hK hρ htotal
  calc
    _ ≤ B*(boardClockMeasure n (B/n)).real
        (anyActualEtaHit cs ((n:ℝ)^(-ζ)) M deadline start hn hB J) :=
      initial_etaCause_point_le_board_hit cs ((n:ℝ)^(-ζ)) M deadline start hn hB p q J H
    _ ≤ B*(n:ℝ)^(-(r+d)) := mul_le_mul_of_nonneg_left ht (zero_le_one.trans hB)
    _ ≤ (n:ℝ)^d*(n:ℝ)^(-(r+d)) := mul_le_mul_of_nonneg_right hBd (Real.rpow_nonneg hn0.le _)
    _ = (n:ℝ)^(-r) := by rw [←Real.rpow_add hn0]; congr 1; ring

end NoThreeLine

#print axioms NoThreeLine.initial_etaCauseBefore_subset_actualHit
#print axioms NoThreeLine.etaCause_uniform_point_polynomial_tail
