import Mathlib.Probability.Martingale.OptionalStopping

/-! The coefficient-one Ville estimate for a nonnegative real
supermartingale. Bounded hitting times give the finite version; an
increasing union then covers all discrete updates without a time factor. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem nonnegativeSupermartingale_finite_maximal {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (X : ℕ→Ω→ℝ) (hX : Supermartingale X F μ)
    (h0 : ∀k ω,0≤X k ω) (r : ℝ) (hr : 0<r) (N : ℕ) :
    μ {ω | ∃k≤N,r≤X k ω}≤ENNReal.ofReal ((∫ω,X 0 ω ∂μ)/r) := by
  let τ : Ω→ℕ∞ := fun ω=>(hittingBtwn X (Ici r) 0 N ω : ℕ)
  have hτ : IsStoppingTime F τ :=
    hX.stronglyAdapted.adapted.isStoppingTime_hittingBtwn measurableSet_Ici
  have hτN : ∀ω,τ ω≤N := fun ω=>by
    change ((hittingBtwn X (Ici r) 0 N ω : ℕ) : ℕ∞)≤(N : ℕ∞)
    exact_mod_cast (hittingBtwn_le (u := X) (s := Ici r) (n := 0) (m := N) ω)
  let Y := stoppedValue X τ
  have hiY : Integrable Y μ := integrable_stoppedValue ℕ hτ hX.integrable hτN
  have hY0 : ∀ω,0≤Y ω := fun ω=>h0 _ ω
  have hmean : (∫ω,Y ω ∂μ)≤∫ω,X 0 ω ∂μ := by
    have ho := hX.neg.expected_stoppedValue_mono (isStoppingTime_const F 0) hτ
      (fun ω=>(show (0 : ℕ∞)≤τ ω from bot_le)) hτN
    rw [stoppedValue_const] at ho
    change (∫ω,-X 0 ω ∂μ)≤∫ω,-Y ω ∂μ at ho
    simp only [integral_neg] at ho
    linarith
  have hsub : {ω | ∃k≤N,r≤X k ω}⊆{ω | r≤Y ω} := by
    rintro ω ⟨k,hk,hkr⟩
    exact stoppedValue_hittingBtwn_mem ⟨k,⟨Nat.zero_le k,hk⟩,hkr⟩
  have hmark := mul_meas_ge_le_integral_of_nonneg (ae_of_all μ hY0) hiY r
  have hreal : μ.real {ω | ∃k≤N,r≤X k ω}≤(∫ω,X 0 ω ∂μ)/r := by
    apply (le_div_iff₀ hr).mpr
    calc
      _ ≤ r*μ.real {ω | r≤Y ω} := by
        simpa only [mul_comm] using mul_le_mul_of_nonneg_left (measureReal_mono hsub) hr.le
      _ ≤ ∫ω,Y ω ∂μ := hmark
      _ ≤ ∫ω,X 0 ω ∂μ := hmean
  have he : ENNReal.ofReal (μ.real {ω | ∃k≤N,r≤X k ω})=μ {ω | ∃k≤N,r≤X k ω} := by
    exact ENNReal.ofReal_toReal (measure_ne_top _ _)
  rw [←he]
  exact ENNReal.ofReal_le_ofReal hreal

theorem nonnegativeSupermartingale_maximal {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (X : ℕ→Ω→ℝ) (hX : Supermartingale X F μ)
    (h0 : ∀k ω,0≤X k ω) (r : ℝ) (hr : 0<r) :
    μ {ω | ∃k,r≤X k ω}≤ENNReal.ofReal ((∫ω,X 0 ω ∂μ)/r) := by
  let E := fun N : ℕ=>{ω | ∃k≤N,r≤X k ω}
  have hmono : Monotone E := by
    intro i j hij ω hω
    obtain ⟨k,hki,hk⟩ := hω
    exact ⟨k,hki.trans hij,hk⟩
  have hE : {ω | ∃k,r≤X k ω}=⋃N,E N := by
    ext ω
    simp only [mem_setOf_eq,mem_iUnion,E]
    constructor
    · rintro ⟨k,hk⟩
      exact ⟨k,k,le_rfl,hk⟩
    · rintro ⟨N,k,_,hk⟩
      exact ⟨k,hk⟩
  rw [hE,hmono.measure_iUnion]
  exact iSup_le (fun N=>nonnegativeSupermartingale_finite_maximal μ F X hX h0 r hr N)

end NoThreeLine
#print axioms NoThreeLine.nonnegativeSupermartingale_finite_maximal
#print axioms NoThreeLine.nonnegativeSupermartingale_maximal
