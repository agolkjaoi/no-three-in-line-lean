import NoThreeLine.BoundedMartingaleMaximal

/-! The coefficient-one maximal estimate for every discrete time, closed
by an actual almost-surely stabilizing terminal value. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology

namespace NoThreeLine

theorem boundedMartingale_terminal_maximal {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (X : ℕ→Ω→ℝ) (hX : Martingale X F μ) (C : ℝ)
    (hC : ∀k ω,‖X k ω‖≤C) (Y : Ω→ℝ)
    (hstable : ∀ᵐω∂μ,∀ᶠk in atTop,X k ω=Y ω)
    (r : ℝ) (hr : 0<r) :
    μ {ω | ∃k,r≤|X k ω|}≤ENNReal.ofReal ((∫ω,(Y ω)^2 ∂μ)/r^2) := by
  have hs := boundedMartingale_square_submartingale μ F X hX C hC
  have hm (k : ℕ) : AEStronglyMeasurable (fun ω=>(X k ω)^2) μ :=
    (((hX.stronglyMeasurable k).mono (F.le k)).measurable.pow_const 2).aestronglyMeasurable
  have hb (k : ℕ) (ω : Ω) : ‖(X k ω)^2‖≤|C|^2 := by
    rw [norm_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) ((hC k ω).trans (le_abs_self C)) 2
  have hlim : ∀ᵐω∂μ,Tendsto (fun k=>(X k ω)^2) atTop (𝓝 ((Y ω)^2)) := by
    filter_upwards [hstable] with ω hω
    exact tendsto_const_nhds.congr' (hω.mono (fun k hk=>congrArg (fun x : ℝ=>x^2) hk.symm))
  have ht := tendsto_integral_of_dominated_convergence (fun _ : Ω=>|C|^2)
    hm (integrable_const _) (fun k=>ae_of_all _ (hb k)) hlim
  have hmean (N : ℕ) : (∫ω,(X N ω)^2 ∂μ)≤∫ω,(Y ω)^2 ∂μ := by
    apply ge_of_tendsto ht
    filter_upwards [eventually_ge_atTop N] with k hk
    simpa only [setIntegral_univ] using hs.setIntegral_le hk MeasurableSet.univ
  let E := fun N : ℕ=>{ω | ∃k≤N,r≤|X k ω|}
  have hmono : Monotone E := by
    intro i j hij ω hω
    obtain ⟨k,hki,hk⟩ := hω
    exact ⟨k,hki.trans hij,hk⟩
  have hE : {ω | ∃k,r≤|X k ω|}=⋃N,E N := by
    ext ω
    simp only [mem_setOf_eq,mem_iUnion,E]
    constructor
    · rintro ⟨k,hk⟩
      exact ⟨k,k,le_rfl,hk⟩
    · rintro ⟨N,k,_,hk⟩
      exact ⟨k,hk⟩
  rw [hE,hmono.measure_iUnion]
  apply iSup_le
  intro N
  exact (boundedMartingale_finite_maximal μ F X hX C hC r hr N).trans
    (ENNReal.ofReal_le_ofReal (div_le_div_of_nonneg_right (hmean N) (sq_nonneg r)))

end NoThreeLine
#print axioms NoThreeLine.boundedMartingale_terminal_maximal
