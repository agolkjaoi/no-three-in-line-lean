import NoThreeLine.ScheduledCutTerminalExcess
import NoThreeLine.ScheduledCutLongExcess

/-! Pathwise phase integrals and finite witness/line sums. All integrability
facts below follow from actual valid-state bounds and finite time intervals. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def scheduledLineExcessPath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) (N : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∫t in (0:ℝ)..(cs N).horizon,selectedLineExcess mask L p z
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t))

theorem scheduledLineExcessPath_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) (N : ℕ) :
    Measurable (scheduledLineExcessPath cs ε M deadline start hn hB mask L p z N) :=
  variable_running_integral_measurable (fun _=>(cs N).horizon) measurable_const
    (fun _=>(cs N).horizon.coe_nonneg) _
    ((selectedLineExcess_measurable mask L p z).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N))

theorem scheduledLineExcessPath_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (N : ℕ) (ω : BoardClockPath n) :
    0≤scheduledLineExcessPath cs ε M deadline start hn hB mask L p z N ω ∧
      scheduledLineExcessPath cs ε M deadline start hn hB mask L p z N ω≤
        (cs N).horizon*(B*(L.val.card:ℝ)) :=
  integral_initial_segment_bounds _ _ (cs N).horizon.coe_nonneg le_rfl _
    (((selectedLineExcess_measurable mask L p z).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)).comp
        (measurable_const.prodMk measurable_id)) _
    (mul_nonneg (zero_le_one.trans hB) (Nat.cast_nonneg _))
    (fun t _=>selectedLineExcess_bounds mask hm L p z _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N (ω,t)))

theorem scheduledLineExcessPath_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (N : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledLineExcessPath cs ε M deadline start hn hB mask L p z N) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    (scheduledLineExcessPath_measurable cs ε M deadline start hn hB mask L p z N) _
    (scheduledLineExcessPath_bounds cs ε M deadline start hn hB mask hm L p z N)

def scheduledLineWitnessPath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (L : LineIndex n) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  (∑z∈L.val.erase p,∑N∈Finset.range J,
    scheduledLineExcessPath cs ε M deadline start hn hB (cs N).mask L p z N ω)/n

theorem scheduledLineWitnessPath_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (L : LineIndex n) (p : Grid n) (J : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledLineWitnessPath cs ε M deadline start hn hB L p J) μ := by
  apply Integrable.div_const
  apply integrable_finset_sum
  intro z _
  apply integrable_finset_sum
  intro N _
  exact scheduledLineExcessPath_integrable cs ε M deadline start hn hB (cs N).mask
    (fun q=>⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩) L p z N μ

theorem scheduledLineWitnessPath_terminal_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (L : LineIndex n) (p : Grid n) (J : ℕ) :
    (∫ω,scheduledLineWitnessPath cs ε M deadline start hn hB L p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)=
        scheduledCutLineWitnessSum cs ε M deadline start hn hB L p J := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hi (z : Grid n) (N : ℕ) := scheduledLineExcessPath_integrable cs ε M deadline start hn hB (cs N).mask
    (fun q=>⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩) L p z N μ
  unfold scheduledLineWitnessPath scheduledCutLineWitnessSum scheduledCutLineExcessTotal
  rw [integral_div,integral_finset_sum _ (fun z _=>integrable_finset_sum _ (fun N _=>hi z N))]
  congr 1
  apply Finset.sum_congr rfl
  intro z _
  rw [integral_finset_sum _ (fun N _=>hi z N)]
  apply Finset.sum_congr rfl
  intro N hN
  exact scheduledCutLineExcess_terminal_integral cs ε M deadline start hn hB (cs N).mask
    (fun q=>⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩) L p z N J (Finset.mem_range.mp hN)

def scheduledLongExcessPath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ℓ : ℝ) (ω : BoardClockPath n) : ℝ :=
  ∑L∈longRootBoardLines Γ p (B*ℓ),scheduledLineWitnessPath cs ε M deadline start hn hB L.val p J ω

theorem scheduledLongExcessPath_terminal_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ℓ : ℝ) :
    (∫ω,scheduledLongExcessPath cs ε M deadline start hn hB Γ p J ℓ ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J)=
        scheduledCutLongExcess cs ε M deadline start hn hB Γ p J ℓ := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  unfold scheduledLongExcessPath scheduledCutLongExcess
  rw [integral_finset_sum _ (fun L _=>scheduledLineWitnessPath_integrable cs ε M deadline start hn hB L.val p J μ)]
  exact Finset.sum_congr rfl (fun L _=>scheduledLineWitnessPath_terminal_mean cs ε M deadline start hn hB L.val p J)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledLineWitnessPath_terminal_mean
#print axioms NoThreeLine.BirthWitness.scheduledLongExcessPath_terminal_mean
