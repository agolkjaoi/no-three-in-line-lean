import NoThreeLine.SourceElapsedMean
import NoThreeLine.WitnessPhaseInitial

/-! Joint initial-state, cut-time, and board measurability. This permits
the existing actual cut hierarchy to be integrated at a random phase
initial state without discarding its inherited birth records. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped NNReal

namespace NoThreeLine.BirthWitness

theorem sourceCutTerminal_state_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) :
    Measurable (fun x : (GoodObservation cfg×ℝ≥0)×BoardClockPath n=>
      sourceCutTerminal cfg ε M start x.1.2 x.1.2.coe_nonneg hn x.1.1 x.2) := by
  have hs : Measurable (fun x : (GoodObservation cfg×ℝ≥0)×BoardClockPath n=>
      sourceRestrictState cfg x.1.2 x.1.2.coe_nonneg x.1.1.val.1) :=
    (sourceRestrictState_joint_measurable cfg).comp
      (measurable_fst.snd.prodMk (measurable_subtype_coe.fst.comp measurable_fst.fst))
  have ht : Measurable (fun x : (GoodObservation cfg×ℝ≥0)×BoardClockPath n=>start-(x.1.2:ℝ)) :=
    measurable_const.sub (measurable_subtype_coe.comp measurable_fst.snd)
  have hin : Measurable (fun x : (GoodObservation cfg×ℝ≥0)×BoardClockPath n=>
      (start-(x.1.2:ℝ),((sourceRestrictGood cfg x.1.2 x.1.2.coe_nonneg x.1.1).val,x.2))) :=
    ht.prodMk ((hs.prodMk (measurable_subtype_coe.snd.comp measurable_fst.fst)).prodMk measurable_snd)
  exact (observedRecycledTerminal_start_joint_measurable cfg ε M hn).comp hin

theorem sourceCutMixed_state_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) :
    Measurable (fun x : (GoodObservation cfg×ℝ≥0)×BoardClockPath n=>mixed cfg.directions C D L
      (observedWitness cfg e (sourceCutTerminal cfg ε M start x.1.2 x.1.2.coe_nonneg hn x.1.1 x.2))) :=
  (mixed_measurable cfg.directions C D L).comp
    ((observedWitness_measurable cfg e).comp (sourceCutTerminal_state_joint_measurable cfg ε M start hn))

theorem cutMixedMean_state_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) :
    Measurable (fun x : GoodObservation cfg×ℝ≥0=>cutMixedMean cfg ε M start e C D L hn x.1 x.2) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact (sourceCutMixed_state_joint_measurable cfg ε M start e C D L hn).stronglyMeasurable.integral_prod_right'.measurable

theorem elapsedCutAmount_joint_measurable : Measurable (fun x : ℝ×ℝ=>elapsedCutAmount x.1 x.2) :=
  (measurable_const.max (measurable_fst.sub measurable_snd)).subtype_mk

theorem elapsedMixedMean_state_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) :
    Measurable (fun x : GoodObservation cfg×ℝ=>elapsedMixedMean cfg ε M start e C D L hn x.1 x.2) := by
  have ha : Measurable (fun x : GoodObservation cfg×ℝ=>elapsedCutAmount x.1.val.1.val.2 x.2) :=
    elapsedCutAmount_joint_measurable.comp
      ((measurable_subtype_coe.snd.comp (measurable_subtype_coe.fst.comp measurable_fst)).prodMk measurable_snd)
  have hf : Measurable (fun x : GoodObservation cfg×ℝ=>(x.1,elapsedCutAmount x.1.val.1.val.2 x.2)) :=
    measurable_fst.prodMk ha
  convert (cutMixedMean_state_joint_measurable cfg ε M start e C D L hn hB).comp hf using 1
  rfl

def phaseCutMixed {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (x : (GoodPhaseObservation n cfg.B×ℝ)×BoardClockPath n) : ℝ :=
  mixed cfg.directions C D L (observedWitness cfg e
    (sourceCutTerminal cfg ε M start (elapsedCutAmount cfg.horizon x.1.2)
      (elapsedCutAmount cfg.horizon x.1.2).coe_nonneg hn (goodPhaseStart cfg ε M x.1.1) x.2))

theorem phaseCutMixed_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) : Measurable (phaseCutMixed cfg ε M start e C D L hn) := by
  have hf : Measurable (fun x : (GoodPhaseObservation n cfg.B×ℝ)×BoardClockPath n=>
      ((goodPhaseStart cfg ε M x.1.1,elapsedCutAmount cfg.horizon x.1.2),x.2)) :=
    (((goodPhaseStart_measurable cfg ε M).comp measurable_fst.fst).prodMk
      ((elapsedCutAmount_measurable cfg.horizon).comp measurable_fst.snd)).prodMk measurable_snd
  convert (sourceCutMixed_state_joint_measurable cfg ε M start e C D L hn).comp hf using 1
  rfl

theorem phaseCutMixed_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (x : (GoodPhaseObservation n cfg.B×ℝ)×BoardClockPath n) :
    0≤phaseCutMixed cfg ε M start e C D L hn x ∧
      phaseCutMixed cfg ε M start e C D L hn x≤mixedCap C cfg.B := by
  have hv := observedWitness_valid cfg e _
    (sourceCutTerminal_consistent cfg ε M start (elapsedCutAmount cfg.horizon x.1.2)
      (elapsedCutAmount cfg.horizon x.1.2).coe_nonneg hn (goodPhaseStart cfg ε M x.1.1) x.2)
  exact ⟨mixed_nonneg _ cfg.directions C D L cfg.B hv,mixed_le_cap _ cfg.directions C D L cfg.B hv⟩

theorem phaseCutMixed_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodPhaseObservation n cfg.B) (t : ℝ) :
    (∫ω,phaseCutMixed cfg ε M start e C D L hn ((s,t),ω) ∂boardClockMeasure n (cfg.B/n))=
      elapsedMixedMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M s) t := rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_state_joint_measurable
#print axioms NoThreeLine.BirthWitness.elapsedMixedMean_state_joint_measurable
#print axioms NoThreeLine.BirthWitness.phaseCutMixed_bounds
