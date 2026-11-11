import NoThreeLine481.RankTable

open NoThreeLine481

def main (args : List String) : IO Unit := do
  let path := args.headD "docs/paper/481-phase/verification/data/full_rank.bin"
  let bytes ← IO.FS.readBinFile path
  unless bytes.size == 4*4*256*256 do
    throw (IO.userError "unexpected archived rank byte count")
  for typ in List.finRange 4 do
    for x in List.finRange 256 do
      for y in List.finRange 256 do
        let offset := 4*(typ.val*65536 + x.val*256 + y.val)
        let raw := (bytes.get! offset).toNat + 256*(bytes.get! (offset+1)).toNat +
          65536*(bytes.get! (offset+2)).toNat + 16777216*(bytes.get! (offset+3)).toNat
        let want := if raw == 4294967295 then 511 else raw
        unless reverseRankCode typ (x,y) == want && (archivedRanks481 typ (x,y)).val == 480-want do
          throw (IO.userError s!"rank mismatch at type {typ.val}, cell ({x.val},{y.val})")
  IO.println "Lean decoder matches all 262144 archived entries."
