import NoThreeLine.SectionTagSmall
import NoThreeLine.ScheduleProcessBridge

/-! Connect the actual G5 line input to the cumulative finite schedule.
The original last-positive deadlines are retained in the tag process. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections FinitePhase

theorem schedule_section_input {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint) (B K ρ : ℝ)
    (L : LineIndex n) (p : Grid n) :
    sectionScheduleInput (scheduleSharedPhases s mask hm Γ B K ρ) L p J =
      (∑q∈L.val.erase p,s.cumulative (fun j=>mask j q) s.total)/(n:ℝ) := by
  rw [sectionScheduleInput_eq_cumulative]
  congr 1
  apply Finset.sum_congr rfl
  intro q _
  rw [s.cumulative_total,←Fin.sum_univ_eq_sum_range]
  apply Finset.sum_congr rfl
  intro j _
  rw [scheduleSharedPhases_horizon,scheduleSharedPhases_mask]

theorem exists_uniform_schedule_tagCause_threshold (J : ℕ) (T lam ρ d ζ κ : ℝ)
    (hT : 0≤T) (hgap : lam<1-ρ) (hd : d<1) (hζ : 0<ζ) (hκ : 0<κ) :
    ∃ N : ℕ, 2≤N ∧ ∀n≥N,
      ∀ (B : ℝ) (s : Schedule J) (mask : Fin J→Grid n→ℝ)
        (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint) (K M : ℝ)
        (p : Grid n) (hn : 0<n) (hB : 1≤B),
        ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active →
        K<2 → (∀j q,mask j q=0 ∨ mask j q=1) → B≤(n:ℝ)^d → s.total≤T →
        (∀L:RootBoardLineIndex p,¬specified Γ L.val →
          (∑q∈L.val.val.erase p,s.cumulative (fun j=>mask j q) s.total)/(n:ℝ)≤lam) →
        let cs := scheduleSharedPhases s mask hm Γ B K ρ
        (phasePointMeasure cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 hn hB p J).real
          (scheduledBoundaryCauseBefore cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 hn
            (augInitialState B hB (scheduleProcessDeadline s mask) 0) p .tag J)<κ := by
  obtain ⟨N,hN,hbound⟩ := exists_uniform_tagCause_threshold J T lam ρ d ζ κ hT hgap hd hζ hκ
  refine ⟨N,hN,?_⟩
  intro n hNn B s mask hm Γ K M p hn hB hp hK hbinary hBn htime hinput
  let cs := scheduleSharedPhases s mask hm Γ B K ρ
  have hK' (j : ℕ) : (cs j).K<2 := by
    dsimp only [cs,scheduleSharedPhases]
    split <;> exact hK
  have hρ' (j : ℕ) (_hj : j<J) : (cs j).rho≤ρ := by
    dsimp only [cs,scheduleSharedPhases]
    split <;> exact le_rfl
  have hm' (j : ℕ) (hj : j<J) (q : Grid n) : (cs j).mask q=0 ∨ (cs j).mask q=1 := by
    change (scheduleSharedPhases s mask hm Γ B K ρ (⟨j,hj⟩:Fin J).val).mask q=0 ∨ _
    rw [scheduleSharedPhases_mask]
    exact hbinary ⟨j,hj⟩ q
  exact hbound n hNn B cs M (scheduleProcessDeadline s mask) 0 Γ p hn hB hp
    (scheduleSharedPhases_directions s mask hm Γ B K ρ) hK' hρ' hm' hBn
    ((scheduleSharedPhases_total s mask hm Γ B K ρ).trans_le htime)
    (fun L hL=>(schedule_section_input s mask hm Γ B K ρ L.val p).trans_le (hinput L hL))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.schedule_section_input
#print axioms NoThreeLine.BirthWitness.exists_uniform_schedule_tagCause_threshold
