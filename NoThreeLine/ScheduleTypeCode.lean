import NoThreeLine.TypedAreaRiemann

/-! The frozen input numbers the parity type as dx%2 + 2*(dy%2).
This explicit equivalence connects the Fin 4 schedule labels to the two-bit
grid type used by the existing real area and direction estimates. -/
set_option autoImplicit false
open scoped BigOperators
namespace NoThreeLine.GridArea
open PrimitiveLines

def typeCode (t : GridType) : Fin 4 :=
  ⟨t.1.val+2*t.2.val, by have := t.1.isLt; have := t.2.isLt; omega⟩

def codeType (r : Fin 4) : GridType :=
  (⟨r.val%2, by omega⟩, ⟨r.val/2, by have := r.isLt; omega⟩)

theorem codeType_typeCode (t : GridType) : codeType (typeCode t) = t := by
  apply Prod.ext <;> apply Fin.ext
  · dsimp [codeType, typeCode]
    have := t.1.isLt
    omega
  · dsimp [codeType, typeCode]
    have := t.1.isLt
    omega

theorem typeCode_codeType (r : Fin 4) : typeCode (codeType r) = r := by
  apply Fin.ext
  dsimp [typeCode, codeType]
  omega

def typeCodeEquiv : GridType ≃ Fin 4 where
  toFun := typeCode
  invFun := codeType
  left_inv := codeType_typeCode
  right_inv := typeCode_codeType

theorem sum_typeCode {α : Type*} [AddCommMonoid α] (f : Fin 4 → α) :
    (∑ t : GridType, f (typeCode t)) = ∑ r : Fin 4, f r := by
  exact Fintype.sum_equiv typeCodeEquiv _ _ (fun _ => rfl)

def codeZ (z : ZPoint) : Fin 4 :=
  ⟨(z.1%2).toNat+2*(z.2%2).toNat, by omega⟩

theorem codeZ_gridTypeZ (t : GridType) : codeZ (gridTypeZ t) = typeCode t := by
  apply Fin.ext
  dsimp [codeZ, gridTypeZ, typeCode]
  have := t.1.isLt
  have := t.2.isLt
  omega

theorem codeZ_grid_parity {n : ℕ} (q : Grid n) :
    codeZ (parity (gridEmbed q)) = typeCode (pointType q) := by
  rw [← gridTypeZ_pointType]
  exact codeZ_gridTypeZ (pointType q)

theorem pointType_code_formula {n : ℕ} (q : Grid n) :
    (typeCode (pointType q)).val = q.1.val%2+2*(q.2.val%2) := rfl

end NoThreeLine.GridArea

#print axioms NoThreeLine.GridArea.sum_typeCode
#print axioms NoThreeLine.GridArea.codeZ_grid_parity
