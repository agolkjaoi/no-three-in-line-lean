import NoThreeLine.ScheduledCutHierarchy

/-! Removing zero remaining time changes nothing. The actual cut at the
phase horizon is therefore its actual terminal observer on every path,
including zero horizons and early stopping. Endpoint deadline retirement
can only decrease the mixed observable. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

theorem sourceRestrictState_zero {n : ℕ} (cfg : FlowConfig n) (s : AugTimedState cfg) :
    sourceRestrictState cfg 0 (le_refl 0) s=s := by
  apply Subtype.ext
  apply Prod.ext
  · rfl
  change max 0 (s.val.2-0)=s.val.2
  simp only [sub_zero,max_eq_right s.property.2.1]

namespace BirthWitness

theorem sourceRestrictGood_zero {n : ℕ} (cfg : FlowConfig n) (s : GoodObservation cfg) :
    sourceRestrictGood cfg 0 (le_refl 0) s=s := by
  apply Subtype.ext
  exact Prod.ext (sourceRestrictState_zero cfg s.val.1) rfl

theorem sourceCutTerminal_zero {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    sourceCutTerminal cfg ε M start 0 (le_refl 0) hn s ω=
      observedRecycledTerminal cfg ε M start hn (s.val,ω) := by
  simp only [sourceCutTerminal,sourceRestrictGood_zero,sub_zero]

theorem elapsedCutAmount_self (H : ℝ) : elapsedCutAmount H H=0 := by
  apply Subtype.ext
  change max 0 (H-H)=(0:ℝ)
  simp

theorem phaseCutMixed_horizon {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodPhaseObservation n cfg.B) (ω : BoardClockPath n) :
    phaseCutMixed cfg ε M start e C D L hn ((s,cfg.horizon),ω)=
      goodPhaseMixed cfg.directions e C D L (goodPhaseRecycledPair cfg ε M start hn (s,ω)).1 := by
  simp only [phaseCutMixed,elapsedCutAmount_self,NNReal.coe_zero,sourceCutTerminal_zero]
  rfl

theorem scheduledMixed_le_endpointCut {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) (ω : BoardClockPath n) :
    goodPhaseMixed (cs k).directions e C D L (goodPhases cs ε M deadline start hn s (k+1) ω).1≤
      scheduledCutMixed cs ε M deadline start e C D L hn s k (ω,(cs k).horizon) := by
  change goodPhaseMixed (cs k).directions e C D L
      (goodPhaseDeadline deadline (phaseEndpoint cs start (k+1))
        (goodPhaseRecycledPair (cs k).config ε M (phaseEndpoint cs start k) hn
          (goodPhases cs ε M deadline start hn s k ω)).1)≤
    phaseCutMixed (cs k).config ε M (phaseEndpoint cs start k) e C D L hn
      (((goodPhases cs ε M deadline start hn s k ω).1,(cs k).horizon),
        (goodPhases cs ε M deadline start hn s k ω).2)
  rw [phaseCutMixed_horizon]
  exact goodPhaseDeadline_mixed_le e _ C D L deadline _ _

theorem finitePhase_mixed_le_endpointCutMean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (k : ℕ) :
    (∫ω,goodPhaseMixed (cs k).directions e C D L (goodPhases cs ε M deadline start hn s (k+1) ω).1
      ∂boardClockMeasure n (B/n))≤scheduledCutMean cs ε M deadline start e C D L hn s k (cs k).horizon := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hf : Measurable (fun ω : BoardClockPath n=>
      scheduledCutMixed cs ε M deadline start e C D L hn s k (ω,(cs k).horizon)) :=
    (scheduledCutMixed_measurable cs ε M deadline start e C D L hn s k).comp
      (measurable_id.prodMk measurable_const)
  exact integral_mono
    (goodPhases_mixed_integrable cs ε M deadline start (cs k).directions e C D L hn hB s (k+1))
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (mixedCap C B)
      (fun _=>phaseCutMixed_bounds (cs k).config ε M _ e C D L hn _))
    (scheduledMixed_le_endpointCut cs ε M deadline start e C D L hn s k)

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_zero
#print axioms NoThreeLine.BirthWitness.phaseCutMixed_horizon
#print axioms NoThreeLine.BirthWitness.finitePhase_mixed_le_endpointCutMean
