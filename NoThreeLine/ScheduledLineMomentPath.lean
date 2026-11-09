import NoThreeLine.ScheduledTerminalRootMoment

/-! Pathwise first/second line moment integrals and their finite witness
sums. Their terminal expectations equal the already bounded C11 quantities;
all exchanges of finite sums and integrals have actual integrability proofs. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def scheduledLineMomentPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : Grid n → ℝ) (L : LineIndex n)
    (p z : Grid n) (k N : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∫ t in (0 : ℝ)..(cs N).horizon, selectedLineLeafPower mask L p z k
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t))

theorem scheduledLineMomentPath_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : Grid n → ℝ) (L : LineIndex n)
    (p z : Grid n) (k N : ℕ) :
    Measurable (scheduledLineMomentPath cs ε M deadline start hn hB mask L p z k N) :=
  variable_running_integral_measurable (fun _ => (cs N).horizon) measurable_const
    (fun _ => (cs N).horizon.coe_nonneg) _
    ((selectedLineLeafPower_measurable mask L p z k).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N))

theorem scheduledLineMomentPath_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (L : LineIndex n) (p z : Grid n) (k N : ℕ) (ω : BoardClockPath n) :
    0 ≤ scheduledLineMomentPath cs ε M deadline start hn hB mask L p z k N ω ∧
      scheduledLineMomentPath cs ε M deadline start hn hB mask L p z k N ω ≤
        (cs N).horizon*(B*(L.val.card : ℝ))^k :=
  integral_initial_segment_bounds _ _ (cs N).horizon.coe_nonneg le_rfl _
    (((selectedLineLeafPower_measurable mask L p z k).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)).comp
        (measurable_const.prodMk measurable_id)) _
    (pow_nonneg (mul_nonneg (zero_le_one.trans hB) (Nat.cast_nonneg _)) k)
    (fun t _ => selectedLineLeafPower_bounds mask hm L p z k _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N (ω,t)))

theorem scheduledLineMomentPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (L : LineIndex n) (p z : Grid n) (k N : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledLineMomentPath cs ε M deadline start hn hB mask L p z k N) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    (scheduledLineMomentPath_measurable cs ε M deadline start hn hB mask L p z k N) _
    (scheduledLineMomentPath_bounds cs ε M deadline start hn hB mask hm L p z k N)

def scheduledWitnessMomentPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (L : LineIndex n)
    (p : Grid n) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑ z ∈ L.val.erase p, ∑ N ∈ Finset.range J,
    (scheduledLineMomentPath cs ε M deadline start hn hB (mask N) L p z 2 N ω +
      B*scheduledLineMomentPath cs ε M deadline start hn hB (mask N) L p z 1 N ω)

theorem scheduledWitnessMomentPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (hm : ∀ N q, 0 ≤ mask N q ∧ mask N q ≤ 1)
    (L : LineIndex n) (p : Grid n) (J : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledWitnessMomentPath cs ε M deadline start hn hB mask L p J) μ := by
  apply integrable_finsetSum
  intro z _
  apply integrable_finsetSum
  intro N _
  exact (scheduledLineMomentPath_integrable cs ε M deadline start hn hB (mask N) (hm N) L p z 2 N μ).add
    ((scheduledLineMomentPath_integrable cs ε M deadline start hn hB (mask N) (hm N) L p z 1 N μ).const_mul B)

theorem scheduledWitnessMomentPath_terminal_mean {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (hm : ∀ N q, 0 ≤ mask N q ∧ mask N q ≤ 1)
    (L : LineIndex n) (p : Grid n) (J : ℕ) :
    (∫ ω, scheduledWitnessMomentPath cs ε M deadline start hn hB mask L p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) =
      scheduledTerminalWitnessMoment cs ε M deadline start hn hB mask L p J := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hi (z : Grid n) (k N : ℕ) :=
    scheduledLineMomentPath_integrable cs ε M deadline start hn hB (mask N) (hm N) L p z k N μ
  have hi12 (z : Grid n) (N : ℕ) : Integrable (fun ω =>
      scheduledLineMomentPath cs ε M deadline start hn hB (mask N) L p z 2 N ω +
      B*scheduledLineMomentPath cs ε M deadline start hn hB (mask N) L p z 1 N ω) μ :=
    (hi z 2 N).add ((hi z 1 N).const_mul B)
  have hiz (z : Grid n) : Integrable (fun ω => ∑ N ∈ Finset.range J,
      (scheduledLineMomentPath cs ε M deadline start hn hB (mask N) L p z 2 N ω +
      B*scheduledLineMomentPath cs ε M deadline start hn hB (mask N) L p z 1 N ω)) μ :=
    integrable_finsetSum _ (fun N _ => hi12 z N)
  unfold scheduledWitnessMomentPath scheduledTerminalWitnessMoment scheduledTerminalLineMomentTotal
  rw [integral_finsetSum _ (fun z _ => hiz z)]
  apply Finset.sum_congr rfl
  intro z _
  rw [integral_finsetSum _ (fun N _ => hi12 z N),
    Finset.mul_sum, ←Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro N _
  rw [integral_add (hi z 2 N) ((hi z 1 N).const_mul B), integral_const_mul]
  rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledLineMomentPath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledWitnessMomentPath_terminal_mean
