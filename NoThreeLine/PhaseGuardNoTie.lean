import NoThreeLine.CandidateGuardNoTie
import NoThreeLine.PhasePointHistory

/-! The actual inherited phase state and its residual board satisfy the
proved product law. Hence every phase and every within-phase guard race
has no tie simultaneously, on the unchanged original board. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def phaseCandidateGuardDistinct {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  rootCandidateGuardDistinct (cs N).config ε M hn
    (rootObserverRecycledPair (cs N).config ε M (phaseEndpoint cs start N) q hn
      (phaseRootStart (cs N).config ε M q (phaseRootPhases cs ε M deadline start q hn s N ω).1)
      k (phaseRootPhases cs ε M deadline start q hn s N ω).2)

theorem phaseCandidateGuardDistinct_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (N k : ℕ) :
    Measurable (phaseCandidateGuardDistinct cs ε M deadline start q hn s N k) := by
  have hm := (phaseRootPhases_joint_measurable cs ε M deadline start q hn N).comp
    (measurable_const.prodMk measurable_id (f:=fun _ : BoardClockPath n=>s))
  exact (rootCandidateGuardDistinct_measurable (cs N).config ε M hn).comp
    ((rootObserverRecycledPair_joint_measurable (cs N).config ε M (phaseEndpoint cs start N) q hn k).comp
      (((phaseRootStart_measurable (cs N).config ε M q).comp hm.fst).prodMk hm.snd))

theorem phase_candidateGuard_ne_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n) (hB : 0<B)
    (s : GoodPhaseRootObservation n B q) (N k : ℕ) :
    ∀ᵐω∂boardClockMeasure n (B/n),phaseCandidateGuardDistinct cs ε M deadline start q hn s.val N k ω := by
  let ν := boardClockMeasure n (B/n)
  let F := rootPhaseRestartStep cs ε M deadline start q hn
  have hF : Measurable F := rootPhaseRestartStep_measurable cs ε M deadline start q hn
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let μ := FiniteTransitionLaw.stateLaw (fun x=>(F x).1) ν (0,s) N
  letI : IsProbabilityMeasure μ := FiniteTransitionLaw.stateLaw_probability _ hF.fst ν (0,s) N
  let P : (ℕ×GoodPhaseRootObservation n B q)×BoardClockPath n→Prop := fun x=>
    rootCandidateGuardDistinct (cs N).config ε M hn
      (rootObserverRecycledPair (cs N).config ε M (phaseEndpoint cs start N) q hn
        (phaseRootStart (cs N).config ε M q x.1.2.val) k x.2)
  have hP : Measurable P :=
    (rootCandidateGuardDistinct_measurable (cs N).config ε M hn).comp
      ((rootObserverRecycledPair_joint_measurable (cs N).config ε M (phaseEndpoint cs start N) q hn k).comp
        (((phaseRootStart_measurable (cs N).config ε M q).comp measurable_fst.snd.subtype_val).prodMk measurable_snd))
  have hh := residual_sections_ae ν μ ν (rootPhaseRecycledPair cs ε M deadline start q hn s N)
    (rootPhaseRecycledPair_measurable cs ε M deadline start q hn s N)
    (RecycledBoardProcess.iterate_map F hF ν
      (rootPhaseRestartStep_residual_product cs ε M deadline start q hn hB) (0,s) N)
    P hP (fun a=>rootObserver_candidateGuard_ne_ae (cs N).config ε M (phaseEndpoint cs start N)
      q hn (B/n) (div_pos hB (by exact_mod_cast hn)) (phaseRootStart (cs N).config ε M q a.2.val) k)
  filter_upwards [hh] with ω hω
  unfold phaseCandidateGuardDistinct
  rw [←rootPhaseRecycledPair_projection cs ε M deadline start q hn s N ω]
  exact hω

theorem phases_all_candidateGuard_ne_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (q : Grid n) (hn : 0<n) (hB : 0<B)
    (s : GoodPhaseRootObservation n B q) :
    ∀ᵐω∂boardClockMeasure n (B/n),∀N k,phaseCandidateGuardDistinct cs ε M deadline start q hn s.val N k ω :=
  ae_all_iff.mpr (fun N=>ae_all_iff.mpr (phase_candidateGuard_ne_ae cs ε M deadline start q hn hB s N))

theorem initial_phases_all_candidateGuard_ne_point_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (q : Grid n) (hn : 0<n) (hB : 1≤B) (J : ℕ) :
    ∀ᵐω∂phasePointMeasure cs ε M deadline start hn hB q J,∀N k,
    phaseCandidateGuardDistinct cs ε M deadline start q hn
      (initialGoodPhaseRootObservation B hB q deadline start).val N k ω :=
  (phasePointMeasure_absolutelyContinuous cs ε M deadline start hn hB q J).ae_le
    (phases_all_candidateGuard_ne_ae cs ε M deadline start q hn (zero_lt_one.trans_le hB)
      (initialGoodPhaseRootObservation B hB q deadline start))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phases_all_candidateGuard_ne_ae
#print axioms NoThreeLine.BirthWitness.initial_phases_all_candidateGuard_ne_point_ae
