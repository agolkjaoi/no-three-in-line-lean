import NoThreeLine.FiniteSchedule
import NoThreeLine.PhaseUnionMass

/-! Positive finite phase durations construct the actual increasing time
partition. The sum of single-phase masses is the terminal space-time mass of
that partition, with the type selection and elapsed time inserted once. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.FinitePhase

def durationAt {J : ℕ} (d : Fin J → ℝ) (i : ℕ) : ℝ :=
  if h : i < J then d ⟨i,h⟩ else 0

def durationKnot {J : ℕ} (d : Fin J → ℝ) (k : Fin (J+1)) : ℝ :=
  ∑ i ∈ Finset.range k.val, durationAt d i

theorem durationKnot_step {J : ℕ} (d : Fin J → ℝ) (j : Fin J) :
    durationKnot d j.succ = durationKnot d j.castSucc + d j := by
  simp [durationKnot, Finset.sum_range_succ, durationAt, j.isLt]

def scheduleOfDurations {J : ℕ} (d : Fin J → ℝ) (hd : ∀ j, 0 < d j) : Schedule J where
  knot := durationKnot d
  increasing := Fin.strictMono_iff_lt_succ.mpr (fun j => by
    rw [durationKnot_step]
    exact lt_add_of_pos_right _ (hd j))
  initial := by simp [durationKnot]

theorem scheduleOfDurations_duration {J : ℕ} (d : Fin J → ℝ) (hd : ∀ j, 0 < d j)
    (j : Fin J) : (scheduleOfDurations d hd).duration j = d j := by
  change durationKnot d j.succ - durationKnot d j.castSucc = d j
  rw [durationKnot_step]
  ring

theorem scheduleOfDurations_total {J : ℕ} (d : Fin J → ℝ) (hd : ∀ j, 0 < d j) :
    (scheduleOfDurations d hd).total = ∑ j, d j := by
  change (∑ i ∈ Finset.range J, durationAt d i) = ∑ j, d j
  rw [← Fin.sum_univ_eq_sum_range]
  apply Finset.sum_congr rfl
  intro j hj
  simp [durationAt,j.isLt]

def Schedule.typedInputMass {J : ℕ} (s : Schedule J) (typ : Fin J → Fin 4)
    (F : Fin J → ℝ × ℝ → ℝ) : ℝ :=
  (1/4 : ℝ)*∑ r : Fin 4, ∫ z : ℝ × ℝ,
    s.cumulative (fun j => if r=typ j then F j z else 0) s.total

theorem Schedule.typedInputMass_eq {J : ℕ} (s : Schedule J) (typ : Fin J → Fin 4)
    (F : Fin J → ℝ × ℝ → ℝ) (hF : ∀ j, Integrable (F j)) :
    s.typedInputMass typ F = ∑ j, singlePhaseMass (s.duration j) (typ j) (F j) := by
  classical
  have hterm (r : Fin 4) (j : Fin J) :
      Integrable (fun z => s.duration j*(if r=typ j then F j z else 0)) := by
    by_cases hr : r=typ j
    · simpa [hr] using (hF j).const_mul (s.duration j)
    · simp [hr]
  unfold Schedule.typedInputMass
  simp_rw [s.cumulative_total]
  simp_rw [integral_finset_sum _ (fun j _ => hterm _ j)]
  rw [Finset.sum_comm]
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j hj
  have hd : 0 ≤ s.duration j := sub_nonneg.mpr (s.lo_lt_hi j).le
  rw [singlePhaseMass_eq (s.duration j) hd (typ j) (F j)]
  simp_rw [integral_const_mul]
  have ht (r : Fin 4) : (∫ z : ℝ × ℝ, if r=typ j then F j z else 0) =
      if r=typ j then ∫ z : ℝ × ℝ, F j z else 0 := by
    by_cases hr : r=typ j <;> simp [hr]
  simp_rw [ht]
  simp only [mul_ite, mul_zero]
  simp
  ring

theorem scheduleOfDurations_mass {J : ℕ} (d : Fin J → ℝ) (hd : ∀ j, 0 < d j)
    (typ : Fin J → Fin 4) (F : Fin J → ℝ × ℝ → ℝ) (hF : ∀ j, Integrable (F j)) :
    (scheduleOfDurations d hd).typedInputMass typ F =
      ∑ j, singlePhaseMass (d j) (typ j) (F j) := by
  rw [Schedule.typedInputMass_eq _ typ F hF]
  simp_rw [scheduleOfDurations_duration]

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.scheduleOfDurations_mass
