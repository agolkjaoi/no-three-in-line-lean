import NoThreeLine.ShortProxyStars
import NoThreeLine.ScheduledOutsideRiskPath
import NoThreeLine.ScheduledStarLatePath

/-! Exact long/short partition of the unchanged scheduled proxy, and
the short part bounded by the actual current-mask star path. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections ShortStars

def scheduledOutsideShortProxyPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (H : ℝ) (ω : BoardClockPath n) : ℝ :=
  ∑ L ∈ shortRootBoardLines Γ p H, ∑ N ∈ Finset.range J,
    scheduledOutsideLineProxyPath cs ε M deadline start hn hB L.val p N ω

def scheduledOutsideLongProxyPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (H : ℝ) (ω : BoardClockPath n) : ℝ :=
  ∑ L ∈ longRootBoardLines Γ p H, ∑ N ∈ Finset.range J,
    scheduledOutsideLineProxyPath cs ε M deadline start hn hB L.val p N ω

theorem scheduledOutsideProxyPath_partition {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (H : ℝ) (ω : BoardClockPath n) :
    scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω =
      scheduledOutsideShortProxyPath cs ε M deadline start hn hB Γ p J H ω +
      scheduledOutsideLongProxyPath cs ε M deadline start hn hB Γ p J H ω := by
  classical
  have h := short_long_rootLines_partition Γ p H
  unfold scheduledOutsideProxyPath scheduledOutsideShortProxyPath scheduledOutsideLongProxyPath
  rw [←h.2,Finset.sum_union h.1]

theorem scheduledOutsideShortProxyPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (H : ℝ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledOutsideShortProxyPath cs ε M deadline start hn hB Γ p J H) μ :=
  integrable_finsetSum _ (fun L _ => integrable_finsetSum _ (fun N _ =>
    scheduledOutsideLineProxyPath_integrable cs ε M deadline start hn hB L.val p N μ))

theorem scheduledOutsideLongProxyPath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (H : ℝ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledOutsideLongProxyPath cs ε M deadline start hn hB Γ p J H) μ :=
  integrable_finsetSum _ (fun L _ => integrable_finsetSum _ (fun N _ =>
    scheduledOutsideLineProxyPath_integrable cs ε M deadline start hn hB L.val p N μ))

theorem scheduledOutsideShortPhase_le_stars {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (N : ℕ)
    (H : ℝ) (ω : BoardClockPath n) :
    (∑ L ∈ shortRootBoardLines Γ p H,
      scheduledOutsideLineProxyPath cs ε M deadline start hn hB L.val p N ω) ≤
      scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N 0 (cs N).horizon ω / n := by
  classical
  let μ := volume.restrict (Ioo (0:ℝ) (cs N).horizon)
  have hi (L : RootBoardLineIndex p) : Integrable
      (fun t => scheduledOutsideLineProxyRate cs ε M deadline start hn hB L.val p N (ω,t)) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable μ _
      ((scheduledOutsideLineProxyRate_measurable cs ε M deadline start hn hB L.val p N).comp
        (measurable_const.prodMk measurable_id)) _ (fun t =>
      ⟨(scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L.val p N (ω,t)).1,
       (scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L.val p N (ω,t)).2.trans
        (scheduledOutsideLineRiskRate_bounds cs ε M deadline start hn hB L.val p N (ω,t)).2⟩)
  let f : ℝ → ℝ := fun t => weightedStarIntensity Γ p H (fun s => (cs N).mask s.val.1)
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t))
  have hf : Integrable f μ := GenericCreditIteration.bounded_nonnegative_integrable μ f
    (((weightedStarIntensity_measurable Γ p H _).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)).comp
        (measurable_const.prodMk measurable_id)) _ (fun t =>
      weightedStarIntensity_bounds Γ p H _
        (fun s => ⟨(cs N).mask_nonneg s.val.1,(cs N).mask_le_one s.val.1⟩) _ B
        (zero_le_one.trans hB) (scheduledCutWitness_valid cs ε M deadline start _ hn _ N (ω,t)))
  simp only [scheduledOutsideLineProxyPath,intervalIntegral.integral_of_le (cs N).horizon.coe_nonneg,
    integral_Ioc_eq_integral_Ioo]
  change (∑ L ∈ shortRootBoardLines Γ p H, ∫ t, _ ∂μ) ≤ (∫ t, f t ∂μ)/n
  rw [←integral_finsetSum _ (fun L _ => hi L),←integral_div]
  apply integral_mono (integrable_finsetSum _ (fun L _ => hi L)) (hf.div_const n)
  intro t
  exact physicalOutsideShortProxy_le_stars Γ p H (cs N).mask
    (fun q => ⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩) _ B (zero_le_one.trans hB)
    (scheduledCutWitness_valid cs ε M deadline start _ hn _ N (ω,t))

theorem scheduledOutsideShortProxyPath_le_stars {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (H : ℝ) (ω : BoardClockPath n) :
    scheduledOutsideShortProxyPath cs ε M deadline start hn hB Γ p J H ω ≤
      scheduledStarLatePath cs ε M deadline start hn hB Γ p H J
        (fun _ => 0) (fun N => (cs N).horizon) ω / n := by
  unfold scheduledOutsideShortProxyPath
  rw [Finset.sum_comm]
  calc
    _ ≤ ∑ N ∈ Finset.range J,
        scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N 0 (cs N).horizon ω / n :=
      Finset.sum_le_sum (fun N _ => scheduledOutsideShortPhase_le_stars cs ε M deadline start hn hB Γ p N H ω)
    _ = _ := by
      rw [←Finset.sum_div]
      congr 1
      exact Finset.sum_range _

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledOutsideProxyPath_partition
#print axioms NoThreeLine.BirthWitness.scheduledOutsideShortProxyPath_le_stars
