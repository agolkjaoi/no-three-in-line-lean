import NoThreeLine.RestartLineDensity
import NoThreeLine.SavedCreditProductMixture

/-! The second-stage law on the original board is a mixture of its
normalized restart laws, with the actual first-exit state marginal. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def restartLineMixtureLaw {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ) (L : LineIndex n)
    (hn : 0<n) (s : ProtectedTimedState cfg) : Measure (BoardClockPath n) :=
  savedCreditMeasure (boardClockMeasure n (cfg.B/n))
    (fun ω=>restartLineDensity cfg ε M K L 1 hn (protectedLineExitPair cfg ε M L 0 hn s ω))

theorem restartLineMixture_integral {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hK : K<2) (L : LineIndex n) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg)
    (f : ProtectedTimedState cfg × BoardClockPath n→ℝ) (hf : Measurable f)
    (C : ℝ) (hb : ∀x,‖f x‖≤C) :
    let ν := boardClockMeasure n (cfg.B/n)
    let r := protectedLineExitPair cfg ε M L 0 hn s
    (∫ω,f (r ω) ∂restartLineMixtureLaw cfg ε M K L hn s)=
      ∫a,∫w,f (a,w) ∂savedCreditMeasure ν (fun w=>restartLineDensity cfg ε M K L 1 hn (a,w))
        ∂ν.map (fun ω=>(r ω).1) := by
  let ν := boardClockMeasure n (cfg.B/n)
  let r := protectedLineExitPair cfg ε M L 0 hn s
  let D := restartLineDensity cfg ε M K L 1 hn
  let ρ := ν.map (fun ω=>(r ω).1)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hr : Measurable r := (protectedLineExitPair_joint_measurable cfg ε M L 0 hn).comp
    (measurable_const.prodMk measurable_id)
  letI : IsProbabilityMeasure ρ := Measure.isProbabilityMeasure_map hr.fst.aemeasurable
  have hD := restartLineDensity_measurable cfg ε M K L 1 hn
  have hDb (x : ProtectedTimedState cfg × BoardClockPath n) :=
    restartLineDensity_bounds cfg ε M K hK L 1 (by omega) hn x
  apply savedCreditMeasure_product_mixture ν ρ ν r hr
    (protectedLineExitPair_map cfg ε M L 0 hn hB s) D hD (fun x=>(hDb x).1) f hf
  apply (integrable_const (max 1 ((2/(2-K))^2)*C)).mono' (hD.mul hf).aestronglyMeasurable
  exact ae_of_all _ (fun x=>by
    change ‖D x*f x‖≤max 1 ((2/(2-K))^2)*C
    rw [norm_mul,Real.norm_eq_abs,abs_of_nonneg (hDb x).1]
    exact mul_le_mul (hDb x).2 (hb x) (norm_nonneg _) (le_trans zero_le_one (le_max_left _ _)))

theorem restartLineMixtureLaw_probability {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg) :
    IsProbabilityMeasure (restartLineMixtureLaw cfg ε M K L hn s) := by
  let ν := boardClockMeasure n (cfg.B/n)
  let r := protectedLineExitPair cfg ε M L 0 hn s
  let D := restartLineDensity cfg ε M K L 1 hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hr : Measurable r := (protectedLineExitPair_joint_measurable cfg ε M L 0 hn).comp
    (measurable_const.prodMk measurable_id)
  letI : IsProbabilityMeasure (ν.map (fun ω=>(r ω).1)) := Measure.isProbabilityMeasure_map hr.fst.aemeasurable
  have hD := restartLineDensity_measurable cfg ε M K L 1 hn
  have hDb (x : ProtectedTimedState cfg × BoardClockPath n) :=
    restartLineDensity_bounds cfg ε M K hK L 1 (by omega) hn x
  apply savedCreditMeasure_probability ν (fun ω=>D (r ω))
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ (hD.comp hr) _ (fun ω=>hDb (r ω)))
    (fun ω=>(hDb (r ω)).1)
  have he := restartLineMixture_integral cfg ε M K hK L hn hB s (fun _=>1) measurable_const 1
    (fun _=>by simp)
  change (∫ω,(1:ℝ) ∂savedCreditMeasure ν (fun ω=>D (r ω)))=
    ∫a,∫w,(1:ℝ) ∂savedCreditMeasure ν (fun w=>D (a,w)) ∂ν.map (fun ω=>(r ω).1) at he
  rw [savedCreditMeasure_integral ν (fun ω=>D (r ω)) (hD.comp hr)
    (fun ω=>(hDb (r ω)).1) (fun _=>1)] at he
  simp only [mul_one] at he
  rw [he]
  have hi (a : ProtectedTimedState cfg) :
      (∫w,(1:ℝ) ∂savedCreditMeasure ν (fun w=>D (a,w)))=1 := by
    rw [savedCreditMeasure_integral ν (fun w=>D (a,w))
      (hD.comp (measurable_const.prodMk measurable_id)) (fun w=>(hDb (a,w)).1) (fun _=>1)]
    simp only [mul_one]
    exact restartLineDensity_mean_one cfg ε M K hKcfg hK L hsp 1 (by omega) hn hB hm a
  simp_rw [hi]
  simp

theorem restartLineMixture_exit_integral {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (g : ProtectedTimedState cfg→ℝ) (hg : Measurable g) (C : ℝ) (hb : ∀a,‖g a‖≤C) :
    let r := protectedLineExitPair cfg ε M L 0 hn s
    (∫ω,g (r ω).1 ∂restartLineMixtureLaw cfg ε M K L hn s)=
      ∫ω,g (r ω).1 ∂boardClockMeasure n (cfg.B/n) := by
  let ν := boardClockMeasure n (cfg.B/n)
  let r := protectedLineExitPair cfg ε M L 0 hn s
  let D := restartLineDensity cfg ε M K L 1 hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hr : Measurable r := (protectedLineExitPair_joint_measurable cfg ε M L 0 hn).comp
    (measurable_const.prodMk measurable_id)
  have hD := restartLineDensity_measurable cfg ε M K L 1 hn
  have hDb (x : ProtectedTimedState cfg × BoardClockPath n) :=
    restartLineDensity_bounds cfg ε M K hK L 1 (by omega) hn x
  have hi (a : ProtectedTimedState cfg) :
      (∫w,g a ∂savedCreditMeasure ν (fun w=>D (a,w)))=g a := by
    letI := savedCreditMeasure_probability ν (fun w=>D (a,w))
      (GenericCreditIteration.bounded_nonnegative_integrable _ _
        (hD.comp (measurable_const.prodMk measurable_id)) _ (fun w=>hDb (a,w)))
      (fun w=>(hDb (a,w)).1)
      (restartLineDensity_mean_one cfg ε M K hKcfg hK L hsp 1 (by omega) hn hB hm a)
    simp
  calc
    _ = ∫a,∫w,g a ∂savedCreditMeasure ν (fun w=>D (a,w)) ∂ν.map (fun ω=>(r ω).1) :=
      restartLineMixture_integral cfg ε M K hK L hn hB s (fun x=>g x.1) (hg.comp measurable_fst) C
        (fun x=>hb x.1)
    _ = ∫a,g a ∂ν.map (fun ω=>(r ω).1) := by simp_rw [hi]
    _ = _ := integral_map hr.fst.aemeasurable hg.aestronglyMeasurable

end NoThreeLine

#print axioms NoThreeLine.restartLineMixture_integral
#print axioms NoThreeLine.restartLineMixtureLaw_probability
#print axioms NoThreeLine.restartLineMixture_exit_integral
