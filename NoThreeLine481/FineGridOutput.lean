import NoThreeLine481.BinaryOutput
import NoThreeLine481.TerminalCapacity
import NoThreeLine481.TerminalMass

/-! A binary schedule with the manuscript's terminal field already satisfies
the mass and capacity hypotheses of the five-cause output theorem. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine FinitePhase FiniteDirections

structure FineGridScheduleInput (n J : ℕ) (T : ℝ) where
  schedule : Schedule J
  mask : Fin J → Grid n → ℝ
  binary : ∀ j q, mask j q = 0 ∨ mask j q = 1
  total_le : schedule.total ≤ T
  terminal : ∀ q, schedule.cumulative (fun j => mask j q) schedule.total = fineGridTerminal q
  pairs : ∀ p : Grid n, 0 < scheduleProcessDeadline schedule mask p →
    normalizedPairSum p (fun q => schedule.cumulative (fun j => mask j q)
      (scheduleProcessDeadline schedule mask p)) ≤ (319969/320000:ℝ)*Real.log n

def FineGridScheduleInput.toBinaryScheduleInput {n J : ℕ} {T : ℝ}
    (data : FineGridScheduleInput n J T) (hn : 2^30 ≤ n) :
    BinaryScheduleInput n J T (255/128-1/10000) (319969/320000) where
  schedule := data.schedule
  mask := data.mask
  binary := data.binary
  total_le := data.total_le
  clockInput L hL := by
    simp_rw [data.terminal]
    exact specifiedClockCap_of_coarse_domination fineGridTerminal (by omega)
      (fun q => (fineGridTerminal_bounds q).2) L hL
  tagInput p L hL := by
    simp_rw [data.terminal]
    exact ordinaryTagCap_of_coarse_domination fineGridTerminal (by omega)
      (fun q => (fineGridTerminal_bounds q).1) (fun q => (fineGridTerminal_bounds q).2) p L hL
  mass := by
    unfold Schedule.boardInputMass
    simp_rw [data.terminal]
    exact boardMassFloor_le_fineGridTerminal hn
  pairs := data.pairs

theorem target_of_eventual_fineGridSchedules (T : ℝ) (J : ℕ) (hT : 0 ≤ T) (hJ : 0 < J)
    (hInput : ∃ N : ℕ, ∀ n ≥ N, Nonempty (FineGridScheduleInput n J T)) :
    NoThreeLine.Target := by
  apply target_of_eventual_binary_schedules T (255/128-1/10000) (319969/320000)
    (19999/20000) (39999/40000) (1/1000000) J hT (by norm_num) hJ
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num)
  obtain ⟨N, hN⟩ := hInput
  refine ⟨max N (2^30), ?_⟩
  intro n hn
  obtain ⟨data⟩ := hN n ((le_max_left _ _).trans hn)
  exact ⟨data.toBinaryScheduleInput ((le_max_right _ _).trans hn)⟩

#print axioms FineGridScheduleInput.toBinaryScheduleInput
#print axioms target_of_eventual_fineGridSchedules

end NoThreeLine481
