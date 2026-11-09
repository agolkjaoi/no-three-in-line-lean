import NoThreeLine.Phase15301Family03UnitChunk00
import NoThreeLine.Phase15301Family03UnitChunk01
import NoThreeLine.Phase15301Family03UnitChunk02
import NoThreeLine.Phase15301Family03UnitChunk03
import NoThreeLine.Phase15301Family03UnitChunk04
import NoThreeLine.Phase15301Family03UnitChunk05
import NoThreeLine.Phase15301Family03UnitChunk06
import NoThreeLine.Phase15301Family03UnitChunk07
import NoThreeLine.Phase15301Family03UnitChunk08
import NoThreeLine.Phase15301Family03UnitChunk09
import NoThreeLine.Phase15301Family03UnitChunk10
import NoThreeLine.Phase15301Family03UnitChunk11
import NoThreeLine.Phase15301Family03UnitChunk12
import NoThreeLine.Phase15301Family03UnitChunk13

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family03

theorem unit_partition_checked :
    checkUnitIntegral unitSparseExpr 18446744073709551616 unitInnerCuts = some ((55627108484569987847/9223372036854775808:ℚ)) := by
  have tail14 : checkPartition unitSparseExpr 18446744073709551616 1 [] = some 0 := by rfl
  have tail13 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (56325/56387:ℚ) unitBlock13 ([]) 1 (7333449854324981/2305843009213693952:ℚ) 0
    unit_block13_checked tail14
  have sum13 : (7333449854324981/2305843009213693952:ℚ)+0 = (7333449854324981/2305843009213693952:ℚ) := by norm_num
  rw [sum13] at tail13
  have tail12 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (10113/11144:ℚ) unitBlock12 (unitBlock13++([])) (56325/56387:ℚ) (2689916175580332221/9223372036854775808:ℚ) (7333449854324981/2305843009213693952:ℚ)
    unit_block12_checked tail13
  have sum12 : (2689916175580332221/9223372036854775808:ℚ)+(7333449854324981/2305843009213693952:ℚ) = (2719249974997632145/9223372036854775808:ℚ) := by norm_num
  rw [sum12] at tail12
  have tail11 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (3371/4056:ℚ) unitBlock11 (unitBlock12++(unitBlock13++([]))) (10113/11144:ℚ) (5248070719494866989/18446744073709551616:ℚ) (2719249974997632145/9223372036854775808:ℚ)
    unit_block11_checked tail12
  have sum11 : (5248070719494866989/18446744073709551616:ℚ)+(2719249974997632145/9223372036854775808:ℚ) = (10686570669490131279/18446744073709551616:ℚ) := by norm_num
  rw [sum11] at tail11
  have tail10 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (10113/13192:ℚ) unitBlock10 (unitBlock11++(unitBlock12++(unitBlock13++([])))) (3371/4056:ℚ) (4560455760204267577/18446744073709551616:ℚ) (10686570669490131279/18446744073709551616:ℚ)
    unit_block10_checked tail11
  have sum10 : (4560455760204267577/18446744073709551616:ℚ)+(10686570669490131279/18446744073709551616:ℚ) = (1905878303711799857/2305843009213693952:ℚ) := by norm_num
  rw [sum10] at tail10
  have tail09 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (9089/13192:ℚ) unitBlock09 (unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))) (10113/13192:ℚ) (5634830022129594483/18446744073709551616:ℚ) (1905878303711799857/2305843009213693952:ℚ)
    unit_block09_checked tail10
  have sum09 : (5634830022129594483/18446744073709551616:ℚ)+(1905878303711799857/2305843009213693952:ℚ) = (20881856451823993339/18446744073709551616:ℚ) := by norm_num
  rw [sum09] at tail09
  have tail08 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1997/3229:ℚ) unitBlock08 (unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([])))))) (9089/13192:ℚ) (2832901253111213089/9223372036854775808:ℚ) (20881856451823993339/18446744073709551616:ℚ)
    unit_block08_checked tail09
  have sum08 : (2832901253111213089/9223372036854775808:ℚ)+(20881856451823993339/18446744073709551616:ℚ) = (26547658958046419517/18446744073709551616:ℚ) := by norm_num
  rw [sum08] at tail08
  have tail07 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (7041/13192:ℚ) unitBlock07 (unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))))) (1997/3229:ℚ) (3545131889994728019/9223372036854775808:ℚ) (26547658958046419517/18446744073709551616:ℚ)
    unit_block07_checked tail08
  have sum07 : (3545131889994728019/9223372036854775808:ℚ)+(26547658958046419517/18446744073709551616:ℚ) = (33637922738035875555/18446744073709551616:ℚ) := by norm_num
  rw [sum07] at tail07
  have tail06 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1793/3857:ℚ) unitBlock06 (unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([])))))))) (7041/13192:ℚ) (3202752991611186711/9223372036854775808:ℚ) (33637922738035875555/18446744073709551616:ℚ)
    unit_block06_checked tail07
  have sum06 : (3202752991611186711/9223372036854775808:ℚ)+(33637922738035875555/18446744073709551616:ℚ) = (40043428721258248977/18446744073709551616:ℚ) := by norm_num
  rw [sum06] at tail06
  have tail05 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (31749/80963:ℚ) unitBlock05 (unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))))))) (1793/3857:ℚ) (2042197445938811299/4611686018427387904:ℚ) (40043428721258248977/18446744073709551616:ℚ)
    unit_block05_checked tail06
  have sum05 : (2042197445938811299/4611686018427387904:ℚ)+(40043428721258248977/18446744073709551616:ℚ) = (48212218505013494173/18446744073709551616:ℚ) := by norm_num
  rw [sum05] at tail05
  have tail04 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (7175/23617:ℚ) unitBlock04 (unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([])))))))))) (31749/80963:ℚ) (4910106463405204521/9223372036854775808:ℚ) (48212218505013494173/18446744073709551616:ℚ)
    unit_block04_checked tail05
  have sum04 : (4910106463405204521/9223372036854775808:ℚ)+(48212218505013494173/18446744073709551616:ℚ) = (58032431431823903215/18446744073709551616:ℚ) := by norm_num
  rw [sum04] at tail04
  have tail03 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1921/8072:ℚ) unitBlock03 (unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))))))))) (7175/23617:ℚ) (3830491331562970335/9223372036854775808:ℚ) (58032431431823903215/18446744073709551616:ℚ)
    unit_block03_checked tail04
  have sum03 : (3830491331562970335/9223372036854775808:ℚ)+(58032431431823903215/18446744073709551616:ℚ) = (65693414094949843885/18446744073709551616:ℚ) := by norm_num
  rw [sum03] at tail03
  have tail02 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (3841/22289:ℚ) unitBlock02 (unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([])))))))))))) (1921/8072:ℚ) (8901503797266835023/18446744073709551616:ℚ) (65693414094949843885/18446744073709551616:ℚ)
    unit_block02_checked tail03
  have sum02 : (8901503797266835023/18446744073709551616:ℚ)+(65693414094949843885/18446744073709551616:ℚ) = (18648729473054169727/4611686018427387904:ℚ) := by norm_num
  rw [sum02] at tail02
  have tail01 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1793/16145:ℚ) unitBlock01 (unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))))))))))) (3841/22289:ℚ) (43440258175643791/72057594037927936:ℚ) (18648729473054169727/4611686018427387904:ℚ)
    unit_block01_checked tail02
  have sum01 : (43440258175643791/72057594037927936:ℚ)+(18648729473054169727/4611686018427387904:ℚ) = (21428905996295372351/4611686018427387904:ℚ) := by norm_num
  rw [sum01] at tail01
  have tail00 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    0 unitBlock00 (unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([])))))))))))))) (1793/16145:ℚ) (12769296491979243145/9223372036854775808:ℚ) (21428905996295372351/4611686018427387904:ℚ)
    unit_block00_checked tail01
  have sum00 : (12769296491979243145/9223372036854775808:ℚ)+(21428905996295372351/4611686018427387904:ℚ) = (55627108484569987847/9223372036854775808:ℚ) := by norm_num
  rw [sum00] at tail00
  unfold checkUnitIntegral
  rw [if_pos (show 0 < 18446744073709551616 by decide)]
  change checkPartition unitSparseExpr 18446744073709551616 0 (unitBlock00++(unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))))))))))))) = some ((55627108484569987847/9223372036854775808:ℚ))
  exact tail00

end NoThreeLine.Phase15301Family03

#print axioms NoThreeLine.Phase15301Family03.unit_partition_checked
