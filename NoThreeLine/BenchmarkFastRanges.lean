import NoThreeLine.BenchmarkRangeChunks

/-! Skip the expansion of a whole out-of-range binary subtree. The optimized
algorithm is structurally equal to the original addRange/addRanges, even on
arbitrary non-normal trees; it proves the identical checkRanges proposition. -/
set_option autoImplicit false
namespace NoThreeLine.BenchmarkNatTree

def normalizeTree : ℕ → BenchmarkNatTree → BenchmarkNatTree
  | 0,t => t
  | _+1,.uniform a => .uniform a
  | d+1,.branch l r => join (normalizeTree d l) (normalizeTree d r)

theorem normalizeTree_succ (d : ℕ) (t : BenchmarkNatTree) :
    normalizeTree (d+1) t=join (normalizeTree d t.left) (normalizeTree d t.right) := by
  cases t with
  | uniform a => cases d <;> simp [normalizeTree,left,right,join]
  | branch l r => rfl

theorem addRange_outside (d : ℕ) (t : BenchmarkNatTree) (lo hi a : ℕ)
    (hout : 2^d≤lo) (hne : lo<hi) : addRange d t lo hi a=normalizeTree d t := by
  induction d generalizing t lo hi with
  | zero =>
      have hf : ¬ (lo=0 ∧ 2^0≤hi) := by norm_num at hout; omega
      rw [addRange,if_neg (Nat.not_le_of_lt hne),if_neg hf]
      rfl
  | succ d ih =>
      have hp : 0<2^(d+1) := pow_pos (by decide) _
      have hf : ¬ (lo=0 ∧ 2^(d+1)≤hi) := by omega
      have hl : 2^d≤lo := by rw [Nat.pow_succ] at hout; omega
      have hr : 2^d≤lo-2^d := by rw [Nat.pow_succ] at hout; omega
      have hn : lo-2^d<hi-2^d := by omega
      rw [addRange,if_neg (Nat.not_le_of_lt hne),if_neg hf,normalizeTree_succ,
        ih _ _ _ hl hne,ih _ _ _ hr hn]

def addRangeClip (d : ℕ) (t : BenchmarkNatTree) (lo hi a : ℕ) : BenchmarkNatTree :=
  if hi≤lo then t else
  if 2^d≤lo then normalizeTree d t else
  if lo=0 ∧ 2^d≤hi then shift d t a else
  match d with
  | 0 => t
  | d+1 => join (addRangeClip d t.left lo hi a)
      (addRangeClip d t.right (lo-2^d) (hi-2^d) a)

theorem addRangeClip_eq (d : ℕ) (t : BenchmarkNatTree) (lo hi a : ℕ) :
    addRangeClip d t lo hi a=addRange d t lo hi a := by
  induction d generalizing t lo hi with
  | zero =>
      by_cases he : hi≤lo <;> by_cases ho : 2^0≤lo <;>
        by_cases hf : lo=0 ∧ 2^0≤hi <;>
          simp_all [addRangeClip,addRange,normalizeTree]
  | succ d ih =>
      rw [addRangeClip]
      by_cases he : hi≤lo
      · rw [if_pos he,addRange,if_pos he]
      · rw [if_neg he]
        by_cases ho : 2^(d+1)≤lo
        · rw [if_pos ho]
          exact (addRange_outside _ _ _ _ _ ho (Nat.lt_of_not_ge he)).symm
        · rw [if_neg ho,addRange,if_neg he]
          by_cases hf : lo=0 ∧ 2^(d+1)≤hi
          · rw [if_pos hf,if_pos hf]
          · rw [if_neg hf,if_neg hf]
            change join (addRangeClip d t.left lo hi a)
              (addRangeClip d t.right (lo-2^d) (hi-2^d) a) = _
            rw [ih,ih]

def addRangesClip (d : ℕ) : BenchmarkNatTree → List RangeUpdate → BenchmarkNatTree
  | t,[] => t
  | t,x::xs => addRangesClip d
      (if x.weight=0 then t else addRangeClip d t x.lo x.hi x.weight) xs

theorem addRangesClip_eq (d : ℕ) (t : BenchmarkNatTree) (xs : List RangeUpdate) :
    addRangesClip d t xs=addRanges d t xs := by
  induction xs generalizing t with
  | nil => rfl
  | cons x xs ih =>
      simp only [addRangesClip,addRanges,ih,addRangeClip_eq]

def checkFastRanges (d : ℕ) (t : BenchmarkNatTree) (xs : List RangeUpdate)
    (out : BenchmarkNatTree) : Bool := decide (addRangesClip d t xs=out)

theorem checkRanges_of_fast (d : ℕ) (t : BenchmarkNatTree) (xs : List RangeUpdate)
    (out : BenchmarkNatTree) (h : checkFastRanges d t xs out=true) :
    checkRanges d t xs out=true := by
  have he : addRangesClip d t xs=out := of_decide_eq_true h
  apply decide_eq_true_eq.mpr
  rw [← addRangesClip_eq]
  exact he

end NoThreeLine.BenchmarkNatTree

#print axioms NoThreeLine.BenchmarkNatTree.addRangeClip_eq
#print axioms NoThreeLine.BenchmarkNatTree.checkRanges_of_fast
