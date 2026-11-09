import NoThreeLine.ProtectedLedgerExponential
import NoThreeLine.ProtectedLedgerStageBounds

/-! The likelihood-weighted observable is evaluated at the real timed
update, including postgeometry positive retirement and auxiliary stop.
Its conditional mark/label mean is the selected-segment formula. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedLineSave_withCoordinates {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (z : Coordinates n) (saved : Grid n→ℝ) : protectedLineSave L e (e.withCoordinates z) saved=saved := by
  funext p
  have h : ¬((e.process.accounts p).status=.active ∧ (e.process.accounts p).status=.retired) := by
    rintro ⟨ha,hr⟩
    cases ha.symm.trans hr
  exact if_neg h

theorem protectedLedger_augOutcome_eq_raw {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (x : AugmentedCappedInput cfg) (saved : Grid n→ℝ) (p : Grid n)
    (z : CandidateData n) :
    protectedLineCredit L (augOutcome cfg ε M (x,z)).physical
        (protectedLineSave L x.1.1.val (augOutcome cfg ε M (x,z)).physical saved) p=
      protectedLineCredit L (augRawOutcome cfg ε M (x,z)).physical
        (protectedLineSave L x.1.1.val (augRawOutcome cfg ε M (x,z)).physical saved) p := by
  by_cases hp : (x.1.1.val.process.accounts p).status=.active
  · rw [protectedLineCredit_after_active L x.1.1.val _ saved p hp,
      protectedLineCredit_after_active L x.1.1.val _ saved p hp]
    have hk := congrArg (fun v : Coordinates n=>v.2.1 L)
      (augmented_resolve_coordinates (augRawOutcome cfg ε M (x,z)) cfg.directions cfg.B cfg.K cfg.rho ε M)
    change (augOutcome cfg ε M (x,z)).physical.clocks L=(augRawOutcome cfg ε M (x,z)).physical.clocks L at hk
    simp only [augOutcome,AugmentedState.resolve_credit,occupancy,augmented_resolve_selected]
    rw [show ((augRawOutcome cfg ε M (x,z)).resolve cfg.directions cfg.B cfg.K cfg.rho ε M).physical.clocks L=
      (augRawOutcome cfg ε M (x,z)).physical.clocks L from hk]
  · have hraw : ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).status=
        (x.1.1.val.process.accounts p).status := by
      unfold augRawOutcome
      split_ifs
      · exact ExtendedState.candidateUpdate_inactive_status _ cfg.directions cfg.mask cfg.B p _ _ _ hp
      · rfl
    have hout := augOutcome_inactive_status cfg ε M x p hp z
    simp only [protectedLineCredit,protectedLineSave_inactive L x.1.1.val _ saved p hp,hraw,hout]
    cases hstatus : (x.1.1.val.process.accounts p).status <;>
      simp_all [CreditAccount.credit]

def protectedTimedWeightedCredit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  augTimedLineLikelihood cfg ε M L (s.1,z)*
    protectedTimedCredit cfg L p (protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z)))

theorem protectedTimedWeightedCredit_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (s : ProtectedTimedState cfg) :
    Measurable (protectedTimedWeightedCredit cfg ε M L p s) := by
  exact (augTimedLineLikelihood_section_measurable cfg ε M L s.1).mul
    ((protectedTimedCredit_measurable cfg L p).comp ((protectedRemember_measurable cfg L).comp
      (measurable_const.prodMk ((augTimedStep_measurable cfg ε M).comp (measurable_const.prodMk measurable_id)))))

theorem protectedTimedWeightedCredit_segment {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (s : ProtectedTimedState cfg)
    (hd : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true))
    (t : ℝ) (ht : 0<t) (q : Grid n) (z : ℝ) :
    protectedTimedWeightedCredit cfg ε M L p s ((t,q),z)=
      if t≤augGuardTime cfg ε M (augTimedInput cfg s.1) then
        selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
          protectedForbiddenMarkCredit L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2
            cfg.directions cfg.mask cfg.B q p (fun _=>false) z
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L
        (augGuardTime cfg ε M (augTimedInput cfg s.1))*
          protectedLineCredit L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
            augGuardTime cfg ε M (augTimedInput cfg s.1))) s.2 p := by
  unfold protectedTimedWeightedCredit protectedTimedCredit protectedRemember
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
    rw [ha,protectedForbiddenMarkCredit_actual]
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
    change (_*_)*protectedLineCredit L _ (protectedLineSave L s.1.val.1.physical _ s.2) p=
      _*(_*protectedLineCredit L _ (protectedLineSave L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) _ s.2) p)
    rw [mul_assoc]
    rfl
  · rw [if_neg htg]
    have ha : augAdvance cfg ε M (augTimedInput cfg s.1,t)=augGuardTime cfg ε M (augTimedInput cfg s.1) := by
      change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s.1)) t)=_
      rw [min_eq_left (le_of_not_ge htg),max_eq_right (augGuardTime_mem cfg ε M _ s.1.property.1.1).1]
    rw [lineCandidateSurvival_outside_time cfg ε M L s.1 t q z (fun h=>htg h.2.2),mul_one,
      augRawOutcome,if_neg (fun h=>htg h.2)]
    change _*protectedLineCredit L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
      augAdvance cfg ε M (augTimedInput cfg s.1,t)))
      (protectedLineSave L s.1.val.1.physical (s.1.val.1.physical.withCoordinates _) s.2) p=_
    rw [protectedLineSave_withCoordinates,ha]

theorem protectedTimedWeightedCredit_candidate_mean {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (s : ProtectedTimedState cfg) (hn : 0<n)
    (hd : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true)) (t : ℝ) (ht : 0<t) :
    (∑q : Grid n,∫z,protectedTimedWeightedCredit cfg ε M L p s ((t,q),z) ∂markMeasure)/(n:ℝ)^2=
      if t≤augGuardTime cfg ε M (augTimedInput cfg s.1) then
        selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
          protectedLedgerCandidateMean L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2
            cfg.directions cfg.mask cfg.B (fun _ _=>false) p
      else selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L
        (augGuardTime cfg ε M (augTimedInput cfg s.1))*
          protectedLineCredit L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
            augGuardTime cfg ε M (augTimedInput cfg s.1))) s.2 p := by
  simp_rw [protectedTimedWeightedCredit_segment cfg ε M L p s hd t ht]
  split_ifs
  · simp only [integral_const_mul,←Finset.mul_sum,mul_div_assoc,protectedLedgerCandidateMean]
  · have hn0 : (n:ℝ)≠0 := by exact_mod_cast Nat.ne_of_gt hn
    simp [Fintype.card_prod,Fintype.card_fin,Nat.cast_mul,pow_two,hn0]

end NoThreeLine

#print axioms NoThreeLine.protectedLedger_augOutcome_eq_raw
#print axioms NoThreeLine.protectedTimedWeightedCredit_candidate_mean
