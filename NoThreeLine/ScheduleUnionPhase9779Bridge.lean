import NoThreeLine.ScheduleUnionPhase9779
import NoThreeLine.DyadicPhaseInput
import NoThreeLine.PhaseUnionMass

/-! Frozen phase 9779: accepted dyadic leaves and the four literal
symmetry images are checked against the coordinate fixture. The actual typed
space-time mass is then calculated. This does not certify the full schedule. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
open NoThreeLine.FinitePhase

namespace NoThreeLine.ScheduleUnionPhase9779

def acceptedData : Array DyadicLeaf := #[
  ⟨2,0,0⟩,
  ⟨2,0,1⟩,
  ⟨2,1,0⟩,
  ⟨2,1,1⟩,
  ⟨2,0,2⟩,
  ⟨2,0,3⟩,
  ⟨2,1,2⟩,
  ⟨2,2,0⟩,
  ⟨2,2,1⟩,
  ⟨2,3,0⟩,
  ⟨3,4,4⟩,
  ⟨3,4,5⟩,
  ⟨3,5,4⟩,
  ⟨3,5,5⟩,
  ⟨3,4,6⟩,
  ⟨3,4,7⟩,
  ⟨3,5,6⟩,
  ⟨3,6,4⟩,
  ⟨3,6,5⟩,
  ⟨3,7,4⟩,
  ⟨3,2,6⟩,
  ⟨3,2,7⟩,
  ⟨3,3,6⟩,
  ⟨3,3,7⟩,
  ⟨3,6,2⟩,
  ⟨3,6,3⟩,
  ⟨3,7,2⟩,
  ⟨3,7,3⟩,
  ⟨4,12,14⟩,
  ⟨4,12,15⟩,
  ⟨4,13,14⟩,
  ⟨4,14,12⟩,
  ⟨4,14,13⟩,
  ⟨4,15,12⟩,
  ⟨4,10,14⟩,
  ⟨4,10,15⟩,
  ⟨4,11,14⟩,
  ⟨4,11,15⟩,
  ⟨4,14,10⟩,
  ⟨4,14,11⟩,
  ⟨4,15,10⟩,
  ⟨4,15,11⟩,
  ⟨4,12,12⟩,
  ⟨4,12,13⟩,
  ⟨4,13,12⟩,
  ⟨4,13,13⟩,
  ⟨5,28,30⟩,
  ⟨5,28,31⟩,
  ⟨5,29,30⟩,
  ⟨5,29,31⟩,
  ⟨5,30,28⟩,
  ⟨5,30,29⟩,
  ⟨5,31,28⟩,
  ⟨5,31,29⟩,
  ⟨5,30,30⟩,
  ⟨5,26,30⟩,
  ⟨5,26,31⟩,
  ⟨5,27,30⟩,
  ⟨5,27,31⟩,
  ⟨5,30,26⟩,
  ⟨5,30,27⟩,
  ⟨5,31,26⟩,
  ⟨5,31,27⟩,
  ⟨5,28,28⟩,
  ⟨5,28,29⟩,
  ⟨5,29,28⟩,
  ⟨5,29,29⟩,
  ⟨6,60,62⟩,
  ⟨6,60,63⟩,
  ⟨6,61,62⟩,
  ⟨6,61,63⟩,
  ⟨6,62,60⟩,
  ⟨6,62,61⟩,
  ⟨6,63,60⟩,
  ⟨6,63,61⟩]
def accepted (i : Fin 75) : DyadicLeaf := acceptedData.getD i.val ⟨0,0,0⟩
def decoded (i : Fin 300) : GridBox := phaseImageBoxes 32768 8 2 2 accepted i
def rootType : Fin 4 := 2
def duration : ℚ := 36710549/50000000

theorem source_metadata_checked : 2<128 ∧ 2<128 ∧ (128:ℕ)*2^8=32768 := by decide +kernel
theorem leaf_metadata_checked : ∀ i, (accepted i).Valid 8 := by decide +kernel
theorem raw_decoding_checked : ∀ i, raw i = decoded i := by decide +kernel

theorem decoded_union_area :
    (∫ z : ℝ × ℝ, rectangleUnionMask Finset.univ (fun i => ((decoded i).qrect 32768).real)
      (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) =
        (1023/8388608 : ℝ) := by
  have he : decoded = raw := funext (fun i => (raw_decoding_checked i).symm)
  rw [he]
  exact actual_union_area

theorem actual_phase_mass :
    singlePhaseMass (duration : ℝ) rootType (fun z => rectangleUnionMask Finset.univ
      (fun i => ((decoded i).qrect 32768).real)
      (commonGridLines 32768) (commonGridLines 32768) z.1 z.2) =
        (37554891627/1677721600000000 : ℝ) := by
  rw [singlePhaseMass_eq (duration : ℝ) (by norm_num [duration]),decoded_union_area]
  norm_num [duration]

end NoThreeLine.ScheduleUnionPhase9779

#print axioms NoThreeLine.ScheduleUnionPhase9779.raw_decoding_checked
#print axioms NoThreeLine.ScheduleUnionPhase9779.actual_phase_mass
