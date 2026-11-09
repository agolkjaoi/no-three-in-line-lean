import NoThreeLine.ScheduledTwoStageCrossing

/-! On the complement of the two-stage event, every original executed
segment and boundary in the two stages obeys the same credit threshold. -/
set_option autoImplicit false
noncomputable section
open Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem scheduledProtected_twoStage_complement_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (p : Grid n) (hn : 0<n) (b : ℝ) (J : ℕ)
    (s : ProtectedPhaseState n B) (ω : BoardClockPath n)
    (hno : ω∉scheduledProtectedExceedance cs ε M deadline start L 0 E A hn b J s ∪
      scheduledProtectedExceedance cs ε M deadline start L 1 E A hn b J s)
    (j k : ℕ) (hj : j<J) :
    let cfg := (cs j).config
    let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
    let a := protectedPhaseStart cfg ε M r.1.2
    let v := (protectedRecycledPair cfg ε M L hn a k r.2).1
    let w := (protectedRecycledPair cfg ε M L hn a (k+1) r.2).1
    occupancy v.1.val.1.physical.process L≤1 →
      protectedStateTotal cfg L E A v≤b ∧
        ∀ t : ℝ, 0<t → t≤v.1.val.2-w.1.val.2 → protectedStateFlowTotal cfg L E A (v,t)≤b := by
  let cfg := (cs j).config
  let r := protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  let a := protectedPhaseStart cfg ε M r.1.2
  let v := (protectedRecycledPair cfg ε M L hn a k r.2).1
  let w := (protectedRecycledPair cfg ε M L hn a (k+1) r.2).1
  let N := occupancy v.1.val.1.physical.process L
  change N≤1 → protectedStateTotal cfg L E A v≤b ∧
    ∀ t : ℝ, 0<t → t≤v.1.val.2-w.1.val.2 → protectedStateFlowTotal cfg L E A (v,t)≤b
  intro hN
  have hn' (h : r.2∈protectedActualExceedance cfg ε M L N E A hn a b) : False := by
    have hglobal : ω∈scheduledProtectedExceedance cs ε M deadline start L N E A hn b J s :=
      (mem_scheduledProtectedExceedance_iff_original cs ε M deadline start L N E A p hn b J s ω).mpr
        ⟨j,hj,h⟩
    have hcases : N=0 ∨ N=1 := by omega
    rcases hcases with h₀ | h₁
    · rw [h₀] at hglobal
      exact hno (Or.inl hglobal)
    · rw [h₁] at hglobal
      exact hno (Or.inr hglobal)
  constructor
  · apply le_of_not_gt
    intro h
    apply hn'
    exact (mem_protectedActualExceedance_iff cfg ε M L N E A hn a b r.2).mpr
      ⟨k,rfl,Or.inl h⟩
  · intro t ht htd
    have hnd : ¬birthDone cfg v.1 := by
      intro hd
      have hh := protectedRestartStep_done cfg ε M L hn v ((birthDone_iff cfg v.1).mp hd)
        (protectedRecycledPair cfg ε M L hn a k r.2).2
      have hw : w=v := congrArg Prod.fst hh
      change t≤v.1.val.2-w.1.val.2 at htd
      rw [hw,sub_self] at htd
      exact (not_lt_of_ge htd) ht
    apply le_of_not_gt
    intro h
    apply hn'
    exact (mem_protectedActualExceedance_iff cfg ε M L N E A hn a b r.2).mpr
      ⟨k,rfl,Or.inr ⟨hnd,t,ht,htd,h⟩⟩

end NoThreeLine

#print axioms NoThreeLine.scheduledProtected_twoStage_complement_bound

