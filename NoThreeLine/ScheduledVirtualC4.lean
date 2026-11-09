import NoThreeLine.VirtualMomentGeometry

/-! C4 at deterministic actual scheduled cuts. The constant is chosen
before the board size, schedule and line, for a fixed degree and parameters.
This does not assert any first-hit or all-time maximum probability bound. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness

def momentConstant (Γ : Finset ZPoint) (K δ T ξ : ℝ) (hξ : 0 < ξ) (m : ℕ) : ℝ :=
  degreeConstant Γ K δ (geometryConstant ξ hξ) T m

theorem momentConstant_pos (Γ : Finset ZPoint) (K δ T ξ : ℝ) (hξ : 0 < ξ)
    (hδ : 0 < δ) (hT : 0 ≤ T) (m : ℕ) : 0 < momentConstant Γ K δ T ξ hξ m :=
  degreeConstant_pos Γ K δ _ T hδ (geometryConstant_pos ξ hξ).le hT m

theorem initial_scheduledCutBoard_virtual_C4 {n m : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ T ξ : ℝ)
    (hξ : 0 < ξ) (q : Grid n) (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (L : LineIndex n) (hqL : q ∉ L.val) (hm : 0 < m)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK0 : 0 ≤ K) (hK2 : K < 2)
    (hK : ∀ j, (cs j).K ≤ K) (hρ : ∀ j, ρ ≤ (cs j).rho) (hρ1 : ρ ≤ 1)
    (hδ : 0 < δ) (hδ1 : δ ≤ 1) (hδρ : δ ≤ ρ) (hδK : δ ≤ (2-K)/2)
    (hε0 : 0 ≤ ε) (hε : ε ≤ 1/2) (k : ℕ) (t : ℝ) (ht : t ∈ Icc (0:ℝ) (cs k).horizon)
    (hT : phaseEndpoint cs start k-start+t ≤ T) :
    (∫ ω, let e := (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
      virtualMass e.process Γ e.coordinates L q ^ m
      ∂boardClockMeasure n (B/n)) ≤
      momentConstant Γ K δ T ξ hξ m *
        ∑ a ∈ Finset.Icc 1 m, B^(m-a) * (n : ℝ)^((a : ℝ)*ξ) := by
  apply (initial_scheduledCutBoard_virtual_finite_bound cs ε M deadline start K ρ δ q hn hB Γ L hqL hm
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht).trans
  exact scalar_candidate_moment_le Γ K δ (geometryConstant ξ hξ) T B
    (phaseEndpoint cs start k-start+t) ((candidates L q).card : ℝ) ξ hn hδ
    (geometryConstant_pos ξ hξ).le (zero_le_one.trans hB)
    (scheduled_elapsed_nonneg cs start k t ht.1) hT (Nat.cast_nonneg _)
    (candidates_le_geometryConstant ξ hξ L q hqL)

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.momentConstant_pos
#print axioms NoThreeLine.VirtualWitness.initial_scheduledCutBoard_virtual_C4
