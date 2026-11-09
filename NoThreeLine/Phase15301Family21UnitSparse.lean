import NoThreeLine.Phase15301Family21UnitChunk00
import NoThreeLine.Phase15301Family21UnitChunk01
import NoThreeLine.Phase15301Family21UnitChunk02
import NoThreeLine.Phase15301Family21UnitChunk03
import NoThreeLine.Phase15301Family21UnitChunk04
import NoThreeLine.Phase15301Family21UnitChunk05
import NoThreeLine.Phase15301Family21UnitChunk06
import NoThreeLine.Phase15301Family21UnitChunk07
import NoThreeLine.Phase15301Family21UnitChunk08
import NoThreeLine.Phase15301Family21UnitChunk09
import NoThreeLine.Phase15301Family21UnitChunk10
import NoThreeLine.Phase15301Family21UnitChunk11
import NoThreeLine.Phase15301Family21UnitChunk12
import NoThreeLine.Phase15301Family21UnitChunk13
import NoThreeLine.Phase15301Family21UnitChunk14
import NoThreeLine.Phase15301Family21UnitChunk15
import NoThreeLine.Phase15301Family21UnitChunk16
import NoThreeLine.Phase15301Family21UnitChunk17
import NoThreeLine.Phase15301Family21UnitChunk18

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace NoThreeLine.Phase15301Family21

theorem unit_partition_checked :
    checkUnitIntegral unitSparseExpr 18446744073709551616 unitInnerCuts = some ((4628525469186170639/1152921504606846976:ℚ)) := by
  have tail19 : checkPartition unitSparseExpr 18446744073709551616 1 [] = some 0 := by rfl
  have tail18 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (959/1017:ℚ) unitBlock18 ([]) 1 (3560252363413253965/18446744073709551616:ℚ) 0
    unit_block18_checked tail19
  have sum18 : (3560252363413253965/18446744073709551616:ℚ)+0 = (3560252363413253965/18446744073709551616:ℚ) := by norm_num
  rw [sum18] at tail18
  have tail17 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (11144/12161:ℚ) unitBlock17 (unitBlock18++([])) (959/1017:ℚ) (883226901485102529/9223372036854775808:ℚ) (3560252363413253965/18446744073709551616:ℚ)
    unit_block17_checked tail18
  have sum17 : (883226901485102529/9223372036854775808:ℚ)+(3560252363413253965/18446744073709551616:ℚ) = (5326706166383459023/18446744073709551616:ℚ) := by norm_num
  rw [sum17] at tail17
  have tail16 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (7048/8065:ℚ) unitBlock16 (unitBlock17++(unitBlock18++([]))) (11144/12161:ℚ) (2648371600973802515/18446744073709551616:ℚ) (5326706166383459023/18446744073709551616:ℚ)
    unit_block16_checked tail17
  have sum16 : (2648371600973802515/18446744073709551616:ℚ)+(5326706166383459023/18446744073709551616:ℚ) = (3987538883678630769/9223372036854775808:ℚ) := by norm_num
  rw [sum16] at tail16
  have tail15 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (6747/8107:ℚ) unitBlock15 (unitBlock16++(unitBlock17++(unitBlock18++([])))) (7048/8065:ℚ) (2510437651623045341/18446744073709551616:ℚ) (3987538883678630769/9223372036854775808:ℚ)
    unit_block15_checked tail16
  have sum15 : (2510437651623045341/18446744073709551616:ℚ)+(3987538883678630769/9223372036854775808:ℚ) = (10485515418980306879/18446744073709551616:ℚ) := by norm_num
  rw [sum15] at tail15
  have tail14 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (64577/80903:ℚ) unitBlock14 (unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))) (6747/8107:ℚ) (2381829340701471265/18446744073709551616:ℚ) (10485515418980306879/18446744073709551616:ℚ)
    unit_block14_checked tail15
  have sum14 : (2381829340701471265/18446744073709551616:ℚ)+(10485515418980306879/18446744073709551616:ℚ) = (402104523740055567/576460752303423488:ℚ) := by norm_num
  rw [sum14] at tail14
  have tail13 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (4056/5419:ℚ) unitBlock13 (unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))) (64577/80903:ℚ) (1811186016705802267/9223372036854775808:ℚ) (402104523740055567/576460752303423488:ℚ)
    unit_block13_checked tail14
  have sum13 : (1811186016705802267/9223372036854775808:ℚ)+(402104523740055567/576460752303423488:ℚ) = (8244858396546691339/9223372036854775808:ℚ) := by norm_num
  rw [sum13] at tail13
  have tail12 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (2599/3767:ℚ) unitBlock12 (unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))) (4056/5419:ℚ) (1987816268824241289/9223372036854775808:ℚ) (8244858396546691339/9223372036854775808:ℚ)
    unit_block12_checked tail13
  have sum12 : (1987816268824241289/9223372036854775808:ℚ)+(8244858396546691339/9223372036854775808:ℚ) = (2558168666342733157/2305843009213693952:ℚ) := by norm_num
  rw [sum12] at tail12
  have tail11 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (18193/28417:ℚ) unitBlock11 (unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))) (2599/3767:ℚ) (911252924195932823/4611686018427387904:ℚ) (2558168666342733157/2305843009213693952:ℚ)
    unit_block11_checked tail12
  have sum11 : (911252924195932823/4611686018427387904:ℚ)+(2558168666342733157/2305843009213693952:ℚ) = (6027590256881399137/4611686018427387904:ℚ) := by norm_num
  rw [sum11] at tail11
  have tail10 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (9096/15233:ℚ) unitBlock10 (unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))) (18193/28417:ℚ) (228733944250931537/1152921504606846976:ℚ) (6027590256881399137/4611686018427387904:ℚ)
    unit_block10_checked tail11
  have sum10 : (228733944250931537/1152921504606846976:ℚ)+(6027590256881399137/4611686018427387904:ℚ) = (6942526033885125285/4611686018427387904:ℚ) := by norm_num
  rw [sum10] at tail10
  have tail09 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (5000/9089:ℚ) unitBlock09 (unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))) (9096/15233:ℚ) (1814428302178456855/9223372036854775808:ℚ) (6942526033885125285/4611686018427387904:ℚ)
    unit_block09_checked tail10
  have sum09 : (1814428302178456855/9223372036854775808:ℚ)+(6942526033885125285/4611686018427387904:ℚ) = (15699480369948707425/9223372036854775808:ℚ) := by norm_num
  rw [sum09] at tail09
  have tail08 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (31811/64517:ℚ) unitBlock08 (unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))))) (5000/9089:ℚ) (4122999046232678583/18446744073709551616:ℚ) (15699480369948707425/9223372036854775808:ℚ)
    unit_block08_checked tail09
  have sum08 : (4122999046232678583/18446744073709551616:ℚ)+(15699480369948707425/9223372036854775808:ℚ) = (35521959786130093433/18446744073709551616:ℚ) := by norm_num
  rw [sum08] at tail08
  have tail07 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (2651/6059:ℚ) unitBlock07 (unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))))) (31811/64517:ℚ) (4525553574577646761/18446744073709551616:ℚ) (35521959786130093433/18446744073709551616:ℚ)
    unit_block07_checked tail08
  have sum07 : (4525553574577646761/18446744073709551616:ℚ)+(35521959786130093433/18446744073709551616:ℚ) = (20023756680353870097/9223372036854775808:ℚ) := by norm_num
  rw [sum07] at tail07
  have tail06 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1928/4993:ℚ) unitBlock06 (unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))))))) (2651/6059:ℚ) (3884550817965399185/18446744073709551616:ℚ) (20023756680353870097/9223372036854775808:ℚ)
    unit_block06_checked tail07
  have sum06 : (3884550817965399185/18446744073709551616:ℚ)+(20023756680353870097/9223372036854775808:ℚ) = (43932064178673139379/18446744073709551616:ℚ) := by norm_num
  rw [sum06] at tail06
  have tail05 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (2952/9089:ℚ) unitBlock05 (unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))))))) (1928/4993:ℚ) (4243839629544008419/18446744073709551616:ℚ) (43932064178673139379/18446744073709551616:ℚ)
    unit_block05_checked tail06
  have sum05 : (4243839629544008419/18446744073709551616:ℚ)+(43932064178673139379/18446744073709551616:ℚ) = (24087951904108573899/9223372036854775808:ℚ) := by norm_num
  rw [sum05] at tail05
  have tail04 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (2952/11137:ℚ) unitBlock04 (unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))))))))) (2952/9089:ℚ) (2100839991789649479/9223372036854775808:ℚ) (24087951904108573899/9223372036854775808:ℚ)
    unit_block04_checked tail05
  have sum04 : (2100839991789649479/9223372036854775808:ℚ)+(24087951904108573899/9223372036854775808:ℚ) = (13094395947949111689/4611686018427387904:ℚ) := by norm_num
  rw [sum04] at tail04
  have tail03 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (1928/9089:ℚ) unitBlock03 (unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))))))))) (2952/11137:ℚ) (3765130579763565327/18446744073709551616:ℚ) (13094395947949111689/4611686018427387904:ℚ)
    unit_block03_checked tail04
  have sum03 : (3765130579763565327/18446744073709551616:ℚ)+(13094395947949111689/4611686018427387904:ℚ) = (56142714371560012083/18446744073709551616:ℚ) := by norm_num
  rw [sum03] at tail03
  have tail02 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (7235/48133:ℚ) unitBlock02 (unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))))))))))) (1928/9089:ℚ) (2140073577432238255/9223372036854775808:ℚ) (56142714371560012083/18446744073709551616:ℚ)
    unit_block02_checked tail03
  have sum02 : (2140073577432238255/9223372036854775808:ℚ)+(56142714371560012083/18446744073709551616:ℚ) = (60422861526424488593/18446744073709551616:ℚ) := by norm_num
  rw [sum02] at tail02
  have tail01 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    (2411/24237:ℚ) unitBlock01 (unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))))))))))) (7235/48133:ℚ) (3807489846933563801/18446744073709551616:ℚ) (60422861526424488593/18446744073709551616:ℚ)
    unit_block01_checked tail02
  have sum01 : (3807489846933563801/18446744073709551616:ℚ)+(60422861526424488593/18446744073709551616:ℚ) = (32115175686679026197/9223372036854775808:ℚ) := by norm_num
  rw [sum01] at tail01
  have tail00 := checkPartitionBlock_append unitSparseExpr 18446744073709551616
    0 unitBlock00 (unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([]))))))))))))))))))) (2411/24237:ℚ) (4913028066810338915/9223372036854775808:ℚ) (32115175686679026197/9223372036854775808:ℚ)
    unit_block00_checked tail01
  have sum00 : (4913028066810338915/9223372036854775808:ℚ)+(32115175686679026197/9223372036854775808:ℚ) = (4628525469186170639/1152921504606846976:ℚ) := by norm_num
  rw [sum00] at tail00
  unfold checkUnitIntegral
  rw [if_pos (show 0 < 18446744073709551616 by decide)]
  change checkPartition unitSparseExpr 18446744073709551616 0 (unitBlock00++(unitBlock01++(unitBlock02++(unitBlock03++(unitBlock04++(unitBlock05++(unitBlock06++(unitBlock07++(unitBlock08++(unitBlock09++(unitBlock10++(unitBlock11++(unitBlock12++(unitBlock13++(unitBlock14++(unitBlock15++(unitBlock16++(unitBlock17++(unitBlock18++([])))))))))))))))))))) = some ((4628525469186170639/1152921504606846976:ℚ))
  exact tail00

end NoThreeLine.Phase15301Family21

#print axioms NoThreeLine.Phase15301Family21.unit_partition_checked
