import NoThreeLine.AugmentedCappedSegment
import NoThreeLine.GenericCreditIteration

/-! Credit on a strict no-arrival event is obtained by comparing two caps
of the same selected flow. No flow semigroup or post-cut independence is
assumed. The exponential survival factor is the actual board-clock law. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set Filter
namespace NoThreeLine
open AuxiliaryODE

theorem setIntegral_eq_const_of_same_mean {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) (E : Set Ω) (hE : MeasurableSet E) (f g : Ω→ℝ) (c : ℝ)
    (hf : Integrable f μ) (hg : Integrable g μ) (hm : (∫ω,f ω ∂μ)=∫ω,g ω ∂μ)
    (hout : ∀ᵐω ∂μ,ω∉E→f ω=g ω) (hin : ∀ᵐω ∂μ,ω∈E→g ω=c) :
    (∫ω in E,f ω ∂μ)=μ.real E*c := by
  have hcomp : (∫ω in Eᶜ,f ω ∂μ)=∫ω in Eᶜ,g ω ∂μ :=
    setIntegral_congr_ae hE.compl hout
  have hconst : (∫ω in E,g ω ∂μ)=μ.real E*c := by
    rw [setIntegral_congr_ae hE hin,setIntegral_const,smul_eq_mul]
  linarith [integral_add_compl hE hf,integral_add_compl hE hg]

theorem cappedOutcome_credit_integrable {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (hn : 0<n) (hB : 0<cfg.B) (he : x.1.val.Valid cfg.B) (p : Grid n) :
    Integrable (fun ω=>((cappedOutcome cfg (x,WinnerMarkLaw.firstMarkedRace hn ω)).process.accounts p).credit)
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hc : Measurable (fun e : ExtendedState n=>(e.process.accounts p).credit) :=
    CreditAccount.measurable_credit.comp ((ProcessState.measurable_account n p).comp
      (ExtendedState.measurable_process n))
  apply GenericCreditIteration.bounded_nonnegative_integrable _ _
    (hc.comp ((cappedOutcome_measurable cfg).comp
      (measurable_const.prodMk (WinnerMarkLaw.firstMarkedRace_measurable hn)))) cfg.B
  intro ω
  exact ((cappedOutcome cfg (x,WinnerMarkLaw.firstMarkedRace hn ω)).process.accounts p).credit_bounds cfg.B
    ((cappedOutcome_valid cfg x he _).2.1.1 p)

theorem cappedOutcome_survival_credit {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (he : x.1.val.Valid cfg.B)
    (p : Grid n) (u : ℝ) (hu : u∈Icc (0:ℝ) (cappedGuardTime cfg x)) :
    (∫ω in {ω | u<BoardFirstCandidate.firstTime hn ω},
      ((cappedOutcome cfg (x,WinnerMarkLaw.firstMarkedRace hn ω)).process.accounts p).credit
      ∂boardClockMeasure n (cfg.B/n))=
      Real.exp (-(n*cfg.B*u))*((selectedTrajectory cfg (x.1,u)).process.accounts p).credit := by
  let μ := boardClockMeasure n (cfg.B/n)
  let y : CappedInput cfg := (x.1,u)
  let f := fun ω=>((cappedOutcome cfg (x,WinnerMarkLaw.firstMarkedRace hn ω)).process.accounts p).credit
  let g := fun ω=>((cappedOutcome cfg (y,WinnerMarkLaw.firstMarkedRace hn ω)).process.accounts p).credit
  let c := ((selectedTrajectory cfg (x.1,u)).process.accounts p).credit
  have huy : cappedGuardTime cfg y=u := by
    have hub : u≤selectedGuardTime cfg x.1 := hu.2.trans (cappedGuardTime_mem cfg x he).2
    simp only [cappedGuardTime,segmentTime,y,min_eq_right hub,max_eq_right hu.1]
  have htime (ω : BoardClockPath n) : (WinnerMarkLaw.firstMarkedRace hn ω).1.1=
      BoardFirstCandidate.firstTime hn ω := rfl
  have hE : MeasurableSet {ω | u<BoardFirstCandidate.firstTime hn ω} :=
    measurableSet_lt measurable_const (BoardFirstCandidate.firstTime_measurable hn)
  have hh := setIntegral_eq_const_of_same_mean μ {ω | u<BoardFirstCandidate.firstTime hn ω} hE f g c
    (cappedOutcome_credit_integrable cfg x hn hB he p)
    (cappedOutcome_credit_integrable cfg y hn hB he p)
    ((cappedOutcome_first_credit cfg x hn hB hm he p).trans
      (cappedOutcome_first_credit cfg y hn hB hm he p).symm) ?_ ?_
  · rw [BoardFirstCandidate.candidate_firstTime_survival hn cfg.B u hB hu.1] at hh
    exact hh
  · filter_upwards [BoardFirstCandidate.firstTime_ae_positive hn (cfg.B/n)
      (div_pos hB (by exact_mod_cast hn))] with ω hω
    intro hout
    have hw : BoardFirstCandidate.firstTime hn ω≤u := le_of_not_gt hout
    change _=g ω
    dsimp only [f,g]
    rw [cappedOutcome_credit_eq cfg x he _ hω p,cappedOutcome_credit_eq cfg y he _ hω p,huy]
    simp only [ProcessState.firstCreditObservable,htime,if_pos hw,if_pos (hw.trans hu.2)]
    rfl
  · filter_upwards [BoardFirstCandidate.firstTime_ae_positive hn (cfg.B/n)
      (div_pos hB (by exact_mod_cast hn))] with ω hω
    intro hin
    dsimp only [g]
    rw [cappedOutcome_credit_eq cfg y he _ hω p,huy]
    simp only [ProcessState.firstCreditObservable,htime,if_neg (not_le.mpr hin)]
    rfl

theorem augOutcome_survival_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (he : x.1.1.val.Valid cfg.B) (p : Grid n)
    (u : ℝ) (hu : u∈Icc (0:ℝ) (augGuardTime cfg ε M x)) :
    (∫ω in {ω | u<BoardFirstCandidate.firstTime hn ω},
      ((augOutcome cfg ε M (x,WinnerMarkLaw.firstMarkedRace hn ω)).physical.process.accounts p).credit
      ∂boardClockMeasure n (cfg.B/n))=
      Real.exp (-(n*cfg.B*u))*((selectedTrajectory cfg (x.1.1,u)).process.accounts p).credit := by
  simp_rw [augOutcome_credit_eq]
  exact cappedOutcome_survival_credit cfg (augPhysicalInput cfg ε M x) hn hB hm he p u hu

end NoThreeLine
#print axioms NoThreeLine.cappedOutcome_survival_credit
#print axioms NoThreeLine.augOutcome_survival_credit
