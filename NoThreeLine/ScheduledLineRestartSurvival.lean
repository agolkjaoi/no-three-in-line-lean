import NoThreeLine.ScheduledLineRestartLaw
import NoThreeLine.ScheduledLineRemainderProjection
import NoThreeLine.ProtectedScheduledRegion

/-! Starting from an empty line, the actual random-restart law excludes
a second line birth through the scheduled endpoint. Its incoming
occupancy and clock hypotheses come from the original guarded path. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem scheduledLineExit_admissible_or_done {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hpL : p∈L.val) (hn : 0<n) (hB : 0≤B) (J : ℕ)
    (hKcfg : ∀j,(cs j).K≤K) (hsp : ∀j,specified (cs j).directions L)
    (s : ProtectedPhaseState n B) (ho : occupancy s.1.val.physical.process L=0)
    (hk : s.1.val.physical.clocks L≤K) (hsv : 0≤s.2.1 p ∧ s.2.1 p≤2*B)
    (hA : s.2.2=0) (ω : BoardClockPath n) :
    let q := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J ω
    (q.1.1=J ∧ occupancy q.1.2.1.val.physical.process L=0) ∨
      (q.1.1<J ∧ occupancy q.1.2.1.val.physical.process L=1 ∧ q.1.2.1.val.physical.clocks L≤K) := by
  let ref := fun j=>protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  let q := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J ω
  let F := protectedScheduledStep cs ε M deadline start L p hn J
  let R := protectedScheduleRegion cs start K L 0 p J
  have hs : R (0,s) :=
    protectedScheduleRegion_initial cs start K L 0 p J s ⟨ho.ge,fun _=>hk⟩ hsv hA
  have hreg (j : ℕ) : R (ref j).1 :=
    iterate_region F R (protectedScheduleRegion_step cs ε M K deadline start L p hpL hn hB 0 (by omega)
      J hKcfg hsp) (0,s) hs j ω
  rcases scheduledLineExitIterate_cases cs ε M deadline start L 0 p hn J s ho.le J le_rfl ω with
    ⟨hq,hle⟩ | ⟨j,hj,hpre,hbirth,hq⟩
  · change (q.1.1=J ∧ occupancy q.1.2.1.val.physical.process L=0) ∨ _
    change q=lineExitBoundaryView cs (ref J) at hq
    rw [hq]
    exact Or.inl ⟨protectedScheduledIterate_index cs ε M deadline start L p hn J s J le_rfl ω,
      Nat.eq_zero_of_le_zero hle⟩
  · let cfg := (cs j).config
    let a := protectedPhaseStart cfg ε M (ref j).1.2
    let r := protectedLineExitPair cfg ε M L 0 hn a (ref j).2
    have he : occupancy a.1.val.1.physical.process L=0 := Nat.eq_zero_of_le_zero hpre
    have hb := protectedLineExitPair_birth_bounds cfg ε M K (hKcfg j) L (hsp j)
      0 (by omega) p hpL hn a he ((hreg j).2.1.2 he) (hreg j).2.2.1 (ref j).2 hbirth
    right
    change q.1.1<J ∧ occupancy q.1.2.1.val.physical.process L=1 ∧ q.1.2.1.val.physical.clocks L≤K
    change q=((j,packProtectedTimed cfg r.1),r.2) at hq
    rw [hq]
    exact ⟨hj,hb.1,hb.2.1⟩

theorem scheduledLineRestartLaw_terminal_occupancy_le_one {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<B) (J : ℕ)
    (hKcfg : ∀j,(cs j).K≤K) (hsp : ∀j,specified (cs j).directions L)
    (s : ProtectedPhaseState n B) (ho : occupancy s.1.val.physical.process L=0)
    (hk : s.1.val.physical.clocks L≤K) (hsv : 0≤s.2.1 p ∧ s.2.1 p≤2*B)
    (hA : s.2.2=0) :
    ∀ᵐω∂scheduledLineRestartLaw cs ε M K deadline start L hn J s,
      occupancy (recycledPhaseState cs ε M deadline start hn s.1 J ω).val.physical.process L≤1 := by
  let ν := boardClockMeasure n (B/n)
  let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J
  let D := scheduledRemainderDensity cs ε M K deadline start L 1 hn J
  have hD : Measurable (fun ω=>D (r ω)) :=
    (scheduledRemainderDensity_measurable cs ε M K deadline start L 1 hn J).comp
      (scheduledLineExitIterate_measurable cs ε M deadline start L 0 hn J s J)
  have hp := savedCreditMeasure_positive_ae ν (fun ω=>D (r ω)) hD
  have hproj := (savedCreditMeasure_absolutelyContinuous ν (fun ω=>D (r ω))).ae_le
    (scheduledLineRemainder_at_exit_ae cs ε M deadline start L 0 p hn hB J s ho.le)
  change ∀ᵐω∂savedCreditMeasure ν (fun ω=>D (r ω)),
      occupancy (recycledPhaseState cs ε M deadline start hn s.1 J ω).val.physical.process L≤1
  filter_upwards [hp,hproj] with ω hpos he
  let q := r ω
  rcases scheduledLineExit_admissible_or_done cs ε M K deadline start L p hpL hn hB.le J
    hKcfg hsp s ho hk hsv hA ω with ⟨hi,hzero⟩ | ⟨_,hone,hclock⟩
  · have hi' : ¬q.1.1<J := by change q.1.1=J at hi; rw [hi]; exact Nat.lt_irrefl _
    rw [←he]
    change occupancy (scheduledLineRemainderState cs ε M deadline start hn J q).val.physical.process L≤1
    simp only [scheduledLineRemainderState,if_neg hi']
    exact hzero.le.trans (by omega)
  · have hcond : occupancy q.1.2.1.val.physical.process L=1 ∧ q.1.2.1.val.physical.clocks L≤K := ⟨hone,hclock⟩
    change 0<scheduledRemainderDensity cs ε M K deadline start L 1 hn J q at hpos
    rw [scheduledRemainderDensity,if_pos hcond,he] at hpos
    by_contra hne
    have hb : occupancy (recycledPhaseState cs ε M deadline start hn s.1 J ω).val.physical.process L≠1 :=
      fun h=>hne h.le
    simp only [validLineStageDensity,validLineStageValue,hb,false_and,if_false,mul_zero,lt_irrefl] at hpos

end NoThreeLine

#print axioms NoThreeLine.scheduledLineExit_admissible_or_done
#print axioms NoThreeLine.scheduledLineRestartLaw_terminal_occupancy_le_one
