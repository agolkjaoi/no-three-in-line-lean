import NoThreeLine.OutsideRiskRegularity
import NoThreeLine.ScheduledCutLineGuards
import NoThreeLine.ScheduledCreditLossDecomposition

/-! Supply the actual cut line-credit floor from the resolved-process
invariant, then integrate the exact outside-risk/proxy difference. No
probabilistic or pathwise credit floor is assumed by the comparison. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def scheduledOutsideLineRiskRate {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (x : BoardClockPath n × ℝ) : ℝ :=
  physicalOutsideLineRisk (cs N).mask p L
    (scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) N x).1.val.1.physical

def scheduledOutsideLineProxyRate {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (x : BoardClockPath n × ℝ) : ℝ :=
  physicalOutsideLineProxy (cs N).mask p L
    (scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) N x).1.val.1.physical

def scheduledOutsideLineRiskPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (ω : BoardClockPath n) : ℝ :=
  ∫ t in (0 : ℝ)..(cs N).horizon, scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N (ω,t)

def scheduledOutsideLineProxyPath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (ω : BoardClockPath n) : ℝ :=
  ∫ t in (0 : ℝ)..(cs N).horizon, scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N (ω,t)

theorem scheduledOutsideLineRiskRate_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ) :
    Measurable (scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N) :=
  (physicalOutsideLineRisk_measurable (cs N).mask p L).comp
    ((AugmentedState.measurable_physical n).comp
      (measurable_subtype_coe.comp (scheduledCutObservation_measurable cs ε M deadline start hn _ N).fst).fst)

theorem scheduledOutsideLineProxyRate_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ) :
    Measurable (scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N) :=
  (physicalOutsideLineProxy_measurable (cs N).mask p L).comp
    ((AugmentedState.measurable_physical n).comp
      (measurable_subtype_coe.comp (scheduledCutObservation_measurable cs ε M deadline start hn _ N).fst).fst)

theorem scheduledOutsideLineRiskRate_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (x : BoardClockPath n × ℝ) :
    0 ≤ scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N x ∧
      scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N x ≤ (L.val.card : ℝ)*(B/n) :=
  physicalOutsideLineRisk_bounds (cs N).mask (fun q => ⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩)
    p L _ B (zero_lt_one.trans_le hB)
    (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) N x).1.property.1.1

theorem scheduledOutsideLineProxyRate_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (x : BoardClockPath n × ℝ) :
    0 ≤ scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N x ∧
      scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N x ≤
        scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N x :=
  physicalOutsideLineProxy_bounds (cs N).mask (fun q => ⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩)
    p L _ B (zero_lt_one.trans_le hB)
    (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) N x).1.property.1.1

theorem scheduledOutsideLineRiskRate_proxy_error {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (L : LineIndex n) (hL : ¬specified Γ L)
    (p : Grid n) (hpL : p ∈ L.val) (N : ℕ) (x : BoardClockPath n × ℝ) :
    0 ≤ scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N x -
      scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N x ∧
    scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N x -
      scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N x ≤
      (1-scheduledCutLineCreditValue cs ε M deadline start L hn
        (initialGoodPhaseObservation B hB deadline start) N x) *
          scheduledActiveLineMass cs ε M deadline start hn hB L p N x / (ρ*n) := by
  let a := scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) N x
  have hg := initial_scheduledCutWitness_activeLineGuardBounds cs ε M deadline start 2 ρ
    (unitBirthRetention n) hn hB (by norm_num) Γ hΓ (fun j => (hK j).le) hρcfg N x
  exact physicalOutsideLineRisk_proxy_error (cs N).mask
    (fun q => ⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩) p L a B ρ
    (zero_le_one.trans hB) hρ (scheduledCutWitness_valid cs ε M deadline start _ hn _ N x)
    (fun hp hN => (hg p hp L hpL).2 hL hN)

private theorem bounded_time_integrable {Ω : Type*} [MeasurableSpace Ω]
    (H : ℝ) (hH : 0 ≤ H) (f : Ω × ℝ → ℝ) (hf : Measurable f) (C : ℝ)
    (hb : ∀ x, 0 ≤ f x ∧ f x ≤ C) (ω : Ω) :
    IntervalIntegrable (fun t => f (ω,t)) volume 0 H :=
  (intervalIntegrable_iff_integrableOn_Ioo_of_le hH).mpr
    (integrableOn_of_nonneg_bound volume (Ioo 0 H) measurableSet_Ioo _
      (hf.comp (measurable_const.prodMk measurable_id)) C (fun t _ => hb (ω,t)))

theorem scheduledOutsideLineRiskPath_proxy_error {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (L : LineIndex n) (hL : ¬specified Γ L)
    (p : Grid n) (hpL : p ∈ L.val) (N : ℕ) (ω : BoardClockPath n) :
    0 ≤ scheduledOutsideLineRiskPath cs ε M deadline start hn hB L p N ω -
      scheduledOutsideLineProxyPath cs ε M deadline start hn hB L p N ω ∧
    scheduledOutsideLineRiskPath cs ε M deadline start hn hB L p N ω -
      scheduledOutsideLineProxyPath cs ε M deadline start hn hB L p N ω ≤
        scheduledCreditLossMassPath cs ε M deadline start hn hB L p N ω / (ρ*n) := by
  let f := scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N
  let g := scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N
  let w := scheduledActiveLineMass cs ε M deadline start hn hB L p N
  let r := scheduledCutLineCreditValue cs ε M deadline start L hn (initialGoodPhaseObservation B hB deadline start) N
  have hLi : ¬specified (cs N).directions L := by simpa only [hΓ N] using hL
  have hfb := scheduledOutsideLineRiskRate_bounds cs ε M deadline start hn hB L p N
  have hgb (x : BoardClockPath n × ℝ) : 0 ≤ g x ∧ g x ≤ (L.val.card : ℝ)*(B/n) :=
    ⟨(scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L p N x).1,
      (scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L p N x).2.trans (hfb x).2⟩
  have hfi := bounded_time_integrable (cs N).horizon (cs N).horizon.coe_nonneg f
    (scheduledOutsideLineRiskRate_measurable cs ε M deadline start hn hB L p N) _ hfb ω
  have hgi := bounded_time_integrable (cs N).horizon (cs N).horizon.coe_nonneg g
    (scheduledOutsideLineProxyRate_measurable cs ε M deadline start hn hB L p N) _ hgb ω
  have hw := scheduledActiveLineMass_bounds cs ε M deadline start hn hB L p N hLi hpL
  have hr := scheduledCutLineCreditValue_bounds cs ε M deadline start L hn
    (initialGoodPhaseObservation B hB deadline start) N
  have hlb (x : BoardClockPath n × ℝ) : 0 ≤ w x*(1-r x) ∧
      w x*(1-r x) ≤ ∑ q ∈ L.val.erase p, rootLeafCap {p,q} p B :=
    ⟨mul_nonneg (hw x).1 (sub_nonneg.mpr (hr x).2),
      (mul_le_of_le_one_right (hw x).1 (sub_le_self 1 (hr x).1)).trans (hw x).2⟩
  have hli := bounded_time_integrable (cs N).horizon (cs N).horizon.coe_nonneg
    (fun x => w x*(1-r x))
    ((scheduledActiveLineMass_measurable cs ε M deadline start hn hB L p N hLi hpL).mul
      (measurable_const.sub (scheduledCutLineCreditValue_measurable cs ε M deadline start L hn _ N))) _ hlb ω
  have he : scheduledOutsideLineRiskPath cs ε M deadline start hn hB L p N ω -
      scheduledOutsideLineProxyPath cs ε M deadline start hn hB L p N ω =
      ∫ t in (0:ℝ)..(cs N).horizon, f (ω,t)-g (ω,t) :=
    (intervalIntegral.integral_sub hfi hgi).symm
  rw [he]
  have hcomp (t : ℝ) := scheduledOutsideLineRiskRate_proxy_error cs ε M deadline start ρ
    hn hB hρ Γ hΓ hK hρcfg L hL p hpL N (ω,t)
  refine ⟨intervalIntegral.integral_nonneg (cs N).horizon.coe_nonneg (fun t _ => (hcomp t).1),?_⟩
  calc
    _ ≤ ∫ t in (0:ℝ)..(cs N).horizon, w (ω,t)*(1-r (ω,t))/(ρ*n) := by
      apply intervalIntegral.integral_mono_on (cs N).horizon.coe_nonneg (hfi.sub hgi) (hli.div_const (ρ*n))
      intro t _
      simpa only [mul_comm] using (hcomp t).2
    _ = _ := by simp only [div_eq_mul_inv,intervalIntegral.integral_mul_const]; rfl

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledOutsideLineRiskRate_proxy_error
#print axioms NoThreeLine.BirthWitness.scheduledOutsideLineRiskPath_proxy_error
