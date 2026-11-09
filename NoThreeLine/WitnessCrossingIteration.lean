import NoThreeLine.WitnessCutCrossing
import NoThreeLine.WitnessSourceFreeTest

/-! The actual cut crossing inequality is transported through the original
recycled clocks and then to the actual source-free terminal mixed value. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine

theorem independent_pair_integral_le_fibers {Ω H W : Type*}
    [MeasurableSpace Ω] [MeasurableSpace H] [MeasurableSpace W]
    (μ : Measure Ω) (ν : Measure W) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (h : Ω→H) (r : Ω→W) (hh : Measurable h) (hr : Measurable r)
    (hpair : μ.map (fun ω=>(h ω,r ω))=(μ.map h).prod ν)
    (f g : H×W→ℝ) (hf : Measurable f) (hg : Measurable g)
    (hfi : Integrable f ((μ.map h).prod ν)) (hgi : Integrable g ((μ.map h).prod ν))
    (he : ∀a,(∫w,f (a,w) ∂ν)≤∫w,g (a,w) ∂ν) :
    (∫ω,f (h ω,r ω) ∂μ)≤∫ω,g (h ω,r ω) ∂μ := by
  letI : IsProbabilityMeasure (μ.map h) := Measure.isProbabilityMeasure_map hh.aemeasurable
  rw [←integral_map_of_stronglyMeasurable (hh.prodMk hr) hf.stronglyMeasurable,
    ←integral_map_of_stronglyMeasurable (hh.prodMk hr) hg.stronglyMeasurable,hpair,
    integral_prod _ hfi,integral_prod _ hgi]
  exact integral_mono hfi.integral_prod_left hgi.integral_prod_left he

namespace BirthWitness

def goodInteriorCut {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) : GoodObservation cfg :=
  goodObservedStep cfg ε M (start-δ) (sourceRestrictGood cfg δ hδ s,cutProbe cfg hn)

theorem goodInteriorCut_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) : Measurable (goodInteriorCut cfg ε M start δ hδ hn) :=
  (goodObservedStep_measurable cfg ε M (start-δ)).comp
    ((sourceRestrictGood_measurable cfg δ hδ).prodMk measurable_const)

theorem goodRecycled_source_free_crossing_le {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (e : Retention n)
    (C L : Finset (Grid n)) (hCL : C⊆L) (hK : cfg.K<2) (s : GoodObservation cfg) (i : ℕ)
    (F : TimedObservation cfg→ℝ) (hF : Measurable F) (A : ℝ) (hFA : ∀v,0≤F v ∧ F v≤A) :
    let X := RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s
    (∫ω,goodMixed cfg e C ∅ L (X (i+1) ω)*
      cutCrossingTest cfg ε M start δ hδ hn F ((X i ω).val,(X (i+1) ω).val) ∂boardClockMeasure n (cfg.B/n))≤
    ∫ω,goodMixed cfg e C ∅ L (goodInteriorCut cfg ε M start δ hδ hn (X i ω))*
      cutCrossingTest cfg ε M start δ hδ hn F ((X i ω).val,(X (i+1) ω).val) ∂boardClockMeasure n (cfg.B/n) := by
  let μ := boardClockMeasure n (cfg.B/n)
  let step := goodObservedRestartStep cfg ε M start hn
  have hstep := goodObservedRestartStep_measurable cfg ε M start hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let a := fun ω=>(RecycledBoardProcess.iterate step s i ω).1
  let r := fun ω=>(RecycledBoardProcess.iterate step s i ω).2
  have ha : Measurable a := (RecycledBoardProcess.iterate_measurable step hstep s i).fst
  have hr : Measurable r := (RecycledBoardProcess.iterate_measurable step hstep s i).snd
  letI : IsProbabilityMeasure (μ.map a) := Measure.isProbabilityMeasure_map ha.aemeasurable
  let test := fun x : GoodObservation cfg×BoardClockPath n=>cutCrossingTest cfg ε M start δ hδ hn F
    (x.1.val,(goodObservedClockStep cfg ε M start hn x).val)
  have ht : Measurable test := (cutCrossingTest_measurable cfg ε M start δ hδ hn F hF).comp
    (measurable_fst.subtype_val.prodMk (goodObservedClockStep_measurable cfg ε M start hn).subtype_val)
  have htb (x : GoodObservation cfg×BoardClockPath n) : 0≤test x ∧ test x≤A :=
    cutCrossingTest_bounds cfg ε M start δ hδ hn F A hFA _
  let f := fun x : GoodObservation cfg×BoardClockPath n=>goodMixed cfg e C ∅ L
    (goodObservedClockStep cfg ε M start hn x)*test x
  let g := fun x : GoodObservation cfg×BoardClockPath n=>goodMixed cfg e C ∅ L
    (goodInteriorCut cfg ε M start δ hδ hn x.1)*test x
  have hf : Measurable f := ((goodMixed_measurable cfg e C ∅ L).comp
    (goodObservedClockStep_measurable cfg ε M start hn)).mul ht
  have hg : Measurable g := ((goodMixed_measurable cfg e C ∅ L).comp
    ((goodInteriorCut_measurable cfg ε M start δ hδ hn).comp measurable_fst)).mul ht
  have hfi : Integrable f ((μ.map a).prod μ) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (mixedCap C cfg.B*A) (fun x=>
      ⟨mul_nonneg (goodMixed_bounds cfg e C ∅ L _).1 (htb x).1,
        mul_le_mul (goodMixed_bounds cfg e C ∅ L _).2 (htb x).2 (htb x).1 (mixedCap_nonneg C cfg.B)⟩)
  have hgi : Integrable g ((μ.map a).prod μ) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (mixedCap C cfg.B*A) (fun x=>
      ⟨mul_nonneg (goodMixed_bounds cfg e C ∅ L _).1 (htb x).1,
        mul_le_mul (goodMixed_bounds cfg e C ∅ L _).2 (htb x).2 (htb x).1 (mixedCap_nonneg C cfg.B)⟩)
  have hsection := goodObservedRestartStep_map cfg ε M start hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hpair : μ.map (fun ω=>(a ω,r ω))=(μ.map a).prod μ := by
    rw [RecycledBoardProcess.iterate_state_map step hstep μ hsection s i,
      RecycledBoardProcess.iterate_map step hstep μ hsection s i]
  exact independent_pair_integral_le_fibers μ μ a r ha hr hpair f g hf hg hfi hgi (fun v=>by
    simpa only [f,g,test,goodMixed,goodInteriorCut,goodObservedClockStep,goodObservedStep,
      cutCrossingTest,mul_ite,mul_zero,observedClockStep,interiorCutObservation,sourceRestrictGood,μ] using
      observedCut_source_free_crossing_le cfg ε M start δ hδ hn hB hm e C L hCL hK v F (fun a=>(hFA a).1))

theorem source_free_terminal_crossing_le {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (e : Retention n)
    (C L : Finset (Grid n)) (hCL : C⊆L) (hK : cfg.K<2) (s : GoodObservation cfg) (i : ℕ)
    (F : TimedObservation cfg→ℝ) (hF : Measurable F) (A : ℝ) (hFA : ∀v,0≤F v ∧ F v≤A) :
    let X := RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s
    (∫ω,mixed cfg.directions C ∅ L (observedWitness cfg e (observedRecycledTerminal cfg ε M start hn (s.val,ω)))*
      cutCrossingTest cfg ε M start δ hδ hn F ((X i ω).val,(X (i+1) ω).val) ∂boardClockMeasure n (cfg.B/n))≤
    ∫ω,goodMixed cfg e C ∅ L (goodInteriorCut cfg ε M start δ hδ hn (X i ω))*
      cutCrossingTest cfg ε M start δ hδ hn F ((X i ω).val,(X (i+1) ω).val) ∂boardClockMeasure n (cfg.B/n) := by
  let X := RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s
  let G := fun v : Fin ((i+1)+1)→GoodObservation cfg=>cutCrossingTest cfg ε M start δ hδ hn F
    ((v (Fin.castSucc (Fin.last i))).val,(v (Fin.last (i+1))).val)
  have hG : Measurable G := (cutCrossingTest_measurable cfg ε M start δ hδ hn F hF).comp
    ((measurable_pi_apply (Fin.castSucc (Fin.last i))).subtype_val.prodMk
      (measurable_pi_apply (Fin.last (i+1))).subtype_val)
  have hGA (v : Fin ((i+1)+1)→GoodObservation cfg) : 0≤G v ∧ G v≤A :=
    cutCrossingTest_bounds cfg ε M start δ hδ hn F A hFA _
  have htest := source_free_terminal_history_test_le cfg ε M start e C L hn hB hm hK hCL s (i+1)
    (fun ω=>G (StateHistory.history X (i+1) ω)) (hG.comp (comap_measurable _)) A
    (fun ω=>hGA _)
  exact htest.trans (goodRecycled_source_free_crossing_le cfg ε M start δ hδ hn hB hm e C L hCL hK s i F hF A hFA)

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.BirthWitness.goodRecycled_source_free_crossing_le
#print axioms NoThreeLine.BirthWitness.source_free_terminal_crossing_le
