import NoThreeLine.ScheduledCrossingTail

/-! The next scheduled phase observes the true previous crossing bit and
starts from the true protected endpoint. Under the original board law the
remaining board supplies the exact section integral for either bit. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem scheduledCrossingTail_integral_sections {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (j k : ℕ) (s : ProtectedPhaseState n B)
    (V : ValidAugmentedState n B×Bool→ℝ) (hV : Measurable V)
    (C : ℝ) (hVC : ∀ x,0≤V x ∧ V x≤C) :
    let μ := boardClockMeasure n (B/n)
    let F := scheduledCrossingPair cs ε M deadline start L N E A hn b j
    let G := scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k
    (∫ω, let r := scheduledCrossingTail cs ε M deadline start L N E A hn b j (k+1) (s,ω)
        V (r.1.1.1,r.1.2) ∂μ) =
      ∫ω,∫v, let r := F (s,ω)
              let q := G (r.1.1,v)
              V (q.1.1.1,r.1.2 || q.1.2) ∂μ ∂μ := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let F := scheduledCrossingPair cs ε M deadline start L N E A hn b j
  let G := scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k
  let H := fun ω=>(F (s,ω)).1
  let r := fun ω=>(F (s,ω)).2
  have hm : Measurable (fun ω=>F (s,ω)) :=
    (scheduledCrossingPair_measurable cs ε M deadline start L N E A hA hn b j).comp
      (measurable_const.prodMk measurable_id)
  letI : IsProbabilityMeasure (μ.map H) := Measure.isProbabilityMeasure_map hm.fst.aemeasurable
  let g := fun x : (ProtectedPhaseState n B×Bool)×BoardClockPath n=>G (x.1.1,x.2)
  have hg : Measurable g :=
    (scheduledCrossingTail_measurable cs ε M deadline start L N E A hA hn b (j+1) k).comp
      (measurable_fst.fst.prodMk measurable_snd)
  have hb : Measurable (fun y : Bool×Bool=>y.1 || y.2) := measurable_of_countable _
  let p := fun x : (ProtectedPhaseState n B×Bool)×BoardClockPath n=>V ((g x).1.1.1,x.1.2 || (g x).1.2)
  have hp : Measurable p := hV.comp
    (hg.fst.fst.fst.prodMk (hb.comp (measurable_fst.snd.prodMk hg.fst.snd)))
  let q := fun a=>∫v,p (a,v) ∂μ
  have hq : Measurable q := hp.stronglyMeasurable.integral_prod_right'.measurable
  have hi := GenericCreditIteration.bounded_nonnegative_integrable ((μ.map H).prod μ) p hp C
    (fun x=>hVC _)
  have he := independent_history_setIntegral μ μ H r hm.fst hm.snd
    (scheduledCrossingPair_map cs ε M deadline start L N E A hA hn hB b j s)
    p q hp hq hi (fun _=>rfl) univ MeasurableSet.univ
  simpa only [Set.preimage_univ,Measure.restrict_univ,setIntegral_univ,
    p,q,H,r,F,G,g,scheduledCrossingTail] using he

end NoThreeLine

#print axioms NoThreeLine.scheduledCrossingTail_integral_sections

