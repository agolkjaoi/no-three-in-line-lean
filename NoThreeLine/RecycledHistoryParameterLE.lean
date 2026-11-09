import NoThreeLine.RecycledInvariantIntegralLE
import NoThreeLine.RecycledHistoryInequality
import Mathlib.MeasureTheory.Function.FactorsThrough

/-! A real parameter measurable from the actual finite history may be
inserted in a joint step kernel. No uncountable intersection of almost-sure
statements and no changed-law residual independence is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine.RecycledBoardProcess

theorem history_parameter_integral_le_of_invariant {S W : Type*}
    [MeasurableSpace S] [MeasurableSpace W]
    (F : S×W→S×W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀v,ν.map (fun w=>F (v,w))=(ν.map (fun w=>(F (v,w)).1)).prod ν)
    (R : S→Prop) (hRm : Measurable R) (hR : ∀v,R v→∀w,R (F (v,w)).1)
    (f g : (S×S)×ℝ→ℝ) (hf : Measurable f) (hg : Measurable g) (B C : ℝ)
    (hfB : ∀v,R v→∀a w,0≤f ((v,(F (v,w)).1),a) ∧ f ((v,(F (v,w)).1),a)≤B)
    (hgC : ∀v,R v→∀a w,0≤g ((v,(F (v,w)).1),a) ∧ g ((v,(F (v,w)).1),a)≤C)
    (hmean : ∀v,R v→∀a,(∫w,f ((v,(F (v,w)).1),a) ∂ν)≤
      ∫w,g ((v,(F (v,w)).1),a) ∂ν)
    (s : S) (hs : R s) (k : ℕ) (param : W→ℝ)
    (hp : @Measurable _ _ (StateHistory.filtration (state F s) (state_measurable F hF s) k)
      inferInstance param)
    (E : Set W)
    (hE : MeasurableSet[StateHistory.filtration (state F s) (state_measurable F hF s) k] E) :
    (∫w in E,f ((state F s k w,state F s (k+1) w),param w) ∂ν)≤
      ∫w in E,g ((state F s k w,state F s (k+1) w),param w) ∂ν := by
  classical
  let H := StateHistory.history (state F s) k
  have hH : Measurable H := StateHistory.history_measurable _ (state_measurable F hF s) k
  change Measurable[MeasurableSpace.comap H inferInstance] param at hp
  obtain ⟨p,hpmeas,hpeq⟩ := hp.exists_eq_measurable_comp
  change MeasurableSet[MeasurableSpace.comap H inferInstance] E at hE
  obtain ⟨A,hA,rfl⟩ := hE
  letI : IsProbabilityMeasure (ν.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let last : (Fin (k+1)→S)→S := fun h=>h (Fin.last k)
  have hl : Measurable last := measurable_pi_apply (Fin.last k)
  let T : ((Fin (k+1)→S)×W)→(S×S)×ℝ := fun x=>
    ((last x.1,(F (last x.1,x.2)).1),p x.1)
  have hT : Measurable T :=
    ((hl.comp measurable_fst).prodMk
      (hF.comp ((hl.comp measurable_fst).prodMk measurable_snd)).fst).prodMk
        (hpmeas.comp measurable_fst)
  let a : ((Fin (k+1)→S)×W)→ℝ := fun x=>if R (last x.1) then f (T x) else 0
  let b : ((Fin (k+1)→S)×W)→ℝ := fun x=>if R (last x.1) then g (T x) else 0
  have ha : Measurable a := Measurable.ite (hRm.comp (hl.comp measurable_fst)).setOf
    (hf.comp hT) measurable_const
  have hb : Measurable b := Measurable.ite (hRm.comp (hl.comp measurable_fst)).setOf
    (hg.comp hT) measurable_const
  have hab (x) : 0≤a x ∧ a x≤max B 0 := by
    dsimp only [a]
    split_ifs with hx
    · exact ⟨(hfB _ hx _ _).1,(hfB _ hx _ _).2.trans (le_max_left _ _)⟩
    · exact ⟨le_rfl,le_max_right _ _⟩
  have hbb (x) : 0≤b x ∧ b x≤max C 0 := by
    dsimp only [b]
    split_ifs with hx
    · exact ⟨(hgC _ hx _ _).1,(hgC _ hx _ _).2.trans (le_max_left _ _)⟩
    · exact ⟨le_rfl,le_max_right _ _⟩
  have hai : Integrable a ((ν.map H).prod ν) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ ha (max B 0) hab
  have hbi : Integrable b ((ν.map H).prod ν) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hb (max C 0) hbb
  let q : (Fin (k+1)→S)→ℝ := fun h=>∫w,b (h,w) ∂ν
  have hq : Measurable q := hb.stronglyMeasurable.integral_prod_right'.measurable
  have hmean' (h : Fin (k+1)→S) : (∫w,a (h,w) ∂ν)≤q h := by
    by_cases hr : R (last h)
    · simpa only [a,b,q,T,if_pos hr] using hmean (last h) hr (p h)
    · simp only [a,b,q,if_neg hr,integral_zero,le_refl]
  have hproduct := history_residual_product F hF ν hsection s k
  have hle := independent_history_setIntegral_le ν ν H (fun w=>(iterate F s k w).2) hH
    (iterate_measurable F hF s k).snd hproduct a q ha hq hai hbi.integral_prod_left hmean' A hA
  have heq := independent_history_setIntegral ν ν H (fun w=>(iterate F s k w).2) hH
    (iterate_measurable F hF s k).snd hproduct b q hb hq hbi (fun _=>rfl) A hA
  have hpa (w : W) : p (H w)=param w := (congrFun hpeq w).symm
  have hae (w : W) : a (H w,(iterate F s k w).2)=
      f ((state F s k w,state F s (k+1) w),param w) := by
    have hr : R (last (H w)) := iterate_region F R hR s hs k w
    simp only [a,if_pos hr,T,hpa]
    rfl
  have hbe (w : W) : b (H w,(iterate F s k w).2)=
      g ((state F s k w,state F s (k+1) w),param w) := by
    have hr : R (last (H w)) := iterate_region F R hR s hs k w
    simp only [b,if_pos hr,T,hpa]
    rfl
  calc
    _ = ∫w in H ⁻¹' A,a (H w,(iterate F s k w).2) ∂ν :=
      integral_congr_ae (ae_of_all _ (fun w=>(hae w).symm))
    _ ≤ ∫w in H ⁻¹' A,q (H w) ∂ν := hle
    _ = ∫w in H ⁻¹' A,b (H w,(iterate F s k w).2) ∂ν := heq.symm
    _ = _ := integral_congr_ae (ae_of_all _ hbe)

end NoThreeLine.RecycledBoardProcess
#print axioms NoThreeLine.RecycledBoardProcess.history_parameter_integral_le_of_invariant
