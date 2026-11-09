import NoThreeLine.FiniteEnergyMartingale
import Mathlib.Probability.Martingale.OptionalStopping

/-! Finite-time coefficient-one maximal bounds for bounded real
martingales. No predictable energy or time-union factor is introduced. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem boundedMartingale_square_submartingale {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (X : ℕ→Ω→ℝ) (hX : Martingale X F μ) (C : ℝ)
    (hC : ∀k ω,‖X k ω‖≤C) : Submartingale (fun k ω=>(X k ω)^2) F μ := by
  let V := fun k ω=>(X (k+1) ω-X k ω)^2
  have hm (k : ℕ) : Measurable (X k) :=
    (hX.stronglyMeasurable k).measurable.mono (F.le k) le_rfl
  have hvm (k : ℕ) : @Measurable Ω ℝ (F (k+1)) inferInstance (V k) :=
    ((hX.stronglyMeasurable (k+1)).measurable.sub
      ((hX.stronglyMeasurable k).mono (F.mono (Nat.le_succ k))).measurable).pow_const 2
  have hvb (k : ℕ) (ω : Ω) : ‖V k ω‖≤(2*|C|)^2 := by
    change ‖(X (k+1) ω-X k ω)^2‖≤_
    rw [norm_pow]
    have hd : ‖X (k+1) ω-X k ω‖≤2*|C| :=
      (norm_sub_le _ _).trans (by linarith [hC (k+1) ω,hC k ω,le_abs_self C])
    exact pow_le_pow_left₀ (norm_nonneg _) hd 2
  have hiV (k : ℕ) : Integrable (V k) μ :=
    Integrable.of_bound ((hvm k).mono (F.le (k+1)) le_rfl).aestronglyMeasurable
      ((2*|C|)^2) (ae_of_all _ (hvb k))
  have hiSq (k : ℕ) : Integrable (fun ω=>(X k ω)^2) μ := by
    apply Integrable.of_bound ((hm k).pow_const 2).aestronglyMeasurable (|C|^2)
    exact ae_of_all _ (fun ω=>by
      rw [norm_pow]
      exact pow_le_pow_left₀ (norm_nonneg _) ((hC k ω).trans (le_abs_self _)) 2)
  have hiS (k : ℕ) : Integrable (fun ω=>∑j∈Finset.range k,V j ω) μ :=
    integrable_finsetSum _ (fun j _=>hiV j)
  have hE := finiteEnergyMartingale μ F X V hX hvm (fun _=>C) (fun _=>(2*|C|)^2)
    hC hvb (fun _ _ _=>rfl)
  apply submartingale_of_setIntegral_le_succ
    (fun k=>((hX.stronglyMeasurable k).measurable.pow_const 2).stronglyMeasurable) hiSq
  intro k A hA
  have he := hE.setIntegral_eq (Nat.le_succ k) hA
  have hiSV : Integrable (fun ω=>(∑j∈Finset.range k,V j ω)+V k ω) μ :=
    (hiS k).add (hiV k)
  simp_rw [Finset.sum_range_succ] at he
  rw [integral_sub (hiSq k).integrableOn (hiS k).integrableOn,
    integral_sub (hiSq (k+1)).integrableOn hiSV.integrableOn,
    integral_add (hiS k).integrableOn (hiV k).integrableOn] at he
  have hp : 0≤∫ω in A,V k ω ∂μ := integral_nonneg (fun ω=>sq_nonneg _)
  linarith

theorem boundedMartingale_finite_maximal {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (X : ℕ→Ω→ℝ) (hX : Martingale X F μ) (C : ℝ)
    (hC : ∀k ω,‖X k ω‖≤C) (r : ℝ) (hr : 0<r) (N : ℕ) :
    μ {ω | ∃k≤N,r≤|X k ω|}≤ENNReal.ofReal ((∫ω,(X N ω)^2 ∂μ)/r^2) := by
  have hs := boundedMartingale_square_submartingale μ F X hX C hC
  let ε : NNReal := ⟨r^2,sq_nonneg r⟩
  have hm := maximal_ineq hs (fun k ω=>sq_nonneg (X k ω)) (ε := ε) N
  have he : {ω | (ε:ℝ)≤(Finset.range (N+1)).sup' Finset.nonempty_range_add_one
      (fun k=>(X k ω)^2)}={ω | ∃k≤N,r≤|X k ω|} := by
    ext ω
    simp only [mem_setOf_eq,Finset.le_sup'_iff,Finset.mem_range,Nat.lt_succ_iff]
    apply exists_congr
    intro k
    apply and_congr_right
    intro _
    change r^2≤(X k ω)^2 ↔ r≤|X k ω|
    rw [←sq_abs (X k ω),sq_le_sq₀ hr.le (abs_nonneg _)]
  rw [he] at hm
  have hi := hs.integrable N
  have hle := hm.trans (ENNReal.ofReal_le_ofReal
    (setIntegral_le_integral hi (ae_of_all _ (fun ω=>sq_nonneg (X N ω)))))
  have hr2 : 0<r^2 := sq_pos_of_pos hr
  rw [ENNReal.ofReal_div_of_pos hr2]
  apply (ENNReal.le_div_iff_mul_le (Or.inl (ne_of_gt (ENNReal.ofReal_pos.mpr hr2)))
    (Or.inl ENNReal.ofReal_ne_top)).mpr
  convert! hle using 1 <;>
    simp only [ε,mul_comm,ENNReal.ofReal_eq_coe_nnreal (sq_nonneg r)] <;> rfl

end NoThreeLine
#print axioms NoThreeLine.boundedMartingale_square_submartingale
#print axioms NoThreeLine.boundedMartingale_finite_maximal
