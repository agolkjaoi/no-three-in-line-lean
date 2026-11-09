import NoThreeLine.DyadicPhaseInput
import NoThreeLine.UnionScheduleSemantics

/-! Every valid accepted dyadic leaf and each of its four input symmetries
lie in the corresponding coarse source square. This gives actual erased-mask
domination, even when symmetry images overlap or touch on the fine grid. -/
set_option autoImplicit false
namespace NoThreeLine

theorem dyadicGridBox_contained (L sx sy : ℕ) (b : DyadicLeaf) (hb : b.Valid L) :
    (dyadicGridBox L sx sy ⟨0,0,0⟩).ContainsBox (dyadicGridBox L sx sy b) := by
  rcases hb with ⟨hd,hbx,hby⟩
  have hx : (b.x+1)*2^(L-b.depth) ≤ 2^L := calc
    _ ≤ 2^b.depth*2^(L-b.depth) := Nat.mul_le_mul_right _ (by omega)
    _ = 2^L := by rw [← pow_add]; congr 1; omega
  have hy : (b.y+1)*2^(L-b.depth) ≤ 2^L := calc
    _ ≤ 2^b.depth*2^(L-b.depth) := Nat.mul_le_mul_right _ (by omega)
    _ = 2^L := by rw [← pow_add]; congr 1; omega
  simp only [GridBox.ContainsBox,dyadicGridBox,Nat.sub_zero,Nat.zero_mul,
    Nat.add_zero,Nat.zero_add,Nat.one_mul]
  omega

theorem GridBox.symmetry_contains (G : ℕ) (A R : GridBox) (h : A.ContainsBox R)
    (f : Fin 4) : (A.symmetry G f).ContainsBox (R.symmetry G f) := by
  fin_cases f <;> simp [GridBox.symmetry,GridBox.ContainsBox] at * <;> omega

def phaseCoarseBoxes (G L sx sy : ℕ) (f : Fin 4) : GridBox :=
  (dyadicGridBox L sx sy ⟨0,0,0⟩).symmetry G f

theorem phaseImageBoxes_contained {N : ℕ} (G L sx sy : ℕ) (boxes : Fin N → DyadicLeaf)
    (hb : ∀ i, (boxes i).Valid L) (i : Fin (N*4)) :
    (phaseCoarseBoxes G L sx sy ⟨i.val%4,by omega⟩).ContainsBox
      (phaseImageBoxes G L sx sy boxes i) := by
  exact GridBox.symmetry_contains G _ _
    (dyadicGridBox_contained L sx sy _ (hb _)) _

noncomputable section

theorem phaseUnionMask_le_coarse {N : ℕ} (G L sx sy : ℕ) (hG : 0 < G)
    (boxes : Fin N → DyadicLeaf) (hb : ∀ i, (boxes i).Valid L)
    (V H : Finset ℝ) (x y : ℝ) :
    rectangleUnionMask Finset.univ
      (fun i => ((phaseImageBoxes G L sx sy boxes i).qrect G).real) V H x y ≤
    rectangleUnionMask Finset.univ
      (fun f => ((phaseCoarseBoxes G L sx sy f).qrect G).real) V H x y := by
  exact gridUnionMask_le_of_cover G hG _ _ (fun i => ⟨i.val%4,by omega⟩)
    (phaseImageBoxes_contained G L sx sy boxes hb) V H x y

end
end NoThreeLine

#print axioms NoThreeLine.phaseUnionMask_le_coarse
