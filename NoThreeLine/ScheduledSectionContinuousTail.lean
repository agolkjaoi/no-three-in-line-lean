import NoThreeLine.LineSectionContinuousEvent
import NoThreeLine.PhaseSectionExceedance

/-! Actual continuous strict mass exceedances on positive executed times,
on the unchanged original phase process, obey the one-snapshot C22 moment
tail. The event is measurable without a time-union penalty. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem goodMarkedIterate_actual_pair {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (k : ℕ) (ω : BoardClockPath n) :
    ((RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val.1.1,
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).2) =
      observedRecycledPair cfg ε M start hn s.val.1.1 k ω := by
  have h := congrArg (fun v : GoodLineSectionObservation cfg p × BoardClockPath n => (v.1.val.1,v.2))
    (goodMarkedIterate_core cfg ε M start L p E A hn s k ω)
  exact h.trans (goodLineSectionRecycled_projection cfg ε M start L p E A hn (goodMarkedCore cfg p s) k ω)

def markedSectionContinuousAt {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (k : ℕ) (x : GoodMarkedLineSection cfg p × BoardClockPath n) : Prop :=
  let v := RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) x.1 k x.2
  lineSectionContinuousExceedance cfg ε M L p E A (v.1.val.1.1,WinnerMarkLaw.firstMarkedRace hn v.2)

theorem markedSectionContinuousAt_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (k : ℕ) :
    Measurable (markedSectionContinuousAt cfg ε M start L p E A hn k) := by
  have hv := RecycledBoardProcess.iterate_joint_measurable _ (goodMarkedRestart_measurable cfg ε M start L p E A hn) k
  exact (lineSectionContinuousExceedance_measurable cfg ε M L p E A).comp
    (hv.fst.subtype_val.fst.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hv.snd))

theorem markedSectionContinuousAt_cover {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (k : ℕ)
    (x : GoodMarkedLineSection cfg p × BoardClockPath n)
    (hx : markedSectionContinuousAt cfg ε M start L p E A hn k x) :
    markedSectionExceededAt cfg ε M start L p E A hn k x := by
  obtain ⟨ha,t,ht,hta,hm⟩ := hx
  exact markedSectionExceededAt_of_strict_mass cfg ε M start L p E A hn x.1 x.2 k t ht ha hta hm

def scheduledSectionContinuousAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p)
    (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  markedSectionContinuousAt (cs N).config ε M (phaseEndpoint cs start N) L p E A hn k
    (goodPhaseSectionStart (cs N).config ε M p (phaseSectionRecycledState cs ε M deadline start L p E A hn s N ω),
      (phaseSectionRecycledPair cs ε M deadline start L p E A hn s N ω).2)

theorem scheduledSectionContinuousAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p) (N k : ℕ) :
    Measurable (scheduledSectionContinuousAt cs ε M deadline start L p E A hn s N k) := by
  have hv := phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn s N
  exact (markedSectionContinuousAt_measurable (cs N).config ε M (phaseEndpoint cs start N) L p E A hn k).comp
    (((goodPhaseSectionStart_measurable (cs N).config ε M p).comp hv.fst.snd).prodMk hv.snd)

def scheduledSectionContinuousBefore {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p) (J : ℕ) :
    Set (BoardClockPath n) := {ω | ∃ N < J, ∃ k, scheduledSectionContinuousAt cs ε M deadline start L p E A hn s N k ω}

theorem scheduledSectionContinuousBefore_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodPhaseLineSection n B p) (J : ℕ) :
    MeasurableSet (scheduledSectionContinuousBefore cs ε M deadline start L p E A hn s J) := by
  apply Measurable.setOf
  exact Measurable.exists (fun N => measurable_const.and
    (Measurable.exists (fun k => scheduledSectionContinuousAt_measurable cs ε M deadline start L p E A hn s N k)))

theorem scheduledSectionContinuousBefore_subset_cover {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodPhaseLineSection n B p) (J : ℕ) :
    scheduledSectionContinuousBefore cs ε M deadline start L p E A hn s J ⊆
      scheduledSectionExceededBefore cs ε M deadline start L p E A hn s J := by
  rintro ω ⟨N,hN,k,hk⟩
  exact ⟨N,hN,k,markedSectionContinuousAt_cover (cs N).config ε M (phaseEndpoint cs start N) L p E A hn k _ hk⟩

theorem initial_phaseSectionPoint_continuous_tail {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hA : 0 < A)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (m : ℕ) (hm : 0 < m) (J : ℕ) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      (scheduledSectionContinuousBefore cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J) ≤
      (((((L.val ∩ E).erase p).card:ℝ)^m +
        ∑ d ∈ Finset.Ico 1 m, B^(m-d)*(d:ℝ)^m*(((L.val ∩ E).erase p).card:ℝ)^d)/(1-ε)^(m+1).choose 2)/A^m := by
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  exact (measureReal_mono (scheduledSectionContinuousBefore_subset_cover cs ε M deadline start L p E A hn _ J)).trans
    (initial_phaseSectionPoint_exceedance_cover_tail L p E A hA Γ hL hpL cs ε M deadline start hn hB hp hΓ hK hε0 hε m hm J)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodMarkedIterate_actual_pair
#print axioms NoThreeLine.BirthWitness.scheduledSectionContinuousBefore_measurableSet
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_continuous_tail
