import NoThreeLine.SelectedWeightFloor
import NoThreeLine.ScheduledCutLineGuards

/-! A uniform positive active-weight floor on every path of the actual
scheduled process, including inherited deterministic cuts, global stops,
physical deadlines and zero-time phases. No weight-floor premise is needed
at the canonical initial state. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine

theorem augTimedStep_activeWeightFloor {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (hs : s.val.1.physical.process.ActiveWeightFloor cfg.directions)
    (z : (ℝ × Grid n) × ℝ) :
    (augTimedStep cfg ε M (s,z)).val.1.physical.process.ActiveWeightFloor cfg.directions := by
  change (augTimedStepPair cfg ε M (s,z)).1.physical.process.ActiveWeightFloor cfg.directions
  unfold augTimedStepPair
  split_ifs
  · exact hs
  · exact augOutcome_activeWeightFloor cfg ε M (augTimedInput cfg s) s.property.1.1 hs z

theorem augDeadline_activeWeightFloor {n : ℕ} {B : ℝ}
    (Γ : Finset PrimitiveLines.ZPoint) (deadline : Grid n → ℝ) (t : ℝ)
    (s : ValidAugmentedState n B) (hs : s.val.physical.process.ActiveWeightFloor Γ) :
    (augValidDeadlineRetirement deadline t s).val.physical.process.ActiveWeightFloor Γ := by
  unfold augValidDeadlineRetirement
  split_ifs
  · exact hs
  · exact s.val.physical.process.retire_activeWeightFloor Γ hs _

end NoThreeLine

namespace NoThreeLine.BirthWitness

theorem observedRecycledPair_activeWeightFloor {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (hn : 0<n) (s : TimedObservation cfg)
    (hs : s.1.val.1.physical.process.ActiveWeightFloor cfg.directions)
    (k : ℕ) (ω : BoardClockPath n) :
    (observedRecycledPair cfg ε M start hn s k ω).1.1.val.1.physical.process.ActiveWeightFloor
      cfg.directions := by
  induction k with
  | zero => exact hs
  | succ k ih => exact augTimedStep_activeWeightFloor cfg ε M _ ih _

theorem observedRecycledTerminal_activeWeightFloor {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (hn : 0<n) (s : TimedObservation cfg)
    (hs : s.1.val.1.physical.process.ActiveWeightFloor cfg.directions) (ω : BoardClockPath n) :
    (observedRecycledTerminal cfg ε M start hn (s,ω)).1.val.1.physical.process.ActiveWeightFloor
      cfg.directions :=
  observedRecycledPair_activeWeightFloor cfg ε M start hn s hs _ ω

theorem goodScheduledPair_activeWeightFloor {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0<n) (j : ℕ) (s : GoodPhaseObservation n B)
    (hs : s.val.1.val.physical.process.ActiveWeightFloor (cs j).directions) (ω : BoardClockPath n) :
    (goodScheduledPair cs ε M deadline start hn j (s,ω)).1.val.1.val.physical.process.ActiveWeightFloor
      (cs j).directions := by
  apply augDeadline_activeWeightFloor
  exact observedRecycledTerminal_activeWeightFloor (cs j).config ε M _ hn
    (observedPhaseStart (cs j).config ε M s.val) hs ω

theorem goodPhases_activeWeightFloor {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0<n) (Γ : Finset PrimitiveLines.ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (s : GoodPhaseObservation n B) (hs : s.val.1.val.physical.process.ActiveWeightFloor Γ)
    (k : ℕ) (ω : BoardClockPath n) :
    (goodPhases cs ε M deadline start hn s k ω).1.val.1.val.physical.process.ActiveWeightFloor Γ := by
  induction k with
  | zero => exact hs
  | succ k ih =>
    simp only [goodPhases]
    rw [← hΓ k] at ih ⊢
    exact goodScheduledPair_activeWeightFloor cs ε M deadline start hn k _ ih _

theorem sourceCutTerminal_activeWeightFloor {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg)
    (hs : s.val.1.val.1.physical.process.ActiveWeightFloor cfg.directions) (ω : BoardClockPath n) :
    (sourceCutTerminal cfg ε M start δ hδ hn s ω).1.val.1.physical.process.ActiveWeightFloor
      cfg.directions :=
  observedRecycledTerminal_activeWeightFloor cfg ε M (start-δ) hn
    (sourceRestrictGood cfg δ hδ s).val hs ω

theorem scheduledCutWitness_activeWeightFloor {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (e : Retention n) (hn : 0<n) (Γ : Finset PrimitiveLines.ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (s : GoodPhaseObservation n B) (hs : s.val.1.val.physical.process.ActiveWeightFloor Γ)
    (k : ℕ) (x : BoardClockPath n × ℝ) :
    (scheduledCutWitness cs ε M deadline start e hn s k x).augmented.physical.process.ActiveWeightFloor
      Γ := by
  let y := goodPhases cs ε M deadline start hn s k x.1
  have hi : y.1.val.1.val.physical.process.ActiveWeightFloor (cs k).config.directions := by
    rw [show (cs k).config.directions=Γ from hΓ k]
    exact goodPhases_activeWeightFloor cs ε M deadline start hn Γ hΓ s hs k x.1
  have ht := sourceCutTerminal_activeWeightFloor (cs k).config ε M (phaseEndpoint cs start k)
    (elapsedCutAmount (cs k).config.horizon x.2)
    (elapsedCutAmount (cs k).config.horizon x.2).coe_nonneg hn
    (goodPhaseStart (cs k).config ε M y.1) hi y.2
  simpa only [scheduledCutWitness,scheduledCutObservation,phaseCutObservation,observedWitness,
    show (cs k).config.directions=Γ from hΓ k,hΓ k,y] using ht

theorem initial_scheduledCutWitness_activeWeightFloor {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (e : Retention n) (hn : 0<n) (hB : 1≤B) (Γ : Finset PrimitiveLines.ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (k : ℕ) (x : BoardClockPath n × ℝ) :
    (scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k x).augmented.physical.process.ActiveWeightFloor
      Γ := by
  apply scheduledCutWitness_activeWeightFloor cs ε M deadline start e hn Γ hΓ
  exact augDeadline_activeWeightFloor Γ deadline start _
    (ProcessState.initial_activeWeightFloor n Γ)

theorem initial_scheduledCutWitness_active_weight_lower {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (e : Retention n) (hn : 0<n) (hB : 1≤B) (Γ : Finset PrimitiveLines.ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (k : ℕ) (x : BoardClockPath n × ℝ) (p : Grid n)
    (hp : ((scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k x).augmented.physical.process.accounts p).status=.active) :
    (1/2 : ℝ)^Γ.card ≤ ((scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k x).augmented.physical.process.accounts p).weight :=
  ProcessState.activeWeightFloor_uniform _ Γ
    (initial_scheduledCutWitness_activeWeightFloor cs ε M deadline start e hn hB Γ hΓ k x) p hp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCutWitness_activeWeightFloor
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutWitness_active_weight_lower
