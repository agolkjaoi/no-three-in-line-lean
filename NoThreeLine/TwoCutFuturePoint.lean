import NoThreeLine.ObservedTwoCutTower
import NoThreeLine.CutRootLeafPoint
import NoThreeLine.SourceElapsedMean

/-! Both actual cuts have the same tested law under the constructed full
future credit density and the later-cut credit density. The starting
observation is fixed here; the future includes the original phase tail. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
open scoped NNReal
namespace NoThreeLine.BirthWitness

def throughTailPointMeasure {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (s : TimedObservation (cs j).config) (p : Grid n) : Measure (BoardClockPath n) :=
  savedCreditMeasure (boardClockMeasure n (B/n))
    (fun ω=>validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s ω).1.2.1)

theorem throughTailPointMeasure_integral {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (s : TimedObservation (cs j).config) (p : Grid n) (f : BoardClockPath n→ℝ) :
    (∫ω,f ω ∂throughTailPointMeasure cs ε M deadline start hn j k s p)=
      ∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s ω).1.2.1*f ω
        ∂boardClockMeasure n (B/n) := by
  have hZ : Measurable (fun ω=>validAugStateCredit B p
      (observedThroughPhaseTail cs ε M deadline start hn j k s ω).1.2.1) :=
    (validAugStateCredit_measurable B p).comp
      (((observedAfterTerminal_measurable cs ε M deadline start hn j k).comp
        ((observedRecycledTerminalPair_measurable (cs j).config ε M (phaseEndpoint cs start j) hn).comp
          (measurable_const.prodMk measurable_id))).fst.snd.fst)
  exact savedCreditMeasure_integral _ _ hZ (fun ω=>(validAugStateCredit_bounds B p _).1) f

theorem cutPointMeasure_integral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : GoodObservation cfg) (p : Grid n) (δ : ℝ≥0) (f : BoardClockPath n→ℝ) :
    (∫ω,f ω ∂cutPointMeasure cfg ε M start hn s p δ)=
      ∫ω,augTimedCredit cfg p (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω).1*f ω
        ∂boardClockMeasure n (cfg.B/n) := by
  have hZ : Measurable (fun ω=>((cutProcess cfg ε M start hn s (δ,ω)).accounts p).credit) :=
    (sourceCutCredit_joint_measurable cfg ε M start hn s p).comp (measurable_const.prodMk measurable_id)
  exact savedCreditMeasure_integral _ _ hZ
    (fun ω=>(sourceCutCredit_bounds cfg ε M start δ δ.coe_nonneg hn s p ω).1) f

theorem throughTailPoint_two_cuts_ae_times {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (j k : ℕ) (s : GoodObservation (cs j).config) (p : Grid n)
    (F : ℝ→ℝ→TimedObservation (cs j).config×TimedObservation (cs j).config→ℝ)
    (hF : ∀u v,Measurable (F u v)) (A : ℝ) (hFA : ∀u v x,0≤F u v x ∧ F u v x≤A) :
    ∀ᵐv : ℝ ∂volume,∀ᵐu : ℝ ∂volume, v∈Ioo 0 s.val.1.val.2 → u∈Ioo 0 v →
    (∫ω,F u v (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
          (elapsedCutAmount s.val.1.val.2 u) (elapsedCutAmount s.val.1.val.2 u).coe_nonneg hn s ω,
        sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
          (elapsedCutAmount s.val.1.val.2 v) (elapsedCutAmount s.val.1.val.2 v).coe_nonneg hn s ω)
      ∂throughTailPointMeasure cs ε M deadline start hn j k s.val p)=
    ∫ω,F u v (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
          (elapsedCutAmount s.val.1.val.2 u) (elapsedCutAmount s.val.1.val.2 u).coe_nonneg hn s ω,
        sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
          (elapsedCutAmount s.val.1.val.2 v) (elapsedCutAmount s.val.1.val.2 v).coe_nonneg hn s ω)
      ∂cutPointMeasure (cs j).config ε M (phaseEndpoint cs start j) hn s p
        (elapsedCutAmount s.val.1.val.2 v) := by
  have hh := observedFuture_two_actual_cuts_tower_ae_times cs ε M deadline start hn hB j k s p F hF A hFA
  filter_upwards [hh] with v hv
  filter_upwards [hv] with u hu hvI huI
  rw [throughTailPointMeasure_integral,cutPointMeasure_integral]
  simpa only [elapsedCutAmount_coe _ _ hvI.2.le,
    elapsedCutAmount_coe _ _ (huI.2.le.trans hvI.2.le)] using hu hvI huI

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.throughTailPoint_two_cuts_ae_times
