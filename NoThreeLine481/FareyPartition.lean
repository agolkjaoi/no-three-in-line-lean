import Lean

/-! This check covers the common angular partition for grid size 256.
It verifies the two end cuts, the determinant-one identity and the
denominator-sum inequality for each successive pair. -/

namespace NoThreeLine481

abbrev Cut := Nat × Nat

def nextCut (n : Nat) (left right : Cut) : Cut :=
  let k := (n+left.2)/right.2
  (k*right.1-left.1, k*right.2-left.2)

def validCut (n : Nat) (p : Cut) : Bool :=
  0 < p.2 && p.2 ≤ n && p.1 ≤ p.2

def validNeighbors (n : Nat) (left right : Cut) : Bool :=
  validCut n left && validCut n right &&
    left.2*right.1 == left.1*right.2+1 && n < left.2+right.2

def checkPartition (n : Nat) : Nat → Cut → Cut → Bool
  | 0, left, _ => left == (1,1)
  | fuel+1, left, right =>
    validNeighbors n left right && checkPartition n fuel right (nextCut n left right)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem farey256_checked : checkPartition 256 19948 (0,1) (1,256) = true := by
  decide +kernel

#print axioms farey256_checked

end NoThreeLine481
