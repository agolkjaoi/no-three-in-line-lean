import NoThreeLine.ProtectedWholeGenerator
import Mathlib.Analysis.Calculus.Deriv.MeanValue

/-! One-sided exponential Taylor control for real nonpositive jumps.
This is a scalar and finite-generator estimate, not yet a stochastic
exponential supermartingale or a continuous-time maximal theorem. -/
set_option autoImplicit false
noncomputable section
open Set
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem exp_neg_quadratic (x : ℝ) (hx : 0≤x) :
    Real.exp (-x)-1+x≤x^2/2 := by
  have hd (t : ℝ) : HasDerivAt (fun u : ℝ=>1-u+u^2/2-Real.exp (-u))
      (t-1+Real.exp (-t)) t := by
    convert! (((hasDerivAt_const t (1:ℝ)).sub (hasDerivAt_id t)).add
      (((hasDerivAt_id t).pow 2).div_const 2)).sub
      ((Real.hasDerivAt_exp (-t)).comp t (hasDerivAt_id t).neg) using 1 <;> simp only [id_eq] <;> ring
  have hmono := monotone_of_hasDerivAt_nonneg hd (fun t=>by
    have he := Real.add_one_le_exp (-t)
    change 0≤t-1+Real.exp (-t)
    linarith)
  have hh : (0:ℝ)≤1-x+x^2/2-Real.exp (-x) := by simpa using hmono hx
  linarith only [hh]

theorem exp_nonpos_quadratic (x : ℝ) (hx : x≤0) :
    Real.exp x-1-x≤x^2/2 := by
  have hh := exp_neg_quadratic (-x) (neg_nonneg.mpr hx)
  simpa only [neg_neg,neg_sq,sub_eq_add_neg] using hh

theorem exp_increment_quadratic (θ a b : ℝ) (hθ : 0≤θ) (hba : b≤a) :
    Real.exp (θ*b)-Real.exp (θ*a)-θ*Real.exp (θ*a)*(b-a)≤
      (θ^2/2)*Real.exp (θ*a)*(b-a)^2 := by
  have hh := mul_le_mul_of_nonneg_left
    (exp_nonpos_quadratic (θ*(b-a)) (mul_nonpos_of_nonneg_of_nonpos hθ (sub_nonpos.mpr hba)))
    (Real.exp_pos (θ*a)).le
  have he : Real.exp (θ*a)*Real.exp (θ*(b-a))=Real.exp (θ*b) := by
    rw [←Real.exp_add]
    congr 1
    ring
  nlinarith only [hh,he]

theorem protectedObservableExternalRate_exp_bound {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ)
    (positive : Grid n→Grid n→Bool) (L : LineIndex n)
    (F : ExtendedState n→(Grid n→ℝ)→ℝ) (θ : ℝ) (hθ : 0≤θ)
    (he : e.process.Valid) (hm : ∀q,0≤mask q)
    (hdown : ∀q∈e.process.activeEvents,q∉L.val→
      F (e.birth Γ q (positive q)) (protectedLineSave L e (e.birth Γ q (positive q)) saved)≤F e saved) :
    protectedObservableExternalRate e saved Γ mask positive L (fun v a=>Real.exp (θ*F v a))-
      θ*Real.exp (θ*F e saved)*protectedObservableExternalRate e saved Γ mask positive L F≤
      (θ^2/2)*Real.exp (θ*F e saved)*protectedObservableJumpSquareRate e saved Γ mask positive L F := by
  unfold protectedObservableExternalRate protectedObservableJumpSquareRate protectedExternalEventRate
  rw [Finset.mul_sum,←Finset.sum_sub_distrib,Finset.mul_sum]
  apply Finset.sum_le_sum
  intro q hq
  by_cases hqL : q∈L.val
  · simp only [if_pos hqL,mul_zero,sub_self,le_refl]
  · simp only [if_neg hqL]
    have hh := mul_le_mul_of_nonneg_left (exp_increment_quadratic θ (F e saved)
      (F (e.birth Γ q (positive q)) (protectedLineSave L e (e.birth Γ q (positive q)) saved)) hθ (hdown q hq hqL))
      (e.process.birthRate_nonneg mask hm he q)
    nlinarith only [hh]

end NoThreeLine
#print axioms NoThreeLine.exp_nonpos_quadratic
#print axioms NoThreeLine.protectedObservableExternalRate_exp_bound
