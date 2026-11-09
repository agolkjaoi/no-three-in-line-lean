import NoThreeLine.Phase15301Family01UnitChunk00
import NoThreeLine.Phase15301Family01UnitChunk01
import NoThreeLine.Phase15301Family01UnitChunk02
import NoThreeLine.Phase15301Family01UnitChunk03
import NoThreeLine.Phase15301Family01UnitChunk04
import NoThreeLine.Phase15301Family01UnitChunk05
import NoThreeLine.Phase15301Family01UnitChunk06
import NoThreeLine.Phase15301Family01UnitChunk07
import NoThreeLine.Phase15301Family01UnitChunk08
import NoThreeLine.Phase15301Family01UnitChunk09
import NoThreeLine.Phase15301Family01UnitChunk10
import NoThreeLine.Phase15301Family01UnitChunk11
import NoThreeLine.Phase15301Family01UnitChunk12
import NoThreeLine.Phase15301Family01UnitChunk13
import NoThreeLine.Phase15301Family01UnitChunk14
import NoThreeLine.Phase15301Family01UnitChunk15
import NoThreeLine.Phase15301Family01UnitChunk16
import NoThreeLine.Phase15301Family01UnitChunk17

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family01

theorem unit_partition_checked :
    checkUnitIntegral unitSparseExpr 18446744073709551616 unitInnerCuts = some ((12128154728829487383/2305843009213693952:ℚ)) := by
  have tail18 : checkPartition unitSparseExpr 18446744073709551616 1 [] = some 0 := by rfl
  have tail17 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (26385/28417:ℚ) unitBlock17 ([]) 1 (4360574271124383373/18446744073709551616:ℚ) 0
    unit_block17_checked tail18
  have sum17 : (4360574271124383373/18446744073709551616:ℚ)+0 = (4360574271124383373/18446744073709551616:ℚ) := by norm_num
  rw [sum17] at tail17
  have tail16 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (3032/3371:ℚ) unitBlock16 (unitBlock17++([])) (26385/28417:ℚ) (1026323625735317653/9223372036854775808:ℚ) (4360574271124383373/18446744073709551616:ℚ)
    unit_block16_checked tail17
  have sum16 : (1026323625735317653/9223372036854775808:ℚ)+(4360574271124383373/18446744073709551616:ℚ) = (6413221522595018679/18446744073709551616:ℚ) := by norm_num
  rw [sum16] at tail16
  have tail15 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (26129/30465:ℚ) unitBlock15 (unitBlock16++(unitBlock17++([]))) (3032/3371:ℚ) (2624449682832608145/18446744073709551616:ℚ) (6413221522595018679/18446744073709551616:ℚ)
    unit_block15_checked tail16
  have sum15 : (2624449682832608145/18446744073709551616:ℚ)+(6413221522595018679/18446744073709551616:ℚ) = (1129708900678453353/2305843009213693952:ℚ) := by norm_num
  rw [sum15] at tail15
  have tail14 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (24337/30465:ℚ) unitBlock14 (unitBlock15++(unitBlock16++(unitBlock17++([])))) (26129/30465:ℚ) (3796843193949564215/18446744073709551616:ℚ) (1129708900678453353/2305843009213693952:ℚ)
    unit_block14_checked tail15
  have sum14 : (3796843193949564215/18446744073709551616:ℚ)+(1129708900678453353/2305843009213693952:ℚ) = (12834514399377191039/18446744073709551616:ℚ) := by norm_num
  rw [sum14] at tail14
  have tail13 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (19469/26011:ℚ) unitBlock13 (unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([]))))) (24337/30465:ℚ) (506813862857801709/2305843009213693952:ℚ) (12834514399377191039/18446744073709551616:ℚ)
    unit_block13_checked tail14
  have sum13 : (506813862857801709/2305843009213693952:ℚ)+(12834514399377191039/18446744073709551616:ℚ) = (16889025302239604711/18446744073709551616:ℚ) := by norm_num
  rw [sum13] at tail13
  have tail12 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (5000/7041:ℚ) unitBlock12 (unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([])))))) (19469/26011:ℚ) (3271975145994807021/18446744073709551616:ℚ) (16889025302239604711/18446744073709551616:ℚ)
    unit_block12_checked tail13
  have sum12 : (3271975145994807021/18446744073709551616:ℚ)+(16889025302239604711/18446744073709551616:ℚ) = (5040250112058602933/4611686018427387904:ℚ) := by norm_num
  rw [sum12] at tail12
  have tail11 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1928/2945:ℚ) unitBlock11 (unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([]))))))) (5000/7041:ℚ) (4298128574358179073/18446744073709551616:ℚ) (5040250112058602933/4611686018427387904:ℚ)
    unit_block11_checked tail12
  have sum11 : (4298128574358179073/18446744073709551616:ℚ)+(5040250112058602933/4611686018427387904:ℚ) = (24459129022592590805/18446744073709551616:ℚ) := by norm_num
  rw [sum11] at tail11
  have tail10 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (4699/8107:ℚ) unitBlock10 (unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([])))))))) (1928/2945:ℚ) (2933045096081409623/9223372036854775808:ℚ) (24459129022592590805/18446744073709551616:ℚ)
    unit_block10_checked tail11
  have sum10 : (2933045096081409623/9223372036854775808:ℚ)+(24459129022592590805/18446744073709551616:ℚ) = (30325219214755410051/18446744073709551616:ℚ) := by norm_num
  rw [sum10] at tail10
  have tail09 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (7048/13185:ℚ) unitBlock09 (unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([]))))))))) (4699/8107:ℚ) (4009052304267130571/18446744073709551616:ℚ) (30325219214755410051/18446744073709551616:ℚ)
    unit_block09_checked tail10
  have sum09 : (4009052304267130571/18446744073709551616:ℚ)+(30325219214755410051/18446744073709551616:ℚ) = (17167135759511270311/9223372036854775808:ℚ) := by norm_num
  rw [sum09] at tail09
  have tail08 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1928/3969:ℚ) unitBlock08 (unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([])))))))))) (7048/13185:ℚ) (4209578203841266567/18446744073709551616:ℚ) (17167135759511270311/9223372036854775808:ℚ)
    unit_block08_checked tail09
  have sum08 : (4209578203841266567/18446744073709551616:ℚ)+(17167135759511270311/9223372036854775808:ℚ) = (38543849722863807189/18446744073709551616:ℚ) := by norm_num
  rw [sum08] at tail08
  have tail07 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (10001/24321:ℚ) unitBlock07 (unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([]))))))))))) (1928/3969:ℚ) (6227390131529518449/18446744073709551616:ℚ) (38543849722863807189/18446744073709551616:ℚ)
    unit_block07_checked tail08
  have sum07 : (6227390131529518449/18446744073709551616:ℚ)+(38543849722863807189/18446744073709551616:ℚ) = (22385619927196662819/9223372036854775808:ℚ) := by norm_num
  rw [sum07] at tail07
  have tail06 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (23617/64519:ℚ) unitBlock06 (unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([])))))))))))) (10001/24321:ℚ) (2108409469548179085/9223372036854775808:ℚ) (22385619927196662819/9223372036854775808:ℚ)
    unit_block06_checked tail07
  have sum06 : (2108409469548179085/9223372036854775808:ℚ)+(22385619927196662819/9223372036854775808:ℚ) = (1530876837296552619/576460752303423488:ℚ) := by norm_num
  rw [sum06] at tail06
  have tail05 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (904/2945:ℚ) unitBlock05 (unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([]))))))))))))) (23617/64519:ℚ) (5565330576165159701/18446744073709551616:ℚ) (1530876837296552619/576460752303423488:ℚ)
    unit_block05_checked tail06
  have sum05 : (5565330576165159701/18446744073709551616:ℚ)+(1530876837296552619/576460752303423488:ℚ) = (54553389369654843509/18446744073709551616:ℚ) := by norm_num
  rw [sum05] at tail05
  have tail04 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (5905/24321:ℚ) unitBlock04 (unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([])))))))))))))) (904/2945:ℚ) (6661605233839059379/18446744073709551616:ℚ) (54553389369654843509/18446744073709551616:ℚ)
    unit_block04_checked tail05
  have sum04 : (6661605233839059379/18446744073709551616:ℚ)+(54553389369654843509/18446744073709551616:ℚ) = (7651874325436737861/2305843009213693952:ℚ) := by norm_num
  rw [sum04] at tail04
  have tail03 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (283792780677/1464174096368:ℚ) unitBlock03 (unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([]))))))))))))))) (5905/24321:ℚ) (1522646873122790321/4611686018427387904:ℚ) (7651874325436737861/2305843009213693952:ℚ)
    unit_block03_checked tail04
  have sum03 : (1522646873122790321/4611686018427387904:ℚ)+(7651874325436737861/2305843009213693952:ℚ) = (16826395523996266043/4611686018427387904:ℚ) := by norm_num
  rw [sum03] at tail03
  have tail02 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (43473768526/289356367085:ℚ) unitBlock02 (unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([])))))))))))))))) (283792780677/1464174096368:ℚ) (5715867389880598569/18446744073709551616:ℚ) (16826395523996266043/4611686018427387904:ℚ)
    unit_block02_checked tail03
  have sum02 : (5715867389880598569/18446744073709551616:ℚ)+(16826395523996266043/4611686018427387904:ℚ) = (73021449485865662741/18446744073709551616:ℚ) := by norm_num
  rw [sum02] at tail02
  have tail01 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (904/9089:ℚ) unitBlock01 (unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([]))))))))))))))))) (43473768526/289356367085:ℚ) (7553923483102834455/18446744073709551616:ℚ) (73021449485865662741/18446744073709551616:ℚ)
    unit_block01_checked tail02
  have sum01 : (7553923483102834455/18446744073709551616:ℚ)+(73021449485865662741/18446744073709551616:ℚ) = (20143843242242124299/4611686018427387904:ℚ) := by norm_num
  rw [sum01] at tail01
  have tail00 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    0 unitBlock00 (unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([])))))))))))))))))) (904/9089:ℚ) (4112466215416850467/4611686018427387904:ℚ) (20143843242242124299/4611686018427387904:ℚ)
    unit_block00_checked tail01
  have sum00 : (4112466215416850467/4611686018427387904:ℚ)+(20143843242242124299/4611686018427387904:ℚ) = (12128154728829487383/2305843009213693952:ℚ) := by norm_num
  rw [sum00] at tail00
  unfold checkUnitIntegral
  rw [if_pos (show 0 < 18446744073709551616 by decide)]
  change checkPartition unitSparseExpr 18446744073709551616 0 (unitBlock00++(unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++([]))))))))))))))))))) = some ((12128154728829487383/2305843009213693952:ℚ))
  exact tail00

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.unit_partition_checked
