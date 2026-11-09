import NoThreeLine.TimedTerminalKernel
import NoThreeLine.ExtendedRetirement

/-! Actual finite composition of constructed phases sharing one weight bound.
Each phase uses fresh board noise and is followed by point-deadline retirement
at its nominal absolute right endpoint. Globally stopped states are absorbing.
The expected-credit law is proved from the actual phase-terminal theorem. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine

structure SharedPhase (n : ℕ) (B : ℝ) where
  directions : Finset PrimitiveLines.ZPoint
  mask : Grid n → ℝ
  K : ℝ
  rho : ℝ
  box : ℝ≥0
  horizon : ℝ≥0
  mask_nonneg : ∀ p, 0 ≤ mask p
  mask_le_one : ∀ p, mask p ≤ 1
  box_large : max B 2 < (box : ℝ)

abbrev SharedPhase.config {n : ℕ} {B : ℝ} (c : SharedPhase n B) : FlowConfig n :=
  ⟨c.directions,c.mask,B,c.K,c.rho,c.box,c.horizon,c.mask_nonneg,c.box_large⟩

def phaseEndpoint {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (start : ℝ) (k : ℕ) : ℝ :=
  start + ∑ j ∈ Finset.range k, (cs j).horizon

theorem phaseEndpoint_zero {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (start : ℝ) :
    phaseEndpoint cs start 0 = start := by simp [phaseEndpoint]

theorem phaseEndpoint_succ {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (start : ℝ) (k : ℕ) :
    phaseEndpoint cs start (k+1) = phaseEndpoint cs start k + (cs k).horizon := by
  simp [phaseEndpoint,Finset.sum_range_succ,add_assoc]

theorem phaseEndpoint_mono {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (start : ℝ) :
    Monotone (phaseEndpoint cs start) := by
  apply monotone_nat_of_le_succ
  intro k
  rw [phaseEndpoint_succ]
  exact le_add_of_nonneg_right (cs k).horizon.coe_nonneg

def validDeadlineRetirement {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidExtendedState n B) : ValidExtendedState n B :=
  if e.val.process.stopped = true then e
  else ⟨deadlineRetirement deadline (e.val,t),deadlineRetirement_valid deadline e.val B t e.property⟩

theorem validDeadlineRetirement_measurable {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ) :
    Measurable (validDeadlineRetirement (B := B) deadline t) := by
  apply Measurable.ite
  · exact measurableSet_setOf.mpr (((ProcessState.measurable_stopped n).comp
      ((ExtendedState.measurable_process n).comp measurable_subtype_coe)).eq measurable_const)
  · exact measurable_id
  · exact ((deadlineRetirement_measurable deadline).comp
      (measurable_subtype_coe.prodMk measurable_const)).subtype_mk

theorem validDeadlineRetirement_credit {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidExtendedState n B) (p : Grid n) :
    validStateCredit B p (validDeadlineRetirement deadline t e) = validStateCredit B p e := by
  unfold validDeadlineRetirement
  split
  · rfl
  · exact deadlineRetirement_credit deadline e.val t p

theorem validDeadlineRetirement_stopped {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidExtendedState n B) (he : e.val.process.stopped = true) :
    validDeadlineRetirement deadline t e = e := by simp [validDeadlineRetirement,he]

theorem validDeadlineRetirement_stop_flag {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidExtendedState n B) :
    (validDeadlineRetirement deadline t e).val.process.stopped = e.val.process.stopped := by
  unfold validDeadlineRetirement
  split <;> rfl

theorem validDeadlineRetirement_selected {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidExtendedState n B) :
    (validDeadlineRetirement deadline t e).val.process.selected = e.val.process.selected := by
  unfold validDeadlineRetirement
  split <;> rfl

theorem validDeadlineRetirement_inactive {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidExtendedState n B) (he : e.val.process.stopped ≠ true) (p : Grid n)
    (hp : deadline p ≤ t) :
    ((validDeadlineRetirement deadline t e).val.process.accounts p).status ≠ .active := by
  simpa only [validDeadlineRetirement,if_neg he] using deadlineRetirement_inactive deadline e.val t p hp

abbrev PhaseNoise (n : ℕ) := ℕ → BoardClockPath n

def scheduledPhase {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (deadline : Grid n → ℝ)
    (start : ℝ) (hn : 0 < n) (j : ℕ)
    (a : ValidExtendedState n B × PhaseNoise n) : ValidExtendedState n B :=
  validDeadlineRetirement deadline (phaseEndpoint cs start (j+1))
    (phaseTerminal (cs j).config hn a)

theorem scheduledPhase_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ) :
    Measurable (scheduledPhase cs deadline start hn j) :=
  (validDeadlineRetirement_measurable deadline _).comp (phaseTerminal_measurable _ hn)

theorem scheduledPhase_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B) (j : ℕ)
    (e : ValidExtendedState n B) (p : Grid n) :
    (∫ ω, validStateCredit B p (scheduledPhase cs deadline start hn j (e,ω))
      ∂FreshBoardWaits.freshBoardMeasure n (B/n)) = validStateCredit B p e := by
  simp only [scheduledPhase,validDeadlineRetirement_credit]
  exact phaseTerminal_expected_credit (cs j).config hn hB (cs j).mask_le_one e p

theorem scheduledPhase_stopped {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (e : ValidExtendedState n B) (he : e.val.process.stopped = true) (ω : PhaseNoise n) :
    scheduledPhase cs deadline start hn j (e,ω) = e := by
  unfold scheduledPhase
  rw [phaseTerminal_stopped (cs j).config hn e he,validDeadlineRetirement_stopped _ _ e he]

theorem scheduledPhase_deadline_inactive {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (e : ValidExtendedState n B) (ω : PhaseNoise n)
    (he : (scheduledPhase cs deadline start hn j (e,ω)).val.process.stopped ≠ true)
    (p : Grid n) (hp : deadline p ≤ phaseEndpoint cs start (j+1)) :
    ((scheduledPhase cs deadline start hn j (e,ω)).val.process.accounts p).status ≠ .active := by
  apply validDeadlineRetirement_inactive _ _ _ _ p hp
  simpa only [scheduledPhase,validDeadlineRetirement_stop_flag] using he

def phaseIndexedStep {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (deadline : Grid n → ℝ)
    (start : ℝ) (hn : 0 < n)
    (a : (ℕ × ValidExtendedState n B) × PhaseNoise n) : ℕ × ValidExtendedState n B :=
  (a.1.1+1,scheduledPhase cs deadline start hn a.1.1 (a.1.2,a.2))

theorem phaseIndexedStep_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) :
    Measurable (phaseIndexedStep cs deadline start hn) := by
  have hm : Measurable (fun a : ℕ × (ValidExtendedState n B × PhaseNoise n) =>
      scheduledPhase cs deadline start hn a.1 a.2) :=
    measurable_from_prod_countable_right (fun j => scheduledPhase_measurable cs deadline start hn j)
  have hg : Measurable (fun a : (ℕ × ValidExtendedState n B) × PhaseNoise n =>
      (a.1.1,(a.1.2,a.2))) :=
    measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd)
  have hsecond := hm.comp hg
  have hfirst : Measurable (fun a : (ℕ × ValidExtendedState n B) × PhaseNoise n => a.1.1+1) :=
    (measurable_of_countable (fun j : ℕ => j+1)).comp measurable_fst.fst
  exact hfirst.prodMk hsecond

def finitePhaseState {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (deadline : Grid n → ℝ)
    (start : ℝ) (hn : 0 < n) (k : ℕ) (e : ValidExtendedState n B)
    (v : Fin k → PhaseNoise n) : ValidExtendedState n B :=
  (GenericCreditIteration.finiteState (phaseIndexedStep cs deadline start hn) k (0,e) v).2

theorem finitePhaseState_index {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidExtendedState n B) (v : Fin k → PhaseNoise n) :
    (GenericCreditIteration.finiteState (phaseIndexedStep cs deadline start hn) k (0,e) v).1 = k := by
  induction k with
  | zero => rfl
  | succ k ih => simp only [GenericCreditIteration.finiteState,phaseIndexedStep,ih]

theorem finitePhaseState_zero {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidExtendedState n B) (v : Fin 0 → PhaseNoise n) :
    finitePhaseState cs deadline start hn 0 e v = e := rfl

theorem finitePhaseState_succ {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidExtendedState n B) (v : Fin (k+1) → PhaseNoise n) :
    finitePhaseState cs deadline start hn (k+1) e v = scheduledPhase cs deadline start hn k
      (finitePhaseState cs deadline start hn k e (fun i => v i.castSucc),v (Fin.last k)) := by
  simp only [finitePhaseState,GenericCreditIteration.finiteState,phaseIndexedStep,finitePhaseState_index]

theorem finitePhaseState_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ) :
    Measurable (fun a : ValidExtendedState n B × (Fin k → PhaseNoise n) =>
      finitePhaseState cs deadline start hn k a.1 a.2) :=
  ((GenericCreditIteration.finiteState_measurable _ (phaseIndexedStep_measurable cs deadline start hn) k).comp
    ((measurable_const.prodMk measurable_fst).prodMk measurable_snd)).snd

theorem finitePhaseState_valid {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidExtendedState n B) (v : Fin k → PhaseNoise n) :
    (finitePhaseState cs deadline start hn k e v).val.Valid B :=
  (finitePhaseState cs deadline start hn k e v).property

theorem finitePhaseState_noThree {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidExtendedState n B) (v : Fin k → PhaseNoise n) :
    NoThree (finitePhaseState cs deadline start hn k e v).val.process.selected :=
  (finitePhaseState cs deadline start hn k e v).property.1.1

theorem finitePhaseState_stopped {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidExtendedState n B) (he : e.val.process.stopped = true) (v : Fin k → PhaseNoise n) :
    finitePhaseState cs deadline start hn k e v = e := by
  induction k with
  | zero => rfl
  | succ k ih => rw [finitePhaseState_succ,ih,scheduledPhase_stopped _ _ _ _ _ e he]

theorem finitePhaseState_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B) (k : ℕ)
    (e : ValidExtendedState n B) (p : Grid n) :
    (∫ v, validStateCredit B p (finitePhaseState cs deadline start hn k e v)
      ∂Measure.pi (fun _ : Fin k => FreshBoardWaits.freshBoardMeasure n (B/n))) = validStateCredit B p e := by
  letI : IsProbabilityMeasure (FreshBoardWaits.freshBoardMeasure n (B/n)) :=
    phaseNoise_probability (cs 0).config hn hB
  exact GenericCreditIteration.finite_expected_credit _ (phaseIndexedStep_measurable cs deadline start hn)
    (FreshBoardWaits.freshBoardMeasure n (B/n)) (fun a => validStateCredit B p a.2)
    ((validStateCredit_measurable B p).comp measurable_snd) B (fun a => validStateCredit_bounds B p a.2)
    (fun a => scheduledPhase_expected_credit cs deadline start hn hB a.1 a.2 p) k (0,e)

def phaseNoiseState {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (deadline : Grid n → ℝ)
    (start : ℝ) (hn : 0 < n) (k : ℕ) (e : ValidExtendedState n B)
    (ω : ℕ → PhaseNoise n) : ValidExtendedState n B :=
  finitePhaseState cs deadline start hn k e (GenericCreditIteration.noisePrefix k ω)

theorem phaseNoiseState_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ) :
    Measurable (fun a : ValidExtendedState n B × (ℕ → PhaseNoise n) =>
      phaseNoiseState cs deadline start hn k a.1 a.2) :=
  (finitePhaseState_measurable cs deadline start hn k).comp
    (measurable_fst.prodMk ((GenericCreditIteration.noisePrefix_measurable k).comp measurable_snd))

theorem phaseNoiseState_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B) (k : ℕ)
    (e : ValidExtendedState n B) (p : Grid n) :
    (∫ ω, validStateCredit B p (phaseNoiseState cs deadline start hn k e ω)
      ∂Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))) = validStateCredit B p e := by
  letI : IsProbabilityMeasure (FreshBoardWaits.freshBoardMeasure n (B/n)) :=
    phaseNoise_probability (cs 0).config hn hB
  exact GenericCreditIteration.infinitePi_expected_credit _ (phaseIndexedStep_measurable cs deadline start hn)
    (FreshBoardWaits.freshBoardMeasure n (B/n)) (fun a => validStateCredit B p a.2)
    ((validStateCredit_measurable B p).comp measurable_snd) B (fun a => validStateCredit_bounds B p a.2)
    (fun a => scheduledPhase_expected_credit cs deadline start hn hB a.1 a.2 p) k (0,e)

end NoThreeLine

#print axioms NoThreeLine.finitePhaseState_noThree
#print axioms NoThreeLine.finitePhaseState_expected_credit
#print axioms NoThreeLine.phaseNoiseState_expected_credit
