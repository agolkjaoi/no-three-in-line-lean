import NoThreeLine.ScheduledRestartEventSections

/-! A marked exit and its original residual product transport a
sectionwise tail under a factored, normalized change of law. -/
set_option autoImplicit false
set_option maxHeartbeats 1850000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine

theorem markedProductSection_event_le {S Ω : Type*} [MeasurableSpace S] [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ]
    (F : Ω→(S×Bool)×Ω) (hF : Measurable F)
    (hmap : μ.map F=(μ.map (fun ω=>(F ω).1)).prod μ)
    (W : S×Bool→ℝ) (hW : Measurable W) (C : ℝ) (hWb : ∀x,0≤W x ∧ W x≤C)
    (R : (S×Bool)×Ω→ℝ) (hR : Measurable R) (D : ℝ) (hRb : ∀x,0≤R x ∧ R x≤D)
    (hWmean : (∫ω,W (F ω).1 ∂μ)=1)
    (hRmean : ∀x,(∫w,R (x,w) ∂μ)=1)
    (G : (S×Bool)×Ω→Bool) (hG : Measurable G) (tail : ℝ) (htail : 0≤tail)
    (hsec : ∀ω,0<W (F ω).1 → (F ω).1.2=false →
      (savedCreditMeasure μ (fun w=>R ((F ω).1,w))).real {w | G ((F ω).1,w)=true}≤tail) :
    (savedCreditMeasure μ (fun ω=>W (F ω).1*R (F ω))).real
      {ω | ((F ω).1.2 || G (F ω))=true} ≤
    (savedCreditMeasure μ (fun ω=>W (F ω).1)).real {ω | (F ω).1.2=true}+tail := by
  let ρ := μ.map (fun ω=>(F ω).1)
  letI : IsProbabilityMeasure ρ := Measure.isProbabilityMeasure_map hF.fst.aemeasurable
  let H := fun x : (S×Bool)×Ω=>x.1.2 || G x
  let d := fun x : (S×Bool)×Ω=>W x.1*R x
  let f := fun x=>crossingFlagValue 1 (H x)
  let g := fun ω=>crossingFlagValue 1 (F ω).1.2
  have hH : Measurable H :=
    (measurable_of_countable (fun a : Bool×Bool=>a.1 || a.2)).comp (measurable_fst.snd.prodMk hG)
  have hd : Measurable d := (hW.comp measurable_fst).mul hR
  have hdn (x) : 0≤d x := mul_nonneg (hWb x.1).1 (hRb x).1
  have hf : Measurable f := crossingFlagValue_measurable.comp (measurable_const.prodMk hH)
  have hg : Measurable g := crossingFlagValue_measurable.comp (measurable_const.prodMk hF.fst.snd)
  have hfb (x) : 0≤f x ∧ f x≤1 := crossingFlagValue_bounds (by norm_num) (H x)
  have hI : Integrable (fun x=>d x*f x) (ρ.prod μ) := by
    apply GenericCreditIteration.bounded_nonnegative_integrable _ _ (hd.mul hf) (C*D)
    intro x
    refine ⟨mul_nonneg (hdn x) (hfb x).1,(mul_le_of_le_one_right (hdn x) (hfb x).2).trans ?_⟩
    exact mul_le_mul (hWb x.1).2 (hRb x).2 (hRb x).1 ((hWb x.1).1.trans (hWb x.1).2)
  have hWi : Integrable (fun ω=>W (F ω).1) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ (hW.comp hF.fst) C (fun ω=>hWb (F ω).1)
  have hgi : Integrable (fun ω=>W (F ω).1*g ω) μ := by
    apply GenericCreditIteration.bounded_nonnegative_integrable _ _ ((hW.comp hF.fst).mul hg) C
    intro ω
    have h := crossingFlagValue_bounds (by norm_num : (0:ℝ)≤1 ∧ (1:ℝ)≤1) (F ω).1.2
    exact ⟨mul_nonneg (hWb (F ω).1).1 h.1,
      (mul_le_of_le_one_right (hWb (F ω).1).1 h.2).trans (hWb (F ω).1).2⟩
  have hbound (ω : Ω) : (∫w,d ((F ω).1,w)*f ((F ω).1,w) ∂μ)≤
      W (F ω).1*g ω+tail*W (F ω).1 := by
    let a := (F ω).1
    change (∫w,(W a*R (a,w))*f (a,w) ∂μ)≤W a*g ω+tail*W a
    simp_rw [mul_assoc]
    rw [integral_const_mul]
    cases ha : a.2 with
    | true =>
      have he (w : Ω) : f (a,w)=1 := by simp [f,H,ha,crossingFlagValue]
      have hg1 : g ω=1 := by simp [g,crossingFlagValue,show (F ω).1.2=true from ha]
      simp_rw [he,mul_one,hRmean,hg1,mul_one]
      exact le_add_of_nonneg_right (mul_nonneg htail (hWb a).1)
    | false =>
      have hg0 : g ω=0 := by simp [g,crossingFlagValue,show (F ω).1.2=false from ha]
      by_cases hWa : W a=0
      · simp [hWa]
      · have he (w : Ω) : f (a,w)=crossingFlagValue 1 (G (a,w)) := by simp [f,H,ha]
        have hh : (savedCreditMeasure μ (fun w=>R (a,w))).real {w | G (a,w)=true}≤tail :=
          hsec ω (lt_of_le_of_ne (hWb a).1 (Ne.symm hWa)) ha
        rw [measureReal_flag_eq_integral _ (fun w=>G (a,w))
          (hG.comp (measurable_const.prodMk measurable_id)),
          savedCreditMeasure_integral μ (fun w=>R (a,w)) (hR.comp (measurable_const.prodMk measurable_id))
            (fun w=>(hRb (a,w)).1)] at hh
        simp_rw [he,hg0,mul_zero,zero_add]
        rw [mul_comm tail]
        exact mul_le_mul_of_nonneg_left hh (hWb a).1
  change (savedCreditMeasure μ (fun ω=>d (F ω))).real {ω | H (F ω)=true}≤_
  rw [measureReal_flag_eq_integral _ (fun ω=>H (F ω)) (hH.comp hF),
    measureReal_flag_eq_integral _ (fun ω=>(F ω).1.2) hF.fst.snd,
    savedCreditMeasure_integral μ (fun ω=>d (F ω)) (hd.comp hF) (fun ω=>hdn (F ω)),
    savedCreditMeasure_integral μ (fun ω=>W (F ω).1) (hW.comp hF.fst) (fun ω=>(hWb (F ω).1).1)]
  have hm : Measurable (fun x=>d x*f x) := hd.mul hf
  rw [←integral_map_of_stronglyMeasurable hF hm.stronglyMeasurable,hmap,integral_prod _ hI]
  have hmap' := integral_map hF.fst.aemeasurable hI.integral_prod_left.aestronglyMeasurable
  change (∫a,∫w,d (a,w)*f (a,w) ∂μ ∂ρ) =
    ∫ω,∫w,d ((F ω).1,w)*f ((F ω).1,w) ∂μ ∂μ at hmap'
  rw [hmap']
  have hh := integral_mono_of_nonneg (μ:=μ)
    (ae_of_all _ (fun ω=>integral_nonneg (fun w=>mul_nonneg (hdn ((F ω).1,w)) (hfb ((F ω).1,w)).1)))
    (hgi.add (hWi.const_mul tail)) (ae_of_all _ hbound)
  have he : (∫ω,W (F ω).1*g ω+tail*W (F ω).1 ∂μ)=
      (∫ω,W (F ω).1*g ω ∂μ)+tail := by
    rw [integral_add hgi (hWi.const_mul tail),integral_const_mul,hWmean,mul_one]
  change (∫ω,∫w,d ((F ω).1,w)*f ((F ω).1,w) ∂μ ∂μ)≤
    ∫ω,W (F ω).1*g ω+tail*W (F ω).1 ∂μ at hh
  rw [he] at hh
  exact hh

end NoThreeLine

#print axioms NoThreeLine.markedProductSection_event_le

