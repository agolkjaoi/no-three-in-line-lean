import NoThreeLine.GoodCutTerminalResidual
import NoThreeLine.GoodFutureCutHistory

/-! A genuine later-phase cut is compared with an old actual within-phase
cut under bounded nonnegative old-cut tests. Both use one original board;
the full old cut/terminal/residual law supplies the conditional step. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem goodThroughPhaseCut_actual_cut_le_of_ae_avoid {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (hB : 0<B) (Γ : Finset ZPoint) (e : Retention n)
    (C L : Finset (Grid n)) (hCL : C⊆L) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K<2) (j k : ℕ) (v : ℝ) (s : GoodPhaseObservation n B)
    (hcut : δ<((cs j).horizon:ℝ))
    (F : TimedObservation (cs j).config→ℝ) (hF : Measurable F)
    (A : ℝ) (hFA : ∀x,0≤F x ∧ F x≤A)
    (havoid : ∀ᵐω ∂boardClockMeasure n (B/n),∀i,
      δ≠(observedRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn
        (goodPhaseStart (cs j).config ε M s).val i ω).1.1.val.2) :
    (∫ω,mixed Γ C ∅ L (observedWitness (cs (j+1+k)).config e
        (goodThroughPhaseCut cs ε M deadline start hn j k v (s,ω)))*
      F (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) δ hδ hn
        (goodPhaseStart (cs j).config ε M s) ω) ∂boardClockMeasure n (B/n))≤
    ∫ω,mixed Γ C ∅ L (observedWitness (cs j).config e
        (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) δ hδ hn
          (goodPhaseStart (cs j).config ε M s) ω))*
      F (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) δ hδ hn
        (goodPhaseStart (cs j).config ε M s) ω) ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let tr := fun ω : BoardClockPath n=>goodPhaseRecycledPair cfg ε M t₀ hn (s,ω)
  let cut := sourceCutTerminal cfg ε M t₀ δ hδ hn (goodPhaseStart cfg ε M s)
  let H := fun ω=>(cut ω,(tr ω).1)
  have ht : Measurable tr := (goodPhaseRecycledPair_measurable cfg ε M t₀ hn).comp
    (measurable_const.prodMk measurable_id)
  have hcutm : Measurable cut := sourceCutTerminal_measurable cfg ε M t₀ δ hδ hn _
  have hH : Measurable H := hcutm.prodMk ht.fst
  letI : IsProbabilityMeasure (ν.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let f := fun x : (TimedObservation cfg×GoodPhaseObservation n B)×BoardClockPath n=>
    mixed Γ C ∅ L (observedWitness (cs (j+1+k)).config e
      (goodAfterPhaseCut cs ε M deadline start hn j k v (x.1.2,x.2)))*F x.1.1
  let g := fun x : (TimedObservation cfg×GoodPhaseObservation n B)×BoardClockPath n=>
    goodPhaseMixed Γ e C ∅ L x.1.2*F x.1.1
  have hf : Measurable f := ((mixed_measurable Γ C ∅ L).comp
    ((observedWitness_measurable (cs (j+1+k)).config e).comp
      ((goodAfterPhaseCut_measurable cs ε M deadline start hn j k v).comp
        (measurable_fst.snd.prodMk measurable_snd)))).mul (hF.comp measurable_fst.fst)
  have hg : Measurable g := ((goodPhaseMixed_measurable Γ e C ∅ L).comp measurable_fst.snd).mul
    (hF.comp measurable_fst.fst)
  have hfB (x) : 0≤f x ∧ f x≤mixedCap C B*A := by
    have hv := goodAfterPhaseCut_valid cs ε M deadline start hn j k v e (x.1.2,x.2)
    exact ⟨mul_nonneg (mixed_nonneg _ Γ C ∅ L B hv) (hFA x.1.1).1,
      mul_le_mul (mixed_le_cap _ Γ C ∅ L B hv) (hFA x.1.1).2 (hFA x.1.1).1 (mixedCap_nonneg C B)⟩
  have hgB (x) : 0≤g x ∧ g x≤mixedCap C B*A :=
    ⟨mul_nonneg (goodPhaseMixed_bounds Γ e C ∅ L x.1.2).1 (hFA x.1.1).1,
      mul_le_mul (goodPhaseMixed_bounds Γ e C ∅ L x.1.2).2 (hFA x.1.1).2 (hFA x.1.1).1 (mixedCap_nonneg C B)⟩
  have hfirst := independent_pair_le_integrals ν ν H (fun ω=>(tr ω).2) hH ht.snd
    (goodCut_terminal_residual_product cfg ε M t₀ δ hδ hn hB s hcut havoid) f g hf hg
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (mixedCap C B*A) hfB)
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (mixedCap C B*A) hgB)
    (fun a=>by
      change (∫ω,mixed Γ C ∅ L (observedWitness (cs (j+1+k)).config e
        (goodAfterPhaseCut cs ε M deadline start hn j k v (a.2,ω)))*F a.1 ∂ν)≤_
      rw [integral_mul_const]
      simpa [g,ν] using mul_le_mul_of_nonneg_right
        (goodAfterPhaseCut_expected_source_free cs ε M deadline start Γ e C L hn hB hΓ hK hCL j k v a.2)
        (hFA a.1).1)
  have hsecond := source_free_terminal_actual_cut_le_of_ae_avoid cfg ε M t₀ δ hδ hn hB
    (cs j).mask_le_one e C L hCL (hK j) (goodPhaseStart cfg ε M s) hcut F hF A hFA havoid
  have hdir : cfg.directions=Γ := hΓ j
  rw [hdir] at hsecond
  exact hfirst.trans hsecond

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodThroughPhaseCut_actual_cut_le_of_ae_avoid
