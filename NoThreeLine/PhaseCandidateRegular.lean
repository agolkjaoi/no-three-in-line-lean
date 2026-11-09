import NoThreeLine.PhaseGuardNoTie

/-! Positive candidate times and no guard ties simultaneously along the
unchanged original-board phase/step iteration. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def rootCandidateRegular {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (x : RootObservation cfg×BoardClockPath n) : Prop :=
  0<BoardFirstCandidate.firstTime hn x.2 ∧ rootCandidateGuardDistinct cfg ε M hn x

theorem rootCandidateRegular_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n) :
    Measurable (rootCandidateRegular cfg ε M hn) :=
  (measurable_const.lt ((BoardFirstCandidate.firstTime_measurable hn).comp measurable_snd)).and
    (rootCandidateGuardDistinct_measurable cfg ε M hn)

theorem rootObserver_candidateRegular_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (rate : ℝ) (hr : 0<rate) (s : RootObservation cfg) (k : ℕ) :
    ∀ᵐω∂boardClockMeasure n rate,
      rootCandidateRegular cfg ε M hn (rootObserverRecycledPair cfg ε M start q hn s k ω) := by
  letI := boardClockMeasure_probability n rate hr
  let f := rootObserverRecycledPair cfg ε M start q hn s k
  apply residual_sections_ae (boardClockMeasure n rate)
    ((boardClockMeasure n rate).map (fun ω=>(f ω).1)) (boardClockMeasure n rate) f
    (rootObserverRecycledPair_measurable cfg ε M start q hn s k)
    (rootObserverRecycledPair_residual_product cfg ε M start q hn rate hr s k)
    (rootCandidateRegular cfg ε M hn) (rootCandidateRegular_measurable cfg ε M hn)
  intro a
  exact (BoardFirstCandidate.firstTime_ae_positive hn rate hr).and
    (actualFirstTime_ne_ae hn rate hr (augGuardTime cfg ε M (augTimedInput cfg a.1.1)))

def phaseCandidateRegular {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  rootCandidateRegular (cs N).config ε M hn
    (rootObserverRecycledPair (cs N).config ε M (phaseEndpoint cs start N) q hn
      (phaseRootStart (cs N).config ε M q (phaseRootPhases cs ε M deadline start q hn s N ω).1)
      k (phaseRootPhases cs ε M deadline start q hn s N ω).2)

theorem phaseCandidateRegular_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (N k : ℕ) :
    Measurable (phaseCandidateRegular cs ε M deadline start q hn s N k) := by
  have hm := (phaseRootPhases_joint_measurable cs ε M deadline start q hn N).comp
    (measurable_const.prodMk measurable_id (f:=fun _ : BoardClockPath n=>s))
  exact (rootCandidateRegular_measurable (cs N).config ε M hn).comp
    ((rootObserverRecycledPair_joint_measurable (cs N).config ε M (phaseEndpoint cs start N) q hn k).comp
      (((phaseRootStart_measurable (cs N).config ε M q).comp hm.fst).prodMk hm.snd))

theorem phase_candidateRegular_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n) (hB : 0<B)
    (s : GoodPhaseRootObservation n B q) (N k : ℕ) :
    ∀ᵐω∂boardClockMeasure n (B/n),phaseCandidateRegular cs ε M deadline start q hn s.val N k ω := by
  let ν := boardClockMeasure n (B/n)
  let F := rootPhaseRestartStep cs ε M deadline start q hn
  have hF : Measurable F := rootPhaseRestartStep_measurable cs ε M deadline start q hn
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let μ := FiniteTransitionLaw.stateLaw (fun x=>(F x).1) ν (0,s) N
  letI : IsProbabilityMeasure μ := FiniteTransitionLaw.stateLaw_probability _ hF.fst ν (0,s) N
  let P : (ℕ×GoodPhaseRootObservation n B q)×BoardClockPath n→Prop := fun x=>
    rootCandidateRegular (cs N).config ε M hn
      (rootObserverRecycledPair (cs N).config ε M (phaseEndpoint cs start N) q hn
        (phaseRootStart (cs N).config ε M q x.1.2.val) k x.2)
  have hP : Measurable P :=
    (rootCandidateRegular_measurable (cs N).config ε M hn).comp
      ((rootObserverRecycledPair_joint_measurable (cs N).config ε M (phaseEndpoint cs start N) q hn k).comp
        (((phaseRootStart_measurable (cs N).config ε M q).comp measurable_fst.snd.subtype_val).prodMk measurable_snd))
  have hh := residual_sections_ae ν μ ν (rootPhaseRecycledPair cs ε M deadline start q hn s N)
    (rootPhaseRecycledPair_measurable cs ε M deadline start q hn s N)
    (RecycledBoardProcess.iterate_map F hF ν
      (rootPhaseRestartStep_residual_product cs ε M deadline start q hn hB) (0,s) N)
    P hP (fun a=>rootObserver_candidateRegular_ae (cs N).config ε M (phaseEndpoint cs start N)
      q hn (B/n) (div_pos hB (by exact_mod_cast hn)) (phaseRootStart (cs N).config ε M q a.2.val) k)
  filter_upwards [hh] with ω hω
  unfold phaseCandidateRegular
  rw [←rootPhaseRecycledPair_projection cs ε M deadline start q hn s N ω]
  exact hω

theorem phases_all_candidateRegular_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n) (hB : 0<B)
    (s : GoodPhaseRootObservation n B q) :
    ∀ᵐω∂boardClockMeasure n (B/n),∀N k,phaseCandidateRegular cs ε M deadline start q hn s.val N k ω :=
  ae_all_iff.mpr (fun N=>ae_all_iff.mpr (phase_candidateRegular_ae cs ε M deadline start q hn hB s N))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phases_all_candidateRegular_ae
