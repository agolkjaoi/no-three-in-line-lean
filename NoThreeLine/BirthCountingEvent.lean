import NoThreeLine.BirthObservationEvent
import NoThreeLine.WinnerMarkIntegral

/-! Actual point-birth indicators and their selected-set increments.
The mark average uses the existing acceptance threshold and real mark law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

def eligibleBirth {n : ℕ} (s : ProcessState n) (q : Grid n) : Prop :=
  s.stopped=false ∧ (s.accounts q).status=.active

instance {n : ℕ} (s : ProcessState n) (q : Grid n) : Decidable (eligibleBirth s q) :=
  inferInstanceAs (Decidable (s.stopped=false ∧ (s.accounts q).status=.active))

def markBirthIndicator {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ) (B : ℝ)
    (p q : Grid n) (z : ℝ) : ℝ :=
  if q=p ∧ z≤s.acceptance mask B q ∧ eligibleBirth s q then 1 else 0

theorem markBirthIndicator_mean {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ) (B : ℝ)
    (hB : 0<B) (hm : ∀q,0≤mask q ∧ mask q≤1)
    (hw : ∀q,(s.accounts q).status=.active → 0≤(s.accounts q).weight ∧ (s.accounts q).weight≤B)
    (p q : Grid n) :
    (∫z,markBirthIndicator s mask B p q z ∂markMeasure)=if q=p then s.acceptance mask B p else 0 := by
  classical
  by_cases hqp : q=p
  · subst q
    by_cases he : eligibleBirth s p
    · have hα := s.acceptance_bounds mask B hB hm hw p
      simpa only [markBirthIndicator,he,and_true,true_and,ite_true,mul_one,mul_zero,add_zero] using
        mark_integral_ite (s.acceptance mask B p) 1 0 hα.1 hα.2
    · have hα : s.acceptance mask B p=0 := by
        change ¬(s.stopped=false ∧ (s.accounts p).status=.active) at he
        simp only [ProcessState.acceptance,if_neg he]
      simp only [markBirthIndicator,he,and_false,if_false,integral_zero,ite_true,hα]
  · simp only [markBirthIndicator,hqp,false_and,if_false,integral_zero]

def birthIndicator {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (x : AugTimedState cfg × CandidateData n) : ℝ :=
  if timedBirth cfg ε M x ∧ x.2.1.2=p then 1 else 0

theorem birthIndicator_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (birthIndicator cfg ε M p) := by
  apply Measurable.ite _ measurable_const measurable_const
  exact ((timedBirth_measurable cfg ε M).and (measurable_snd.fst.snd.eq measurable_const)).setOf

theorem birthIndicator_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (x : AugTimedState cfg × CandidateData n) :
    0≤birthIndicator cfg ε M p x ∧ birthIndicator cfg ε M p x≤1 := by
  unfold birthIndicator
  split_ifs <;> norm_num

def selectedIndicator {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (s : AugTimedState cfg) : ℝ :=
  if p∈s.val.1.physical.process.selected then 1 else 0

theorem selectedIndicator_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (selectedIndicator cfg p) :=
  (measurable_of_countable (fun S : Finset (Grid n) => if p∈S then (1:ℝ) else 0)).comp
    ((ProcessState.measurable_selected n).comp ((ExtendedState.measurable_process n).comp
      ((AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst)))

theorem selectedIndicator_bounds {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (s : AugTimedState cfg) :
    0≤selectedIndicator cfg p s ∧ selectedIndicator cfg p s≤1 := by
  unfold selectedIndicator
  split_ifs <;> norm_num

theorem selectedIndicator_step {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (x : AugTimedState cfg × CandidateData n) :
    selectedIndicator cfg p (augTimedStep cfg ε M x)=selectedIndicator cfg p x.1+birthIndicator cfg ε M p x := by
  classical
  unfold selectedIndicator birthIndicator
  rw [augTimedStep_selected]
  by_cases hb : timedBirth cfg ε M x
  · have hf := timedBirth_fresh cfg ε M x hb
    by_cases hq : x.2.1.2=p
    · subst p
      simp [hb,hf]
    · simp [hb,hq,Ne.symm hq]
  · simp [hb]

theorem selected_card_step {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × CandidateData n) :
    ((augTimedStep cfg ε M x).val.1.physical.process.selected.card : ℝ)=
      (x.1.val.1.physical.process.selected.card : ℝ)+(if timedBirth cfg ε M x then 1 else 0) := by
  classical
  rw [augTimedStep_selected]
  by_cases hb : timedBirth cfg ε M x
  · simp only [if_pos hb,Finset.card_insert_of_notMem (timedBirth_fresh cfg ε M x hb),Nat.cast_add,Nat.cast_one]
  · simp [hb]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.markBirthIndicator_mean
#print axioms NoThreeLine.BirthWitness.selectedIndicator_step
#print axioms NoThreeLine.BirthWitness.selected_card_step
