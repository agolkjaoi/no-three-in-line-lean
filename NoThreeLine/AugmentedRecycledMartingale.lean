import NoThreeLine.RecycledCreditMartingale
import NoThreeLine.RecycledPhaseComposition

/-! Actual saved credit is a martingale on the original board measure:
both within a phase and across completed scheduled phases. Filtrations
observe the discrete state histories, not future residual coordinates. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

def augRecycledStateFiltration {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) (s : AugTimedState cfg) :
    Filtration ℕ (inferInstance : MeasurableSpace (BoardClockPath n)) :=
  StateHistory.filtration (fun k ω => (augRecycledPair cfg ε M hn s k ω).1)
    (fun k => (augRecycledPair_measurable cfg ε M hn s k).fst)

theorem augRecycled_credit_martingale {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : AugTimedState cfg) (p : Grid n) :
    Martingale (fun k ω => augTimedCredit cfg p (augRecycledPair cfg ε M hn s k ω).1)
      (augRecycledStateFiltration cfg ε M hn s) (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact RecycledBoardProcess.credit_martingale (augRestartStep cfg ε M hn)
    (augRestartStep_measurable cfg ε M hn) _
    (augRestartStep_map cfg ε M hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    (augTimedCredit cfg p) (augTimedCredit_measurable cfg p) cfg.B (augTimedCredit_bounds cfg p)
    (fun a => augTimedClockStep_credit cfg ε M hn hB hm a p) s

theorem recycledPhaseStep_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (a : ℕ × ValidAugmentedState n B) (p : Grid n) :
    (∫ ω, validAugStateCredit B p (recycledPhaseStep cs ε M deadline start hn (a,ω)).1.2
      ∂boardClockMeasure n (B/n)) = validAugStateCredit B p a.2 := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hr : Measurable (fun ω : BoardClockPath n => (recycledPhaseStep cs ε M deadline start hn (a,ω)).1) :=
    ((recycledPhaseStep_measurable cs ε M deadline start hn).comp (measurable_const.prodMk measurable_id)).fst
  have ht : Measurable (fun ω : PhaseNoise n => augPhaseIndexedStep cs ε M deadline start hn (a,ω)) :=
    (augPhaseIndexedStep_measurable cs ε M deadline start hn).comp (measurable_const.prodMk measurable_id)
  have hz : Measurable (fun b : ℕ × ValidAugmentedState n B => validAugStateCredit B p b.2) :=
    (validAugStateCredit_measurable B p).comp measurable_snd
  have h := congrArg (fun μ : Measure (ℕ × ValidAugmentedState n B) => ∫ b, validAugStateCredit B p b.2 ∂μ)
    (RecycledBoardProcess.section_state_map (recycledPhaseStep cs ε M deadline start hn)
      (recycledPhaseStep_measurable cs ε M deadline start hn) (augPhaseIndexedStep cs ε M deadline start hn)
      _ _ (recycledPhaseStep_map cs ε M deadline start hn hB) a)
  rw [integral_map_of_stronglyMeasurable hr hz.stronglyMeasurable,
    integral_map_of_stronglyMeasurable ht hz.stronglyMeasurable] at h
  exact h.trans (augScheduledPhase_expected_credit cs ε M deadline start hn hB a.1 a.2 p)

def recycledPhasesFiltration {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (e : ValidAugmentedState n B) :
    Filtration ℕ (inferInstance : MeasurableSpace (BoardClockPath n)) :=
  StateHistory.filtration (fun k ω => (recycledPhases cs ε M deadline start hn e k ω).1)
    (fun k => (recycledPhases_measurable cs ε M deadline start hn e k).fst)

theorem recycledPhases_credit_martingale {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (e : ValidAugmentedState n B) (p : Grid n) :
    Martingale (fun k ω => validAugStateCredit B p (recycledPhaseState cs ε M deadline start hn e k ω))
      (recycledPhasesFiltration cs ε M deadline start hn e) (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have heq := RecycledBoardProcess.section_state_map (recycledPhaseStep cs ε M deadline start hn)
    (recycledPhaseStep_measurable cs ε M deadline start hn) (augPhaseIndexedStep cs ε M deadline start hn)
    _ _ (recycledPhaseStep_map cs ε M deadline start hn hB)
  have hsection (a : ℕ × ValidAugmentedState n B) :
      (boardClockMeasure n (B/n)).map (fun ω => recycledPhaseStep cs ε M deadline start hn (a,ω)) =
        ((boardClockMeasure n (B/n)).map (fun ω => (recycledPhaseStep cs ε M deadline start hn (a,ω)).1)).prod
          (boardClockMeasure n (B/n)) := by
    rw [heq a]
    exact recycledPhaseStep_map cs ε M deadline start hn hB a
  exact RecycledBoardProcess.credit_martingale (recycledPhaseStep cs ε M deadline start hn)
    (recycledPhaseStep_measurable cs ε M deadline start hn) _ hsection
    (fun a => validAugStateCredit B p a.2) ((validAugStateCredit_measurable B p).comp measurable_snd)
    B (fun a => validAugStateCredit_bounds B p a.2)
    (fun a => recycledPhaseStep_expected_credit cs ε M deadline start hn hB a p) (0,e)

end NoThreeLine

#print axioms NoThreeLine.augRecycled_credit_martingale
#print axioms NoThreeLine.recycledPhaseStep_expected_credit
#print axioms NoThreeLine.recycledPhases_credit_martingale
