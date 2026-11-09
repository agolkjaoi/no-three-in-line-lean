import NoThreeLine.GoodCutTerminalResidual

/-! Carry an actual old cut through any finite tail of original phases.
The old full observation and later incoming state remain jointly
independent of the actual remaining original board. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine

theorem restart_after_independent_payload {Ω S W : Type*}
    [MeasurableSpace Ω] [MeasurableSpace S] [MeasurableSpace W]
    (μ : Measure Ω) (ν : Measure W) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (h : Ω→S×W) (hh : Measurable h)
    (hp : μ.map h=(μ.map (fun ω=>(h ω).1)).prod ν)
    (F : S×W→S×W) (hF : Measurable F)
    (hsection : ∀s,ν.map (fun w=>F (s,w))=(ν.map (fun w=>(F (s,w)).1)).prod ν) :
    μ.map (fun ω=>F (h ω))=(μ.map (fun ω=>(F (h ω)).1)).prod ν := by
  letI : IsProbabilityMeasure (μ.map (fun ω=>(h ω).1)) := Measure.isProbabilityMeasure_map hh.fst.aemeasurable
  change μ.map (F ∘ h)=(μ.map ((fun x=>(F x).1) ∘ h)).prod ν
  rw [←Measure.map_map hF hh,←Measure.map_map hF.fst hh,hp]
  exact product_restart_of_sections _ ν F hF hsection

namespace BirthWitness

def goodRememberedContinuation {X : Type*} {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (x : (X×GoodPhaseObservation n B)×BoardClockPath n) :
    (X×GoodPhaseObservation n B)×BoardClockPath n :=
  let r := goodPhaseContinuation cs ε M deadline start hn (j+1) k
    (goodPhaseDeadline deadline (phaseEndpoint cs start (j+1)) x.1.2) x.2
  ((x.1.1,r.1.2),r.2)

theorem goodRememberedContinuation_measurable {X : Type*} [MeasurableSpace X] {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (j k : ℕ) : Measurable (goodRememberedContinuation (X:=X) cs ε M deadline start hn j k) := by
  have hr := (goodPhaseContinuation_joint_measurable cs ε M deadline start hn (j+1) k).comp
    (((goodPhaseDeadline_measurable deadline (phaseEndpoint cs start (j+1))).comp
      (measurable_fst.snd : Measurable (fun x : (X×GoodPhaseObservation n B)×BoardClockPath n=>x.1.2))).prodMk measurable_snd)
  exact (measurable_fst.fst.prodMk hr.fst.snd).prodMk hr.snd

theorem goodRememberedContinuation_section_product {X : Type*} [MeasurableSpace X] {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (j k : ℕ) (a : X×GoodPhaseObservation n B) :
    (boardClockMeasure n (B/n)).map (fun ω=>goodRememberedContinuation cs ε M deadline start hn j k (a,ω))=
      ((boardClockMeasure n (B/n)).map (fun ω=>(goodRememberedContinuation cs ε M deadline start hn j k (a,ω)).1)).prod
        (boardClockMeasure n (B/n)) := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let s := goodPhaseDeadline deadline (phaseEndpoint cs start (j+1)) a.2
  let r := fun ω : BoardClockPath n=>goodPhaseContinuation cs ε M deadline start hn (j+1) k s ω
  have hr : Measurable r := (goodPhaseContinuation_joint_measurable cs ε M deadline start hn (j+1) k).comp
    (measurable_const.prodMk measurable_id)
  have hi : Measurable (fun ω : BoardClockPath n=>((r ω).1.2,(r ω).2)) := hr.fst.snd.prodMk hr.snd
  let ψ := fun z : GoodPhaseObservation n B=>(a.1,z)
  have hψ : Measurable ψ := measurable_const.prodMk measurable_id
  have hm : Measurable (fun z : GoodPhaseObservation n B×BoardClockPath n=>(ψ z.1,z.2)) :=
    (hψ.comp measurable_fst).prodMk measurable_snd
  have h := congrArg (fun μ : Measure (GoodPhaseObservation n B×BoardClockPath n)=>
    μ.map (fun z=>(ψ z.1,z.2))) (goodPhaseContinuation_residual_product cs ε M deadline start hn hB (j+1) k s)
  change (ν.map (fun ω=>((r ω).1.2,(r ω).2))).map (fun z=>(ψ z.1,z.2))=
    ((ν.map (fun ω=>(r ω).1.2)).prod ν).map (fun z=>(ψ z.1,z.2)) at h
  rw [Measure.map_map hm hi,map_pair_with_fresh_right _ ν ψ hψ,Measure.map_map hψ hr.fst.snd] at h
  exact h

def goodCutFuturePair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (j k : ℕ)
    (s : GoodPhaseObservation n B) (ω : BoardClockPath n) :
    (TimedObservation (cs j).config×GoodPhaseObservation n B)×BoardClockPath n :=
  let cfg := (cs j).config
  let r := goodPhaseRecycledPair cfg ε M (phaseEndpoint cs start j) hn (s,ω)
  goodRememberedContinuation cs ε M deadline start hn j k
    ((sourceCutTerminal cfg ε M (phaseEndpoint cs start j) δ hδ hn (goodPhaseStart cfg ε M s) ω,r.1),r.2)

theorem goodCutFuturePair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (j k : ℕ)
    (s : GoodPhaseObservation n B) : Measurable (goodCutFuturePair cs ε M deadline start δ hδ hn j k s) := by
  have hr : Measurable (fun ω : BoardClockPath n=>goodPhaseRecycledPair (cs j).config ε M
      (phaseEndpoint cs start j) hn (s,ω)) :=
    (goodPhaseRecycledPair_measurable (cs j).config ε M _ hn).comp (measurable_const.prodMk measurable_id)
  exact (goodRememberedContinuation_measurable cs ε M deadline start hn j k).comp
    (((sourceCutTerminal_measurable (cs j).config ε M _ δ hδ hn _).prodMk hr.fst).prodMk hr.snd)

theorem goodCutFuturePair_residual_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (hB : 0<B)
    (j k : ℕ) (s : GoodPhaseObservation n B) (hcut : δ<((cs j).horizon:ℝ))
    (havoid : ∀ᵐω ∂boardClockMeasure n (B/n),∀i,
      δ≠(observedRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn
        (goodPhaseStart (cs j).config ε M s).val i ω).1.1.val.2) :
    (boardClockMeasure n (B/n)).map (goodCutFuturePair cs ε M deadline start δ hδ hn j k s)=
      ((boardClockMeasure n (B/n)).map (fun ω=>(goodCutFuturePair cs ε M deadline start δ hδ hn j k s ω).1)).prod
        (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hr : Measurable (fun ω : BoardClockPath n=>goodPhaseRecycledPair (cs j).config ε M
      (phaseEndpoint cs start j) hn (s,ω)) :=
    (goodPhaseRecycledPair_measurable (cs j).config ε M _ hn).comp (measurable_const.prodMk measurable_id)
  exact restart_after_independent_payload _ _ _
    (((sourceCutTerminal_measurable (cs j).config ε M _ δ hδ hn _).prodMk hr.fst).prodMk hr.snd)
    (goodCut_terminal_residual_product (cs j).config ε M (phaseEndpoint cs start j) δ hδ hn hB s hcut havoid)
    _ (goodRememberedContinuation_measurable cs ε M deadline start hn j k)
    (goodRememberedContinuation_section_product cs ε M deadline start hn hB j k)

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.BirthWitness.goodCutFuturePair_residual_product
