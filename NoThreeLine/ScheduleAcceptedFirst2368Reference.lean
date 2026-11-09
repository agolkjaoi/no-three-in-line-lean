import NoThreeLine.ScheduleAcceptedFirst2368
import NoThreeLine.ReferencePrefixBound
import NoThreeLine.ReferenceLists
import NoThreeLine.ReferenceIndex
import NoThreeLine.ScheduleUnionBatch00000ReferenceList
import NoThreeLine.ScheduleUnionBatch00032Reference
import NoThreeLine.ScheduleUnionBatch00160Reference
import NoThreeLine.ScheduleUnionBatch00192Reference
import NoThreeLine.ScheduleUnionBatch00320Reference
import NoThreeLine.ScheduleUnionBatch00448Reference
import NoThreeLine.ScheduleUnionBatch00576Reference
import NoThreeLine.ScheduleUnionBatch00704Reference
import NoThreeLine.ScheduleUnionBatch00832Reference
import NoThreeLine.ScheduleUnionBatch00960Reference
import NoThreeLine.ScheduleUnionBatch01088Reference
import NoThreeLine.ScheduleUnionBatch01216Reference
import NoThreeLine.ScheduleUnionBatch01344Reference
import NoThreeLine.ScheduleUnionBatch01472Reference
import NoThreeLine.ScheduleUnionBatch01600Reference
import NoThreeLine.ScheduleUnionBatch01728Reference
import NoThreeLine.ScheduleUnionBatch01856Reference
import NoThreeLine.ScheduleUnionBatch01984Reference
import NoThreeLine.ScheduleUnionBatch02112Reference
import NoThreeLine.ScheduleUnionBatch02240Reference

/-! Exact chronological reference lookup for the actual checked prefix [0,2368).
The order is inherited from the existing list, with no omitted or repeated entry.
The reference-prefix domination is internal; compressed certificate equality is separate. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.ScheduleAcceptedFirst2368Reference
open FinitePhase FrozenReference ScheduleAcceptedFirst2368

theorem ordered_matches : MatchesFrom 0 phases := by
  unfold ScheduleAcceptedFirst2368.phases ScheduleAcceptedFirst1344.phases ScheduleAcceptedFirst832.phases ScheduleAcceptedFirst320.phases
  apply MatchesFrom.append
  ·
    apply MatchesFrom.append
    ·
      apply MatchesFrom.append
      ·
        apply MatchesFrom.append
        ·
          apply MatchesFrom.append
          ·
            apply MatchesFrom.append
            ·
              apply MatchesFrom.append
              ·
                apply MatchesFrom.append
                ·
                  apply MatchesFrom.append
                  ·
                    simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch00000ReferenceList.ordered_matches
                  ·
                    simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch00032Reference.ordered_matches
                ·
                  apply MatchesFrom.append
                  ·
                    simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch00160Reference.ordered_matches
                  ·
                    simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch00192Reference.ordered_matches
              ·
                simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch00320Reference.ordered_matches
            ·
              apply MatchesFrom.append
              ·
                simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch00448Reference.ordered_matches
              ·
                apply MatchesFrom.append
                ·
                  simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch00576Reference.ordered_matches
                ·
                  simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch00704Reference.ordered_matches
          ·
            simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch00832Reference.ordered_matches
        ·
          apply MatchesFrom.append
          ·
            simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch00960Reference.ordered_matches
          ·
            apply MatchesFrom.append
            ·
              simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch01088Reference.ordered_matches
            ·
              simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch01216Reference.ordered_matches
      ·
        simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch01344Reference.ordered_matches
    ·
      apply MatchesFrom.append
      ·
        simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch01472Reference.ordered_matches
      ·
        simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch01600Reference.ordered_matches
  ·
    apply MatchesFrom.append
    ·
      apply MatchesFrom.append
      ·
        simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch01728Reference.ordered_matches
      ·
        simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch01856Reference.ordered_matches
    ·
      apply MatchesFrom.append
      ·
        simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch01984Reference.ordered_matches
      ·
        apply MatchesFrom.append
        ·
          simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch02112Reference.ordered_matches
        ·
          simpa only [List.length_append, ScheduleUnionBatch00000AcceptedList.phase_count, ScheduleUnionBatch00032AcceptedList.phase_count, ScheduleUnionBatch00160AcceptedList.phase_count, ScheduleUnionBatch00192AcceptedList.phase_count, ScheduleUnionBatch00320AcceptedList.phase_count, ScheduleUnionBatch00448AcceptedList.phase_count, ScheduleUnionBatch00576AcceptedList.phase_count, ScheduleUnionBatch00704AcceptedList.phase_count, ScheduleUnionBatch00832AcceptedList.phase_count, ScheduleUnionBatch00960AcceptedList.phase_count, ScheduleUnionBatch01088AcceptedList.phase_count, ScheduleUnionBatch01216AcceptedList.phase_count, ScheduleUnionBatch01344AcceptedList.phase_count, ScheduleUnionBatch01472AcceptedList.phase_count, ScheduleUnionBatch01600AcceptedList.phase_count, ScheduleUnionBatch01728AcceptedList.phase_count, ScheduleUnionBatch01856AcceptedList.phase_count, ScheduleUnionBatch01984AcceptedList.phase_count, ScheduleUnionBatch02112AcceptedList.phase_count, ScheduleUnionBatch02240AcceptedList.phase_count] using ScheduleUnionBatch02240Reference.ordered_matches

def phaseIndex (i : Fin phases.length) : Fin 15348 :=
  indexOfLength (by rw [phase_count]; decide) i

theorem phase_matches (i : Fin phases.length) : PhaseMatches (phases.get i) (phaseIndex i) :=
  MatchesFrom.zero_matches phases ordered_matches (by rw [phase_count]; decide) i

theorem phaseIndex_strictMono : StrictMono phaseIndex :=
  indexOfLength_strictMono (by rw [phase_count]; decide)

theorem actual_duration_reference (i : Fin phases.length) :
    actualSchedule.duration i = (phaseUnits (phaseIndex i) : ℝ)/100000000 := by
  unfold actualSchedule acceptedListSchedule checkedAcceptedSchedule
  rw [scheduleOfDurations_duration]
  exact PhaseMatches.duration_eq (phases.get i) grid_pos (phaseIndex i) (phase_matches i)

theorem actual_prefix_le_reference (T : ℝ) (hT : 0 ≤ T) (r : Fin 4) (x y : ℝ) :
    actualSchedule.cumulative (actualInput r x y) T ≤
      referencePrefix actualSchedule phaseIndex T r x y :=
  (ScheduleAcceptedFirst2368.actual_prefix_le_coarse T hT r x y).trans_eq
    (coarseAcceptedPrefix_eq_reference actualSchedule phases.get phaseIndex phase_matches T r x y)

theorem scaled_actual_prefix_le_full (scale : ℝ) (hscale : 0 < scale)
    (k : Fin phases.length) (last : Fin 15348) (hkl : phaseIndex k ≤ last)
    (T : ℝ) (hT : 0 ≤ T) (hTk : T ≤ (actualSchedule.scaled scale hscale).hi k)
    (r : Fin 4) (x y : ℝ) :
    (actualSchedule.scaled scale hscale).cumulative (actualInput r x y) T ≤
      scale*fullPhasePrefix last r x y := by
  change (actualSchedule.scaled scale hscale).cumulative
    (fun j => ((phases.get j).toPacket grid_pos).typedField r x y) T ≤ _
  rw [Schedule.checkedAcceptedPrefix_eq]
  apply acceptedPrefix_le_fullPhasePrefix _ phases.get phaseIndex phase_matches phaseIndex_strictMono
    scale hscale.le _ k last hkl T hT hTk r x y
  intro j
  rw [Schedule.scaled_duration, actual_duration_reference]

end NoThreeLine.ScheduleAcceptedFirst2368Reference

#print axioms NoThreeLine.ScheduleAcceptedFirst2368Reference.ordered_matches
#print axioms NoThreeLine.ScheduleAcceptedFirst2368Reference.scaled_actual_prefix_le_full
