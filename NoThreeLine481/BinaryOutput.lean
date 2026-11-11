import NoThreeLine.FrozenOtherThreeCauses
import NoThreeLine.ScheduleFiveCauseOutput
import NoThreeLine.ScheduleTagInput
import NoThreeLine.SpecifiedClockFrozenParameters
import NoThreeLine.Target
import NoThreeLine481.BinaryClock
import NoThreeLine481.NumericalMargin

/-! The output theorem for an arbitrary finite binary schedule. Its
premises are deterministic conditions on that schedule and its masks. -/
set_option autoImplicit false
set_option maxHeartbeats 3500000
open scoped BigOperators
noncomputable section

namespace NoThreeLine481
open NoThreeLine AuxiliaryODE BirthWitness FinitePhase FiniteDirections
  FrozenCapacity PrimitiveLines SpecifiedBoardCount

structure BinaryScheduleInput (n J : ℕ) (T H a : ℝ) where
  schedule : Schedule J
  mask : Fin J → Grid n → ℝ
  binary : ∀ j q, mask j q = 0 ∨ mask j q = 1
  total_le : schedule.total ≤ T
  clockInput : ∀ L ∈ specifiedBoardLines n gamma16,
    (∑ q ∈ L.val, schedule.cumulative (fun j => mask j q) schedule.total)/(n:ℝ) ≤ H
  tagInput : ∀ (p : Grid n) (L : RootBoardLineIndex p), ¬specified gamma16 L.val →
    (∑ q ∈ L.val.val.erase p, schedule.cumulative (fun j => mask j q) schedule.total)/(n:ℝ) ≤
      4/5
  mass : (boardMassFloor:ℝ) ≤ schedule.boardInputMass mask
  pairs : ∀ p : Grid n, 0 < scheduleProcessDeadline schedule mask p →
    normalizedPairSum p (fun q => schedule.cumulative (fun j => mask j q)
      (scheduleProcessDeadline schedule mask p)) ≤ a*Real.log n

theorem BinaryScheduleInput.mask_bounds {n J : ℕ} {T H a : ℝ}
    (data : BinaryScheduleInput n J T H a) (j : Fin J) (q : Grid n) :
    0 ≤ data.mask j q ∧ data.mask j q ≤ 1 := by
  rcases data.binary j q with h | h <;> simp [h]

theorem exists_binary_schedule_output (T H a d γ ζ : ℝ) (J : ℕ)
    (hT : 0 ≤ T) (hH : H < 255/128) (hJ : 0 < J)
    (ha : 0 ≤ a) (had : a < d) (hdγ : d < γ) (hγ : γ < 1)
    (hζ : 0 < ζ) (hζd : ζ < 1-d) :
    ∃ n0 : ℕ, 2 ≤ n0 ∧ ∀ n ≥ n0,
      BinaryScheduleInput n J T H a →
      ∃ S : Finset (Grid n), NoThree S ∧ 1501*n ≤ 1000*S.card := by
  let κ : ℝ := 1/500000
  have hκ : 0 < κ := by norm_num [κ]
  have hd : 0 ≤ d := ha.trans had.le
  obtain ⟨nW,_,hW⟩ := exists_uniform_frozen_weight_eta_virtual_small T a d γ ζ κ
    hT ha had hdγ hγ hζ hζd hκ
  obtain ⟨nC,_,hC⟩ := exists_binary_schedule_clock_small T H d γ κ gamma16 J
    hT hJ hH hd hdγ.le hγ hκ
  obtain ⟨nT,_,hTag⟩ := exists_uniform_schedule_tagCause_threshold J T (4/5) (1/8) d ζ κ
    hT (by norm_num) (hdγ.trans hγ) hζ hκ
  refine ⟨max 2 (max nW (max nC nT)), le_max_left _ _, ?_⟩
  intro n hn0 data
  have hnW : nW ≤ n := by omega
  have hnC : nC ≤ n := by omega
  have hnT : nT ≤ n := by omega
  have hn : 0 < n := by omega
  have hnR : (0:ℝ) < n := by exact_mod_cast hn
  let B := (n:ℝ)^d
  have hB : 1 ≤ B := Real.one_le_rpow (by exact_mod_cast hn) hd
  let ε := (n:ℝ)^(-ζ)
  let M := (n:ℝ)^γ
  have hε : 0 < ε := Real.rpow_pos_of_pos hnR _
  let s := data.schedule
  let mask := data.mask
  let deadline := scheduleProcessDeadline s mask
  have hclock := hC n hnC s mask data.mask_bounds B (1/8) ε hε hn hB le_rfl
    data.total_le data.binary data.clockInput
  have hcombine := schedule_exists_noThree_from_five_causes s mask data.mask_bounds gamma16
    B (255/128) (1/8) ε M hn hB (5*κ)
  obtain ⟨S,hS,hcard⟩ := hcombine (by
    intro p hp
    obtain ⟨hWeight,hEta,hVirtual⟩ :=
      hW n hnW J s mask data.mask_bounds p data.total_le hp (data.pairs p hp)
    have hinit := augInitialState_active_of_before_deadline B hB deadline 0 p hp
    have htag := hTag n hnT B s mask data.mask_bounds gamma16 (255/128) M p hn hB hinit
      (by norm_num) data.binary le_rfl data.total_le (data.tagInput p)
    have hc := hclock p
    dsimp only at hWeight hEta hVirtual htag hc ⊢
    linarith only [hWeight,hEta,hVirtual,htag.le,hc])
  refine ⟨S,hS,cardinality_of_retained_exposure n S.card (s.boardInputMass mask) data.mass ?_⟩
  have hbudget : 5*κ = (1/100000:ℝ) := by norm_num [κ]
  simpa only [hbudget] using hcard

theorem target_of_eventual_binary_schedules (T H a d γ ζ : ℝ) (J : ℕ)
    (hT : 0 ≤ T) (hH : H < 255/128) (hJ : 0 < J)
    (ha : 0 ≤ a) (had : a < d) (hdγ : d < γ) (hγ : γ < 1)
    (hζ : 0 < ζ) (hζd : ζ < 1-d)
    (hInput : ∃ N : ℕ, ∀ n ≥ N, Nonempty (BinaryScheduleInput n J T H a)) :
    NoThreeLine.Target := by
  obtain ⟨N,hN⟩ := hInput
  obtain ⟨n0,_,h0⟩ := exists_binary_schedule_output T H a d γ ζ J hT hH hJ
    ha had hdγ hγ hζ hζd
  refine ⟨max n0 N, ?_⟩
  intro n hn
  obtain ⟨data⟩ := hN n ((le_max_right _ _).trans hn)
  exact h0 n ((le_max_left _ _).trans hn) data

#print axioms exists_binary_schedule_output
#print axioms target_of_eventual_binary_schedules

end NoThreeLine481
