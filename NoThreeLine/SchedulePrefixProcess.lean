import NoThreeLine.SchedulePrefix
import NoThreeLine.RootPhaseMomentExpansion

/-! Literal schedule prefixes preserve the actual full root-observer
history and residual board when the original retirement deadline function
is kept. Recomputing deadlines from the restricted masks is not asserted. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
namespace NoThreeLine.BirthWitness

theorem phaseRootScheduledPair_eq_of_prefix {n : ℕ} {B : ℝ} (cs ds : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (k : ℕ) (hc : ∀j<k,cs j=ds j) (j : ℕ) (hj : j<k)
    (x : PhaseRootObservation n B×BoardClockPath n) :
    phaseRootScheduledPair cs ε M deadline start p hn j x=
      phaseRootScheduledPair ds ε M deadline start p hn j x := by
  unfold phaseRootScheduledPair
  rw [hc j hj,phaseEndpoint_eq_of_prefix cs ds start k hc j hj.le,
    phaseEndpoint_eq_of_prefix cs ds start k hc (j+1) hj]

theorem phaseRootPhases_eq_of_prefix {n : ℕ} {B : ℝ} (cs ds : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (k : ℕ) (hc : ∀j<k,cs j=ds j) (s : PhaseRootObservation n B) :
    ∀l≤k,∀ω,phaseRootPhases cs ε M deadline start p hn s l ω=
      phaseRootPhases ds ε M deadline start p hn s l ω := by
  intro l
  induction l with
  | zero => intro _ _; rfl
  | succ l ih =>
    intro hl ω
    change phaseRootScheduledPair cs ε M deadline start p hn l (phaseRootPhases cs ε M deadline start p hn s l ω)=_
    rw [ih (by omega) ω]
    exact phaseRootScheduledPair_eq_of_prefix cs ds ε M deadline start p hn k hc l (by omega) _

theorem initialRootPhaseWitness_eq_of_prefix {n : ℕ} {B : ℝ} (cs ds : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (e : Retention n) (k : ℕ) (hc : ∀j<k,cs j=ds j) (ω : BoardClockPath n) :
    initialRootPhaseWitness cs ε M deadline start p hn hB e k ω=
      initialRootPhaseWitness ds ε M deadline start p hn hB e k ω := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  have h1 := congrArg (fun r : PhaseRootObservation n B×BoardClockPath n=>r.1)
    (rootPhaseRecycledPair_projection cs ε M deadline start p hn s k ω)
  have h2 := congrArg (fun r : PhaseRootObservation n B×BoardClockPath n=>r.1)
    (rootPhaseRecycledPair_projection ds ε M deadline start p hn s k ω)
  have hh := congrArg (fun r : PhaseRootObservation n B×BoardClockPath n=>r.1)
    (phaseRootPhases_eq_of_prefix cs ds ε M deadline start p hn k hc s.val k le_rfl ω)
  exact congrArg (fun a : PhaseRootObservation n B=>savedWitness e a.2.2) (h1.trans (hh.trans h2.symm))

theorem schedulePrefix_root_history {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ) (k : ℕ) (hk : k≤J)
    (deadline : Grid n→ℝ) (p : Grid n) (hn : 0<n) (a : PhaseRootObservation n B) (ω : BoardClockPath n) :
    (fun i : Fin (k+1)=>phaseRootPhases
      (scheduleSharedPhases (s.prefix k hk) (FinitePhase.prefixMask hk mask) (FinitePhase.prefixMask_bounds hk mask hm) Γ B K ρ)
      ε M deadline 0 p hn a i.val ω)=
      (fun i : Fin (k+1)=>phaseRootPhases (scheduleSharedPhases s mask hm Γ B K ρ) ε M deadline 0 p hn a i.val ω) := by
  funext i
  exact phaseRootPhases_eq_of_prefix _ _ ε M deadline 0 p hn k
    (scheduleSharedPhases_prefix_eq s mask hm Γ B K ρ k hk) a i.val (by omega) ω

theorem schedulePrefix_initialRootWitness {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ) (k : ℕ) (hk : k≤J)
    (deadline : Grid n→ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (ω : BoardClockPath n) :
    initialRootPhaseWitness
      (scheduleSharedPhases (s.prefix k hk) (FinitePhase.prefixMask hk mask) (FinitePhase.prefixMask_bounds hk mask hm) Γ B K ρ)
      ε M deadline 0 p hn hB e k ω=
      initialRootPhaseWitness (scheduleSharedPhases s mask hm Γ B K ρ) ε M deadline 0 p hn hB e k ω :=
  initialRootPhaseWitness_eq_of_prefix _ _ ε M deadline 0 p hn hB e k
    (scheduleSharedPhases_prefix_eq s mask hm Γ B K ρ k hk) ω

end NoThreeLine.BirthWitness

namespace NoThreeLine.FinitePhase
theorem Schedule.exists_prefix_total_deadline {J : ℕ} (s : Schedule J) (c : Fin J→ℝ) :
    ∃(k : ℕ)(hk : k≤J),(s.prefix k hk).total=s.deadline c := by
  rcases s.deadline_eq_zero_or_used_right c with h | ⟨j,_,h⟩
  · refine ⟨0,Nat.zero_le J,?_⟩
    rw [Schedule.prefix_total,h]
    exact s.initial
  · refine ⟨j.val+1,j.isLt,?_⟩
    rw [Schedule.prefix_total,h]
    rfl
end NoThreeLine.FinitePhase

#print axioms NoThreeLine.BirthWitness.schedulePrefix_root_history
#print axioms NoThreeLine.BirthWitness.schedulePrefix_initialRootWitness
#print axioms NoThreeLine.FinitePhase.Schedule.exists_prefix_total_deadline
