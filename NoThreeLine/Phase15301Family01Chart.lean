import NoThreeLine.Phase15301Family01UnitCertificate
import NoThreeLine.Phase15301Original
import NoThreeLine.BenchmarkChartReindex

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval

namespace NoThreeLine.Phase15301Family01

def permutationData : Array (Fin 262) := #[247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,246,245,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,227,228,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,33,34,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,16,15,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
def chartPermutation (i : Fin 262) : Fin 262 := permutationData.getD i.val 0
def inverseData : Array (Fin 262) := #[247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,246,245,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,227,228,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,33,34,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,16,15,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
def chartInverse (i : Fin 262) : Fin 262 := inverseData.getD i.val 0

theorem chartPermutation_bijective : Function.Bijective chartPermutation := by
  have h : Function.LeftInverse chartInverse chartPermutation ∧
      Function.RightInverse chartInverse chartPermutation := by decide +kernel
  exact ⟨h.1.injective,h.2.surjective⟩

theorem original_chart_checked :
    qChartReindexCheck Phase15301Original.rectangles0 rectangles
      Phase15301Original.weights0 weights Phase15301Original.root root
      1 chartPermutation = true := by
  unfold qChartReindexCheck
  apply decide_eq_true_eq.mpr
  refine ⟨chartPermutation_bijective,?_,?_⟩
  all_goals decide +kernel

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    (∫ u in (0 : ℝ)..1, (directionalChord 1 Phase15301Original.field0 x y u)^2) ≤
      ((12128154728829487383/2305843009213693952:ℚ) : ℝ) := by
  exact qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Original.root root 1 chartPermutation
    original_chart_checked ((12128154728829487383/2305843009213693952:ℚ) : ℝ) actual_integral_bound x y hx hy

theorem erased_original_directional_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1)
    (vertical horizontal : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (directionalChord 1
      (eraseGrid vertical horizontal Phase15301Original.field0) x y u)^2) ≤
      ((12128154728829487383/2305843009213693952:ℚ) : ℝ) := by
  rw [directionalChord_eraseGrid_square_integral_eq]
  exact original_directional_integral_bound x y hx hy

end NoThreeLine.Phase15301Family01

#print axioms NoThreeLine.Phase15301Family01.original_chart_checked
#print axioms NoThreeLine.Phase15301Family01.original_directional_integral_bound
#print axioms NoThreeLine.Phase15301Family01.erased_original_directional_integral_bound
