import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityTypedField

/-! Finite integer keys connect all reduced primitive low-height families,
including both parity orders and the sign reversal of the fourth chart,
to the existing 112-row table. This module performs no row acceptance. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
noncomputable section
namespace NoThreeLine.FrozenCapacity
open PrimitiveLines GridArea GridChord FiniteDirections

def LowFamilyKey (f : Fin 4) (a h : ℕ) : Prop :=
  4≤h ∧ h≤7 ∧ 1≤a ∧ a≤h ∧ Nat.gcd a h=1 ∧ (f.val<2 ∨ a<h)

instance (f : Fin 4) (a h : ℕ) : Decidable (LowFamilyKey f a h) := by
  unfold LowFamilyKey
  infer_instance

def familyTableX (f : Fin 4) (a h : ℕ) : ℤ := if f.val<2 then h else a
def familyTableY (f : Fin 4) (a h : ℕ) : ℤ :=
  if f.val<2 then (if f=0 then a else -(a:ℤ)) else (if f=2 then h else -(h:ℤ))
def familyOtherType (f : Fin 4) (a h : ℕ) (r : Fin 4) : Fin 4 :=
  stepCode r (familyVector (f,(a,h))).1 (familyVector (f,(a,h))).2

theorem finite_family_table_key (f : Fin 4) (a h : Fin 8) (r : Fin 4)
    (hk : LowFamilyKey f a.val h.val) :
    LowKey (familyTableX f a h) (familyTableY f a h)
      (min r (familyOtherType f a h r)) (max r (familyOtherType f a h r)) ∧
    directionChart (familyTableX f a h) (familyTableY f a h)=f ∧
    directionMinor (familyTableX f a h) (familyTableY f a h)=a.val ∧
    directionHeight (familyTableX f a h) (familyTableY f a h)=h.val := by
  have hc : ∀ f : Fin 4, ∀ a h : Fin 8, ∀ r : Fin 4,
      LowFamilyKey f a.val h.val →
      LowKey (familyTableX f a h) (familyTableY f a h)
        (min r (familyOtherType f a h r)) (max r (familyOtherType f a h r)) ∧
      directionChart (familyTableX f a h) (familyTableY f a h)=f ∧
      directionMinor (familyTableX f a h) (familyTableY f a h)=a.val ∧
      directionHeight (familyTableX f a h) (familyTableY f a h)=h.val := by
    decide +kernel
  exact hc f a h r hk

theorem family_table_key (f : Fin 4) (a h : ℕ) (r : Fin 4)
    (hk : LowFamilyKey f a h) :
    LowKey (familyTableX f a h) (familyTableY f a h)
      (min r (familyOtherType f a h r)) (max r (familyOtherType f a h r)) ∧
    directionChart (familyTableX f a h) (familyTableY f a h)=f ∧
    directionMinor (familyTableX f a h) (familyTableY f a h)=a ∧
    directionHeight (familyTableX f a h) (familyTableY f a h)=h := by
  have hh : h<8 := by have := hk.2.1; omega
  have ha : a<8 := by have := hk.2.2.2.1; omega
  exact finite_family_table_key f ⟨a,ha⟩ ⟨h,hh⟩ r hk

theorem lowFamilyKey_of_reduced {n : ℕ} (z : FamilyLabel)
    (hz : z∈reducedFamilyLabels n) (h4 : 4≤z.2.2) (h7 : z.2.2≤7) :
    LowFamilyKey z.1 z.2.1 z.2.2 := by
  obtain ⟨_,_,ha,hah,hcop,hred⟩ := (mem_reducedFamilyLabels n z).mp hz
  exact ⟨h4,h7,ha,hah,hcop,hred⟩

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.finite_family_table_key
#print axioms NoThreeLine.FrozenCapacity.family_table_key
