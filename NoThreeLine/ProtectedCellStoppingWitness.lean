import NoThreeLine.ProtectedCellStopCut

/-! A strict exceedance has a first boundary or interior stop. Every
completed segment stays within the credit cap, and the actual accrued
cost at the stop stays within its budget. -/
set_option autoImplicit false
set_option maxHeartbeats 2500000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem cumulativeProtectedCutSource_elapsed_eq_succ {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (k : ℕ) (ω : BoardClockPath n) :
    let v := (protectedRecycledPair cfg ε M L hn s k ω).1
    let z := WinnerMarkLaw.firstMarkedRace hn (protectedRecycledPair cfg ε M L hn s k ω).2
    cumulativeProtectedCutSource cfg ε M L F hn s k ω (birthElapsed cfg ε M (v.1,z))=
      cumulativeProtectedStateSource cfg ε M L F hn s (k+1) ω := by
  let r := protectedRecycledPair cfg ε M L hn s k ω
  let z := WinnerMarkLaw.firstMarkedRace hn r.2
  let t := birthElapsed cfg ε M (r.1.1,z)
  have ht : 0≤t := (birthElapsed_mem cfg ε M (r.1.1,z)).1
  change cumulativeProtectedCutSource cfg ε M L F hn s k ω t=
    cumulativeProtectedStateSource cfg ε M L F hn s (k+1) ω
  rw [cumulativeProtectedCutSource,cumulativeProtectedStateSource_succ]
  congr 1
  simp only [protectedLocalStateSource,max_eq_right ht,protectedClockStateSource,protectedRunningScalarSource_eq_elapsed,t,z,r]

theorem protectedCell_crossing_has_stoppingWitness {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (E : Finset (Grid n)) (hn : 0<n)
    (s : ProtectedTimedState cfg) (cap w : ℝ) (hw : 0≤w) (ω : BoardClockPath n)
    (hcross : ω∈protectedActualExceedance cfg ε M L N E id hn s cap) :
    let v := fun j=>(protectedRecycledPair cfg ε M L hn s j ω).1
    let C := fun j=>protectedStateTotal cfg L E id (v j)
    let W := fun j=>cumulativeProtectedStateSource cfg ε M L (protectedWholeCostField cfg L E) hn s j ω
    let d := fun j=>(v j).1.val.2-(v (j+1)).1.val.2
    let u := fun j=>protectedCellStopCut cfg ε M L E cap (v j,w-W j)
    ∃k : ℕ,
      (∀j<k,C j<cap ∧ W j<w ∧ d j≤u j) ∧
      (∀j<k,∀t∈Ioo (0:ℝ) (d j),protectedStateFlowTotal cfg L E id (v j,t)≤cap) ∧ W k≤w ∧
      ((cap≤C k ∨ W k=w) ∨
        (¬birthDone cfg (v k).1 ∧ u k<d k ∧
          (∀t∈Ioo (0:ℝ) (u k),protectedStateFlowTotal cfg L E id (v k,t)≤cap) ∧
          cumulativeProtectedCutSource cfg ε M L (protectedWholeCostField cfg L E) hn s k ω (u k)≤w ∧
          (cap≤protectedStateFlowTotal cfg L E id (v k,u k) ∨
            cumulativeProtectedCutSource cfg ε M L (protectedWholeCostField cfg L E) hn s k ω (u k)=w))) := by
  classical
  let v := fun j=>(protectedRecycledPair cfg ε M L hn s j ω).1
  let C := fun j=>protectedStateTotal cfg L E id (v j)
  let F := protectedWholeCostField cfg L E
  let W := fun j=>cumulativeProtectedStateSource cfg ε M L F hn s j ω
  let d := fun j=>(v j).1.val.2-(v (j+1)).1.val.2
  let u := fun j=>protectedCellStopCut cfg ε M L E cap (v j,w-W j)
  let hit := fun j=>cap≤C j ∨ w≤W j ∨ u j<d j
  let z := fun j=>WinnerMarkLaw.firstMarkedRace hn (protectedRecycledPair cfg ε M L hn s j ω).2
  have he (j : ℕ) : birthElapsed cfg ε M ((v j).1,z j)=d j :=
    birthElapsed_eq_remaining_drop cfg ε M ((v j).1,z j)
  have hd (j : ℕ) : d j∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg (v j).1)) := by
    rw [←he j]
    exact birthElapsed_mem cfg ε M ((v j).1,z j)
  have hat (j : ℕ) (hc : C j≤cap) (hwj : W j≤w) :=
    protectedCellStopCut_at_le cfg ε M L E cap (v j,w-W j) hc (sub_nonneg.mpr hwj)
  have hex : ∃j,hit j := by
    obtain ⟨j,_,hj⟩ := (mem_protectedActualExceedance_iff cfg ε M L N E id hn s cap ω).mp hcross
    refine ⟨j,?_⟩
    rcases hj with hj | ⟨_,t,ht0,htd,ht⟩
    · exact Or.inl hj.le
    by_cases hc : cap≤C j
    · exact Or.inl hc
    by_cases hw' : w≤W j
    · exact Or.inr (Or.inl hw')
    have hcontact := protectedCellStopCut_contact cfg ε M L E cap (v j,w-W j) t
      ⟨ht0.le,htd.trans (hd j).2⟩ (Or.inl ht.le)
    have hlt : u j<t := by
      apply lt_of_le_of_ne hcontact.1
      intro hsame
      change u j=t at hsame
      have hup : protectedStateFlowTotal cfg L E id (v j,u j)≤cap := (hat j (le_of_not_ge hc) (le_of_not_ge hw')).1
      rw [hsame] at hup
      exact (not_lt_of_ge hup) ht
    exact Or.inr (Or.inr (hlt.trans_le htd))
  let k := Nat.find hex
  have hmin (j : ℕ) (hj : j<k) : C j<cap ∧ W j<w ∧ d j≤u j := by
    have hh := Nat.find_min hex hj
    change ¬(cap≤C j ∨ w≤W j ∨ u j<d j) at hh
    push Not at hh
    exact hh
  have hprefix (j : ℕ) (hj : j<k) (t : ℝ) (ht : t∈Ioo (0:ℝ) (d j)) :
      protectedStateFlowTotal cfg L E id (v j,t)≤cap :=
    (protectedCellStopCut_before cfg ε M L E cap (v j,w-W j) t ht.1.le
      (ht.2.trans_le (hmin j hj).2.2)).1.le
  have hwk : W k≤w := by
    by_cases hz : k=0
    · simpa only [hz,W,cumulativeProtectedStateSource,Finset.range_zero,Finset.sum_empty] using hw
    · let j := k-1
      have hjk : j<k := by dsimp [j]; omega
      have hj : j+1=k := by dsimp [j]; omega
      have hjm := hmin j hjk
      have hlocal : protectedLocalStateSource cfg F (v j,d j)≤w-W j := by
        rcases lt_or_eq_of_le hjm.2.2 with hd' | hd'
        · exact (protectedCellStopCut_before cfg ε M L E cap (v j,w-W j) (d j) (hd j).1 hd').2.le
        · rw [hd']
          exact (hat j hjm.1.le hjm.2.1.le).2
      have hsucc := cumulativeProtectedCutSource_elapsed_eq_succ cfg ε M L F hn s j ω
      change cumulativeProtectedCutSource cfg ε M L F hn s j ω (birthElapsed cfg ε M ((v j).1,z j))=W (j+1) at hsucc
      rw [he j,hj] at hsucc
      change W j+protectedLocalStateSource cfg F (v j,d j)=W k at hsucc
      linarith
  refine ⟨k,hmin,hprefix,hwk,?_⟩
  by_cases hc : cap≤C k
  · exact Or.inl (Or.inl hc)
  by_cases hw' : w≤W k
  · exact Or.inl (Or.inr (le_antisymm hwk hw'))
  have hhit : hit k := Nat.find_spec hex
  have hu : u k<d k := (hhit.resolve_left hc).resolve_left hw'
  have hdone : ¬birthDone cfg (v k).1 := by
    intro h
    have hd0 : d k=0 := by rw [←he k,birthElapsed,if_pos h]
    rw [hd0] at hu
    exact (not_lt_of_ge (protectedCellStopCut_bounds cfg ε M L E cap (v k,w-W k)).1) hu
  have hcb : protectedLocalStateSource cfg F (v k,u k)≤w-W k := (hat k (le_of_not_ge hc) hwk).2
  have hcontact := protectedCellStopCut_contact_of_lt_guard cfg ε M L E cap (v k,w-W k)
    (hu.trans_le (hd k).2)
  refine Or.inr ⟨hdone,hu,?_,?_,?_⟩
  · exact fun t ht=>(protectedCellStopCut_before cfg ε M L E cap (v k,w-W k) t ht.1.le ht.2).1.le
  · change W k+protectedLocalStateSource cfg F (v k,u k)≤w
    linarith
  · rcases hcontact with h | h
    · exact Or.inl h
    · right
      change W k+protectedLocalStateSource cfg F (v k,u k)=w
      change w-W k≤protectedLocalStateSource cfg F (v k,u k) at h
      linarith

end NoThreeLine

#print axioms NoThreeLine.protectedCell_crossing_has_stoppingWitness

