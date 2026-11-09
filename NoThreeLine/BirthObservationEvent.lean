import NoThreeLine.BirthWitnessState
import NoThreeLine.AugmentedCreditIteration

/-! The actual accepted, eligible candidate is exactly the new selected
point, including when its postgeometry state immediately triggers aux stop. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator

abbrev CandidateData (n : ℕ) := (ℝ × Grid n) × ℝ

def segmentBirth {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × CandidateData n) : Prop :=
  (0<x.2.1.1 ∧ x.2.1.1≤augGuardTime cfg ε M x.1) ∧
  x.2.2≤(augPreState cfg ε M x).physical.process.acceptance cfg.mask cfg.B x.2.1.2 ∧
  (augPreState cfg ε M x).physical.process.stopped=false ∧
  ((augPreState cfg ε M x).physical.process.accounts x.2.1.2).status=.active

instance {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × CandidateData n) : Decidable (segmentBirth cfg ε M x) :=
  Classical.propDecidable _

theorem augPreState_selected {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × CandidateData n) :
    (augPreState cfg ε M x).physical.process.selected=x.1.1.1.val.process.selected := rfl

theorem augmented_resolve_selected {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (B K ρ ε M : ℝ) : (a.resolve Γ B K ρ ε M).physical.process.selected=a.physical.process.selected := by
  unfold AugmentedState.resolve ExtendedState.stop ExtendedState.resolve resolveBoundary
  split_ifs <;> rfl

theorem augRawOutcome_selected {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × CandidateData n) :
    (augRawOutcome cfg ε M x).physical.process.selected=
      if segmentBirth cfg ε M x then insert x.2.1.2 x.1.1.1.val.process.selected
      else x.1.1.1.val.process.selected := by
  classical
  by_cases hw : 0<x.2.1.1 ∧ x.2.1.1≤augGuardTime cfg ε M x.1
  · by_cases ha : x.2.2≤(augPreState cfg ε M x).physical.process.acceptance cfg.mask cfg.B x.2.1.2
    · by_cases he : (augPreState cfg ε M x).physical.process.stopped=false ∧
          ((augPreState cfg ε M x).physical.process.accounts x.2.1.2).status=.active
      · simp only [augRawOutcome,if_pos hw,ExtendedState.candidateUpdate_eq,if_pos ha,
          ExtendedState.birth,ProcessState.birth,if_pos he,segmentBirth,hw,ha,he.1,he.2,
          and_self,if_true]
        rfl
      · simp only [augRawOutcome,if_pos hw,ExtendedState.candidateUpdate_eq,if_pos ha,
          ExtendedState.birth,ProcessState.birth,if_neg he,segmentBirth,hw,ha,true_and,if_neg he]
        rfl
    · simp only [augRawOutcome,if_pos hw,ExtendedState.candidateUpdate_eq,if_neg ha,
        segmentBirth,hw,ha,false_and,and_false,if_false]
      rfl
  · simp only [augRawOutcome,if_neg hw,segmentBirth,hw,false_and,if_false]
    rfl

theorem augOutcome_selected {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × CandidateData n) :
    (augOutcome cfg ε M x).physical.process.selected=
      if segmentBirth cfg ε M x then insert x.2.1.2 x.1.1.1.val.process.selected
      else x.1.1.1.val.process.selected := by
  rw [augOutcome,augmented_resolve_selected,augRawOutcome_selected]

def timedBirth {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × CandidateData n) : Prop :=
  ¬(x.1.val.2≤0 ∨ x.1.val.1.physical.process.stopped=true) ∧
    segmentBirth cfg ε M (augTimedInput cfg x.1,x.2)

instance {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × CandidateData n) : Decidable (timedBirth cfg ε M x) :=
  Classical.propDecidable _

theorem augTimedStep_selected {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × CandidateData n) :
    (augTimedStep cfg ε M x).val.1.physical.process.selected=
      if timedBirth cfg ε M x then insert x.2.1.2 x.1.val.1.physical.process.selected
      else x.1.val.1.physical.process.selected := by
  classical
  unfold augTimedStep augTimedStepPair timedBirth
  split_ifs with hd
  · simp only [hd,not_true_eq_false,false_and,if_false]
  · simp only [hd,not_false_eq_true,true_and]
    exact augOutcome_selected cfg ε M _

theorem timedBirth_fresh {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × CandidateData n) (hx : timedBirth cfg ε M x) :
    x.2.1.2∉x.1.val.1.physical.process.selected := by
  have hp := augPreState_valid cfg ε M (augTimedInput cfg x.1) x.1.property.1.1 x.1.property.1.2 x.2
  exact (hp.1.1.2.1 x.2.1.2 hx.2.2.2.2).1

theorem timedBirth_iff_new_selected {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × CandidateData n) :
    timedBirth cfg ε M x ↔ x.2.1.2∉x.1.val.1.physical.process.selected ∧
      x.2.1.2∈(augTimedStep cfg ε M x).val.1.physical.process.selected := by
  classical
  rw [augTimedStep_selected]
  by_cases hb : timedBirth cfg ε M x
  · simp [hb,timedBirth_fresh cfg ε M x hb]
  · simp [hb]

theorem segmentBirth_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (segmentBirth cfg ε M) := by
  have hp : Measurable (fun x : AugmentedCappedInput cfg × CandidateData n =>
      (augPreState cfg ε M x).physical.process) :=
    (ExtendedState.measurable_process n).comp
      ((AugmentedState.measurable_physical n).comp (augPreState_measurable cfg ε M))
  have ha : Measurable (fun x : ProcessState n × Grid n=>x.1.acceptance cfg.mask cfg.B x.2) :=
    measurable_from_prod_countable_left (fun q=>ProcessState.measurable_acceptance cfg.mask cfg.B q)
  have hs : Measurable (fun x : ProcessState n × Grid n=>(x.1.accounts x.2).status) :=
    measurable_from_prod_countable_left
      (fun q=>CreditAccount.measurable_status.comp (ProcessState.measurable_account n q))
  exact ((measurableSet_setOf.mp (measurableSet_lt measurable_const measurable_snd.fst.fst)).and
    (measurable_snd.fst.fst.le' ((augGuardTime_measurable cfg ε M).comp measurable_fst))).and
    ((measurable_snd.snd.le' (ha.comp (hp.prodMk measurable_snd.fst.snd))).and
      ((((ProcessState.measurable_stopped n).comp hp).eq measurable_const).and
        ((hs.comp (hp.prodMk measurable_snd.fst.snd)).eq measurable_const)))

theorem timedBirth_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (timedBirth cfg ε M) := by
  have hd : Measurable (fun x : AugTimedState cfg × CandidateData n=>
      x.1.val.2≤0 ∨ x.1.val.1.physical.process.stopped=true) :=
    ((measurable_subtype_coe.snd.comp measurable_fst).le' measurable_const).or
      (((ProcessState.measurable_stopped n).comp ((ExtendedState.measurable_process n).comp
        ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)))).eq
          measurable_const)
  exact hd.not.and ((segmentBirth_measurable cfg ε M).comp
    (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.timedBirth_iff_new_selected
#print axioms NoThreeLine.BirthWitness.timedBirth_measurable
