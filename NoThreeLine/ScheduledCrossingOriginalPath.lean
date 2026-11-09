import NoThreeLine.ScheduledRestartCrossing
import NoThreeLine.ProtectedScheduledRegion

/-! The crossing flags are observations of the original protected phase
history. They depend on the physical state, saved ledger, and residual
board, which are the same with or without an accumulated-source field. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedCrossingBoundaryView {n : ℕ} {B : ℝ} (x : ProtectedPhaseState n B×BoardClockPath n) :
    (ValidAugmentedState n B×(Grid n→ℝ))×BoardClockPath n :=
  ((x.1.1,x.1.2.1),x.2)

theorem protectedScheduledPair_crossingBoundaryView_congr {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (j : ℕ)
    (x y : ProtectedPhaseState n B×BoardClockPath n)
    (h : protectedCrossingBoundaryView x=protectedCrossingBoundaryView y) :
    protectedCrossingBoundaryView (protectedScheduledPair cs ε M deadline start L p hn j x)=
      protectedCrossingBoundaryView (protectedScheduledPair cs ε M deadline start L p hn j y) := by
  rcases x with ⟨⟨ex,sx,cx⟩,wx⟩
  rcases y with ⟨⟨ey,sy,cy⟩,wy⟩
  simp only [protectedCrossingBoundaryView,Prod.mk.injEq] at h
  obtain ⟨⟨rfl,rfl⟩,rfl⟩ := h
  rfl

def protectedScheduledExceedanceAt {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (p : Grid n) (hn : 0<n) (b : ℝ)
    (J : ℕ) (s : ProtectedPhaseState n B) (j : ℕ) (ω : BoardClockPath n) : Prop :=
  let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  r.2∈protectedActualExceedance (cs j).config ε M L N E A hn
    (protectedPhaseStart (cs j).config ε M r.1.2) b

theorem scheduledCrossingTail_flag_iff_original {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ) (p : Grid n) (hn : 0<n)
    (b : ℝ) (J : ℕ) (s : ProtectedPhaseState n B) (ω : BoardClockPath n)
    (j k : ℕ) (hjk : j+k≤J) (x : ProtectedPhaseState n B×BoardClockPath n)
    (hx : let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
      protectedCrossingBoundaryView x=protectedCrossingBoundaryView (r.1.2,r.2)) :
    (scheduledCrossingTail cs ε M deadline start L N E A hn b j k x).1.2=true ↔
      ∃ i : ℕ, j ≤ i ∧ i < j+k ∧ protectedScheduledExceedanceAt cs ε M deadline start L N E A p hn b J s i ω := by
  induction k generalizing j x with
  | zero =>
    simp only [scheduledCrossingTail,Bool.false_eq_true,Nat.add_zero,false_iff,not_exists]
    rintro i ⟨h₁,h₂,_⟩
    exact (not_lt_of_ge h₁) h₂
  | succ k ih =>
    let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
    let a := scheduledCrossingPair cs ε M deadline start L N E A hn b j x
    let c := protectedScheduledPair cs ε M deadline start L p hn j (r.1.2,r.2)
    have hi : r.1.1=j := protectedScheduledIterate_index cs ε M deadline start L p hn J s j (by omega) ω
    have hnext : protectedScheduledIterate cs ε M deadline start L p hn J s (j+1) ω=((j+1,c.1),c.2) := by
      change protectedScheduledStep cs ε M deadline start L p hn J r=_
      have hj : j<J := by omega
      simp only [protectedScheduledStep,hi,if_pos hj,c]
    have hx' : protectedCrossingBoundaryView (a.1.1,a.2)=protectedCrossingBoundaryView (c.1,c.2) :=
      (scheduledCrossingPair_projection cs ε M deadline start L N E A hn b j p x).trans
        (protectedScheduledPair_crossingBoundaryView_congr cs ε M deadline start L p hn j x (r.1.2,r.2) hx)
    have hphase : a.1.2=true ↔ protectedScheduledExceedanceAt cs ε M deadline start L N E A p hn b J s j ω := by
      change (scheduledCrossingPair cs ε M deadline start L N E A hn b j x).1.2=true ↔ _
      rw [scheduledCrossingPair_flag cs ε M deadline start L N E A hn b j x]
      have hstate : protectedPhaseStart (cs j).config ε M x.1=
          protectedPhaseStart (cs j).config ε M r.1.2 :=
        Prod.ext (congrArg (fun z : (ValidAugmentedState n B×(Grid n→ℝ))×BoardClockPath n=>
          augPhaseStart (cs j).config ε M z.1.1) hx)
          (congrArg (fun z : (ValidAugmentedState n B×(Grid n→ℝ))×BoardClockPath n=>z.1.2) hx)
      have hboard : x.2=r.2 := congrArg Prod.snd hx
      rw [hstate,hboard]
      rfl
    have htail := ih (j+1) (by omega) (a.1.1,a.2) (by rw [hnext]; exact hx')
    change ((a.1.2 || (scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k
      (a.1.1,a.2)).1.2)=true) ↔ _
    rw [Bool.or_eq_true,hphase,htail]
    constructor
    · rintro (h | ⟨i,hi,hlt,h⟩)
      · exact ⟨j,le_rfl,by omega,h⟩
      · exact ⟨i,by omega,by omega,h⟩
    · rintro ⟨i,hlo,hhi,h⟩
      by_cases he : i=j
      · exact Or.inl (he ▸ h)
      · exact Or.inr ⟨i,by omega,by omega,h⟩

theorem mem_scheduledProtectedExceedance_iff_original {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ) (p : Grid n) (hn : 0<n)
    (b : ℝ) (J : ℕ) (s : ProtectedPhaseState n B) (ω : BoardClockPath n) :
    ω∈scheduledProtectedExceedance cs ε M deadline start L N E A hn b J s ↔
      ∃ j : ℕ, j < J ∧ protectedScheduledExceedanceAt cs ε M deadline start L N E A p hn b J s j ω := by
  simpa only [scheduledProtectedExceedance,Set.mem_setOf_eq,Nat.zero_add,Nat.zero_le,true_and] using
    scheduledCrossingTail_flag_iff_original cs ε M deadline start L N E A p hn b J s ω
      0 J (by omega) (s,ω) rfl

end NoThreeLine

#print axioms NoThreeLine.scheduledCrossingTail_flag_iff_original
#print axioms NoThreeLine.mem_scheduledProtectedExceedance_iff_original

