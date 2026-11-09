import NoThreeLine.ProtectedScheduledProcess
import NoThreeLine.PhaseLineStageTransition

/-! The saved and accumulated credits have pathwise bounds in the
original finite prefix. Elapsed time is charged only once per phase. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

def protectedScheduleBudget {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start : ℝ) (j : ℕ) : ℝ :=
  (phaseEndpoint cs start j-start)*((B/n)*B)

theorem protectedScheduleBudget_mono {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start : ℝ)
    (hB : 0≤B) : Monotone (protectedScheduleBudget cs start) :=
  fun i j h=>mul_le_mul_of_nonneg_right (sub_le_sub_right (phaseEndpoint_mono cs start h) _)
    (mul_nonneg (div_nonneg hB (Nat.cast_nonneg n)) hB)

def protectedScheduleRegion {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start K : ℝ)
    (L : LineIndex n) (N : ℕ) (p : Grid n) (J : ℕ) (s : ℕ × ProtectedPhaseState n B) : Prop :=
  s.1≤J ∧ validLineStageRegion K L N s.2.1 ∧
    (0≤s.2.2.1 p ∧ s.2.2.1 p≤2*B) ∧
    (0≤s.2.2.2 ∧ s.2.2.2≤protectedScheduleBudget cs start s.1)

theorem protectedScheduleRegion_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start K : ℝ)
    (L : LineIndex n) (N : ℕ) (p : Grid n) (J : ℕ) :
    Measurable (protectedScheduleRegion cs start K L N p J) := by
  have hp : Measurable (fun s : ℕ × ProtectedPhaseState n B=>s.2.2.1 p) :=
    (measurable_pi_apply p).comp measurable_snd.snd.fst
  have ha : Measurable (fun s : ℕ × ProtectedPhaseState n B=>s.2.2.2) := measurable_snd.snd.snd
  have hs : Measurable (fun s : ℕ × ProtectedPhaseState n B=>0≤s.2.2.1 p ∧ s.2.2.1 p≤2*B) :=
    (measurable_const.le' hp).and (hp.le' measurable_const)
  have hu : Measurable (fun s : ℕ × ProtectedPhaseState n B=>
      0≤s.2.2.2 ∧ s.2.2.2≤protectedScheduleBudget cs start s.1) :=
    (measurable_const.le' ha).and (ha.le'
    ((measurable_of_countable (protectedScheduleBudget cs start)).comp measurable_fst))
  exact ((measurable_of_countable (fun j : ℕ=>j≤J)).comp measurable_fst).and
    (((validLineStageRegion_measurable K L N).comp measurable_snd.fst).and (hs.and hu))

theorem protectedScheduleRegion_initial {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start K : ℝ)
    (L : LineIndex n) (N : ℕ) (p : Grid n) (J : ℕ) (s : ProtectedPhaseState n B)
    (he : validLineStageRegion K L N s.1) (hsv : 0≤s.2.1 p ∧ s.2.1 p≤2*B)
    (hA : s.2.2=0) : protectedScheduleRegion cs start K L N p J (0,s) := by
  refine ⟨Nat.zero_le _,he,hsv,?_,?_⟩
  · change 0≤s.2.2
    rw [hA]
  · change s.2.2≤protectedScheduleBudget cs start 0
    simp only [hA,protectedScheduleBudget,phaseEndpoint_zero,sub_self,zero_mul,le_rfl]

theorem protectedScheduleRegion_step {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hpL : p∈L.val) (hn : 0<n) (hB : 0≤B) (N : ℕ) (hN : N≤1) (J : ℕ)
    (hKcfg : ∀j,(cs j).K≤K) (hsp : ∀j,specified (cs j).directions L)
    (a : ℕ × ProtectedPhaseState n B) (ha : protectedScheduleRegion cs start K L N p J a)
    (ω : BoardClockPath n) :
    protectedScheduleRegion cs start K L N p J (protectedScheduledStep cs ε M deadline start L p hn J (a,ω)).1 := by
  by_cases hj : a.1<J
  · simp only [protectedScheduledStep,if_pos hj]
    let v := (protectedScheduledPair cs ε M deadline start L p hn a.1 (a.2,ω)).1
    have hp : v.1=(recycledScheduledPair cs ε M deadline start hn a.1 (a.2.1,ω)).1 :=
      congrArg Prod.fst (protectedScheduledPair_projection cs ε M deadline start L p hn a.1 (a.2,ω))
    have hstage : validLineStageRegion K L N v.1 := by
      rw [hp]
      exact recycledScheduledPair_lineStageRegion cs ε M K deadline start hn a.1 (hKcfg _) L
        (hsp _) N hN a.2.1 ha.2.1 ω
    have hb := protectedScheduledPair_source_bounds cs ε M deadline start L p hpL hn a.1 (hsp _) hB (a.2,ω)
    have hsv := protectedScheduledPair_saved_bounds cs ε M deadline start L p hpL hn a.1 (hsp _) (a.2,ω) ha.2.2.1
    refine ⟨hj,hstage,hsv,ha.2.2.2.1.trans hb.1,hb.2.trans ?_⟩
    change a.2.2.2+(cs a.1).horizon*((B/n)*B)≤protectedScheduleBudget cs start (a.1+1)
    rw [protectedScheduleBudget,phaseEndpoint_succ]
    calc
      _ ≤ (phaseEndpoint cs start a.1-start)*((B/n)*B)+(cs a.1).horizon*((B/n)*B) :=
        add_le_add ha.2.2.2.2 le_rfl
      _ = _ := by ring
  · simpa only [protectedScheduledStep,if_neg hj] using ha

end NoThreeLine

#print axioms NoThreeLine.protectedScheduleRegion_step
