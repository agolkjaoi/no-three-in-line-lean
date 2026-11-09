import NoThreeLine.ScheduledRootCreditLossTail

/-! Actual nonnegative credit-loss integrals up to any scheduled interior
cut are pathwise at most the whole-schedule loss. This argument uses no
union bound over phases or times and does not change the actual process. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def scheduledCreditLossIntegrand {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (x : BoardClockPath n × ℝ) : ℝ :=
  scheduledActiveLineMass cs ε M deadline start hn hB L p N x *
    (1-scheduledCutLineCreditValue cs ε M deadline start L hn (initialGoodPhaseObservation B hB deadline start) N x)

theorem scheduledCreditLossIntegrand_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val) :
    Measurable (scheduledCreditLossIntegrand cs ε M deadline start hn hB L p N) :=
  (scheduledActiveLineMass_measurable cs ε M deadline start hn hB L p N hL hpL).mul
    (measurable_const.sub (scheduledCutLineCreditValue_measurable cs ε M deadline start L hn _ N))

theorem scheduledCreditLossIntegrand_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val) (x : BoardClockPath n × ℝ) :
    0 ≤ scheduledCreditLossIntegrand cs ε M deadline start hn hB L p N x ∧
      scheduledCreditLossIntegrand cs ε M deadline start hn hB L p N x ≤ ∑ q ∈ L.val.erase p, rootLeafCap {p,q} p B := by
  have hw := scheduledActiveLineMass_bounds cs ε M deadline start hn hB L p N hL hpL x
  have hr := scheduledCutLineCreditValue_bounds cs ε M deadline start L hn
    (initialGoodPhaseObservation B hB deadline start) N x
  exact ⟨mul_nonneg hw.1 (sub_nonneg.mpr hr.2),
    (mul_le_of_le_one_right hw.1 (sub_le_self (1 : ℝ) hr.1)).trans hw.2⟩

def scheduledCreditLossPrefix {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ) (t : ℝ)
    (ω : BoardClockPath n) : ℝ :=
  ∫ u in (0 : ℝ)..t, scheduledCreditLossIntegrand cs ε M deadline start hn hB L p N (ω,u)

theorem scheduledCreditLossPrefix_horizon {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ) (ω : BoardClockPath n) :
    scheduledCreditLossPrefix cs ε M deadline start hn hB L p N (cs N).horizon ω =
      scheduledCreditLossMassPath cs ε M deadline start hn hB L p N ω := rfl

theorem scheduledCreditLossPrefix_le_phase {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val) (t : ℝ)
    (ht : t ∈ Icc (0 : ℝ) (cs N).horizon) (ω : BoardClockPath n) :
    0 ≤ scheduledCreditLossPrefix cs ε M deadline start hn hB L p N t ω ∧
      scheduledCreditLossPrefix cs ε M deadline start hn hB L p N t ω ≤
        scheduledCreditLossMassPath cs ε M deadline start hn hB L p N ω := by
  let f := fun u => scheduledCreditLossIntegrand cs ε M deadline start hn hB L p N (ω,u)
  have hf : Measurable f := (scheduledCreditLossIntegrand_measurable cs ε M deadline start hn hB L p N hL hpL).comp
    (measurable_const.prodMk measurable_id)
  have hb (u : ℝ) := scheduledCreditLossIntegrand_bounds cs ε M deadline start hn hB L p N hL hpL (ω,u)
  have hi : IntervalIntegrable f volume 0 (cs N).horizon :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le (cs N).horizon.coe_nonneg).mpr
      (integrableOn_of_nonneg_bound volume (Ioo (0 : ℝ) (cs N).horizon) measurableSet_Ioo f hf _ (fun u _ => hb u))
  exact ⟨intervalIntegral.integral_nonneg ht.1 (fun u _ => (hb u).1),
    intervalIntegral.integral_mono_interval le_rfl ht.1 ht.2 (Filter.Eventually.of_forall (fun u => (hb u).1)) hi⟩

def scheduledRootCreditLossPrefix {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (N : ℕ) (t : ℝ)
    (ω : BoardClockPath n) : ℝ :=
  (∑ L ∈ nonSpecifiedRootBoardLines Γ p,
    ((∑ j ∈ Finset.range N, scheduledCreditLossMassPath cs ε M deadline start hn hB L.val p j ω)+
      scheduledCreditLossPrefix cs ε M deadline start hn hB L.val p N t ω))/n

theorem scheduledRootCreditLossPrefix_le_full {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (N J : ℕ) (hNJ : N < J) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (cs N).horizon)
    (ω : BoardClockPath n) :
    scheduledRootCreditLossPrefix cs ε M deadline start hn hB Γ p N t ω ≤
      scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω := by
  apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
  apply Finset.sum_le_sum
  intro L hL
  have hLi (j : ℕ) : ¬specified (cs j).directions L.val := by
    rw [hΓ j]
    exact (Finset.mem_filter.mp hL).2
  calc
    _ ≤ (∑ j ∈ Finset.range N, scheduledCreditLossMassPath cs ε M deadline start hn hB L.val p j ω)+
        scheduledCreditLossMassPath cs ε M deadline start hn hB L.val p N ω :=
      add_le_add (le_refl _) (scheduledCreditLossPrefix_le_phase cs ε M deadline start hn hB L.val p N (hLi N) L.property t ht ω).2
    _ = ∑ j ∈ Finset.range (N+1), scheduledCreditLossMassPath cs ε M deadline start hn hB L.val p j ω :=
      (Finset.sum_range_succ _ N).symm
    _ ≤ _ := Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono (Nat.succ_le_of_lt hNJ))
      (fun j _ _ => (scheduledCreditLossMassPath_bounds cs ε M deadline start hn hB L.val p j (hLi j) L.property ω).1)

theorem scheduledRootCreditLossPrefix_horizon {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (N : ℕ) (ω : BoardClockPath n) :
    scheduledRootCreditLossPrefix cs ε M deadline start hn hB Γ p N (cs N).horizon ω =
      scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p (N+1) ω := by
  simp only [scheduledRootCreditLossPrefix,scheduledRootCreditLossPath,
    scheduledCreditLossPrefix_horizon,Finset.sum_range_succ]

theorem scheduledRootCreditLossPath_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (p : Grid n) (J : ℕ) :
    Measurable (scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J) := by
  apply Measurable.div_const
  apply Finset.measurable_sum
  intro L hL
  apply Finset.measurable_sum
  intro N _
  exact scheduledCreditLossMassPath_measurable cs ε M deadline start hn hB L.val p N
    (by rw [hΓ N]; exact (Finset.mem_filter.mp hL).2) L.property

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCreditLossPrefix_le_phase
#print axioms NoThreeLine.BirthWitness.scheduledRootCreditLossPrefix_le_full
#print axioms NoThreeLine.BirthWitness.scheduledRootCreditLossPrefix_horizon
