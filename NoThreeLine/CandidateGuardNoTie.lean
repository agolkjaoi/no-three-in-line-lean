import NoThreeLine.RootTerminalResidual
import NoThreeLine.VirtualGuardHit

/-! No atom of the actual board race can coincide with a measurable
state-dependent guard when the remaining board has the proved product law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine

theorem actualFirstTime_ne_ae {n : ℕ} (hn : 0<n) (rate : ℝ) (hr : 0<rate) (t : ℝ) :
    ∀ᵐω∂boardClockMeasure n rate,BoardFirstCandidate.firstTime hn ω≠t := by
  have hz := BoardFirstCandidate.expMeasure_singleton ((n:ℝ)^2*rate) t
  rw [←BoardFirstCandidate.firstTime_map hn rate hr,
    Measure.map_apply (BoardFirstCandidate.firstTime_measurable hn) (measurableSet_singleton t)] at hz
  rw [ae_iff]
  change boardClockMeasure n rate {ω | BoardFirstCandidate.firstTime hn ω=t}=0 at hz
  simpa only [not_not] using hz

theorem actualFirstTime_guard_prod_ae {X : Type*} [MeasurableSpace X]
    {n : ℕ} (hn : 0<n) (rate : ℝ) (hr : 0<rate)
    (μ : Measure X) [IsFiniteMeasure μ] (guard : X→ℝ) (hg : Measurable guard) :
    ∀ᵐx∂μ.prod (boardClockMeasure n rate),BoardFirstCandidate.firstTime hn x.2≠guard x.1 := by
  letI := boardClockMeasure_probability n rate hr
  apply (Measure.ae_prod_iff_ae_ae (measurableSet_eq_fun
    ((BoardFirstCandidate.firstTime_measurable hn).comp measurable_snd) (hg.comp measurable_fst)).compl).mpr
  exact Filter.Eventually.of_forall (fun x=>actualFirstTime_ne_ae hn rate hr (guard x))

theorem residual_sections_ae {Ω X W : Type*}
    [MeasurableSpace Ω] [MeasurableSpace X] [MeasurableSpace W]
    (μ : Measure Ω) (ν : Measure X) (η : Measure W)
    [IsFiniteMeasure ν] [IsFiniteMeasure η]
    (f : Ω→X×W) (hf : Measurable f) (hlaw : μ.map f=ν.prod η)
    (P : X×W→Prop) (hP : Measurable P) (hsection : ∀x,∀ᵐw∂η,P (x,w)) :
    ∀ᵐω∂μ,P (f ω) := by
  have hh : ∀ᵐz∂ν.prod η,P z :=
    (Measure.ae_prod_iff_ae_ae hP.setOf).mpr (Filter.Eventually.of_forall hsection)
  rw [←hlaw] at hh
  exact ae_of_ae_map hf.aemeasurable hh

namespace BirthWitness

def rootCandidateGuardDistinct {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (x : RootObservation cfg×BoardClockPath n) : Prop :=
  BoardFirstCandidate.firstTime hn x.2≠augGuardTime cfg ε M (augTimedInput cfg x.1.1.1)

theorem rootCandidateGuardDistinct_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n) :
    Measurable (rootCandidateGuardDistinct cfg ε M hn) :=
  (((BoardFirstCandidate.firstTime_measurable hn).comp measurable_snd).eq
    ((augGuardTime_measurable cfg ε M).comp ((augTimedInput_measurable cfg).comp measurable_fst.fst.fst))).not

theorem rootObserver_candidateGuard_ne_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (rate : ℝ) (hr : 0<rate) (s : RootObservation cfg) (k : ℕ) :
    ∀ᵐω∂boardClockMeasure n rate,
      rootCandidateGuardDistinct cfg ε M hn (rootObserverRecycledPair cfg ε M start q hn s k ω) := by
  letI := boardClockMeasure_probability n rate hr
  let f := rootObserverRecycledPair cfg ε M start q hn s k
  have hf : Measurable f := rootObserverRecycledPair_measurable cfg ε M start q hn s k
  exact residual_sections_ae (boardClockMeasure n rate) ((boardClockMeasure n rate).map (fun ω=>(f ω).1))
    (boardClockMeasure n rate) f hf (rootObserverRecycledPair_residual_product cfg ε M start q hn rate hr s k)
    (rootCandidateGuardDistinct cfg ε M hn) (rootCandidateGuardDistinct_measurable cfg ε M hn)
    (fun a=>actualFirstTime_ne_ae hn rate hr (augGuardTime cfg ε M (augTimedInput cfg a.1.1)))

theorem rootObserver_all_candidateGuard_ne_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (rate : ℝ) (hr : 0<rate) (s : RootObservation cfg) :
    ∀ᵐω∂boardClockMeasure n rate,∀k,
      rootCandidateGuardDistinct cfg ε M hn (rootObserverRecycledPair cfg ε M start q hn s k ω) :=
  ae_all_iff.mpr (rootObserver_candidateGuard_ne_ae cfg ε M start q hn rate hr s)

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.actualFirstTime_ne_ae
#print axioms NoThreeLine.BirthWitness.rootObserver_all_candidateGuard_ne_ae
