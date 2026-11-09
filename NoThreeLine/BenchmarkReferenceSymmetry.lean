import NoThreeLine.ReferencePrefixBound
import NoThreeLine.BenchmarkCoarseRefinement

/-! The literal reference prefix retains the source orbit's swap and central
symmetries for each fixed type. Both fields use the same erased common grid.
This concerns the actual reference construction, not a symmetry hypothesis. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine

theorem coarseFlip_involutive (i : Fin 128) : coarseFlip (coarseFlip i)=i := by
  apply Fin.ext
  dsimp [coarseFlip]
  have := i.isLt
  omega

theorem coarseFlip_eq_iff (i j : Fin 128) : coarseFlip i=j ↔ i=coarseFlip j := by
  constructor
  · intro h
    simpa only [coarseFlip_involutive] using congrArg coarseFlip h
  · intro h
    simpa only [coarseFlip_involutive] using congrArg coarseFlip h

def coarseSwapEquiv : Grid 128 ≃ Grid 128 where
  toFun p := (p.2,p.1)
  invFun p := (p.2,p.1)
  left_inv _ := rfl
  right_inv _ := rfl

def coarseCentralEquiv : Grid 128 ≃ Grid 128 where
  toFun p := (coarseFlip p.1,coarseFlip p.2)
  invFun p := (coarseFlip p.1,coarseFlip p.2)
  left_inv p := by simp only [coarseFlip_involutive]
  right_inv p := by simp only [coarseFlip_involutive]

theorem mem_coarseOrbit_iff (p q : Grid 128) :
    q ∈ Finset.univ.image (coarseSymmetry p) ↔
      q=p ∨ q=(p.2,p.1) ∨ q=(coarseFlip p.1,coarseFlip p.2) ∨
        q=(coarseFlip p.2,coarseFlip p.1) := by
  constructor
  · intro h
    rcases Finset.mem_image.mp h with ⟨f,hf,hq⟩
    fin_cases f <;> simp [coarseSymmetry] at hq <;> simp [←hq]
  · rintro (h|h|h|h)
    · exact Finset.mem_image.mpr ⟨0,Finset.mem_univ _,h.symm⟩
    · exact Finset.mem_image.mpr ⟨1,Finset.mem_univ _,h.symm⟩
    · exact Finset.mem_image.mpr ⟨2,Finset.mem_univ _,h.symm⟩
    · exact Finset.mem_image.mpr ⟨3,Finset.mem_univ _,h.symm⟩

theorem coarseOrbitWeight_swap (p q : Grid 128) :
    coarseOrbitWeight p (q.2,q.1)=coarseOrbitWeight p q := by
  have he : (q.2,q.1) ∈ Finset.univ.image (coarseSymmetry p) ↔
      q ∈ Finset.univ.image (coarseSymmetry p) := by
    rcases p with ⟨px,py⟩
    rcases q with ⟨qx,qy⟩
    simp only [mem_coarseOrbit_iff,Prod.mk.injEq]
    tauto
  unfold coarseOrbitWeight
  simp only [he]

theorem coarseOrbitWeight_central (p q : Grid 128) :
    coarseOrbitWeight p (coarseFlip q.1,coarseFlip q.2)=coarseOrbitWeight p q := by
  have he : (coarseFlip q.1,coarseFlip q.2) ∈ Finset.univ.image (coarseSymmetry p) ↔
      q ∈ Finset.univ.image (coarseSymmetry p) := by
    rcases p with ⟨px,py⟩
    rcases q with ⟨qx,qy⟩
    simp only [mem_coarseOrbit_iff,Prod.mk.injEq,coarseFlip_eq_iff,coarseFlip_involutive]
    tauto
  unfold coarseOrbitWeight
  simp only [he]

theorem coarseFlip_real (i : Fin 128) :
    ((coarseFlip i).val : ℝ)=127-(i.val : ℝ) := by
  dsimp [coarseFlip]
  rw [Nat.cast_sub (by have := i.isLt; omega)]
  norm_num

theorem coarseGridRect_field_swap (p : Grid 128) (w x y : ℝ) :
    (coarseGridRect (p.2,p.1)).field w x y=(coarseGridRect p).field w y x := by
  have he : (coarseGridRect (p.2,p.1)).contains x y ↔ (coarseGridRect p).contains y x := by
    simp only [BenchmarkPrefix.coarse_contains_iff]
    tauto
  unfold Rect.field
  rw [he]

theorem coarseGridRect_field_central (p : Grid 128) (w x y : ℝ) :
    (coarseGridRect (coarseFlip p.1,coarseFlip p.2)).field w x y=
      (coarseGridRect p).field w (1-x) (1-y) := by
  have he : (coarseGridRect (coarseFlip p.1,coarseFlip p.2)).contains x y ↔
      (coarseGridRect p).contains (1-x) (1-y) := by
    simp only [BenchmarkPrefix.coarse_contains_iff,coarseFlip_real]
    constructor <;> rintro ⟨ha,hb,hc,hd⟩ <;>
      exact ⟨by linarith,by linarith,by linarith,by linarith⟩
  unfold Rect.field
  rw [he]

theorem coarseField_swap (w : Grid 128 → ℝ)
    (hw : ∀p,w (p.2,p.1)=w p) (x y : ℝ) :
    rectangleField Finset.univ coarseGridRect w y x=
      rectangleField Finset.univ coarseGridRect w x y := by
  unfold rectangleField
  apply Fintype.sum_equiv coarseSwapEquiv
  intro p
  change (coarseGridRect p).field (w p) y x=
    (coarseGridRect (p.2,p.1)).field (w (p.2,p.1)) x y
  rw [hw,coarseGridRect_field_swap]

theorem coarseField_central (w : Grid 128 → ℝ)
    (hw : ∀p,w (coarseFlip p.1,coarseFlip p.2)=w p) (x y : ℝ) :
    rectangleField Finset.univ coarseGridRect w (1-x) (1-y)=
      rectangleField Finset.univ coarseGridRect w x y := by
  unfold rectangleField
  apply Fintype.sum_equiv coarseCentralEquiv
  intro p
  change (coarseGridRect p).field (w p) (1-x) (1-y)=
    (coarseGridRect (coarseFlip p.1,coarseFlip p.2)).field
      (w (coarseFlip p.1,coarseFlip p.2)) x y
  rw [hw,coarseGridRect_field_central]

theorem commonGridLines_one_sub_mem {G : ℕ} (hG : 0<G) (x : ℝ)
    (hx : x∈commonGridLines G) : 1-x∈commonGridLines G := by
  rcases Finset.mem_image.mp hx with ⟨k,hk,rfl⟩
  have hkG : k≤G := Nat.lt_succ_iff.mp (Finset.mem_range.mp hk)
  refine Finset.mem_image.mpr ⟨G-k,
    Finset.mem_range.mpr (Nat.lt_succ_iff.mpr (Nat.sub_le G k)),?_⟩
  rw [Nat.cast_sub hkG,sub_div,div_self (by exact_mod_cast hG.ne')]

theorem commonGridLines_one_sub_iff {G : ℕ} (hG : 0<G) (x : ℝ) :
    1-x∈commonGridLines G ↔ x∈commonGridLines G := by
  constructor
  · intro hx
    have h := commonGridLines_one_sub_mem hG (1-x) hx
    have he : 1-(1-x)=x := by ring
    rwa [he] at h
  · exact commonGridLines_one_sub_mem hG x

namespace FrozenReference

theorem phaseTypeWeight_swap (j : Fin 15348) (r : Fin 4) (p : Grid 128) :
    phaseTypeWeight j r (p.2,p.1)=phaseTypeWeight j r p := by
  unfold phaseTypeWeight
  rw [coarseOrbitWeight_swap]

theorem phaseTypeWeight_central (j : Fin 15348) (r : Fin 4) (p : Grid 128) :
    phaseTypeWeight j r (coarseFlip p.1,coarseFlip p.2)=phaseTypeWeight j r p := by
  unfold phaseTypeWeight
  rw [coarseOrbitWeight_central]

theorem referenceMask_swap (j : Fin 15348) (r : Fin 4) (x y : ℝ) :
    referenceMask j r y x=referenceMask j r x y := by
  classical
  have he := coarseField_swap (phaseTypeWeight j r) (phaseTypeWeight_swap j r) x y
  by_cases hb : x∈commonGridLines 32768 ∨ y∈commonGridLines 32768
  · have hb' : y∈commonGridLines 32768 ∨ x∈commonGridLines 32768 := hb.symm
    simp only [referenceMask,eraseGrid,if_pos hb,if_pos hb']
  · have hb' : ¬(y∈commonGridLines 32768 ∨ x∈commonGridLines 32768) :=
      fun h=>hb h.symm
    simpa only [referenceMask,eraseGrid,if_neg hb,if_neg hb'] using he

theorem referenceMask_central (j : Fin 15348) (r : Fin 4) (x y : ℝ) :
    referenceMask j r (1-x) (1-y)=referenceMask j r x y := by
  classical
  unfold referenceMask eraseGrid
  simp only [commonGridLines_one_sub_iff (by decide : 0<(32768:ℕ))]
  split_ifs
  · rfl
  · exact coarseField_central (phaseTypeWeight j r) (phaseTypeWeight_central j r) x y

theorem fullPhasePrefix_swap (last : Fin 15348) (r : Fin 4) (x y : ℝ) :
    fullPhasePrefix last r y x=fullPhasePrefix last r x y := by
  unfold fullPhasePrefix
  apply Finset.sum_congr rfl
  intro j hj
  rw [referenceMask_swap]

theorem fullPhasePrefix_central (last : Fin 15348) (r : Fin 4) (x y : ℝ) :
    fullPhasePrefix last r (1-x) (1-y)=fullPhasePrefix last r x y := by
  unfold fullPhasePrefix
  apply Finset.sum_congr rfl
  intro j hj
  rw [referenceMask_central]

theorem fullPhasePrefix_central_swap (last : Fin 15348) (r : Fin 4) (x y : ℝ) :
    fullPhasePrefix last r (1-y) (1-x)=fullPhasePrefix last r x y := by
  rw [fullPhasePrefix_central,fullPhasePrefix_swap]

end FrozenReference
end NoThreeLine

#print axioms NoThreeLine.FrozenReference.referenceMask_swap
#print axioms NoThreeLine.FrozenReference.referenceMask_central
#print axioms NoThreeLine.FrozenReference.fullPhasePrefix_swap
#print axioms NoThreeLine.FrozenReference.fullPhasePrefix_central
