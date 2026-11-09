import NoThreeLine.ScheduledCreditDoubleSum
import NoThreeLine.ScheduledCutCreditOneSub

/-! Actual active line mass times lost line credit. Its path integral is
bounded under any finite measure. Under the original full terminal point
law it is exactly the sum of earlier-phase rectangles and the current
phase triangle, using the actual path/time credit decrement identity. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines CalendarIntegral

theorem scheduledCutLineCreditValue_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (s : GoodPhaseObservation n B) (N : ℕ)
    (x : BoardClockPath n × ℝ) :
    0 ≤ scheduledCutLineCreditValue cs ε M deadline start L hn s N x ∧
      scheduledCutLineCreditValue cs ε M deadline start L hn s N x ≤ 1 :=
  (scheduledCutObservation cs ε M deadline start hn s N x).1.property.1.1.2.1.2.2 L

def scheduledCreditLossMassPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (ω : BoardClockPath n) : ℝ :=
  ∫ t in (0 : ℝ)..(cs N).horizon,
    scheduledActiveLineMass cs ε M deadline start hn hB L p N (ω,t) *
      (1-scheduledCutLineCreditValue cs ε M deadline start L hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))

theorem scheduledCreditLossMassPath_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val) :
    Measurable (scheduledCreditLossMassPath cs ε M deadline start hn hB L p N) :=
  variable_running_integral_measurable (fun _ => (cs N).horizon) measurable_const
    (fun _ => (cs N).horizon.coe_nonneg) _
    ((scheduledActiveLineMass_measurable cs ε M deadline start hn hB L p N hL hpL).mul
      (measurable_const.sub (scheduledCutLineCreditValue_measurable cs ε M deadline start L hn _ N)))

theorem scheduledCreditLossMassPath_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val) (ω : BoardClockPath n) :
    0 ≤ scheduledCreditLossMassPath cs ε M deadline start hn hB L p N ω ∧
      scheduledCreditLossMassPath cs ε M deadline start hn hB L p N ω ≤
        (cs N).horizon * ∑ q ∈ L.val.erase p, rootLeafCap {p,q} p B := by
  let A := ∑ q ∈ L.val.erase p, rootLeafCap {p,q} p B
  have hw := scheduledActiveLineMass_bounds cs ε M deadline start hn hB L p N hL hpL
  have hA : 0 ≤ A := (hw (ω,0)).1.trans (hw (ω,0)).2
  apply integral_initial_segment_bounds _ _ (cs N).horizon.coe_nonneg le_rfl _
    (((scheduledActiveLineMass_measurable cs ε M deadline start hn hB L p N hL hpL).mul
      (measurable_const.sub (scheduledCutLineCreditValue_measurable cs ε M deadline start L hn _ N))).comp
        (measurable_const.prodMk measurable_id)) A hA
  intro t _
  have hr := scheduledCutLineCreditValue_bounds cs ε M deadline start L hn
    (initialGoodPhaseObservation B hB deadline start) N (ω,t)
  exact ⟨mul_nonneg (hw (ω,t)).1 (sub_nonneg.mpr hr.2),
    (mul_le_of_le_one_right (hw (ω,t)).1 (sub_le_self (1:ℝ) hr.1)).trans (hw (ω,t)).2⟩

theorem scheduledCreditLossMassPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledCreditLossMassPath cs ε M deadline start hn hB L p N) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    (scheduledCreditLossMassPath_measurable cs ε M deadline start hn hB L p N hL hpL)
    _ (scheduledCreditLossMassPath_bounds cs ε M deadline start hn hB L p N hL hpL)

theorem scheduledCreditLossMassPath_decomposition_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N J : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val) :
    ∀ᵐ ω ∂phasePointMeasure cs ε M deadline start hn hB p J,
      scheduledCreditLossMassPath cs ε M deadline start hn hB L p N ω =
        (∑ j ∈ Finset.range N, scheduledCreditRectanglePath cs ε M deadline start hn hB L p j N ω) +
          scheduledCreditTrianglePath cs ε M deadline start hn hB L p N ω := by
  let s := initialGoodPhaseObservation B hB deadline start
  let H : ℝ := (cs N).horizon
  let w := scheduledActiveLineMass cs ε M deadline start hn hB L p N
  let r := scheduledCutLineCreditRate cs ε M deadline start L hn s N
  let A := ∑ q ∈ L.val.erase p, rootLeafCap {p,q} p B
  let R := (L.val.card : ℝ)*(B/n)
  have hH : 0 ≤ H := (cs N).horizon.coe_nonneg
  have hw : Measurable w := scheduledActiveLineMass_measurable cs ε M deadline start hn hB L p N hL hpL
  have hr : Measurable r := scheduledCutLineCreditRate_measurable cs ε M deadline start L hn s N
  have hwb : ∀ x, 0 ≤ w x ∧ w x ≤ A := scheduledActiveLineMass_bounds cs ε M deadline start hn hB L p N hL hpL
  have hrb : ∀ x, 0 ≤ r x ∧ r x ≤ R := scheduledCutLineCreditRate_bounds cs ε M deadline start L hn (zero_lt_one.trans_le hB) s N
  filter_upwards [phasePoint_scheduledCutLineCredit_one_sub_ae_path_time cs ε M deadline start L hn hB p N J] with ω hω
  let P := ∑ j ∈ Finset.range N, scheduledCutLineCreditIntegral cs ε M deadline start L hn s j (cs j).horizon ω
  have hA : 0 ≤ A := (hwb (ω,0)).1.trans (hwb (ω,0)).2
  have hR : 0 ≤ R := (hrb (ω,0)).1.trans (hrb (ω,0)).2
  have hwi : IntervalIntegrable (fun t => w (ω,t)) volume 0 H :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le hH).mpr
      (integrableOn_of_nonneg_bound volume (Ioo 0 H) measurableSet_Ioo _
        (hw.comp (measurable_const.prodMk measurable_id)) A (fun t _ => hwb (ω,t)))
  have hwri : IntervalIntegrable (fun t => w (ω,t)*boundedRunningPrefix H r (ω,t)) volume 0 H := by
    apply (intervalIntegrable_iff_integrableOn_Ioo_of_le hH).mpr
    apply integrableOn_of_nonneg_bound volume (Ioo 0 H) measurableSet_Ioo _
      ((hw.mul (boundedRunningPrefix_measurable H hH r hr)).comp
        (measurable_const.prodMk measurable_id)) (A*(H*R))
    intro t _
    have hb := boundedRunningPrefix_bounds H hH r hr R hrb (ω,t)
    exact ⟨mul_nonneg (hwb (ω,t)).1 hb.1,mul_le_mul (hwb (ω,t)).2 hb.2 hb.1 hA⟩
  calc
    _ = ∫ t in (0:ℝ)..H, (w (ω,t)*P+w (ω,t)*boundedRunningPrefix H r (ω,t)) := by
      apply intervalIntegral.integral_congr_ae
      filter_upwards [hω] with t ht htI
      have ht' : t ∈ Icc 0 H := by
        rw [uIoc_of_le hH] at htI
        exact ⟨htI.1.le,htI.2⟩
      change w (ω,t)*(1-scheduledCutLineCreditValue cs ε M deadline start L hn s N (ω,t)) = _
      rw [ht ht']
      change w (ω,t)*(P+scheduledCutLineCreditIntegral cs ε M deadline start L hn s N (max 0 t) ω) = _
      rw [max_eq_right ht'.1,boundedRunningPrefix_eq H r ω t ht']
      exact mul_add _ _ _
    _ = (∫ t in (0:ℝ)..H, w (ω,t)*P) +
        (∫ t in (0:ℝ)..H, w (ω,t)*boundedRunningPrefix H r (ω,t)) :=
      intervalIntegral.integral_add (hwi.mul_const P) hwri
    _ = (∫ t in (0:ℝ)..H, w (ω,t))*P + weightedTrianglePath H w r ω := by
      rw [intervalIntegral.integral_mul_const,weightedTrianglePath_eq_bounded H hH w r ω]
    _ = _ := by
      change (∫ t in (0:ℝ)..H, w (ω,t))*P + weightedTrianglePath H w r ω =
        (∑ j ∈ Finset.range N, (∫ t in (0:ℝ)..H, w (ω,t)*
          scheduledCutLineCreditIntegral cs ε M deadline start L hn s j (cs j).horizon ω)) +
            weightedTrianglePath H w r ω
      congr 1
      simp only [P,Finset.mul_sum,intervalIntegral.integral_mul_const]

theorem scheduledCreditLossMassPath_integral_eq {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N J : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val) :
    (∫ ω, scheduledCreditLossMassPath cs ε M deadline start hn hB L p N ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) =
    (∑ j ∈ Finset.range N, ∫ ω, scheduledCreditRectanglePath cs ε M deadline start hn hB L p j N ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) +
    ∫ ω, scheduledCreditTrianglePath cs ε M deadline start hn hB L p N ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hrect (j : ℕ) := scheduledCreditRectanglePath_integrable cs ε M deadline start hn hB L p j N hL hpL μ
  rw [integral_congr_ae (scheduledCreditLossMassPath_decomposition_ae cs ε M deadline start hn hB L p N J hL hpL),
    integral_add (integrable_finsetSum _ (fun j _ => hrect j))
      (scheduledCreditTrianglePath_integrable cs ε M deadline start hn hB L p N hL hpL μ),
    integral_finsetSum _ (fun j _ => hrect j)]

theorem scheduledCreditLossMassPath_sum_eq_double_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (J : ℕ)
    (hL : ∀ N, ¬specified (cs N).directions L) (hpL : p ∈ L.val) :
    ∀ᵐ ω ∂phasePointMeasure cs ε M deadline start hn hB p J,
      (∑ N ∈ Finset.range J, scheduledCreditLossMassPath cs ε M deadline start hn hB L p N ω) =
        scheduledCreditDoublePath cs ε M deadline start hn hB L p J ω := by
  have hh := ae_all_iff.mpr (fun N => scheduledCreditLossMassPath_decomposition_ae
    cs ε M deadline start hn hB L p N J (hL N) hpL)
  filter_upwards [hh] with ω hω
  exact Finset.sum_congr rfl (fun N _ => hω N)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutLineCreditValue_bounds
#print axioms NoThreeLine.BirthWitness.scheduledCreditLossMassPath_measurable
#print axioms NoThreeLine.BirthWitness.scheduledCreditLossMassPath_bounds
#print axioms NoThreeLine.BirthWitness.scheduledCreditLossMassPath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledCreditLossMassPath_decomposition_ae
#print axioms NoThreeLine.BirthWitness.scheduledCreditLossMassPath_integral_eq
#print axioms NoThreeLine.BirthWitness.scheduledCreditLossMassPath_sum_eq_double_ae
