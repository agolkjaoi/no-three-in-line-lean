import NoThreeLine.ProtectedClockCellStep
import NoThreeLine.ScheduledCrossingComplement

/-! A phase on the original protected schedule spends at most its elapsed
time times the cell budget on the complement of the two-stage event. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedScheduled_saved_at {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B) (hsp : ∀j,specified (cs j).directions L)
    (q : Grid n) (hq : q∈L.val) (hs : 0≤s.2.1 q ∧ s.2.1 q≤2*B)
    (j : ℕ) (hj : j≤J) (ω : BoardClockPath n) :
    let r := (protectedScheduledIterate cs ε M deadline start L p hn J s j ω).1.2
    0≤r.2.1 q ∧ r.2.1 q≤2*B := by
  induction j with
  | zero => exact hs
  | succ j ih =>
    let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
    have hi : r.1.1=j := protectedScheduledIterate_index cs ε M deadline start L p hn J s j
      (Nat.le_of_succ_le hj) ω
    have hlt : j<J := hj
    change let t := (protectedScheduledStep cs ε M deadline start L p hn J r).1.2
      0≤t.2.1 q ∧ t.2.1 q≤2*B
    simp only [protectedScheduledStep,hi,if_pos hlt]
    let cfg := (cs j).config
    let a := protectedPhaseStart cfg ε M r.1.2
    let k := augRecycledCompletionIndex cfg ε M hn a.1 r.2
    have hqv := protectedRecycledPair_saved_bounds_all cfg ε M L (hsp j) q hq hn a
      (ih (Nat.le_of_succ_le hj)) k r.2
    let v := (protectedRecycledPair cfg ε M L hn a k r.2).1
    exact protectedDeadlineBook_saved_bounds L (cs j).directions (hsp j) q hq deadline
      (phaseEndpoint cs start (j+1))
      (augTimedStateProjection cfg v.1,(v.2,r.1.2.2.2+cumulativeProtectedSource cfg ε M L p hn a k r.2)) hqv

theorem scheduledProtectedClock_phase_prefix_le {n : ℕ} {B : ℝ} {ι : Type*} [Fintype ι]
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B)
    (hsp : ∀i,specified (cs i).directions L)
    (hsv : ∀q∈L.val,0≤s.2.1 q ∧ s.2.1 q≤2*B)
    (ω : BoardClockPath n) (j : ℕ) (hj : j<J)
    (cells : ι→Finset (Grid n)) (c cap : ι→ℝ) (hc : ∀i,0≤c i) (hcap : ∀i,0≤cap i)
    (hm : (cs j).config.mask=sectionCellMask cells c)
    (hno : ∀i,ω∉scheduledProtectedExceedance cs ε M deadline start L 0 (L.val∩cells i) id hn (cap i) J s ∪
      scheduledProtectedExceedance cs ε M deadline start L 1 (L.val∩cells i) id hn (cap i) J s)
    (k : ℕ) :
    let cfg := (cs j).config
    let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
    let a := protectedPhaseStart cfg ε M r.1.2
    let v := (protectedRecycledPair cfg ε M L hn a k r.2).1
    v.1.val.1.physical.clocks L-a.1.val.1.physical.clocks L≤
      (a.1.val.2-v.1.val.2)*((∑i,c i*cap i)/n) := by
  let cfg := (cs j).config
  let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  let a := protectedPhaseStart cfg ε M r.1.2
  let v := fun m=>(protectedRecycledPair cfg ε M L hn a m r.2).1
  let C := (∑i,c i*cap i)/n
  have hstep (m : ℕ) : (v (m+1)).1.val.1.physical.clocks L-(v m).1.val.1.physical.clocks L≤
      ((v m).1.val.2-(v (m+1)).1.val.2)*C := by
    let z := WinnerMarkLaw.firstMarkedRace hn (protectedRecycledPair cfg ε M L hn a m r.2).2
    have hdrop : birthElapsed cfg ε M ((v m).1,z)=(v m).1.val.2-(v (m+1)).1.val.2 :=
      birthElapsed_eq_remaining_drop cfg ε M ((v m).1,z)
    have hsave (q : Grid n) (hq : q∈L.val) : 0≤(v m).2 q ∧ (v m).2 q≤2*cfg.B :=
      protectedRecycledPair_saved_bounds_all cfg ε M L (hsp j) q hq hn a
        (protectedScheduled_saved_at cs ε M deadline start L p hn J s hsp q hq (hsv q hq) j hj.le ω) m r.2
    have hs := augTimedStep_clock_le_protected_cells cfg ε M L (hsp j) (v m) z
      cells c cap hc hcap hm hsave (fun ho u hu hud i=>
        (scheduledProtected_twoStage_complement_bound cs ε M deadline start L (L.val∩cells i) id p hn
          (cap i) J s ω (hno i) j m hj ho).2 u hu (hdrop ▸ hud))
    rw [hdrop] at hs
    exact hs
  change (v k).1.val.1.physical.clocks L-a.1.val.1.physical.clocks L≤(a.1.val.2-(v k).1.val.2)*C
  induction k with
  | zero =>
    change a.1.val.1.physical.clocks L-a.1.val.1.physical.clocks L≤(a.1.val.2-a.1.val.2)*C
    simp
  | succ k ih =>
    calc
      _ = ((v (k+1)).1.val.1.physical.clocks L-(v k).1.val.1.physical.clocks L)+
          ((v k).1.val.1.physical.clocks L-a.1.val.1.physical.clocks L) := by ring
      _ ≤ ((v k).1.val.2-(v (k+1)).1.val.2)*C+(a.1.val.2-(v k).1.val.2)*C :=
        add_le_add (hstep k) ih
      _ = _ := by ring

end NoThreeLine

#print axioms NoThreeLine.protectedScheduled_saved_at
#print axioms NoThreeLine.scheduledProtectedClock_phase_prefix_le

