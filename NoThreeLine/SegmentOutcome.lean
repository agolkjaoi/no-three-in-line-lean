import NoThreeLine.ModeFlowSelection

/-! One full measurable flow/candidate/boundary step. Geometry is processed
before positive retirement; the underlying first candidate is the actual one. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE

def segmentTime {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box × ℝ) : ℝ :=
  max 0 (min (selectedGuardTime cfg x.1) x.2)

def segmentPreState {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box × ((ℝ × Grid n) × ℝ)) : ExtendedState n :=
  selectedTrajectory cfg (x.1,segmentTime cfg (x.1,x.2.1.1))

def segmentOutcome {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box × ((ℝ × Grid n) × ℝ)) : ExtendedState n :=
  if 0 < x.2.1.1 ∧ x.2.1.1 ≤ selectedGuardTime cfg x.1 then
    ((segmentPreState cfg x).candidateUpdate cfg.directions cfg.mask cfg.B x.2.1.2
      (fun _ => false) x.2.2).resolve cfg.directions cfg.B cfg.K cfg.rho
  else (segmentPreState cfg x).resolve cfg.directions cfg.B cfg.K cfg.rho

theorem segmentTime_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (segmentTime cfg) :=
  measurable_const.max (((selectedGuardTime_measurable cfg).comp measurable_fst).min measurable_snd)

theorem segmentPreState_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (segmentPreState cfg) :=
  (selectedTrajectory_measurable cfg).comp
    (measurable_fst.prodMk ((segmentTime_measurable cfg).comp (measurable_fst.prodMk measurable_snd.fst.fst)))

theorem segmentOutcome_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (segmentOutcome cfg) := by
  unfold segmentOutcome
  apply Measurable.ite
  · exact (measurableSet_lt measurable_const measurable_snd.fst.fst).inter
      (measurableSet_le measurable_snd.fst.fst ((selectedGuardTime_measurable cfg).comp measurable_fst))
  · apply (ExtendedState.measurable_resolve cfg.directions cfg.B cfg.K cfg.rho).comp
    exact (ExtendedState.measurable_candidateUpdate cfg.directions cfg.mask cfg.B).comp
      ((((segmentPreState_measurable cfg).prodMk measurable_const).prodMk measurable_snd.snd).prodMk
        measurable_snd.fst.snd)
  · exact (ExtendedState.measurable_resolve cfg.directions cfg.B cfg.K cfg.rho).comp
      (segmentPreState_measurable cfg)

theorem segmentTime_mem {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (he : e.val.Valid cfg.B) (t : ℝ) :
    segmentTime cfg (e,t) ∈ Icc (0 : ℝ) (selectedGuardTime cfg e) :=
  ⟨le_max_left _ _,max_le (selectedCurve_spec cfg e he.2.1).2.1.1 (min_le_left _ _)⟩

theorem segmentPreState_valid {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (he : e.val.Valid cfg.B) (x : (ℝ × Grid n) × ℝ) : (segmentPreState cfg (e,x)).Valid cfg.B :=
  selectedTrajectory_valid cfg e he _ (segmentTime_mem cfg e he x.1.1)

theorem segmentOutcome_valid {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (he : e.val.Valid cfg.B) (x : (ℝ × Grid n) × ℝ) : (segmentOutcome cfg (e,x)).Valid cfg.B := by
  have hpre := segmentPreState_valid cfg e he x
  unfold segmentOutcome
  split_ifs
  · exact ExtendedState.resolve_valid _ _ _ _ _ (ExtendedState.candidateUpdate_valid _ _ _ _ _ _ _ hpre)
  · exact ExtendedState.resolve_valid _ _ _ _ _ hpre

theorem selectedCurve_first_credit {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (he : e.val.Valid cfg.B)
    (p : Grid n) :
    (∫ ω, e.val.process.firstCreditObservable cfg.directions cfg.mask cfg.B
      (selectedGuardTime cfg e) (fun t => (selectedCurve cfg (e,t)).1) p
        (WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (cfg.B/n)) =
      (e.val.process.accounts p).credit := by
  obtain ⟨hinit,htime,hder,hbefore,hcontact⟩ := selectedCurve_spec cfg e he.2.1
  have hc : Continuous (fun t : ℝ => selectedCurve cfg (e,t)) := by
    change Continuous (fun t : ℝ => (selectedModeFlow cfg e.val.mode).curve (stateInitialBall e,t))
    exact (selectedModeFlow cfg e.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hd : ∀ t ∈ Ioo (0 : ℝ) (selectedGuardTime cfg e),
      HasDerivAt (fun t => selectedCurve cfg (e,t))
        (vectorField e.val.process cfg.directions cfg.mask (selectedCurve cfg (e,t))) t := by
    intro t ht
    exact (hder t ⟨ht.1.le,ht.2.le⟩).2.2.hasDerivAt (Icc_mem_nhds ht.1 ht.2)
  have hwi : (selectedCurve cfg (e,0)).1 = (fun p => (e.val.process.accounts p).weight) := by
    rw [hinit]
    rfl
  exact coordinate_flow_first_candidate_credit e.val.process cfg.directions cfg.mask cfg.B
    ⟨selectedGuardTime cfg e,htime.1⟩ hn hB he.1 (fun p => ⟨cfg.mask_nonneg p,hm p⟩)
    (fun t => selectedCurve cfg (e,t)) hc.continuousOn (fun t ht => (hder t ht).1) hwi hd p

theorem segmentOutcome_credit_eq {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (he : e.val.Valid cfg.B) (x : (ℝ × Grid n) × ℝ) (ht : 0 < x.1.1) (p : Grid n) :
    ((segmentOutcome cfg (e,x)).process.accounts p).credit =
      e.val.process.firstCreditObservable cfg.directions cfg.mask cfg.B (selectedGuardTime cfg e)
        (fun t => (selectedCurve cfg (e,t)).1) p x := by
  have hτ : 0 ≤ selectedGuardTime cfg e := (selectedCurve_spec cfg e he.2.1).2.1.1
  by_cases h : x.1.1 ≤ selectedGuardTime cfg e
  · simp only [segmentOutcome,if_pos (And.intro ht h),ExtendedState.resolve_credit]
    simp only [segmentPreState,segmentTime,min_eq_right h,max_eq_right ht.le,
      selectedTrajectory,ExtendedState.candidateUpdate,ExtendedState.withCoordinates,
      ProcessState.firstCreditObservable,if_pos h]
  · simp only [segmentOutcome,not_and_of_not_right _ h,if_false,ExtendedState.resolve_credit]
    simp only [segmentPreState,segmentTime,min_eq_left (le_of_not_ge h),max_eq_right hτ,
      selectedTrajectory,ExtendedState.withCoordinates,ProcessState.firstCreditObservable,if_neg h]

theorem segmentOutcome_first_credit {n : ℕ} (cfg : FlowConfig n) (e : StateBall n cfg.box)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (he : e.val.Valid cfg.B)
    (p : Grid n) :
    (∫ ω, ((segmentOutcome cfg (e,WinnerMarkLaw.firstMarkedRace hn ω)).process.accounts p).credit
      ∂boardClockMeasure n (cfg.B/n)) = (e.val.process.accounts p).credit := by
  rw [← selectedCurve_first_credit cfg e hn hB hm he p]
  apply integral_congr_ae
  filter_upwards [BoardFirstCandidate.firstTime_ae_positive hn (cfg.B/n)
    (div_pos hB (by exact_mod_cast hn))] with ω ht
  exact segmentOutcome_credit_eq cfg e he _ ht p

end NoThreeLine

#print axioms NoThreeLine.segmentOutcome_measurable
#print axioms NoThreeLine.segmentOutcome_valid
#print axioms NoThreeLine.segmentOutcome_first_credit
