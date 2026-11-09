import NoThreeLine.ActiveLineCreditMass
import NoThreeLine.ScheduledLineMomentPath

/-! One actual phase integral of active-root credit decay times unmasked
line mass is dominated pathwise by its actual first/second witness integrals.
No conditional estimate or artificial replacement clock is used here. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def scheduledCreditMassPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∫ t in (0 : ℝ)..(cs N).horizon, activeLineCreditMass (cs N).directions (cs N).mask L p
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t))

theorem scheduledCreditMassPath_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ) :
    Measurable (scheduledCreditMassPath cs ε M deadline start hn hB L p N) :=
  variable_running_integral_measurable (fun _ => (cs N).horizon) measurable_const
    (fun _ => (cs N).horizon.coe_nonneg) _
    ((activeLineCreditMass_measurable (cs N).directions (cs N).mask L p).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N))

theorem scheduledCreditMassPath_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ) (ω : BoardClockPath n) :
    0 ≤ scheduledCreditMassPath cs ε M deadline start hn hB L p N ω ∧
      scheduledCreditMassPath cs ε M deadline start hn hB L p N ω ≤
        (cs N).horizon*(((L.val.card : ℝ)*(B/n))*(B*(L.val.card : ℝ))) :=
  integral_initial_segment_bounds _ _ (cs N).horizon.coe_nonneg le_rfl _
    (((activeLineCreditMass_measurable (cs N).directions (cs N).mask L p).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)).comp
        (measurable_const.prodMk measurable_id)) _ (by positivity)
    (fun t _ => activeLineCreditMass_bounds (cs N).directions (cs N).mask
      (fun q => ⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩) L p _ B (zero_lt_one.trans_le hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N (ω,t)))

theorem scheduledCreditMassPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledCreditMassPath cs ε M deadline start hn hB L p N) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    (scheduledCreditMassPath_measurable cs ε M deadline start hn hB L p N) _
    (scheduledCreditMassPath_bounds cs ε M deadline start hn hB L p N)

theorem scheduledCreditMassPath_le_witness_integrals {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (hpL : p ∈ L.val)
    (N : ℕ) (ω : BoardClockPath n) :
    scheduledCreditMassPath cs ε M deadline start hn hB L p N ω ≤
      (∑ z ∈ L.val.erase p,
        (scheduledLineMomentPath cs ε M deadline start hn hB (fun _ => 1) L p z 2 N ω +
        B*scheduledLineMomentPath cs ε M deadline start hn hB (fun _ => 1) L p z 1 N ω))/n := by
  let W := fun t : ℝ => scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) N (ω,t)
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N).comp
    (measurable_const.prodMk measurable_id)
  have hv (t : ℝ) : (W t).Valid B :=
    scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N (ω,t)
  let f := fun (k : ℕ) (z : Grid n) (t : ℝ) => selectedLineLeafPower (fun _ => 1) L p z k (W t)
  have hi (k : ℕ) (z : Grid n) : IntervalIntegrable (f k z) volume 0 (cs N).horizon := by
    apply (intervalIntegrable_iff_integrableOn_Ioo_of_le (cs N).horizon.coe_nonneg).mpr
    exact integrableOn_of_nonneg_bound volume (Ioo (0 : ℝ) (cs N).horizon) measurableSet_Ioo _
      ((selectedLineLeafPower_measurable (fun _ => 1) L p z k).comp hW) ((B*(L.val.card : ℝ))^k)
      (fun t _ => selectedLineLeafPower_bounds (fun _ => 1) (fun _ => ⟨zero_le_one,le_rfl⟩) L p z k _ B
        (zero_le_one.trans hB) (hv t))
  let g := fun (z : Grid n) (t : ℝ) => f 2 z t+B*f 1 z t
  have hig (z : Grid n) : IntervalIntegrable (g z) volume 0 (cs N).horizon :=
    (hi 2 z).add ((hi 1 z).const_mul B)
  have hs : IntervalIntegrable (fun t => ∑ z ∈ L.val.erase p, g z t) volume 0 (cs N).horizon := by
    simpa only [Finset.sum_fn] using IntervalIntegrable.sum (L.val.erase p) (fun z _ => hig z)
  have hr : IntervalIntegrable (fun t => activeLineCreditMass (cs N).directions (cs N).mask L p (W t))
      volume 0 (cs N).horizon := by
    apply (intervalIntegrable_iff_integrableOn_Ioo_of_le (cs N).horizon.coe_nonneg).mpr
    exact integrableOn_of_nonneg_bound volume (Ioo (0 : ℝ) (cs N).horizon) measurableSet_Ioo _
      ((activeLineCreditMass_measurable (cs N).directions (cs N).mask L p).comp hW)
      (((L.val.card : ℝ)*(B/n))*(B*(L.val.card : ℝ)))
      (fun t _ => activeLineCreditMass_bounds (cs N).directions (cs N).mask
        (fun q => ⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩) L p _ B (zero_lt_one.trans_le hB) (hv t))
  have hh := intervalIntegral.integral_mono (cs N).horizon.coe_nonneg hr (hs.div_const n)
    (fun t => activeLineCreditMass_le_low_moments (cs N).directions (cs N).mask (cs N).mask_le_one
      L p hpL (W t) B (zero_le_one.trans hB) (hv t))
  apply hh.trans_eq
  rw [intervalIntegral.integral_div, intervalIntegral.integral_finsetSum (fun z _ => hig z)]
  congr 1
  apply Finset.sum_congr rfl
  intro z _
  change (∫ t in (0 : ℝ)..(cs N).horizon, f 2 z t+B*f 1 z t) = _
  rw [intervalIntegral.integral_add (hi 2 z) ((hi 1 z).const_mul B), intervalIntegral.integral_const_mul]
  rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCreditMassPath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledCreditMassPath_le_witness_integrals
