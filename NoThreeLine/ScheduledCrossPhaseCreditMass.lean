import NoThreeLine.ScheduledCrossPhaseLineMass
import NoThreeLine.ScheduledSamePhaseCreditMass

/-! Actual past physical credit decay is a bounded old-cut history test.
Cross-phase transport returns its future line mass to the old diagonal
observable under the same full terminal point measure. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem scheduled_cross_phase_creditMass_le_ae_times {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2) (j k r : ℕ)
    (L : LineIndex n) (hL : ¬specified Γ L) (p : Grid n) (hpL : p ∈ L.val)
    (hε0 : 0 ≤ ε) (hε : ε < 1) :
    ∀ᵐ u : ℝ ∂volume, ∀ᵐ v : ℝ ∂volume, u ∈ Ioo 0 ((cs j).horizon : ℝ) →
      v ∈ Ioo 0 ((cs (j+1+k)).horizon : ℝ) →
    (∫ ω, observedActiveLineMass (cs (j+1+k)).config L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) (j+1+k) (ω,v))*
      scheduledCutLineCreditRate cs ε M deadline start L hn
        (initialGoodPhaseObservation B hB deadline start) j (ω,u)
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r)) ≤
    (∫ ω, activeLineCreditMass (cs j).directions (cs j).mask L p
        (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
          (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r))/(1-ε) := by
  have hh := scheduled_cross_phase_lineMass_le_ae_times cs ε M deadline start hn hB Γ hΓ hK
    j k r L hL p hpL hε0 hε
    (fun _ => observedLineCreditRate (cs j).config L)
    (fun _ => observedLineCreditRate_measurable (cs j).config L) ((L.val.card : ℝ)*(B/n))
    (fun _ => observedLineCreditRate_bounds (cs j).config L (zero_lt_one.trans_le hB) (cs j).mask_le_one)
  filter_upwards [hh] with u hu
  filter_upwards [hu] with v hv huI hvI
  have h := hv huI hvI
  simp_rw [observedActiveLineMass_mul_rate] at h
  exact h

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduled_cross_phase_creditMass_le_ae_times
