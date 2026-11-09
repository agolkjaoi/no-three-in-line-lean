import NoThreeLine.ProtectedCenteredExponential
import NoThreeLine.ProtectedScalarSquareBounds

/-! The centered square uses the actual elapsed source, and the actual
post-resolution saved ledger.  Guard/candidate ties retain the real rule. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedTimedCenteredSquare {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A S : ℝ→ℝ) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  (protectedScalarTotal L E A (augTimedStep cfg ε M (s.1,z)).val.1.physical
    (protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z))).2-
      protectedRunningScalarSource cfg ε M s.1 S z)^2

def protectedTimedWeightedCenteredSquare {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A S : ℝ→ℝ) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  augTimedLineLikelihood cfg ε M L (s.1,z)*protectedTimedCenteredSquare cfg ε M L E A S s z

theorem protectedTimedCenteredSquare_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A S : ℝ→ℝ) (hA : Measurable A) (hS : Continuous S)
    (s : ProtectedTimedState cfg) : Measurable (protectedTimedCenteredSquare cfg ε M L E A S s) := by
  have hf : Measurable (fun v : ProtectedTimedState cfg=>protectedScalarTotal L E A v.1.val.1.physical v.2) :=
    Finset.measurable_sum _ (fun p _=>hA.comp (protectedTimedCredit_measurable cfg L p))
  exact ((hf.comp ((protectedRemember_measurable cfg L).comp
    (measurable_const.prodMk ((augTimedStep_measurable cfg ε M).comp (measurable_const.prodMk measurable_id))))).sub
    (protectedRunningScalarSource_measurable cfg ε M s.1 S hS)).pow_const 2

theorem protectedTimedWeightedCenteredSquare_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A S : ℝ→ℝ) (hA : Measurable A) (hS : Continuous S)
    (s : ProtectedTimedState cfg) : Measurable (protectedTimedWeightedCenteredSquare cfg ε M L E A S s) :=
  (augTimedLineLikelihood_section_measurable cfg ε M L s.1).mul
    (protectedTimedCenteredSquare_measurable cfg ε M L E A S hA hS s)

theorem protectedTimedWeightedCenteredSquare_segment {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A S : ℝ→ℝ) (s : ProtectedTimedState cfg)
    (hd : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true))
    (t : ℝ) (ht : 0<t) (q : Grid n) (z : ℝ) :
    protectedTimedWeightedCenteredSquare cfg ε M L E A S s ((t,q),z)=
      if t≤augGuardTime cfg ε M (augTimedInput cfg s.1) then
        selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
          protectedForbiddenMarkObservable L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2
            cfg.directions cfg.mask cfg.B (fun e a=>(protectedScalarTotal L E A e a-sourcePrimitive S t)^2)
            q (fun _=>false) z
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L
        (augGuardTime cfg ε M (augTimedInput cfg s.1))*
          (protectedScalarTotal L E A (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
            augGuardTime cfg ε M (augTimedInput cfg s.1))) s.2-
              sourcePrimitive S (augGuardTime cfg ε M (augTimedInput cfg s.1)))^2 := by
  unfold protectedTimedWeightedCenteredSquare protectedTimedCenteredSquare protectedRemember protectedRunningScalarSource
  simp only [augTimedLineLikelihood,if_neg hd,augTimedStep,augTimedStepPair]
  have hraw := protectedScalarTotal_augOutcome_eq_raw cfg ε M L E A (augTimedInput cfg s.1) s.2 ((t,q),z)
  change protectedScalarTotal L E A (augOutcome cfg ε M (augTimedInput cfg s.1,((t,q),z))).physical
    (protectedLineSave L s.1.val.1.physical (augOutcome cfg ε M (augTimedInput cfg s.1,((t,q),z))).physical s.2)=_ at hraw
  rw [hraw]
  by_cases htg : t≤augGuardTime cfg ε M (augTimedInput cfg s.1)
  · rw [if_pos htg]
    have ha : augAdvance cfg ε M (augTimedInput cfg s.1,t)=t := by
      change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s.1)) t)=t
      rw [min_eq_right htg,max_eq_right ht.le]
    have hpre : (augPreState cfg ε M (augTimedInput cfg s.1,((t,q),z))).physical=
        selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t) := by
      change selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,augAdvance cfg ε M (augTimedInput cfg s.1,t))=_
      rw [ha]
    rw [ha,protectedForbiddenMarkObservable_actual]
    have hsurv : lineCandidateSurvival cfg ε M L (s.1,((t,q),z))=
        if z≤(selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)).process.acceptance cfg.mask cfg.B q ∧
          eligibleBirth (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)).process q ∧ q∈L.val then 0 else 1 := by
      simp only [lineCandidateSurvival,timedBirth,segmentBirth,hd,not_false_eq_true,true_and,
        ht,htg,and_self,hpre,eligibleBirth]
      congr 1
      apply propext
      tauto
    rw [hsurv]
    simp only [augRawOutcome,ht,htg,and_self,if_true]
    rw [hpre,mul_assoc]
    rfl
  · rw [if_neg htg]
    have ha : augAdvance cfg ε M (augTimedInput cfg s.1,t)=augGuardTime cfg ε M (augTimedInput cfg s.1) := by
      change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s.1)) t)=_
      rw [min_eq_left (le_of_not_ge htg),max_eq_right (augGuardTime_mem cfg ε M _ s.1.property.1.1).1]
    rw [lineCandidateSurvival_outside_time cfg ε M L s.1 t q z (fun h=>htg h.2.2),mul_one,
      augRawOutcome,if_neg (fun h=>htg h.2)]
    change _*(protectedScalarTotal L E A (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
      augAdvance cfg ε M (augTimedInput cfg s.1,t)))
      (protectedLineSave L s.1.val.1.physical (s.1.val.1.physical.withCoordinates _) s.2)-
        sourcePrimitive S (augAdvance cfg ε M (augTimedInput cfg s.1,t)))^2=_
    rw [protectedLineSave_withCoordinates,ha]

theorem protectedTimedWeightedCenteredSquare_candidate_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A S : ℝ→ℝ) (s : ProtectedTimedState cfg) (hn : 0<n)
    (hd : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true)) (t : ℝ) (ht : 0<t) :
    (∑q : Grid n,∫z,protectedTimedWeightedCenteredSquare cfg ε M L E A S s ((t,q),z) ∂markMeasure)/(n:ℝ)^2=
      if t≤augGuardTime cfg ε M (augTimedInput cfg s.1) then
        selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
          protectedObservableCandidateMean L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2
            cfg.directions cfg.mask cfg.B (fun _ _=>false)
            (fun e a=>(protectedScalarTotal L E A e a-sourcePrimitive S t)^2)
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L
        (augGuardTime cfg ε M (augTimedInput cfg s.1))*
          (protectedScalarTotal L E A (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
            augGuardTime cfg ε M (augTimedInput cfg s.1))) s.2-
              sourcePrimitive S (augGuardTime cfg ε M (augTimedInput cfg s.1)))^2 := by
  simp_rw [protectedTimedWeightedCenteredSquare_segment cfg ε M L E A S s hd t ht]
  split_ifs
  · simp only [integral_const_mul,←Finset.mul_sum,mul_div_assoc,protectedObservableCandidateMean]
  · have hn0 : (n:ℝ)≠0 := by exact_mod_cast Nat.ne_of_gt hn
    simp [Fintype.card_prod,Fintype.card_fin,Nat.cast_mul,pow_two,hn0]

end NoThreeLine
#print axioms NoThreeLine.protectedTimedCenteredSquare_measurable
#print axioms NoThreeLine.protectedTimedWeightedCenteredSquare_candidate_mean
