import NoThreeLine.ScheduledCrossingOriginalPath
import NoThreeLine.ProtectedCrossingContinue
import NoThreeLine.ScheduledLineSurvival

/-! Earlier completed phases have no higher occupancy than a later
boundary. Within the birth phase, the occupancy stage after the birth
has no witness before the true exit index. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem protectedScheduledInternal_occupancy_le_later {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B)
    (ω : BoardClockPath n) (i j k : ℕ) (hij : i<j) (hj : j≤J)
    (hd : AugTimedDone (cs i).config (augRecycledTerminal (cs i).config ε M hn
      (augPhaseStart (cs i).config ε M (recycledPhaseState cs ε M deadline start hn s.1 i ω))
      (recycledPhases cs ε M deadline start hn s.1 i ω).2)) :
    let r := protectedScheduledIterate cs ε M deadline start L p hn J s i ω
    let q := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
    occupancy (protectedRecycledPair (cs i).config ε M L hn
      (protectedPhaseStart (cs i).config ε M r.1.2) k r.2).1.1.val.1.physical.process L≤
      occupancy q.1.2.1.val.physical.process L := by
  let r := protectedScheduledIterate cs ε M deadline start L p hn J s i ω
  let q := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  let cfg := (cs i).config
  let a := protectedPhaseStart cfg ε M r.1.2
  let e := recycledPhaseState cs ε M deadline start hn s.1 i ω
  let w := (recycledPhases cs ε M deadline start hn s.1 i ω).2
  have hp := protectedScheduledIterate_projection cs ε M deadline start L p hn J s i (hij.le.trans hj) ω
  have hq := protectedScheduledIterate_projection cs ε M deadline start L p hn J s j hj ω
  have h₁ : a.1=augPhaseStart cfg ε M e :=
    congrArg (augPhaseStart cfg ε M) (congrArg (fun x=>x.1.2) hp)
  have h₂ : r.2=w := congrArg Prod.snd hp
  have h₃ : q.1.2.1=recycledPhaseState cs ε M deadline start hn s.1 j ω :=
    congrArg (fun x=>x.1.2) hq
  have h₄ : (protectedRecycledPair cfg ε M L hn a k r.2).1.1=(augRecycledPair cfg ε M hn a.1 k r.2).1 :=
    congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn a k r.2)
  change occupancy (protectedRecycledPair cfg ε M L hn a k r.2).1.1.val.1.physical.process L≤
    occupancy q.1.2.1.val.physical.process L
  rw [h₄,h₁,h₂,h₃]
  have hm := recycled_occupancy_le_terminal cfg ε M L hn (augPhaseStart cfg ε M e) w hd k
  change occupancy (augRecycledPair cfg ε M hn (augPhaseStart cfg ε M e) k w).1.val.1.physical.process L≤
    occupancy (augRecycledTerminal cfg ε M hn (augPhaseStart cfg ε M e) w).val.1.physical.process L at hm
  have ht : occupancy (augRecycledTerminal cfg ε M hn (augPhaseStart cfg ε M e) w).val.1.physical.process L=
    occupancy (recycledPhaseState cs ε M deadline start hn s.1 (i+1) ω).val.physical.process L :=
    scheduledTerminal_occupancy cs ε M deadline start hn s.1 i ω L
  rw [ht] at hm
  exact hm.trans (recycledPhaseState_occupancy_monotone cs ε M deadline start hn L s.1 ω (Nat.succ_le_of_lt hij))

theorem protectedActualExceedance_at_lineExit_iff {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n)
    (s : ProtectedTimedState cfg) (b : ℝ) (ω : BoardClockPath n) :
    let r := protectedLineExitPair cfg ε M L N hn s ω
    r.2∈protectedActualExceedance cfg ε M L (N+1) E A hn r.1 b ↔
      ω∈protectedActualExceedance cfg ε M L (N+1) E A hn s b := by
  let F := protectedRestartStep cfg ε M L hn
  let H := protectedLineExitTest cfg L N
  let i := firstHitIndex F H s ω
  have hbefore (k : ℕ) (hk : k < i) :
      occupancy (protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.physical.process L≠N+1 := by
    intro he
    have hh : H (state F s k ω) := Or.inl (by
      change N<occupancy (protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.physical.process L
      rw [he]
      omega)
    exact (Nat.not_le_of_lt hk) (firstHitIndex_le F H s ω k hh)
  exact protectedActualExceedance_continue_iff cfg ε M L (N+1) E A hn s b i ω hbefore

end NoThreeLine

#print axioms NoThreeLine.protectedScheduledInternal_occupancy_le_later
#print axioms NoThreeLine.protectedActualExceedance_at_lineExit_iff

