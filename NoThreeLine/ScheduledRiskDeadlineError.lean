import NoThreeLine.ScheduledRiskUpperTail
import NoThreeLine.RootDeadlineStability

/-! The explicit additive error stopped at a root-deadline phase prefix
is small under the original full-J point law. The already proved equality
of these two point measures is used; auxiliary intensities after the
deadline are not asserted to vanish. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem exists_uniform_deadlinePrefixRiskError_mean_threshold (T δ γ ζ ρ κ : ℝ)
    (hδ : δ<1) (hγ : γ<1) (hζ : 0<ζ) (hρ : 0<ρ) (hκ : 0<κ) :
    ∃N : ℕ,2≤N ∧ ∀n : ℕ,N≤n →
      ∀(B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (k J : ℕ),
        k≤J → deadline p≤phaseEndpoint cs start k →
        (∀j,(cs j).directions=Γ) → (∀j,(cs j).K<2) → phaseEndpoint cs 0 k≤T → B≤(n:ℝ)^δ →
        (∫ω,scheduledRiskErrorPath cs ((n:ℝ)^(-ζ)) M deadline start ρ hn hB Γ p k
          (Real.log n) ((n:ℝ)^(γ-1)) ω
          ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J)/Real.log n<κ := by
  obtain ⟨N,hN,hh⟩ := exists_uniform_scheduledRiskError_mean_threshold T δ γ ζ ρ κ hδ hγ hζ hρ hκ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p k J hkJ hp hΓ hK hT hBn
  rw [phasePointMeasure_deadline_stable cs ((n:ℝ)^(-ζ)) M deadline start p hn hB k J hkJ hp]
  exact hh n hNn B cs M deadline start hn hB Γ p k hΓ hK hT hBn

theorem exists_uniform_deadlinePrefixRiskError_tail_threshold (T δ γ ζ ρ a κ : ℝ)
    (hδ : δ<1) (hγ : γ<1) (hζ : 0<ζ) (hρ : 0<ρ) (ha : 0<a) (hκ : 0<κ) :
    ∃N : ℕ,2≤N ∧ ∀n : ℕ,N≤n →
      ∀(B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (k J : ℕ),
        k≤J → deadline p≤phaseEndpoint cs start k →
        (∀j,(cs j).directions=Γ) → (∀j,(cs j).K<2) → phaseEndpoint cs 0 k≤T → B≤(n:ℝ)^δ →
        (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J).real
          {ω | a*Real.log n≤scheduledRiskErrorPath cs ((n:ℝ)^(-ζ)) M deadline start ρ hn hB Γ p k
            (Real.log n) ((n:ℝ)^(γ-1)) ω}<κ := by
  obtain ⟨N,hN,hh⟩ := exists_uniform_scheduledRiskError_tail_threshold T δ γ ζ ρ a κ hδ hγ hζ hρ ha hκ
  refine ⟨N,hN,?_⟩
  intro n hNn B cs M deadline start hn hB Γ p k J hkJ hp hΓ hK hT hBn
  rw [phasePointMeasure_deadline_stable cs ((n:ℝ)^(-ζ)) M deadline start p hn hB k J hkJ hp]
  exact hh n hNn B cs M deadline start hn hB Γ p k hΓ hK hT hBn

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.exists_uniform_deadlinePrefixRiskError_mean_threshold
#print axioms NoThreeLine.BirthWitness.exists_uniform_deadlinePrefixRiskError_tail_threshold
