import NoThreeLine.BirthTerminalCompensation
import NoThreeLine.FiniteCalendarIntegral

/-! Actual physical elapsed endpoints and the measurable birth-rate
segments, parameterized by real time on the original board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def birthCalendarTime {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  s.val.2-(augRecycledPair cfg ε M hn s k ω).1.val.2

theorem birthCalendarTime_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) : Measurable (birthCalendarTime cfg ε M hn s k) :=
  measurable_const.sub (measurable_subtype_coe.comp (augRecycledPair_measurable cfg ε M hn s k).fst).snd

theorem birthCalendarTime_zero {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) : birthCalendarTime cfg ε M hn s 0 ω=0 := by
  simp [birthCalendarTime,augRecycledPair,RecycledBoardProcess.iterate]

theorem birthCalendarTime_succ_sub {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    birthCalendarTime cfg ε M hn s (k+1) ω-birthCalendarTime cfg ε M hn s k ω=
      birthElapsed cfg ε M ((augRecycledPair cfg ε M hn s k ω).1,
        WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2) := by
  rw [birthElapsed_eq_remaining_drop]
  change (s.val.2-(augTimedClockStep cfg ε M hn (augRecycledPair cfg ε M hn s k ω)).val.2)-
    (s.val.2-(augRecycledPair cfg ε M hn s k ω).1.val.2)=_
  dsimp [augTimedClockStep]
  ring

theorem birthCalendarTime_monotone {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) :
    Monotone (fun k=>birthCalendarTime cfg ε M hn s k ω) := by
  apply monotone_nat_of_le_succ
  intro k
  have hg := birthCalendarTime_succ_sub cfg ε M hn s k ω
  have hb := (birthElapsed_mem cfg ε M
    ((augRecycledPair cfg ε M hn s k ω).1,
      WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2)).1
  linarith

theorem birthCalendarTime_mem {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    birthCalendarTime cfg ε M hn s k ω∈Icc (0:ℝ) (cfg.horizon:ℝ) := by
  constructor
  · have h := birthCalendarTime_monotone cfg ε M hn s ω (Nat.zero_le k)
    simpa only [birthCalendarTime_zero] using h
  · exact (sub_le_self _ (augRecycledPair cfg ε M hn s k ω).1.property.2.1).trans s.property.2.2

def birthCalendarSegment {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (x : BoardClockPath n × ℝ) : ℝ :=
  CalendarIntegral.shiftedSegment (birthCalendarTime cfg ε M hn s k x.1)
    (birthCalendarTime cfg ε M hn s (k+1) x.1)
      (fun t=>cappedBirthRate cfg ε M p ((augRecycledPair cfg ε M hn s k x.1).1,t)) x.2

theorem birthCalendarSegment_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) : Measurable (birthCalendarSegment cfg ε M p hn s k) := by
  have ha : Measurable (fun x : BoardClockPath n × ℝ=>birthCalendarTime cfg ε M hn s k x.1) :=
    (birthCalendarTime_measurable cfg ε M hn s k).comp measurable_fst
  have hb : Measurable (fun x : BoardClockPath n × ℝ=>birthCalendarTime cfg ε M hn s (k+1) x.1) :=
    (birthCalendarTime_measurable cfg ε M hn s (k+1)).comp measurable_fst
  have hs : Measurable (fun x : BoardClockPath n × ℝ=>(augRecycledPair cfg ε M hn s k x.1).1) :=
    (augRecycledPair_measurable cfg ε M hn s k).fst.comp measurable_fst
  exact Measurable.ite ((ha.lt measurable_snd).and (measurable_snd.lt hb)).setOf
    ((cappedBirthRate_measurable cfg ε M p).comp (hs.prodMk (measurable_snd.sub ha))) measurable_const

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.birthCalendarTime_succ_sub
#print axioms NoThreeLine.BirthWitness.birthCalendarSegment_measurable
