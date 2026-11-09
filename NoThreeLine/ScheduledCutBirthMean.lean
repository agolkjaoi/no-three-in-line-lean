import NoThreeLine.ScheduledCutBirthKernel
import NoThreeLine.ScheduledCutLoss
import NoThreeLine.BirthPhaseAccumulation

/-! Average the phase cut kernel against the actual inherited phase state
and actual independent residual board. This connects the existing running
birth increments to deterministic-cut means on the same original board. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness

theorem goodPhases_birth_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) (ω : BoardClockPath n) :
    ((goodPhases cs ε M deadline start hn s k ω).1.val.1,(goodPhases cs ε M deadline start hn s k ω).2)=
      (recycledPhaseState cs ε M deadline start hn s.val.1 k ω,
        (recycledPhases cs ε M deadline start hn s.val.1 k ω).2) := by
  have hr := congrArg Prod.snd (goodPhases_projection cs ε M deadline start hn s k ω)
  have hb := congrArg Prod.snd (observedRecycledPhases_base cs ε M deadline start hn s.val k ω)
  rw [goodPhases_state_projection,observedRecycledPhaseState_base,hr,hb]

theorem scheduledBirthIncrement_mean_cut {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (s : GoodPhaseObservation n B) (k : ℕ) :
    (∫ω,scheduledBirthIncrement cs ε M deadline start p hn s.val.1 k ω ∂boardClockMeasure n (B/n))=
      ∫t in (0:ℝ)..(cs k).horizon,(∫ω,(scheduledCutProcess cs ε M deadline start hn s k (ω,t)).birthRate (cs k).mask p
        ∂boardClockMeasure n (B/n)) := by
  let ν := boardClockMeasure n (B/n)
  letI : IsProbabilityMeasure ν := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let a := fun ω=>(goodPhases cs ε M deadline start hn s k ω).1
  let r := fun ω=>(goodPhases cs ε M deadline start hn s k ω).2
  have ha : Measurable a := (goodPhases_measurable cs ε M deadline start hn s k).fst
  have hr : Measurable r := (goodPhases_measurable cs ε M deadline start hn s k).snd
  have hprod : ν.map (fun ω=>(a ω,r ω))=(ν.map a).prod ν :=
    goodPhases_residual_product cs ε M deadline start hn hB s k
  let f : GoodPhaseObservation n B×BoardClockPath n→ℝ := fun x=>phaseBirthRate (cs k).config ε M p hn (x.1.val.1,x.2)
  let g := phaseCutBirthIntegral (cs k).config ε M (phaseEndpoint cs start k) p hn
  have hf : Measurable f := (phaseBirthRate_measurable (cs k).config ε M p hn).comp
    ((measurable_subtype_coe.fst.comp measurable_fst).prodMk measurable_snd)
  have hg : Measurable g := phaseCutBirthIntegral_measurable (cs k).config ε M _ p hn
  have hb (x : GoodPhaseObservation n B×BoardClockPath n) : 0≤f x ∧ f x≤(cs k).horizon*(B/n) :=
    phaseBirthRate_bounds (cs k).config ε M p hn hB (cs k).mask_le_one (x.1.val.1,x.2)
  have hc (x : GoodPhaseObservation n B×BoardClockPath n) : 0≤g x ∧ g x≤(cs k).horizon*(B/n) :=
    phaseCutBirthIntegral_bounds (cs k).config ε M _ p hn hB (cs k).mask_le_one x
  have hmean (u : GoodPhaseObservation n B) : (∫ω,f (u,ω) ∂ν)=∫ω,g (u,ω) ∂ν :=
    phaseBirthRate_mean_cutIntegral (cs k).config ε M (phaseEndpoint cs start k) p hn hB (cs k).mask_le_one u
  have hh := independent_pair_equal_integrals ν ν a r ha hr hprod f g hf hg
    ((cs k).horizon*(B/n)) ((cs k).horizon*(B/n)) hb hc hmean
  have he (ω : BoardClockPath n) : f (a ω,r ω)=scheduledBirthIncrement cs ε M deadline start p hn s.val.1 k ω := by
    change phaseBirthRate (cs k).config ε M p hn
      ((goodPhases cs ε M deadline start hn s k ω).1.val.1,(goodPhases cs ε M deadline start hn s k ω).2)=_
    rw [goodPhases_birth_projection]
    rfl
  simp_rw [he] at hh
  let b : BoardClockPath n×ℝ→ℝ := fun x=>(scheduledCutProcess cs ε M deadline start hn s k x).birthRate (cs k).mask p
  have hm : Measurable b := (process_birthRate_measurable (cs k).mask p).comp
    (scheduledCutProcess_measurable cs ε M deadline start hn s k)
  have hbounds (x : BoardClockPath n×ℝ) : 0≤b x ∧ b x≤B/n :=
    phaseCutBirthRate_bounds (cs k).config ε M (phaseEndpoint cs start k) p hn hB (cs k).mask_le_one ((a x.1,r x.1),x.2)
  have hs := CalendarIntegral.expected_interval_integral_swap ν (cs k).horizon (cs k).horizon.coe_nonneg b hm (B/n) hbounds
  exact hh.trans hs

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.goodPhases_birth_projection
#print axioms NoThreeLine.BirthWitness.scheduledBirthIncrement_mean_cut
