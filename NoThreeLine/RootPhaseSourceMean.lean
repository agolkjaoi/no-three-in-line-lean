import NoThreeLine.RootPhaseInvariantKernel
import NoThreeLine.RootFreezeHierarchy

/-! Actual one-phase S7 for the saved-root observer, including deadline
retirement. Its running-source upper term is the actual ordinary source
along the unchanged physical phase; the frozen source is dominated by it. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def phaseRootActualSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (x : GoodPhaseRootObservation n cfg.B p×BoardClockPath n) : ℝ :=
  phaseRunningSource cfg ε M start e C D L hn (goodPhaseRootActual p x.1,x.2)

theorem phaseRootActualSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) :
    Measurable (phaseRootActualSource cfg ε M start p e C D L hn) :=
  (phaseRunningSource_measurable cfg ε M start e C D L hn).comp
    (((goodPhaseRootActual_measurable p).comp measurable_fst).prodMk measurable_snd)

theorem phaseRootActualSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (x : GoodPhaseRootObservation n cfg.B p×BoardClockPath n) :
    0≤phaseRootActualSource cfg ε M start p e C D L hn x ∧
      phaseRootActualSource cfg ε M start p e C D L hn x≤cfg.horizon*sourceCap cfg.directions C D cfg.B cfg.K :=
  phaseRunningSource_bounds cfg ε M start e C D L hn hm hK _

theorem phaseRootScheduled_expected_mixed_source {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B) (j : ℕ)
    (e : Retention n) (C D L : Finset (Grid n)) (hK : (cs j).K<2) (hCL : C⊆L) (hCD : Disjoint C D)
    (s : GoodPhaseRootObservation n B p) :
    (∫ω,goodPhaseRootMixed p (cs j).directions e C D L
      (goodPhaseRootScheduledPair cs ε M deadline start p hn j (s,ω)).1 ∂boardClockMeasure n (B/n))≤
        goodPhaseRootMixed p (cs j).directions e C D L s+
        ∫ω,phaseRootActualSource (cs j).config ε M (phaseEndpoint cs start j) p e C D L hn (s,ω)
          ∂boardClockMeasure n (B/n) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let a := goodPhaseRootStart (cs j).config ε M p s
  let f := fun ω=>mixed (cs j).directions C D L
    (rootBoundaryWitness (cs j).config ε M (phaseEndpoint cs start j) e p hn a.val ω)
  have hf : Measurable f := (mixed_measurable (cs j).directions C D L).comp
    (rootBoundaryWitness_measurable (cs j).config ε M _ e p hn a.val)
  have hfb ω : 0≤f ω ∧ f ω≤mixedCap C B := by
    have hv := rootBoundaryWitness_valid (cs j).config ε M (phaseEndpoint cs start j) e p hn a.val a.property.1 ω
    exact ⟨mixed_nonneg _ (cs j).directions C D L B hv,mixed_le_cap _ (cs j).directions C D L B hv⟩
  have hfi := GenericCreditIteration.bounded_nonnegative_integrable (boardClockMeasure n (B/n)) f hf _ hfb
  have hpost : (∫ω,goodPhaseRootMixed p (cs j).directions e C D L
      (goodPhaseRootScheduledPair cs ε M deadline start p hn j (s,ω)).1 ∂boardClockMeasure n (B/n))≤
      ∫ω,f ω ∂boardClockMeasure n (B/n) := by
    apply integral_mono
      (GenericCreditIteration.bounded_nonnegative_integrable _ _
        ((goodPhaseRootMixed_measurable p (cs j).directions e C D L).comp
          ((goodPhaseRootScheduledPair_measurable cs ε M deadline start p hn j).comp
            (measurable_const.prodMk measurable_id)).fst) _ (fun ω=>goodPhaseRootMixed_bounds _ _ _ _ _ _ _)) hfi
    intro ω
    have hp := congrArg Prod.fst (goodPhaseRootScheduledPair_projection cs ε M deadline start p hn j (s,ω))
    simp only [Prod.fst] at hp
    change mixed (cs j).directions C D L (savedWitness e
      (goodPhaseRootScheduledPair cs ε M deadline start p hn j (s,ω)).1.val.2.2)≤_
    rw [hp]
    exact phaseRootScheduledPair_mixed_le_terminal cs ε M deadline start p hn j e C D L (s.val,ω) s.property.1
  have ht := terminal_expected_rootMixed_running_bound (cs j).config ε M (phaseEndpoint cs start j)
    p e C D L hn hB (cs j).mask_le_one hK hCL hCD a
  have hb := terminalRootRunningSource_mean_le_actual (cs j).config ε M (phaseEndpoint cs start j)
    p e C D L hn hB (cs j).mask_le_one hK a
  have hall := hpost.trans (ht.trans (add_le_add le_rfl hb))
  simpa only [a,goodPhaseRootStart_mixed,goodPhaseRootStart_actual,phaseRootActualSource,phaseRunningSource] using hall

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseRootScheduled_expected_mixed_source
