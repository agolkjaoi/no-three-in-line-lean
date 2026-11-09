import NoThreeLine.LineSectionStrictCross
import NoThreeLine.LineSectionTerminal

/-! Countable actual-step contact events are captured by one terminal
snapshot, using actual completion only almost everywhere. No union factor in
time or number of updates is introduced. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Filter

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

def lineSectionContactAt {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) (k : ℕ) (ω : BoardClockPath n) : Prop :=
  let v := RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s k ω
  v.1.val.2.1 = false ∧
    selectedLineSectionTime cfg L p E A (augTimedInput cfg v.1.val.1.1).1.1 <
      augAdvance cfg ε M (augTimedInput cfg v.1.val.1.1,(WinnerMarkLaw.firstMarkedRace hn v.2).1.1)

theorem lineSectionContactAt_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) (k : ℕ) :
    Measurable (lineSectionContactAt cfg ε M start L p E A hn s k) := by
  have hv := RecycledBoardProcess.iterate_measurable _
    (goodLineSectionRestart_measurable cfg ε M start L p E A hn) s k
  have hs := measurable_subtype_coe.comp hv.fst
  apply (hs.snd.fst.eq measurable_const).and
  exact Measurable.lt
    ((selectedLineSectionTime_measurable cfg L p E A).comp
      ((augTimedInput_measurable cfg).comp hs.fst.fst).fst.fst)
    ((augAdvance_measurable cfg ε M).comp
      (((augTimedInput_measurable cfg).comp hs.fst.fst).prodMk
        (((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hv.snd).fst.fst)))

theorem lineSectionContact_exists_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) :
    MeasurableSet {ω | ∃ k, lineSectionContactAt cfg ε M start L p E A hn s k ω} := by
  simpa only [Set.setOf_exists] using MeasurableSet.iUnion
    (fun k => (lineSectionContactAt_measurable cfg ε M start L p E A hn s k).setOf)

theorem lineSectionContactAt_post {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) (k : ℕ) (ω : BoardClockPath n)
    (h : lineSectionContactAt cfg ε M start L p E A hn s k ω) :
    (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s (k+1) ω).val.2.1 = true ∧
      A ≤ actualLineSectionMass L p E
        (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s (k+1) ω).val.2.2 := by
  have hh := lineSectionObserverStep_interior_contact cfg ε M start L p E A
    (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).val
    (WinnerMarkLaw.firstMarkedRace hn
      (RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).2)
    (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).property.1 h.1 h.2
  exact ⟨hh.1,hh.2.2⟩

theorem lineSectionContact_terminal_capture_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : GoodLineSectionObservation cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n),
      (∃ k, lineSectionContactAt cfg ε M start L p E A hn s k ω) →
        A ≤ actualLineSectionMass L p E (lineSectionTerminal cfg ε M start L p E A hn s ω).val.2.2 := by
  filter_upwards [lineSectionTerminal_stable_ae cfg ε M start L p E A hn hB s] with ω hω
  rintro ⟨k,hk⟩
  have hp := lineSectionContactAt_post cfg ε M start L p E A hn s k ω hk
  obtain ⟨j,hj,hj'⟩ := (hω.and (eventually_ge_atTop (k+1))).exists
  have he := goodLineSection_frozen_stable cfg ε M start L p E A hn s ω (k+1) hp.1 j hj'
  have hs := congrArg (fun v : Bool × AugmentedState n => actualLineSectionMass L p E v.2)
    (hj.symm.trans he)
  exact hs.symm ▸ hp.2

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionContact_exists_measurable
#print axioms NoThreeLine.BirthWitness.lineSectionContact_terminal_capture_ae
