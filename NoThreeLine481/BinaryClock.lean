import NoThreeLine.ClockFinitePhaseUniformTail
import NoThreeLine.ClockFinitePhasePolynomialLoss
import NoThreeLine.ScheduleSpecifiedClockInput

set_option autoImplicit false
set_option maxHeartbeats 2800000
noncomputable section
open MeasureTheory
namespace NoThreeLine481
open NoThreeLine AuxiliaryODE BirthWitness PrimitiveLines FiniteDirections FinitePhase
  SpecifiedBoardCount
open scoped BigOperators

theorem exists_binary_schedule_clock_small
    (T H d γ tol : ℝ) (Γ : Finset ZPoint) (J : ℕ) (hT : 0 ≤ T) (hJ : 0 < J)
    (hH : H < 255/128) (hd : 0 ≤ d) (hdγ : d ≤ γ) (hγ : γ < 1)
    (htol : 0 < tol) :
    ∃ n0 : ℕ, 2 ≤ n0 ∧ ∀ n ≥ n0,
      ∀ (s : Schedule J) (mask : Fin J → Grid n → ℝ)
        (hm : ∀ j q, 0 ≤ mask j q ∧ mask j q ≤ 1)
        (B ρ ε : ℝ) (_hε : 0 < ε) (hn : 0 < n) (hB : 1 ≤ B),
        B ≤ (n:ℝ)^d → s.total ≤ T →
        (∀ j q, mask j q = 0 ∨ mask j q = 1) →
        (∀ L ∈ specifiedBoardLines n Γ,
          (∑ q ∈ L.val, s.cumulative (fun j => mask j q) s.total)/(n:ℝ) ≤ H) →
        ∀ p : Grid n,
        let cs := scheduleSharedPhases s mask hm Γ B (255/128) ρ
        let deadline := scheduleProcessDeadline s mask
        (phasePointMeasure cs ε ((n:ℝ)^γ) deadline 0 hn hB p J).real
          (scheduledBoundaryCauseBefore cs ε ((n:ℝ)^γ) deadline 0 hn
            (augInitialState B hB deadline 0) p .clock J) ≤ tol := by
  obtain ⟨δ, hδ, hgap⟩ := exists_strictClockSlack T H (255/128) hT hH
  obtain ⟨nP, hnP, hP⟩ := exists_canonicalClockCell_phase_power_tail T (1+2*(Γ.card:ℝ)) d γ δ J
    hT (by positivity) hd hdγ hγ hδ hJ
  obtain ⟨nF, _, hF⟩ := exists_clockFinitePhase_point_bound_le (255/128) J (lineCountConstant Γ) tol htol
  refine ⟨max nP nF, hnP.trans (le_max_left _ _), ?_⟩
  intro n hnn s mask hm B ρ ε hε hn hB hBd hTn hbin hinput p
  let cs := scheduleSharedPhases s mask hm Γ B (255/128) ρ
  let deadline := scheduleProcessDeadline s mask
  have hΓ (j : ℕ) : (cs j).directions = Γ :=
    scheduleSharedPhases_directions s mask hm Γ B (255/128) ρ j
  have hK (j : ℕ) : (cs j).K = 255/128 := by
    dsimp only [cs, scheduleSharedPhases]
    split <;> rfl
  have hb (j : ℕ) (hj : j < J) (q : Grid n) : (cs j).mask q = 0 ∨ (cs j).mask q = 1 := by
    let i : Fin J := ⟨j, hj⟩
    change (cs i.val).mask q = 0 ∨ (cs i.val).mask q = 1
    rw [scheduleSharedPhases_mask]
    exact hbin i q
  have hbudget (L : LineIndex n) (hL : L ∈ specifiedBoardLines n Γ) :
      specifiedClockScheduleInput cs L J + (phaseEndpoint cs 0 J - 0)*δ < 255/128 := by
    change specifiedClockScheduleInput (scheduleSharedPhases s mask hm Γ B (255/128) ρ) L J +
      (phaseEndpoint (scheduleSharedPhases s mask hm Γ B (255/128) ρ) 0 J - 0)*δ < 255/128
    rw [schedule_specifiedClockInput, scheduleSharedPhases_total, sub_zero]
    exact (add_le_add (hinput L hL) (mul_le_mul_of_nonneg_right hTn hδ.le)).trans_lt hgap
  have hphase := hP n ((le_max_left _ _).trans hnn) B cs Γ ε (255/128) hn hΓ
    le_rfl
    (fun j hj => (scheduleSharedPhases_horizon_le_total s mask hm Γ B (255/128) ρ j hj).trans hTn)
    hB hBd (fun j => (hK j).le) (by norm_num)
  have hM : 0 < (n:ℝ)^γ := Real.rpow_pos_of_pos (by exact_mod_cast hn) _
  have hclock := canonicalScheduledClockCause_point_real_le_of_phase cs ε ((n:ℝ)^γ) (255/128)
    hε hM deadline 0 p hn hB Γ δ J hJ hΓ hK (by norm_num) (by norm_num) hδ.le hb
    hbudget (2*(n:ℝ)^(-(3:ℝ))) (by positivity)
    (fun L hL i => hphase L (Finset.mem_filter.mp hL).2 i)
  have hn1 : (1:ℝ) ≤ n := by exact_mod_cast (show 1 ≤ n by omega)
  have hBn : B ≤ n := hBd.trans (by
    simpa only [Real.rpow_one] using Real.rpow_le_rpow_of_exponent_le hn1 (hdγ.trans_lt hγ).le)
  exact hclock.trans (hF n ((le_max_right _ _).trans hnn) B (zero_le_one.trans hB) hBn)

#print axioms exists_binary_schedule_clock_small
end NoThreeLine481
