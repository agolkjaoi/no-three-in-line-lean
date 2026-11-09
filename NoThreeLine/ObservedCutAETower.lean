import NoThreeLine.ObservedCutWholeTower

/-! Endpoint avoidance is supplied by Fubini, for almost every calendar cut.
The original clocks, phase configurations and deadlines are kept unchanged. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine

theorem ae_time_avoids_random_endpoints {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [SFinite μ] (a : ℕ→Ω→ℝ) (ha : ∀i,Measurable (a i)) :
    ∀ᵐt : ℝ ∂volume,∀ᵐω ∂μ,∀i,t≠a i ω := by
  have hm : MeasurableSet {x : Ω×ℝ | ∀i,x.2≠a i x.1} := by
    have he : {x : Ω×ℝ | ∀i,x.2≠a i x.1}=
        ⋂i,{x : Ω×ℝ | x.2≠a i x.1} := by ext x; simp
    rw [he]
    exact MeasurableSet.iInter (fun i=>
      (measurableSet_eq_fun measurable_snd ((ha i).comp measurable_fst)).compl)
  exact (Measure.ae_ae_comm hm).mp (Filter.Eventually.of_forall
    (fun ω=>CalendarIntegral.ae_avoids_endpoints (fun i=>a i ω)))

namespace BirthWitness

theorem observedFuture_actual_cut_tower_ae_time {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (j k : ℕ) (s : GoodObservation (cs j).config)
    (p : Grid n) (F : TimedObservation (cs j).config→ℝ) (hF : Measurable F)
    (C : ℝ) (hFC : ∀v,0≤F v ∧ F v≤C) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo 0 s.val.1.val.2,
    (∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1*
      F (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
        (s.val.1.val.2-t) (sub_nonneg.mpr ht.2.le) hn s ω)
      ∂boardClockMeasure n (B/n))=
    ∫ω,augTimedCredit (cs j).config p
      (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
        (s.val.1.val.2-t) (sub_nonneg.mpr ht.2.le) hn s ω).1*
      F (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
        (s.val.1.val.2-t) (sub_nonneg.mpr ht.2.le) hn s ω)
      ∂boardClockMeasure n (B/n) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have havoid := ae_time_avoids_random_endpoints (boardClockMeasure n (B/n))
    (fun i ω=>s.val.1.val.2-
      (observedRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn s.val i ω).1.1.val.2)
    (fun i=>measurable_const.sub
      (observedRecycledPair_measurable (cs j).config ε M (phaseEndpoint cs start j) hn s.val i).fst.fst.subtype_val.snd)
  filter_upwards [havoid] with t ht htI
  apply observedFuture_actual_cut_tower_of_ae_avoid cs ε M deadline start (s.val.1.val.2-t)
    (sub_nonneg.mpr htI.2.le) hn hB j k s (by linarith [htI.1]) p F hF C hFC
  filter_upwards [ht] with ω hω i
  intro he
  exact hω i (by linarith)

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.ae_time_avoids_random_endpoints
#print axioms NoThreeLine.BirthWitness.observedFuture_actual_cut_tower_ae_time
