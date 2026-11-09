import NoThreeLine.CapacityCornerChecker

/-! An integer recurrence for finite signed hinge sums. The checker uses
only additions, comparisons, and knot jumps after the initial value/slope;
the soundness theorem covers every integer position in its declared range. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
namespace NoThreeLine

abbrev IntegerHinge := ℤ×ℤ

def integerHingeValue (es : List IntegerHinge) (z : ℤ) : ℤ :=
  (es.map (fun e=>e.2*max 0 (z-e.1))).sum

def integerHingeSlope (es : List IntegerHinge) (z : ℤ) : ℤ :=
  (es.map (fun e=>if e.1≤z then e.2 else 0)).sum

def integerHingeJump (es : List IntegerHinge) (z : ℤ) : ℤ :=
  (es.map (fun e=>if e.1=z then e.2 else 0)).sum

theorem integer_hinge_succ (z k : ℤ) :
    max 0 (z+1-k)=max 0 (z-k)+(if k≤z then 1 else 0) := by
  split_ifs <;> omega

theorem integerHingeValue_succ (es : List IntegerHinge) (z : ℤ) :
    integerHingeValue es (z+1)=integerHingeValue es z+integerHingeSlope es z := by
  induction es with
  | nil => simp [integerHingeValue,integerHingeSlope]
  | cons e es ih =>
    simp only [integerHingeValue,integerHingeSlope,List.map_cons,List.sum_cons] at *
    rw [integer_hinge_succ,ih]
    split_ifs <;> ring

theorem integerHingeSlope_succ (es : List IntegerHinge) (z : ℤ) :
    integerHingeSlope es (z+1)=integerHingeSlope es z+integerHingeJump es (z+1) := by
  induction es with
  | nil => simp [integerHingeSlope,integerHingeJump]
  | cons e es ih =>
    simp only [integerHingeSlope,integerHingeJump,List.map_cons,List.sum_cons] at *
    rw [ih]
    split_ifs <;> omega

def integerHingeScan (es : List IntegerHinge) (z : ℤ) (steps : ℕ) (value slope cap : ℤ) : Bool :=
  decide (value≤cap) && match steps with
    | 0 => true
    | k+1 => integerHingeScan es (z+1) k (value+slope) (slope+integerHingeJump es (z+1)) cap

def integerHingeRangeCheck (es : List IntegerHinge) (lo : ℤ) (steps : ℕ) (cap : ℤ) : Bool :=
  integerHingeScan es lo steps (integerHingeValue es lo) (integerHingeSlope es lo) cap

theorem integerHingeScan_sound (es : List IntegerHinge) (steps : ℕ) (z value slope cap : ℤ)
    (hv : value=integerHingeValue es z) (hs : slope=integerHingeSlope es z)
    (hc : integerHingeScan es z steps value slope cap=true) :
    ∀j≤steps,integerHingeValue es (z+j)≤cap := by
  induction steps generalizing z value slope with
  | zero =>
    have hb : value≤cap := by simpa only [integerHingeScan,Bool.and_true,decide_eq_true_eq] using hc
    intro j hj
    have hj0 : j=0 := by omega
    subst j
    simpa only [Nat.cast_zero,add_zero,←hv] using hb
  | succ steps ih =>
    have hh : value≤cap ∧ integerHingeScan es (z+1) steps (value+slope)
        (slope+integerHingeJump es (z+1)) cap=true := by
      simpa only [integerHingeScan,Bool.and_eq_true,decide_eq_true_eq] using hc
    intro j hj
    cases j with
    | zero => simpa only [Nat.cast_zero,add_zero,←hv] using hh.1
    | succ j =>
      have hv' : value+slope=integerHingeValue es (z+1) := by rw [integerHingeValue_succ,hv,hs]
      have hs' : slope+integerHingeJump es (z+1)=integerHingeSlope es (z+1) := by
        rw [integerHingeSlope_succ,hs]
      have h := ih (z+1) (value+slope) (slope+integerHingeJump es (z+1)) hv' hs' hh.2 j (by omega)
      convert h using 1 <;> push_cast <;> congr 1 <;> ring

theorem integerHingeRangeCheck_sound (es : List IntegerHinge) (lo : ℤ) (steps : ℕ) (cap : ℤ)
    (hc : integerHingeRangeCheck es lo steps cap=true) (z : ℤ)
    (hz0 : lo≤z) (hz1 : z≤lo+steps) : integerHingeValue es z≤cap := by
  have he : lo+((z-lo).toNat:ℤ)=z := by rw [Int.toNat_of_nonneg (sub_nonneg.mpr hz0)]; ring
  have hj : (z-lo).toNat≤steps := by omega
  simpa only [he] using integerHingeScan_sound es steps lo _ _ cap rfl rfl hc (z-lo).toNat hj

end NoThreeLine
#print axioms NoThreeLine.integerHingeValue_succ
#print axioms NoThreeLine.integerHingeSlope_succ
#print axioms NoThreeLine.integerHingeRangeCheck_sound
