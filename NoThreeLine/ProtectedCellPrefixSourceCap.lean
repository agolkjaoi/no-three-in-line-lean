import NoThreeLine.ProtectedCellSegmentSourceCap

/-! Summing the sharp source caps charges the actual elapsed time once.
Every estimate concerns the same saved book, signed entropy and cost. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness LineDrift

theorem protectedCellPrefix_sources_le {n : ℕ} (cfg : FlowConfig n) (ε M d : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (hE : E⊆L.val) (hsp : specified cfg.directions L)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hBd : cfg.B≤(n:ℝ)^d) (hm : ∀q,cfg.mask q≤1)
    (hn0 : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n)
    (N : ℕ) (hN : N≤1) (hsv : ∀q∈E,0≤s.2 q ∧ s.2 q≤2*cfg.B) (cap : ℝ) (k : ℕ)
    (ho : ∀j<k,occupancy (protectedRecycledPair cfg ε M L hn0 s j ω).1.1.val.1.physical.process L=N)
    (hcap : ∀j<k,let v := (protectedRecycledPair cfg ε M L hn0 s j ω).1
      let w := (protectedRecycledPair cfg ε M L hn0 s (j+1) ω).1
      ∀u∈Ioo (0:ℝ) (v.1.val.2-w.1.val.2),protectedStateFlowTotal cfg L E id (v,u)≤cap) :
    let elapsed := s.1.val.2-(protectedRecycledPair cfg ε M L hn0 s k ω).1.1.val.2
    let β := (cfg.B/n)*(1-b N)
    cumulativeProtectedStateSource cfg ε M L (protectedCreditSourceField cfg L E) hn0 s k ω≤
      elapsed*(β*cap) ∧
    cumulativeProtectedStateSource cfg ε M L (protectedEntropySourceField cfg L E) hn0 s k ω+
      cumulativeProtectedStateSource cfg ε M L (protectedWholeCostField cfg L E) hn0 s k ω≤
        elapsed*(β*((entropyLogConstant d*Real.log n)*max 1 cap)) := by
  let r := fun j=>protectedRecycledPair cfg ε M L hn0 s j ω
  let t := fun j=>(r j).1.1.val.2-(r (j+1)).1.1.val.2
  let C := protectedCreditSourceField cfg L E
  let H := protectedEntropySourceField cfg L E
  let V := protectedWholeCostField cfg L E
  let β := (cfg.B/n)*(1-b N)
  have hstep (j : ℕ) (hj : j<k) :
      protectedClockStateSource cfg ε M C hn0 (r j)≤t j*(β*cap) ∧
      protectedClockStateSource cfg ε M H hn0 (r j)+protectedClockStateSource cfg ε M V hn0 (r j)≤
        t j*(β*((entropyLogConstant d*Real.log n)*max 1 cap)) := by
    let v := (r j).1
    let z := WinnerMarkLaw.firstMarkedRace hn0 (r j).2
    have ht : birthElapsed cfg ε M (v.1,z)=t j := birthElapsed_eq_remaining_drop cfg ε M (v.1,z)
    have hb := birthElapsed_mem cfg ε M (v.1,z)
    rw [ht] at hb
    have hs (p : Grid n) (hp : p∈E) : 0≤v.2 p ∧ v.2 p≤2*cfg.B :=
      protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hE hp) hn0 s (hsv p hp) j ω
    have hx := protectedCellSegment_sources_le cfg ε M d L E hE hsp hn hB hd hBd hm
      v N hN (ho j hj) hs cap (t j) hb (hcap j hj)
    simp only [protectedClockStateSource,protectedRunningScalarSource_eq_elapsed]
    change (∫u in (0:ℝ)..birthElapsed cfg ε M (v.1,z),
      C (selectedTrajectory cfg ((augTimedInput cfg v.1).1.1,u),v.2))≤_ ∧
      (∫u in (0:ℝ)..birthElapsed cfg ε M (v.1,z),
        H (selectedTrajectory cfg ((augTimedInput cfg v.1).1.1,u),v.2))+
      (∫u in (0:ℝ)..birthElapsed cfg ε M (v.1,z),
        V (selectedTrajectory cfg ((augTimedInput cfg v.1).1.1,u),v.2))≤_
    rw [ht]
    exact hx
  have htelescope (i : ℕ) : (∑j∈Finset.range i,t j)=s.1.val.2-(r i).1.1.val.2 := by
    induction i with
    | zero => change (0:ℝ)=s.1.val.2-s.1.val.2; ring
    | succ i ih => rw [Finset.sum_range_succ,ih]; unfold t; ring
  change cumulativeProtectedStateSource cfg ε M L C hn0 s k ω≤
      (s.1.val.2-(r k).1.1.val.2)*(β*cap) ∧
    cumulativeProtectedStateSource cfg ε M L H hn0 s k ω+
      cumulativeProtectedStateSource cfg ε M L V hn0 s k ω≤
        (s.1.val.2-(r k).1.1.val.2)*(β*((entropyLogConstant d*Real.log n)*max 1 cap))
  rw [←htelescope]
  unfold cumulativeProtectedStateSource
  simp only [Finset.sum_mul,←Finset.sum_add_distrib]
  exact ⟨Finset.sum_le_sum (fun j hj=>(hstep j (Finset.mem_range.mp hj)).1),
    Finset.sum_le_sum (fun j hj=>(hstep j (Finset.mem_range.mp hj)).2)⟩

end NoThreeLine

#print axioms NoThreeLine.protectedCellPrefix_sources_le

