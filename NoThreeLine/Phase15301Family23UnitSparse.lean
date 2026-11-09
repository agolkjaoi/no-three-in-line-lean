import NoThreeLine.Phase15301Family23UnitChunk00
import NoThreeLine.Phase15301Family23UnitChunk01
import NoThreeLine.Phase15301Family23UnitChunk02
import NoThreeLine.Phase15301Family23UnitChunk03
import NoThreeLine.Phase15301Family23UnitChunk04
import NoThreeLine.Phase15301Family23UnitChunk05
import NoThreeLine.Phase15301Family23UnitChunk06
import NoThreeLine.Phase15301Family23UnitChunk07
import NoThreeLine.Phase15301Family23UnitChunk08
import NoThreeLine.Phase15301Family23UnitChunk09
import NoThreeLine.Phase15301Family23UnitChunk10
import NoThreeLine.Phase15301Family23UnitChunk11
import NoThreeLine.Phase15301Family23UnitChunk12
import NoThreeLine.Phase15301Family23UnitChunk13
import NoThreeLine.Phase15301Family23UnitChunk14

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family23

theorem unit_partition_checked :
    checkUnitIntegral unitSparseExpr 18446744073709551616 unitInnerCuts = some ((100655355706702664995/18446744073709551616:ℚ)) := by
  have tail15 : checkPartition unitSparseExpr 18446744073709551616 1 [] = some 0 := by rfl
  have tail14 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (72709/72771:ℚ) unitBlock14 ([]) 1 (51540519729537229/18446744073709551616:ℚ) 0
    unit_block14_checked tail15
  have sum14 : (51540519729537229/18446744073709551616:ℚ)+0 = (51540519729537229/18446744073709551616:ℚ) := by norm_num
  rw [sum14] at tail14
  have tail13 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (3841/3857:ℚ) unitBlock13 (unitBlock14++([])) (72709/72771:ℚ) (199478409669563379/18446744073709551616:ℚ) (51540519729537229/18446744073709551616:ℚ)
    unit_block13_checked tail14
  have sum13 : (199478409669563379/18446744073709551616:ℚ)+(51540519729537229/18446744073709551616:ℚ) = (3922170771860947/288230376151711744:ℚ) := by norm_num
  rw [sum13] at tail13
  have tail12 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (7041/8072:ℚ) unitBlock12 (unitBlock13++(unitBlock14++([]))) (3841/3857:ℚ) (7426154202905885709/18446744073709551616:ℚ) (3922170771860947/288230376151711744:ℚ)
    unit_block12_checked tail13
  have sum12 : (7426154202905885709/18446744073709551616:ℚ)+(3922170771860947/288230376151711744:ℚ) = (7677173132304986317/18446744073709551616:ℚ) := by norm_num
  rw [sum12] at tail12
  have tail11 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (57314835353/70278913907:ℚ) unitBlock11 (unitBlock12++(unitBlock13++(unitBlock14++([])))) (7041/8072:ℚ) (1754153597261560679/9223372036854775808:ℚ) (7677173132304986317/18446744073709551616:ℚ)
    unit_block11_checked tail12
  have sum11 : (1754153597261560679/9223372036854775808:ℚ)+(7677173132304986317/18446744073709551616:ℚ) = (11185480326828107675/18446744073709551616:ℚ) := by norm_num
  rw [sum11] at tail11
  have tail10 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (8065/11144:ℚ) unitBlock10 (unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([]))))) (57314835353/70278913907:ℚ) (2774681591919065915/9223372036854775808:ℚ) (11185480326828107675/18446744073709551616:ℚ)
    unit_block10_checked tail11
  have sum10 : (2774681591919065915/9223372036854775808:ℚ)+(11185480326828107675/18446744073709551616:ℚ) = (16734843510666239505/18446744073709551616:ℚ) := by norm_num
  rw [sum10] at tail10
  have tail09 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1719/2599:ℚ) unitBlock09 (unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([])))))) (8065/11144:ℚ) (4340562019624333561/18446744073709551616:ℚ) (16734843510666239505/18446744073709551616:ℚ)
    unit_block09_checked tail10
  have sum09 : (4340562019624333561/18446744073709551616:ℚ)+(16734843510666239505/18446744073709551616:ℚ) = (10537702765145286533/9223372036854775808:ℚ) := by norm_num
  rw [sum09] at tail09
  have tail08 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (204263354501/346868742399:ℚ) unitBlock08 (unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([]))))))) (1719/2599:ℚ) (2529596518634657277/9223372036854775808:ℚ) (10537702765145286533/9223372036854775808:ℚ)
    unit_block08_checked tail09
  have sum08 : (2529596518634657277/9223372036854775808:ℚ)+(10537702765145286533/9223372036854775808:ℚ) = (6533649641889971905/4611686018427387904:ℚ) := by norm_num
  rw [sum08] at tail08
  have tail07 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (12033/24337:ℚ) unitBlock07 (unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([])))))))) (204263354501/346868742399:ℚ) (7291582682786814985/18446744073709551616:ℚ) (6533649641889971905/4611686018427387904:ℚ)
    unit_block07_checked tail08
  have sum07 : (7291582682786814985/18446744073709551616:ℚ)+(6533649641889971905/4611686018427387904:ℚ) = (33426181250346702605/18446744073709551616:ℚ) := by norm_num
  rw [sum07] at tail07
  have tail06 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1323/3032:ℚ) unitBlock06 (unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([]))))))))) (12033/24337:ℚ) (5031514728459046843/18446744073709551616:ℚ) (33426181250346702605/18446744073709551616:ℚ)
    unit_block06_checked tail07
  have sum06 : (5031514728459046843/18446744073709551616:ℚ)+(33426181250346702605/18446744073709551616:ℚ) = (4807211997350718681/2305843009213693952:ℚ) := by norm_num
  rw [sum06] at tail06
  have tail05 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (31751/89153:ℚ) unitBlock05 (unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([])))))))))) (1323/3032:ℚ) (6648155327203102631/18446744073709551616:ℚ) (4807211997350718681/2305843009213693952:ℚ)
    unit_block05_checked tail06
  have sum05 : (6648155327203102631/18446744073709551616:ℚ)+(4807211997350718681/2305843009213693952:ℚ) = (45105851306008852079/18446744073709551616:ℚ) := by norm_num
  rw [sum05] at tail05
  have tail04 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (7853/26987:ℚ) unitBlock04 (unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([]))))))))))) (31751/89153:ℚ) (5701186155411794587/18446744073709551616:ℚ) (45105851306008852079/18446744073709551616:ℚ)
    unit_block04_checked tail05
  have sum04 : (5701186155411794587/18446744073709551616:ℚ)+(45105851306008852079/18446744073709551616:ℚ) = (25403518730710323333/9223372036854775808:ℚ) := by norm_num
  rw [sum04] at tail04
  have tail03 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (2945/13192:ℚ) unitBlock03 (unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([])))))))))))) (7853/26987:ℚ) (104199284167141845/288230376151711744:ℚ) (25403518730710323333/9223372036854775808:ℚ)
    unit_block03_checked tail04
  have sum03 : (104199284167141845/288230376151711744:ℚ)+(25403518730710323333/9223372036854775808:ℚ) = (28737895824058862373/9223372036854775808:ℚ) := by norm_num
  rw [sum03] at tail03
  have tail02 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (259328025935/1742144142997:ℚ) unitBlock02 (unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([]))))))))))))) (2945/13192:ℚ) (1176116038161534205/2305843009213693952:ℚ) (28737895824058862373/9223372036854775808:ℚ)
    unit_block02_checked tail03
  have sum02 : (1176116038161534205/2305843009213693952:ℚ)+(28737895824058862373/9223372036854775808:ℚ) = (33442359976704999193/9223372036854775808:ℚ) := by norm_num
  rw [sum02] at tail02
  have tail01 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (299/3032:ℚ) unitBlock01 (unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([])))))))))))))) (259328025935/1742144142997:ℚ) (4513802875866276229/9223372036854775808:ℚ) (33442359976704999193/9223372036854775808:ℚ)
    unit_block01_checked tail02
  have sum01 : (4513802875866276229/9223372036854775808:ℚ)+(33442359976704999193/9223372036854775808:ℚ) = (18978081426285637711/4611686018427387904:ℚ) := by norm_num
  rw [sum01] at tail01
  have tail00 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    0 unitBlock00 (unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([]))))))))))))))) (299/3032:ℚ) (24743030001560114151/18446744073709551616:ℚ) (18978081426285637711/4611686018427387904:ℚ)
    unit_block00_checked tail01
  have sum00 : (24743030001560114151/18446744073709551616:ℚ)+(18978081426285637711/4611686018427387904:ℚ) = (100655355706702664995/18446744073709551616:ℚ) := by norm_num
  rw [sum00] at tail00
  unfold checkUnitIntegral
  rw [if_pos (show 0 < 18446744073709551616 by decide)]
  change checkPartition unitSparseExpr 18446744073709551616 0 (unitBlock00++(unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++([])))))))))))))))) = some ((100655355706702664995/18446744073709551616:ℚ))
  exact tail00

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.unit_partition_checked
