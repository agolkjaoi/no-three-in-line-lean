import NoThreeLine.CapacityFrozenType0
import NoThreeLine.CapacityFrozenType1
import NoThreeLine.CapacityFrozenType2
import NoThreeLine.CapacityFrozenType3

/-! The certified literal capacity field is the complete frozen prefix after
the common fine-grid erasure. Its unmasked version is a nonnegative envelope.
The accepted-prefix comparison retains actual phase matches and durations. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.FrozenCapacity
open FrozenReference FinitePhase

def typeField (r : Fin 4) : ℝ → ℝ → ℝ :=
  rectangleField Finset.univ (fun p=>(cellRect p).real)
    (fun p=>(cellUnits r p:ℝ)/100000000)

def pairField (r s : Fin 4) : ℝ → ℝ → ℝ :=
  rectangleField Finset.univ (fun p=>(cellRect p).real)
    (fun p=>(pairWeight r s p:ℝ))

theorem erased_typeField_eq (r : Fin 4) :
    eraseGrid (commonGridLines 32768) (commonGridLines 32768) (typeField r) =
      fullPhasePrefix 15347 r := by
  fin_cases r
  · exact CapacityFrozenType0.field_eq
  · exact CapacityFrozenType1.field_eq
  · exact CapacityFrozenType2.field_eq
  · exact CapacityFrozenType3.field_eq

theorem pairField_eq (r s : Fin 4) (x y : ℝ) :
    pairField r s x y = typeField r x y+typeField s x y := by
  unfold pairField typeField rectangleField
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro p _
  unfold Rect.field
  split_ifs
  · simp only [pairWeight]
    push_cast
    ring
  · simp

theorem typeField_nonneg (r : Fin 4) (x y : ℝ) : 0≤typeField r x y := by
  unfold typeField rectangleField
  apply Finset.sum_nonneg
  intro p _
  unfold Rect.field
  split_ifs
  · exact div_nonneg (by exact_mod_cast cellUnits_nonneg r p) (by norm_num)
  · exact le_rfl

theorem pairField_nonneg (r s : Fin 4) (x y : ℝ) : 0≤pairField r s x y := by
  rw [pairField_eq]
  exact add_nonneg (typeField_nonneg r x y) (typeField_nonneg s x y)

theorem erased_pairField_eq (r s : Fin 4) (x y : ℝ) :
    eraseGrid (commonGridLines 32768) (commonGridLines 32768) (pairField r s) x y =
      fullPhasePrefix 15347 r x y+fullPhasePrefix 15347 s x y := by
  rw [← erased_typeField_eq r,← erased_typeField_eq s]
  classical
  by_cases hb : x∈commonGridLines 32768 ∨ y∈commonGridLines 32768
  · simp [eraseGrid,hb]
  · simp only [eraseGrid,if_neg hb]
    exact pairField_eq r s x y

theorem fullPrefix_pair_le (r s : Fin 4) (x y : ℝ) :
    fullPhasePrefix 15347 r x y+fullPhasePrefix 15347 s x y≤pairField r s x y := by
  rw [← erased_pairField_eq]
  classical
  unfold eraseGrid
  split_ifs
  · exact pairField_nonneg r s x y
  · exact le_rfl

theorem accepted_pair_le {J : ℕ} (sch : Schedule J)
    (a : Fin J → CheckedAcceptedPhase 32768 8) (index : Fin J → Fin 15348)
    (hm : ∀j,PhaseMatches (a j) (index j)) (hi : StrictMono index)
    (scale : ℝ) (hscale : 0≤scale)
    (hd : ∀j,sch.duration j≤scale*((phaseUnits (index j):ℝ)/100000000))
    (k : Fin J) (T : ℝ) (hT : 0≤T) (hTk : T≤sch.hi k)
    (r s : Fin 4) (x y : ℝ) :
    sch.acceptedPrefix (fun j=>(a j).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) T r x y+
      sch.acceptedPrefix (fun j=>(a j).phase) 32768
        (commonGridLines 32768) (commonGridLines 32768) T s x y≤
      scale*pairField r s x y := by
  have hlast : index k≤(15347:Fin 15348) := by
    have := (index k).isLt
    change (index k).val≤15347
    omega
  have hr := acceptedPrefix_le_fullPhasePrefix sch a index hm hi scale hscale hd k
    15347 hlast T hT hTk r x y
  have hs := acceptedPrefix_le_fullPhasePrefix sch a index hm hi scale hscale hd k
    15347 hlast T hT hTk s x y
  calc
    _ ≤ scale*fullPhasePrefix 15347 r x y+scale*fullPhasePrefix 15347 s x y :=
      add_le_add hr hs
    _ = scale*(fullPhasePrefix 15347 r x y+fullPhasePrefix 15347 s x y) := by ring
    _ ≤ scale*pairField r s x y := mul_le_mul_of_nonneg_left (fullPrefix_pair_le r s x y) hscale

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.erased_pairField_eq
#print axioms NoThreeLine.FrozenCapacity.accepted_pair_le
