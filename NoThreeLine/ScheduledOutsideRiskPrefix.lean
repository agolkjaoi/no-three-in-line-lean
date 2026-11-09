import NoThreeLine.ScheduledOutsideRiskPath
import NoThreeLine.ScheduledCreditLossPrefix

/-! Actual risk/proxy time prefixes on the unchanged scheduled cut path.
The integral upper limit is the only truncation; no FlowConfig, deadline,
activation or stopped gate is altered. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def scheduledOutsideLineRiskPrefix {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ) (t : ℝ)
    (ω : BoardClockPath n) : ℝ :=
  ∫ u in (0:ℝ)..t, scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N (ω,u)

def scheduledOutsideLineProxyPrefix {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ) (t : ℝ)
    (ω : BoardClockPath n) : ℝ :=
  ∫ u in (0:ℝ)..t, scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N (ω,u)

def scheduledOutsideRiskPrefix {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (N : ℕ) (t : ℝ)
    (ω : BoardClockPath n) : ℝ :=
  ∑ L ∈ nonSpecifiedRootBoardLines Γ p,
    ((∑ j ∈ Finset.range N, scheduledOutsideLineRiskPath cs ε M deadline start hn hB L.val p j ω)+
      scheduledOutsideLineRiskPrefix cs ε M deadline start hn hB L.val p N t ω)

def scheduledOutsideProxyPrefix {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (N : ℕ) (t : ℝ)
    (ω : BoardClockPath n) : ℝ :=
  ∑ L ∈ nonSpecifiedRootBoardLines Γ p,
    ((∑ j ∈ Finset.range N, scheduledOutsideLineProxyPath cs ε M deadline start hn hB L.val p j ω)+
      scheduledOutsideLineProxyPrefix cs ε M deadline start hn hB L.val p N t ω)

private theorem bounded_time_integrable {Ω : Type*} [MeasurableSpace Ω]
    (t : ℝ) (ht : 0 ≤ t) (f : Ω × ℝ → ℝ) (hf : Measurable f) (C : ℝ)
    (hb : ∀ x, 0 ≤ f x ∧ f x ≤ C) (ω : Ω) :
    IntervalIntegrable (fun u => f (ω,u)) volume 0 t :=
  (intervalIntegrable_iff_integrableOn_Ioo_of_le ht).mpr
    (integrableOn_of_nonneg_bound volume _ measurableSet_Ioo _
      (hf.comp (measurable_const.prodMk measurable_id)) C (fun u _ => hb (ω,u)))

private theorem risk_time_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (t : ℝ) (ht : 0 ≤ t) (ω : BoardClockPath n) :
    IntervalIntegrable (fun u => scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N (ω,u)) volume 0 t ∧
    IntervalIntegrable (fun u => scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N (ω,u)) volume 0 t := by
  refine ⟨bounded_time_integrable t ht _
    (scheduledOutsideLineRiskRate_measurable cs ε M deadline start hn hB L p N) _
    (scheduledOutsideLineRiskRate_bounds cs ε M deadline start hn hB L p N) ω,?_⟩
  exact bounded_time_integrable t ht _ (scheduledOutsideLineProxyRate_measurable cs ε M deadline start hn hB L p N) _
    (fun x => ⟨(scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L p N x).1,
      (scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L p N x).2.trans
        (scheduledOutsideLineRiskRate_bounds cs ε M deadline start hn hB L p N x).2⟩) ω

theorem scheduledOutsideLineErrorPrefix_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (t : ℝ) (ht : t ∈ Icc (0:ℝ) (cs N).horizon) (ω : BoardClockPath n) :
    0 ≤ scheduledOutsideLineRiskPrefix cs ε M deadline start hn hB L p N t ω -
      scheduledOutsideLineProxyPrefix cs ε M deadline start hn hB L p N t ω ∧
    scheduledOutsideLineRiskPrefix cs ε M deadline start hn hB L p N t ω -
      scheduledOutsideLineProxyPrefix cs ε M deadline start hn hB L p N t ω ≤
      scheduledOutsideLineRiskPath cs ε M deadline start hn hB L p N ω -
        scheduledOutsideLineProxyPath cs ε M deadline start hn hB L p N ω := by
  have hit := risk_time_integrable cs ε M deadline start hn hB L p N t ht.1 ω
  have hiH := risk_time_integrable cs ε M deadline start hn hB L p N (cs N).horizon (cs N).horizon.coe_nonneg ω
  have hpos (u : ℝ) := sub_nonneg.mpr (scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L p N (ω,u)).2
  change 0 ≤ (∫u in (0:ℝ)..t, _) - (∫u in (0:ℝ)..t, _) ∧
    (∫u in (0:ℝ)..t, _) - (∫u in (0:ℝ)..t, _) ≤
      (∫u in (0:ℝ)..(cs N).horizon, _) - (∫u in (0:ℝ)..(cs N).horizon, _)
  rw [←intervalIntegral.integral_sub hit.1 hit.2,←intervalIntegral.integral_sub hiH.1 hiH.2]
  exact ⟨intervalIntegral.integral_nonneg ht.1 (fun u _ => hpos u),
    intervalIntegral.integral_mono_interval le_rfl ht.1 ht.2 (Filter.Eventually.of_forall hpos) (hiH.1.sub hiH.2)⟩

theorem scheduledOutsideLineRiskPrefix_proxy_error {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (L : LineIndex n) (hL : ¬specified Γ L)
    (p : Grid n) (hpL : p ∈ L.val) (N : ℕ) (t : ℝ) (ht : t ∈ Icc (0:ℝ) (cs N).horizon)
    (ω : BoardClockPath n) :
    scheduledOutsideLineRiskPrefix cs ε M deadline start hn hB L p N t ω -
      scheduledOutsideLineProxyPrefix cs ε M deadline start hn hB L p N t ω ≤
      scheduledCreditLossPrefix cs ε M deadline start hn hB L p N t ω / (ρ*n) := by
  have hi := risk_time_integrable cs ε M deadline start hn hB L p N t ht.1 ω
  have hLi : ¬specified (cs N).directions L := by simpa only [hΓ N] using hL
  have hli := bounded_time_integrable t ht.1 _
    (scheduledCreditLossIntegrand_measurable cs ε M deadline start hn hB L p N hLi hpL) _
    (scheduledCreditLossIntegrand_bounds cs ε M deadline start hn hB L p N hLi hpL) ω
  change (∫u in (0:ℝ)..t, _) - (∫u in (0:ℝ)..t, _) ≤ _
  rw [←intervalIntegral.integral_sub hi.1 hi.2]
  calc
    _ ≤ ∫u in (0:ℝ)..t, scheduledCreditLossIntegrand cs ε M deadline start hn hB L p N (ω,u)/(ρ*n) := by
      apply intervalIntegral.integral_mono_on ht.1 (hi.1.sub hi.2) (hli.div_const (ρ*n))
      intro u _
      have hh := (scheduledOutsideLineRiskRate_proxy_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg L hL p hpL N (ω,u)).2
      simpa only [scheduledCreditLossIntegrand,mul_comm] using hh
    _ = _ := by simp only [div_eq_mul_inv,intervalIntegral.integral_mul_const]; rfl

theorem scheduledOutsideRiskPrefix_proxy_error {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start ρ : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hρ : 0 < ρ) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hρcfg : ∀ j, ρ ≤ (cs j).rho) (p : Grid n) (N : ℕ) (t : ℝ)
    (ht : t ∈ Icc (0:ℝ) (cs N).horizon) (ω : BoardClockPath n) :
    0 ≤ scheduledOutsideRiskPrefix cs ε M deadline start hn hB Γ p N t ω -
      scheduledOutsideProxyPrefix cs ε M deadline start hn hB Γ p N t ω ∧
    scheduledOutsideRiskPrefix cs ε M deadline start hn hB Γ p N t ω -
      scheduledOutsideProxyPrefix cs ε M deadline start hn hB Γ p N t ω ≤
      scheduledRootCreditLossPrefix cs ε M deadline start hn hB Γ p N t ω / ρ := by
  have he : scheduledOutsideRiskPrefix cs ε M deadline start hn hB Γ p N t ω -
      scheduledOutsideProxyPrefix cs ε M deadline start hn hB Γ p N t ω =
      ∑ L ∈ nonSpecifiedRootBoardLines Γ p,
        ((∑ j ∈ Finset.range N, (scheduledOutsideLineRiskPath cs ε M deadline start hn hB L.val p j ω -
          scheduledOutsideLineProxyPath cs ε M deadline start hn hB L.val p j ω)) +
          (scheduledOutsideLineRiskPrefix cs ε M deadline start hn hB L.val p N t ω -
            scheduledOutsideLineProxyPrefix cs ε M deadline start hn hB L.val p N t ω)) := by
    simp only [scheduledOutsideRiskPrefix,scheduledOutsideProxyPrefix,Finset.sum_sub_distrib,Finset.sum_add_distrib]
    ring
  rw [he]
  have hprev (L : RootBoardLineIndex p) (hL : L ∈ nonSpecifiedRootBoardLines Γ p) (j : ℕ) :=
    scheduledOutsideLineRiskPath_proxy_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg L.val
      (Finset.mem_filter.mp hL).2 p L.property j ω
  refine ⟨Finset.sum_nonneg (fun L hL => add_nonneg
    (Finset.sum_nonneg (fun j _ => (hprev L hL j).1))
    (scheduledOutsideLineErrorPrefix_bounds cs ε M deadline start hn hB L.val p N t ht ω).1),?_⟩
  calc
    _ ≤ ∑ L ∈ nonSpecifiedRootBoardLines Γ p,
        ((∑ j ∈ Finset.range N, scheduledCreditLossMassPath cs ε M deadline start hn hB L.val p j ω/(ρ*n))+
          scheduledCreditLossPrefix cs ε M deadline start hn hB L.val p N t ω/(ρ*n)) :=
      Finset.sum_le_sum (fun L hL => add_le_add
        (Finset.sum_le_sum (fun j _ => (hprev L hL j).2))
        (scheduledOutsideLineRiskPrefix_proxy_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg
          L.val (Finset.mem_filter.mp hL).2 p L.property N t ht ω))
    _ = _ := by simp only [←Finset.sum_div,←add_div,scheduledRootCreditLossPrefix,div_div,mul_comm]

theorem scheduledOutsideErrorPrefix_le_full {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (N J : ℕ) (hNJ : N < J)
    (t : ℝ) (ht : t ∈ Icc (0:ℝ) (cs N).horizon) (ω : BoardClockPath n) :
    scheduledOutsideRiskPrefix cs ε M deadline start hn hB Γ p N t ω -
      scheduledOutsideProxyPrefix cs ε M deadline start hn hB Γ p N t ω ≤
      scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω -
        scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω := by
  let d := fun L : RootBoardLineIndex p => fun j =>
    scheduledOutsideLineRiskPath cs ε M deadline start hn hB L.val p j ω -
      scheduledOutsideLineProxyPath cs ε M deadline start hn hB L.val p j ω
  have hd (L : RootBoardLineIndex p) (j : ℕ) : 0 ≤ d L j :=
    (scheduledOutsideLineErrorPrefix_bounds cs ε M deadline start hn hB L.val p j (cs j).horizon
      ⟨(cs j).horizon.coe_nonneg,le_rfl⟩ ω).1
  have he : (∑ L ∈ nonSpecifiedRootBoardLines Γ p,
      ((∑ j ∈ Finset.range N, d L j)+
      (scheduledOutsideLineRiskPrefix cs ε M deadline start hn hB L.val p N t ω -
        scheduledOutsideLineProxyPrefix cs ε M deadline start hn hB L.val p N t ω))) ≤
      ∑ L ∈ nonSpecifiedRootBoardLines Γ p, ∑ j ∈ Finset.range J, d L j := by
    apply Finset.sum_le_sum
    intro L _
    calc
      _ ≤ (∑ j ∈ Finset.range N, d L j)+d L N := add_le_add le_rfl
        (scheduledOutsideLineErrorPrefix_bounds cs ε M deadline start hn hB L.val p N t ht ω).2
      _ = ∑ j ∈ Finset.range (N+1), d L j := (Finset.sum_range_succ _ N).symm
      _ ≤ _ := Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono (Nat.succ_le_of_lt hNJ))
        (fun j _ _ => hd L j)
  simpa only [d,scheduledOutsideRiskPrefix,scheduledOutsideProxyPrefix,scheduledOutsideRiskPath,
    scheduledOutsideProxyPath,Finset.sum_sub_distrib,Finset.sum_add_distrib,add_sub_add_comm] using he

theorem scheduledOutsidePrefixes_horizon {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint) (p : Grid n) (N : ℕ) (ω : BoardClockPath n) :
    scheduledOutsideRiskPrefix cs ε M deadline start hn hB Γ p N (cs N).horizon ω =
      scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p (N+1) ω ∧
    scheduledOutsideProxyPrefix cs ε M deadline start hn hB Γ p N (cs N).horizon ω =
      scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p (N+1) ω := by
  constructor <;> simp only [scheduledOutsideRiskPrefix,scheduledOutsideProxyPrefix,scheduledOutsideRiskPath,
    scheduledOutsideProxyPath,Finset.sum_range_succ]
  all_goals rfl

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledOutsideLineErrorPrefix_bounds
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPrefix_proxy_error
#print axioms NoThreeLine.BirthWitness.scheduledOutsideErrorPrefix_le_full
#print axioms NoThreeLine.BirthWitness.scheduledOutsidePrefixes_horizon
