import NoThreeLine.ScheduledCutHierarchy

/-! The actual inherited phase observation is cut using its actual residual
original board. Full birth records are retained; no fresh initial state is
inserted at later phases. This defines a deterministic cut, not a claim of
future terminal-density consistency for all cut-history observables. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness

def phaseCutObservation {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : (GoodPhaseObservation n cfg.B×ℝ)×BoardClockPath n) : TimedObservation cfg :=
  sourceCutTerminal cfg ε M start (elapsedCutAmount cfg.horizon x.1.2)
    (elapsedCutAmount cfg.horizon x.1.2).coe_nonneg hn (goodPhaseStart cfg ε M x.1.1) x.2

theorem phaseCutObservation_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n) :
    Measurable (phaseCutObservation cfg ε M start hn) := by
  have hf : Measurable (fun x : (GoodPhaseObservation n cfg.B×ℝ)×BoardClockPath n=>
      ((goodPhaseStart cfg ε M x.1.1,elapsedCutAmount cfg.horizon x.1.2),x.2)) :=
    (((goodPhaseStart_measurable cfg ε M).comp measurable_fst.fst).prodMk
      ((elapsedCutAmount_measurable cfg.horizon).comp measurable_fst.snd)).prodMk measurable_snd
  convert (sourceCutTerminal_state_joint_measurable cfg ε M start hn).comp hf using 1
  rfl

def scheduledCutObservation {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (k : ℕ) (x : BoardClockPath n×ℝ) : TimedObservation (cs k).config :=
  let y := goodPhases cs ε M deadline start hn s k x.1
  phaseCutObservation (cs k).config ε M (phaseEndpoint cs start k) hn ((y.1,x.2),y.2)

theorem scheduledCutObservation_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) :
    Measurable (scheduledCutObservation cs ε M deadline start hn s k) := by
  have hg := (goodPhases_measurable cs ε M deadline start hn s k).comp
    (measurable_fst : Measurable (Prod.fst : BoardClockPath n×ℝ→_))
  exact (phaseCutObservation_measurable (cs k).config ε M _ hn).comp
    ((hg.fst.prodMk measurable_snd).prodMk hg.snd)

def scheduledCutWitness {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (hn : 0<n)
    (s : GoodPhaseObservation n B) (k : ℕ) (x : BoardClockPath n×ℝ) : WitnessState n :=
  observedWitness (cs k).config e (scheduledCutObservation cs ε M deadline start hn s k x)

theorem scheduledCutWitness_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (hn : 0<n)
    (s : GoodPhaseObservation n B) (k : ℕ) :
    Measurable (scheduledCutWitness cs ε M deadline start e hn s k) :=
  (observedWitness_measurable (cs k).config e).comp
    (scheduledCutObservation_measurable cs ε M deadline start hn s k)

theorem scheduledCutWitness_valid {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (hn : 0<n)
    (s : GoodPhaseObservation n B) (k : ℕ) (x : BoardClockPath n×ℝ) :
    (scheduledCutWitness cs ε M deadline start e hn s k x).Valid B := by
  apply observedWitness_valid
  exact sourceCutTerminal_consistent (cs k).config ε M _ _ _ hn _ _

theorem scheduledCutMixed_eq_witness {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodPhaseObservation n B) (k : ℕ) (x : BoardClockPath n×ℝ) :
    scheduledCutMixed cs ε M deadline start e C D L hn s k x=
      mixed (cs k).directions C D L (scheduledCutWitness cs ε M deadline start e hn s k x) := rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutObservation_measurable
#print axioms NoThreeLine.BirthWitness.scheduledCutWitness_valid
