import NoThreeLine.ProtectedLineLikelihoodFlow
import NoThreeLine.ExponentialSurvivalInterval

/-! Survival-restricted normalization on the same selected physical curve. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE

theorem selectedLineLikelihood_survival_mean {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hstop : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (rate u T : ℝ) (hr : 0<rate) (hu : 0≤u) (huT : u≤T) (hTg : T≤selectedGuardTime cfg x) :
    (∫t in Ioi u,(if t≤T then selectedLineLikelihood cfg x L t*
      (1-lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L/rate)
      else selectedLineLikelihood cfg x L T) ∂expMeasure rate)=
      Real.exp (-(rate*u))*selectedLineLikelihood cfg x L u := by
  have hz := (selectedLineLikelihood_continuousOn cfg x he K hKcfg hK L hsp hN hk).mono
    (Icc_subset_Icc hu hTg)
  have hc : Continuous (fun t : ℝ=>selectedCurve cfg (x,t)) := by
    change Continuous (fun t : ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,t))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hl : ContinuousOn (fun t : ℝ=>lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L)
      (Icc u T) := ((lineIntensity_contDiff x.val.process cfg.mask L).continuous.comp hc).continuousOn
  apply expMeasure_survival_compensation_interval rate u T hr hu huT (selectedLineLikelihood cfg x L)
    (fun t=>selectedLineLikelihood cfg x L t*(1-lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,t)) L/rate))
    hz (hz.mul (continuous_const.continuousOn.sub (hl.div_const rate)))
  intro t ht
  have hd := selectedLineLikelihood_hasDerivAt cfg x he K hKcfg hK L hstop hsp hN hk t
    ⟨hu.trans_lt ht.1,ht.2.trans_le hTg⟩
  apply hd.congr_deriv
  field_simp
  <;> ring

end NoThreeLine
#print axioms NoThreeLine.selectedLineLikelihood_survival_mean
