import NoThreeLine.BenchmarkPrefixAccumulator
import NoThreeLine.BenchmarkBoxAccumulator

/-! Selecting two type components and adding their exact cell coefficients.
The root type for this benchmark is 3; the opponent is still a finite input. -/
set_option autoImplicit false
set_option maxRecDepth 4096
namespace NoThreeLine.BenchmarkNatTree

def mergeAdd : ℕ → BenchmarkNatTree → BenchmarkNatTree → BenchmarkNatTree
  | d, .uniform a, s => shift d s a
  | d, t, .uniform b => shift d t b
  | 0, .branch _ _, .branch _ _ => .uniform 0
  | d+1, .branch l r, .branch l' r' => join (mergeAdd d l l') (mergeAdd d r r')

theorem get_mergeAdd (d : ℕ) (t s : BenchmarkNatTree) (j : ℕ) (hj : j<2^d) :
    get d (mergeAdd d t s) j = get d t j+get d s j := by
  induction d generalizing t s j with
  | zero =>
      cases t <;> cases s <;> simp [mergeAdd,shift,get,Nat.add_comm]
  | succ d ih =>
      cases t with
      | uniform a =>
          rw [mergeAdd,get_shift _ _ _ _ hj]
          simp [get,Nat.add_comm]
      | branch l r =>
          cases s with
          | uniform b =>
              change get (d+1) (shift (d+1) (.branch l r) b) j = _
              rw [get_shift _ _ _ _ hj]
              rfl
          | branch l' r' =>
              rw [mergeAdd,get_join]
              simp only [get]
              split_ifs with h
              · exact ih l l' j h
              · exact ih r r' (j-2^d) (by rw [Nat.pow_succ] at hj; omega)

end NoThreeLine.BenchmarkNatTree
namespace NoThreeLine.BenchmarkPrefix
open BenchmarkNatTree FrozenReference

def typeTree (t : BenchmarkNatTree) (r : Fin 4) : BenchmarkNatTree :=
  ![t.left.left,t.left.right,t.right.left,t.right.right] r

theorem get_typeTree (t : BenchmarkNatTree) (r : Fin 4) (p : Grid 128) :
    get 14 (typeTree t r) (cellKey p)=get 16 t (gridKey r p) := by
  have hk : cellKey p<16384 := cellKey_lt p
  have hk' : cellKey p<2^14 := cellKey_lt p
  have hg : gridKey r p=r.val*16384+cellKey p := by unfold gridKey cellKey; omega
  rw [hg]
  fin_cases r
  · change get 14 t.left.left (cellKey p)=get 16 t (0*16384+cellKey p)
    simp only [Nat.zero_mul,Nat.zero_add]
    rw [get_succ 15,if_pos (by norm_num <;> omega),get_succ 14,if_pos hk']
  · change get 14 t.left.right (cellKey p)=get 16 t (1*16384+cellKey p)
    have hi : (1*16384+cellKey p)-2^14=cellKey p := by norm_num <;> omega
    rw [get_succ 15,if_pos (by norm_num <;> omega),get_succ 14,
      if_neg (by norm_num <;> omega),hi]
  · change get 14 t.right.left (cellKey p)=get 16 t (2*16384+cellKey p)
    have hi : (2*16384+cellKey p)-2^15=cellKey p := by norm_num <;> omega
    rw [get_succ 15,if_neg (by norm_num <;> omega),hi,get_succ 14,if_pos hk']
  · change get 14 t.right.right (cellKey p)=get 16 t (3*16384+cellKey p)
    have hi : (3*16384+cellKey p)-2^15=16384+cellKey p := by norm_num <;> omega
    have hi' : (16384+cellKey p)-2^14=cellKey p := by norm_num <;> omega
    rw [get_succ 15,if_neg (by norm_num <;> omega),hi,get_succ 14,
      if_neg (by norm_num <;> omega),hi']

def pairTree (t : BenchmarkNatTree) (other : Fin 4) : BenchmarkNatTree :=
  mergeAdd 14 (typeTree t 3) (typeTree t other)

theorem get_pairTree (t : BenchmarkNatTree) (other : Fin 4) (p : Grid 128) :
    get 14 (pairTree t other) (cellKey p)=get 16 t (gridKey 3 p)+get 16 t (gridKey other p) := by
  rw [pairTree,get_mergeAdd _ _ _ _ (cellKey_lt p),get_typeTree,get_typeTree]

theorem pairTree_fullTypeWeight (last : Fin 15348) (t : BenchmarkNatTree)
    (h : Represents (last.val+1) (by have := last.isLt; omega) t)
    (other : Fin 4) (p : Grid 128) :
    (get 14 (pairTree t other) (cellKey p) : ℝ)/100000000 =
      fullTypeWeight last 3 p+fullTypeWeight last other p := by
  rw [get_pairTree,Nat.cast_add,add_div,
    represents_fullTypeWeight last t h,represents_fullTypeWeight last t h]

end NoThreeLine.BenchmarkPrefix

#print axioms NoThreeLine.BenchmarkPrefix.pairTree_fullTypeWeight
