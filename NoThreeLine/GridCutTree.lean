import NoThreeLine.GridUnionCertificate
import Mathlib.Data.List.OfFn

/-! A binary spatial partition is a linear-size certificate of leaf separation.
The resulting checker implies the earlier integer union checker, so its actual
mask and area semantics are reused without new geometric assumptions. -/
set_option autoImplicit false
namespace NoThreeLine

def GridBox.left (R : GridBox) (x : ℕ) : GridBox := ⟨R.x0,x,R.y0,R.y1⟩
def GridBox.right (R : GridBox) (x : ℕ) : GridBox := ⟨x,R.x1,R.y0,R.y1⟩
def GridBox.bottom (R : GridBox) (y : ℕ) : GridBox := ⟨R.x0,R.x1,R.y0,y⟩
def GridBox.top (R : GridBox) (y : ℕ) : GridBox := ⟨R.x0,R.x1,y,R.y1⟩

theorem GridBox.contains_refl (R : GridBox) : R.ContainsBox R := ⟨le_rfl,le_rfl,le_rfl,le_rfl⟩
theorem GridBox.contains_trans (R A B : GridBox) (hRA : R.ContainsBox A) (hAB : A.ContainsBox B) :
    R.ContainsBox B :=
  ⟨hRA.1.trans hAB.1,hAB.2.1.trans hRA.2.1,hRA.2.2.1.trans hAB.2.2.1,hAB.2.2.2.trans hRA.2.2.2⟩
theorem GridBox.separated_symm (R A : GridBox) (h : R.Separated A) : A.Separated R := by
  unfold GridBox.Separated at *
  tauto

inductive GridCutTree where
  | empty
  | full
  | cutX (x : ℕ) (left right : GridCutTree)
  | cutY (y : ℕ) (bottom top : GridCutTree)
  deriving Repr

def GridCutTree.leaves : GridCutTree → GridBox → List GridBox
  | .empty, _ => []
  | .full, R => [R]
  | .cutX x a b, R => a.leaves (R.left x) ++ b.leaves (R.right x)
  | .cutY y a b, R => a.leaves (R.bottom y) ++ b.leaves (R.top y)

def GridCutTree.check : GridCutTree → GridBox → Bool
  | .empty, _ => true
  | .full, _ => true
  | .cutX x a b, R => decide (R.x0 ≤ x ∧ x ≤ R.x1) && a.check (R.left x) && b.check (R.right x)
  | .cutY y a b, R => decide (R.y0 ≤ y ∧ y ≤ R.y1) && a.check (R.bottom y) && b.check (R.top y)

theorem GridCutTree.leaf_properties (tree : GridCutTree) (G : ℕ) (R : GridBox)
    (hR : R.Valid G) (ht : tree.check R = true) (A : GridBox) (hA : A ∈ tree.leaves R) :
    R.ContainsBox A ∧ A.Valid G := by
  induction tree generalizing R with
  | empty => simp [leaves] at hA
  | full =>
    have he : A=R := by simpa only [leaves,List.mem_singleton] using hA
    subst A
    exact ⟨R.contains_refl,hR⟩
  | cutX x a b iha ihb =>
    simp only [check,Bool.and_eq_true,decide_eq_true_eq,and_assoc] at ht
    rcases ht with ⟨hx0,hx1,ha,hb⟩
    simp only [leaves,List.mem_append] at hA
    rcases hA with hA | hA
    · have hv : (R.left x).Valid G := ⟨hx0,hx1.trans hR.2.1,hR.2.2.1,hR.2.2.2⟩
      have hi := iha (R.left x) hv ha hA
      exact ⟨R.contains_trans (R.left x) A ⟨le_rfl,hx1,le_rfl,le_rfl⟩ hi.1,hi.2⟩
    · have hv : (R.right x).Valid G := ⟨hx1,hR.2.1,hR.2.2.1,hR.2.2.2⟩
      have hi := ihb (R.right x) hv hb hA
      exact ⟨R.contains_trans (R.right x) A ⟨hx0,le_rfl,le_rfl,le_rfl⟩ hi.1,hi.2⟩
  | cutY y a b iha ihb =>
    simp only [check,Bool.and_eq_true,decide_eq_true_eq,and_assoc] at ht
    rcases ht with ⟨hy0,hy1,ha,hb⟩
    simp only [leaves,List.mem_append] at hA
    rcases hA with hA | hA
    · have hv : (R.bottom y).Valid G := ⟨hR.1,hR.2.1,hy0,hy1.trans hR.2.2.2⟩
      have hi := iha (R.bottom y) hv ha hA
      exact ⟨R.contains_trans (R.bottom y) A ⟨le_rfl,le_rfl,le_rfl,hy1⟩ hi.1,hi.2⟩
    · have hv : (R.top y).Valid G := ⟨hR.1,hR.2.1,hy1,hR.2.2.2⟩
      have hi := ihb (R.top y) hv hb hA
      exact ⟨R.contains_trans (R.top y) A ⟨le_rfl,le_rfl,hy0,le_rfl⟩ hi.1,hi.2⟩

theorem GridCutTree.leaves_pairwise (tree : GridCutTree) (G : ℕ) (R : GridBox)
    (hR : R.Valid G) (ht : tree.check R = true) :
    (tree.leaves R).Pairwise GridBox.Separated := by
  induction tree generalizing R with
  | empty => simp [leaves]
  | full => simp [leaves]
  | cutX x a b iha ihb =>
    simp only [check,Bool.and_eq_true,decide_eq_true_eq,and_assoc] at ht
    rcases ht with ⟨hx0,hx1,ha,hb⟩
    have hleft : (R.left x).Valid G := ⟨hx0,hx1.trans hR.2.1,hR.2.2.1,hR.2.2.2⟩
    have hright : (R.right x).Valid G := ⟨hx1,hR.2.1,hR.2.2.1,hR.2.2.2⟩
    apply List.pairwise_append.mpr
    refine ⟨iha _ hleft ha,ihb _ hright hb,?_⟩
    intro A hA B hB
    have hla := (a.leaf_properties G _ hleft ha A hA).1
    have hrb := (b.leaf_properties G _ hright hb B hB).1
    exact Or.inl (hla.2.1.trans hrb.1)
  | cutY y a b iha ihb =>
    simp only [check,Bool.and_eq_true,decide_eq_true_eq,and_assoc] at ht
    rcases ht with ⟨hy0,hy1,ha,hb⟩
    have hbottom : (R.bottom y).Valid G := ⟨hR.1,hR.2.1,hy0,hy1.trans hR.2.2.2⟩
    have htop : (R.top y).Valid G := ⟨hR.1,hR.2.1,hy1,hR.2.2.2⟩
    apply List.pairwise_append.mpr
    refine ⟨iha _ hbottom ha,ihb _ htop hb,?_⟩
    intro A hA B hB
    have hba := (a.leaf_properties G _ hbottom ha A hA).1
    have htb := (b.leaf_properties G _ htop hb B hB).1
    exact Or.inr (Or.inr (Or.inl (hba.2.2.2.trans htb.2.2.1)))

def gridTreeUnionCheck {n m : ℕ} (G : ℕ) (R : Fin n → GridBox) (A : Fin m → GridBox)
    (cover : Fin n → Fin m) (source : Fin m → Fin n) (tree : GridCutTree) : Bool :=
  decide ((∀ j, A j = R (source j)) ∧ (∀ i, (A (cover i)).ContainsBox (R i)) ∧
    tree.check ⟨0,G,0,G⟩ = true ∧ List.ofFn A = tree.leaves ⟨0,G,0,G⟩)

theorem gridTreeUnionCheck_sound {n m : ℕ} (G : ℕ) (R : Fin n → GridBox) (A : Fin m → GridBox)
    (cover : Fin n → Fin m) (source : Fin m → Fin n) (tree : GridCutTree)
    (hc : gridTreeUnionCheck G R A cover source tree = true) :
    gridUnionCheck G R A cover source = true := by
  have hh : (∀ j, A j = R (source j)) ∧ (∀ i, (A (cover i)).ContainsBox (R i)) ∧
      tree.check ⟨0,G,0,G⟩ = true ∧ List.ofFn A = tree.leaves ⟨0,G,0,G⟩ := by
    simpa only [gridTreeUnionCheck,decide_eq_true_eq] using hc
  have hr : GridBox.Valid G ⟨0,G,0,G⟩ := ⟨Nat.zero_le _,le_rfl,Nat.zero_le _,le_rfl⟩
  have hp : (List.ofFn A).Pairwise GridBox.Separated := by
    rw [hh.2.2.2]
    exact tree.leaves_pairwise G _ hr hh.2.2.1
  apply decide_eq_true_eq.mpr
  refine ⟨hh.1,hh.2.1,?_,?_⟩
  · intro j
    apply (tree.leaf_properties G _ hr hh.2.2.1 (A j) ?_).2
    rw [← hh.2.2.2]
    exact List.mem_ofFn.mpr ⟨j,rfl⟩
  · intro i j hij
    rcases lt_or_gt_of_ne hij with h | h
    · exact List.pairwise_ofFn.mp hp h
    · exact (A j).separated_symm (A i) (List.pairwise_ofFn.mp hp h)

end NoThreeLine

#print axioms NoThreeLine.GridCutTree.leaves_pairwise
#print axioms NoThreeLine.gridTreeUnionCheck_sound
