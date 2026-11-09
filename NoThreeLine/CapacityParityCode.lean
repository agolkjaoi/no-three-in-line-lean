import NoThreeLine.ScheduleTypeCode

/-! The table's two-bit integer type transition is the actual parity change
along a lattice direction. Reversing the direction preserves the type pair. -/
set_option autoImplicit false
namespace NoThreeLine.FrozenCapacity
open PrimitiveLines GridArea

def stepCode (r : Fin 4) (dx dy : ℤ) : Fin 4 :=
  ⟨((((r.val%2:ℕ):ℤ)+dx)%2).toNat+2*((((r.val/2:ℕ):ℤ)+dy)%2).toNat,by
    have := r.isLt
    omega⟩

theorem codeZ_coordinates (p : ZPoint) :
    (((codeZ p).val%2:ℕ):ℤ)=p.1%2 ∧ (((codeZ p).val/2:ℕ):ℤ)=p.2%2 := by
  dsimp [codeZ]
  omega

theorem stepCode_actual (p d : ZPoint) :
    stepCode (codeZ p) d.1 d.2=codeZ (p+d) := by
  apply Fin.ext
  change (((((codeZ p).val%2:ℕ):ℤ)+d.1)%2).toNat+
      2*(((((codeZ p).val/2:ℕ):ℤ)+d.2)%2).toNat =
    ((p.1+d.1)%2).toNat+2*((p.2+d.2)%2).toNat
  rw [(codeZ_coordinates p).1,(codeZ_coordinates p).2]
  congr 1 <;> congr 1 <;> omega

theorem stepCode_neg (r : Fin 4) (dx dy : ℤ) :
    stepCode r (-dx) (-dy)=stepCode r dx dy := by
  apply Fin.ext
  dsimp [stepCode]
  omega

theorem codeZ_parity (p : ZPoint) : codeZ (parity p)=codeZ p := by
  apply Fin.ext
  simp [codeZ,parity,Int.emod_emod]

theorem codeZ_eq_iff_parity (p q : ZPoint) : codeZ p=codeZ q ↔ parity p=parity q := by
  constructor
  · intro h
    have he := congrArg Fin.val h
    apply Prod.ext
    · change p.1%2=q.1%2
      rw [←(codeZ_coordinates p).1,←(codeZ_coordinates q).1,he]
    · change p.2%2=q.2%2
      rw [←(codeZ_coordinates p).2,←(codeZ_coordinates q).2,he]
  · intro h
    rw [←codeZ_parity p,←codeZ_parity q,h]

theorem primitive_stepCode_ne (p d : ZPoint) (hd : Primitive d) :
    stepCode (codeZ p) d.1 d.2≠codeZ p := by
  rw [stepCode_actual]
  intro h
  exact primitive_parity_step_ne p d hd ((codeZ_eq_iff_parity _ _).mp h)

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.stepCode_actual
#print axioms NoThreeLine.FrozenCapacity.primitive_stepCode_ne
