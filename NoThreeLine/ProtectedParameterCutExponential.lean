import NoThreeLine.ProtectedCutPairBounds

/-! A local cut may depend jointly on the incoming state and an auxiliary
real parameter, such as remaining cost determined by the past history. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedParameterCutExponential {n : ℕ} (cfg : FlowConfig n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ)
    (x : (ProtectedTimedState cfg×ProtectedTimedState cfg)×ℝ) : ℝ :=
  protectedCutPairExponential cfg G F V θ (fun v=>cut (v,x.2)) x.1

theorem protectedParameterCutExponential_measurable {n : ℕ} (cfg : FlowConfig n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ)
    (hG : Measurable G) (hF : Measurable F) (hV : Measurable V) (hcut : Measurable cut) :
    Measurable (protectedParameterCutExponential cfg G F V θ cut) := by
  have hg : Measurable (fun v : ProtectedTimedState cfg=>G (v.1.val.1.physical,v.2)) :=
    hG.comp (((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)).prodMk measurable_snd)
  have hc : Measurable (fun x : (ProtectedTimedState cfg×ProtectedTimedState cfg)×ℝ=>cut (x.1.1,x.2)) :=
    hcut.comp (measurable_fst.fst.prodMk measurable_snd)
  exact Measurable.ite (measurableSet_le
    ((measurable_subtype_coe.snd.comp measurable_fst.fst.fst).sub
      (measurable_subtype_coe.snd.comp measurable_fst.snd.fst)) hc)
    ((protectedPairExponential_measurable cfg _ F V θ hg hF hV).comp measurable_fst)
    ((protectedLocalStateExponential_measurable cfg G F V θ hG hF hV).comp
      (measurable_fst.fst.prodMk hc))

end NoThreeLine
#print axioms NoThreeLine.protectedParameterCutExponential_measurable
