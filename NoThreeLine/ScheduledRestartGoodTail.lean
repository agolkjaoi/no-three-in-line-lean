import NoThreeLine.ScheduledRestartGoodCrossing

/-! Uniform estimates from admissible first-birth sections integrate
without a count of birth histories or a factor from the phase index. -/
set_option autoImplicit false
set_option maxHeartbeats 2050000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem scheduledRestartGoodCrossing_le_of_sections {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (hE : E⊆L.val) (A : ℝ→ℝ)
    (hA : Continuous A) (hAm : Monotone A) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0<B) (lo hi : ℝ) (J : ℕ) (Γ : Finset ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (hKcfg : ∀j,(cs j).K≤K) (hK : K<2)
    (hsp : ∀j,specified (cs j).directions L) (s : ProtectedPhaseState n B)
    (ho : occupancy s.1.val.physical.process L=0) (hk : s.1.val.physical.clocks L≤K)
    (hsv : ∀q∈L.val,0≤s.2.1 q ∧ s.2.1 q≤2*B) (hs : s.1.val.AuxReady Γ ε M)
    (tail : ℝ) (htail : 0≤tail)
    (hsection : ∀ a : ℕ×ProtectedPhaseState n B, a.1<J →
      let v := unpackProtectedTimed (cs a.1).config a.2
      occupancy v.1.val.1.physical.process L=1 →
      v.1.val.1.physical.clocks L≤K → v.1.val.1.AuxReady (cs a.1).directions ε M →
      (∀q∈L.val,0≤v.2 q ∧ v.2 q≤2*B) →
      scheduledRestartEntryTotal cs L E A a≤lo →
      (savedCreditMeasure (boardClockMeasure n (B/n))
        (fun w=>scheduledRemainderDensity cs ε M K deadline start L 1 hn J (a,w))).real
        {w | (scheduledCrossingRemainderPair cs ε M deadline start L 1 E A hn hi J (a,w)).1.2=true}≤tail) :
    (scheduledLineRestartLaw cs ε M K deadline start L hn J s).real
      (scheduledRestartGoodCrossing cs ε M deadline start L E A hn lo hi J s)≤tail := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let r := scheduledLineExitIterate cs ε M deadline start L 0 hn J s J
  let ρ := μ.map (fun ω=>(r ω).1)
  let H := scheduledRestartGoodCrossingFlag cs ε M deadline start L E A hn lo hi J
  let Q := fun a=>savedCreditMeasure μ (fun w=>scheduledRemainderDensity cs ε M K deadline start L 1 hn J (a,w))
  let F := fun a=>(Q a).real {w | H (a,w)=true}
  have hr : Measurable r := scheduledLineExitIterate_measurable cs ε M deadline start L 0 hn J s J
  have h := scheduledRestartEvent_real_sections cs ε M K hK deadline start L hn hB J s H
    (scheduledRestartGoodCrossingFlag_measurable cs ε M deadline start L E A hA hn lo hi J)
  have hF : Integrable F ρ := h.2.2.2
  have hu (ω : BoardClockPath n) : F (r ω).1≤tail := by
    let a := (r ω).1
    by_cases ha : a.1<J ∧ scheduledRestartEntryTotal cs L E A a≤lo
    · have hi := scheduledLineExit_stageOne_initial cs ε M K deadline start L E hE A hAm
        p hpL hn J s Γ hΓ hKcfg hsp ho hk hsv hs lo ω ha.1
      change F a≤tail
      simp only [F,H,scheduledRestartGoodCrossingFlag,if_pos ha]
      exact hsection a ha.1 hi.1 hi.2.1 hi.2.2.1 hi.2.2.2.1 ha.2
    · change F a≤tail
      simpa only [F,H,scheduledRestartGoodCrossingFlag,if_neg ha,Bool.false_eq_true,
        Set.setOf_false,measureReal_empty] using htail
  change (scheduledLineRestartLaw cs ε M K deadline start L hn J s).real {ω | H (r ω)=true}≤tail
  rw [h.2.1,integral_map hr.fst.aemeasurable hF.aestronglyMeasurable]
  have hb := integral_mono_of_nonneg
    (μ:=μ) (ae_of_all _ (fun ω=>show 0≤F (r ω).1 from measureReal_nonneg))
    (integrable_const tail) (ae_of_all _ hu)
  simpa only [integral_const,probReal_univ,one_smul] using hb

end NoThreeLine

#print axioms NoThreeLine.scheduledRestartGoodCrossing_le_of_sections

