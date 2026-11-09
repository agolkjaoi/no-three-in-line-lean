import NoThreeLine.ScheduledRiskProxyComparison
import NoThreeLine.ScheduledRootCreditLoss

/-! The original finite schedule's outside hazard and r-weighted proxy,
stopped at the actual root boundary by their active-root gates. Their
pathwise difference is bounded by the actual root credit-loss path/rho. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def scheduledOutsideRiskPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑ L ∈ nonSpecifiedRootBoardLines Γ p, ∑ N ∈ Finset.range J,
    scheduledOutsideLineRiskPath cs ε M deadline start hn hB L.val p N ω

def scheduledOutsideProxyPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑ L ∈ nonSpecifiedRootBoardLines Γ p, ∑ N ∈ Finset.range J,
    scheduledOutsideLineProxyPath cs ε M deadline start hn hB L.val p N ω

private theorem bounded_time_path_integrable {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (H : ℝ) (hH : 0 ≤ H)
    (f : Ω × ℝ → ℝ) (hf : Measurable f) (C : ℝ) (hb : ∀ x, 0 ≤ f x ∧ f x ≤ C) :
    Integrable (fun ω => ∫ t in (0:ℝ)..H, f (ω,t)) μ := by
  apply GenericCreditIteration.bounded_nonnegative_integrable μ _
    (variable_running_integral_measurable (fun _ => H) measurable_const (fun _ => hH) f hf) (H*C)
  intro ω
  exact integral_initial_segment_bounds H H hH le_rfl _
    (hf.comp (measurable_const.prodMk measurable_id)) C ((hb (ω,0)).1.trans (hb (ω,0)).2)
    (fun t _ => hb (ω,t))

theorem scheduledOutsideLineRiskPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledOutsideLineRiskPath cs ε M deadline start hn hB L p N) μ :=
  bounded_time_path_integrable μ (cs N).horizon (cs N).horizon.coe_nonneg _
    (scheduledOutsideLineRiskRate_measurable cs ε M deadline start hn hB L p N) _
    (scheduledOutsideLineRiskRate_bounds cs ε M deadline start hn hB L p N)

theorem scheduledOutsideLineProxyPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledOutsideLineProxyPath cs ε M deadline start hn hB L p N) μ :=
  bounded_time_path_integrable μ (cs N).horizon (cs N).horizon.coe_nonneg _
    (scheduledOutsideLineProxyRate_measurable cs ε M deadline start hn hB L p N) _
    (fun x => ⟨(scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L p N x).1,
      (scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L p N x).2.trans
        (scheduledOutsideLineRiskRate_bounds cs ε M deadline start hn hB L p N x).2⟩)

theorem scheduledOutsideRiskPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J) μ :=
  integrable_finsetSum _ (fun L _ => integrable_finsetSum _ (fun N _ =>
    scheduledOutsideLineRiskPath_integrable cs ε M deadline start hn hB L.val p N μ))

theorem scheduledOutsideProxyPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J) μ :=
  integrable_finsetSum _ (fun L _ => integrable_finsetSum _ (fun N _ =>
    scheduledOutsideLineProxyPath_integrable cs ε M deadline start hn hB L.val p N μ))

theorem scheduledOutsideRiskPath_eq_S1 {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) :
    scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω =
      ∑ N ∈ Finset.range J, ∫ t in (0:ℝ)..(cs N).horizon,
        let s := (scheduledCutObservation cs ε M deadline start hn
          (initialGoodPhaseObservation B hB deadline start) N (ω,t)).1.val.1.physical.process
        if p ∈ s.activeEvents then LineDrift.outsideHazard Γ s.selected p s.activeEvents (s.birthRate (cs N).mask) else 0 := by
  classical
  unfold scheduledOutsideRiskPath
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro N _
  have hi (L : RootBoardLineIndex p) : IntervalIntegrable
      (fun t => scheduledOutsideLineRiskRate cs ε M deadline start hn hB L.val p N (ω,t))
      volume 0 (cs N).horizon :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le (cs N).horizon.coe_nonneg).mpr
      (integrableOn_of_nonneg_bound volume _ measurableSet_Ioo _
        ((scheduledOutsideLineRiskRate_measurable cs ε M deadline start hn hB L.val p N).comp
          (measurable_const.prodMk measurable_id)) _
        (fun t _ => scheduledOutsideLineRiskRate_bounds cs ε M deadline start hn hB L.val p N (ω,t)))
  simp only [scheduledOutsideLineRiskPath]
  rw [←intervalIntegral.integral_finsetSum (fun L _ => hi L)]
  apply intervalIntegral.integral_congr
  intro t _
  exact physicalOutsideRisk_eq_S1 Γ (cs N).mask p _
    (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) N (ω,t)).1.property.1.1.1

theorem scheduledOutsideRiskPath_proxy_error {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) :
    0 ≤ scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω ∧
    scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω ≤
        scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω / ρ := by
  have he : scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω =
      ∑ L ∈ nonSpecifiedRootBoardLines Γ p, ∑ N ∈ Finset.range J,
        (scheduledOutsideLineRiskPath cs ε M deadline start hn hB L.val p N ω -
          scheduledOutsideLineProxyPath cs ε M deadline start hn hB L.val p N ω) := by
    simp only [scheduledOutsideRiskPath,scheduledOutsideProxyPath,Finset.sum_sub_distrib]
  rw [he]
  have hb (L : RootBoardLineIndex p) (hL : L ∈ nonSpecifiedRootBoardLines Γ p) (N : ℕ) :=
    scheduledOutsideLineRiskPath_proxy_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg
      L.val (Finset.mem_filter.mp hL).2 p L.property N ω
  refine ⟨Finset.sum_nonneg (fun L hL => Finset.sum_nonneg (fun N _ => (hb L hL N).1)),?_⟩
  calc
    _ ≤ ∑ L ∈ nonSpecifiedRootBoardLines Γ p, ∑ N ∈ Finset.range J,
        scheduledCreditLossMassPath cs ε M deadline start hn hB L.val p N ω / (ρ*n) :=
      Finset.sum_le_sum (fun L hL => Finset.sum_le_sum (fun N _ => (hb L hL N).2))
    _ = _ := by simp only [←Finset.sum_div,scheduledRootCreditLossPath,div_div,mul_comm]

theorem scheduledOutsideRiskPath_proxy_integral_error {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (p : Grid n) (J : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    0 ≤ (∫ ω, scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω ∂μ) ∧
    (∫ ω, scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω ∂μ) ≤
        (∫ ω, scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω ∂μ) / ρ := by
  have hb := scheduledOutsideRiskPath_proxy_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p J
  refine ⟨integral_nonneg (fun ω => (hb ω).1),?_⟩
  calc
    _ ≤ ∫ ω, scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω / ρ ∂μ :=
      integral_mono ((scheduledOutsideRiskPath_integrable cs ε M deadline start hn hB Γ p J μ).sub
        (scheduledOutsideProxyPath_integrable cs ε M deadline start hn hB Γ p J μ))
        ((scheduledRootCreditLossPath_integrable cs ε M deadline start hn hB Γ hΓ p J μ).div_const ρ)
        (fun ω => (hb ω).2)
    _ = _ := integral_div ρ _

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledOutsideProxyPath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPath_eq_S1
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPath_proxy_error
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPath_proxy_integral_error
