import NoThreeLine.AugmentedState
import NoThreeLine.CappedProgress

/-! One actual segment with the physical and auxiliary stopping times.
The raw postgeometry state remains available before stop/positive retirement.
Eta is transported by its actual ODE and retained at every discrete update. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE

abbrev AugmentedCappedInput {n : ℕ} (cfg : FlowConfig n) := EtaFlowInput cfg × ℝ

def augPhysicalInput {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) : CappedInput cfg :=
  (x.1.1,min x.2 (selectedAuxTime cfg ε M x.1))

def augGuardTime {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) : ℝ := cappedGuardTime cfg (augPhysicalInput cfg ε M x)

def augAdvance {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × ℝ) : ℝ :=
  cappedAdvance cfg (augPhysicalInput cfg ε M x.1,x.2)

def augPreState {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × ((ℝ × Grid n) × ℝ)) : AugmentedState n :=
  ⟨cappedPreState cfg (augPhysicalInput cfg ε M x.1,x.2),
    selectedEtaCurve cfg (x.1.1,augAdvance cfg ε M (x.1,x.2.1.1))⟩

def augRawOutcome {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × ((ℝ × Grid n) × ℝ)) : AugmentedState n :=
  if 0 < x.2.1.1 ∧ x.2.1.1 ≤ augGuardTime cfg ε M x.1 then
    ⟨(augPreState cfg ε M x).physical.candidateUpdate cfg.directions cfg.mask cfg.B
      x.2.1.2 (fun _ => false) x.2.2,(augPreState cfg ε M x).eta⟩
  else augPreState cfg ε M x

def augOutcome {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × ((ℝ × Grid n) × ℝ)) : AugmentedState n :=
  (augRawOutcome cfg ε M x).resolve cfg.directions cfg.B cfg.K cfg.rho ε M

theorem augPhysicalInput_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (augPhysicalInput cfg ε M) :=
  measurable_fst.fst.prodMk (measurable_snd.min ((selectedAuxTime_measurable cfg ε M).comp measurable_fst))

theorem augGuardTime_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (augGuardTime cfg ε M) :=
  (cappedGuardTime_measurable cfg).comp (augPhysicalInput_measurable cfg ε M)

theorem augAdvance_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (augAdvance cfg ε M) :=
  (cappedAdvance_measurable cfg).comp
    (((augPhysicalInput_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd)

theorem augPreState_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (augPreState cfg ε M) :=
  AugmentedState.measurable_mk _ _
    ((cappedPreState_measurable cfg).comp
      (((augPhysicalInput_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd))
    ((selectedEtaCurve_measurable cfg).comp (measurable_fst.fst.prodMk
      ((augAdvance_measurable cfg ε M).comp (measurable_fst.prodMk measurable_snd.fst.fst))))

theorem augRawOutcome_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (augRawOutcome cfg ε M) := by
  unfold augRawOutcome
  apply Measurable.ite
  · exact (measurableSet_lt measurable_const measurable_snd.fst.fst).inter
      (measurableSet_le measurable_snd.fst.fst ((augGuardTime_measurable cfg ε M).comp measurable_fst))
  · apply AugmentedState.measurable_mk
    · exact (ExtendedState.measurable_candidateUpdate cfg.directions cfg.mask cfg.B).comp
        (((((AugmentedState.measurable_physical n).comp (augPreState_measurable cfg ε M)).prodMk
          measurable_const).prodMk measurable_snd.snd).prodMk measurable_snd.fst.snd)
    · exact (AugmentedState.measurable_eta n).comp (augPreState_measurable cfg ε M)
  · exact augPreState_measurable cfg ε M

theorem augOutcome_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (augOutcome cfg ε M) :=
  (AugmentedState.resolve_measurable cfg.directions cfg.B cfg.K cfg.rho ε M).comp
    (augRawOutcome_measurable cfg ε M)

theorem augGuardTime_mem {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) :
    augGuardTime cfg ε M x ∈ Icc (0 : ℝ) (selectedGuardTime cfg x.1.1) :=
  cappedGuardTime_mem cfg _ he

theorem augGuardTime_le_aux {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) : augGuardTime cfg ε M x ≤ selectedAuxTime cfg ε M x.1 := by
  change max 0 (min _ (min _ _)) ≤ _
  exact max_le (selectedAuxTime_bounds cfg ε M x.1).1 ((min_le_right _ _).trans (min_le_right _ _))

theorem augGuardTime_le_remaining {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (hH : 0 ≤ x.2) : augGuardTime cfg ε M x ≤ x.2 := by
  change max 0 (min _ (min _ _)) ≤ _
  exact max_le hH ((min_le_right _ _).trans (min_le_left _ _))

theorem augAdvance_mem {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (t : ℝ) :
    augAdvance cfg ε M (x,t) ∈ Icc (0 : ℝ) (augGuardTime cfg ε M x) :=
  cappedAdvance_mem cfg _ he t

theorem augPreState_valid {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hη : ∀ a b, 0 ≤ x.1.2 a b ∧ x.1.2 a b ≤ 1) (z : (ℝ × Grid n) × ℝ) :
    (augPreState cfg ε M (x,z)).Valid cfg.B := by
  have ht := augAdvance_mem cfg ε M x he z.1.1
  exact ⟨cappedPreState_valid cfg _ he z,
    selectedEtaCurve_bounds cfg x.1 he hη _ ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M x he).2⟩⟩

theorem augRawOutcome_valid {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hη : ∀ a b, 0 ≤ x.1.2 a b ∧ x.1.2 a b ≤ 1) (z : (ℝ × Grid n) × ℝ) :
    (augRawOutcome cfg ε M (x,z)).Valid cfg.B := by
  have hp := augPreState_valid cfg ε M x he hη z
  unfold augRawOutcome
  split_ifs
  · exact ⟨ExtendedState.candidateUpdate_valid _ _ _ _ _ _ _ hp.1,hp.2⟩
  · exact hp

theorem augOutcome_valid {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hη : ∀ a b, 0 ≤ x.1.2 a b ∧ x.1.2 a b ≤ 1) (z : (ℝ × Grid n) × ℝ) :
    (augOutcome cfg ε M (x,z)).Valid cfg.B :=
  AugmentedState.resolve_valid _ _ _ _ _ _ _ (augRawOutcome_valid cfg ε M x he hη z)

theorem augOutcome_eta {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × ((ℝ × Grid n) × ℝ)) :
    (augOutcome cfg ε M x).eta = selectedEtaCurve cfg (x.1.1,augAdvance cfg ε M (x.1,x.2.1.1)) := by
  unfold augOutcome
  rw [AugmentedState.resolve_eta]
  unfold augRawOutcome
  split_ifs <;> rfl

theorem augOutcome_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (a b : Grid n) (hab : a ≠ b) (hinit : 1-ε ≤ x.1.2 a b) (z : (ℝ × Grid n) × ℝ) :
    1-ε ≤ (augOutcome cfg ε M (x,z)).eta a b := by
  rw [augOutcome_eta]
  have ht := augAdvance_mem cfg ε M x he z.1.1
  exact selectedAuxTime_eta_lower cfg ε M x.1 a b hab hinit _
    ⟨ht.1,ht.2.trans (augGuardTime_le_aux cfg ε M x)⟩

theorem augOutcome_credit_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × ((ℝ × Grid n) × ℝ)) (p : Grid n) :
    ((augOutcome cfg ε M x).physical.process.accounts p).credit =
      ((cappedOutcome cfg (augPhysicalInput cfg ε M x.1,x.2)).process.accounts p).credit := by
  unfold augOutcome
  rw [AugmentedState.resolve_credit]
  unfold augRawOutcome cappedOutcome augGuardTime
  simp only [Prod.fst,Prod.snd]
  split_ifs <;> simp only [augPreState,ExtendedState.resolve_credit]

theorem augOutcome_first_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (hn : 0 < n) (hB : 0 < cfg.B)
    (hm : ∀ p, cfg.mask p ≤ 1) (he : x.1.1.val.Valid cfg.B) (p : Grid n) :
    (∫ ω, ((augOutcome cfg ε M (x,WinnerMarkLaw.firstMarkedRace hn ω)).physical.process.accounts p).credit
      ∂boardClockMeasure n (cfg.B/n)) = (x.1.1.val.process.accounts p).credit := by
  simp_rw [augOutcome_credit_eq]
  exact cappedOutcome_first_credit cfg _ hn hB hm he p

theorem augOutcome_budget_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ × Grid n) × ℝ) :
    (augOutcome cfg ε M (x,z)).physical.boundaryBudget ≤ x.1.1.val.boundaryBudget := by
  apply (AugmentedState.resolve_budget_le _ _ _ _ _ _ _).trans
  change _ ≤ (augPhysicalInput cfg ε M x).1.val.boundaryBudget
  rw [← cappedPreState_budget cfg (augPhysicalInput cfg ε M x) z]
  unfold augRawOutcome
  split_ifs
  · exact ExtendedState.candidateUpdate_budget_le _ _ _ _ _ _ _
  · exact le_rfl

end NoThreeLine

#print axioms NoThreeLine.augOutcome_measurable
#print axioms NoThreeLine.augOutcome_valid
#print axioms NoThreeLine.augOutcome_eta_lower
#print axioms NoThreeLine.augOutcome_first_credit
