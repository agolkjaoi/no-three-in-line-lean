import NoThreeLine.ProtectedWholeSquareExponential
import NoThreeLine.ProtectedLedgerTimedEvent

/-! A scalar transform of each actual saved point credit, summed and
squared after the real timed outcome and boundary resolution. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedScalarTotal {n : ℕ} (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ)
    (e : ExtendedState n) (saved : Grid n→ℝ) : ℝ :=
  ∑p∈E,A (protectedLineCredit L e saved p)

def protectedTimedScalarSquare {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (s : ProtectedTimedState cfg) : ℝ :=
  (protectedScalarTotal L E A s.1.val.1.physical s.2)^2

def protectedTimedWeightedScalarSquare {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  augTimedLineLikelihood cfg ε M L (s.1,z)*
    protectedTimedScalarSquare cfg L E A (protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z)))

theorem protectedTimedScalarSquare_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Measurable A) :
    Measurable (protectedTimedScalarSquare cfg L E A) :=
  (Finset.measurable_sum _ (fun p _=>hA.comp (protectedTimedCredit_measurable cfg L p))).pow_const 2

theorem protectedTimedWeightedScalarSquare_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Measurable A) (s : ProtectedTimedState cfg) :
    Measurable (protectedTimedWeightedScalarSquare cfg ε M L E A s) :=
  (augTimedLineLikelihood_section_measurable cfg ε M L s.1).mul
    ((protectedTimedScalarSquare_measurable cfg L E A hA).comp ((protectedRemember_measurable cfg L).comp
      (measurable_const.prodMk ((augTimedStep_measurable cfg ε M).comp (measurable_const.prodMk measurable_id)))))

theorem protectedScalarTotal_augOutcome_eq_raw {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ) (x : AugmentedCappedInput cfg)
    (saved : Grid n→ℝ) (z : CandidateData n) :
    protectedScalarTotal L E A (augOutcome cfg ε M (x,z)).physical
      (protectedLineSave L x.1.1.val (augOutcome cfg ε M (x,z)).physical saved)=
    protectedScalarTotal L E A (augRawOutcome cfg ε M (x,z)).physical
      (protectedLineSave L x.1.1.val (augRawOutcome cfg ε M (x,z)).physical saved) := by
  apply Finset.sum_congr rfl
  intro p _
  rw [protectedLedger_augOutcome_eq_raw cfg ε M L x saved p z]

theorem protectedTimedWeightedScalarSquare_segment {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ) (s : ProtectedTimedState cfg)
    (hd : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true))
    (t : ℝ) (ht : 0<t) (q : Grid n) (z : ℝ) :
    protectedTimedWeightedScalarSquare cfg ε M L E A s ((t,q),z)=
      if t≤augGuardTime cfg ε M (augTimedInput cfg s.1) then
        selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
          protectedForbiddenMarkObservable L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2
            cfg.directions cfg.mask cfg.B (fun e a=>(protectedScalarTotal L E A e a)^2) q (fun _=>false) z
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L
        (augGuardTime cfg ε M (augTimedInput cfg s.1))*
          (protectedScalarTotal L E A (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
            augGuardTime cfg ε M (augTimedInput cfg s.1))) s.2)^2 := by
  unfold protectedTimedWeightedScalarSquare protectedTimedScalarSquare protectedRemember
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
      (protectedLineSave L s.1.val.1.physical (s.1.val.1.physical.withCoordinates _) s.2))^2=_
    rw [protectedLineSave_withCoordinates,ha]

theorem protectedTimedWeightedScalarSquare_candidate_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ) (s : ProtectedTimedState cfg) (hn : 0<n)
    (hd : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true)) (t : ℝ) (ht : 0<t) :
    (∑q : Grid n,∫z,protectedTimedWeightedScalarSquare cfg ε M L E A s ((t,q),z) ∂markMeasure)/(n:ℝ)^2=
      if t≤augGuardTime cfg ε M (augTimedInput cfg s.1) then
        selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
          protectedObservableCandidateMean L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2
            cfg.directions cfg.mask cfg.B (fun _ _=>false) (fun e a=>(protectedScalarTotal L E A e a)^2)
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L
        (augGuardTime cfg ε M (augTimedInput cfg s.1))*
          (protectedScalarTotal L E A (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
            augGuardTime cfg ε M (augTimedInput cfg s.1))) s.2)^2 := by
  simp_rw [protectedTimedWeightedScalarSquare_segment cfg ε M L E A s hd t ht]
  split_ifs
  · simp only [integral_const_mul,←Finset.mul_sum,mul_div_assoc,protectedObservableCandidateMean]
  · have hn0 : (n:ℝ)≠0 := by exact_mod_cast Nat.ne_of_gt hn
    simp [Fintype.card_prod,Fintype.card_fin,Nat.cast_mul,pow_two,hn0]

end NoThreeLine
#print axioms NoThreeLine.protectedScalarTotal_augOutcome_eq_raw
#print axioms NoThreeLine.protectedTimedWeightedScalarSquare_candidate_mean
