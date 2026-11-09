import Mathlib.Data.Fintype.EquivFin
import Mathlib.Tactic

/-! A finite tuple factors through its actual image, with a chosen section.
No injectivity of the original tuple is assumed, including the empty case. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine.FiniteTuplePattern

theorem exists_image_split {α : Type*} [DecidableEq α] {m : ℕ} (f : Fin m→α) :
    ∃code : Fin m→Fin (Finset.univ.image f).card,
    ∃rep : Fin (Finset.univ.image f).card→Fin m,
    Function.LeftInverse code rep ∧
    (∀i,f (rep (code i))=f i) ∧
    Function.Injective (fun j=>f (rep j)) ∧
    Finset.univ.image (fun j=>f (rep j))=Finset.univ.image f := by
  classical
  let S := Finset.univ.image f
  let e : S ≃ Fin S.card := S.equivFin
  have hex (x : S) : ∃i : Fin m,f i=x.val := by
    obtain ⟨i,_,hi⟩ := Finset.mem_image.mp x.property
    exact ⟨i,hi⟩
  choose pick hpick using hex
  let code : Fin m→Fin S.card := fun i=>e ⟨f i,Finset.mem_image.mpr ⟨i,Finset.mem_univ _,rfl⟩⟩
  let rep : Fin S.card→Fin m := fun j=>pick (e.symm j)
  have hr : Function.LeftInverse code rep := by
    intro j
    apply e.symm.injective
    dsimp only [code]
    rw [e.symm_apply_apply]
    exact Subtype.ext (hpick (e.symm j))
  have hf (i : Fin m) : f (rep (code i))=f i := by
    simpa only [rep,code,e.symm_apply_apply] using hpick (e.symm (code i))
  have hi : Function.Injective (fun j=>f (rep j)) := by
    intro j k heq
    apply e.symm.injective
    apply Subtype.ext
    exact (hpick (e.symm j)).symm.trans (heq.trans (hpick (e.symm k)))
  refine ⟨code,rep,hr,hf,hi,?_⟩
  ext x
  constructor
  · rintro hx
    obtain ⟨j,_,rfl⟩ := Finset.mem_image.mp hx
    exact Finset.mem_image.mpr ⟨rep j,Finset.mem_univ _,rfl⟩
  · rintro hx
    obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp hx
    exact Finset.mem_image.mpr ⟨code i,Finset.mem_univ _,hf i⟩

end NoThreeLine.FiniteTuplePattern

#print axioms NoThreeLine.FiniteTuplePattern.exists_image_split
