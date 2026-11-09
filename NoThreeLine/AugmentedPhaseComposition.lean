import NoThreeLine.AugmentedTerminalKernel
import NoThreeLine.FinitePhaseComposition

/-! Finite phase composition with actual eta carried through every phase
and deadline retirement. Phase deadlines are applied at absolute right
endpoints. Initial zero-deadline retirement remains an explicit initial step. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine

def augValidDeadlineRetirement {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidAugmentedState n B) : ValidAugmentedState n B :=
  if e.val.physical.process.stopped = true then e
  else ⟨⟨deadlineRetirement deadline (e.val.physical,t),e.val.eta⟩,
    deadlineRetirement_valid deadline e.val.physical B t e.property.1,e.property.2⟩

theorem augValidDeadlineRetirement_measurable {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ) :
    Measurable (augValidDeadlineRetirement (B := B) deadline t) := by
  apply Measurable.ite
  · exact measurableSet_setOf.mpr (((ProcessState.measurable_stopped n).comp
      ((ExtendedState.measurable_process n).comp
        ((AugmentedState.measurable_physical n).comp measurable_subtype_coe))).eq measurable_const)
  · exact measurable_id
  · apply Measurable.subtype_mk
    exact AugmentedState.measurable_mk _ _
      ((deadlineRetirement_measurable deadline).comp
        (((AugmentedState.measurable_physical n).comp measurable_subtype_coe).prodMk measurable_const))
      ((AugmentedState.measurable_eta n).comp measurable_subtype_coe)

theorem augValidDeadlineRetirement_credit {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidAugmentedState n B) (p : Grid n) :
    validAugStateCredit B p (augValidDeadlineRetirement deadline t e) = validAugStateCredit B p e := by
  unfold augValidDeadlineRetirement
  split
  · rfl
  · exact deadlineRetirement_credit deadline e.val.physical t p

theorem augValidDeadlineRetirement_stopped {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidAugmentedState n B) (he : e.val.physical.process.stopped = true) :
    augValidDeadlineRetirement deadline t e = e := by simp [augValidDeadlineRetirement,he]

theorem augValidDeadlineRetirement_stop_flag {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidAugmentedState n B) :
    (augValidDeadlineRetirement deadline t e).val.physical.process.stopped = e.val.physical.process.stopped := by
  unfold augValidDeadlineRetirement
  split <;> rfl

theorem augValidDeadlineRetirement_eta {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidAugmentedState n B) :
    (augValidDeadlineRetirement deadline t e).val.eta = e.val.eta := by
  unfold augValidDeadlineRetirement
  split <;> rfl

theorem augValidDeadlineRetirement_inactive {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidAugmentedState n B) (he : e.val.physical.process.stopped ≠ true) (p : Grid n)
    (hp : deadline p ≤ t) :
    ((augValidDeadlineRetirement deadline t e).val.physical.process.accounts p).status ≠ .active := by
  simpa only [augValidDeadlineRetirement,if_neg he] using
    deadlineRetirement_inactive deadline e.val.physical t p hp

theorem augPhaseTerminal_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n cfg.B) (a b : Grid n) (hab : a ≠ b) (hinit : 1-ε ≤ e.val.eta a b)
    (ω : PhaseNoise n) : 1-ε ≤ (augPhaseTerminal cfg ε M hn (e,ω)).val.eta a b :=
  augTimedTerminal_eta_lower cfg ε M hn (augPhaseStart cfg ε M e) a b hab hinit ω

def augScheduledPhase {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ)
    (start : ℝ) (hn : 0 < n) (j : ℕ)
    (a : ValidAugmentedState n B × PhaseNoise n) : ValidAugmentedState n B :=
  augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1))
    (augPhaseTerminal (cs j).config ε M hn a)

theorem augScheduledPhase_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ) :
    Measurable (augScheduledPhase cs ε M deadline start hn j) :=
  (augValidDeadlineRetirement_measurable deadline _).comp (augPhaseTerminal_measurable _ ε M hn)

theorem augScheduledPhase_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B) (j : ℕ)
    (e : ValidAugmentedState n B) (p : Grid n) :
    (∫ ω, validAugStateCredit B p (augScheduledPhase cs ε M deadline start hn j (e,ω))
      ∂FreshBoardWaits.freshBoardMeasure n (B/n)) = validAugStateCredit B p e := by
  simp only [augScheduledPhase,augValidDeadlineRetirement_credit]
  exact augPhaseTerminal_expected_credit (cs j).config ε M hn hB (cs j).mask_le_one e p

theorem augScheduledPhase_stopped {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (e : ValidAugmentedState n B) (he : e.val.physical.process.stopped = true) (ω : PhaseNoise n) :
    augScheduledPhase cs ε M deadline start hn j (e,ω) = e := by
  unfold augScheduledPhase
  rw [augPhaseTerminal_stopped (cs j).config ε M hn e he,augValidDeadlineRetirement_stopped _ _ e he]

theorem augScheduledPhase_deadline_inactive {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (e : ValidAugmentedState n B) (ω : PhaseNoise n)
    (he : (augScheduledPhase cs ε M deadline start hn j (e,ω)).val.physical.process.stopped ≠ true)
    (p : Grid n) (hp : deadline p ≤ phaseEndpoint cs start (j+1)) :
    ((augScheduledPhase cs ε M deadline start hn j (e,ω)).val.physical.process.accounts p).status ≠ .active := by
  apply augValidDeadlineRetirement_inactive _ _ _ _ p hp
  simpa only [augScheduledPhase,augValidDeadlineRetirement_stop_flag] using he

def augPhaseIndexedStep {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ)
    (start : ℝ) (hn : 0 < n)
    (a : (ℕ × ValidAugmentedState n B) × PhaseNoise n) : ℕ × ValidAugmentedState n B :=
  (a.1.1+1,augScheduledPhase cs ε M deadline start hn a.1.1 (a.1.2,a.2))

theorem augPhaseIndexedStep_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) :
    Measurable (augPhaseIndexedStep cs ε M deadline start hn) := by
  have hm : Measurable (fun a : ℕ × (ValidAugmentedState n B × PhaseNoise n) =>
      augScheduledPhase cs ε M deadline start hn a.1 a.2) :=
    measurable_from_prod_countable_right (fun j => augScheduledPhase_measurable cs ε M deadline start hn j)
  have hg : Measurable (fun a : (ℕ × ValidAugmentedState n B) × PhaseNoise n =>
      (a.1.1,(a.1.2,a.2))) :=
    measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd)
  have hsecond := hm.comp hg
  have hfirst : Measurable (fun a : (ℕ × ValidAugmentedState n B) × PhaseNoise n => a.1.1+1) :=
    (measurable_of_countable (fun j : ℕ => j+1)).comp measurable_fst.fst
  exact hfirst.prodMk hsecond

def augFinitePhaseState {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ)
    (start : ℝ) (hn : 0 < n) (k : ℕ) (e : ValidAugmentedState n B)
    (v : Fin k → PhaseNoise n) : ValidAugmentedState n B :=
  (GenericCreditIteration.finiteState (augPhaseIndexedStep cs ε M deadline start hn) k (0,e) v).2

theorem augFinitePhaseState_index {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidAugmentedState n B) (v : Fin k → PhaseNoise n) :
    (GenericCreditIteration.finiteState (augPhaseIndexedStep cs ε M deadline start hn) k (0,e) v).1 = k := by
  induction k with
  | zero => rfl
  | succ k ih => simp only [GenericCreditIteration.finiteState,augPhaseIndexedStep,ih]

theorem augFinitePhaseState_zero {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n B) (v : Fin 0 → PhaseNoise n) :
    augFinitePhaseState cs ε M deadline start hn 0 e v = e := rfl

theorem augFinitePhaseState_succ {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidAugmentedState n B) (v : Fin (k+1) → PhaseNoise n) :
    augFinitePhaseState cs ε M deadline start hn (k+1) e v = augScheduledPhase cs ε M deadline start hn k
      (augFinitePhaseState cs ε M deadline start hn k e (fun i => v i.castSucc),v (Fin.last k)) := by
  simp only [augFinitePhaseState,GenericCreditIteration.finiteState,augPhaseIndexedStep,augFinitePhaseState_index]

theorem augFinitePhaseState_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ) :
    Measurable (fun a : ValidAugmentedState n B × (Fin k → PhaseNoise n) =>
      augFinitePhaseState cs ε M deadline start hn k a.1 a.2) :=
  ((GenericCreditIteration.finiteState_measurable _ (augPhaseIndexedStep_measurable cs ε M deadline start hn) k).comp
    ((measurable_const.prodMk measurable_fst).prodMk measurable_snd)).snd

theorem augFinitePhaseState_valid {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidAugmentedState n B) (v : Fin k → PhaseNoise n) :
    (augFinitePhaseState cs ε M deadline start hn k e v).val.Valid B :=
  (augFinitePhaseState cs ε M deadline start hn k e v).property

theorem augFinitePhaseState_noThree {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidAugmentedState n B) (v : Fin k → PhaseNoise n) :
    NoThree (augFinitePhaseState cs ε M deadline start hn k e v).val.physical.process.selected :=
  (augFinitePhaseState cs ε M deadline start hn k e v).property.1.1.1

theorem augFinitePhaseState_stopped {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidAugmentedState n B) (he : e.val.physical.process.stopped = true) (v : Fin k → PhaseNoise n) :
    augFinitePhaseState cs ε M deadline start hn k e v = e := by
  induction k with
  | zero => rfl
  | succ k ih => rw [augFinitePhaseState_succ,ih,augScheduledPhase_stopped _ _ _ _ _ _ _ e he]

theorem augFinitePhaseState_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B) (k : ℕ)
    (e : ValidAugmentedState n B) (p : Grid n) :
    (∫ v, validAugStateCredit B p (augFinitePhaseState cs ε M deadline start hn k e v)
      ∂Measure.pi (fun _ : Fin k => FreshBoardWaits.freshBoardMeasure n (B/n))) = validAugStateCredit B p e := by
  letI : IsProbabilityMeasure (FreshBoardWaits.freshBoardMeasure n (B/n)) :=
    phaseNoise_probability (cs 0).config hn hB
  exact GenericCreditIteration.finite_expected_credit _ (augPhaseIndexedStep_measurable cs ε M deadline start hn)
    (FreshBoardWaits.freshBoardMeasure n (B/n)) (fun a => validAugStateCredit B p a.2)
    ((validAugStateCredit_measurable B p).comp measurable_snd) B (fun a => validAugStateCredit_bounds B p a.2)
    (fun a => augScheduledPhase_expected_credit cs ε M deadline start hn hB a.1 a.2 p) k (0,e)

def augPhaseNoiseState {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ)
    (start : ℝ) (hn : 0 < n) (k : ℕ) (e : ValidAugmentedState n B)
    (ω : ℕ → PhaseNoise n) : ValidAugmentedState n B :=
  augFinitePhaseState cs ε M deadline start hn k e (GenericCreditIteration.noisePrefix k ω)

theorem augPhaseNoiseState_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ) :
    Measurable (fun a : ValidAugmentedState n B × (ℕ → PhaseNoise n) =>
      augPhaseNoiseState cs ε M deadline start hn k a.1 a.2) :=
  (augFinitePhaseState_measurable cs ε M deadline start hn k).comp
    (measurable_fst.prodMk ((GenericCreditIteration.noisePrefix_measurable k).comp measurable_snd))

theorem augPhaseNoiseState_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B) (k : ℕ)
    (e : ValidAugmentedState n B) (p : Grid n) :
    (∫ ω, validAugStateCredit B p (augPhaseNoiseState cs ε M deadline start hn k e ω)
      ∂Measure.infinitePi (fun _ : ℕ => FreshBoardWaits.freshBoardMeasure n (B/n))) = validAugStateCredit B p e := by
  letI : IsProbabilityMeasure (FreshBoardWaits.freshBoardMeasure n (B/n)) :=
    phaseNoise_probability (cs 0).config hn hB
  exact GenericCreditIteration.infinitePi_expected_credit _ (augPhaseIndexedStep_measurable cs ε M deadline start hn)
    (FreshBoardWaits.freshBoardMeasure n (B/n)) (fun a => validAugStateCredit B p a.2)
    ((validAugStateCredit_measurable B p).comp measurable_snd) B (fun a => validAugStateCredit_bounds B p a.2)
    (fun a => augScheduledPhase_expected_credit cs ε M deadline start hn hB a.1 a.2 p) k (0,e)

theorem augScheduledPhase_eta_lower {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (e : ValidAugmentedState n B) (a b : Grid n) (hab : a ≠ b) (hinit : 1-ε ≤ e.val.eta a b)
    (ω : PhaseNoise n) :
    1-ε ≤ (augScheduledPhase cs ε M deadline start hn j (e,ω)).val.eta a b := by
  unfold augScheduledPhase
  rw [augValidDeadlineRetirement_eta]
  exact augPhaseTerminal_eta_lower (cs j).config ε M hn e a b hab hinit ω

theorem augFinitePhaseState_eta_lower {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (e : ValidAugmentedState n B) (a b : Grid n) (hab : a ≠ b) (hinit : 1-ε ≤ e.val.eta a b)
    (v : Fin k → PhaseNoise n) :
    1-ε ≤ (augFinitePhaseState cs ε M deadline start hn k e v).val.eta a b := by
  induction k with
  | zero => exact hinit
  | succ k ih =>
    rw [augFinitePhaseState_succ]
    exact augScheduledPhase_eta_lower cs ε M deadline start hn k _ a b hab (ih _) _

end NoThreeLine

#print axioms NoThreeLine.augFinitePhaseState_noThree
#print axioms NoThreeLine.augFinitePhaseState_expected_credit
#print axioms NoThreeLine.augPhaseNoiseState_expected_credit
#print axioms NoThreeLine.augFinitePhaseState_eta_lower
