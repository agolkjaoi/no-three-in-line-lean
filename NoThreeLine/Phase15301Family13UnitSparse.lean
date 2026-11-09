import NoThreeLine.Phase15301Family13UnitChunk00
import NoThreeLine.Phase15301Family13UnitChunk01
import NoThreeLine.Phase15301Family13UnitChunk02
import NoThreeLine.Phase15301Family13UnitChunk03
import NoThreeLine.Phase15301Family13UnitChunk04
import NoThreeLine.Phase15301Family13UnitChunk05
import NoThreeLine.Phase15301Family13UnitChunk06
import NoThreeLine.Phase15301Family13UnitChunk07
import NoThreeLine.Phase15301Family13UnitChunk08
import NoThreeLine.Phase15301Family13UnitChunk09
import NoThreeLine.Phase15301Family13UnitChunk10
import NoThreeLine.Phase15301Family13UnitChunk11
import NoThreeLine.Phase15301Family13UnitChunk12
import NoThreeLine.Phase15301Family13UnitChunk13

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family13

theorem unit_partition_checked :
    checkUnitIntegral unitSparseExpr 18446744073709551616 unitInnerCuts = some ((109680517313018801141/18446744073709551616:ℚ)) := by
  have tail14 : checkPartition unitSparseExpr 18446744073709551616 1 [] = some 0 := by rfl
  have tail13 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (16129/16145:ℚ) unitBlock13 ([]) 1 (63847993738014033/18446744073709551616:ℚ) 0
    unit_block13_checked tail14
  have sum13 : (63847993738014033/18446744073709551616:ℚ)+0 = (63847993738014033/18446744073709551616:ℚ) := by norm_num
  rw [sum13] at tail13
  have tail12 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (13185/14216:ℚ) unitBlock12 (unitBlock13++([])) (16129/16145:ℚ) (4441918713037527881/18446744073709551616:ℚ) (63847993738014033/18446744073709551616:ℚ)
    unit_block12_checked tail13
  have sum12 : (4441918713037527881/18446744073709551616:ℚ)+(63847993738014033/18446744073709551616:ℚ) = (2252883353387770957/9223372036854775808:ℚ) := by norm_num
  rw [sum12] at tail12
  have tail11 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (4011/4699:ℚ) unitBlock11 (unitBlock12++(unitBlock13++([]))) (13185/14216:ℚ) (2148183512378181341/9223372036854775808:ℚ) (2252883353387770957/9223372036854775808:ℚ)
    unit_block11_checked tail12
  have sum11 : (2148183512378181341/9223372036854775808:ℚ)+(2252883353387770957/9223372036854775808:ℚ) = (2200533432882976149/4611686018427387904:ℚ) := by norm_num
  rw [sum11] at tail11
  have tail10 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (56327/72769:ℚ) unitBlock10 (unitBlock11++(unitBlock12++(unitBlock13++([])))) (4011/4699:ℚ) (5043900726573759685/18446744073709551616:ℚ) (2200533432882976149/4611686018427387904:ℚ)
    unit_block10_checked tail11
  have sum10 : (5043900726573759685/18446744073709551616:ℚ)+(2200533432882976149/4611686018427387904:ℚ) = (13846034458105664281/18446744073709551616:ℚ) := by norm_num
  rw [sum10] at tail10
  have tail09 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (14081/20241:ℚ) unitBlock09 (unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))) (56327/72769:ℚ) (2691809497366494773/9223372036854775808:ℚ) (13846034458105664281/18446744073709551616:ℚ)
    unit_block09_checked tail10
  have sum09 : (2691809497366494773/9223372036854775808:ℚ)+(13846034458105664281/18446744073709551616:ℚ) = (19229653452838653827/18446744073709551616:ℚ) := by norm_num
  rw [sum09] at tail09
  have tail08 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (14081/22289:ℚ) unitBlock08 (unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([])))))) (14081/20241:ℚ) (4757291218304967545/18446744073709551616:ℚ) (19229653452838653827/18446744073709551616:ℚ)
    unit_block08_checked tail09
  have sum08 : (4757291218304967545/18446744073709551616:ℚ)+(19229653452838653827/18446744073709551616:ℚ) = (5996736167785905343/4611686018427387904:ℚ) := by norm_num
  rw [sum08] at tail08
  have tail07 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (9985/18193:ℚ) unitBlock07 (unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))))) (14081/22289:ℚ) (3329649227001918773/9223372036854775808:ℚ) (5996736167785905343/4611686018427387904:ℚ)
    unit_block07_checked tail08
  have sum07 : (3329649227001918773/9223372036854775808:ℚ)+(5996736167785905343/4611686018427387904:ℚ) = (15323121562573729459/9223372036854775808:ℚ) := by norm_num
  rw [sum07] at tail07
  have tail06 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (15365/31811:ℚ) unitBlock06 (unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([])))))))) (9985/18193:ℚ) (5518254890422491787/18446744073709551616:ℚ) (15323121562573729459/9223372036854775808:ℚ)
    unit_block06_checked tail07
  have sum06 : (5518254890422491787/18446744073709551616:ℚ)+(15323121562573729459/9223372036854775808:ℚ) = (36164498015569950705/18446744073709551616:ℚ) := by norm_num
  rw [sum06] at tail06
  have tail05 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (39941/97347:ℚ) unitBlock05 (unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))))))) (15365/31811:ℚ) (3540367265148964299/9223372036854775808:ℚ) (36164498015569950705/18446744073709551616:ℚ)
    unit_block05_checked tail06
  have sum05 : (3540367265148964299/9223372036854775808:ℚ)+(36164498015569950705/18446744073709551616:ℚ) = (43245232545867879303/18446744073709551616:ℚ) := by norm_num
  rw [sum05] at tail05
  have tail04 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (23557/72771:ℚ) unitBlock04 (unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([])))))))))) (39941/97347:ℚ) (9013065438052523471/18446744073709551616:ℚ) (43245232545867879303/18446744073709551616:ℚ)
    unit_block04_checked tail05
  have sum04 : (9013065438052523471/18446744073709551616:ℚ)+(43245232545867879303/18446744073709551616:ℚ) = (26129148991960201387/9223372036854775808:ℚ) := by norm_num
  rw [sum04] at tail04
  have tail03 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (215361129875/815025035957:ℚ) unitBlock03 (unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))))))))) (23557/72771:ℚ) (814249163570331195/2305843009213693952:ℚ) (26129148991960201387/9223372036854775808:ℚ)
    unit_block03_checked tail04
  have sum03 : (814249163570331195/2305843009213693952:ℚ)+(26129148991960201387/9223372036854775808:ℚ) = (29386145646241526167/9223372036854775808:ℚ) := by norm_num
  rw [sum03] at tail03
  have tail02 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (3841/20241:ℚ) unitBlock02 (unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([])))))))))))) (215361129875/815025035957:ℚ) (9096025913365675673/18446744073709551616:ℚ) (29386145646241526167/9223372036854775808:ℚ)
    unit_block02_checked tail03
  have sum02 : (9096025913365675673/18446744073709551616:ℚ)+(29386145646241526167/9223372036854775808:ℚ) = (67868317205848728007/18446744073709551616:ℚ) := by norm_num
  rw [sum02] at tail02
  have tail01 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1793/16145:ℚ) unitBlock01 (unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))))))))))) (3841/20241:ℚ) (1654150712118210179/2305843009213693952:ℚ) (67868317205848728007/18446744073709551616:ℚ)
    unit_block01_checked tail02
  have sum01 : (1654150712118210179/2305843009213693952:ℚ)+(67868317205848728007/18446744073709551616:ℚ) = (81101522902794409439/18446744073709551616:ℚ) := by norm_num
  rw [sum01] at tail01
  have tail00 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    0 unitBlock00 (unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([])))))))))))))) (1793/16145:ℚ) (14289497205112195851/9223372036854775808:ℚ) (81101522902794409439/18446744073709551616:ℚ)
    unit_block00_checked tail01
  have sum00 : (14289497205112195851/9223372036854775808:ℚ)+(81101522902794409439/18446744073709551616:ℚ) = (109680517313018801141/18446744073709551616:ℚ) := by norm_num
  rw [sum00] at tail00
  unfold checkUnitIntegral
  rw [if_pos (show 0 < 18446744073709551616 by decide)]
  change checkPartition unitSparseExpr 18446744073709551616 0 (unitBlock00++(unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++([]))))))))))))))) = some ((109680517313018801141/18446744073709551616:ℚ))
  exact tail00

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.unit_partition_checked
