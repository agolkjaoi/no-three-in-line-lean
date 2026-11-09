import NoThreeLine.WitnessCrossingIteration
import NoThreeLine.ObservedActualCutInterval

/-! Replace the interior probe by the actual sourceCutTerminal on each
original crossing interval. This retains the real full cut observation. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem source_free_terminal_actual_cut_interval {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : cfg.K<2)
    (s : GoodObservation cfg) (i : ℕ) (F : TimedObservation cfg→ℝ) (hF : Measurable F)
    (A : ℝ) (hFA : ∀v,0≤F v ∧ F v≤A) :
    (∫ω,if crossesCut cfg δ (observedRecycledPair cfg ε M start hn s.val i ω).1
        (observedRecycledPair cfg ε M start hn s.val (i+1) ω).1 then
      mixed cfg.directions C ∅ L (observedWitness cfg e (observedRecycledTerminal cfg ε M start hn (s.val,ω)))*
        F (sourceCutTerminal cfg ε M start δ hδ hn s ω) else 0 ∂boardClockMeasure n (cfg.B/n))≤
    ∫ω,if crossesCut cfg δ (observedRecycledPair cfg ε M start hn s.val i ω).1
        (observedRecycledPair cfg ε M start hn s.val (i+1) ω).1 then
      mixed cfg.directions C ∅ L (observedWitness cfg e (sourceCutTerminal cfg ε M start δ hδ hn s ω))*
        F (sourceCutTerminal cfg ε M start δ hδ hn s ω) else 0 ∂boardClockMeasure n (cfg.B/n) := by
  have hh := source_free_terminal_crossing_le cfg ε M start δ hδ hn hB hm e C L hCL hK s i F hF A hFA
  have hp (j : ℕ) (ω : BoardClockPath n) :
      (RecycledBoardProcess.state (goodObservedRestartStep cfg ε M start hn) s j ω).val=
        (observedRecycledPair cfg ε M start hn s.val j ω).1 :=
    congrArg Prod.fst (goodObservedRecycled_projection cfg ε M start hn s j ω)
  have hv (v : GoodObservation cfg) : (goodInteriorCut cfg ε M start δ hδ hn v).val=
      interiorCutObservation cfg ε M start δ hδ hn v.val := rfl
  dsimp only at hh
  simp only [goodMixed,hv,hp,cutCrossingTest,mul_ite,mul_zero] at hh
  calc
    _ = ∫ω,if crossesCut cfg δ (observedRecycledPair cfg ε M start hn s.val i ω).1
        (observedRecycledPair cfg ε M start hn s.val (i+1) ω).1 then
      mixed cfg.directions C ∅ L (observedWitness cfg e (observedRecycledTerminal cfg ε M start hn (s.val,ω)))*
        F (interiorCutObservation cfg ε M start δ hδ hn (observedRecycledPair cfg ε M start hn s.val i ω).1)
      else 0 ∂boardClockMeasure n (cfg.B/n) := by
      apply integral_congr_ae
      filter_upwards [] with ω
      by_cases hx : crossesCut cfg δ (observedRecycledPair cfg ε M start hn s.val i ω).1
        (observedRecycledPair cfg ε M start hn s.val (i+1) ω).1
      · simp only [if_pos hx]
        rw [sourceCutTerminal_eq_interiorCut_of_crossing cfg ε M start δ hδ hn s i ω hx]
      · simp only [if_neg hx]
    _ ≤ _ := hh.trans_eq (integral_congr_ae (Filter.Eventually.of_forall (fun ω=>by
      by_cases hx : crossesCut cfg δ (observedRecycledPair cfg ε M start hn s.val i ω).1
        (observedRecycledPair cfg ε M start hn s.val (i+1) ω).1
      · simp only [if_pos hx]
        rw [sourceCutTerminal_eq_interiorCut_of_crossing cfg ε M start δ hδ hn s i ω hx]
      · simp only [if_neg hx])))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.source_free_terminal_actual_cut_interval
