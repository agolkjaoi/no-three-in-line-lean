import NoThreeLine.GoodPhaseHistoryResidual

/-! Conditional source-free comparison from the end of the current phase
to a genuine later-phase cut, retaining an arbitrary bounded nonnegative
test of the complete old within-phase finite history. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open PrimitiveLines

def goodAfterPhaseCut {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) (v : ℝ)
    (x : GoodPhaseObservation n B×BoardClockPath n) : TimedObservation (cs (j+1+k)).config :=
  goodContinuationCut cs ε M deadline start hn (j+1) k v
    (goodPhaseDeadline deadline (phaseEndpoint cs start (j+1)) x.1,x.2)

theorem goodAfterPhaseCut_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) (v : ℝ) :
    Measurable (goodAfterPhaseCut cs ε M deadline start hn j k v) :=
  (goodContinuationCut_measurable cs ε M deadline start hn (j+1) k v).comp
    (((goodPhaseDeadline_measurable deadline _).comp measurable_fst).prodMk measurable_snd)

theorem goodAfterPhaseCut_valid {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) (v : ℝ) (e : Retention n)
    (x : GoodPhaseObservation n B×BoardClockPath n) :
    (observedWitness (cs (j+1+k)).config e (goodAfterPhaseCut cs ε M deadline start hn j k v x)).Valid B := by
  apply observedWitness_valid
  exact sourceCutTerminal_consistent (cs (j+1+k)).config ε M _ _ _ hn _ _

theorem goodAfterPhaseCut_expected_source_free {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n)
    (C L : Finset (Grid n)) (hn : 0<n) (hB : 0<B)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hCL : C⊆L)
    (j k : ℕ) (v : ℝ) (s : GoodPhaseObservation n B) :
    (∫ω,mixed Γ C ∅ L (observedWitness (cs (j+1+k)).config e
      (goodAfterPhaseCut cs ε M deadline start hn j k v (s,ω))) ∂boardClockMeasure n (B/n))≤
      goodPhaseMixed Γ e C ∅ L s :=
  (goodContinuationCut_expected_source_free cs ε M deadline start Γ e C L hn hB hΓ hK hCL
    (j+1) k v (goodPhaseDeadline deadline (phaseEndpoint cs start (j+1)) s)).trans
      (goodPhaseDeadline_mixed_le e Γ C ∅ L deadline _ s)

def goodThroughPhaseCut {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) (v : ℝ)
    (x : GoodPhaseObservation n B×BoardClockPath n) : TimedObservation (cs (j+1+k)).config :=
  goodAfterPhaseCut cs ε M deadline start hn j k v
    (goodPhaseRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn x)

theorem goodThroughPhaseCut_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) (v : ℝ) :
    Measurable (goodThroughPhaseCut cs ε M deadline start hn j k v) :=
  (goodAfterPhaseCut_measurable cs ε M deadline start hn j k v).comp
    (goodPhaseRecycledPair_measurable (cs j).config ε M _ hn)

theorem goodThroughPhaseCut_original {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (j k : ℕ) (v : ℝ) (ω : BoardClockPath n) :
    goodThroughPhaseCut cs ε M deadline start hn j k v (goodPhases cs ε M deadline start hn s j ω)=
      scheduledCutObservation cs ε M deadline start hn s (j+1+k) (ω,v) :=
  goodContinuationCut_original cs ε M deadline start hn s (j+1) k v ω

theorem goodThroughPhaseCut_history_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n)
    (C L : Finset (Grid n)) (hn : 0<n) (hB : 0<B)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hCL : C⊆L)
    (j k i : ℕ) (v : ℝ) (s : GoodPhaseObservation n B)
    (F : (Fin (i+1)→TimedObservation (cs j).config)→ℝ) (hF : Measurable F)
    (A : ℝ) (hFA : ∀x,0≤F x ∧ F x≤A) :
    (∫ω,mixed Γ C ∅ L (observedWitness (cs (j+1+k)).config e
        (goodThroughPhaseCut cs ε M deadline start hn j k v (s,ω)))*
      F (observedPast (cs j).config ε M (phaseEndpoint cs start j) hn
        (goodPhaseStart (cs j).config ε M s).val i ω) ∂boardClockMeasure n (B/n))≤
    ∫ω,goodPhaseMixed Γ e C ∅ L (goodPhaseRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn (s,ω)).1*
      F (observedPast (cs j).config ε M (phaseEndpoint cs start j) hn
        (goodPhaseStart (cs j).config ε M s).val i ω) ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let P := Fin (i+1)→TimedObservation cfg
  let tr := fun ω : BoardClockPath n=>goodPhaseRecycledPair cfg ε M t₀ hn (s,ω)
  let past := observedPast cfg ε M t₀ hn (goodPhaseStart cfg ε M s).val i
  let H := fun ω=>(past ω,(tr ω).1)
  have ht : Measurable tr := (goodPhaseRecycledPair_measurable cfg ε M t₀ hn).comp
    (measurable_const.prodMk measurable_id)
  have hH : Measurable H := (observedPast_measurable cfg ε M t₀ hn _ i).prodMk ht.fst
  letI : IsProbabilityMeasure (ν.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let f := fun x : (P×GoodPhaseObservation n B)×BoardClockPath n=>
    mixed Γ C ∅ L (observedWitness (cs (j+1+k)).config e
      (goodAfterPhaseCut cs ε M deadline start hn j k v (x.1.2,x.2)))*F x.1.1
  let g := fun x : (P×GoodPhaseObservation n B)×BoardClockPath n=>goodPhaseMixed Γ e C ∅ L x.1.2*F x.1.1
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
  apply independent_pair_le_integrals ν ν H (fun ω=>(tr ω).2) hH ht.snd
    (goodPhasePast_terminal_residual_product cfg ε M t₀ hn hB s i) f g hf hg
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (mixedCap C B*A) hfB)
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (mixedCap C B*A) hgB)
  intro a
  change (∫ω,mixed Γ C ∅ L (observedWitness (cs (j+1+k)).config e
    (goodAfterPhaseCut cs ε M deadline start hn j k v (a.2,ω)))*F a.1 ∂ν)≤_
  rw [integral_mul_const]
  have hh := mul_le_mul_of_nonneg_right
    (goodAfterPhaseCut_expected_source_free cs ε M deadline start Γ e C L hn hB hΓ hK hCL j k v a.2)
    (hFA a.1).1
  simpa [g,ν] using hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodThroughPhaseCut_original
#print axioms NoThreeLine.BirthWitness.goodThroughPhaseCut_history_le
