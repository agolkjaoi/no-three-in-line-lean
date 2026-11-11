import NoThreeLine.Target
import NoThreeLine481.RankData

/-! The archived rank table is in type, first-coordinate, second-coordinate
order. Positive cells are processed from reverse rank 480 down to 0. -/
set_option autoImplicit false

namespace NoThreeLine481
open NoThreeLine

private def decodeDigit (digit : UInt8) : Nat :=
  if digit.toNat < 65 then digit.toNat - 48 else digit.toNat - 55

def reverseRankCode (typ : Fin 4) (i : Grid 256) : Nat :=
  let index := typ.val*65536 + i.1.val*256 + i.2.val
  let block := (rankBlocks[index/1024]?).getD ""
  let offset := 2*(index%1024)
  32*decodeDigit (block.toUTF8.get! offset) + decodeDigit (block.toUTF8.get! (offset+1))

def archivedRanks481 (typ : Fin 4) (i : Grid 256) : Fin 481 :=
  ⟨480 - reverseRankCode typ i, (Nat.sub_le _ _).trans_lt (by decide)⟩

#eval show IO Unit from do
  unless reverseRankCode 0 (0,0) == 511 &&
    (archivedRanks481 0 (12,37)).val == 2 &&
    (archivedRanks481 1 (127,128)).val == 1 &&
    (archivedRanks481 2 (5,238)).val == 275 &&
    (archivedRanks481 3 (230,145)).val == 317 &&
    (archivedRanks481 3 (255,255)).val == 313 do
    throw (IO.userError "archived rank decoder sample mismatch")

#print axioms archivedRanks481

end NoThreeLine481
