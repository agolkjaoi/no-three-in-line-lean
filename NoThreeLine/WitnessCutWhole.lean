import NoThreeLine.WitnessActualCutInterval
import NoThreeLine.CutCrossingPartition
import NoThreeLine.SourceCutAfterCompletion

/-! Sum every actual crossing interval for the source-free mixed terminal
bound. The after-completion branch uses the real stopped observation. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set Function
namespace NoThreeLine

theorem integral_le_of_disjoint_pieces {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (E : ℕ→Set Ω) (hE : ∀i,MeasurableSet (E i)) (hdisj : Pairwise (Disjoint on E))
    (f g : Ω→ℝ) (hf : Integrable f μ) (hg : Integrable g μ)
    (hpiece : ∀i,(∫ω in E i,f ω ∂μ)≤∫ω in E i,g ω ∂μ)
    (hrest : ∀ᵐω ∂μ,ω∉⋃i,E i→f ω=g ω) :
    (∫ω,f ω ∂μ)≤∫ω,g ω ∂μ := by
  have hu : MeasurableSet (⋃i,E i) := MeasurableSet.iUnion hE
  have hi : (∫ω in ⋃i,E i,f ω ∂μ)≤∫ω in ⋃i,E i,g ω ∂μ := by
    rw [integral_iUnion hE hdisj hf.integrableOn,integral_iUnion hE hdisj hg.integrableOn]
    exact (hasSum_integral_iUnion hE hdisj hf.integrableOn).summable.tsum_le_tsum hpiece
      (hasSum_integral_iUnion hE hdisj hg.integrableOn).summable
  have hc : (∫ω in (⋃i,E i)ᶜ,f ω ∂μ)=∫ω in (⋃i,E i)ᶜ,g ω ∂μ :=
    setIntegral_congr_ae hu.compl hrest
  linarith [integral_add_compl hu hf,integral_add_compl hu hg]

namespace BirthWitness

theorem source_free_terminal_actual_cut_le_of_ae_avoid {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : cfg.K<2)
    (s : GoodObservation cfg) (hcut : δ<s.val.1.val.2)
    (F : TimedObservation cfg→ℝ) (hF : Measurable F) (A : ℝ) (hFA : ∀v,0≤F v ∧ F v≤A)
    (havoid : ∀ᵐω ∂boardClockMeasure n (cfg.B/n),∀i,
      δ≠(observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2) :
    (∫ω,mixed cfg.directions C ∅ L (observedWitness cfg e (observedRecycledTerminal cfg ε M start hn (s.val,ω)))*
      F (sourceCutTerminal cfg ε M start δ hδ hn s ω) ∂boardClockMeasure n (cfg.B/n))≤
    ∫ω,mixed cfg.directions C ∅ L (observedWitness cfg e (sourceCutTerminal cfg ε M start δ hδ hn s ω))*
      F (sourceCutTerminal cfg ε M start δ hδ hn s ω) ∂boardClockMeasure n (cfg.B/n) := by
  let μ := boardClockMeasure n (cfg.B/n)
  let E := actualCutInterval cfg ε M start δ hn s.val
  let U := sourceCutTerminal cfg ε M start δ hδ hn s
  let Z := fun ω=>mixed cfg.directions C ∅ L (observedWitness cfg e (observedRecycledTerminal cfg ε M start hn (s.val,ω)))
  let z := fun ω=>mixed cfg.directions C ∅ L (observedWitness cfg e (U ω))
  let f := fun ω=>Z ω*F (U ω)
  let g := fun ω=>z ω*F (U ω)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hU : Measurable U := sourceCutTerminal_measurable cfg ε M start δ hδ hn s
  have hZ : Measurable Z := (mixed_measurable cfg.directions C ∅ L).comp
    ((observedWitness_measurable cfg e).comp
      ((observedRecycledTerminal_measurable cfg ε M start hn).comp (measurable_const.prodMk measurable_id)))
  have hz : Measurable z := (mixed_measurable cfg.directions C ∅ L).comp ((observedWitness_measurable cfg e).comp hU)
  have hZb (ω : BoardClockPath n) : 0≤Z ω ∧ Z ω≤mixedCap C cfg.B :=
    ⟨mixed_nonneg _ _ _ _ _ _ (observedRecycledTerminal_witness_valid cfg ε M start hn e (s.val,ω) s.property.1),
      mixed_le_cap _ _ _ _ _ _ (observedRecycledTerminal_witness_valid cfg ε M start hn e (s.val,ω) s.property.1)⟩
  have hzb (ω : BoardClockPath n) : 0≤z ω ∧ z ω≤mixedCap C cfg.B :=
    ⟨mixed_nonneg _ _ _ _ _ _ (observedWitness_valid cfg e _ (sourceCutTerminal_consistent cfg ε M start δ hδ hn s ω)),
      mixed_le_cap _ _ _ _ _ _ (observedWitness_valid cfg e _ (sourceCutTerminal_consistent cfg ε M start δ hδ hn s ω))⟩
  have hf : Integrable f μ := GenericCreditIteration.bounded_nonnegative_integrable μ f
    (hZ.mul (hF.comp hU)) (mixedCap C cfg.B*A) (fun ω=>⟨mul_nonneg (hZb ω).1 (hFA (U ω)).1,
      mul_le_mul (hZb ω).2 (hFA (U ω)).2 (hFA (U ω)).1 (mixedCap_nonneg C cfg.B)⟩)
  have hg : Integrable g μ := GenericCreditIteration.bounded_nonnegative_integrable μ g
    (hz.mul (hF.comp hU)) (mixedCap C cfg.B*A) (fun ω=>⟨mul_nonneg (hzb ω).1 (hFA (U ω)).1,
      mul_le_mul (hzb ω).2 (hFA (U ω)).2 (hFA (U ω)).1 (mixedCap_nonneg C cfg.B)⟩)
  apply integral_le_of_disjoint_pieces μ E (actualCutInterval_measurable cfg ε M start δ hn s.val)
    (actualCutInterval_pairwise cfg ε M start δ hn s) f g hf hg
  · intro i
    rw [←integral_indicator (actualCutInterval_measurable cfg ε M start δ hn s.val i),
      ←integral_indicator (actualCutInterval_measurable cfg ε M start δ hn s.val i)]
    simpa only [Set.indicator,actualCutInterval,Set.mem_setOf_eq,f,g,Z,z,U] using
      source_free_terminal_actual_cut_interval cfg ε M start δ hδ hn hB hm e C L hCL hK s i F hF A hFA
  · filter_upwards [havoid,augRecycledTerminal_done_ae cfg ε M hn hB s.val.1] with ω hω hd hrest
    have hnox (i : ℕ) : ¬((observedRecycledPair cfg ε M start hn s.val (i+1) ω).1.1.val.2<δ ∧
        δ<(observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2) :=
      fun hx=>hrest (Set.mem_iUnion.mpr ⟨i,hx⟩)
    have hR := remaining_above_cut_of_no_cross
      (fun i=>(observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2) δ hcut hω hnox
      (augRecycledCompletionIndex cfg ε M hn s.val.1 ω)
    have ht : elapsedTime cfg ε M start hn s (augRecycledCompletionIndex cfg ε M hn s.val.1 ω) ω<s.val.1.val.2-δ := by
      rw [elapsedTime_eq_observed_remaining]
      linarith
    have hW : observedWitness cfg e (U ω)=
        observedWitness cfg e (observedRecycledTerminal cfg ε M start hn (s.val,ω)) := by
      dsimp only [U]
      rw [sourceCutTerminal_after_completion cfg ε M start δ hδ hn s ω hd ht,
        sourceRestrictObservation_witness]
    dsimp only [f,g,z,Z]
    rw [hW]

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.integral_le_of_disjoint_pieces
#print axioms NoThreeLine.BirthWitness.source_free_terminal_actual_cut_le_of_ae_avoid
