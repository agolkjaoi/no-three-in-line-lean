import NoThreeLine.ScheduleGeometry

/-! Deterministic schedule shortening acts on phase lengths exactly once.
The original phase masks are unchanged. This is not a random sample-path time change. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.FinitePhase
open PrimitiveLines FiniteDirections GridArea

def Schedule.scaled {J : ℕ} (s : Schedule J) (a : ℝ) (ha : 0 < a) : Schedule J where
  knot j := a*s.knot j
  increasing := fun i j hij => mul_lt_mul_of_pos_left (s.increasing hij) ha
  initial := by rw [s.initial,mul_zero]

@[simp] theorem Schedule.scaled_lo {J : ℕ} (s : Schedule J) (a : ℝ) (ha : 0 < a) (j : Fin J) :
    (s.scaled a ha).lo j = a*s.lo j := rfl
@[simp] theorem Schedule.scaled_hi {J : ℕ} (s : Schedule J) (a : ℝ) (ha : 0 < a) (j : Fin J) :
    (s.scaled a ha).hi j = a*s.hi j := rfl
@[simp] theorem Schedule.scaled_total {J : ℕ} (s : Schedule J) (a : ℝ) (ha : 0 < a) :
    (s.scaled a ha).total = a*s.total := rfl
@[simp] theorem Schedule.scaled_duration {J : ℕ} (s : Schedule J) (a : ℝ) (ha : 0 < a) (j : Fin J) :
    (s.scaled a ha).duration j = a*s.duration j := by simp [Schedule.duration,mul_sub]

theorem pulse_scaled (a lo hi c t : ℝ) (ha : 0 < a) :
    pulse (a*lo) (a*hi) c (a*t) = pulse lo hi c t := by
  simp [pulse,Set.indicator_apply,ha]

theorem Schedule.scaled_rate {J : ℕ} (s : Schedule J) (a : ℝ) (ha : 0 < a)
    (c : Fin J → ℝ) (t : ℝ) : (s.scaled a ha).rate c (a*t) = s.rate c t := by
  unfold Schedule.rate FinitePhase.rate
  simp_rw [s.scaled_lo,s.scaled_hi,pulse_scaled _ _ _ _ _ ha]

theorem elapsed_scaled (a lo hi t : ℝ) (ha : 0 ≤ a) :
    elapsed (a*lo) (a*hi) (a*t) = a*elapsed lo hi t := by
  simp only [elapsed,mul_max_of_nonneg _ _ ha,mul_min_of_nonneg _ _ ha,mul_sub,mul_zero]

theorem Schedule.scaled_cumulative {J : ℕ} (s : Schedule J) (a : ℝ) (ha : 0 < a)
    (c : Fin J → ℝ) (t : ℝ) (ht : 0 ≤ t) :
    (s.scaled a ha).cumulative c (a*t) = a*s.cumulative c t := by
  unfold Schedule.cumulative
  rw [cumulative_eq_sum _ _ _ _ _ (mul_nonneg ha.le ht),cumulative_eq_sum _ _ _ _ _ ht,
    Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  rw [s.scaled_lo,s.scaled_hi,elapsed_scaled _ _ _ _ ha.le]
  ring

theorem Schedule.scaled_prefixWeights {J : ℕ} {ι : Type*} (s : Schedule J)
    (a : ℝ) (ha : 0 < a) (c : Fin J → ZPoint → ι → ℝ) (t : ℝ) (ht : 0 ≤ t)
    (r : ZPoint) (i : ι) :
    (s.scaled a ha).prefixWeights c (a*t) r i = a*s.prefixWeights c t r i :=
  s.scaled_cumulative a ha (fun j => c j r i) t ht

theorem maskedField_mul_weights {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (V H : Finset ℝ) (a : ℝ) (w : ι → ℝ) (x y : ℝ) :
    eraseGrid V H (rectangleField S R (fun i => a*w i)) x y =
      a*eraseGrid V H (rectangleField S R w) x y := by
  classical
  unfold eraseGrid
  split_ifs with hb
  · ring
  · unfold rectangleField
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i hi
    unfold Rect.field
    split_ifs <;> ring

theorem normalizedPairSum_mul {n : ℕ} (p : Grid n) (a : ℝ) (w : Grid n → ℝ) :
    normalizedPairSum p (fun q => a*w q) = a^2*normalizedPairSum p w := by
  unfold normalizedPairSum collinearPairSum
  rw [← mul_div_assoc]
  congr 1
  simp_rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q hq
  apply Finset.sum_congr rfl
  intro r hr
  split_ifs <;> ring

/-- The actual integrated collinear-pair risk scales quadratically. -/
theorem Schedule.scaled_boardTimeRisk {J n : ℕ} {ι : Type*} (s : Schedule J)
    (a : ℝ) (ha : 0 < a) (S : Finset ι) (R : ι → Rect)
    (c : Fin J → ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n)
    (t : ℝ) (ht : 0 ≤ t) :
    (s.scaled a ha).boardTimeRisk S R c V H p (a*t) = a^2*s.boardTimeRisk S R c V H p t := by
  rw [(s.scaled a ha).boardTimeRisk_eq_terminal S R c V H p (a*t) (mul_nonneg ha.le ht),
    s.boardTimeRisk_eq_terminal S R c V H p t ht]
  have he : maskedTypedBoardWeight S R ((s.scaled a ha).prefixWeights c (a*t)) V H =
      fun q : Grid n => a*maskedTypedBoardWeight S R (s.prefixWeights c t) V H q := by
    have hw : (s.scaled a ha).prefixWeights c (a*t) = fun r i => a*s.prefixWeights c t r i := by
      funext r i
      exact s.scaled_prefixWeights a ha c t ht r i
    rw [hw]
    funext q
    unfold maskedTypedBoardWeight
    exact maskedField_mul_weights S R V H a _ _ _
  rw [he,normalizedPairSum_mul]

/-- The true mass scales linearly, with the same unchanged phase masks. -/
theorem Schedule.scaled_areaMass {J : ℕ} {ι : Type*} (s : Schedule J)
    (a : ℝ) (ha : 0 < a) (S : Finset ι) (R : ι → Rect)
    (c : Fin J → ZPoint → ι → ℝ) (V H : Finset ℝ) :
    (s.scaled a ha).areaMass S R c V H = a*s.areaMass S R c V H := by
  rw [(s.scaled a ha).areaMass_eq_phase_sum,s.areaMass_eq_phase_sum,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  rw [s.scaled_duration]
  ring

theorem fixed_shortening_sieve_coefficient :
    ((76/125 : ℝ)/24)*(249/250)^2 = 392673/15625000 := by norm_num

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.Schedule.scaled_cumulative
#print axioms NoThreeLine.FinitePhase.Schedule.scaled_boardTimeRisk
#print axioms NoThreeLine.FinitePhase.Schedule.scaled_areaMass
