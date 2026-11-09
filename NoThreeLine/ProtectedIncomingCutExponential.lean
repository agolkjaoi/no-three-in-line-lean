import NoThreeLine.ProtectedLocalCutExponential
import NoThreeLine.ProtectedStateSourceHistory

/-! A cut chosen measurably from the actual incoming state. The resulting
candidate/flow mixture is jointly measurable in incoming state and candidate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedLocalStateSource {n : ℕ} (cfg : FlowConfig n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (x : ProtectedTimedState cfg×ℝ) : ℝ :=
  ∫t in (0:ℝ)..max 0 x.2,F (selectedTrajectory cfg ((augTimedInput cfg x.1.1).1.1,t),x.1.2)

theorem protectedLocalStateSource_measurable {n : ℕ} (cfg : FlowConfig n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hF : Measurable F) :
    Measurable (protectedLocalStateSource cfg F) := by
  have hi : Measurable (fun z : (ProtectedTimedState cfg×ℝ)×ℝ=>
      ((augTimedInput cfg z.1.1.1).1.1,z.2)) :=
    ((((augTimedInput_measurable cfg).comp measurable_fst.fst.fst).fst.fst).prodMk measurable_snd)
  have hf := hF.comp (((selectedTrajectory_measurable cfg).comp hi).prodMk measurable_fst.fst.snd)
  exact variable_running_integral_measurable _ (measurable_const.max measurable_snd)
    (fun _=>le_max_left _ _) _ hf

def protectedLocalStateExponential {n : ℕ} (cfg : FlowConfig n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (x : ProtectedTimedState cfg×ℝ) : ℝ :=
  Real.exp (θ*(G (selectedTrajectory cfg ((augTimedInput cfg x.1.1).1.1,x.2),x.1.2)-
    protectedLocalStateSource cfg F x)-(θ^2/2)*protectedLocalStateSource cfg V x)

theorem protectedLocalStateExponential_measurable {n : ℕ} (cfg : FlowConfig n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (hG : Measurable G) (hF : Measurable F) (hV : Measurable V) :
    Measurable (protectedLocalStateExponential cfg G F V θ) := by
  have hi : Measurable (fun z : ProtectedTimedState cfg×ℝ=>((augTimedInput cfg z.1.1).1.1,z.2)) :=
    ((((augTimedInput_measurable cfg).comp measurable_fst.fst).fst.fst).prodMk measurable_snd)
  have hg := hG.comp (((selectedTrajectory_measurable cfg).comp hi).prodMk measurable_fst.snd)
  exact Real.measurable_exp.comp (((hg.sub (protectedLocalStateSource_measurable cfg F hF)).const_mul θ).sub
    ((protectedLocalStateSource_measurable cfg V hV).const_mul (θ^2/2)))

def protectedIncomingCutExponential {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (cut : ProtectedTimedState cfg→ℝ)
    (x : ProtectedTimedState cfg×CandidateData n) : ℝ :=
  if x.2.1.1≤cut x.1 then
    let v := protectedRemember cfg L x.1 (augTimedStep cfg ε M (x.1.1,x.2))
    Real.exp (θ*(G (v.1.val.1.physical,v.2)-protectedRunningScalarSource cfg ε M x.1.1
      (fun t=>F (selectedTrajectory cfg ((augTimedInput cfg x.1.1).1.1,t),x.1.2)) x.2)-
      (θ^2/2)*protectedRunningScalarSource cfg ε M x.1.1
        (fun t=>V (selectedTrajectory cfg ((augTimedInput cfg x.1.1).1.1,t),x.1.2)) x.2)
  else protectedLocalStateExponential cfg G F V θ (x.1,cut x.1)

theorem protectedIncomingCutExponential_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (cut : ProtectedTimedState cfg→ℝ)
    (hG : Measurable G) (hF : Measurable F) (hV : Measurable V) (hcut : Measurable cut) :
    Measurable (protectedIncomingCutExponential cfg ε M L G F V θ cut) := by
  have hg : Measurable (fun v : ProtectedTimedState cfg=>G (v.1.val.1.physical,v.2)) :=
    hG.comp (((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)).prodMk measurable_snd)
  have hnxt : Measurable (fun x : ProtectedTimedState cfg×CandidateData n=>
      protectedRemember cfg L x.1 (augTimedStep cfg ε M (x.1.1,x.2))) :=
    (protectedRemember_measurable cfg L).comp
      (measurable_fst.prodMk ((augTimedStep_measurable cfg ε M).comp (measurable_fst.fst.prodMk measurable_snd)))
  exact Measurable.ite (measurableSet_le measurable_snd.fst.fst (hcut.comp measurable_fst))
    (Real.measurable_exp.comp ((((hg.comp hnxt).sub
      (protectedRunningStateSource_joint_measurable cfg ε M F hF)).const_mul θ).sub
      ((protectedRunningStateSource_joint_measurable cfg ε M V hV).const_mul (θ^2/2))))
    ((protectedLocalStateExponential_measurable cfg G F V θ hG hF hV).comp
      (measurable_fst.prodMk (hcut.comp measurable_fst)))

theorem protectedIncomingCutExponential_scalar_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ)
    (F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (cut : ProtectedTimedState cfg→ℝ)
    (s : ProtectedTimedState cfg) (hu : 0≤cut s) (z : CandidateData n) :
    protectedIncomingCutExponential cfg ε M L (fun x=>protectedScalarTotal L E A x.1 x.2) F V θ cut (s,z)=
      protectedFirstCutValue (protectedTimedExponential cfg ε M L E A
        (fun t=>F (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t),s.2))
        (fun t=>V (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t),s.2)) θ s)
        (cut s) (Real.exp (θ*(protectedScalarTotal L E A (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,cut s)) s.2-
          sourcePrimitive (fun t=>F (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t),s.2)) (cut s))-
          (θ^2/2)*sourcePrimitive (fun t=>V (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t),s.2)) (cut s))) z := by
  simp only [protectedIncomingCutExponential,protectedFirstCutValue,protectedLocalStateExponential,
    protectedLocalStateSource,max_eq_right hu,protectedTimedExponential,protectedRemember,sourcePrimitive]

end NoThreeLine
#print axioms NoThreeLine.protectedIncomingCutExponential_measurable
#print axioms NoThreeLine.protectedIncomingCutExponential_scalar_eq
