import NoThreeLine.ProtectedIncomingCutExponential
import NoThreeLine.ProtectedPairExponential

/-! Reconstruct a first-cut observation from before/after states. At a
guard reached without a candidate, real resolution preserves every saved
scalar credit, so the apparent endpoint ambiguity disappears. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedCutPairExponential {n : ℕ} (cfg : FlowConfig n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (cut : ProtectedTimedState cfg→ℝ)
    (x : ProtectedTimedState cfg×ProtectedTimedState cfg) : ℝ :=
  if x.1.1.val.2-x.2.1.val.2≤cut x.1 then
    protectedPairExponential cfg (fun v=>G (v.1.val.1.physical,v.2)) F V θ x
  else protectedLocalStateExponential cfg G F V θ (x.1,cut x.1)

theorem protectedCutPairExponential_measurable {n : ℕ} (cfg : FlowConfig n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (cut : ProtectedTimedState cfg→ℝ)
    (hG : Measurable G) (hF : Measurable F) (hV : Measurable V) (hcut : Measurable cut) :
    Measurable (protectedCutPairExponential cfg G F V θ cut) := by
  have hg : Measurable (fun v : ProtectedTimedState cfg=>G (v.1.val.1.physical,v.2)) :=
    hG.comp (((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)).prodMk measurable_snd)
  exact Measurable.ite (measurableSet_le
    ((measurable_subtype_coe.snd.comp measurable_fst.fst).sub (measurable_subtype_coe.snd.comp measurable_snd.fst))
    (hcut.comp measurable_fst))
    (protectedPairExponential_measurable cfg _ F V θ hg hF hV)
    ((protectedLocalStateExponential_measurable cfg G F V θ hG hF hV).comp
      (measurable_fst.prodMk (hcut.comp measurable_fst)))

theorem protectedTimedExponential_after_guard {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A S V : ℝ→ℝ) (θ : ℝ) (s : ProtectedTimedState cfg)
    (hd : ¬birthDone cfg s.1) (t : ℝ) (ht : 0<t)
    (hg : augGuardTime cfg ε M (augTimedInput cfg s.1)<t) (q : Grid n) (z : ℝ) :
    protectedTimedExponential cfg ε M L E A S V θ s ((t,q),z)=
      Real.exp (θ*(protectedScalarTotal L E A
        (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,augGuardTime cfg ε M (augTimedInput cfg s.1))) s.2-
        sourcePrimitive S (augGuardTime cfg ε M (augTimedInput cfg s.1)))-
        (θ^2/2)*sourcePrimitive V (augGuardTime cfg ε M (augTimedInput cfg s.1))) := by
  have ha : augAdvance cfg ε M (augTimedInput cfg s.1,t)=augGuardTime cfg ε M (augTimedInput cfg s.1) := by
    change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s.1)) t)=_
    rw [min_eq_left hg.le,max_eq_right (augGuardTime_mem cfg ε M _ s.1.property.1.1).1]
  have hlik : augTimedLineLikelihood cfg ε M L (s.1,((t,q),z))=
      selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L (augGuardTime cfg ε M (augTimedInput cfg s.1)) := by
    unfold augTimedLineLikelihood
    change ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true) at hd
    dsimp only
    rw [if_neg hd,ha,lineCandidateSurvival_outside_time cfg ε M L s.1 t q z (fun h=>hg.not_ge h.2.2),mul_one]
  have he := protectedTimedWeightedExponential_segment cfg ε M L E A S V θ s hd t ht q z
  rw [if_neg hg.not_ge] at he
  change augTimedLineLikelihood cfg ε M L (s.1,((t,q),z))*protectedTimedExponential cfg ε M L E A S V θ s ((t,q),z)=_ at he
  rw [hlik] at he
  exact mul_left_cancel₀ (ne_of_gt (Real.exp_pos _)) he

theorem protectedCutPairExponential_scalar_actual {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ)
    (F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (cut : ProtectedTimedState cfg→ℝ)
    (s : ProtectedTimedState cfg) (hd : ¬birthDone cfg s.1) (hu : 0≤cut s)
    (hug : cut s≤augGuardTime cfg ε M (augTimedInput cfg s.1))
    (t : ℝ) (ht : 0<t) (q : Grid n) (z : ℝ) :
    protectedCutPairExponential cfg (fun x=>protectedScalarTotal L E A x.1 x.2) F V θ cut
      (s,protectedRemember cfg L s (augTimedStep cfg ε M (s.1,((t,q),z))))=
      protectedIncomingCutExponential cfg ε M L (fun x=>protectedScalarTotal L E A x.1 x.2) F V θ cut (s,((t,q),z)) := by
  let S := fun v=>F (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,v),s.2)
  let W := fun v=>V (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,v),s.2)
  have hp : protectedPairExponential cfg (fun v : ProtectedTimedState cfg=>protectedScalarTotal L E A v.1.val.1.physical v.2)
      F V θ (s,protectedRemember cfg L s (augTimedStep cfg ε M (s.1,((t,q),z))))=
      protectedTimedExponential cfg ε M L E A S W θ s ((t,q),z) := by
    unfold protectedPairExponential
    rw [protectedStatePairGenericSource_actual,protectedStatePairGenericSource_actual]
    rfl
  have he : s.1.val.2-(protectedRemember cfg L s (augTimedStep cfg ε M (s.1,((t,q),z)))).1.val.2=
      min (augGuardTime cfg ε M (augTimedInput cfg s.1)) t := by
    change s.1.val.2-(augTimedStep cfg ε M (s.1,((t,q),z))).val.2=_
    rw [←birthElapsed_eq_remaining_drop cfg ε M (s.1,((t,q),z))]
    simp only [birthElapsed,if_neg hd,augAdvance,cappedAdvance]
    exact max_eq_right (le_min (augGuardTime_mem cfg ε M _ s.1.property.1.1).1 ht.le)
  unfold protectedCutPairExponential
  dsimp only
  rw [he,hp,protectedIncomingCutExponential_scalar_eq cfg ε M L E A F V θ cut s hu]
  unfold protectedFirstCutValue
  by_cases htu : t≤cut s
  · rw [if_pos htu,if_pos ((min_le_right _ _).trans htu)]
  · rw [if_neg htu]
    by_cases hgu : cut s=augGuardTime cfg ε M (augTimedInput cfg s.1)
    · rw [if_pos ((min_le_left _ _).trans hgu.ge)]
      rw [protectedTimedExponential_after_guard cfg ε M L E A S W θ s hd t ht
        (by rw [←hgu]; exact lt_of_not_ge htu) q z]
      simp only [protectedLocalStateExponential,protectedLocalStateSource,max_eq_right hu,hgu,S,W,sourcePrimitive]
    · have hstrict : cut s<augGuardTime cfg ε M (augTimedInput cfg s.1) := lt_of_le_of_ne hug hgu
      rw [if_neg (not_le.mpr (lt_min hstrict (lt_of_not_ge htu)))]
      simp only [protectedLocalStateExponential,protectedLocalStateSource,max_eq_right hu,S,W,sourcePrimitive]

end NoThreeLine
#print axioms NoThreeLine.protectedCutPairExponential_measurable
#print axioms NoThreeLine.protectedCutPairExponential_scalar_actual
