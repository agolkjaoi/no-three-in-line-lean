import NoThreeLine.ObservedCutIteration
import NoThreeLine.SourceCutInterval

/-! On each strict original update interval the reconstructed cut is the
actual sourceCutTerminal, with the same physical/eta state and birth records.
The future-credit tower therefore applies to its real observable pullback. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open EtaMixedGenerator

theorem elapsedTime_eq_observed_remaining {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (i : ℕ) (ω : BoardClockPath n) :
    elapsedTime cfg ε M start hn s i ω=
      s.val.1.val.2-(observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2 := by
  have hp := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M start hn s i ω)
  simp only [Prod.fst] at hp
  unfold elapsedTime
  rw [hp]

theorem sourceCutTerminal_eq_interiorCut_of_crossing {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (i : ℕ)
    (ω : BoardClockPath n)
    (hx : crossesCut cfg δ (observedRecycledPair cfg ε M start hn s.val i ω).1
      (observedRecycledPair cfg ε M start hn s.val (i+1) ω).1) :
    sourceCutTerminal cfg ε M start δ hδ hn s ω=
      interiorCutObservation cfg ε M start δ hδ hn (observedRecycledPair cfg ε M start hn s.val i ω).1 := by
  have ht : s.val.1.val.2-δ∈Ioo (elapsedTime cfg ε M start hn s i ω)
      (elapsedTime cfg ε M start hn s (i+1) ω) := by
    rw [elapsedTime_eq_observed_remaining,elapsedTime_eq_observed_remaining]
    exact ⟨by linarith [hx.2],by linarith [hx.1]⟩
  have hc := crossesCut_context cfg ε M start δ
    (observedRecycledPair cfg ε M start hn s.val i ω).1
    (WinnerMarkLaw.firstMarkedRace hn (observedRecycledPair cfg ε M start hn s.val i ω).2) hx
  have hprobe := interiorCutObservation_eq cfg ε M start δ hδ hn
    (observedRecycledPair cfg ε M start hn s.val i ω).1 hc.1 hc.2.1 hc.2.2.1
  have hcut := sourceCutTerminal_interior cfg ε M start δ hδ hn s i ω ht
  dsimp only at hcut
  have hp := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M start hn s i ω)
  simp only [Prod.fst] at hp
  rw [hp] at hcut
  have htime : s.val.1.val.2-δ-elapsedTime cfg ε M start hn s i ω=
      (observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2-δ := by
    rw [elapsedTime_eq_observed_remaining]
    ring
  rw [htime] at hcut
  exact Prod.ext (Subtype.ext (hcut.1.trans hprobe.1.symm)) (hcut.2.trans hprobe.2.symm)

theorem observedFuture_actual_cut_interval {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (hB : 0<B)
    (j k i : ℕ) (s : GoodObservation (cs j).config) (p : Grid n)
    (F : TimedObservation (cs j).config→ℝ) (hF : Measurable F)
    (C : ℝ) (hFC : ∀v,0≤F v ∧ F v≤C) :
    let cfg := (cs j).config
    let t₀ := phaseEndpoint cs start j
    (∫ω,if crossesCut cfg δ (observedRecycledPair cfg ε M t₀ hn s.val i ω).1
        (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1 then
      validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1*
        F (sourceCutTerminal cfg ε M t₀ δ hδ hn s ω) else 0
      ∂boardClockMeasure n (B/n))=
    ∫ω,if crossesCut cfg δ (observedRecycledPair cfg ε M t₀ hn s.val i ω).1
        (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1 then
      augTimedCredit cfg p (sourceCutTerminal cfg ε M t₀ δ hδ hn s ω).1*
        F (sourceCutTerminal cfg ε M t₀ δ hδ hn s ω) else 0
      ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  have hh := observedFuture_crossing_tower cs ε M deadline start δ hδ hn hB j k i s.val p F hF C hFC
  calc
    _ = ∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1*
        cutCrossingTest cfg ε M t₀ δ hδ hn F
          ((observedRecycledPair cfg ε M t₀ hn s.val i ω).1,
           (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1)
        ∂boardClockMeasure n (B/n) := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (fun ω=>by
        by_cases hx : crossesCut cfg δ (observedRecycledPair cfg ε M t₀ hn s.val i ω).1
          (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1
        · dsimp only [cfg,t₀] at hx
          simp only [cfg,t₀,cutCrossingTest,if_pos hx]
          rw [sourceCutTerminal_eq_interiorCut_of_crossing cfg ε M t₀ δ hδ hn s i ω hx]
        · dsimp only [cfg,t₀] at hx
          simp only [cfg,t₀,cutCrossingTest,if_neg hx,mul_zero])
    _ = _ := hh.trans (integral_congr_ae (Filter.Eventually.of_forall (fun ω=>by
      by_cases hx : crossesCut cfg δ (observedRecycledPair cfg ε M t₀ hn s.val i ω).1
        (observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1
      · dsimp only [cfg,t₀] at hx
        simp only [cfg,t₀,cutCrossingTest,if_pos hx]
        rw [sourceCutTerminal_eq_interiorCut_of_crossing cfg ε M t₀ δ hδ hn s i ω hx]
      · dsimp only [cfg,t₀] at hx
        simp only [cfg,t₀,cutCrossingTest,if_neg hx,mul_zero])))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_eq_interiorCut_of_crossing
#print axioms NoThreeLine.BirthWitness.observedFuture_actual_cut_interval
