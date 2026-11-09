import NoThreeLine.LineSectionContactBoundary
import NoThreeLine.LineSectionCandidateRegular

/-! Reachable support of a permanent contact flag: its saved mass is large,
or the physical root is already permanently closed. The actual exponential
race supplies all no-tie conditions simultaneously. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem markedSectionMassSupport_measurable {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (MarkedSectionMassSupport cfg L p E A) := by
  have hm := (actualLineSectionMass_measurable L p E).comp
    (measurable_fst.snd.snd : Measurable (fun s : MarkedLineSectionObservation cfg => s.1.2.2))
  exact (measurable_snd.eq_const true).imp ((measurable_const.le' hm).or
    ((phaseRootClosed_measurable p).comp ((observedTimedProjection_measurable cfg).comp measurable_fst.fst)))

theorem goodMarkedIterate_massSupport {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (hs : MarkedSectionMassSupport cfg L p E A s.val)
    (ω : BoardClockPath n)
    (hr : ∀ k, markedSectionCandidateRegular cfg L p E A hn
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω)) :
    ∀ k, MarkedSectionMassSupport cfg L p E A
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val := by
  intro k
  induction k with
  | zero => exact hs
  | succ k ih =>
    exact markedLineSectionStep_massSupport cfg ε M start L p E A _ _
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.property.1
      ih (hr k).1 (hr k).2

theorem markedSectionTerminal_massSupport_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : GoodMarkedLineSection cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n),
      MarkedSectionMassSupport cfg L p E A s.val →
        MarkedSectionMassSupport cfg L p E A
          (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val := by
  filter_upwards [markedSectionIterate_all_candidateRegular_ae cfg ε M start L p E A hn
    (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s] with ω hω
  intro hs
  exact goodMarkedIterate_massSupport cfg ε M start L p E A hn s hs ω hω _

theorem goodMarkedIterate_physicalClosed {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p)
    (hs : phaseRootClosed p (observedTimedProjection cfg s.val.1.1))
    (k : ℕ) (ω : BoardClockPath n) :
    phaseRootClosed p (observedTimedProjection cfg
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val.1.1) := by
  induction k with
  | zero => exact hs
  | succ k ih =>
    change phaseRootClosed p (observedTimedProjection cfg
      (lineSectionObserverStep cfg ε M start L p E A _).1)
    rw [lineSectionObserverStep_projection]
    exact observedStep_permanentRootClosed cfg ε M start p _ _ ih

theorem markedSectionTerminal_physicalClosed {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p)
    (hs : phaseRootClosed p (observedTimedProjection cfg s.val.1.1)) (ω : BoardClockPath n) :
    phaseRootClosed p (observedTimedProjection cfg
      (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.1) :=
  goodMarkedIterate_physicalClosed cfg ε M start L p E A hn s hs _ ω

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.markedSectionMassSupport_measurable
#print axioms NoThreeLine.BirthWitness.markedSectionTerminal_massSupport_ae
#print axioms NoThreeLine.BirthWitness.markedSectionTerminal_physicalClosed
