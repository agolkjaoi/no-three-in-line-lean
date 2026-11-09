import NoThreeLine.MarkedLineSectionTerminal
import NoThreeLine.CandidateGuardNoTie

/-! The additional line-section contact is a measurable function of the
actual incoming state. Actual board restart products therefore give positive
candidate times distinct from that contact at every finite update. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def markedSectionCandidateRegular {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodMarkedLineSection cfg p × BoardClockPath n) : Prop :=
  0 < BoardFirstCandidate.firstTime hn x.2 ∧
    BoardFirstCandidate.firstTime hn x.2 ≠
      selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.val.1.1.1).1.1

theorem markedSectionCandidateRegular_measurable {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) :
    Measurable (markedSectionCandidateRegular cfg L p E A hn) := by
  have ht : Measurable (fun x : GoodMarkedLineSection cfg p × BoardClockPath n =>
      BoardFirstCandidate.firstTime hn x.2) := (BoardFirstCandidate.firstTime_measurable hn).comp measurable_snd
  have hc : Measurable (fun x : GoodMarkedLineSection cfg p × BoardClockPath n =>
      selectedLineSectionTime cfg L p E A (augTimedInput cfg x.1.val.1.1.1).1.1) :=
    (selectedLineSectionTime_measurable cfg L p E A).comp
    (((augTimedInput_measurable cfg).comp (measurable_subtype_coe.comp measurable_fst).fst.fst.fst).fst.fst)
  exact (measurable_const.lt ht).and (ht.eq hc).not

theorem markedSectionCandidateRegular_ae {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : GoodMarkedLineSection cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n rate, markedSectionCandidateRegular cfg L p E A hn (s,ω) :=
  (BoardFirstCandidate.firstTime_ae_positive hn rate hr).and
    (actualFirstTime_ne_ae hn rate hr (selectedLineSectionTime cfg L p E A (augTimedInput cfg s.val.1.1.1).1.1))

theorem markedSectionIterate_candidateRegular_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : GoodMarkedLineSection cfg p) (k : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n rate, markedSectionCandidateRegular cfg L p E A hn
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω) := by
  letI := boardClockMeasure_probability n rate hr
  let f := RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k
  have hf : Measurable f := RecycledBoardProcess.iterate_measurable _
    (goodMarkedRestart_measurable cfg ε M start L p E A hn) s k
  exact residual_sections_ae (boardClockMeasure n rate) ((boardClockMeasure n rate).map (fun ω => (f ω).1))
    (boardClockMeasure n rate) f hf
    (goodMarkedIterate_residual_product cfg ε M start L p E A hn rate hr s k)
    (markedSectionCandidateRegular cfg L p E A hn) (markedSectionCandidateRegular_measurable cfg L p E A hn)
    (markedSectionCandidateRegular_ae cfg L p E A hn rate hr)

theorem markedSectionIterate_all_candidateRegular_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : GoodMarkedLineSection cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n rate, ∀ k, markedSectionCandidateRegular cfg L p E A hn
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω) :=
  ae_all_iff.mpr (markedSectionIterate_candidateRegular_ae cfg ε M start L p E A hn rate hr s)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.markedSectionCandidateRegular_measurable
#print axioms NoThreeLine.BirthWitness.markedSectionIterate_all_candidateRegular_ae
