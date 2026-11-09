import NoThreeLine.Phase15301Family22RefinedUnitCertificate
import NoThreeLine.Phase15301Original
import NoThreeLine.BenchmarkChartReindex

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval

namespace NoThreeLine.Phase15301Family22.Refined

def permutationData : Array (Fin 268) := #[230,1,21,40,56,72,88,104,119,134,149,164,180,196,212,251,231,228,247,229,248,249,266,2,22,41,57,73,89,105,120,135,150,165,181,197,213,267,232,250,3,23,42,58,74,90,106,121,136,151,166,182,198,214,233,252,4,24,43,59,75,91,107,122,137,152,167,183,199,215,234,253,5,25,44,60,76,92,108,123,138,153,168,184,200,216,235,254,6,26,45,61,77,93,109,124,139,154,169,185,201,217,236,255,7,27,46,62,78,94,110,140,155,170,186,202,218,237,256,8,28,47,63,79,95,125,141,156,171,187,203,219,238,257,9,29,48,64,80,96,111,126,142,172,188,204,220,239,258,10,30,49,65,81,97,112,127,157,173,189,205,221,240,259,11,31,50,66,82,98,113,128,143,158,174,190,206,222,241,260,12,32,51,67,83,99,114,129,144,159,175,191,207,223,242,261,13,33,52,68,84,100,115,130,145,160,176,192,208,224,243,262,14,34,53,69,85,101,116,131,146,161,177,193,209,225,244,263,17,35,0,54,70,86,102,117,132,147,162,178,194,210,226,245,264,16,18,19,38,20,39,15,55,71,87,103,118,133,148,163,179,195,211,227,246,265,36,37]
def chartPermutation (i : Fin 268) : Fin 268 := permutationData.getD i.val 0
def inverseData : Array (Fin 268) := #[230,1,23,40,56,72,88,104,119,134,149,164,180,196,212,251,245,228,246,247,249,2,24,41,57,73,89,105,120,135,150,165,181,197,213,229,266,267,248,250,3,25,42,58,74,90,106,121,136,151,166,182,198,214,231,252,4,26,43,59,75,91,107,122,137,152,167,183,199,215,232,253,5,27,44,60,76,92,108,123,138,153,168,184,200,216,233,254,6,28,45,61,77,93,109,124,139,154,169,185,201,217,234,255,7,29,46,62,78,94,110,140,155,170,186,202,218,235,256,8,30,47,63,79,95,125,141,156,171,187,203,219,236,257,9,31,48,64,80,96,111,126,142,172,188,204,220,237,258,10,32,49,65,81,97,112,127,157,173,189,205,221,238,259,11,33,50,66,82,98,113,128,143,158,174,190,206,222,239,260,12,34,51,67,83,99,114,129,144,159,175,191,207,223,240,261,13,35,52,68,84,100,115,130,145,160,176,192,208,224,241,262,14,36,53,69,85,101,116,131,146,161,177,193,209,225,242,263,17,19,0,16,38,54,70,86,102,117,132,147,162,178,194,210,226,243,264,18,20,21,39,15,55,71,87,103,118,133,148,163,179,195,211,227,244,265,22,37]
def chartInverse (i : Fin 268) : Fin 268 := inverseData.getD i.val 0

theorem chartPermutation_bijective : Function.Bijective chartPermutation := by
  have h : Function.LeftInverse chartInverse chartPermutation ∧
      Function.RightInverse chartInverse chartPermutation := by decide +kernel
  exact ⟨h.1.injective,h.2.surjective⟩

theorem original_chart_checked :
    qChartReindexCheck Phase15301Original.rectangles2 rectangles
      Phase15301Original.weights2 weights Phase15301Original.root root
      2 chartPermutation = true := by
  unfold qChartReindexCheck
  apply decide_eq_true_eq.mpr
  refine ⟨chartPermutation_bijective,?_,?_⟩
  all_goals decide +kernel

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    (∫ u in (0 : ℝ)..1, (directionalChord 2 Phase15301Original.field2 x y u)^2) ≤
      ((5471978581042426631/9223372036854775808:ℚ) : ℝ) := by
  exact qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Original.root root 2 chartPermutation
    original_chart_checked ((5471978581042426631/9223372036854775808:ℚ) : ℝ) actual_integral_bound x y hx hy

theorem erased_original_directional_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1)
    (vertical horizontal : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (directionalChord 2
      (eraseGrid vertical horizontal Phase15301Original.field2) x y u)^2) ≤
      ((5471978581042426631/9223372036854775808:ℚ) : ℝ) := by
  rw [directionalChord_eraseGrid_square_integral_eq]
  exact original_directional_integral_bound x y hx hy

end NoThreeLine.Phase15301Family22.Refined

#print axioms NoThreeLine.Phase15301Family22.Refined.original_chart_checked
#print axioms NoThreeLine.Phase15301Family22.Refined.original_directional_integral_bound
#print axioms NoThreeLine.Phase15301Family22.Refined.erased_original_directional_integral_bound
