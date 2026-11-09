import NoThreeLine.ProcessGenerator
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic

/-! One actual continuous uniform mark for the ordered common-state birth update.
The acceptance probability is calculated from restricted Lebesgue measure.
This module does not construct candidate clocks, a continuous-time law, or a compensator. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine

/-- The continuous uniform mark measure, including the upper endpoint only. -/
def markMeasure : Measure ℝ := volume.restrict (Ioc (0 : ℝ) 1)

instance markMeasure_isProbabilityMeasure : IsProbabilityMeasure markMeasure where
  measure_univ := by simp [markMeasure, Real.volume_Ioc]

/-- Acceptance is measured from the interval, rather than assumed as a Bernoulli law. -/
theorem markMeasure_accept (α : ℝ) (hα : α ≤ 1) :
    markMeasure (Iic α) = ENNReal.ofReal α := by
  rw [markMeasure, Measure.restrict_apply measurableSet_Iic]
  have hi : Iic α ∩ Ioc (0 : ℝ) 1 = Ioc 0 α := by
    ext z
    simp only [mem_inter_iff, mem_Iic, mem_Ioc]
    constructor
    · rintro ⟨hz, hz0, _⟩
      exact ⟨hz0,hz⟩
    · rintro ⟨hz0,hz⟩
      exact ⟨hz,hz0,hz.trans hα⟩
  rw [hi, Real.volume_Ioc, sub_zero]

theorem markMeasure_real_accept (α : ℝ) (hα0 : 0 ≤ α) (hα1 : α ≤ 1) :
    markMeasure.real (Iic α) = α := by
  rw [measureReal_def, markMeasure_accept α hα1, ENNReal.toReal_ofReal hα0]

theorem mark_integrable_ite (α a b : ℝ) :
    Integrable (fun z : ℝ => if z ≤ α then a else b) markMeasure := by
  simpa only [Set.piecewise, mem_Iic] using!
    (Integrable.piecewise (s := Iic α) measurableSet_Iic
      (integrable_const a).integrableOn (integrable_const b).integrableOn :
      Integrable ((Iic α).piecewise (fun _ : ℝ => a) (fun _ => b)) markMeasure)

theorem mark_integral_ite (α a b : ℝ) (hα0 : 0 ≤ α) (hα1 : α ≤ 1) :
    (∫ z : ℝ, (if z ≤ α then a else b) ∂markMeasure) = α * a + (1 - α) * b := by
  change (∫ z : ℝ, (Iic α).piecewise (fun _ => a) (fun _ => b) z ∂markMeasure) = _
  rw [integral_piecewise measurableSet_Iic (integrable_const a).integrableOn
    (integrable_const b).integrableOn]
  rw [setIntegral_const, setIntegral_const, measureReal_compl measurableSet_Iic,
    markMeasure_real_accept α hα0 hα1]
  simp only [probReal_univ, smul_eq_mul]

def ProcessState.thinnedBirth {n : ℕ} (s : ProcessState n) (Γ : Finset (ℤ × ℤ))
    (q : Grid n) (positive : Grid n → Bool) (α z : ℝ) : ProcessState n :=
  if z ≤ α then s.birth Γ q positive else s

/-- No measurability assumption on `F` is required: this composition has only two values. -/
theorem ProcessState.thinnedBirth_integrable {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q : Grid n) (positive : Grid n → Bool)
    (α : ℝ) (F : ProcessState n → ℝ) :
    Integrable (fun z => F (s.thinnedBirth Γ q positive α z)) markMeasure := by
  simpa only [thinnedBirth, apply_ite] using
    mark_integrable_ite α (F (s.birth Γ q positive)) (F s)

theorem ProcessState.thinnedBirth_integral {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q : Grid n) (positive : Grid n → Bool)
    (α : ℝ) (F : ProcessState n → ℝ) (hα0 : 0 ≤ α) (hα1 : α ≤ 1) :
    (∫ z, F (s.thinnedBirth Γ q positive α z) ∂markMeasure) =
      α * F (s.birth Γ q positive) + (1 - α) * F s := by
  simpa only [thinnedBirth, apply_ite] using
    mark_integral_ite α (F (s.birth Γ q positive)) (F s) hα0 hα1

theorem ProcessState.thinnedBirth_integral_sub {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q : Grid n) (positive : Grid n → Bool)
    (α : ℝ) (F : ProcessState n → ℝ) (hα0 : 0 ≤ α) (hα1 : α ≤ 1) :
    (∫ z, (F (s.thinnedBirth Γ q positive α z) - F s) ∂markMeasure) =
      α * (F (s.birth Γ q positive) - F s) := by
  rw [integral_sub (s.thinnedBirth_integrable Γ q positive α F) (integrable_const _),
    s.thinnedBirth_integral Γ q positive α F hα0 hα1]
  simp only [integral_const, probReal_univ, one_smul]
  ring

theorem ProcessState.thinnedBirth_valid {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q : Grid n) (positive : Grid n → Bool)
    (α z : ℝ) (hs : s.Valid) : (s.thinnedBirth Γ q positive α z).Valid := by
  unfold thinnedBirth
  split_ifs
  · exact s.birth_valid Γ q positive hs
  · exact hs

/-- The expected credit change under one real mark, before attaching any clock. -/
theorem ProcessState.thinnedBirth_credit_integral_sub {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q p : Grid n) (positive : Grid n → Bool)
    (α : ℝ) (hα0 : 0 ≤ α) (hα1 : α ≤ 1) :
    (∫ z, (((s.thinnedBirth Γ q positive α z).accounts p).credit -
      (s.accounts p).credit) ∂markMeasure) =
      α * (((s.birth Γ q positive).accounts p).credit - (s.accounts p).credit) :=
  s.thinnedBirth_integral_sub Γ q positive α (fun t => (t.accounts p).credit) hα0 hα1

/-- A finite sum of actual mark averages equals the earlier algebraic jump generator.
`candidateRate` is only a numerical coefficient here, not an assumed intensity. -/
theorem ProcessState.thinned_credit_sum_eq_generator {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (candidateRate acceptance : Grid n → ℝ)
    (positive : Grid n → Grid n → Bool) (p : Grid n)
    (ha : ∀ q ∈ s.activeEvents, 0 ≤ acceptance q ∧ acceptance q ≤ 1) :
    (∑ q ∈ s.activeEvents, candidateRate q *
      (∫ z, (((s.thinnedBirth Γ q (positive q) (acceptance q) z).accounts p).credit -
        (s.accounts p).credit) ∂markMeasure)) =
      s.creditJumpGenerator Γ (fun q => candidateRate q * acceptance q) positive p := by
  unfold creditJumpGenerator
  apply Finset.sum_congr rfl
  intro q hq
  rw [s.thinnedBirth_credit_integral_sub Γ q p (positive q) (acceptance q)
    (ha q hq).1 (ha q hq).2]
  ring

/-- The deterministic drift and real mark-averaged losses cancel for a valid state.
No continuous-time stochastic law or compensator is inferred. -/
theorem ProcessState.thinned_credit_compensation {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (candidateRate acceptance : Grid n → ℝ)
    (positive : Grid n → Grid n → Bool) (p : Grid n) (hs : s.Valid)
    (ha : ∀ q ∈ s.activeEvents, 0 ≤ acceptance q ∧ acceptance q ≤ 1) :
    s.continuousCreditDrift Γ (fun q => candidateRate q * acceptance q) p +
      (∑ q ∈ s.activeEvents, candidateRate q *
        (∫ z, (((s.thinnedBirth Γ q (positive q) (acceptance q) z).accounts p).credit -
          (s.accounts p).credit) ∂markMeasure)) = 0 := by
  rw [s.thinned_credit_sum_eq_generator Γ candidateRate acceptance positive p ha]
  exact s.credit_generator Γ (fun q => candidateRate q * acceptance q) positive p hs

end NoThreeLine

#print axioms NoThreeLine.markMeasure_accept
#print axioms NoThreeLine.ProcessState.thinnedBirth_integral
#print axioms NoThreeLine.ProcessState.thinnedBirth_integral_sub
#print axioms NoThreeLine.ProcessState.thinned_credit_compensation
