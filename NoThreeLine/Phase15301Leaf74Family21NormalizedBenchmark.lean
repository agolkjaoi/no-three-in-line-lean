import NoThreeLine.Phase15301Leaf74Family21Data
import NoThreeLine.BenchmarkNormalizedBlock

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open Set MeasureTheory
open scoped Interval
namespace NoThreeLine.Phase15301Leaf74.Family21.NormalizedBenchmark
open AutoEnvelope Phase15301Family21

def smallExpr : Expr := .add (.min (.add (.max (.add (.atom ⟨(1362313091641/819200000000:ℚ),(16587283107/409600000000:ℚ)⟩) (.add (.scale ((-53249703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-16257/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-15233/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-3360697/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-14209/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((12270087/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-13185/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-1060487/625000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-12161/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15147347/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-11137/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((93242049/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-10113/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-8853707/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-9089/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))))))) (.add (.atom ⟨(2128671419/1280000000:ℚ),(33211182733/819200000000:ℚ)⟩) (.add (.scale ((-53249703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-127/128:ℚ),(907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-119/128:ℚ),(907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-3360697/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-111/128:ℚ),(907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((12270087/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-103/128:ℚ),(907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-1060487/625000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-95/128:ℚ),(907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15147347/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-87/128:ℚ),(907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((93242049/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-79/128:ℚ),(907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-8853707/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-71/128:ℚ),(907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))))) (.add (.scale ((53249703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(16257/16384:ℚ),(-453/8192:ℚ)⟩) (.add (.min (.atom ⟨(-127/128:ℚ),(907/16384:ℚ)⟩) (.atom ⟨(1/65536:ℚ),(1/65536:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((3360697/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(14209/16384:ℚ),(-453/8192:ℚ)⟩) (.add (.min (.atom ⟨(-111/128:ℚ),(907/16384:ℚ)⟩) (.atom ⟨(1/65536:ℚ),(1/65536:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((1060487/625000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(12161/16384:ℚ),(-453/8192:ℚ)⟩) (.add (.min (.atom ⟨(-95/128:ℚ),(907/16384:ℚ)⟩) (.atom ⟨(1/65536:ℚ),(1/65536:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.add (.scale ((8853707/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(9089/16384:ℚ),(-453/8192:ℚ)⟩) (.add (.min (.atom ⟨(-71/128:ℚ),(907/16384:ℚ)⟩) (.atom ⟨(1/65536:ℚ),(1/65536:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))))) (.add (.min (.add (.atom ⟨(1362313091641/819200000000:ℚ),(16587283107/409600000000:ℚ)⟩) (.add (.scale ((-53249703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-16257/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((91082829/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-15233/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-3360697/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-14209/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((12270087/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-13185/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-1060487/625000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-12161/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((15147347/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-11137/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((93242049/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-10113/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((-8853707/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(-9089/16384:ℚ),(453/8192:ℚ)⟩)) (.atom ⟨0,0⟩))) (.add (.scale ((53249703/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(16257/16384:ℚ),(-453/8192:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨0,0⟩) (.atom ⟨(127/128:ℚ),(-907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((15416577/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(16257/16384:ℚ),(-453/8192:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(1/16:ℚ),0⟩) (.atom ⟨(127/128:ℚ),(-907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((9388637/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(3/16:ℚ),0⟩) (.atom ⟨(16257/16384:ℚ),(-453/8192:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(1/8:ℚ),0⟩) (.atom ⟨(127/128:ℚ),(-907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((8195751/5000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(16257/16384:ℚ),(-453/8192:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(1/4:ℚ),0⟩) (.atom ⟨(127/128:ℚ),(-907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((148767673/100000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(3/8:ℚ),0⟩) (.atom ⟨(16257/16384:ℚ),(-453/8192:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(5/16:ℚ),0⟩) (.atom ⟨(127/128:ℚ),(-907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((6940703/12500000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.min (.atom ⟨(7/16:ℚ),0⟩) (.atom ⟨(16257/16384:ℚ),(-453/8192:ℚ)⟩)) (.add (.scale (-1) (.add (.max (.atom ⟨(3/8:ℚ),0⟩) (.atom ⟨(127/128:ℚ),(-907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.add (.scale ((36616519/50000000:ℚ)) (.add (.max (.atom ⟨0,0⟩) (.add (.atom ⟨(16257/16384:ℚ),(-453/8192:ℚ)⟩) (.add (.scale (-1) (.add (.max (.atom ⟨(7/16:ℚ),0⟩) (.atom ⟨(127/128:ℚ),(-907/16384:ℚ)⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)))) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩))))))))))))))))) (.atom ⟨(265291079/50000000:ℚ),0⟩)) (.atom ⟨0,0⟩))) (.atom ⟨0,0⟩)
def normalizedCuts : List (ℚ × AutoTrace) := [((1/32:ℚ),.auto),((3/64:ℚ),.auto),((7/128:ℚ),.auto),((15/256:ℚ),.auto),((61/1024:ℚ),.auto),((31/512:ℚ),.auto),((1/16:ℚ),.auto),((33/512:ℚ),.auto),((17/256:ℚ),.auto),((35/512:ℚ),.auto),((9/128:ℚ),.auto),((19/256:ℚ),.auto),((39/512:ℚ),.auto),((5/64:ℚ),.auto),((41/512:ℚ),.auto),((21/256:ℚ),.auto),((43/512:ℚ),.auto),((11/128:ℚ),.auto),((45/512:ℚ),.auto),((23/256:ℚ),.auto),((3/32:ℚ),.auto),((25/256:ℚ),.auto),((51/512:ℚ),.auto),((13/128:ℚ),.auto)]

theorem normalization_checked :
    (gatheredExpr.intervalNormalize 0 ((13/128:ℚ))).atomNormalize=smallExpr := by
  decide +kernel

theorem block_checked : checkUpperBlock smallExpr 18446744073709551616 0 normalizedCuts=
    some ((13/128:ℚ),(4997597543442027965/9223372036854775808:ℚ)) := by decide +kernel

theorem actual_block_integral_bound (x y : ℝ)
    (hx : x∈Icc (queryRoot.x0:ℝ) queryRoot.x1)
    (hy : y∈Icc (queryRoot.y0:ℝ) queryRoot.y1) :
    (∫u in (0:ℝ)..((13/128:ℚ):ℝ),(actualChord rectangles weights x y u)^2)≤((4997597543442027965/9223372036854775808:ℚ):ℝ) := by
  have hlocal := normalizedUpperBlock_integral_le gatheredExpr smallExpr 18446744073709551616 0 ((13/128:ℚ))
    normalizedCuts ((4997597543442027965/9223372036854775808:ℚ)) (actualChord rectangles weights x y)
    (by decide) (le_refl 0) normalization_checked block_checked
  simp only [Rat.cast_zero] at hlocal
  apply hlocal
  · have hi := fieldChord_square_intervalIntegrable Finset.univ
      (fun i=>(rectangles i).real) (fun i=>(weights i:ℝ)) x y
    apply hi.mono_set
    rw [uIcc_of_le (by norm_num : (0:ℝ)≤((13/128:ℚ):ℝ)),
      uIcc_of_le (by norm_num : (0:ℝ)≤1)]
    exact Icc_subset_Icc le_rfl (by norm_num)
  · intro u hu
    have hpos : 0<u := by simpa only [Rat.cast_zero] using hu.1
    have hunit : u≤1 := hu.2.le.trans (by norm_num)
    have h := fullExpr_chord_bounds rectangles weights (qCompleteEdges positiveEdges negativeEdges)
      queryRoot cap x y u data_checked hx hy hpos
    refine ⟨h.1,?_⟩
    rw [←expression_from_actual_field,Expr.atomNormalize_eval,
      Expr.unitNormalize_eval _ u hpos hunit]
    rw [←fullExpr_complete_eval rectangles weights positiveEdges negativeEdges queryRoot cap u
      negative_edges_nonpositive]
    exact h.2.1

end NoThreeLine.Phase15301Leaf74.Family21.NormalizedBenchmark

#print axioms NoThreeLine.Phase15301Leaf74.Family21.NormalizedBenchmark.normalization_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family21.NormalizedBenchmark.block_checked
#print axioms NoThreeLine.Phase15301Leaf74.Family21.NormalizedBenchmark.actual_block_integral_bound
