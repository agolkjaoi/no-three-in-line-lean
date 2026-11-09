import NoThreeLine.RootFreezeMean
import NoThreeLine.RootFreezeRecycled
import NoThreeLine.WitnessHistoryEstimate

/-! The root observer on its proved invariant subtype. Only actual record,
saved-credit and empty-line invariants are carried; neither a mean bound
nor a restart law is a subtype assumption. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

abbrev GoodRootObservation {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :=
  {s : RootObservation cfg // RootObserverInvariant cfg p s ∧
    EmptyLineCredit s.1.1.val.1.physical}

def goodRootActual {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : GoodRootObservation cfg p) : GoodObservation cfg :=
  ⟨s.val.1,s.property.1.records,s.property.2⟩

theorem goodRootActual_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (goodRootActual cfg p) := measurable_subtype_coe.fst.subtype_mk

def goodRootInitial {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : GoodObservation cfg) : GoodRootObservation cfg p :=
  ⟨rootObserverInitial cfg p s.val,rootObserverInitial_invariant cfg p s.val s.property.1,s.property.2⟩

def goodRootStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (x : GoodRootObservation cfg p × CandidateData n) : GoodRootObservation cfg p :=
  ⟨rootObserverStep cfg ε M start p (x.1.val,x.2),
    rootObserverStep_invariant cfg ε M start p x.1.val x.2 x.1.property.1,
    by rw [rootObserverStep_projection]
       exact emptyLineCredit_augTimedStep cfg ε M x.1.val.1.1 x.2 x.1.property.2⟩

theorem goodRootStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) :
    Measurable (goodRootStep cfg ε M start p) :=
  ((rootObserverStep_measurable cfg ε M start p).comp
    ((measurable_subtype_coe.comp measurable_fst).prodMk measurable_snd)).subtype_mk

theorem goodRootStep_actual {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (x : GoodRootObservation cfg p × CandidateData n) :
    goodRootActual cfg p (goodRootStep cfg ε M start p x)=
      goodObservedStep cfg ε M start (goodRootActual cfg p x.1,x.2) := by
  apply Subtype.ext
  exact rootObserverStep_projection cfg ε M start p _

def goodRootClockStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : GoodRootObservation cfg p × BoardClockPath n) : GoodRootObservation cfg p :=
  goodRootStep cfg ε M start p (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem goodRootClockStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) : Measurable (goodRootClockStep cfg ε M start p hn) :=
  (goodRootStep_measurable cfg ε M start p).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

def goodRootRestartStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : GoodRootObservation cfg p × BoardClockPath n) : GoodRootObservation cfg p × BoardClockPath n :=
  (goodRootClockStep cfg ε M start p hn x,augResidualBoard cfg ε M hn (x.1.val.1.1,x.2))

theorem goodRootRestartStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) : Measurable (goodRootRestartStep cfg ε M start p hn) :=
  (goodRootClockStep_measurable cfg ε M start p hn).prodMk
    ((augResidualBoard_measurable cfg ε M hn).comp
      (((measurable_subtype_coe.comp measurable_fst).fst.fst).prodMk measurable_snd))

theorem goodRootRestartStep_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (rate : ℝ) (hr : 0<rate) (s : GoodRootObservation cfg p) :
    (boardClockMeasure n rate).map (fun ω=>goodRootRestartStep cfg ε M start p hn (s,ω))=
      ((boardClockMeasure n rate).map (fun ω=>goodRootClockStep cfg ε M start p hn (s,ω))).prod
        (boardClockMeasure n rate) := by
  apply aug_observation_restart_map cfg ε M hn rate hr s.val.1.1
    (fun z=>goodRootStep cfg ε M start p (s,z))
    ((goodRootStep_measurable cfg ε M start p).comp (measurable_const.prodMk measurable_id))
  · intro hd z z'
    apply Subtype.ext
    exact rootObserverStep_done_eq cfg ε M start p s.val hd z z'
  · intro z z' hz hz'
    apply Subtype.ext
    exact rootObserverStep_late_eq cfg ε M start p s.val z z' hz hz'

theorem goodRootRecycled_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : GoodRootObservation cfg p) (k : ℕ) (ω : BoardClockPath n) :
    ((RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω).1.val,
      (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω).2)=
      rootObserverRecycledPair cfg ε M start p hn s.val k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change rootObserverRestartStep cfg ε M start p hn
      ((RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω).1.val,
        (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω).2)=_
    rw [ih]
    rfl

theorem goodRootRecycled_actual {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : GoodRootObservation cfg p) (k : ℕ) (ω : BoardClockPath n) :
    (goodRootActual cfg p (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω).1,
      (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω).2)=
      RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) (goodRootActual cfg p s) k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (goodRootActual cfg p (goodRootStep cfg ε M start p _),_)=_
    rw [goodRootStep_actual]
    change goodObservedRestartStep cfg ε M start hn
      (goodRootActual cfg p (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω).1,
        (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω).2)=_
    rw [ih]
    rfl

def goodRootMixed {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodRootObservation cfg p) : ℝ :=
  mixed cfg.directions C D L (savedWitness e s.val.2.2)

def goodRootUpperMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodRootObservation cfg p) : ℝ :=
  goodRootMixed cfg p e C D L s+rootStepSource cfg ε M start e C D L s.val

theorem goodRootMixed_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (e : Retention n)
    (C D L : Finset (Grid n)) : Measurable (goodRootMixed cfg p e C D L) :=
  (mixed_measurable cfg.directions C D L).comp
    ((savedWitness_measurable e).comp measurable_subtype_coe.snd.snd)

theorem goodRootUpperMean_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) :
    Measurable (goodRootUpperMean cfg ε M start p e C D L) :=
  (goodRootMixed_measurable cfg p e C D L).add
    ((rootStepSource_measurable cfg ε M start e C D L).comp measurable_subtype_coe)

theorem goodRootMixed_bounds {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodRootObservation cfg p) :
    0≤goodRootMixed cfg p e C D L s ∧ goodRootMixed cfg p e C D L s≤mixedCap C cfg.B :=
  ⟨mixed_nonneg _ cfg.directions C D L cfg.B (savedWitness_valid cfg.B e _ s.property.1.saved),
    mixed_le_cap _ cfg.directions C D L cfg.B (savedWitness_valid cfg.B e _ s.property.1.saved)⟩

theorem goodRootUpperMean_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n))
    (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodRootObservation cfg p) :
    0≤goodRootUpperMean cfg ε M start p e C D L s ∧
      goodRootUpperMean cfg ε M start p e C D L s≤
        mixedCap C cfg.B+(cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K := by
  have hp := goodRootMixed_bounds cfg p e C D L s
  have hq := rootStepSource_bounds cfg ε M start e p s.val C D L s.property.1 hB hm hK
  exact ⟨add_nonneg hp.1 hq.1,add_le_add hp.2 hq.2⟩

theorem goodRootClockStep_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodRootObservation cfg p) :
    (∫ω,goodRootMixed cfg p e C D L (goodRootClockStep cfg ε M start p hn (s,ω))
      ∂boardClockMeasure n (cfg.B/n))≤goodRootUpperMean cfg ε M start p e C D L s :=
  rootObserverStep_source_bound cfg ε M start e p s.val C D L hn hB hm s.property.1 hCL hCD s.property.2 hK

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.goodRootRestartStep_map
#print axioms NoThreeLine.BirthWitness.goodRootRecycled_actual
#print axioms NoThreeLine.BirthWitness.goodRootClockStep_mean
