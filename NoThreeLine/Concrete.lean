import NoThreeLine.RectangleExpr
import NoThreeLine.Partition
import NoThreeLine.RootCertificate
import NoThreeLine.Charts

set_option autoImplicit false
open MeasureTheory Set
open scoped Interval

namespace NoThreeLine
namespace PhaseZero

/-
Frozen reference phase 0: order[0]=4159, type 0, orbit {(63,64),(64,63)}
on grid 128; all other type fields are zero. These are unscaled weights.
See ACTUAL_RECTANGLE_FIXTURE.json for the source bytes and SHA256.
The JSON extraction is outside the kernel; all statements below concern
the explicit rational data printed here.
-/
def cells : Fin 2 → QRect :=
  ![⟨63/128,64/128,64/128,65/128⟩,
    ⟨64/128,65/128,63/128,64/128⟩]
def weight (_ : Fin 2) : ℚ := 319013231/100000000
def root : QRect := ⟨63/128,64/128,64/128,65/128⟩

def flipX (R : QRect) : QRect := ⟨1-R.x1,1-R.x0,R.y0,R.y1⟩
def swapXY (R : QRect) : QRect := ⟨R.y0,R.y1,R.x0,R.x1⟩
def chart (f : Fin 4) (R : QRect) : QRect :=
  ![R,flipX R,swapXY R,flipX (swapXY R)] f
def expr (f : Fin 4) : Expr :=
  fieldExpr (fun i => chart f (cells i)) weight (chart f root)

def precision : ℕ := 1000000
def bounds : Fin 4 → ℚ := ![622/1000000,2485/1000000,622/1000000,2485/1000000]

/-- Complete one-piece partitions certify all four charts from the actual cells. -/
theorem checks (f : Fin 4) :
    checkUnitIntegral (expr f) precision [1] = some (bounds f) := by
  fin_cases f <;>
    norm_num [checkUnitIntegral, checkPartition, expr, fieldExpr, Expr.sum,
      List.ofFn_succ, cells, weight, root, chart, flipX, swapXY,
      QRect.envelopeExpr, Expr.check, Coeff.leOn, Coeff.add, Coeff.scale,
      BranchValid, branchBound, roundUp, precision, bounds]

theorem envelope_integrals (f : Fin 4) :
    IntervalIntegrable (fun u : ℝ => ((expr f).eval u)^2) volume 0 1 ∧
    (∫ u in (0 : ℝ)..1, ((expr f).eval u)^2) ≤ (bounds f : ℝ) :=
  checkUnitIntegral_sound (expr f) precision [1] (bounds f) (checks f)

/-- D*=76/125 and time scaling 249/250 are applied once in this coefficient. -/
def riskWeight : ℚ := 392673/15625000
def delta : ℚ := 993/1000
def margin : ℚ := 3137001/6250000000

theorem coefficient_identity :
    riskWeight = (76/125 : ℚ) * (249/250)^2 / 24 := by norm_num [riskWeight]

/-- Three identical pair fields times four direction charts, with no extra average. -/
theorem budget_checked :
    riskWeight * (3 * ∑ f, bounds f) ≤ delta - margin ∧ 0 < margin := by
  norm_num [riskWeight, bounds, delta, margin, Fin.sum_univ_succ]

noncomputable def rootX (f : Fin 4) (x y : ℝ) : ℝ := ![x,1-x,y,1-y] f
noncomputable def rootY (f : Fin 4) (x y : ℝ) : ℝ := ![y,y,x,x] f

theorem chart_root_mem (f : Fin 4) (x y : ℝ)
    (hx : x ∈ Icc (root.x0 : ℝ) root.x1)
    (hy : y ∈ Icc (root.y0 : ℝ) root.y1) :
    rootX f x y ∈ Icc ((chart f root).x0 : ℝ) (chart f root).x1 ∧
    rootY f x y ∈ Icc ((chart f root).y0 : ℝ) (chart f root).y1 := by
  fin_cases f <;>
    norm_num [rootX, rootY, chart, flipX, swapXY, root, mem_Icc] at * <;>
    constructor <;> constructor <;> linarith

theorem actual_integral_bound (f : Fin 4) (x y : ℝ)
    (hx : x ∈ Icc (root.x0 : ℝ) root.x1)
    (hy : y ∈ Icc (root.y0 : ℝ) root.y1) :
    (∫ u in (0 : ℝ)..1,
      (actualChord (fun i => chart f (cells i)) weight (rootX f x y) (rootY f x y) u)^2)
      ≤ (bounds f : ℝ) := by
  have hr := chart_root_mem f x y hx hy
  exact rectangle_certificate_sound (fun i => chart f (cells i)) weight
    (chart f root) precision [1] (bounds f) (by intro i; norm_num [weight])
    (checks f) _ _ hr.1 hr.2

/-- Three other types have zero field at this phase, so their pair fields
all equal the explicit two-cell field. This expression counts all 12 terms. -/
noncomputable def chartRisk (x y : ℝ) : ℝ :=
  (riskWeight : ℝ) * (3 * ∑ f : Fin 4, ∫ u in (0 : ℝ)..1,
    (actualChord (fun i => chart f (cells i)) weight (rootX f x y) (rootY f x y) u)^2)

theorem uniform_margin (x y : ℝ)
    (hx : x ∈ Icc (root.x0 : ℝ) root.x1)
    (hy : y ∈ Icc (root.y0 : ℝ) root.y1) :
    0 < (margin : ℝ) ∧ chartRisk x y ≤ (delta : ℝ) - (margin : ℝ) := by
  refine ⟨by exact_mod_cast budget_checked.2, ?_⟩
  have hs := Finset.sum_le_sum (s := Finset.univ) (fun f _ =>
    actual_integral_bound f x y hx hy)
  have hw : (0 : ℝ) ≤ riskWeight := by norm_num [riskWeight]
  calc
    chartRisk x y ≤ (riskWeight : ℝ) * (3 * ∑ f, (bounds f : ℝ)) :=
      mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_left hs (by norm_num)) hw
    _ ≤ (delta : ℝ) - (margin : ℝ) := by exact_mod_cast budget_checked.1

/-- A point inside the same real input cell supplies a nonconstant branch
after reflection. Its geometric breakpoint is 1/3. -/
def pointRoot : QRect := ⟨127/256,127/256,129/256,129/256⟩
def pointExpr : Expr :=
  fieldExpr (fun i => chart 1 (cells i)) weight (chart 1 pointRoot)

theorem point_first_branch :
    pointExpr.check 0 (1/3) = some ⟨319013231/12800000000,0⟩ := by
  norm_num [pointExpr, fieldExpr, Expr.sum, List.ofFn_succ, cells, weight, pointRoot,
    chart, flipX, swapXY, QRect.envelopeExpr, Expr.check, Coeff.leOn, Coeff.add, Coeff.scale]

theorem point_second_branch :
    pointExpr.check (1/3) 1 =
      some ⟨1595066155/25600000000,-319013231/25600000000⟩ := by
  norm_num [pointExpr, fieldExpr, Expr.sum, List.ofFn_succ, cells, weight, pointRoot,
    chart, flipX, swapXY, QRect.envelopeExpr, Expr.check, Coeff.leOn, Coeff.add, Coeff.scale]

theorem point_partition_checked :
    checkUnitIntegral pointExpr precision [1/3,1] = some (1496/1000000) := by
  norm_num [checkUnitIntegral, checkPartition, point_first_branch, point_second_branch,
    BranchValid, branchBound, roundUp, qAlpha, qBeta, precision]

theorem point_crossing_rejected :
    checkUnitIntegral pointExpr precision [1] = none := by
  norm_num [checkUnitIntegral, checkPartition, pointExpr, fieldExpr, Expr.sum,
    List.ofFn_succ, cells, weight, pointRoot, chart, flipX, swapXY,
    QRect.envelopeExpr, Expr.check, Coeff.leOn, Coeff.add, Coeff.scale, precision]

theorem point_actual_integral :
    (∫ u in (0 : ℝ)..1,
      (actualChord (fun i => chart 1 (cells i)) weight (129/256) (129/256) u)^2)
      ≤ (1496/1000000 : ℝ) := by
  have hi := rectangle_certificate_sound (fun i => chart 1 (cells i)) weight
    (chart 1 pointRoot) precision [1/3,1] (1496/1000000)
    (by intro i; norm_num [weight]) point_partition_checked
    (129/256) (129/256)
    (by norm_num [chart, pointRoot, flipX, swapXY, mem_Icc])
    (by norm_num [chart, pointRoot, flipX, swapXY, mem_Icc])
  norm_num at hi ⊢
  exact hi

theorem chart_real (f : Fin 4) (R : QRect) :
    (chart f R).real = R.real.chart f := by
  fin_cases f <;>
    simp [chart, flipX, swapXY, QRect.real, Rect.chart, Rect.flipX, Rect.swapXY]

noncomputable def field : ℝ → ℝ → ℝ :=
  rectangleField Finset.univ (fun i => (cells i).real) (fun i => (weight i : ℝ))

theorem actual_chart_eq_direction (f : Fin 4) (x y u : ℝ) :
    actualChord (fun i => chart f (cells i)) weight (rootX f x y) (rootY f x y) u =
      directionalChord f field x y u := by
  unfold actualChord
  simp_rw [chart_real]
  exact rectangleField_chartChord_eq Finset.univ (fun i => (cells i).real)
    (fun i => (weight i : ℝ)) f x y u

/-- Risk expressed in the original field coordinates, for directions
(1,u), (1,-u), (u,1), (-u,1). -/
noncomputable def directionalRisk (x y : ℝ) : ℝ :=
  (riskWeight : ℝ) * (3 * ∑ f : Fin 4, ∫ u in (0 : ℝ)..1,
    (directionalChord f field x y u)^2)

theorem chartRisk_eq_directionalRisk (x y : ℝ) :
    chartRisk x y = directionalRisk x y := by
  unfold chartRisk directionalRisk
  simp_rw [actual_chart_eq_direction]

theorem direct_uniform_margin (x y : ℝ)
    (hx : x ∈ Icc (root.x0 : ℝ) root.x1)
    (hy : y ∈ Icc (root.y0 : ℝ) root.y1) :
    0 < (margin : ℝ) ∧ directionalRisk x y ≤ (delta : ℝ) - (margin : ℝ) := by
  rw [← chartRisk_eq_directionalRisk]
  exact uniform_margin x y hx hy

noncomputable def erasedRisk (vertical horizontal : Finset ℝ) (x y : ℝ) : ℝ :=
  (riskWeight : ℝ) * (3 * ∑ f : Fin 4, ∫ u in (0 : ℝ)..1,
    (directionalChord f (eraseGrid vertical horizontal field) x y u)^2)

/-- The final local certificate allows any finite common grid boundary.
This concerns the angular integral; it does not assert equality on axis chords. -/
theorem erased_direct_uniform_margin (vertical horizontal : Finset ℝ) (x y : ℝ)
    (hx : x ∈ Icc (root.x0 : ℝ) root.x1)
    (hy : y ∈ Icc (root.y0 : ℝ) root.y1) :
    0 < (margin : ℝ) ∧
      erasedRisk vertical horizontal x y ≤ (delta : ℝ) - (margin : ℝ) := by
  have he : erasedRisk vertical horizontal x y = directionalRisk x y := by
    unfold erasedRisk directionalRisk
    simp_rw [directionalChord_eraseGrid_square_integral_eq]
  rw [he]
  exact direct_uniform_margin x y hx hy

end PhaseZero
end NoThreeLine

#print axioms NoThreeLine.PhaseZero.checks
#print axioms NoThreeLine.PhaseZero.envelope_integrals
#print axioms NoThreeLine.PhaseZero.budget_checked
#print axioms NoThreeLine.PhaseZero.uniform_margin
#print axioms NoThreeLine.PhaseZero.point_partition_checked
#print axioms NoThreeLine.PhaseZero.point_actual_integral
#print axioms NoThreeLine.PhaseZero.direct_uniform_margin
#print axioms NoThreeLine.PhaseZero.erased_direct_uniform_margin
