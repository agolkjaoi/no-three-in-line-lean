import NoThreeLine.ScheduledSamePhaseCreditTriangle
import NoThreeLine.ScheduledCrossPhaseCreditRectangle

/-! Arbitrary original phase indices for the proved actual triangle and
rectangle comparisons, under the same prescribed full-J point measure. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem scheduled_same_phase_creditTriangle_bound_of_lt {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (N J : ℕ) (hNJ : N<J) (hK : (cs N).config.K<2)
    (L : LineIndex n) (hL : ¬specified (cs N).directions L) (p : Grid n) (hpL : p∈L.val)
    (hε0 : 0≤ε) (hε : ε<1) :
    (∫ω,scheduledCreditTrianglePath cs ε M deadline start hn hB L p N ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)≤
    (cs N).horizon/(1-ε)*(∫ω,scheduledCreditMassPath cs ε M deadline start hn hB L p N ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) := by
  have hJ : N+1+(J-(N+1))=J := by omega
  simpa only [hJ] using scheduled_same_phase_creditTriangle_bound cs ε M deadline start hn hB
    N (J-(N+1)) hK L hL p hpL hε0 hε

theorem scheduled_cross_phase_creditRectangle_bound_of_lt {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (j N J : ℕ) (hjN : j<N) (hNJ : N<J)
    (L : LineIndex n) (hL : ¬specified Γ L) (p : Grid n) (hpL : p∈L.val)
    (hε0 : 0≤ε) (hε : ε<1) :
    (∫ω,scheduledCreditRectanglePath cs ε M deadline start hn hB L p j N ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)≤
    (cs N).horizon/(1-ε)*(∫ω,scheduledCreditMassPath cs ε M deadline start hn hB L p j ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) := by
  have hN : j+1+(N-(j+1))=N := by omega
  have hJ : N+1+(J-(N+1))=J := by omega
  simpa only [hN,hJ] using scheduled_cross_phase_creditRectangle_bound cs ε M deadline start hn hB
    Γ hΓ hK j (N-(j+1)) (J-(N+1)) L hL p hpL hε0 hε

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduled_same_phase_creditTriangle_bound_of_lt
#print axioms NoThreeLine.BirthWitness.scheduled_cross_phase_creditRectangle_bound_of_lt
