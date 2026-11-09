import NoThreeLine.ScheduledCutFutureTower
import NoThreeLine.ScheduledCutLineExcessIntegral

/-! The actual selected-witness line excess can be evaluated under the
full future terminal point law. The time integral uses the same cut path;
no separately restarted flow or independent future clock is substituted. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem scheduledCutLineExcess_terminal_mean_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1)
    (L : LineIndex n) (p z : Grid n) (N J : ℕ) (hNJ : N<J) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo 0 ((cs N).horizon : ℝ),
    (∫ω,selectedLineExcess mask L p z
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂phasePointMeasure cs ε M deadline start hn hB p J)=
        scheduledCutLineExcessMean cs ε M deadline start hn hB mask L p z N t := by
  let A := B*(L.val.card:ℝ)
  have hA : 0≤A := mul_nonneg (zero_le_one.trans hB) (Nat.cast_nonneg _)
  let F := fun (_t : ℝ) (v : TimedObservation (cs N).config)=>
    min (max (selectedLineExcess mask L p z (observedWitness (cs N).config (unitBirthRetention n) v)) 0) A
  have hF (t : ℝ) : Measurable (F t) :=
    (((selectedLineExcess_measurable mask L p z).comp
      (observedWitness_measurable (cs N).config (unitBirthRetention n))).max measurable_const).min measurable_const
  have hb (t : ℝ) (v : TimedObservation (cs N).config) : 0≤F t v ∧ F t v≤A :=
    ⟨le_min (le_max_right _ _) hA,min_le_right _ _⟩
  have hfactual (t : ℝ) (ω : BoardClockPath n) :
      F t (scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))=
      selectedLineExcess mask L p z (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t)) := by
    have hb := selectedLineExcess_bounds mask hm L p z _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
    exact (congrArg (fun x=>min x A) (max_eq_left hb.1)).trans (min_eq_left hb.2)
  have he := scheduledCut_future_point_integral_ae cs ε M deadline start hn hB N (J-(N+1)) p F hF A hb
  have hindex : N+1+(J-(N+1))=J := Nat.add_sub_of_le (Nat.succ_le_of_lt hNJ)
  simp only [hindex,hfactual] at he
  filter_upwards [he] with t ht htI
  rw [scheduledCutLineExcessMean_eq_point]
  exact ht htI

theorem scheduledCutLineExcess_terminal_integral {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1)
    (L : LineIndex n) (p z : Grid n) (N J : ℕ) (hNJ : N<J) :
    (∫ω,(∫t in (0:ℝ)..(cs N).horizon,selectedLineExcess mask L p z
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t)))
      ∂phasePointMeasure cs ε M deadline start hn hB p J)=
        scheduledCutLineExcessIntegral cs ε M deadline start hn hB mask L p z N := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  let f := fun x : BoardClockPath n×ℝ=>selectedLineExcess mask L p z
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N x)
  have hf : Measurable f := (selectedLineExcess_measurable mask L p z).comp
    (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)
  have hb (x : BoardClockPath n×ℝ) : 0≤f x ∧ f x≤B*(L.val.card:ℝ) :=
    selectedLineExcess_bounds mask hm L p z _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N x)
  change (∫ω,(∫t in (0:ℝ)..(cs N).horizon,f (ω,t)) ∂μ)=_
  rw [CalendarIntegral.expected_interval_integral_swap μ _ (cs N).horizon.coe_nonneg f hf _ hb]
  unfold scheduledCutLineExcessIntegral
  simp_rw [intervalIntegral.integral_of_le (cs N).horizon.coe_nonneg,integral_Ioc_eq_integral_Ioo]
  apply integral_congr_ae
  apply (ae_restrict_iff' measurableSet_Ioo).mpr
  exact scheduledCutLineExcess_terminal_mean_ae cs ε M deadline start hn hB mask hm L p z N J hNJ

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledCutLineExcess_terminal_mean_ae
#print axioms NoThreeLine.BirthWitness.scheduledCutLineExcess_terminal_integral
