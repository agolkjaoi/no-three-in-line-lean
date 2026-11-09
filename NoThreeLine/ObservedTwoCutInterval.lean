import NoThreeLine.EarlierCutHistory

/-! Two actual cut observations on one indexed later crossing. The earlier
observation is carried by the full old history; the original full-future
credit density can then be replaced by the later-cut density. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem observedFuture_two_actual_cut_interval {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start a b : ℝ) (ha : 0≤a) (hb : 0≤b)
    (hn : 0<n) (hB : 0<B) (j k i : ℕ) (s : GoodObservation (cs j).config) (p : Grid n)
    (hba : b<a) (hstart : a<s.val.1.val.2)
    (F : TimedObservation (cs j).config×TimedObservation (cs j).config→ℝ)
    (hF : Measurable F) (A : ℝ) (hFA : ∀x,0≤F x ∧ F x≤A)
    (havoid : ∀ᵐω ∂boardClockMeasure n (B/n),∀q,
      a≠(observedRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn s.val q ω).1.1.val.2) :
    let cfg := (cs j).config
    let t₀ := phaseEndpoint cs start j
    (∫ω,if crossesCut cfg b (observedRecycledPair cfg ε M t₀ hn s.val i ω).1
        (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1 then
      validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1*
        F (sourceCutTerminal cfg ε M t₀ a ha hn s ω,sourceCutTerminal cfg ε M t₀ b hb hn s ω) else 0
      ∂boardClockMeasure n (B/n))=
    ∫ω,if crossesCut cfg b (observedRecycledPair cfg ε M t₀ hn s.val i ω).1
        (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1 then
      augTimedCredit cfg p (sourceCutTerminal cfg ε M t₀ b hb hn s ω).1*
        F (sourceCutTerminal cfg ε M t₀ a ha hn s ω,sourceCutTerminal cfg ε M t₀ b hb hn s ω) else 0
      ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let H := earlierCutHistoryValue cfg ε M t₀ a ha hn i F
  have hH : Measurable H := earlierCutHistoryValue_measurable cfg ε M t₀ a ha hn i F hF
  have hHA : ∀x,0≤H x ∧ H x≤(i+1)*A := earlierCutHistoryValue_bounds cfg ε M t₀ a ha hn i F A hFA
  have ht := observedFuture_crossing_history_tower cs ε M deadline start b hb hn hB j k i s.val p H hH
    ((i+1)*A) hHA
  have hprobe : ∀ᵐω ∂boardClockMeasure n (B/n),
      crossesCut cfg b (observedRecycledPair cfg ε M t₀ hn s.val i ω).1
        (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1 →
      H (observedPast cfg ε M t₀ hn s.val i ω,
        interiorCutObservation cfg ε M t₀ b hb hn (observedRecycledPair cfg ε M t₀ hn s.val i ω).1)=
        F (sourceCutTerminal cfg ε M t₀ a ha hn s ω,sourceCutTerminal cfg ε M t₀ b hb hn s ω) := by
    filter_upwards [havoid] with ω hω hx
    have hh := earlierCutHistoryValue_actual cfg ε M t₀ a ha hn s i ω hstart (hx.1.trans hba) hω F
      (interiorCutObservation cfg ε M t₀ b hb hn (observedRecycledPair cfg ε M t₀ hn s.val i ω).1)
    exact hh.trans (congrArg (fun v=>F (sourceCutTerminal cfg ε M t₀ a ha hn s ω,v))
      (sourceCutTerminal_eq_interiorCut_of_crossing cfg ε M t₀ b hb hn s i ω hx).symm)
  calc
    _ = ∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1*
        cutHistoryCrossingTest cfg ε M t₀ b hb hn i H
          ((observedPast cfg ε M t₀ hn s.val i ω,(observedRecycledPair cfg ε M t₀ hn s.val i ω).1),
            (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1)
        ∂boardClockMeasure n (B/n) := by
      apply integral_congr_ae
      filter_upwards [hprobe] with ω hω
      by_cases hx : crossesCut cfg b (observedRecycledPair cfg ε M t₀ hn s.val i ω).1
        (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1
      · dsimp only [cfg,t₀] at hx hω
        simp only [cfg,t₀,cutHistoryCrossingTest,if_pos hx,hω hx]
      · dsimp only [cfg,t₀] at hx
        simp only [cfg,t₀,cutHistoryCrossingTest,if_neg hx,mul_zero]
    _ = _ := ht.trans (integral_congr_ae (by
      filter_upwards [hprobe] with ω hω
      by_cases hx : crossesCut cfg b (observedRecycledPair cfg ε M t₀ hn s.val i ω).1
        (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1
      · dsimp only [cfg,t₀] at hx hω
        simp only [cfg,t₀,cutHistoryCrossingTest,if_pos hx,hω hx]
        rw [←sourceCutTerminal_eq_interiorCut_of_crossing cfg ε M t₀ b hb hn s i ω hx]
      · dsimp only [cfg,t₀] at hx
        simp only [cfg,t₀,cutHistoryCrossingTest,if_neg hx,mul_zero]))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedFuture_two_actual_cut_interval
