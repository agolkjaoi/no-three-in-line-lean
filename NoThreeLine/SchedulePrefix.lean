import NoThreeLine.ScheduleProcessBridge

/-! A literal prefix of the analytic schedule. Its knots and masks are
restrictions of the originals, so the first k actual configurations agree.
No retirement deadline is recomputed by this construction. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.FinitePhase

def Schedule.prefix {J : ℕ} (s : Schedule J) (k : ℕ) (hk : k≤J) : Schedule k where
  knot i := s.knot ⟨i.val,Nat.lt_of_lt_of_le i.isLt (Nat.succ_le_succ hk)⟩
  increasing := fun a b hab=>s.increasing hab
  initial := s.initial

theorem Schedule.prefix_knot {J : ℕ} (s : Schedule J) (k : ℕ) (hk : k≤J) (i : Fin (k+1)) :
    (s.prefix k hk).knot i=s.knot ⟨i.val,Nat.lt_of_lt_of_le i.isLt (Nat.succ_le_succ hk)⟩ := rfl

theorem Schedule.prefix_lo {J : ℕ} (s : Schedule J) (k : ℕ) (hk : k≤J) (j : Fin k) :
    (s.prefix k hk).lo j=s.lo (j.castLE hk) := rfl

theorem Schedule.prefix_hi {J : ℕ} (s : Schedule J) (k : ℕ) (hk : k≤J) (j : Fin k) :
    (s.prefix k hk).hi j=s.hi (j.castLE hk) := rfl

theorem Schedule.prefix_duration {J : ℕ} (s : Schedule J) (k : ℕ) (hk : k≤J) (j : Fin k) :
    (s.prefix k hk).duration j=s.duration (j.castLE hk) := rfl

theorem Schedule.prefix_total {J : ℕ} (s : Schedule J) (k : ℕ) (hk : k≤J) :
    (s.prefix k hk).total=s.knot ⟨k,Nat.lt_succ_of_le hk⟩ := rfl

def prefixMask {J n k : ℕ} (hk : k≤J) (mask : Fin J→Grid n→ℝ) : Fin k→Grid n→ℝ :=
  fun j=>mask (j.castLE hk)

theorem prefixMask_bounds {J n k : ℕ} (hk : k≤J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) : ∀j q,0≤prefixMask hk mask j q ∧ prefixMask hk mask j q≤1 :=
  fun j q=>hm (j.castLE hk) q

end NoThreeLine.FinitePhase

namespace NoThreeLine

theorem scheduleSharedPhases_prefix_eq {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (k : ℕ) (hk : k≤J) (j : ℕ) (hj : j<k) :
    scheduleSharedPhases (s.prefix k hk) (FinitePhase.prefixMask hk mask)
      (FinitePhase.prefixMask_bounds hk mask hm) Γ B K ρ j=
      scheduleSharedPhases s mask hm Γ B K ρ j := by
  unfold scheduleSharedPhases
  rw [dif_pos hj,dif_pos (hj.trans_le hk)]
  rfl

theorem phaseEndpoint_eq_of_prefix {n : ℕ} {B : ℝ} (cs ds : ℕ→SharedPhase n B)
    (start : ℝ) (k : ℕ) (hc : ∀j<k,cs j=ds j) :
    ∀l≤k,phaseEndpoint cs start l=phaseEndpoint ds start l := by
  intro l
  induction l with
  | zero => intro _; rfl
  | succ l ih =>
    intro hl
    rw [phaseEndpoint_succ,phaseEndpoint_succ,ih (by omega),hc l (by omega)]

end NoThreeLine
#print axioms NoThreeLine.FinitePhase.Schedule.prefix_duration
#print axioms NoThreeLine.scheduleSharedPhases_prefix_eq
#print axioms NoThreeLine.phaseEndpoint_eq_of_prefix
