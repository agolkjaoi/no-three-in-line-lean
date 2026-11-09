import NoThreeLine.BirthTerminalCard
import NoThreeLine.RecycledScheduledPhase

/-! A jointly measurable actual running-birth-rate phase kernel and its
selected-point expectation identity, including endpoint deadline retirement. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

theorem cumulativeBirthRate_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (k : ℕ) :
    Measurable (fun x : AugTimedState cfg × BoardClockPath n => cumulativeBirthRate cfg ε M p hn x.1 k x.2) :=
  Finset.measurable_sum _ (fun j _=>(clockBirthRunningRate_measurable cfg ε M p hn).comp
    (augRecycledPair_joint_measurable cfg ε M hn j))

theorem terminalBirthRate_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) :
    Measurable (fun x : AugTimedState cfg × BoardClockPath n => terminalBirthRate cfg ε M p hn x.1 x.2) := by
  classical
  exact Measurable.find (cumulativeBirthRate_joint_measurable cfg ε M p hn)
    (fun k=>(augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).setOf)
    (fun x : AugTimedState cfg × BoardClockPath n => augRecycledCompletionPredicate_exists cfg ε M hn x.1 x.2)

def validSelectedIndicator {n : ℕ} (B : ℝ) (p : Grid n) (s : ValidAugmentedState n B) : ℝ :=
  if p∈s.val.physical.process.selected then 1 else 0

theorem validSelectedIndicator_measurable {n : ℕ} (B : ℝ) (p : Grid n) :
    Measurable (validSelectedIndicator B p) :=
  (measurable_of_countable (fun S : Finset (Grid n) => if p∈S then (1:ℝ) else 0)).comp
    ((ProcessState.measurable_selected n).comp ((ExtendedState.measurable_process n).comp
      ((AugmentedState.measurable_physical n).comp measurable_subtype_coe)))

theorem validSelectedIndicator_bounds {n : ℕ} (B : ℝ) (p : Grid n) (s : ValidAugmentedState n B) :
    0≤validSelectedIndicator B p s ∧ validSelectedIndicator B p s≤1 := by
  unfold validSelectedIndicator
  split_ifs <;> norm_num

theorem validSelectedIndicator_deadline {n : ℕ} (B : ℝ) (p : Grid n) (s : ValidAugmentedState n B)
    (deadline : Grid n → ℝ) (t : ℝ) :
    validSelectedIndicator B p (augValidDeadlineRetirement deadline t s)=validSelectedIndicator B p s := by
  unfold augValidDeadlineRetirement
  split_ifs <;> rfl

def phaseBirthRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n)
    (x : ValidAugmentedState n cfg.B × BoardClockPath n) : ℝ :=
  terminalBirthRate cfg ε M p hn (augPhaseStart cfg ε M x.1) x.2

theorem phaseBirthRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n) :
    Measurable (phaseBirthRate cfg ε M p hn) := by
  have hp : Measurable (fun x : ValidAugmentedState n cfg.B × BoardClockPath n =>
      (augPhaseStart cfg ε M x.1,x.2)) :=
    (((augPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd)
  change Measurable ((fun x : AugTimedState cfg × BoardClockPath n =>
    terminalBirthRate cfg ε M p hn x.1 x.2) ∘
      (fun x : ValidAugmentedState n cfg.B × BoardClockPath n => (augPhaseStart cfg ε M x.1,x.2)))
  exact (terminalBirthRate_joint_measurable cfg ε M p hn).comp hp

theorem phaseBirthRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (x : ValidAugmentedState n cfg.B × BoardClockPath n) :
    0≤phaseBirthRate cfg ε M p hn x ∧ phaseBirthRate cfg ε M p hn x≤(cfg.horizon:ℝ)*(cfg.B/n) :=
  terminalBirthRate_bounds cfg ε M p hn hB hm _ _

theorem phase_birth_compensation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ValidAugmentedState n cfg.B) :
    (∫ω,validSelectedIndicator cfg.B p (augPhaseRecycledPair cfg ε M hn (s,ω)).1
      ∂boardClockMeasure n (cfg.B/n))=validSelectedIndicator cfg.B p s+
        ∫ω,phaseBirthRate cfg ε M p hn (s,ω) ∂boardClockMeasure n (cfg.B/n) :=
  terminal_selectedIndicator_compensation cfg ε M p hn hB hm (augPhaseStart cfg ε M s)

theorem scheduled_birth_compensation {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (j : ℕ) (s : ValidAugmentedState n B) :
    (∫ω,validSelectedIndicator B p (recycledScheduledPair cs ε M deadline start hn j (s,ω)).1
      ∂boardClockMeasure n (B/n))=validSelectedIndicator B p s+
        ∫ω,phaseBirthRate (cs j).config ε M p hn (s,ω) ∂boardClockMeasure n (B/n) := by
  simp only [recycledScheduledPair,validSelectedIndicator_deadline]
  exact phase_birth_compensation (cs j).config ε M p hn hB (cs j).mask_le_one s

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminalBirthRate_joint_measurable
#print axioms NoThreeLine.BirthWitness.phase_birth_compensation
#print axioms NoThreeLine.BirthWitness.scheduled_birth_compensation
