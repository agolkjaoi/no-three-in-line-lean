import NoThreeLine.RecycledPhaseComposition
import NoThreeLine.ScheduleDeadline

/-! Feed an actual finite schedule and its board masks into SharedPhase.
The constructed horizons telescope to exactly the schedule's knots, and
the same last-positive-phase deadlines are used for process retirement. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped NNReal

namespace NoThreeLine

def processBox (B : ℝ) : ℝ≥0 := ⟨max B 2+1,by have := le_max_right B 2; linarith⟩

theorem processBox_large (B : ℝ) : max B 2 < (processBox B : ℝ) := by
  change max B 2 < max B 2+1
  linarith

def scheduleSharedPhases {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ)
    (j : ℕ) : SharedPhase n B :=
  if hj : j < J then
    { directions := Γ
      mask := m ⟨j,hj⟩
      K := K
      rho := ρ
      box := processBox B
      horizon := ⟨s.duration ⟨j,hj⟩,(sub_pos.mpr (s.lo_lt_hi ⟨j,hj⟩)).le⟩
      mask_nonneg := fun p => (hm _ p).1
      mask_le_one := fun p => (hm _ p).2
      box_large := processBox_large B }
  else
    { directions := Γ
      mask := fun _ => 0
      K := K
      rho := ρ
      box := processBox B
      horizon := 0
      mask_nonneg := fun _ => le_rfl
      mask_le_one := fun _ => zero_le_one
      box_large := processBox_large B }

theorem scheduleSharedPhases_mask {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (j : Fin J) :
    (scheduleSharedPhases s m hm Γ B K ρ j.val).mask = m j := by
  simp [scheduleSharedPhases,j.isLt]

theorem scheduleSharedPhases_horizon {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (j : Fin J) :
    ((scheduleSharedPhases s m hm Γ B K ρ j.val).horizon : ℝ) = s.duration j := by
  simp [scheduleSharedPhases,j.isLt]
  rfl

theorem scheduleSharedPhases_directions {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (j : ℕ) :
    (scheduleSharedPhases s m hm Γ B K ρ j).directions = Γ := by
  unfold scheduleSharedPhases
  split <;> rfl

theorem scheduleSharedPhases_outside {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ)
    (j : ℕ) (hj : J ≤ j) :
    (scheduleSharedPhases s m hm Γ B K ρ j).mask = (fun _ => 0) ∧
      (scheduleSharedPhases s m hm Γ B K ρ j).horizon = 0 := by
  simp [scheduleSharedPhases,not_lt_of_ge hj]

theorem scheduleSharedPhases_endpoint {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ)
    (k : ℕ) (hk : k ≤ J) :
    phaseEndpoint (scheduleSharedPhases s m hm Γ B K ρ) 0 k = s.knot ⟨k,Nat.lt_succ_of_le hk⟩ := by
  induction k with
  | zero =>
    rw [phaseEndpoint_zero]
    have he : (⟨0,Nat.lt_succ_of_le hk⟩ : Fin (J+1)) = 0 := by
      apply Fin.ext
      simp
    rw [he,s.initial]
  | succ k ih =>
    have hklt : k < J := by omega
    rw [phaseEndpoint_succ,ih (by omega)]
    rw [scheduleSharedPhases_horizon s m hm Γ B K ρ ⟨k,hklt⟩]
    change s.knot ⟨k,_⟩ + (s.knot ⟨k+1,_⟩-s.knot ⟨k,_⟩) = s.knot ⟨k+1,_⟩
    ring

theorem scheduleSharedPhases_lo {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (j : Fin J) :
    phaseEndpoint (scheduleSharedPhases s m hm Γ B K ρ) 0 j.val = s.lo j :=
  scheduleSharedPhases_endpoint s m hm Γ B K ρ j.val (Nat.le_of_lt j.isLt)

theorem scheduleSharedPhases_hi {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (j : Fin J) :
    phaseEndpoint (scheduleSharedPhases s m hm Γ B K ρ) 0 (j.val+1) = s.hi j :=
  scheduleSharedPhases_endpoint s m hm Γ B K ρ (j.val+1) j.isLt

theorem scheduleSharedPhases_total {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) :
    phaseEndpoint (scheduleSharedPhases s m hm Γ B K ρ) 0 J = s.total :=
  scheduleSharedPhases_endpoint s m hm Γ B K ρ J le_rfl

def scheduleProcessDeadline {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (p : Grid n) : ℝ := s.deadline (fun j => m j p)

theorem scheduleProcessDeadline_eq_zero_or_endpoint {J n : ℕ} (s : FinitePhase.Schedule J)
    (m : Fin J → Grid n → ℝ) (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (p : Grid n) :
    scheduleProcessDeadline s m p = 0 ∨ ∃ j : Fin J, 0 < m j p ∧
      scheduleProcessDeadline s m p = phaseEndpoint (scheduleSharedPhases s m hm Γ B K ρ) 0 (j.val+1) := by
  rcases s.deadline_eq_zero_or_used_right (fun j => m j p) with h | ⟨j,hj,he⟩
  · exact Or.inl h
  · exact Or.inr ⟨j,hj,he.trans (scheduleSharedPhases_hi s m hm Γ B K ρ j).symm⟩

theorem scheduleProcess_rate_zero_after_deadline {J n : ℕ} (s : FinitePhase.Schedule J)
    (m : Fin J → Grid n → ℝ) (hm : ∀ j p, 0 ≤ m j p ∧ m j p ≤ 1)
    (p : Grid n) (t : ℝ) (ht : scheduleProcessDeadline s m p ≤ t) : s.rate (fun j => m j p) t = 0 :=
  s.rate_zero_after_deadline (fun j => m j p) (fun j => (hm j p).1) t ht

end NoThreeLine

#print axioms NoThreeLine.scheduleSharedPhases_endpoint
#print axioms NoThreeLine.scheduleSharedPhases_total
#print axioms NoThreeLine.scheduleProcessDeadline_eq_zero_or_endpoint
#print axioms NoThreeLine.scheduleProcess_rate_zero_after_deadline
