import NoThreeLine.WitnessSourceKernel

/-! Once a root is inactive its actual saved credit is pathwise constant.
This follows from the selected ODE, actual candidate geometry and
credit-preserving boundary resolution, without a martingale assumption. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

theorem selectedTrajectory_inactive_credit {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (hx : x.val.Valid cfg.B) (p : Grid n)
    (hp : (x.val.process.accounts p).status≠.active) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    ((selectedTrajectory cfg (x,t)).process.accounts p).credit=(x.val.process.accounts p).credit := by
  obtain ⟨hinit,hT,hder,hbefore,hcontact⟩ := selectedCurve_spec cfg x hx.2.1
  have hc : Continuous (fun u : ℝ=>selectedCurve cfg (x,u)) := by
    change Continuous (fun u : ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,u))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hd : ∀u∈Ioo (0:ℝ) (selectedGuardTime cfg x),
      HasDerivAt (fun u=>selectedCurve cfg (x,u))
        (vectorField x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,u))) u := by
    intro u hu
    exact (hder u ⟨hu.1.le,hu.2.le⟩).2.2.hasDerivAt (Icc_mem_nhds hu.1 hu.2)
  have hw := flow_weight_inactive_constant x.val.process cfg.directions cfg.mask
    (selectedGuardTime cfg x) hT.1 (fun u=>selectedCurve cfg (x,u)) hc.continuousOn hd p hp t ht
  rw [hinit] at hw
  change (CreditAccount.mk (x.val.process.accounts p).status ((selectedCurve cfg (x,t)).1 p)).credit=_
  rw [hw]
  rfl

theorem cappedPreState_inactive_credit {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (hx : x.1.val.Valid cfg.B) (p : Grid n) (hp : (x.1.val.process.accounts p).status≠.active)
    (z : BirthWitness.CandidateData n) :
    ((cappedPreState cfg (x,z)).process.accounts p).credit=(x.1.val.process.accounts p).credit := by
  have ht := cappedAdvance_mem cfg x hx z.1.1
  exact selectedTrajectory_inactive_credit cfg x.1 hx p hp _
    ⟨ht.1,ht.2.trans (cappedGuardTime_mem cfg x hx).2⟩

theorem ProcessState.birth_inactive_credit {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (p q : Grid n) (positive : Grid n→Bool)
    (hp : (s.accounts p).status≠.active) :
    ((s.birth Γ q positive).accounts p).credit=(s.accounts p).credit := by
  unfold ProcessState.birth
  split_ifs
  · exact birthAccount_inactive_credit Γ s.selected p q (s.accounts p) (positive p) hp
  · rfl

theorem ExtendedState.candidateUpdate_inactive_credit {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ) (p q : Grid n)
    (positive : Grid n→Bool) (mark : ℝ) (hp : (e.process.accounts p).status≠.active) :
    ((e.candidateUpdate Γ mask B q positive mark).process.accounts p).credit=
      (e.process.accounts p).credit := by
  rw [candidateUpdate_eq]
  split_ifs
  · exact ProcessState.birth_inactive_credit e.process Γ p q positive hp
  · rfl

theorem augRawOutcome_inactive_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (hx : x.1.1.val.Valid cfg.B) (p : Grid n)
    (hp : (x.1.1.val.process.accounts p).status≠.active) (z : BirthWitness.CandidateData n) :
    ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).credit=
      (x.1.1.val.process.accounts p).credit := by
  have hpre := cappedPreState_inactive_credit cfg (augPhysicalInput cfg ε M x) hx p hp z
  have hstatus : ((augPreState cfg ε M (x,z)).physical.process.accounts p).status≠.active := hp
  unfold augRawOutcome
  split_ifs
  · rw [ExtendedState.candidateUpdate_inactive_credit _ _ _ _ p _ _ _ hstatus]
    exact hpre
  · exact hpre

theorem augOutcome_inactive_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (hx : x.1.1.val.Valid cfg.B) (p : Grid n)
    (hp : (x.1.1.val.process.accounts p).status≠.active) (z : BirthWitness.CandidateData n) :
    ((augOutcome cfg ε M (x,z)).physical.process.accounts p).credit=
      (x.1.1.val.process.accounts p).credit := by
  rw [augOutcome,AugmentedState.resolve_credit]
  exact augRawOutcome_inactive_credit cfg ε M x hx p hp z

namespace BirthWitness

theorem observedStep_inactive_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (p : Grid n)
    (hp : (x.1.1.val.1.physical.process.accounts p).status≠.active) :
    ((observedStep cfg ε M start x).1.val.1.physical.process.accounts p).credit=
      (x.1.1.val.1.physical.process.accounts p).credit := by
  change ((augTimedStepPair cfg ε M (x.1.1,x.2)).1.physical.process.accounts p).credit=_
  unfold augTimedStepPair
  split_ifs
  · rfl
  · exact augOutcome_inactive_credit cfg ε M (augTimedInput cfg x.1.1) x.1.1.property.1.1 p hp x.2

def rootClosed {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (s : TimedObservation cfg) : Prop :=
  observationDone cfg s ∨ (s.1.val.1.physical.process.accounts p).status≠.active

instance {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (s : TimedObservation cfg) :
    Decidable (rootClosed cfg p s) := Classical.propDecidable _

theorem rootClosed_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (rootClosed cfg p) :=
  (observationDone_measurable cfg).or
    ((CreditAccount.measurable_status.comp ((ProcessState.measurable_account n p).comp
      ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
        (measurable_subtype_coe.fst.comp measurable_fst))))).eq_const CreditStatus.active).not

theorem observedStep_closed_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (p : Grid n) (hp : rootClosed cfg p x.1) :
    ((observedStep cfg ε M start x).1.val.1.physical.process.accounts p).credit=
      (x.1.1.val.1.physical.process.accounts p).credit := by
  rcases hp with hd | hi
  · rw [observedStep_frozen cfg ε M start x hd]
  · exact observedStep_inactive_credit cfg ε M start x p hi

theorem observedStep_rootClosed {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) (p : Grid n) (hp : rootClosed cfg p x.1) :
    rootClosed cfg p (observedStep cfg ε M start x) := by
  rcases hp with hd | hi
  · rw [observedStep_frozen cfg ε M start x hd]
    exact Or.inl hd
  · right
    intro ha
    exact hi ((ProcessState.mem_activeEvents _ _).mp
      ((observedStep_active_subset cfg ε M start x) ((ProcessState.mem_activeEvents _ _).mpr ha)))

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.selectedTrajectory_inactive_credit
#print axioms NoThreeLine.BirthWitness.observedStep_closed_credit
#print axioms NoThreeLine.BirthWitness.observedStep_rootClosed
