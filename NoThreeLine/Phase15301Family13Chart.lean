import NoThreeLine.Phase15301Family13UnitCertificate
import NoThreeLine.Phase15301Original
import NoThreeLine.BenchmarkChartReindex

set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open scoped Interval

namespace NoThreeLine.Phase15301Family13

def permutationData : Array (Fin 262) := #[50,66,82,98,114,130,146,162,178,194,210,226,244,260,32,34,14,16,33,49,65,81,97,113,129,145,161,177,193,209,225,243,259,15,31,13,30,48,64,80,96,112,128,144,160,176,192,208,224,242,258,12,29,47,63,79,95,111,127,143,159,175,191,207,223,241,257,11,28,46,62,78,94,110,126,142,158,174,190,206,222,240,256,10,27,45,61,77,93,109,125,141,157,173,189,205,221,239,255,9,26,44,60,76,92,108,124,140,156,172,188,204,220,238,254,8,25,43,59,75,91,107,123,139,155,171,187,203,219,237,253,7,24,42,58,74,90,106,122,138,154,170,186,202,218,236,252,6,23,41,57,73,89,105,121,137,153,169,185,201,217,235,251,5,22,40,56,72,88,104,120,136,152,168,184,200,216,234,250,4,21,39,55,71,87,103,119,135,151,167,183,199,215,233,249,3,20,38,54,70,86,102,118,134,150,166,182,198,214,232,248,2,19,37,53,69,85,101,117,133,149,165,181,197,213,231,247,230,246,1,18,36,52,68,84,100,116,132,148,164,180,196,212,228,245,261,227,0,17,35,51,67,83,99,115,131,147,163,179,195,211,229]
def chartPermutation (i : Fin 262) : Fin 262 := permutationData.getD i.val 0
def inverseData : Array (Fin 262) := #[247,229,211,195,179,163,147,131,115,99,83,67,51,35,16,33,17,248,230,212,196,180,164,148,132,116,100,84,68,52,36,34,14,18,15,249,231,213,197,181,165,149,133,117,101,85,69,53,37,19,0,250,232,214,198,182,166,150,134,118,102,86,70,54,38,20,1,251,233,215,199,183,167,151,135,119,103,87,71,55,39,21,2,252,234,216,200,184,168,152,136,120,104,88,72,56,40,22,3,253,235,217,201,185,169,153,137,121,105,89,73,57,41,23,4,254,236,218,202,186,170,154,138,122,106,90,74,58,42,24,5,255,237,219,203,187,171,155,139,123,107,91,75,59,43,25,6,256,238,220,204,188,172,156,140,124,108,92,76,60,44,26,7,257,239,221,205,189,173,157,141,125,109,93,77,61,45,27,8,258,240,222,206,190,174,158,142,126,110,94,78,62,46,28,9,259,241,223,207,191,175,159,143,127,111,95,79,63,47,29,10,260,242,224,208,192,176,160,144,128,112,96,80,64,48,30,11,246,243,261,227,225,209,193,177,161,145,129,113,97,81,65,49,31,12,244,228,226,210,194,178,162,146,130,114,98,82,66,50,32,13,245]
def chartInverse (i : Fin 262) : Fin 262 := inverseData.getD i.val 0

theorem chartPermutation_bijective : Function.Bijective chartPermutation := by
  have h : Function.LeftInverse chartInverse chartPermutation ∧
      Function.RightInverse chartInverse chartPermutation := by decide +kernel
  exact ⟨h.1.injective,h.2.surjective⟩

theorem original_chart_checked :
    qChartReindexCheck Phase15301Original.rectangles1 rectangles
      Phase15301Original.weights1 weights Phase15301Original.root root
      3 chartPermutation = true := by
  unfold qChartReindexCheck
  apply decide_eq_true_eq.mpr
  refine ⟨chartPermutation_bijective,?_,?_⟩
  all_goals decide +kernel

theorem original_directional_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    (∫ u in (0 : ℝ)..1, (directionalChord 3 Phase15301Original.field1 x y u)^2) ≤
      ((109680517313018801141/18446744073709551616:ℚ) : ℝ) := by
  exact qChartReindexCheck_integral_bound Phase15301Original.rectangles1 rectangles
    Phase15301Original.weights1 weights Phase15301Original.root root 3 chartPermutation
    original_chart_checked ((109680517313018801141/18446744073709551616:ℚ) : ℝ) actual_integral_bound x y hx hy

theorem erased_original_directional_integral_bound (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1)
    (vertical horizontal : Finset ℝ) :
    (∫ u in (0 : ℝ)..1, (directionalChord 3
      (eraseGrid vertical horizontal Phase15301Original.field1) x y u)^2) ≤
      ((109680517313018801141/18446744073709551616:ℚ) : ℝ) := by
  rw [directionalChord_eraseGrid_square_integral_eq]
  exact original_directional_integral_bound x y hx hy

end NoThreeLine.Phase15301Family13

#print axioms NoThreeLine.Phase15301Family13.original_chart_checked
#print axioms NoThreeLine.Phase15301Family13.original_directional_integral_bound
#print axioms NoThreeLine.Phase15301Family13.erased_original_directional_integral_bound
