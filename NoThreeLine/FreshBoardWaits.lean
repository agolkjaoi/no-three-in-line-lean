import NoThreeLine.BoardFirstCandidate
import NoThreeLine.FiniteBudgetTermination

/-! First-candidate waits from an actual iid sequence of fresh board
clocks have the exponential product law and divergent partial sums. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped BigOperators

namespace NoThreeLine.FiniteBudgetTermination

theorem exists_finished_of_continuing (unfinished : ℕ → Prop) (r W : ℕ → ℝ) (b : ℕ → ℕ)
    (hr : ∀ k, 0 ≤ r k) (hb : ∀ k, b (k+1) ≤ b k)
    (hdiv : Tendsto (arrivalTime W) atTop atTop)
    (hstep : ∀ k, unfinished k → unfinished (k+1) →
      r k - r (k+1) = W k ∨ b (k+1) < b k) :
    ∃ k, ¬ unfinished k := by
  classical
  by_contra! hp
  exact divergent_waits_preclude_perpetual_progress r W b hr (antitone_nat_of_succ_le hb)
    hdiv (fun k => hstep k (hp k) (hp (k+1)))

end NoThreeLine.FiniteBudgetTermination

namespace NoThreeLine.FreshBoardWaits
open BoardFirstCandidate FiniteBudgetTermination

def freshBoardMeasure (n : ℕ) (rate : ℝ) : Measure (ℕ → BoardClockPath n) :=
  Measure.infinitePi (fun _ : ℕ => boardClockMeasure n rate)

def firstWaitSequence {n : ℕ} (hn : 0 < n) (ω : ℕ → BoardClockPath n) : ClockPath :=
  fun k => firstTime hn (ω k)

theorem firstWaitSequence_measurable {n : ℕ} (hn : 0 < n) : Measurable (firstWaitSequence hn) :=
  measurable_pi_lambda _ (fun k => (firstTime_measurable hn).comp (measurable_pi_apply k))

theorem firstWaitSequence_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    (freshBoardMeasure n rate).map (firstWaitSequence hn) = clockMeasure ((n : ℝ)^2*rate) := by
  letI := boardClockMeasure_probability n rate hr
  unfold freshBoardMeasure firstWaitSequence clockMeasure
  rw [Measure.infinitePi_map_pi (fun _ : ℕ => boardClockMeasure n rate)
    (fun _ => firstTime_measurable hn)]
  simp_rw [firstTime_map hn rate hr]

theorem candidate_firstWaitSequence_map {n : ℕ} (hn : 0 < n) (B : ℝ) (hB : 0 < B) :
    (freshBoardMeasure n (B/n)).map (firstWaitSequence hn) = clockMeasure (n*B) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  unfold freshBoardMeasure firstWaitSequence clockMeasure
  rw [Measure.infinitePi_map_pi (fun _ : ℕ => boardClockMeasure n (B/n))
    (fun _ => firstTime_measurable hn)]
  simp_rw [candidate_firstTime_map hn B hB]

theorem fresh_first_waits_positive_divergent {n : ℕ} (hn : 0 < n) (B : ℝ) (hB : 0 < B) :
    ∀ᵐ ω ∂freshBoardMeasure n (B/n),
      (∀ k, 0 < firstWaitSequence hn ω k) ∧
      Tendsto (arrivalTime (firstWaitSequence hn ω)) atTop atTop := by
  have hr : 0 < (n : ℝ)*B := mul_pos (by exact_mod_cast hn) hB
  have hp : MeasurePreserving (firstWaitSequence hn) (freshBoardMeasure n (B/n)) (clockMeasure (n*B)) :=
    ⟨firstWaitSequence_measurable hn,candidate_firstWaitSequence_map hn B hB⟩
  filter_upwards [hp.quasiMeasurePreserving.ae (clockMeasure_ae_positive (n*B) hr),
    hp.quasiMeasurePreserving.ae (clockMeasure_nonexplosive (n*B) hr)] with ω hpos hdiv
  exact ⟨hpos,hdiv.2.1⟩

theorem fresh_paths_finish_ae {n : ℕ} (hn : 0 < n) (B : ℝ) (hB : 0 < B)
    (unfinished : (ℕ → BoardClockPath n) → ℕ → Prop)
    (remaining : (ℕ → BoardClockPath n) → ℕ → ℝ)
    (budget : (ℕ → BoardClockPath n) → ℕ → ℕ)
    (hpath : ∀ᵐ ω ∂freshBoardMeasure n (B/n),
      (∀ k, 0 ≤ remaining ω k) ∧
      (∀ k, budget ω (k+1) ≤ budget ω k) ∧
      (∀ k, unfinished ω k →
        remaining ω k - remaining ω (k+1) = firstTime hn (ω k) ∨ budget ω (k+1) < budget ω k)) :
    ∀ᵐ ω ∂freshBoardMeasure n (B/n), ∃ k, ¬ unfinished ω k := by
  filter_upwards [hpath,fresh_first_waits_positive_divergent hn B hB] with ω hp hw
  exact exists_finished (unfinished ω) (remaining ω) (firstWaitSequence hn ω) (budget ω)
    hp.1 hp.2.1 hw.2 hp.2.2

theorem fresh_paths_finish_of_continuing_ae {n : ℕ} (hn : 0 < n) (B : ℝ) (hB : 0 < B)
    (unfinished : (ℕ → BoardClockPath n) → ℕ → Prop)
    (remaining : (ℕ → BoardClockPath n) → ℕ → ℝ)
    (budget : (ℕ → BoardClockPath n) → ℕ → ℕ)
    (hpath : ∀ᵐ ω ∂freshBoardMeasure n (B/n),
      (∀ k, 0 ≤ remaining ω k) ∧
      (∀ k, budget ω (k+1) ≤ budget ω k) ∧
      (∀ k, unfinished ω k → unfinished ω (k+1) →
        remaining ω k - remaining ω (k+1) = firstTime hn (ω k) ∨ budget ω (k+1) < budget ω k)) :
    ∀ᵐ ω ∂freshBoardMeasure n (B/n), ∃ k, ¬ unfinished ω k := by
  filter_upwards [hpath,fresh_first_waits_positive_divergent hn B hB] with ω hp hw
  exact exists_finished_of_continuing (unfinished ω) (remaining ω) (firstWaitSequence hn ω) (budget ω)
    hp.1 hp.2.1 hw.2 hp.2.2

end NoThreeLine.FreshBoardWaits

#print axioms NoThreeLine.FreshBoardWaits.candidate_firstWaitSequence_map
#print axioms NoThreeLine.FreshBoardWaits.fresh_paths_finish_ae
#print axioms NoThreeLine.FreshBoardWaits.fresh_paths_finish_of_continuing_ae
