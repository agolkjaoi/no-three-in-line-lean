import NoThreeLine.SourceCutCauseCoupling
import NoThreeLine.ScheduledRetirementCauses
import NoThreeLine.ScheduledCutBirthMean

/-! Exact support of positive credit loss at a real inherited phase cut.
The causal witnesses use the same original board and original deadlines.
No exceptional endpoint or completion hypothesis is required. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem augInitialState_active_of_before_deadline {n : ℕ} (B : ℝ) (hB : 1 ≤ B)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hp : start < deadline p) :
    ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active := by
  by_contra hi
  have hd := (augValidDeadlineRetirement_new_inactive_cause deadline start
    ⟨AugmentedState.initial n,AugmentedState.initial_valid n B hB⟩ p rfl hi).2
  exact (not_le_of_gt hp) hd

namespace BirthWitness

def scheduledRootBoundaryCauseUpToCut {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (p : Grid n)
    (e : ValidAugmentedState n B) (N : ℕ) (t : ℝ) (ω : BoardClockPath n) : Prop :=
  (∃ i < N, scheduledRootBoundaryCauseAt cs ε M deadline start hn p e i ω) ∨
    let s := augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn e N ω)
    let v := (recycledPhases cs ε M deadline start hn e N ω).2
    ∃ k, recycledRootBoundaryCauseAt (cs N).config ε M hn p s k v ∧
      birthCalendarTime (cs N).config ε M hn s (k+1) v ≤ t

theorem scheduledCut_positive_loss_origin {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (p : Grid n) (N : ℕ) (t : ℝ) (ω : BoardClockPath n)
    (ht : t ∈ Icc (0 : ℝ) (cs N).horizon)
    (hc : 0 < scheduledCutCreditLoss cs ε M deadline start hn s p N (ω,t)) :
    0 < s.val.1.val.physical.process.birthCreditLoss p ∨
      deadline p ≤ phaseEndpoint cs start N ∨
      scheduledRootBoundaryCauseUpToCut cs ε M deadline start hn p s.val.1 N t ω := by
  let y := goodPhases cs ε M deadline start hn s N ω
  let δ := elapsedCutAmount (cs N).horizon t
  have hcut : 0 < (sourceCutTerminal (cs N).config ε M (phaseEndpoint cs start N) δ δ.coe_nonneg hn
      (goodPhaseStart (cs N).config ε M y.1) y.2).1.val.1.physical.process.birthCreditLoss p := hc
  have hh := sourceCutTerminal_positive_loss_origin (cs N).config ε M (phaseEndpoint cs start N)
    δ δ.coe_nonneg hn (goodPhaseStart (cs N).config ε M y.1) p y.2 hcut
  have hy := goodPhases_birth_projection cs ε M deadline start hn s N ω
  have hs : (goodPhaseStart (cs N).config ε M y.1).val.1 =
      augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.val.1 N ω) :=
    congrArg (augPhaseStart (cs N).config ε M) (congrArg Prod.fst hy)
  have hv : y.2 = (recycledPhases cs ε M deadline start hn s.val.1 N ω).2 := congrArg Prod.snd hy
  rw [hs,hv] at hh
  rcases hh with hprev | ⟨k,hcause,hwhen⟩
  · rcases recycledPhaseState_positive_loss_origin cs ε M deadline start hn s.val.1 p N ω hprev with
      hi | hd | he
    · exact Or.inl hi
    · exact Or.inr (Or.inl hd)
    · exact Or.inr (Or.inr (Or.inl he))
  · apply Or.inr ∘ Or.inr ∘ Or.inr
    refine ⟨k,hcause,?_⟩
    change _ ≤ ((cs N).horizon : ℝ)-(δ : ℝ) at hwhen
    have hd : (δ : ℝ) = (cs N).horizon-t := elapsedCutAmount_coe _ _ ht.2
    rw [hd] at hwhen
    linarith

theorem scheduledCut_early_positive_loss_boundary {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (p : Grid n) (N : ℕ) (t : ℝ) (ω : BoardClockPath n)
    (hs : s.val.1.val.physical.process.stopped = false)
    (hp : (s.val.1.val.physical.process.accounts p).status = .active)
    (ht : t ∈ Icc (0 : ℝ) (cs N).horizon)
    (hdeadline : phaseEndpoint cs start N+t < deadline p)
    (hc : 0 < scheduledCutCreditLoss cs ε M deadline start hn s p N (ω,t)) :
    scheduledRootBoundaryCauseUpToCut cs ε M deadline start hn p s.val.1 N t ω := by
  rcases scheduledCut_positive_loss_origin cs ε M deadline start hn s p N t ω ht hc with hi | hd | he
  · simp [ProcessState.birthCreditLoss,ProcessState.birthUnavailable,hs,hp] at hi
  · linarith [ht.1]
  · exact he

theorem initial_scheduledCut_early_positive_loss_boundary {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (N : ℕ) (t : ℝ) (ω : BoardClockPath n)
    (ht : t ∈ Icc (0 : ℝ) (cs N).horizon)
    (hdeadline : phaseEndpoint cs start N+t < deadline p)
    (hc : 0 < scheduledCutCreditLoss cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) p N (ω,t)) :
    scheduledRootBoundaryCauseUpToCut cs ε M deadline start hn p
      (augInitialState B hB deadline start) N t ω := by
  have hstart : start < deadline p := by
    have hmono := phaseEndpoint_mono cs start (Nat.zero_le N)
    rw [phaseEndpoint_zero] at hmono
    linarith [ht.1]
  exact scheduledCut_early_positive_loss_boundary cs ε M deadline start hn
    (initialGoodPhaseObservation B hB deadline start) p N t ω
    (augInitialState_stopped B hB deadline start)
    (augInitialState_active_of_before_deadline B hB deadline start p hstart) ht hdeadline hc

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.BirthWitness.scheduledCut_positive_loss_origin
#print axioms NoThreeLine.BirthWitness.initial_scheduledCut_early_positive_loss_boundary
