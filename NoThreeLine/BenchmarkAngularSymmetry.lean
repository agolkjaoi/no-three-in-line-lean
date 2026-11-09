import NoThreeLine.Charts

/-! The four angular square integrals respect coordinate swap and central
reflection. Reflection uses an actual Lebesgue change of variables and does
not insert a Jacobian or an extra multiplicity. No field symmetry is assumed
until the explicit invariant corollaries. -/
set_option autoImplicit false
open MeasureTheory
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.BenchmarkSymmetry

local instance : Measure.IsNegInvariant (volume : Measure ℝ) := by
  constructor
  change Measure.map (fun x : ℝ => -x) volume=volume
  simpa using Real.map_volume_mul_left (a:=(-1:ℝ)) (by norm_num)

def swapField (F : ℝ → ℝ → ℝ) (x y : ℝ) : ℝ := F y x
def centralField (F : ℝ → ℝ → ℝ) (x y : ℝ) : ℝ := F (1-x) (1-y)

def angularSquareSum (F : ℝ → ℝ → ℝ) (x y : ℝ) : ℝ :=
  ∑ f : Fin 4, ∫ u in (0 : ℝ)..1, (directionalChord f F x y u)^2

theorem angularSquareSum_swap (F : ℝ → ℝ → ℝ) (x y : ℝ) :
    angularSquareSum (swapField F) x y=angularSquareSum F y x := by
  simp [angularSquareSum,Fin.sum_univ_succ,directionalChord,swapField]
  ring

theorem directionalChord_central (f : Fin 4) (F : ℝ → ℝ → ℝ) (x y u : ℝ) :
    directionalChord f (centralField F) (1-x) (1-y) u=directionalChord f F x y u := by
  fin_cases f
  · change (∫t : ℝ,F (1-t) (1-((1-y)+u*(t-(1-x)))))=
      ∫t : ℝ,F t (y+u*(t-x))
    calc
      _ = ∫t : ℝ,(fun z=>F z (y+u*(z-x))) (1-t) := by
        congr 1
        funext t
        congr 1
        ring
      _ = _ := integral_sub_left_eq_self (fun z : ℝ=>F z (y+u*(z-x))) volume (1:ℝ)
  · change (∫t : ℝ,F (1-t) (1-((1-y)-u*(t-(1-x)))))=
      ∫t : ℝ,F t (y-u*(t-x))
    calc
      _ = ∫t : ℝ,(fun z=>F z (y-u*(z-x))) (1-t) := by
        congr 1
        funext t
        congr 1
        ring
      _ = _ := integral_sub_left_eq_self (fun z : ℝ=>F z (y-u*(z-x))) volume (1:ℝ)
  · change (∫t : ℝ,F (1-((1-x)+u*(t-(1-y)))) (1-t))=
      ∫t : ℝ,F (x+u*(t-y)) t
    calc
      _ = ∫t : ℝ,(fun z=>F (x+u*(z-y)) z) (1-t) := by
        congr 1
        funext t
        congr 1
        ring
      _ = _ := integral_sub_left_eq_self (fun z : ℝ=>F (x+u*(z-y)) z) volume (1:ℝ)
  · change (∫t : ℝ,F (1-((1-x)-u*(t-(1-y)))) (1-t))=
      ∫t : ℝ,F (x-u*(t-y)) t
    calc
      _ = ∫t : ℝ,(fun z=>F (x-u*(z-y)) z) (1-t) := by
        congr 1
        funext t
        congr 1
        ring
      _ = _ := integral_sub_left_eq_self (fun z : ℝ=>F (x-u*(z-y)) z) volume (1:ℝ)

theorem angularSquareSum_central (F : ℝ → ℝ → ℝ) (x y : ℝ) :
    angularSquareSum (centralField F) (1-x) (1-y)=angularSquareSum F x y := by
  simp only [angularSquareSum,directionalChord_central]

theorem angularSquareSum_swap_invariant (F : ℝ → ℝ → ℝ)
    (hs : ∀x y,F y x=F x y) (x y : ℝ) :
    angularSquareSum F y x=angularSquareSum F x y := by
  have he : swapField F=F := funext (fun x=>funext (hs x))
  exact (angularSquareSum_swap F x y).symm.trans (congrArg (fun G=>angularSquareSum G x y) he)

theorem angularSquareSum_central_invariant (F : ℝ → ℝ → ℝ)
    (hc : ∀x y,F (1-x) (1-y)=F x y) (x y : ℝ) :
    angularSquareSum F (1-x) (1-y)=angularSquareSum F x y := by
  have he : centralField F=F := funext (fun x=>funext (hc x))
  simpa only [he] using angularSquareSum_central F x y

def rootX (f : Fin 4) (x y : ℝ) : ℝ := ![x,y,1-x,1-y] f
def rootY (f : Fin 4) (x y : ℝ) : ℝ := ![y,x,1-y,1-x] f

theorem angularSquareSum_symmetry (F : ℝ → ℝ → ℝ)
    (hs : ∀x y,F y x=F x y) (hc : ∀x y,F (1-x) (1-y)=F x y)
    (f : Fin 4) (x y : ℝ) :
    angularSquareSum F (rootX f x y) (rootY f x y)=angularSquareSum F x y := by
  fin_cases f
  · rfl
  · exact angularSquareSum_swap_invariant F hs x y
  · exact angularSquareSum_central_invariant F hc x y
  · exact (angularSquareSum_central_invariant F hc y x).trans
      (angularSquareSum_swap_invariant F hs x y)

end NoThreeLine.BenchmarkSymmetry

#print axioms NoThreeLine.BenchmarkSymmetry.angularSquareSum_symmetry
