import NoThreeLine.ProtectedEntropyExponential
import NoThreeLine.ProtectedLedgerTimedEvent

/-! Saved entropy evaluated at the real capped candidate update. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedTimedWeightedEntropy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  augTimedLineLikelihood cfg ε M L (s.1,z)*
    protectedEntropy cfg.B (protectedTimedCredit cfg L p (protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z))))

theorem protectedTimedWeightedEntropy_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (s : ProtectedTimedState cfg) :
    Measurable (protectedTimedWeightedEntropy cfg ε M L p s) := by
  exact (augTimedLineLikelihood_section_measurable cfg ε M L s.1).mul
    ((protectedEntropy_measurable cfg.B).comp ((protectedTimedCredit_measurable cfg L p).comp ((protectedRemember_measurable cfg L).comp
      (measurable_const.prodMk ((augTimedStep_measurable cfg ε M).comp (measurable_const.prodMk measurable_id))))))

theorem protectedTimedWeightedEntropy_segment {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (s : ProtectedTimedState cfg)
    (hd : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true))
    (t : ℝ) (ht : 0<t) (q : Grid n) (z : ℝ) :
    protectedTimedWeightedEntropy cfg ε M L p s ((t,q),z)=
      if t≤augGuardTime cfg ε M (augTimedInput cfg s.1) then
        selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
          protectedForbiddenMarkEntropy L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2
            cfg.directions cfg.mask cfg.B q p (fun _=>false) z
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L
        (augGuardTime cfg ε M (augTimedInput cfg s.1))*
          protectedLineEntropy L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
            augGuardTime cfg ε M (augTimedInput cfg s.1))) s.2 cfg.B p := by
  unfold protectedTimedWeightedEntropy protectedTimedCredit protectedRemember
  simp only [protectedLineEntropy]
  simp only [augTimedLineLikelihood,if_neg hd,augTimedStep,augTimedStepPair]
  have hraw := protectedLedger_augOutcome_eq_raw cfg ε M L (augTimedInput cfg s.1) s.2 p ((t,q),z)
  change protectedLineCredit L (augOutcome cfg ε M (augTimedInput cfg s.1,((t,q),z))).physical
      (protectedLineSave L s.1.val.1.physical (augOutcome cfg ε M (augTimedInput cfg s.1,((t,q),z))).physical s.2) p=_ at hraw
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
    rw [ha,protectedForbiddenMarkEntropy_actual]
    simp only [protectedLineEntropy]
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
    rw [hpre]
    change (_*_)*protectedEntropy cfg.B (protectedLineCredit L _ (protectedLineSave L s.1.val.1.physical _ s.2) p)=
      _*(_*protectedEntropy cfg.B (protectedLineCredit L _ (protectedLineSave L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) _ s.2) p))
    rw [mul_assoc]
    rfl
  · rw [if_neg htg]
    have ha : augAdvance cfg ε M (augTimedInput cfg s.1,t)=augGuardTime cfg ε M (augTimedInput cfg s.1) := by
      change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s.1)) t)=_
      rw [min_eq_left (le_of_not_ge htg),max_eq_right (augGuardTime_mem cfg ε M _ s.1.property.1.1).1]
    rw [lineCandidateSurvival_outside_time cfg ε M L s.1 t q z (fun h=>htg h.2.2),mul_one,
      augRawOutcome,if_neg (fun h=>htg h.2)]
    change _*protectedEntropy cfg.B (protectedLineCredit L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
      augAdvance cfg ε M (augTimedInput cfg s.1,t)))
      (protectedLineSave L s.1.val.1.physical (s.1.val.1.physical.withCoordinates _) s.2) p)=_
    rw [protectedLineSave_withCoordinates,ha]

theorem protectedTimedWeightedEntropy_candidate_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (s : ProtectedTimedState cfg) (hn : 0<n)
    (hd : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true)) (t : ℝ) (ht : 0<t) :
    (∑q : Grid n,∫z,protectedTimedWeightedEntropy cfg ε M L p s ((t,q),z) ∂markMeasure)/(n:ℝ)^2=
      if t≤augGuardTime cfg ε M (augTimedInput cfg s.1) then
        selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
          protectedEntropyCandidateMean L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2
            cfg.directions cfg.mask cfg.B (fun _ _=>false) p
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L
        (augGuardTime cfg ε M (augTimedInput cfg s.1))*
          protectedLineEntropy L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
            augGuardTime cfg ε M (augTimedInput cfg s.1))) s.2 cfg.B p := by
  simp_rw [protectedTimedWeightedEntropy_segment cfg ε M L p s hd t ht]
  split_ifs
  · simp only [integral_const_mul,←Finset.mul_sum,mul_div_assoc,protectedEntropyCandidateMean]
  · have hn0 : (n:ℝ)≠0 := by exact_mod_cast Nat.ne_of_gt hn
    simp [Fintype.card_prod,Fintype.card_fin,Nat.cast_mul,pow_two,hn0]

end NoThreeLine
#print axioms NoThreeLine.protectedTimedWeightedEntropy_candidate_mean
