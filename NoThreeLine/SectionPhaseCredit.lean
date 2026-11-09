import NoThreeLine.SectionRecycledCredit
import NoThreeLine.ScheduledExpiredRisk
import NoThreeLine.ScheduledLineCreditLoss

/-! Actual phase/deadline telescoping of the section-controlled line-credit
budget. Physical closure is absorbing, and the terminal selector is used
only as a finite index, with no claim of completion on fallback paths. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem observedScheduledPair_permanentRootClosed {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (p : Grid n) (j : ℕ) (s : PhaseObservation n B) (ω : BoardClockPath n)
    (hs : phaseRootClosed p s) :
    phaseRootClosed p (observedScheduledPair cs ε M deadline start hn j (s,ω)).1 := by
  apply observedDeadline_rootClosed
  exact observedRecycledTerminal_permanentRootClosed (cs j).config ε M (phaseEndpoint cs start j) p hn
    (observedPhaseStart (cs j).config ε M s) hs ω

theorem observedScheduledPair_section_credit_budget {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0≤B) (L : LineIndex n) (p : Grid n) (hpL : p∈L.val)
    (δ : ℝ) (hδ : 0≤δ) (j : ℕ) (hmask : ∀q,(cs j).mask q=0 ∨ (cs j).mask q=1)
    (s : PhaseObservation n B) (ω : BoardClockPath n)
    (hopen : ¬phaseRootClosed p (observedScheduledPair cs ε M deadline start hn j (s,ω)).1)
    (hgood : ∀k,¬lineSectionAllTimeExceedance (cs j).config ε M L p (binaryMaskSupport (cs j).mask)
      ((((L.val∩binaryMaskSupport (cs j).mask).erase p).card:ℝ)+δ*(n:ℝ))
      ((observedRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn
        (observedPhaseStart (cs j).config ε M s) k ω).1,
       WinnerMarkLaw.firstMarkedRace hn (observedRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn
        (observedPhaseStart (cs j).config ε M s) k ω).2)) :
    s.1.val.physical.lineCredits L-(observedScheduledPair cs ε M deadline start hn j (s,ω)).1.1.val.physical.lineCredits L ≤
      (cs j).horizon*(binaryLineInputRate (cs j).mask L p+δ+B/n) := by
  let cfg := (cs j).config
  let ts := observedPhaseStart cfg ε M s
  let terminal := observedRecycledTerminal cfg ε M (phaseEndpoint cs start j) hn (ts,ω)
  have ht : ¬phaseRootClosed p (observedTimedProjection cfg terminal) := by
    intro h
    exact hopen (observedDeadline_rootClosed deadline (phaseEndpoint cs start (j+1)) _ p h)
  have hi := observedRecycled_no_section_credit_budget cfg ε M (phaseEndpoint cs start j) hn hB hmask
    L p hpL δ ts ω (augRecycledCompletionIndex cfg ε M hn ts.1 ω) ht (fun k _=>hgood k)
  have hc : 0≤binaryLineInputRate (cs j).mask L p+δ+B/n := add_nonneg
    (add_nonneg (binaryLineInputRate_nonneg _ (cs j).mask_nonneg L p) hδ) (div_nonneg hB (Nat.cast_nonneg n))
  have hr := terminal.1.property.2.1
  have hline : (observedScheduledPair cs ε M deadline start hn j (s,ω)).1.1.val.physical.lineCredits L =
      terminal.1.val.1.physical.lineCredits L := by
    change (augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1)) _).val.physical.lineCredits L=_
    rw [augValidDeadlineRetirement_lineCredits]
    rfl
  rw [hline]
  change s.1.val.physical.lineCredits L-terminal.1.val.1.physical.lineCredits L ≤
    ((cs j).horizon-terminal.1.val.2)*(binaryLineInputRate (cs j).mask L p+δ+B/n) at hi
  nlinarith [mul_nonneg hr hc]

theorem observedPhases_section_credit_budget {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0≤B) (L : LineIndex n) (p : Grid n) (hpL : p∈L.val)
    (δ : ℝ) (hδ : 0≤δ) (s : PhaseObservation n B) (ω : BoardClockPath n) (J : ℕ)
    (hmask : ∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1)
    (hopen : ¬phaseRootClosed p (observedRecycledPhaseState cs ε M deadline start hn s J ω))
    (hgood : ∀j<J,∀k,¬lineSectionAllTimeExceedance (cs j).config ε M L p (binaryMaskSupport (cs j).mask)
      ((((L.val∩binaryMaskSupport (cs j).mask).erase p).card:ℝ)+δ*(n:ℝ))
      ((phaseObservedStepPair cs ε M deadline start hn s j k ω).1,
       WinnerMarkLaw.firstMarkedRace hn (phaseObservedStepPair cs ε M deadline start hn s j k ω).2)) :
    s.1.val.physical.lineCredits L-(observedRecycledPhaseState cs ε M deadline start hn s J ω).1.val.physical.lineCredits L ≤
      ∑j∈Finset.range J,(cs j).horizon*(binaryLineInputRate (cs j).mask L p+δ+B/n) := by
  induction J with
  | zero => simp [observedRecycledPhaseState,observedRecycledPhases,RecycledBoardProcess.iterate]
  | succ J ih =>
    let sj := observedRecycledPhaseState cs ε M deadline start hn s J ω
    let ωj := (observedRecycledPhases cs ε M deadline start hn s J ω).2
    have he : observedRecycledPhaseState cs ε M deadline start hn s (J+1) ω =
        (observedScheduledPair cs ε M deadline start hn J (sj,ωj)).1 := by
      unfold observedRecycledPhaseState
      rw [observedRecycledPhases_succ]
      rfl
    have hopen' : ¬phaseRootClosed p (observedScheduledPair cs ε M deadline start hn J (sj,ωj)).1 := by
      rwa [he] at hopen
    have hpold : ¬phaseRootClosed p sj := fun h=>hopen'
      (observedScheduledPair_permanentRootClosed cs ε M deadline start hn p J sj ωj h)
    have hi := ih (fun j hj=>hmask j (by omega)) hpold (fun j hj=>hgood j (by omega))
    have hs := observedScheduledPair_section_credit_budget cs ε M deadline start hn hB L p hpL δ hδ J
      (hmask J (by omega)) sj ωj hopen' (hgood J (by omega))
    rw [he,Finset.sum_range_succ]
    change s.1.val.physical.lineCredits L-sj.1.val.physical.lineCredits L ≤ _ at hi
    linarith

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedScheduledPair_section_credit_budget
#print axioms NoThreeLine.BirthWitness.observedPhases_section_credit_budget
