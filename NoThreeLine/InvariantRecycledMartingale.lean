import NoThreeLine.RecycledIncrementIntegral

/-! A bounded harmonic observable on a measurable invariant region is
a martingale for actual recycled state histories. The original transition
and residual law are retained; only a proof-side integrand is extended. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.RecycledBoardProcess

theorem iterate_region {S W : Type*} (F : S×W→S×W) (R : S→Prop)
    (hR : ∀s,R s → ∀w,R (F (s,w)).1) (s : S) (hs : R s) (k : ℕ) (w : W) :
    R (state F s k w) := by
  induction k with
  | zero => exact hs
  | succ k ih => exact hR _ ih _

theorem history_credit_of_invariant {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S×W→S×W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀s,ν.map (fun w=>F (s,w))=(ν.map (fun w=>(F (s,w)).1)).prod ν)
    (z : S→ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀s,0≤z s ∧ z s≤B)
    (R : S→Prop) (hRm : Measurable R) (hR : ∀s,R s → ∀w,R (F (s,w)).1)
    (hmean : ∀s,R s → (∫w,z (F (s,w)).1 ∂ν)=z s) (s : S) (hs : R s) (k : ℕ)
    (E : Set W) (hE : MeasurableSet[StateHistory.filtration (state F s) (state_measurable F hF s) k] E) :
    (∫w in E,z (state F s (k+1) w) ∂ν)=∫w in E,z (state F s k w) ∂ν := by
  classical
  let f : S×W→ℝ := fun x=>if R x.1 then z (F x).1 else z x.1
  have hf : Measurable f := Measurable.ite (hRm.comp measurable_fst).setOf (hz.comp hF.fst) (hz.comp measurable_fst)
  have hfb (x : S×W) : 0≤f x ∧ f x≤B := by dsimp [f]; split_ifs <;> exact hb _
  have hfm (a : S) : (∫w,f (a,w) ∂ν)=z a := by
    by_cases ha : R a
    · simpa only [f,if_pos ha] using hmean a ha
    · simp only [f,if_neg ha]
      simp
  have hh := history_function_mean F hF ν hsection f hf B hfb z hz hfm s k E hE
  calc
    _ = ∫w in E,f (iterate F s k w) ∂ν := by
      apply integral_congr_ae
      exact ae_of_all _ (fun w=>by
        change z (F (iterate F s k w)).1=(if R (state F s k w) then z (F (iterate F s k w)).1 else z (state F s k w))
        rw [if_pos (iterate_region F R hR s hs k w)])
    _ = _ := hh

theorem credit_martingale_of_invariant {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S×W→S×W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀s,ν.map (fun w=>F (s,w))=(ν.map (fun w=>(F (s,w)).1)).prod ν)
    (z : S→ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀s,0≤z s ∧ z s≤B)
    (R : S→Prop) (hRm : Measurable R) (hR : ∀s,R s → ∀w,R (F (s,w)).1)
    (hmean : ∀s,R s → (∫w,z (F (s,w)).1 ∂ν)=z s) (s : S) (hs : R s) :
    Martingale (fun k w=>z (state F s k w))
      (StateHistory.filtration (state F s) (state_measurable F hF s)) ν := by
  have hadp := StateHistory.state_stronglyAdapted (state F s) (state_measurable F hF s) z hz
  have hi (k : ℕ) : Integrable (fun w=>z (state F s k w)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ (hz.comp (state_measurable F hF s k)) B (fun _=>hb _)
  rw [martingale_iff]
  exact ⟨supermartingale_of_setIntegral_succ_le hadp hi (fun k E hE=>
    (history_credit_of_invariant F hF ν hsection z hz B hb R hRm hR hmean s hs k E hE).le),
    submartingale_of_setIntegral_le_succ hadp hi (fun k E hE=>
    (history_credit_of_invariant F hF ν hsection z hz B hb R hRm hR hmean s hs k E hE).ge)⟩

end NoThreeLine.RecycledBoardProcess

#print axioms NoThreeLine.RecycledBoardProcess.credit_martingale_of_invariant
