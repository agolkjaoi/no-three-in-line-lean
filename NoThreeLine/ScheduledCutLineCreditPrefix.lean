import NoThreeLine.ScheduledCutLineCreditIntegral
import NoThreeLine.ScheduledLineCreditLoss
import NoThreeLine.PhaseCutEndpoint

/-! Whole inherited phases and the current partial phase telescope to
the actual interior-cut line-credit decrement, on the original clock board.
Absolute deadline retirement preserves the line-credit coordinate. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem phaseCutLineCreditLoss_horizon {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (s : GoodPhaseObservation n cfg.B) (ω : BoardClockPath n) :
    phaseCutLineCreditLoss cfg ε M start L hn cfg.horizon (s,ω) =
      terminalLineCreditLoss cfg ε M hn L (augPhaseStart cfg ε M s.val.1) ω := by
  rw [terminalLineCreditLoss_eq]
  unfold phaseCutLineCreditLoss phaseCutObservation
  simp only [elapsedCutAmount_self, NNReal.coe_zero, sourceCutTerminal_base, sourceRestrictState_zero]
  rfl

theorem scheduledCutLineCreditLoss_horizon {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) (ω : BoardClockPath n) :
    scheduledCutLineCreditLoss cs ε M deadline start L hn s N (ω,(cs N).horizon) =
      terminalLineCreditLoss (cs N).config ε M hn L
        (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn s.val.1 N ω))
        (recycledPhases cs ε M deadline start hn s.val.1 N ω).2 := by
  unfold scheduledCutLineCreditLoss
  rw [phaseCutLineCreditLoss_horizon]
  change (fun x : ValidAugmentedState n B × BoardClockPath n =>
      terminalLineCreditLoss (cs N).config ε M hn L (augPhaseStart (cs N).config ε M x.1) x.2)
        ((goodPhases cs ε M deadline start hn s N ω).1.val.1,
          (goodPhases cs ε M deadline start hn s N ω).2) = _
  rw [goodPhases_birth_projection]

theorem scheduledCutLineCredit_prefix_integral_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (hB : 0 < B) (s : GoodPhaseObservation n B) (N : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      (∑ j ∈ Finset.range N, scheduledCutLineCreditIntegral cs ε M deadline start L hn s j (cs j).horizon ω) =
        s.val.1.val.physical.lineCredits L -
          (recycledPhaseState cs ε M deadline start hn s.val.1 N ω).val.physical.lineCredits L := by
  have hall : ∀ᵐ ω ∂boardClockMeasure n (B/n), ∀ j : ℕ,
      scheduledCutLineCreditLoss cs ε M deadline start L hn s j (ω,(cs j).horizon) =
        scheduledCutLineCreditIntegral cs ε M deadline start L hn s j (cs j).horizon ω :=
    ae_all_iff.mpr (fun j => scheduledCutLineCreditLoss_eq_integral_ae cs ε M deadline start L hn hB s j
      (cs j).horizon ⟨(cs j).horizon.coe_nonneg,le_rfl⟩)
  filter_upwards [hall] with ω hω
  calc
    _ = scheduledLineCreditLoss cs ε M deadline start hn L s.val.1 N ω := by
      unfold scheduledLineCreditLoss
      apply Finset.sum_congr rfl
      intro j _
      rw [←hω j, scheduledCutLineCreditLoss_horizon]
    _ = _ := scheduledLineCreditLoss_eq cs ε M deadline start hn L s.val.1 N ω

theorem scheduledCutLineCredit_decrement_integral_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (hB : 0 < B) (s : GoodPhaseObservation n B) (N : ℕ) (t : ℝ)
    (ht : t ∈ Icc (0 : ℝ) (cs N).horizon) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n), s.val.1.val.physical.lineCredits L -
      (scheduledCutObservation cs ε M deadline start hn s N (ω,t)).1.val.1.physical.lineCredits L =
        (∑ j ∈ Finset.range N, scheduledCutLineCreditIntegral cs ε M deadline start L hn s j (cs j).horizon ω) +
          scheduledCutLineCreditIntegral cs ε M deadline start L hn s N t ω := by
  filter_upwards [scheduledCutLineCredit_prefix_integral_ae cs ε M deadline start L hn hB s N,
    scheduledCutLineCreditLoss_eq_integral_ae cs ε M deadline start L hn hB s N t ht] with ω hpre hcur
  rw [scheduledCutLineCreditLoss_eq] at hcur
  linarith only [hpre,hcur]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseCutLineCreditLoss_horizon
#print axioms NoThreeLine.BirthWitness.scheduledCutLineCredit_prefix_integral_ae
#print axioms NoThreeLine.BirthWitness.scheduledCutLineCredit_decrement_integral_ae
