import NoThreeLine.ClockSeries

/-! A nonnegative remaining time cannot absorb a divergent waiting-time
sum when only finitely many steps can instead consume a natural budget. -/
set_option autoImplicit false
open Set Filter Function
open scoped BigOperators

namespace NoThreeLine.FiniteBudgetTermination

theorem nat_antitone_stabilizes (b : ℕ → ℕ) (hb : Antitone b) :
    ∃ N, ∀ k, N ≤ k → b k = b N := by
  classical
  have he : ∃ m, ∃ k, b k = m := ⟨b 0,0,rfl⟩
  obtain ⟨N,hN⟩ := Nat.find_spec he
  refine ⟨N,fun k hk => le_antisymm (hb hk) ?_⟩
  rw [hN]
  exact Nat.find_min' he ⟨k,rfl⟩

theorem arrivalTime_succ (W : ℕ → ℝ) (k : ℕ) :
    arrivalTime W (k+1) = arrivalTime W k + W k := by
  simp only [arrivalTime, Finset.sum_range_succ]

theorem divergent_waits_preclude_perpetual_progress (r W : ℕ → ℝ) (b : ℕ → ℕ)
    (hr : ∀ k, 0 ≤ r k) (hb : Antitone b)
    (hdiv : Tendsto (arrivalTime W) atTop atTop)
    (hstep : ∀ k, r k - r (k+1) = W k ∨ b (k+1) < b k) : False := by
  obtain ⟨N,hN⟩ := nat_antitone_stabilizes b hb
  have hflow (k : ℕ) (hk : N ≤ k) : r k - r (k+1) = W k := by
    rcases hstep k with h | h
    · exact h
    · rw [hN k hk, hN (k+1) (by omega)] at h
      exact False.elim (Nat.lt_irrefl _ h)
  have htel (m : ℕ) : arrivalTime W (N+m) + r (N+m) = arrivalTime W N + r N := by
    induction m with
    | zero => simp
    | succ m ih =>
      have hs := hflow (N+m) (by omega)
      rw [Nat.add_succ, arrivalTime_succ]
      change arrivalTime W (N+m) + W (N+m) + r (N+m+1) = _
      linarith
  have hlarge := hdiv.eventually (eventually_gt_atTop (arrivalTime W N + r N))
  obtain ⟨k,hk,hlarge⟩ := ((eventually_ge_atTop N).and hlarge).exists
  obtain ⟨m,rfl⟩ := Nat.exists_eq_add_of_le hk
  have he := htel m
  have hnonneg := hr (N+m)
  linarith

theorem exists_finished (unfinished : ℕ → Prop) (r W : ℕ → ℝ) (b : ℕ → ℕ)
    (hr : ∀ k, 0 ≤ r k) (hb : ∀ k, b (k+1) ≤ b k)
    (hdiv : Tendsto (arrivalTime W) atTop atTop)
    (hstep : ∀ k, unfinished k → r k - r (k+1) = W k ∨ b (k+1) < b k) :
    ∃ k, ¬ unfinished k := by
  classical
  by_contra! hp
  exact divergent_waits_preclude_perpetual_progress r W b hr (antitone_nat_of_succ_le hb)
    hdiv (fun k => hstep k (hp k))

theorem eventually_finished (unfinished : ℕ → Prop) (r W : ℕ → ℝ) (b : ℕ → ℕ)
    (hr : ∀ k, 0 ≤ r k) (hb : ∀ k, b (k+1) ≤ b k)
    (hdiv : Tendsto (arrivalTime W) atTop atTop)
    (hstep : ∀ k, unfinished k → r k - r (k+1) = W k ∨ b (k+1) < b k)
    (habsorb : ∀ k, ¬ unfinished k → ¬ unfinished (k+1)) :
    ∃ N, ∀ k, N ≤ k → ¬ unfinished k := by
  obtain ⟨N,hN⟩ := exists_finished unfinished r W b hr hb hdiv hstep
  refine ⟨N,?_⟩
  intro k hk
  induction k, hk using Nat.le_induction with
  | base => exact hN
  | succ k hk ih => exact habsorb k ih

end NoThreeLine.FiniteBudgetTermination

#print axioms NoThreeLine.FiniteBudgetTermination.exists_finished
#print axioms NoThreeLine.FiniteBudgetTermination.eventually_finished
