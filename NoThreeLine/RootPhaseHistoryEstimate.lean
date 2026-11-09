import NoThreeLine.RootPhaseSourceMean
import NoThreeLine.RootPhaseHistoryProcess

/-! S7 on every measurable full saved-observer phase-history event. The
running upper source is evaluated on the actual residual board and actual
physical phase, not replaced by an assumed conditional expectation. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine

theorem independent_history_pair_setIntegral_le {Ω H W : Type*}
    [MeasurableSpace Ω] [MeasurableSpace H] [MeasurableSpace W]
    (μ : Measure Ω) (ν : Measure W) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (h : Ω→H) (r : Ω→W) (hh : Measurable h) (hr : Measurable r)
    (hpair : μ.map (fun ω=>(h ω,r ω))=(μ.map h).prod ν)
    (f g : H×W→ℝ) (hf : Measurable f) (hg : Measurable g)
    (hfi : Integrable f ((μ.map h).prod ν)) (hgi : Integrable g ((μ.map h).prod ν))
    (hm : ∀a,(∫w,f (a,w) ∂ν)≤∫w,g (a,w) ∂ν) (A : Set H) (hA : MeasurableSet A) :
    (∫ω in h ⁻¹' A,f (h ω,r ω) ∂μ)≤∫ω in h ⁻¹' A,g (h ω,r ω) ∂μ := by
  letI : IsProbabilityMeasure (μ.map h) := Measure.isProbabilityMeasure_map hh.aemeasurable
  have hp : Measurable (fun ω=>(h ω,r ω)) := hh.prodMk hr
  have hrestricted : (μ.restrict (h ⁻¹' A)).map (fun ω=>(h ω,r ω))=((μ.map h).restrict A).prod ν := by
    calc
      _ = (μ.map (fun ω=>(h ω,r ω))).restrict (A×ˢuniv) := by
        rw [Measure.restrict_map hp (hA.prod MeasurableSet.univ)]
        congr 2
        ext ω
        simp
      _ = _ := by rw [hpair,←Measure.restrict_prod_eq_prod_univ]
  have hfA : Integrable f (((μ.map h).restrict A).prod ν) := by
    rw [Measure.restrict_prod_eq_prod_univ]
    exact hfi.integrableOn
  have hgA : Integrable g (((μ.map h).restrict A).prod ν) := by
    rw [Measure.restrict_prod_eq_prod_univ]
    exact hgi.integrableOn
  rw [←integral_map_of_stronglyMeasurable hp hf.stronglyMeasurable,hrestricted,integral_prod _ hfA,
    ←integral_map_of_stronglyMeasurable hp hg.stronglyMeasurable,hrestricted,integral_prod _ hgA]
  exact integral_mono hfA.integral_prod_left hgA.integral_prod_left hm

namespace BirthWitness
open PrimitiveLines

theorem rootPhase_running_history_estimate {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (s : GoodPhaseRootObservation n B p) (k : ℕ) (hΓ : (cs k).directions=Γ) (hK : (cs k).K<2)
    (hCL : C⊆L) (hCD : Disjoint C D)
    (A : Set (Fin (k+1)→ℕ×GoodPhaseRootObservation n B p)) (hA : MeasurableSet A) :
    (∫ω in (rootPhaseHistory cs ε M deadline start p hn s k) ⁻¹' A,
      goodPhaseRootMixed p Γ e C D L (rootPhaseRecycledState cs ε M deadline start p hn s (k+1) ω)
        ∂boardClockMeasure n (B/n))≤
      ∫ω in (rootPhaseHistory cs ε M deadline start p hn s k) ⁻¹' A,
        goodPhaseRootMixed p Γ e C D L (rootPhaseRecycledState cs ε M deadline start p hn s k ω)+
          phaseRootActualSource (cs k).config ε M (phaseEndpoint cs start k) p e C D L hn
            (rootPhaseRecycledState cs ε M deadline start p hn s k ω,
              (rootPhaseRecycledPair cs ε M deadline start p hn s k ω).2) ∂boardClockMeasure n (B/n) := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let H := rootPhaseHistory cs ε M deadline start p hn s k
  have hH : Measurable H := rootPhaseHistory_measurable cs ε M deadline start p hn s k
  letI : IsProbabilityMeasure (ν.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let f : (Fin (k+1)→ℕ×GoodPhaseRootObservation n B p)×BoardClockPath n→ℝ := fun x=>
    goodPhaseRootMixed p Γ e C D L
      (goodPhaseRootScheduledPair cs ε M deadline start p hn k ((x.1 (Fin.last k)).2,x.2)).1
  let g : (Fin (k+1)→ℕ×GoodPhaseRootObservation n B p)×BoardClockPath n→ℝ := fun x=>
    goodPhaseRootMixed p Γ e C D L (x.1 (Fin.last k)).2+
      phaseRootActualSource (cs k).config ε M (phaseEndpoint cs start k) p e C D L hn
        ((x.1 (Fin.last k)).2,x.2)
  have ha : Measurable (fun x : (Fin (k+1)→ℕ×GoodPhaseRootObservation n B p)×BoardClockPath n=>
      ((x.1 (Fin.last k)).2,x.2)) :=
    (((measurable_pi_apply (Fin.last k)).comp measurable_fst).snd).prodMk measurable_snd
  have hf : Measurable f := (goodPhaseRootMixed_measurable p Γ e C D L).comp
    ((goodPhaseRootScheduledPair_measurable cs ε M deadline start p hn k).comp ha).fst
  have hg : Measurable g := ((goodPhaseRootMixed_measurable p Γ e C D L).comp ha.fst).add
    ((phaseRootActualSource_measurable (cs k).config ε M _ p e C D L hn).comp ha)
  have hfi : Integrable f ((ν.map H).prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf
    (mixedCap C B) (fun _=>goodPhaseRootMixed_bounds p Γ e C D L _)
  have hgi : Integrable g ((ν.map H).prod ν) := by
    apply GenericCreditIteration.bounded_nonnegative_integrable _ _ hg
      (mixedCap C B+(cs k).horizon*sourceCap (cs k).directions C D B (cs k).K)
    intro x
    have h1 := goodPhaseRootMixed_bounds p Γ e C D L (x.1 (Fin.last k)).2
    have h2 := phaseRootActualSource_bounds (cs k).config ε M (phaseEndpoint cs start k) p e C D L hn
      (cs k).mask_le_one hK ((x.1 (Fin.last k)).2,x.2)
    exact ⟨add_nonneg h1.1 h2.1,add_le_add h1.2 h2.2⟩
  have hm (a : Fin (k+1)→ℕ×GoodPhaseRootObservation n B p) : (∫w,f (a,w) ∂ν)≤∫w,g (a,w) ∂ν := by
    have hi : Integrable (fun w=>phaseRootActualSource (cs k).config ε M (phaseEndpoint cs start k) p e C D L hn
        ((a (Fin.last k)).2,w)) ν := GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((phaseRootActualSource_measurable (cs k).config ε M _ p e C D L hn).comp
        (measurable_const.prodMk measurable_id)) _
      (fun _=>phaseRootActualSource_bounds (cs k).config ε M _ p e C D L hn (cs k).mask_le_one hK _)
    change _≤∫w,goodPhaseRootMixed p Γ e C D L (a (Fin.last k)).2+
      phaseRootActualSource (cs k).config ε M _ p e C D L hn ((a (Fin.last k)).2,w) ∂ν
    rw [integral_add (integrable_const _) hi,integral_const]
    simpa only [SharedPhase.config,hΓ,probReal_univ,one_smul] using
      phaseRootScheduled_expected_mixed_source cs ε M deadline start p hn hB k e C D L hK hCL hCD (a (Fin.last k)).2
  simp_rw [rootPhaseRecycledState_succ]
  exact independent_history_pair_setIntegral_le ν ν H
    (fun ω=>(rootPhaseRecycledPair cs ε M deadline start p hn s k ω).2) hH
    (rootPhaseRecycledPair_measurable cs ε M deadline start p hn s k).snd
    (rootPhaseHistory_residual_product cs ε M deadline start p hn hB s k)
    f g hf hg hfi hgi hm A hA

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.independent_history_pair_setIntegral_le
#print axioms NoThreeLine.BirthWitness.rootPhase_running_history_estimate
