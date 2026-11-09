import NoThreeLine.RecycledCreditMartingale
import NoThreeLine.StableResidualProduct

/-! An actual terminal residual remains independent of the terminal state
together with an event witnessed at a finite observed history. The proof
uses the original finite product law and eventual stability of the flag. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine.RecycledBoardProcess

theorem terminal_observed_event_residual_product {S W : Type*}
    [MeasurableSpace S] [MeasurableSpace W]
    (F : S×W→S×W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ a,ν.map (fun w=>F (a,w))=(ν.map (fun w=>(F (a,w)).1)).prod ν)
    (s : S) (T : W→S×W) (hT : Measurable T)
    (hstable : ∀ᵐw∂ν,∀ᶠk in atTop,iterate F s k w=T w)
    (E : ℕ→Set W) (hE : ∀k,MeasurableSet[StateHistory.filtration
      (state F s) (state_measurable F hF s) k] (E k)) :
    ν.map (fun w=>(((T w).1,@decide (w∈⋃k,E k) (Classical.propDecidable _)),(T w).2)) =
      (ν.map (fun w=>((T w).1,@decide (w∈⋃k,E k) (Classical.propDecidable _)))).prod ν := by
  classical
  let m := StateHistory.filtration (state F s) (state_measurable F hF s)
  let P := fun k => ⋃ i,⋃ _ : i≤k,E i
  have hP (k : ℕ) : MeasurableSet[m k] (P k) :=
    MeasurableSet.iUnion (fun i=>MeasurableSet.iUnion (fun hi : i≤k=>(m.mono hi) _ (hE i)))
  have hU : MeasurableSet (⋃k,E k) := MeasurableSet.iUnion (fun k=>m.le k _ (hE k))
  let f := fun k w=>(((iterate F s k w).1,decide (w∈P k)),(iterate F s k w).2)
  let G := fun w=>(((T w).1,decide (w∈⋃k,E k)),(T w).2)
  have hflag {D : Set W} (hD : MeasurableSet D) : Measurable (fun w : W=>decide (w∈D)) :=
    Measurable.ite hD measurable_const measurable_const
  have hf (k : ℕ) : Measurable (f k) :=
    (((iterate_measurable F hF s k).fst).prodMk (hflag (m.le k _ (hP k)))).prodMk
      (iterate_measurable F hF s k).snd
  have hG : Measurable G := (hT.fst.prodMk (hflag hU)).prodMk hT.snd
  apply residual_product_of_eventually_stable ν ν f G hf hG
  · intro k
    let H := StateHistory.history (state F s) k
    have hH : Measurable H := StateHistory.history_measurable _ (state_measurable F hF s) k
    have hpk := hP k
    change MeasurableSet[MeasurableSpace.comap H inferInstance] (P k) at hpk
    obtain ⟨A,hA,hAP⟩ := hpk
    let z := fun a : Fin (k+1)→S=>(a (Fin.last k),decide (a∈A))
    have hz : Measurable z := (measurable_pi_apply _).prodMk
      (Measurable.ite hA measurable_const measurable_const)
    let r := fun w=>(iterate F s k w).2
    have hr : Measurable r := (iterate_measurable F hF s k).snd
    have hzr : Measurable (fun x : (Fin (k+1)→S)×W=>(z x.1,x.2)) :=
      (hz.comp measurable_fst).prodMk measurable_snd
    have hm := congrArg (fun η : Measure ((Fin (k+1)→S)×W)=>
      η.map (fun x=>(z x.1,x.2))) (history_residual_product F hF ν hsection s k)
    letI : IsProbabilityMeasure (ν.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
    rw [Measure.map_map hzr (hH.prodMk hr),map_pair_with_fresh_right _ _ z hz,
      Measure.map_map hz hH] at hm
    have hEq (w : W) : z (H w)=(f k w).1 := by
      dsimp only [z,f]
      rw [←hAP]
      rfl
    simpa only [Function.comp_def,hEq] using hm
  · filter_upwards [hstable] with w hw
    by_cases h : w∈⋃k,E k
    · obtain ⟨j,hj⟩ := mem_iUnion.mp h
      filter_upwards [hw,eventually_ge_atTop j] with k hk hkj
      have hPk : w∈P k := mem_iUnion.mpr ⟨j,mem_iUnion.mpr ⟨hkj,hj⟩⟩
      simp only [f,G,hk,h,hPk,decide_true]
    · filter_upwards [hw] with k hk
      have hPk : w∉P k := by
        intro hwP
        obtain ⟨i,hi⟩ := mem_iUnion.mp hwP
        obtain ⟨_,hiE⟩ := mem_iUnion.mp hi
        exact h (mem_iUnion.mpr ⟨i,hiE⟩)
      simp only [f,G,hk,h,hPk,decide_false]

end NoThreeLine.RecycledBoardProcess

#print axioms NoThreeLine.RecycledBoardProcess.terminal_observed_event_residual_product

