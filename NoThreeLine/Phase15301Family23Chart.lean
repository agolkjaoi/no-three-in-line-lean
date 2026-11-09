import NoThreeLine.Phase15301Family23UnitCertificate
import NoThreeLine.Phase15301Original
import NoThreeLine.BenchmarkChartReindex

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval

namespace NoThreeLine.Phase15301Family23

def permutationData : Array (Fin 268) := #[37,15,55,71,87,103,118,133,148,163,179,195,211,227,246,265,36,20,39,16,18,19,38,0,54,70,86,102,117,132,147,162,178,194,210,226,245,264,17,35,14,34,53,69,85,101,116,131,146,161,177,193,209,225,244,263,13,33,52,68,84,100,115,130,145,160,176,192,208,224,243,262,12,32,51,67,83,99,114,129,144,159,175,191,207,223,242,261,11,31,50,66,82,98,113,128,143,158,174,190,206,222,241,260,10,30,49,65,81,97,112,127,157,173,189,205,221,240,259,9,29,48,64,80,96,111,126,142,172,188,204,220,239,258,8,28,47,63,79,95,125,141,156,171,187,203,219,238,257,7,27,46,62,78,94,110,140,155,170,186,202,218,237,256,6,26,45,61,77,93,109,124,139,154,169,185,201,217,236,255,5,25,44,60,76,92,108,123,138,153,168,184,200,216,235,254,4,24,43,59,75,91,107,122,137,152,167,183,199,215,234,253,3,23,42,58,74,90,106,121,136,151,166,182,198,214,233,252,232,250,2,22,41,57,73,89,105,120,135,150,165,181,197,213,267,229,248,249,266,228,247,1,21,40,56,72,88,104,119,134,149,164,180,196,212,251,231,230]
def chartPermutation (i : Fin 268) : Fin 268 := permutationData.getD i.val 0
def inverseData : Array (Fin 268) := #[23,251,230,212,196,180,164,149,134,119,104,88,72,56,40,1,19,38,20,21,17,252,231,213,197,181,165,150,135,120,105,89,73,57,41,39,16,0,22,18,253,232,214,198,182,166,151,136,121,106,90,74,58,42,24,2,254,233,215,199,183,167,152,137,122,107,91,75,59,43,25,3,255,234,216,200,184,168,153,138,123,108,92,76,60,44,26,4,256,235,217,201,185,169,154,139,124,109,93,77,61,45,27,5,257,236,218,202,186,170,155,125,110,94,78,62,46,28,6,258,237,219,203,187,171,140,126,111,95,79,63,47,29,7,259,238,220,204,188,172,156,141,127,96,80,64,48,30,8,260,239,221,205,189,173,157,142,112,97,81,65,49,31,9,261,240,222,206,190,174,158,143,128,113,98,82,66,50,32,10,262,241,223,207,191,175,159,144,129,114,99,83,67,51,33,11,263,242,224,208,192,176,160,145,130,115,100,84,68,52,34,12,264,243,225,209,193,177,161,146,131,116,101,85,69,53,35,13,249,245,267,266,228,226,210,194,178,162,147,132,117,102,86,70,54,36,14,250,246,247,229,265,227,211,195,179,163,148,133,118,103,87,71,55,37,15,248,244]
def chartInverse (i : Fin 268) : Fin 268 := inverseData.getD i.val 0

theorem chartPermutation_bijective : Function.Bijective chartPermutation := by
  have h : Function.LeftInverse chartInverse chartPermutation ∧
      Function.RightInverse chartInverse chartPermutation := by decide +kernel
  exact ⟨h.1.injective,h.2.surjective⟩

theorem original_chart_checked :
    qChartReindexCheck Phase15301Original.rectangles2 rectangles
      Phase15301Original.weights2 weights Phase15301Original.root root
      3 chartPermutation = true := by
  unfold qChartReindexCheck
  apply decide_eq_true_eq.mpr
  refine ⟨chartPermutation_bijective,?_,?_⟩
  all_goals decide +kernel

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    (∫ u in (0 : ℝ)..1, (directionalChord 3 Phase15301Original.field2 x y u)^2) ≤
      ((100655355706702664995/18446744073709551616:ℚ) : ℝ) := by
  exact qChartReindexCheck_integral_bound Phase15301Original.rectangles2 rectangles
    Phase15301Original.weights2 weights Phase15301Original.root root 3 chartPermutation
    original_chart_checked ((100655355706702664995/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

theorem erased_original_directional_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1)
    (vertical horizontal : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (directionalChord 3
      (eraseGrid vertical horizontal Phase15301Original.field2) x y u)^2) ≤
      ((100655355706702664995/18446744073709551616:ℚ) : ℝ) := by
  rw [directionalChord_eraseGrid_square_integral_eq]
  exact original_directional_integral_bound x y hx hy

end NoThreeLine.Phase15301Family23

#print axioms NoThreeLine.Phase15301Family23.original_chart_checked
#print axioms NoThreeLine.Phase15301Family23.original_directional_integral_bound
#print axioms NoThreeLine.Phase15301Family23.erased_original_directional_integral_bound
