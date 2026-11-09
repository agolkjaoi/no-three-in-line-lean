import NoThreeLine.ScheduledShiftedClockBound

/-! Spend a fixed credit gap across the actual phase boundaries. This
allows a one-phase concentration estimate to be used on the finite
schedule while retaining the same original saved and moving credits. -/
set_option autoImplicit false
set_option maxHeartbeats 2150000
noncomputable section
open Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

def protectedPhaseTotal {n : ℕ} {B : ℝ} (L : LineIndex n) (E : Finset (Grid n))
    (A : ℝ→ℝ) (s : ProtectedPhaseState n B) : ℝ :=
  ∑p∈E,A (protectedPhaseCredit L p s)

theorem protectedPhaseEnd_total {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (deadline : Grid n→ℝ) (t : ℝ)
    (x : (ProtectedTimedState cfg×ℝ)×ℝ) :
    protectedPhaseTotal L E A (protectedPhaseEnd cfg L deadline t x)=protectedStateTotal cfg L E A x.1.1 := by
  apply Finset.sum_congr rfl
  intro p _
  rw [protectedPhaseEnd_credit]
  rfl

theorem protectedScheduledPair_total_le_of_no_crossing {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (p : Grid n) (hn : 0<n) (j N : ℕ)
    (s : ProtectedPhaseState n B) (ω : BoardClockPath n) (b : ℝ)
    (ho : occupancy (protectedScheduledPair cs ε M deadline start L p hn j (s,ω)).1.1.val.physical.process L=N)
    (hno : ω∉protectedActualExceedance (cs j).config ε M L N E A hn
      (protectedPhaseStart (cs j).config ε M s) b) :
    protectedPhaseTotal L E A (protectedScheduledPair cs ε M deadline start L p hn j (s,ω)).1≤b := by
  let cfg := (cs j).config
  let a := protectedPhaseStart cfg ε M s
  let k := augRecycledCompletionIndex cfg ε M hn a.1 ω
  let v := (protectedRecycledPair cfg ε M L hn a k ω).1
  let x := ((v,cumulativeProtectedSource cfg ε M L p hn a k ω),s.2.2)
  have hocc : occupancy v.1.val.1.physical.process L=N := by
    change occupancy (protectedPhaseEnd cfg L deadline (phaseEndpoint cs start (j+1)) x).1.val.physical.process L=N at ho
    unfold protectedPhaseEnd protectedDeadlineBook at ho
    rwa [augValidDeadlineRetirement_occupancy] at ho
  change protectedPhaseTotal L E A (protectedPhaseEnd cfg L deadline (phaseEndpoint cs start (j+1)) x)≤b
  rw [protectedPhaseEnd_total]
  apply le_of_not_gt
  intro h
  exact hno ((mem_protectedActualExceedance_iff cfg ε M L N E A hn a b ω).mpr
    ⟨k,hocc,Or.inl h⟩)

theorem scheduledProtected_crossing_has_phase_with_small_entry {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (A : ℝ→ℝ)
    (p : Grid n) (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B)
    (base step : ℝ) (hstep : 0≤step) (ω : BoardClockPath n)
    (hbase : protectedPhaseTotal L E A s≤base)
    (hocc : ∀j≤J,occupancy (protectedScheduledIterate cs ε M deadline start L p hn J s j ω).1.2.1.val.physical.process L=N)
    (hcross : ω∈scheduledProtectedExceedance cs ε M deadline start L N E A hn (base+(J:ℝ)*step) J s) :
    ∃j<J,let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
      protectedPhaseTotal L E A r.1.2≤base+(j:ℝ)*step ∧
      r.2∈protectedActualExceedance (cs j).config ε M L N E A hn
        (protectedPhaseStart (cs j).config ε M r.1.2) (base+(j+1:ℕ)*step) := by
  let ref := fun j=>protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  let U := fun j : ℕ=>base+(j:ℝ)*step
  let P := fun j=>(ref j).2∈protectedActualExceedance (cs j).config ε M L N E A hn
    (protectedPhaseStart (cs j).config ε M (ref j).1.2) (U (j+1))
  by_contra hbad
  have hcap (j : ℕ) (hj : j≤J) : protectedPhaseTotal L E A (ref j).1.2≤U j := by
    induction j with
    | zero => simpa [ref,protectedScheduledIterate,iterate,U] using hbase
    | succ j ih =>
      have hj' : j<J := hj
      have hi := protectedScheduledIterate_index cs ε M deadline start L p hn J s j hj'.le ω
      have hnext : (ref (j+1)).1.2=(protectedScheduledPair cs ε M deadline start L p hn j
          ((ref j).1.2,(ref j).2)).1 := by
        change (protectedScheduledStep cs ε M deadline start L p hn J (ref j)).1.2=_
        simp only [protectedScheduledStep,show (ref j).1.1=j from hi,if_pos hj']
      have hno : ¬P j := fun h=>hbad ⟨j,hj',ih hj'.le,h⟩
      rw [hnext]
      exact protectedScheduledPair_total_le_of_no_crossing cs ε M deadline start L E A p hn j N
        (ref j).1.2 (ref j).2 (U (j+1)) (hnext ▸ hocc (j+1) hj) hno
  obtain ⟨j,hj,h⟩ := (mem_scheduledProtectedExceedance_iff_original cs ε M deadline start L N E A p hn
    (U J) J s ω).mp hcross
  have he : U (j+1)≤U J := add_le_add le_rfl
    (mul_le_mul_of_nonneg_right (by exact_mod_cast Nat.succ_le_of_lt hj) hstep)
  have hh : P j := by
    let cfg := (cs j).config
    let a := protectedPhaseStart cfg ε M (ref j).1.2
    change (ref j).2∈protectedActualExceedance cfg ε M L N E A hn a (U J) at h
    change (ref j).2∈protectedActualExceedance cfg ε M L N E A hn a (U (j+1))
    rw [mem_protectedActualExceedance_iff] at h ⊢
    obtain ⟨k,hN,hk⟩ := h
    refine ⟨k,hN,?_⟩
    rcases hk with h | ⟨hd,t,ht,htd,h⟩
    · exact Or.inl (he.trans_lt h)
    · exact Or.inr ⟨hd,t,ht,htd,he.trans_lt h⟩
  exact hbad ⟨j,hj,hcap j hj.le,hh⟩

end NoThreeLine

#print axioms NoThreeLine.protectedScheduledPair_total_le_of_no_crossing
#print axioms NoThreeLine.scheduledProtected_crossing_has_phase_with_small_entry

