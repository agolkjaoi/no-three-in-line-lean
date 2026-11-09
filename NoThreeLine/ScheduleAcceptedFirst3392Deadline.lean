import NoThreeLine.ScheduleAcceptedFirst3392Reference
import NoThreeLine.AcceptedDeadlineWitness

/-! Locate a literal accepted leaf at the root's actual last positive phase.
All partner fields are bounded at this one deadline. No leaf risk certificate,
compressed reference-field identity, or full-schedule conclusion is supplied. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst3392Deadline
open FinitePhase FrozenReference ScheduleAcceptedFirst3392 ScheduleAcceptedFirst3392Reference

theorem scaled_deadline_witness (scale : ℝ) (hscale : 0 < scale)
    (rootType : Fin 4) (rootX rootY : ℝ) :
    let s := actualSchedule.scaled scale hscale
    let T := s.deadline (actualInput rootType rootX rootY)
    T = 0 ∨ ∃ k : Fin phases.length, ∃ i : Fin ((phases.get k).phase.count*4),
      rootType = (phases.get k).phase.rootType ∧
      0 < actualInput rootType rootX rootY k ∧ T = s.hi k ∧
      (rootX,rootY) ∈ ((phaseImageBoxes 32768 8 (phases.get k).phase.sx
        (phases.get k).phase.sy (phases.get k).phase.leaves i).qrect 32768).real.closedSet ∧
      ∀ r : Fin 4, ∀ x y : ℝ,
        s.cumulative (actualInput r x y) T ≤ scale*fullPhasePrefix (phaseIndex k) r x y := by
  let s := actualSchedule.scaled scale hscale
  let c := actualInput rootType rootX rootY
  change s.deadline c = 0 ∨ _
  rcases s.deadline_eq_zero_or_used_right c with hz | ⟨k,hk,he⟩
  · exact Or.inl hz
  · have hmask : 0 < (phases.get k).phase.mask 32768
        (commonGridLines 32768) (commonGridLines 32768) rootType rootX rootY := by
      rw [← (phases.get k).typedField_eq grid_pos]
      exact hk
    have hw := (phases.get k).phase.mask_positive_witness 32768 _ _ rootType rootX rootY hmask
    obtain ⟨i,hcell⟩ := hw.2.2.2
    refine Or.inr ⟨k,i,hw.1,hk,he,hcell,?_⟩
    intro r x y
    exact scaled_actual_prefix_le_full scale hscale k (phaseIndex k) le_rfl
      (s.deadline c) (s.deadline_nonneg c) he.le r x y

end NoThreeLine.ScheduleAcceptedFirst3392Deadline

#print axioms NoThreeLine.ScheduleAcceptedFirst3392Deadline.scaled_deadline_witness
