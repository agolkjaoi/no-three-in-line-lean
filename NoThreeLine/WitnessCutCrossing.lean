import NoThreeLine.WitnessSurvivalGuard
import NoThreeLine.ObservedCrossingTest

/-! Actual strict-cut crossing inequality for D-empty mixed, including
inactive-C and absent-crossing branches. Eta and active gates are retained. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaMixedGenerator

theorem observedCut_source_free_crossing_le {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : cfg.K<2)
    (s : GoodObservation cfg) (F : TimedObservation cfg→ℝ) (hF : ∀a,0≤F a) :
    (∫ω,if crossesCut cfg δ s.val (observedClockStep cfg ε M start hn (s.val,ω)) then
      mixed cfg.directions C ∅ L (observedWitness cfg e (observedClockStep cfg ε M start hn (s.val,ω)))*
        F (interiorCutObservation cfg ε M start δ hδ hn s.val) else 0 ∂boardClockMeasure n (cfg.B/n))≤
    ∫ω,if crossesCut cfg δ s.val (observedClockStep cfg ε M start hn (s.val,ω)) then
      mixed cfg.directions C ∅ L (observedWitness cfg e (interiorCutObservation cfg ε M start δ hδ hn s.val))*
        F (interiorCutObservation cfg ε M start δ hδ hn s.val) else 0 ∂boardClockMeasure n (cfg.B/n) := by
  by_cases hC : C⊆s.val.1.val.1.physical.process.activeEvents
  · by_cases hc : 0<s.val.1.val.2-δ
    · by_cases hs : s.val.1.val.1.physical.process.stopped=false
      · by_cases hG : s.val.1.val.2-δ<augGuardTime cfg ε M (augTimedInput cfg s.val.1)
        · let u := s.val.1.val.2-δ
          let a := interiorCutObservation cfg ε M start δ hδ hn s.val
          let E := {ω | u<BoardFirstCandidate.firstTime hn ω}
          have hEm : MeasurableSet E := measurableSet_lt measurable_const (BoardFirstCandidate.firstTime_measurable hn)
          have he (ω : BoardClockPath n) :
              crossesCut cfg δ s.val (observedClockStep cfg ε M start hn (s.val,ω)) ↔
                u<BoardFirstCandidate.firstTime hn ω :=
            crossesCut_iff_survival cfg ε M start δ s.val hc hs hG _
          simp_rw [he]
          change (∫ω,E.indicator (fun ω=>mixed cfg.directions C ∅ L
            (observedWitness cfg e (observedClockStep cfg ε M start hn (s.val,ω)))*F a) ω
              ∂boardClockMeasure n (cfg.B/n))≤
            ∫ω,E.indicator (fun _=>mixed cfg.directions C ∅ L (observedWitness cfg e a)*F a) ω
              ∂boardClockMeasure n (cfg.B/n)
          rw [integral_indicator hEm,integral_indicator hEm,integral_mul_const]
          have hx : ¬(s.val.1.val.2≤0 ∨ s.val.1.val.1.physical.process.stopped=true) := by
            rw [hs]
            simp only [Bool.false_eq_true,or_false]
            linarith
          have hp := interiorCutObservation_eq cfg ε M start δ hδ hn s.val hc hs hG
          have hw : observedWitness cfg e a=
              selectedWitnessCurve cfg (augTimedInput cfg s.val.1).1 (recordedValue e s.val.2) u := by
            unfold observedWitness
            rw [hp.2]
            exact congrArg (fun y : AugmentedState n×ℝ=>WitnessState.mk y.1 (recordedValue e s.val.2)) hp.1
          have hbound := observedClockStep_survival_source_free_bound cfg ε M start e s.val C L u
            hn hB hm s.property.1 hx hC hCL s.property.2 hK hc.le hG.le
          rw [←hw] at hbound
          calc
            _ ≤ (Real.exp (-(((n:ℝ)*cfg.B)*u))*mixed cfg.directions C ∅ L (observedWitness cfg e a))*F a :=
              mul_le_mul_of_nonneg_right hbound (hF a)
            _ = _ := by
              rw [setIntegral_const,smul_eq_mul,BoardFirstCandidate.candidate_firstTime_survival hn cfg.B u hB hc.le]
              ring
        · have hfalse (ω : BoardClockPath n) :
              ¬crossesCut cfg δ s.val (observedClockStep cfg ε M start hn (s.val,ω)) :=
            fun h=>hG (crossesCut_context cfg ε M start δ s.val _ h).2.2.1
          simp only [if_neg (hfalse _),integral_zero,le_refl]
      · have hfalse (ω : BoardClockPath n) :
            ¬crossesCut cfg δ s.val (observedClockStep cfg ε M start hn (s.val,ω)) :=
          fun h=>hs (crossesCut_context cfg ε M start δ s.val _ h).2.1
        simp only [if_neg (hfalse _),integral_zero,le_refl]
    · have hfalse (ω : BoardClockPath n) :
          ¬crossesCut cfg δ s.val (observedClockStep cfg ε M start hn (s.val,ω)) :=
        fun h=>hc (crossesCut_context cfg ε M start δ s.val _ h).1
      simp only [if_neg (hfalse _),integral_zero,le_refl]
  · have hz (ω : BoardClockPath n) : mixed cfg.directions C ∅ L
        (observedWitness cfg e (observedClockStep cfg ε M start hn (s.val,ω)))=0 :=
      observedStep_mixed_zero cfg ε M start e _ C ∅ L hC
    have ha : mixed cfg.directions C ∅ L
        (observedWitness cfg e (interiorCutObservation cfg ε M start δ hδ hn s.val))=0 :=
      observedStep_mixed_zero cfg ε M (start-δ) e _ C ∅ L hC
    simp only [hz,ha,zero_mul,ite_self,integral_zero,le_refl]

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedCut_source_free_crossing_le
