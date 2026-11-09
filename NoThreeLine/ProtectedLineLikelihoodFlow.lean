import NoThreeLine.SpecifiedClockHazard
import NoThreeLine.ExponentialFirstStep

/-! The likelihood factor on the actual selected flow. Its derivative
and one-exponential-candidate normalization come from the clock ODE. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE

def selectedLineLikelihood {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) (t : ℝ) : ℝ :=
  Real.exp (specifiedClockHazardPotential (occupancy x.val.process L) ((selectedCurve cfg (x,t)).2.1 L)-
    specifiedClockHazardPotential (occupancy x.val.process L) (x.val.clocks L))

theorem selectedLineLikelihood_zero {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (L : LineIndex n) : selectedLineLikelihood cfg x L 0=1 := by
  simp only [selectedLineLikelihood,(selectedCurve_spec cfg x he.2.1).1,ExtendedState.coordinates,
    sub_self,Real.exp_zero]

theorem selectedLineLikelihood_measurable {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (L : LineIndex n) : Measurable (selectedLineLikelihood cfg x L) := by
  unfold selectedLineLikelihood specifiedClockHazardPotential
  have hc : Measurable (fun t : ℝ=>selectedCurve cfg (x,t)) :=
    (selectedCurve_measurable cfg).comp (measurable_const.prodMk measurable_id)
  have hclock : Measurable (fun t : ℝ=>(selectedCurve cfg (x,t)).2.1 L) :=
    (measurable_pi_apply L).comp hc.snd.fst
  fun_prop

theorem selectedLineLikelihood_bounds {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (hN : occupancy x.val.process L≤1)
    (hk : x.val.clocks L≤K) (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    0<selectedLineLikelihood cfg x L t ∧ selectedLineLikelihood cfg x L t≤(2/(2-K))^2 := by
  refine ⟨Real.exp_pos _,?_⟩
  have hi := (specifiedClockHazardPotential_bounds _ _ K hN (he.2.1.2.1 L).1 hk hK).1
  have hb := (selectedCurve_spec cfg x he.2.1).2.2.1 t ht
  have hf := specifiedClockHazardPotential_exp_le _ _ K hN (hb.1.2.1 L).1
    (selectedCurve_specifiedClock_le cfg x he K hKcfg L hsp hN hk t ht) hK
  exact (Real.exp_le_exp.mpr (sub_le_self _ hi)).trans hf

theorem selectedLineLikelihood_continuousOn {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (hN : occupancy x.val.process L≤1)
    (hk : x.val.clocks L≤K) :
    ContinuousOn (selectedLineLikelihood cfg x L) (Icc 0 (selectedGuardTime cfg x)) := by
  have hc : Continuous (fun t : ℝ=>selectedCurve cfg (x,t)) := by
    change Continuous (fun t : ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,t))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hlog : ContinuousOn (fun t : ℝ=>Real.log (2-(selectedCurve cfg (x,t)).2.1 L))
      (Icc 0 (selectedGuardTime cfg x)) :=
    (continuous_const.continuousOn.sub ((continuous_apply L).comp hc.snd.fst).continuousOn).log
      (fun t ht=>by
        change 2-(selectedCurve cfg (x,t)).2.1 L≠0
        have := selectedCurve_specifiedClock_le cfg x he K hKcfg L hsp hN hk t ht
        linarith)
  unfold selectedLineLikelihood specifiedClockHazardPotential
  exact Real.continuous_exp.comp_continuousOn
    (((continuous_const.continuousOn.sub hlog).const_mul _).sub continuous_const.continuousOn)

theorem selectedLineLikelihood_hasDerivAt {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hstop : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (selectedLineLikelihood cfg x L)
      (lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L*selectedLineLikelihood cfg x L t) t := by
  have hd := ((selectedCurve_spec cfg x he.2.1).2.2.1 t ⟨ht.1.le,ht.2.le⟩).2.2.hasDerivAt
    (Icc_mem_nhds ht.1 ht.2)
  have hh := flow_specifiedClockHazard_hasDerivAt x.val.process cfg.directions cfg.mask L
    (fun u=>selectedCurve cfg (x,u)) t hstop hsp hN
    ((selectedCurve_specifiedClock_le cfg x he K hKcfg L hsp hN hk t ⟨ht.1.le,ht.2.le⟩).trans_lt hK) hd
  unfold selectedLineLikelihood
  simpa only [mul_comm] using
    (hh.sub_const (specifiedClockHazardPotential (occupancy x.val.process L) (x.val.clocks L))).exp

theorem selectedLineLikelihood_first_mean {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hstop : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (rate T : ℝ) (hr : 0<rate) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    (∫t,(if t≤T then selectedLineLikelihood cfg x L t*
      (1-lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L/rate)
      else selectedLineLikelihood cfg x L T) ∂expMeasure rate)=1 := by
  have hz := (selectedLineLikelihood_continuousOn cfg x he K hKcfg hK L hsp hN hk).mono
    (Icc_subset_Icc le_rfl hTg)
  have hc : Continuous (fun t : ℝ=>selectedCurve cfg (x,t)) := by
    change Continuous (fun t : ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,t))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hl : ContinuousOn (fun t : ℝ=>lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L)
      (Icc 0 T) := ((lineIntensity_contDiff x.val.process cfg.mask L).continuous.comp hc).continuousOn
  have hh := expMeasure_first_step_compensation rate T hr hT (selectedLineLikelihood cfg x L)
    (fun t=>selectedLineLikelihood cfg x L t*(1-lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L/rate))
    hz (hz.mul (continuous_const.continuousOn.sub (hl.div_const rate))) (fun t ht=>by
      have hd := selectedLineLikelihood_hasDerivAt cfg x he K hKcfg hK L hstop hsp hN hk t
        ⟨ht.1,ht.2.trans_le hTg⟩
      apply hd.congr_deriv
      field_simp
      <;> ring)
  simpa only [selectedLineLikelihood_zero cfg x he L] using hh

end NoThreeLine

#print axioms NoThreeLine.selectedLineLikelihood_hasDerivAt
#print axioms NoThreeLine.selectedLineLikelihood_first_mean
