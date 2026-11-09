import NoThreeLine.ProcessTrace

/-! The geometric upper bound used in the finite-event construction: each
row has at most two selected points, hence at most 2n accepted births. -/
set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine

theorem noThree_row_card {n : ℕ} (s : Finset (Grid n)) (hs : NoThree s) (y : Fin n) :
    (s.filter (fun p => p.2 = y)).card ≤ 2 := by
  by_contra h
  obtain ⟨p,q,r,hp,hq,hr,hpq,hpr,hqr⟩ := Finset.two_lt_card_iff.mp (Nat.lt_of_not_ge h)
  have hp' := Finset.mem_filter.mp hp
  have hq' := Finset.mem_filter.mp hq
  have hr' := Finset.mem_filter.mp hr
  apply hs p hp'.1 q hq'.1 r hr'.1 hpq hpr hqr
  simp [orientedArea,hp'.2,hq'.2,hr'.2]

theorem noThree_card_le_two_mul {n : ℕ} (s : Finset (Grid n)) (hs : NoThree s) :
    s.card ≤ 2*n := by
  have he : (∑ y : Fin n, (s.filter (fun p => p.2 = y)).card) = s.card := by
    simpa using Finset.sum_card_fiberwise_eq_card_filter s Finset.univ (fun p : Grid n => p.2)
  calc
    s.card = ∑ y : Fin n, (s.filter (fun p => p.2 = y)).card := he.symm
    _ ≤ ∑ _ : Fin n, 2 := Finset.sum_le_sum (fun y _ => noThree_row_card s hs y)
    _ = 2*n := by simp [Nat.mul_comm]

theorem ProcessState.traceBirthCount_le_two_mul {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (events : List (ProcessEvent n)) (hs : s.Valid) :
    s.traceBirthCount Γ events ≤ 2*n := by
  have hc := noThree_card_le_two_mul (s.runTrace Γ events).selected
    (s.runTrace_valid Γ events hs).1
  rw [s.runTrace_card Γ events hs] at hc
  omega

end NoThreeLine

#print axioms NoThreeLine.noThree_card_le_two_mul
#print axioms NoThreeLine.ProcessState.traceBirthCount_le_two_mul
