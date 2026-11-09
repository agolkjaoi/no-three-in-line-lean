import NoThreeLine.BenchmarkNatTreeFacts

/-! Exact range additions to a natural-unit tree. They will reconstruct grid
coefficients from the explicit compressed rectangles without checking every
rectangle separately at every grid point. The theorem allows arbitrary trees. -/
set_option autoImplicit false
namespace NoThreeLine.BenchmarkNatTree

def shift : ℕ → BenchmarkNatTree → ℕ → BenchmarkNatTree
  | _, .uniform w, a => .uniform (w+a)
  | 0, .branch _ _, a => .uniform a
  | d+1, .branch l r, a => .branch (shift d l a) (shift d r a)

theorem get_shift (d : ℕ) (t : BenchmarkNatTree) (a j : ℕ) (hj : j<2^d) :
    get d (shift d t a) j = get d t j+a := by
  induction d generalizing t j with
  | zero => cases t <;> simp [shift,get]
  | succ d ih =>
      cases t with
      | uniform w => simp [shift,get]
      | branch l r =>
          simp only [shift,get]
          split_ifs with h
          · exact ih l j h
          · exact ih r (j-2^d) (by rw [Nat.pow_succ] at hj; omega)

def addRange (d : ℕ) (t : BenchmarkNatTree) (lo hi a : ℕ) : BenchmarkNatTree :=
  if hi≤lo then t else
  if lo=0 ∧ 2^d≤hi then shift d t a else
  match d with
  | 0 => t
  | d+1 => join (addRange d t.left lo hi a)
      (addRange d t.right (lo-2^d) (hi-2^d) a)

theorem get_addRange (d : ℕ) (t : BenchmarkNatTree) (lo hi a j : ℕ)
    (hj : j<2^d) :
    get d (addRange d t lo hi a) j =
      get d t j + if lo≤j ∧ j<hi then a else 0 := by
  induction d generalizing t lo hi j with
  | zero =>
      have hj0 : j=0 := by simpa using hj
      subst j
      rw [addRange]
      by_cases hempty : hi≤lo
      · have hc : ¬ (lo≤0 ∧ 0<hi) := by omega
        rw [if_pos hempty,if_neg hc,Nat.add_zero]
      · rw [if_neg hempty]
        by_cases hfull : lo=0 ∧ 2^0≤hi
        · rw [if_pos hfull,get_shift _ _ _ _ (by simp)]
          have hc : lo≤0 ∧ 0<hi := by norm_num at hfull; omega
          rw [if_pos hc]
        · rw [if_neg hfull]
          have hc : ¬ (lo≤0 ∧ 0<hi) := by simpa using hfull
          change get 0 t 0 = get 0 t 0 + if lo≤0 ∧ 0<hi then a else 0
          rw [if_neg hc,Nat.add_zero]
  | succ d ih =>
      rw [addRange]
      by_cases hempty : hi≤lo
      · have hc : ¬ (lo≤j ∧ j<hi) := by omega
        simp [hempty,hc]
      · rw [if_neg hempty]
        by_cases hfull : lo=0 ∧ 2^(d+1)≤hi
        · rw [if_pos hfull,get_shift _ _ _ _ hj]
          have hc : lo≤j ∧ j<hi := by omega
          simp [hc]
        · rw [if_neg hfull,get_join,get_succ]
          by_cases hj' : j<2^d
          · rw [if_pos hj',if_pos hj',ih _ _ _ j hj']
          · rw [if_neg hj',if_neg hj']
            have hsub : j-2^d<2^d := by rw [Nat.pow_succ] at hj; omega
            rw [ih _ _ _ (j-2^d) hsub]
            have hc : (lo-2^d≤j-2^d ∧ j-2^d<hi-2^d) ↔ (lo≤j ∧ j<hi) := by omega
            simp only [hc]

end NoThreeLine.BenchmarkNatTree

#print axioms NoThreeLine.BenchmarkNatTree.get_shift
#print axioms NoThreeLine.BenchmarkNatTree.get_addRange
