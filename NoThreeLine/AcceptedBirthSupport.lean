import NoThreeLine.AcceptedDeadlineWitness
import NoThreeLine.AcceptedScheduleProcess
import NoThreeLine.CappedBirthRate
import NoThreeLine.CandidateClockEvents

/-! Positive actual rates and positive-mark accepted births lie in an actual
accepted leaf. Candidate times retain the closed right endpoint convention.
The root's deadline is computed from the very same board masks. -/
set_option autoImplicit false
noncomputable section
open Set MeasureTheory
namespace NoThreeLine
open FinitePhase PrimitiveLines GridChord

theorem ProcessState.birthRate_positive_mask {n : ℕ} (s : ProcessState n)
    (mask : Grid n → ℝ) (q : Grid n) (hw : 0 ≤ (s.accounts q).weight)
    (hp : 0 < s.birthRate mask q) : 0 < mask q := by
  by_contra h
  have hm : mask q ≤ 0 := le_of_not_gt h
  unfold birthRate at hp
  split_ifs at hp with he
  · exact (not_lt_of_ge (div_nonpos_of_nonpos_of_nonneg
      (mul_nonpos_of_nonpos_of_nonneg hm hw) (Nat.cast_nonneg n))) hp
  · exact (lt_irrefl 0) hp

theorem ProcessState.acceptance_positive_mask {n : ℕ} (s : ProcessState n)
    (mask : Grid n → ℝ) (B : ℝ) (hB : 0 ≤ B) (q : Grid n)
    (hw : 0 ≤ (s.accounts q).weight) (hp : 0 < s.acceptance mask B q) : 0 < mask q := by
  by_contra h
  have hm : mask q ≤ 0 := le_of_not_gt h
  unfold acceptance at hp
  split_ifs at hp with he
  · exact (not_lt_of_ge (div_nonpos_of_nonpos_of_nonneg
      (mul_nonpos_of_nonpos_of_nonneg hm hw) hB)) hp
  · exact (lt_irrefl 0) hp

def AcceptedPhase.BoardLeafSupport {n : ℕ} (a : AcceptedPhase 8) (q : Grid n) : Prop :=
  GridArea.typeCode (GridArea.pointType q) = a.rootType ∧
    ∃ i : Fin (a.count*4),
      (normX n (gridEmbed q),normY n (gridEmbed q)) ∈
        ((phaseImageBoxes 32768 8 a.sx a.sy a.leaves i).qrect 32768).real.closedSet

theorem AcceptedPhase.boardInput_positive_support {n : ℕ} (a : AcceptedPhase 8)
    (q : Grid n) (hp : 0 < a.boardInput q) : a.BoardLeafSupport q :=
  a.boardInput_positive_witness q hp

theorem AcceptedPhase.birthRate_positive_support {n : ℕ} (a : AcceptedPhase 8)
    (s : ProcessState n) (q : Grid n) (hw : 0 ≤ (s.accounts q).weight)
    (hp : 0 < s.birthRate a.boardInput q) :
    0 < a.boardInput q ∧ a.BoardLeafSupport q := by
  have hm := s.birthRate_positive_mask a.boardInput q hw hp
  exact ⟨hm,a.boardInput_positive_support q hm⟩

theorem AcceptedPhase.positive_mark_support {n : ℕ} (a : AcceptedPhase 8)
    (s : ProcessState n) (B : ℝ) (hB : 0 ≤ B) (q : Grid n)
    (hw : 0 ≤ (s.accounts q).weight) (z : ℝ) (hz : 0 < z)
    (ha : z ≤ s.acceptance a.boardInput B q) :
    0 < a.boardInput q ∧ a.BoardLeafSupport q := by
  have hm := s.acceptance_positive_mask a.boardInput B hB q hw (hz.trans_le ha)
  exact ⟨hm,a.boardInput_positive_support q hm⟩

theorem FinitePhase.Schedule.positive_accepted_deadline_support {J n : ℕ}
    (s : Schedule J) (a : Fin J → AcceptedPhase 8) (j : Fin J) (q : Grid n)
    (hp : 0 < (a j).boardInput q) :
    let T := s.deadline (fun k => (a k).boardInput q)
    s.hi j ≤ T ∧ ∃ k : Fin J,
      0 < (a k).boardInput q ∧ T = s.hi k ∧ (a k).BoardLeafSupport q := by
  let c := fun k => (a k).boardInput q
  have hj : s.hi j ≤ s.deadline c := s.used_phase_le_deadline c j hp
  refine ⟨hj,?_⟩
  rcases s.deadline_eq_zero_or_used_right c with hz | ⟨k,hk,he⟩
  · have hh : 0 < s.hi j := (s.lo_nonneg j).trans_lt (s.lo_lt_hi j)
    rw [hz] at hj
    exact (not_lt_of_ge hj hh).elim
  · exact ⟨k,hk,he,(a k).boardInput_positive_support q hk⟩

theorem FinitePhase.Schedule.birthRate_positive_accepted_support {J n : ℕ}
    (s : Schedule J) (a : Fin J → AcceptedPhase 8) (j : Fin J)
    (st : ProcessState n) (q : Grid n) (hw : 0 ≤ (st.accounts q).weight)
    (hp : 0 < st.birthRate (a j).boardInput q) :
    let T := s.deadline (fun k => (a k).boardInput q)
    0 < (a j).boardInput q ∧ (a j).BoardLeafSupport q ∧ s.hi j ≤ T ∧
      ∃ k : Fin J, 0 < (a k).boardInput q ∧ T = s.hi k ∧ (a k).BoardLeafSupport q := by
  have h := (a j).birthRate_positive_support st q hw hp
  have hd := s.positive_accepted_deadline_support a j q h.1
  exact ⟨h.1,h.2,hd.1,hd.2⟩

namespace BirthWitness

theorem timedBirth_positive_mark_mask {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) (t z : ℝ) (q : Grid n)
    (hz : 0 < z) (hb : timedBirth cfg ε M (s,((t,q),z))) :
    0 < cfg.mask q ∧ 0 < t ∧ t ≤ s.val.2 := by
  have ha : z ≤ (cappedProcess cfg ε M (s,t)).acceptance cfg.mask cfg.B q :=
    hb.2.2.1
  have hp := (cappedProcess cfg ε M (s,t)).acceptance_positive_mask cfg.mask cfg.B hB.le q
    (cappedProcess_weight_bounds cfg ε M s t q).1 (hz.trans_le ha)
  have ht : t ≤ s.val.2 := hb.2.1.2.trans
    (augGuardTime_le_remaining cfg ε M (augTimedInput cfg s) s.property.2.1)
  exact ⟨hp,hb.2.1.1,ht⟩

theorem timedBirth_mask_positive_board_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hB : 0 < cfg.B) (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂boardClockMeasure n rate, ∀ st : AugTimedState cfg, ∀ t : ℝ,
      ∀ q : Grid n, ∀ k : ℕ,
      timedBirth cfg ε M (st,((t,q),candidateMark ω (q,k))) →
        0 < cfg.mask q ∧ 0 < t ∧ t ≤ st.val.2 := by
  filter_upwards [boardCandidateMark_in_unit n rate hr] with ω hω
  intro st t q k hb
  exact timedBirth_positive_mark_mask cfg ε M hB st t (candidateMark ω (q,k)) q
    (hω (q,k)).1 hb

def acceptedPhaseConfig {J n : ℕ} (s : Schedule J) (a : Fin J → AcceptedPhase 8)
    (Γ : Finset ZPoint) (B K ρ : ℝ) (j : Fin J) : FlowConfig n :=
  (scheduleSharedPhases (n := n) s (acceptedProcessMasks a) (acceptedProcessMasks_bounds a) Γ B K ρ j.val).config

theorem acceptedPhaseConfig_mask {J n : ℕ} (s : Schedule J) (a : Fin J → AcceptedPhase 8)
    (Γ : Finset ZPoint) (B K ρ : ℝ) (j : Fin J) :
    (acceptedPhaseConfig (n := n) s a Γ B K ρ j).mask = (a j).boardInput :=
  scheduleSharedPhases_mask (n := n) s (acceptedProcessMasks a) (acceptedProcessMasks_bounds a) Γ B K ρ j

theorem acceptedPhaseConfig_horizon {J n : ℕ} (s : Schedule J) (a : Fin J → AcceptedPhase 8)
    (Γ : Finset ZPoint) (B K ρ : ℝ) (j : Fin J) :
    ((acceptedPhaseConfig (n := n) s a Γ B K ρ j).horizon : ℝ) = s.duration j :=
  scheduleSharedPhases_horizon (n := n) s (acceptedProcessMasks a) (acceptedProcessMasks_bounds a) Γ B K ρ j

theorem acceptedPhase_candidateTime_eq {J n : ℕ} (s : Schedule J) (a : Fin J → AcceptedPhase 8)
    (Γ : Finset ZPoint) (B K ρ : ℝ) (j : Fin J) (remaining t : ℝ) :
    s.lo j+(((acceptedPhaseConfig (n := n) s a Γ B K ρ j).horizon : ℝ)-remaining)+t =
      s.hi j-remaining+t := by
  rw [acceptedPhaseConfig_horizon]
  unfold Schedule.duration
  ring

theorem timedBirth_accepted_support {J n : ℕ} (s : Schedule J)
    (a : Fin J → AcceptedPhase 8) (Γ : Finset ZPoint) (B K ρ ε M : ℝ) (hB : 0 < B)
    (j : Fin J) (st : AugTimedState (acceptedPhaseConfig (n := n) s a Γ B K ρ j))
    (t z : ℝ) (q : Grid n) (hz : 0 < z)
    (hb : timedBirth (acceptedPhaseConfig (n := n) s a Γ B K ρ j) ε M (st,((t,q),z))) :
    let T := s.deadline (fun k => (a k).boardInput q)
    0 < (a j).boardInput q ∧ (a j).BoardLeafSupport q ∧
      s.hi j-st.val.2+t ∈ Ioc (s.lo j) T ∧
      ∃ k : Fin J, 0 < (a k).boardInput q ∧ T = s.hi k ∧ (a k).BoardLeafSupport q := by
  have h := timedBirth_positive_mark_mask (acceptedPhaseConfig (n := n) s a Γ B K ρ j) ε M hB st t z q hz hb
  rw [acceptedPhaseConfig_mask] at h
  have hd := s.positive_accepted_deadline_support a j q h.1
  have hremaining : st.val.2 ≤ s.duration j := by
    simpa only [acceptedPhaseConfig_horizon] using st.property.2.2
  change st.val.2 ≤ s.hi j-s.lo j at hremaining
  refine ⟨h.1,(a j).boardInput_positive_support q h.1,⟨?_,?_⟩,hd.2⟩
  · linarith [h.2.1]
  · exact (show s.hi j-st.val.2+t ≤ s.hi j by linarith [h.2.2]).trans hd.1

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.AcceptedPhase.birthRate_positive_support
#print axioms NoThreeLine.AcceptedPhase.positive_mark_support
#print axioms NoThreeLine.FinitePhase.Schedule.birthRate_positive_accepted_support
#print axioms NoThreeLine.BirthWitness.timedBirth_positive_mark_mask
#print axioms NoThreeLine.BirthWitness.timedBirth_mask_positive_board_ae
#print axioms NoThreeLine.BirthWitness.timedBirth_accepted_support
