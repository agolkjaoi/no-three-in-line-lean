import NoThreeLine.Phase15301Family02UnitCertificate
import NoThreeLine.Phase15301Original
import NoThreeLine.BenchmarkChartReindex

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval

namespace NoThreeLine.Phase15301Family02

def permutationData : Array (Fin 262) := #[0,17,35,51,67,83,99,115,131,147,163,179,195,211,229,227,228,245,261,1,18,36,52,68,84,100,116,132,148,164,180,196,212,230,246,2,19,37,53,69,85,101,117,133,149,165,181,197,213,231,247,3,20,38,54,70,86,102,118,134,150,166,182,198,214,232,248,4,21,39,55,71,87,103,119,135,151,167,183,199,215,233,249,5,22,40,56,72,88,104,120,136,152,168,184,200,216,234,250,6,23,41,57,73,89,105,121,137,153,169,185,201,217,235,251,7,24,42,58,74,90,106,122,138,154,170,186,202,218,236,252,8,25,43,59,75,91,107,123,139,155,171,187,203,219,237,253,9,26,44,60,76,92,108,124,140,156,172,188,204,220,238,254,10,27,45,61,77,93,109,125,141,157,173,189,205,221,239,255,11,28,46,62,78,94,110,126,142,158,174,190,206,222,240,256,12,29,47,63,79,95,111,127,143,159,175,191,207,223,241,257,13,30,48,64,80,96,112,128,144,160,176,192,208,224,242,258,15,31,49,65,81,97,113,129,145,161,177,193,209,225,243,259,14,16,33,34,50,66,82,98,114,130,146,162,178,194,210,226,244,260,32]
def chartPermutation (i : Fin 262) : Fin 262 := permutationData.getD i.val 0
def inverseData : Array (Fin 262) := #[0,19,35,51,67,83,99,115,131,147,163,179,195,211,243,227,244,1,20,36,52,68,84,100,116,132,148,164,180,196,212,228,261,245,246,2,21,37,53,69,85,101,117,133,149,165,181,197,213,229,247,3,22,38,54,70,86,102,118,134,150,166,182,198,214,230,248,4,23,39,55,71,87,103,119,135,151,167,183,199,215,231,249,5,24,40,56,72,88,104,120,136,152,168,184,200,216,232,250,6,25,41,57,73,89,105,121,137,153,169,185,201,217,233,251,7,26,42,58,74,90,106,122,138,154,170,186,202,218,234,252,8,27,43,59,75,91,107,123,139,155,171,187,203,219,235,253,9,28,44,60,76,92,108,124,140,156,172,188,204,220,236,254,10,29,45,61,77,93,109,125,141,157,173,189,205,221,237,255,11,30,46,62,78,94,110,126,142,158,174,190,206,222,238,256,12,31,47,63,79,95,111,127,143,159,175,191,207,223,239,257,13,32,48,64,80,96,112,128,144,160,176,192,208,224,240,258,15,16,14,33,49,65,81,97,113,129,145,161,177,193,209,225,241,259,17,34,50,66,82,98,114,130,146,162,178,194,210,226,242,260,18]
def chartInverse (i : Fin 262) : Fin 262 := inverseData.getD i.val 0

theorem chartPermutation_bijective : Function.Bijective chartPermutation := by
  have h : Function.LeftInverse chartInverse chartPermutation ∧
      Function.RightInverse chartInverse chartPermutation := by decide +kernel
  exact ⟨h.1.injective,h.2.surjective⟩

theorem original_chart_checked :
    qChartReindexCheck Phase15301Original.rectangles0 rectangles
      Phase15301Original.weights0 weights Phase15301Original.root root
      2 chartPermutation = true := by
  unfold qChartReindexCheck
  apply decide_eq_true_eq.mpr
  refine ⟨chartPermutation_bijective,?_,?_⟩
  all_goals decide +kernel

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    (∫ u in (0 : ℝ)..1, (directionalChord 2 Phase15301Original.field0 x y u)^2) ≤
      ((2163383505750100185/9223372036854775808:ℚ) : ℝ) := by
  exact qChartReindexCheck_integral_bound Phase15301Original.rectangles0 rectangles
    Phase15301Original.weights0 weights Phase15301Original.root root 2 chartPermutation
    original_chart_checked ((2163383505750100185/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

theorem erased_original_directional_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1)
    (vertical horizontal : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (directionalChord 2
      (eraseGrid vertical horizontal Phase15301Original.field0) x y u)^2) ≤
      ((2163383505750100185/9223372036854775808:ℚ) : ℝ) := by
  rw [directionalChord_eraseGrid_square_integral_eq]
  exact original_directional_integral_bound x y hx hy

end NoThreeLine.Phase15301Family02

#print axioms NoThreeLine.Phase15301Family02.original_chart_checked
#print axioms NoThreeLine.Phase15301Family02.original_directional_integral_bound
#print axioms NoThreeLine.Phase15301Family02.erased_original_directional_integral_bound
