import NoThreeLine.FrozenCapacityData

/-! Coordinate and type keys for the finite low-height table. These definitions
do not accept a numerical row: actual chord inequalities are supplied separately
by the independent kernel-checked row modules. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
noncomputable section
namespace NoThreeLine.FrozenCapacity

def directionHeight (dx dy : ℤ) : ℕ := max dx.natAbs dy.natAbs

def directionMinor (dx dy : ℤ) : ℕ := min dx.natAbs dy.natAbs

def directionChart (dx dy : ℤ) : Fin 4 :=
  if dy.natAbs≤dx.natAbs then (if 0<dy then 0 else 1)
  else (if 0<dy then 2 else 3)

def directionCapacity (dx dy : ℤ) (r s : Fin 4) (x y : ℝ) : ℝ :=
  directionalChord (directionChart dx dy)
    (rectangleField Finset.univ (fun p=>(cellRect p).real) (fun p=>(pairWeight r s p:ℝ)))
    x y ((directionMinor dx dy:ℝ)/(directionHeight dx dy:ℝ))/(2*(directionHeight dx dy:ℝ))

def RowAccepted (i : Fin 112) : Prop :=
  ∀ x y : ℝ, directionCapacity (lowRows.get i).dx (lowRows.get i).dy
    (lowRows.get i).rootType (lowRows.get i).otherType x y ≤ ((lowRows.get i).upper:ℝ)

def LowKey (dx dy : ℤ) (r s : Fin 4) : Prop :=
  0<dx ∧ 4≤directionHeight dx dy ∧ directionHeight dx dy≤7 ∧
    Nat.gcd dx.natAbs dy.natAbs=1 ∧ r<s ∧
    (((r.val%2:ℕ):ℤ)+dx)%2+2*((((r.val/2:ℕ):ℤ)+dy)%2)=(s.val:ℤ)

instance (dx dy : ℤ) (r s : Fin 4) : Decidable (LowKey dx dy r s) := by
  unfold LowKey
  infer_instance

def RowMatches (i : Fin 112) (dx dy : ℤ) (r s : Fin 4) : Prop :=
  (lowRows.get i).dx=dx ∧ (lowRows.get i).dy=dy ∧
    (lowRows.get i).rootType=r ∧ (lowRows.get i).otherType=s

instance (i : Fin 112) (dx dy : ℤ) (r s : Fin 4) : Decidable (RowMatches i dx dy r s) := by
  unfold RowMatches
  infer_instance

theorem bounded_key_covered (dx : Fin 8) (dy : Fin 15) (r s : Fin 4)
    (h : LowKey (dx.val:ℤ) ((dy.val:ℤ)-7) r s) :
    ∃ i : Fin 112, RowMatches i (dx.val:ℤ) ((dy.val:ℤ)-7) r s := by
  have checked : ∀ dx : Fin 8, ∀ dy : Fin 15, ∀ r s : Fin 4,
      LowKey (dx.val:ℤ) ((dy.val:ℤ)-7) r s →
        ∃ i : Fin 112, RowMatches i (dx.val:ℤ) ((dy.val:ℤ)-7) r s := by
    decide +kernel
  exact checked dx dy r s h

theorem low_key_covered (dx dy : ℤ) (r s : Fin 4) (h : LowKey dx dy r s) :
    ∃ i : Fin 112, RowMatches i dx dy r s := by
  have hd : max dx.natAbs dy.natAbs≤7 := h.2.2.1
  have hxabs := (max_le_iff.mp hd).1
  have hyabs := (max_le_iff.mp hd).2
  have hx0 := h.1
  have hxle : dx≤(dx.natAbs:ℤ) := Int.le_natAbs
  have hyle : dy≤(dy.natAbs:ℤ) := Int.le_natAbs
  have hyneg : -dy≤(dy.natAbs:ℤ) := by
    simpa only [Int.natAbs_neg] using (Int.le_natAbs (a := -dy))
  let ix : Fin 8 := ⟨dx.toNat,by omega⟩
  let iy : Fin 15 := ⟨(dy+7).toNat,by omega⟩
  have hex : (ix.val:ℤ)=dx := by dsimp [ix]; omega
  have hey : (iy.val:ℤ)-7=dy := by dsimp [iy]; omega
  obtain ⟨i,hi⟩ := bounded_key_covered ix iy r s (by rw [hex,hey]; exact h)
  exact ⟨i,by rwa [hex,hey] at hi⟩

theorem saved_upper_le (i : Fin 112) :
    (lowRows.get i).upper≤(30549893891/38400000000:ℚ) := by
  have checked : ∀ i : Fin 112,
      (lowRows.get i).upper≤(30549893891/38400000000:ℚ) := by decide +kernel
  exact checked i

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.bounded_key_covered
#print axioms NoThreeLine.FrozenCapacity.low_key_covered
#print axioms NoThreeLine.FrozenCapacity.saved_upper_le
