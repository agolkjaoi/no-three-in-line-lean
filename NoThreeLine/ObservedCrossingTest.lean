import NoThreeLine.ObservedCutCrossing

/-! Bounded measurable strict-cut tests on two actual consecutive observed
states, including the credit at the reconstructed interior cut. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def cutCrossingTest {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (F : TimedObservation cfg→ℝ) (x : TimedObservation cfg×TimedObservation cfg) : ℝ :=
  if crossesCut cfg δ x.1 x.2 then F (interiorCutObservation cfg ε M start δ hδ hn x.1) else 0

theorem cutCrossingTest_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (F : TimedObservation cfg→ℝ) (hF : Measurable F) :
    Measurable (cutCrossingTest cfg ε M start δ hδ hn F) := by
  apply Measurable.ite
  · exact (measurableSet_lt ((measurable_subtype_coe.comp measurable_snd.fst).snd) measurable_const).inter
      (measurableSet_lt measurable_const ((measurable_subtype_coe.comp measurable_fst.fst).snd))
  · exact hF.comp ((interiorCutObservation_measurable cfg ε M start δ hδ hn).comp measurable_fst)
  · exact measurable_const

theorem cutCrossingTest_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (F : TimedObservation cfg→ℝ) (C : ℝ) (hF : ∀s,0≤F s ∧ F s≤C)
    (x : TimedObservation cfg×TimedObservation cfg) :
    0≤cutCrossingTest cfg ε M start δ hδ hn F x ∧ cutCrossingTest cfg ε M start δ hδ hn F x≤C := by
  have hC := (hF (interiorCutObservation cfg ε M start δ hδ hn x.1)).1.trans
    (hF (interiorCutObservation cfg ε M start δ hδ hn x.1)).2
  unfold cutCrossingTest
  split_ifs
  · exact hF _
  · exact ⟨le_rfl,hC⟩

theorem observedCut_crossing_test_tower {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : TimedObservation cfg)
    (p : Grid n) (F : TimedObservation cfg→ℝ) :
    (∫ω,augTimedCredit cfg p (observedClockStep cfg ε M start hn (s,ω)).1*
      cutCrossingTest cfg ε M start δ hδ hn F (s,observedClockStep cfg ε M start hn (s,ω))
      ∂boardClockMeasure n (cfg.B/n))=
    ∫ω,augTimedCredit cfg p (interiorCutObservation cfg ε M start δ hδ hn s).1*
      cutCrossingTest cfg ε M start δ hδ hn F (s,observedClockStep cfg ε M start hn (s,ω))
      ∂boardClockMeasure n (cfg.B/n) := by
  simpa only [observedClockStep,cutCrossingTest,mul_ite,mul_zero] using
    observedCut_crossing_tower cfg ε M start δ hδ hn hB hm s p F

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.cutCrossingTest_measurable
#print axioms NoThreeLine.BirthWitness.observedCut_crossing_test_tower
