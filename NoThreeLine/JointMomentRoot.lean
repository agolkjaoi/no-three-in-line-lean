import NoThreeLine.FiniteSumMoment
import NoThreeLine.MomentEnvelopeRoot
import NoThreeLine.MomentEnvelope

/-! Two observables on one law, with no independence assumption. Their
leading deterministic prices share one budget with coefficient max(a,b). -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine.FiniteMomentIntegral
open FiniteWitnessMoments

theorem add_moment {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsFiniteMeasure μ]
    (f g : Ω→ℝ) (hf : Measurable f) (hg : Measurable g) (F G : ℝ)
    (hF : ∀ω,0≤f ω ∧ f ω≤F) (hG : ∀ω,0≤g ω ∧ g ω≤G)
    (hF0 : 0≤F) (hG0 : 0≤G) (b c : ℝ) (hb : 0≤b) (hc : 0≤c)
    (m : ℕ) (hm : 2≤m) (hfb : (∫ω,f ω^m ∂μ)≤b^m) (hgc : (∫ω,g ω^m ∂μ)≤c^m) :
    (∫ω,(f ω+g ω)^m ∂μ)≤(b+c)^m := by
  have h := finite_sum_moment μ (fun i : Fin 2=>![f,g] i)
    (by intro i; fin_cases i <;> simp_all)
    ![F,G] (by intro i; fin_cases i <;> simp_all)
    (by intro i ω; fin_cases i <;> simp_all)
    ![b,c] (by intro i; fin_cases i <;> simp_all) m hm
    (by intro i; fin_cases i <;> simp_all)
  simpa only [Fin.sum_univ_two,Matrix.cons_val_zero,Matrix.cons_val_one] using h

def separatedMomentError (m : ℕ) (A C W P ε : ℝ) : ℝ :=
  (((m+2:ℕ):ℝ)^2*W*(A+((m+2:ℕ):ℝ)*W)^(m+1)+
    ((m+2:ℕ):ℝ)^2*P*(C+((m+2:ℕ):ℝ)*W)^m)/(1-ε)^(m+3).choose 2

theorem separatedMomentBound_le_roots (m : ℕ) (A C W P ε : ℝ) (hA : 0≤A) :
    separatedMomentBound m A C W P ε≤
      (positiveMomentRoot (m+2) (1/(1-ε)^(m+3).choose 2)*A+
        positiveMomentRoot (m+2) (separatedMomentError m A C W P ε))^(m+2) := by
  have he : separatedMomentBound m A C W P ε=
      (1/(1-ε)^(m+3).choose 2)*A^(m+2)+separatedMomentError m A C W P ε*1^(m+2) := by
    unfold separatedMomentBound separatedMomentError
    ring
  rw [he]
  simpa only [mul_one] using momentEnvelope_le_root_sum (m+2) (by omega)
    (1/(1-ε)^(m+3).choose 2) (separatedMomentError m A C W P ε) A 1 hA zero_le_one

theorem add_moment_common_budget {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (f g : Ω→ℝ)
    (hf : Measurable f) (hg : Measurable g) (F G : ℝ)
    (hF : ∀ω,0≤f ω ∧ f ω≤F) (hG : ∀ω,0≤g ω ∧ g ω≤G)
    (hF0 : 0≤F) (hG0 : 0≤G) (a b A D E L Q : ℝ)
    (ha : 0≤a) (hb : 0≤b) (hA : 0≤A) (hD : 0≤D) (hE : 0≤E) (hL : 0≤L)
    (hQ : A+D≤Q) (m : ℕ) (hm : 2≤m)
    (hfM : (∫ω,f ω^m ∂μ)≤(a*A+E)^m) (hgM : (∫ω,g ω^m ∂μ)≤(b*D+L)^m) :
    (∫ω,(f ω+g ω)^m ∂μ)≤(max a b*Q+E+L)^m := by
  have hab : 0≤a*A+E := add_nonneg (mul_nonneg ha hA) hE
  have hbd : 0≤b*D+L := add_nonneg (mul_nonneg hb hD) hL
  have hmain : a*A+b*D≤max a b*Q := calc
    _ ≤ max a b*A+max a b*D := add_le_add
      (mul_le_mul_of_nonneg_right (le_max_left _ _) hA)
      (mul_le_mul_of_nonneg_right (le_max_right _ _) hD)
    _ = max a b*(A+D) := by ring
    _ ≤ _ := mul_le_mul_of_nonneg_left hQ (ha.trans (le_max_left _ _))
  have hlin : (a*A+E)+(b*D+L)≤max a b*Q+E+L := by linarith
  exact (add_moment μ f g hf hg F G hF hG hF0 hG0 _ _ hab hbd m hm hfM hgM).trans
    (pow_le_pow_left₀ (add_nonneg hab hbd) hlin m)

end NoThreeLine.FiniteMomentIntegral

#print axioms NoThreeLine.FiniteMomentIntegral.add_moment
#print axioms NoThreeLine.FiniteMomentIntegral.separatedMomentBound_le_roots
#print axioms NoThreeLine.FiniteMomentIntegral.add_moment_common_budget
