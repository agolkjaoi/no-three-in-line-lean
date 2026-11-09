import NoThreeLine.ScheduledProtectedClockPhase

/-! Sum the cell bounds over the real scheduled phases. The schedule
uses its original phase durations and absolute deadline retirements. -/
set_option autoImplicit false
set_option maxHeartbeats 1900000
noncomputable section
open Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem scheduledTerminal_clock {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (j : ℕ) (ω : BoardClockPath n) (L : LineIndex n) :
    (augRecycledTerminal (cs j).config ε M hn
      (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
      (recycledPhases cs ε M deadline start hn e j ω).2).val.1.physical.clocks L=
    (recycledPhaseState cs ε M deadline start hn e (j+1) ω).val.physical.clocks L := by
  rw [recycledPhaseState_succ_eq,recycledScheduledPair,augValidDeadlineRetirement_clocks]
  rfl

theorem scheduledProtectedClock_budget_le {n : ℕ} {B : ℝ} {ι : Type*} [Fintype ι]
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B)
    (hsp : ∀i,specified (cs i).directions L)
    (hsv : ∀q∈L.val,0≤s.2.1 q ∧ s.2.1 q≤2*B)
    (ω : BoardClockPath n) (cells : ι→Finset (Grid n)) (c : ℕ→ι→ℝ) (cap : ι→ℝ)
    (hc : ∀j i,0≤c j i) (hcap : ∀i,0≤cap i)
    (hm : ∀ j < J,(cs j).config.mask=sectionCellMask cells (c j))
    (hno : ∀i,ω∉scheduledProtectedExceedance cs ε M deadline start L 0 (L.val∩cells i) id hn (cap i) J s ∪
      scheduledProtectedExceedance cs ε M deadline start L 1 (L.val∩cells i) id hn (cap i) J s)
    (k : ℕ) (hk : k≤J) :
    (recycledPhaseState cs ε M deadline start hn s.1 k ω).val.physical.clocks L-s.1.val.physical.clocks L≤
      ∑j∈Finset.range k,(cs j).horizon*((∑i,c j i*cap i)/n) := by
  let K := fun j=>(recycledPhaseState cs ε M deadline start hn s.1 j ω).val.physical.clocks L
  let C := fun j=>(∑i,c j i*cap i)/n
  have hinc (j : ℕ) (hj : j<J) : K (j+1)-K j≤(cs j).horizon*C j := by
    let cfg := (cs j).config
    let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
    let a := protectedPhaseStart cfg ε M r.1.2
    let u := augRecycledCompletionIndex cfg ε M hn a.1 r.2
    let v := (protectedRecycledPair cfg ε M L hn a u r.2).1
    have hp := protectedScheduledIterate_projection cs ε M deadline start L p hn J s j hj.le ω
    have ha : a.1=augPhaseStart cfg ε M (recycledPhaseState cs ε M deadline start hn s.1 j ω) :=
      congrArg (augPhaseStart cfg ε M) (congrArg (fun x=>x.1.2) hp)
    have hr : r.2=(recycledPhases cs ε M deadline start hn s.1 j ω).2 := congrArg Prod.snd hp
    have hv : v.1=augRecycledTerminal cfg ε M hn a.1 r.2 :=
      congrArg Prod.fst (protectedRecycledTerminalPair_projection cfg ε M L hn a r.2)
    have he : v.1.val.1.physical.clocks L=K (j+1) := by
      rw [hv,ha,hr]
      exact scheduledTerminal_clock cs ε M deadline start hn s.1 j ω L
    have hstart : a.1.val.1.physical.clocks L=K j := by rw [ha]; rfl
    have htime : a.1.val.2-v.1.val.2≤(cs j).horizon := sub_le_self _ v.1.property.2.1
    have hC : 0≤C j := div_nonneg
      (Finset.sum_nonneg (fun i _=>mul_nonneg (hc j i) (hcap i))) (Nat.cast_nonneg n)
    calc
      K (j+1)-K j = v.1.val.1.physical.clocks L-a.1.val.1.physical.clocks L := by rw [he,hstart]
      _ ≤ (a.1.val.2-v.1.val.2)*C j :=
        scheduledProtectedClock_phase_prefix_le cs ε M deadline start L p hn J s hsp hsv ω j hj
          cells (c j) cap (hc j) hcap (hm j hj) hno u
      _ ≤ _ := mul_le_mul_of_nonneg_right htime hC
  change K k-s.1.val.physical.clocks L≤∑j∈Finset.range k,(cs j).horizon*C j
  induction k with
  | zero =>
    change s.1.val.physical.clocks L-s.1.val.physical.clocks L≤_
    simp
  | succ k ih =>
    rw [Finset.sum_range_succ]
    calc
      _ = (K k-s.1.val.physical.clocks L)+(K (k+1)-K k) := by ring
      _ ≤ _ := add_le_add (ih (Nat.le_of_succ_le hk)) (hinc k hk)

end NoThreeLine

#print axioms NoThreeLine.scheduledTerminal_clock
#print axioms NoThreeLine.scheduledProtectedClock_budget_le

