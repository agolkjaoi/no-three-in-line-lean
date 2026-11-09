import NoThreeLine.ScheduledTerminalLowLineMoment
import NoThreeLine.CalendarMeanBound

/-! Expected time integrals of actual selected-witness line moments under
the full-J point law. The same cut path and all active-root gates are kept. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def scheduledTerminalLineMomentIntegral {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : Grid n → ℝ) (L : LineIndex n)
    (p z : Grid n) (k N J : ℕ) : ℝ :=
  ∫ ω, (∫ t in (0 : ℝ)..(cs N).horizon, selectedLineLeafPower mask L p z k
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t)))
    ∂phasePointMeasure cs ε M deadline start hn hB p J

theorem scheduledTerminalLineMomentIntegral_low_bounds {n : ℕ} {B : ℝ}
    (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val) (hzL : z ∈ L.val) (hpz : p ≠ z)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (N J : ℕ) (hNJ : N < J) :
    (0 ≤ scheduledTerminalLineMomentIntegral cs ε M deadline start hn hB mask L p z 1 N J ∧
      scheduledTerminalLineMomentIntegral cs ε M deadline start hn hB mask L p z 1 N J ≤
        (cs N).horizon*((phaseEndpoint cs 0 J/n)/(1-ε)^3*(L.val.card : ℝ))) ∧
    (0 ≤ scheduledTerminalLineMomentIntegral cs ε M deadline start hn hB mask L p z 2 N J ∧
      scheduledTerminalLineMomentIntegral cs ε M deadline start hn hB mask L p z 2 N J ≤
        (cs N).horizon*((phaseEndpoint cs 0 J/n)/(1-ε)^6*((L.val.card : ℝ)^2+B*(L.val.card : ℝ)))) := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  let f := fun (k : ℕ) (x : BoardClockPath n × ℝ) => selectedLineLeafPower mask L p z k
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N x)
  have hf (k : ℕ) : Measurable (f k) := (selectedLineLeafPower_measurable mask L p z k).comp
    (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)
  have hb (k : ℕ) (x : BoardClockPath n × ℝ) :
      0 ≤ f k x ∧ f k x ≤ (B*(L.val.card : ℝ))^k :=
    selectedLineLeafPower_bounds mask hm L p z k _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N x)
  have ha := scheduledTerminal_selectedLine_low_bounds_ae mask hm L p z Γ hL hpL hzL hpz
    cs ε M deadline start hn hB hΓ hK hε0 hε N J hNJ
  constructor
  · exact CalendarIntegral.expected_interval_integral_bounds_ae μ (cs N).horizon
      (cs N).horizon.coe_nonneg (f 1) (hf 1) _ (hb 1) _
      (ha.mono (fun t h ht => (h ht).1))
  · exact CalendarIntegral.expected_interval_integral_bounds_ae μ (cs N).horizon
      (cs N).horizon.coe_nonneg (f 2) (hf 2) _ (hb 2) _
      (ha.mono (fun t h ht => (h ht).2))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledTerminalLineMomentIntegral_low_bounds
