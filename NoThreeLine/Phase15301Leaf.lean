import NoThreeLine.BenchmarkRiskMonotone
import NoThreeLine.Phase15301Family00Chart
import NoThreeLine.Phase15301Family01Chart
import NoThreeLine.Phase15301Family02RefinedChart
import NoThreeLine.Phase15301Family03Chart
import NoThreeLine.Phase15301Family10Chart
import NoThreeLine.Phase15301Family11Chart
import NoThreeLine.Phase15301Family12Chart
import NoThreeLine.Phase15301Family13Chart
import NoThreeLine.Phase15301Family20Chart
import NoThreeLine.Phase15301Family21Chart
import NoThreeLine.Phase15301Family22RefinedChart
import NoThreeLine.Phase15301Family23Chart

/-! Reference-prefix risk on one accepted leaf at phase 15301. The original
fields are unscaled end-of-phase reference fields, not accumulated accepted
masks. They are explicit rectangle arrays; the equality to a separately
formalized frozen schedule reconstruction still needs its input bridge.
Transferring this certificate to the schedule requires the separately
proved nonnegative pointwise domination bridge. This is not an all-phase
certificate and not the asymptotic or all-n NoThree cardinality theorem. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
open MeasureTheory
open scoped BigOperators Interval

namespace NoThreeLine.Phase15301Leaf

def densityScale : ℚ := 249/250
def sieveDensityBound : ℚ := 76/125
def delta : ℚ := 993/1000
def kappa : ℚ := delta-densityScale^2*(49999/50000)
def riskWeight : ℚ := sieveDensityBound*densityScale^2/24
def threshold : ℚ := delta-kappa/2
def familyBound : Fin 3 → Fin 4 → ℚ := ![![(17960122961921093307/9223372036854775808:ℚ),(12128154728829487383/2305843009213693952:ℚ),(538276081476110743/2305843009213693952:ℚ),(55627108484569987847/9223372036854775808:ℚ)],![(19618085940144345603/9223372036854775808:ℚ),(23568696994658742255/4611686018427387904:ℚ),(4961301394572061541/18446744073709551616:ℚ),(109680517313018801141/18446744073709551616:ℚ)],![(46181532807409780191/18446744073709551616:ℚ),(4628525469186170639/1152921504606846976:ℚ),(5471978581042426631/9223372036854775808:ℚ),(100655355706702664995/18446744073709551616:ℚ)] ]

theorem parameter_identities :
    riskWeight = 392673/15625000 ∧ threshold = 6203112999/6250000000 ∧ 0 < kappa := by
  norm_num [riskWeight,threshold,kappa,delta,densityScale,sieveDensityBound]

theorem rational_risk_accepted :
    riskWeight*(∑ j : Fin 3, ∑ f : Fin 4, familyBound j f) < threshold := by
  decide +kernel

noncomputable section

def fields : Fin 3 → ℝ → ℝ → ℝ :=
  ![Phase15301Original.field0,Phase15301Original.field1,Phase15301Original.field2]

def directRisk (x y : ℝ) : ℝ :=
  (riskWeight : ℝ)*(∑ j : Fin 3, ∑ f : Fin 4,
    ∫ u in (0 : ℝ)..1, (directionalChord f (fields j) x y u)^2)

theorem family_integral_le (j : Fin 3) (f : Fin 4) (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    (∫ u in (0 : ℝ)..1, (directionalChord f (fields j) x y u)^2) ≤ (familyBound j f : ℝ) := by
  fin_cases j <;> fin_cases f
  · exact NoThreeLine.Phase15301Family00.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family01.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family02.Refined.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family03.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family10.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family11.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family12.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family13.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family20.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family21.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family22.Refined.original_directional_integral_bound x y hx hy
  · exact NoThreeLine.Phase15301Family23.original_directional_integral_bound x y hx hy

theorem uniform_direct_risk (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    directRisk x y < (threshold : ℝ) := by
  have hs : (∑ j : Fin 3, ∑ f : Fin 4,
      ∫ u in (0 : ℝ)..1, (directionalChord f (fields j) x y u)^2) ≤
      ∑ j : Fin 3, ∑ f : Fin 4, (familyBound j f : ℝ) := by
    apply Finset.sum_le_sum
    intro j _
    apply Finset.sum_le_sum
    intro f _
    exact family_integral_le j f x y hx hy
  have hw : (0 : ℝ) ≤ (riskWeight : ℝ) := by
    norm_num [riskWeight,sieveDensityBound,densityScale]
  unfold directRisk
  apply lt_of_le_of_lt (mul_le_mul_of_nonneg_left hs hw)
  exact_mod_cast rational_risk_accepted

theorem directionalChord_mul (f : Fin 4) (F : ℝ → ℝ → ℝ) (s x y u : ℝ) :
    directionalChord f (fun a b => s*F a b) x y u = s*directionalChord f F x y u := by
  fin_cases f <;> simp [directionalChord,MeasureTheory.integral_const_mul]

def scaledDirectRisk (x y : ℝ) : ℝ :=
  (sieveDensityBound : ℝ)/24*(∑ j : Fin 3, ∑ f : Fin 4,
    ∫ u in (0 : ℝ)..1,
      (directionalChord f (fun a b => (densityScale : ℝ)*fields j a b) x y u)^2)

theorem scaledDirectRisk_eq (x y : ℝ) : scaledDirectRisk x y = directRisk x y := by
  unfold scaledDirectRisk directRisk
  simp_rw [directionalChord_mul,mul_pow,intervalIntegral.integral_const_mul]
  simp only [← Finset.mul_sum]
  dsimp only [riskWeight]
  push_cast
  ring

def scaledErasedRisk (vertical horizontal : Finset ℝ) (x y : ℝ) : ℝ :=
  (sieveDensityBound : ℝ)/24*(∑ j : Fin 3, ∑ f : Fin 4,
    ∫ u in (0 : ℝ)..1, (directionalChord f
      (eraseGrid vertical horizontal (fun a b => (densityScale : ℝ)*fields j a b)) x y u)^2)

theorem scaledErasedRisk_eq (vertical horizontal : Finset ℝ) (x y : ℝ) :
    scaledErasedRisk vertical horizontal x y = directRisk x y := by
  calc
    _ = scaledDirectRisk x y := by
      simp only [scaledErasedRisk,scaledDirectRisk,directionalChord_eraseGrid_square_integral_eq]
    _ = _ := scaledDirectRisk_eq x y

theorem uniform_scaled_erased_risk (vertical horizontal : Finset ℝ) (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    scaledErasedRisk vertical horizontal x y < (threshold : ℝ) := by
  rw [scaledErasedRisk_eq]
  exact uniform_direct_risk x y hx hy

theorem uniform_scaled_dominated_risk {ι : Type*} (S : Finset ι)
    (R : Fin 3 → ι → Rect) (w : Fin 3 → ι → ℝ) (V H : Finset ℝ)
    (hw : ∀ j i, i ∈ S → 0 ≤ w j i)
    (hdom : ∀ j a b, eraseGrid V H (rectangleField S (R j) (w j)) a b ≤
      eraseGrid V H (fields j) a b)
    (x y : ℝ)
    (hx : x ∈ Set.Icc (Phase15301Original.root.x0 : ℝ) Phase15301Original.root.x1)
    (hy : y ∈ Set.Icc (Phase15301Original.root.y0 : ℝ) Phase15301Original.root.y1) :
    (sieveDensityBound : ℝ)/24*(∑ j : Fin 3, ∑ f : Fin 4,
      ∫ u in (0 : ℝ)..1, (directionalChord f (eraseGrid V H
        (fun a b => (densityScale : ℝ)*rectangleField S (R j) (w j) a b)) x y u)^2) <
      (threshold : ℝ) := by
  have hb (j : Fin 3) (f : Fin 4) :
      (∫ u in (0 : ℝ)..1, (directionalChord f (rectangleField S (R j) (w j)) x y u)^2) ≤
      ∫ u in (0 : ℝ)..1, (directionalChord f (fields j) x y u)^2 := by
    fin_cases j
    · exact directional_square_integral_le_of_erased_domination S Finset.univ (R 0)
        (fun i => (Phase15301Original.rectangles0 i).real) (w 0)
        (fun i => (Phase15301Original.weights0 i : ℝ)) V H (hw 0) (hdom 0) f x y
    · exact directional_square_integral_le_of_erased_domination S Finset.univ (R 1)
        (fun i => (Phase15301Original.rectangles1 i).real) (w 1)
        (fun i => (Phase15301Original.weights1 i : ℝ)) V H (hw 1) (hdom 1) f x y
    · exact directional_square_integral_le_of_erased_domination S Finset.univ (R 2)
        (fun i => (Phase15301Original.rectangles2 i).real) (w 2)
        (fun i => (Phase15301Original.weights2 i : ℝ)) V H (hw 2) (hdom 2) f x y
  simp_rw [directionalChord_eraseGrid_square_integral_eq,directionalChord_mul,
    mul_pow,intervalIntegral.integral_const_mul]
  simp only [← Finset.mul_sum]
  have hc : (sieveDensityBound : ℝ)/24*(densityScale : ℝ)^2 = (riskWeight : ℝ) := by
    norm_num [sieveDensityBound,densityScale,riskWeight]
  rw [← mul_assoc,hc]
  apply lt_of_le_of_lt _ (uniform_direct_risk x y hx hy)
  apply mul_le_mul_of_nonneg_left
  · apply Finset.sum_le_sum
    intro j _
    apply Finset.sum_le_sum
    intro f _
    exact hb j f
  · norm_num [riskWeight,sieveDensityBound,densityScale]

end
end NoThreeLine.Phase15301Leaf

#print axioms NoThreeLine.Phase15301Leaf.rational_risk_accepted
#print axioms NoThreeLine.Phase15301Leaf.uniform_direct_risk
#print axioms NoThreeLine.Phase15301Leaf.uniform_scaled_erased_risk
#print axioms NoThreeLine.Phase15301Leaf.uniform_scaled_dominated_risk
