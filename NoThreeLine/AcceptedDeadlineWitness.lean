import NoThreeLine.ReferencePrefixBound

/-! A positive actual accepted mask supplies an actual leaf image containing
the root. At the root's last positive phase, all partner inputs use that same
deadline. Numerical leaf certificates are not assumed or supplied here. -/
set_option autoImplicit false
open Set
noncomputable section
namespace NoThreeLine

theorem AcceptedPhase.mask_positive_witness {L : ℕ} (a : AcceptedPhase L)
    (G : ℕ) (V H : Finset ℝ) (r : Fin 4) (x y : ℝ) (hp : 0 < a.mask G V H r x y) :
    r = a.rootType ∧ x ∉ V ∧ y ∉ H ∧ ∃ i : Fin (a.count*4),
      (x,y) ∈ ((phaseImageBoxes G L a.sx a.sy a.leaves i).qrect G).real.closedSet := by
  classical
  have hr : r = a.rootType := by
    by_contra hn
    simp [AcceptedPhase.mask,hn] at hp
  have hp' : 0 < rectangleUnionMask Finset.univ
      (fun i => ((phaseImageBoxes G L a.sx a.sy a.leaves i).qrect G).real) V H x y := by
    simpa only [AcceptedPhase.mask,if_pos hr] using hp
  have hbd : ¬(x ∈ V ∨ y ∈ H) := by
    intro hb
    simp [rectangleUnionMask,eraseGrid,hb] at hp'
  have hm : (x,y) ∈ interior (closedRectangleUnion Finset.univ
      (fun i => ((phaseImageBoxes G L a.sx a.sy a.leaves i).qrect G).real)) := by
    by_contra hn
    simp [rectangleUnionMask,eraseGrid,hbd,hn] at hp'
  obtain ⟨i,_,hi⟩ := interior_subset hm
  exact ⟨hr,fun hx => hbd (Or.inl hx),fun hy => hbd (Or.inr hy),i,hi⟩

theorem AcceptedPhase.boardInput_positive_witness {n : ℕ} (a : AcceptedPhase 8)
    (q : Grid n) (hp : 0 < a.boardInput q) :
    GridArea.typeCode (GridArea.pointType q) = a.rootType ∧
      ∃ i : Fin (a.count*4),
        (GridChord.normX n (PrimitiveLines.gridEmbed q),
          GridChord.normY n (PrimitiveLines.gridEmbed q)) ∈
            ((phaseImageBoxes 32768 8 a.sx a.sy a.leaves i).qrect 32768).real.closedSet := by
  have hw := a.mask_positive_witness 32768 (commonGridLines 32768) (commonGridLines 32768)
    (GridArea.typeCode (GridArea.pointType q)) _ _ hp
  exact ⟨hw.1,hw.2.2.2⟩

namespace FrozenReference
open FinitePhase

theorem accepted_deadline_witness {J : ℕ} (s : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀ j, PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (scale : ℝ) (hscale : 0 ≤ scale)
    (hd : ∀ j, s.duration j ≤ scale*((phaseUnits (index j) : ℝ)/100000000))
    (rootType : Fin 4) (rootX rootY : ℝ) :
    let T := s.deadline (fun j => (a j).phase.mask 32768
      (commonGridLines 32768) (commonGridLines 32768) rootType rootX rootY)
    T=0 ∨ ∃ k : Fin J, ∃ i : Fin ((a k).phase.count*4),
      rootType=(a k).phase.rootType ∧
      0 < (a k).phase.mask 32768 (commonGridLines 32768) (commonGridLines 32768) rootType rootX rootY ∧
      T=s.hi k ∧
      (rootX,rootY) ∈ ((phaseImageBoxes 32768 8 (a k).phase.sx (a k).phase.sy
        (a k).phase.leaves i).qrect 32768).real.closedSet ∧
      ∀ r : Fin 4, ∀ x y : ℝ,
        s.acceptedPrefix (fun j => (a j).phase) 32768
          (commonGridLines 32768) (commonGridLines 32768) T r x y ≤
            scale*fullPhasePrefix (index k) r x y := by
  let c : Fin J → ℝ := fun j => (a j).phase.mask 32768
    (commonGridLines 32768) (commonGridLines 32768) rootType rootX rootY
  change s.deadline c=0 ∨ _
  rcases s.deadline_eq_zero_or_used_right c with hz | ⟨k,hk,he⟩
  · exact Or.inl hz
  · have hw := (a k).phase.mask_positive_witness 32768 _ _ rootType rootX rootY hk
    obtain ⟨i,hcell⟩ := hw.2.2.2
    refine Or.inr ⟨k,i,hw.1,hk,he,hcell,?_⟩
    intro r x y
    exact acceptedPrefix_le_fullPhasePrefix s a index hm hi scale hscale hd k (index k)
      le_rfl (s.deadline c) (s.deadline_nonneg c) he.le r x y

end FrozenReference
end NoThreeLine

#print axioms NoThreeLine.AcceptedPhase.mask_positive_witness
#print axioms NoThreeLine.AcceptedPhase.boardInput_positive_witness
#print axioms NoThreeLine.FrozenReference.accepted_deadline_witness
