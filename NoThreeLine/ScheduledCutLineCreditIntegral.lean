import NoThreeLine.PhaseCutLineCreditIntegral
import NoThreeLine.ScheduledCutBirthMean

/-! The actual inherited phase-state/residual-board law transports the
partial line-credit identity to the original scheduled process. No fresh
initial state, empty records, or deterministic incoming state is assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem phaseCutLineCreditLoss_eq_integral_prod_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ]
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) cfg.horizon) :
    ∀ᵐ x ∂μ.prod (boardClockMeasure n (cfg.B/n)), phaseCutLineCreditLoss cfg ε M start L hn t x =
      phaseCutLineCreditIntegral cfg ε M start L hn t x := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply (Measure.ae_prod_iff_ae_ae (measurableSet_eq_fun
    (phaseCutLineCreditLoss_measurable cfg ε M start L hn t)
    (phaseCutLineCreditIntegral_measurable cfg ε M start L hn t ht.1))).mpr
  exact Filter.Eventually.of_forall (fun s => phaseCutLineCreditLoss_eq_integral_ae cfg ε M start L hn hB hm s t ht)

def scheduledCutLineCreditRate {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) (x : BoardClockPath n × ℝ) : ℝ :=
  physicalLineCreditRate (cs N).directions (cs N).mask L
    (scheduledCutObservation cs ε M deadline start hn s N x).1.val.1.physical

def scheduledCutLineCreditIntegral {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) (t : ℝ) (ω : BoardClockPath n) : ℝ :=
  ∫ u in (0 : ℝ)..t, scheduledCutLineCreditRate cs ε M deadline start L hn s N (ω,u)

def scheduledCutLineCreditLoss {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) (x : BoardClockPath n × ℝ) : ℝ :=
  phaseCutLineCreditLoss (cs N).config ε M (phaseEndpoint cs start N) L hn x.2
    (goodPhases cs ε M deadline start hn s N x.1)

theorem scheduledCutLineCreditLoss_eq {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) (x : BoardClockPath n × ℝ) :
    scheduledCutLineCreditLoss cs ε M deadline start L hn s N x =
      (recycledPhaseState cs ε M deadline start hn s.val.1 N x.1).val.physical.lineCredits L -
        (scheduledCutObservation cs ε M deadline start hn s N x).1.val.1.physical.lineCredits L := by
  have he := congrArg Prod.fst (goodPhases_birth_projection cs ε M deadline start hn s N x.1)
  change (goodPhases cs ε M deadline start hn s N x.1).1.val.1.val.physical.lineCredits L - _ = _
  rw [he]
  rfl

theorem scheduledCutLineCreditLoss_eq_integral_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (hB : 0 < B) (s : GoodPhaseObservation n B) (N : ℕ) (t : ℝ)
    (ht : t ∈ Icc (0 : ℝ) (cs N).horizon) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n), scheduledCutLineCreditLoss cs ε M deadline start L hn s N (ω,t) =
      scheduledCutLineCreditIntegral cs ε M deadline start L hn s N t ω := by
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s N
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s N
  have hh := phaseCutLineCreditLoss_eq_integral_prod_ae (cs N).config ε M (phaseEndpoint cs start N)
    L hn hB (cs N).mask_le_one μ t ht
  have he : ν.map (goodPhases cs ε M deadline start hn s N)=μ.prod ν :=
    goodPhases_residual_product cs ε M deadline start hn hB s N
  rw [←he] at hh
  exact ae_of_ae_map (goodPhases_measurable cs ε M deadline start hn s N).aemeasurable hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseCutLineCreditLoss_eq_integral_prod_ae
#print axioms NoThreeLine.BirthWitness.scheduledCutLineCreditLoss_eq
#print axioms NoThreeLine.BirthWitness.scheduledCutLineCreditLoss_eq_integral_ae
