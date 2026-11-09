import NoThreeLine.Phase15301Family11UnitChunk00
import NoThreeLine.Phase15301Family11UnitChunk01
import NoThreeLine.Phase15301Family11UnitChunk02
import NoThreeLine.Phase15301Family11UnitChunk03
import NoThreeLine.Phase15301Family11UnitChunk04
import NoThreeLine.Phase15301Family11UnitChunk05
import NoThreeLine.Phase15301Family11UnitChunk06
import NoThreeLine.Phase15301Family11UnitChunk07
import NoThreeLine.Phase15301Family11UnitChunk08
import NoThreeLine.Phase15301Family11UnitChunk09
import NoThreeLine.Phase15301Family11UnitChunk10
import NoThreeLine.Phase15301Family11UnitChunk11
import NoThreeLine.Phase15301Family11UnitChunk12
import NoThreeLine.Phase15301Family11UnitChunk13
import NoThreeLine.Phase15301Family11UnitChunk14
import NoThreeLine.Phase15301Family11UnitChunk15
import NoThreeLine.Phase15301Family11UnitChunk16
import NoThreeLine.Phase15301Family11UnitChunk17
import NoThreeLine.Phase15301Family11UnitChunk18

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family11

theorem unit_partition_checked :
    checkUnitIntegral unitSparseExpr 18446744073709551616 unitInnerCuts = some ((23568696994658742255/4611686018427387904:ℚ)) := by
  have tail19 : checkPartition unitSparseExpr 18446744073709551616 1 [] = some 0 := by rfl
  have tail18 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (13192/14209:ℚ) unitBlock18 ([]) 1 (18867316762812889/72057594037927936:ℚ) 0
    unit_block18_checked tail19
  have sum18 : (18867316762812889/72057594037927936:ℚ)+0 = (18867316762812889/72057594037927936:ℚ) := by norm_num
  rw [sum18] at tail18
  have tail17 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (64577/72711:ℚ) unitBlock17 (unitBlock18++([])) (13192/14209:ℚ) (2712016562048360489/18446744073709551616:ℚ) (18867316762812889/72057594037927936:ℚ)
    unit_block17_checked tail18
  have sum17 : (2712016562048360489/18446744073709551616:ℚ)+(18867316762812889/72057594037927936:ℚ) = (7542049653328460073/18446744073709551616:ℚ) := by norm_num
  rw [sum17] at tail17
  have tail16 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (936/1093:ℚ) unitBlock16 (unitBlock17++(unitBlock18++([]))) (64577/72711:ℚ) (441709766059675249/4611686018427387904:ℚ) (7542049653328460073/18446744073709551616:ℚ)
    unit_block16_checked tail17
  have sum16 : (441709766059675249/4611686018427387904:ℚ)+(7542049653328460073/18446744073709551616:ℚ) = (9308888717567161069/18446744073709551616:ℚ) := by norm_num
  rw [sum16] at tail16
  have tail15 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (12168/15233:ℚ) unitBlock15 (unitBlock16++(unitBlock17++(unitBlock18++([])))) (936/1093:ℚ) (3645655136184046553/18446744073709551616:ℚ) (9308888717567161069/18446744073709551616:ℚ)
    unit_block15_checked tail16
  have sum15 : (3645655136184046553/18446744073709551616:ℚ)+(9308888717567161069/18446744073709551616:ℚ) = (6477271926875603811/9223372036854775808:ℚ) := by norm_num
  rw [sum15] at tail15
  have tail14 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (4056/5419:ℚ) unitBlock14 (unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))) (12168/15233:ℚ) (4178258689798988841/18446744073709551616:ℚ) (6477271926875603811/9223372036854775808:ℚ)
    unit_block14_checked tail15
  have sum14 : (4178258689798988841/18446744073709551616:ℚ)+(6477271926875603811/9223372036854775808:ℚ) = (17132802543550196463/18446744073709551616:ℚ) := by norm_num
  rw [sum14] at tail14
  have tail13 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (10120/14209:ℚ) unitBlock13 (unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))) (4056/5419:ℚ) (1526701825223745659/9223372036854775808:ℚ) (17132802543550196463/18446744073709551616:ℚ)
    unit_block13_checked tail14
  have sum13 : (1526701825223745659/9223372036854775808:ℚ)+(17132802543550196463/18446744073709551616:ℚ) = (20186206193997687781/18446744073709551616:ℚ) := by norm_num
  rw [sum13] at tail13
  have tail12 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (64577/97287:ℚ) unitBlock12 (unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))) (10120/14209:ℚ) (3910458108380653421/18446744073709551616:ℚ) (20186206193997687781/18446744073709551616:ℚ)
    unit_block12_checked tail13
  have sum12 : (3910458108380653421/18446744073709551616:ℚ)+(20186206193997687781/18446744073709551616:ℚ) = (12048332151189170601/9223372036854775808:ℚ) := by norm_num
  rw [sum12] at tail12
  have tail11 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1000/1613:ℚ) unitBlock11 (unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))) (64577/97287:ℚ) (419152849492565119/2305843009213693952:ℚ) (12048332151189170601/9223372036854775808:ℚ)
    unit_block11_checked tail12
  have sum11 : (419152849492565119/2305843009213693952:ℚ)+(12048332151189170601/9223372036854775808:ℚ) = (13724943549159431077/9223372036854775808:ℚ) := by norm_num
  rw [sum11] at tail11
  have tail10 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (18193/32513:ℚ) unitBlock10 (unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))) (1000/1613:ℚ) (5057782805070822039/18446744073709551616:ℚ) (13724943549159431077/9223372036854775808:ℚ)
    unit_block10_checked tail11
  have sum10 : (5057782805070822039/18446744073709551616:ℚ)+(13724943549159431077/9223372036854775808:ℚ) = (32507669903389684193/18446744073709551616:ℚ) := by norm_num
  rw [sum10] at tail10
  have tail09 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (48193/97287:ℚ) unitBlock09 (unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))) (18193/32513:ℚ) (5351229048539272535/18446744073709551616:ℚ) (32507669903389684193/18446744073709551616:ℚ)
    unit_block09_checked tail10
  have sum09 : (5351229048539272535/18446744073709551616:ℚ)+(32507669903389684193/18446744073709551616:ℚ) = (4732362368991119591/2305843009213693952:ℚ) := by norm_num
  rw [sum09] at tail09
  have tail08 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (2685/5803:ℚ) unitBlock08 (unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))))) (48193/97287:ℚ) (2752551564300442271/18446744073709551616:ℚ) (4732362368991119591/2305843009213693952:ℚ)
    unit_block08_checked tail09
  have sum08 : (2752551564300442271/18446744073709551616:ℚ)+(4732362368991119591/2305843009213693952:ℚ) = (40611450516229398999/18446744073709551616:ℚ) := by norm_num
  rw [sum08] at tail08
  have tail07 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (6024/15233:ℚ) unitBlock07 (unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))))) (2685/5803:ℚ) (2882054250777827695/9223372036854775808:ℚ) (40611450516229398999/18446744073709551616:ℚ)
    unit_block07_checked tail08
  have sum07 : (2882054250777827695/9223372036854775808:ℚ)+(40611450516229398999/18446744073709551616:ℚ) = (46375559017785054389/18446744073709551616:ℚ) := by norm_num
  rw [sum07] at tail07
  have tail06 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (5000/14209:ℚ) unitBlock06 (unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))))))) (6024/15233:ℚ) (3901734941396508885/18446744073709551616:ℚ) (46375559017785054389/18446744073709551616:ℚ)
    unit_block06_checked tail07
  have sum06 : (3901734941396508885/18446744073709551616:ℚ)+(46375559017785054389/18446744073709551616:ℚ) = (25138646979590781637/9223372036854775808:ℚ) := by norm_num
  rw [sum06] at tail06
  have tail05 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (7953/26369:ℚ) unitBlock05 (unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))))))) (5000/14209:ℚ) (4838045847491662221/18446744073709551616:ℚ) (25138646979590781637/9223372036854775808:ℚ)
    unit_block05_checked tail06
  have sum05 : (4838045847491662221/18446744073709551616:ℚ)+(25138646979590781637/9223372036854775808:ℚ) = (55115339806673225495/18446744073709551616:ℚ) := by norm_num
  rw [sum05] at tail05
  have tail04 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (2952/12161:ℚ) unitBlock04 (unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))))))))) (7953/26369:ℚ) (178601957087357399/576460752303423488:ℚ) (55115339806673225495/18446744073709551616:ℚ)
    unit_block04_checked tail05
  have sum04 : (178601957087357399/576460752303423488:ℚ)+(55115339806673225495/18446744073709551616:ℚ) = (60830602433468662263/18446744073709551616:ℚ) := by norm_num
  rw [sum04] at tail04
  have tail03 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (2952/15233:ℚ) unitBlock03 (unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))))))))) (2952/12161:ℚ) (1496756590471920719/4611686018427387904:ℚ) (60830602433468662263/18446744073709551616:ℚ)
    unit_block03_checked tail04
  have sum03 : (1496756590471920719/4611686018427387904:ℚ)+(60830602433468662263/18446744073709551616:ℚ) = (66817628795356345139/18446744073709551616:ℚ) := by norm_num
  rw [sum03] at tail03
  have tail02 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (551/3767:ℚ) unitBlock02 (unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))))))))))) (2952/15233:ℚ) (2920175825593705513/9223372036854775808:ℚ) (66817628795356345139/18446744073709551616:ℚ)
    unit_block02_checked tail03
  have sum02 : (2920175825593705513/9223372036854775808:ℚ)+(66817628795356345139/18446744073709551616:ℚ) = (72657980446543756165/18446744073709551616:ℚ) := by norm_num
  rw [sum02] at tail02
  have tail01 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (904/10113:ℚ) unitBlock01 (unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))))))))))) (551/3767:ℚ) (7912700324304645343/18446744073709551616:ℚ) (72657980446543756165/18446744073709551616:ℚ)
    unit_block01_checked tail02
  have sum01 : (7912700324304645343/18446744073709551616:ℚ)+(72657980446543756165/18446744073709551616:ℚ) = (20142670192712100377/4611686018427387904:ℚ) := by norm_num
  rw [sum01] at tail01
  have tail00 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    0 unitBlock00 (unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))))))))))))) (904/10113:ℚ) (1713013400973320939/2305843009213693952:ℚ) (20142670192712100377/4611686018427387904:ℚ)
    unit_block00_checked tail01
  have sum00 : (1713013400973320939/2305843009213693952:ℚ)+(20142670192712100377/4611686018427387904:ℚ) = (23568696994658742255/4611686018427387904:ℚ) := by norm_num
  rw [sum00] at tail00
  unfold checkUnitIntegral
  rw [if_pos (show 0 < 18446744073709551616 by decide)]
  change checkPartition unitSparseExpr 18446744073709551616 0 (unitBlock00++(unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))))))))))))) = some ((23568696994658742255/4611686018427387904:ℚ))
  exact tail00

end NoThreeLine.Phase15301Family11

#print axioms NoThreeLine.Phase15301Family11.unit_partition_checked
