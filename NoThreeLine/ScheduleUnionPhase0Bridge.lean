import NoThreeLine.ScheduleUnionPhase0
import NoThreeLine.DyadicPhaseInput
import NoThreeLine.PhaseUnionMass

/-! Frozen phase 0: accepted dyadic leaves and the four literal
symmetry images are checked against the coordinate fixture. The actual typed
space-time mass is then calculated. This does not certify the full schedule. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
open NoThreeLine.FinitePhase

namespace NoThreeLine.ScheduleUnionPhase0

def acceptedData : Array DyadicLeaf := #[
  ⟨0,0,0⟩]
def accepted (i : Fin 1) : DyadicLeaf := acceptedData.getD i.val ⟨0,0,0⟩
def decoded (i : Fin 4) : GridBox := phaseImageBoxes 32768 8 63 64 accepted i
def rootType : Fin 4 := 0
def duration : ℚ := 319013231/100000000

theorem source_metadata_checked : 63<128 ∧ 64<128 ∧ (128:ℕ)*2^8=32768 := by decide +kernel
theorem leaf_metadata_checked : ∀ i, (accepted i).Valid 8 := by decide +kernel
theorem raw_decoding_checked : ∀ i, raw i = decoded i := by decide +kernel

theorem decoded_union_area :
    (∫ z : ℝ × ℝ, rectangleUnionMask Finset.univ (fun i => ((decoded i).qrect 32768).real)
      (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) =
        (1/8192 : ℝ) := by
  have he : decoded = raw := funext (fun i => (raw_decoding_checked i).symm)
  rw [he]
  exact actual_union_area

theorem actual_phase_mass :
    singlePhaseMass (duration : ℝ) rootType (fun z => rectangleUnionMask Finset.univ
      (fun i => ((decoded i).qrect 32768).real)
      (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) =
        (319013231/3276800000000 : ℝ) := by
  rw [singlePhaseMass_eq (duration : ℝ) (by norm_num [duration]),decoded_union_area]
  norm_num [duration]

end NoThreeLine.ScheduleUnionPhase0

#print axioms NoThreeLine.ScheduleUnionPhase0.raw_decoding_checked
#print axioms NoThreeLine.ScheduleUnionPhase0.actual_phase_mass
