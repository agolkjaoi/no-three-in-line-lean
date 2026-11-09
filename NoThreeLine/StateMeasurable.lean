import NoThreeLine.PendingFirstCredit

/-! The actual state carries the product measurable structure: finite
labels and real account weights. Real coordinates are not made discrete. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

deriving instance Fintype for CreditStatus

instance : MeasurableSpace CreditStatus := ⊤
instance : MeasurableSingletonClass CreditStatus := ⟨fun _ => trivial⟩

instance : MeasurableSpace CreditAccount :=
  MeasurableSpace.comap (fun a : CreditAccount => (a.status,a.weight)) inferInstance

theorem CreditAccount.measurable_fields : Measurable (fun a : CreditAccount => (a.status,a.weight)) :=
  comap_measurable _

theorem CreditAccount.measurable_status : Measurable CreditAccount.status := measurable_fields.fst
theorem CreditAccount.measurable_weight : Measurable CreditAccount.weight := measurable_fields.snd

theorem CreditAccount.measurable_mk {X : Type*} [MeasurableSpace X]
    (status : X → CreditStatus) (weight : X → ℝ)
    (hs : Measurable status) (hw : Measurable weight) :
    Measurable (fun x => CreditAccount.mk (status x) (weight x)) :=
  measurable_comap_iff.mpr (hs.prodMk hw)

theorem CreditAccount.measurable_credit : Measurable CreditAccount.credit := by
  apply Measurable.ite
  · exact ((measurableSet_singleton CreditStatus.active).preimage measurable_status).union
      ((measurableSet_singleton CreditStatus.retired).preimage measurable_status)
  · exact measurable_weight
  · exact measurable_const

theorem CreditAccount.measurable_retire :
    Measurable (fun x : CreditAccount × Bool => x.1.retire x.2) := by
  unfold retire
  apply Measurable.ite
  · exact ((measurableSet_singleton CreditStatus.active).preimage
      (measurable_status.comp measurable_fst)).inter
      ((measurableSet_singleton true).preimage measurable_snd)
  · exact measurable_mk _ _ measurable_const (measurable_weight.comp measurable_fst)
  · exact measurable_fst

instance (n : ℕ) : MeasurableSpace (ProcessState n) :=
  MeasurableSpace.comap (fun s : ProcessState n => (s.selected,(s.accounts,s.stopped))) inferInstance

theorem ProcessState.measurable_fields (n : ℕ) :
    Measurable (fun s : ProcessState n => (s.selected,(s.accounts,s.stopped))) := comap_measurable _

theorem ProcessState.measurable_selected (n : ℕ) : Measurable (@ProcessState.selected n) :=
  (measurable_fields n).fst
theorem ProcessState.measurable_accounts (n : ℕ) : Measurable (@ProcessState.accounts n) :=
  (measurable_fields n).snd.fst
theorem ProcessState.measurable_stopped (n : ℕ) : Measurable (@ProcessState.stopped n) :=
  (measurable_fields n).snd.snd

theorem ProcessState.measurable_mk {n : ℕ} {X : Type*} [MeasurableSpace X]
    (selected : X → Finset (Grid n)) (accounts : X → Grid n → CreditAccount) (stopped : X → Bool)
    (hsel : Measurable selected) (hacc : Measurable accounts) (hstop : Measurable stopped) :
    Measurable (fun x => ProcessState.mk (selected x) (accounts x) (stopped x)) :=
  measurable_comap_iff.mpr (hsel.prodMk (hacc.prodMk hstop))

theorem ProcessState.measurable_withWeights {n : ℕ} (s : ProcessState n) :
    Measurable (s.withWeights) := by
  apply measurable_mk _ _ _ measurable_const _ measurable_const
  apply measurable_pi_lambda
  intro p
  exact CreditAccount.measurable_mk _ _ measurable_const (measurable_pi_apply p)

theorem ProcessState.measurable_retire (n : ℕ) :
    Measurable (fun x : ProcessState n × (Grid n → Bool) => x.1.retire x.2) := by
  apply measurable_mk _ _ _ ((measurable_selected n).comp measurable_fst) _
    ((measurable_stopped n).comp measurable_fst)
  apply measurable_pi_lambda
  intro p
  exact CreditAccount.measurable_retire.comp
    (((measurable_pi_apply p).comp ((measurable_accounts n).comp measurable_fst)).prodMk
      ((measurable_pi_apply p).comp measurable_snd))

theorem ProcessState.measurable_stop (n : ℕ) : Measurable (@ProcessState.stop n) := by
  apply measurable_mk _ _ _ (measurable_selected n) _ measurable_const
  apply measurable_pi_lambda
  intro p
  exact CreditAccount.measurable_retire.comp
    (((measurable_pi_apply p).comp (measurable_accounts n)).prodMk measurable_const)

end NoThreeLine

#print axioms NoThreeLine.CreditAccount.measurable_credit
#print axioms NoThreeLine.ProcessState.measurable_retire
#print axioms NoThreeLine.ProcessState.measurable_stop
