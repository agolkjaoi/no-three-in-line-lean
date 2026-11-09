import NoThreeLine.ScheduledTerminalLineIntegral

/-! Sum all inherited phases under the single full-J terminal point law.
The deterministic mask may vary with the phase, and total elapsed time is
supplied by the actual phase endpoints. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def scheduledTerminalLineMomentTotal {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (L : LineIndex n)
    (p z : Grid n) (k J : ℕ) : ℝ :=
  ∑ N ∈ Finset.range J,
    scheduledTerminalLineMomentIntegral cs ε M deadline start hn hB (mask N) L p z k N J

theorem scheduledTerminalLineMomentTotal_low_bounds {n : ℕ} {B : ℝ}
    (mask : ℕ → Grid n → ℝ) (hm : ∀ N q, 0 ≤ mask N q ∧ mask N q ≤ 1)
    (L : LineIndex n) (p z : Grid n) (Γ : Finset ZPoint)
    (hL : ¬specified Γ L) (hpL : p ∈ L.val) (hzL : z ∈ L.val) (hpz : p ≠ z)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (J : ℕ) :
    (0 ≤ scheduledTerminalLineMomentTotal cs ε M deadline start hn hB mask L p z 1 J ∧
      scheduledTerminalLineMomentTotal cs ε M deadline start hn hB mask L p z 1 J ≤
        phaseEndpoint cs 0 J*((phaseEndpoint cs 0 J/n)/(1-ε)^3*(L.val.card : ℝ))) ∧
    (0 ≤ scheduledTerminalLineMomentTotal cs ε M deadline start hn hB mask L p z 2 J ∧
      scheduledTerminalLineMomentTotal cs ε M deadline start hn hB mask L p z 2 J ≤
        phaseEndpoint cs 0 J*((phaseEndpoint cs 0 J/n)/(1-ε)^6*((L.val.card : ℝ)^2+B*(L.val.card : ℝ)))) := by
  have hb (N : ℕ) (hN : N ∈ Finset.range J) :=
    scheduledTerminalLineMomentIntegral_low_bounds (mask N) (hm N) L p z Γ hL hpL hzL hpz
      cs ε M deadline start hn hB hΓ hK hε0 hε N J (Finset.mem_range.mp hN)
  constructor
  · constructor
    · exact Finset.sum_nonneg (fun N hN => (hb N hN).1.1)
    · calc
        _ ≤ ∑ N ∈ Finset.range J, (cs N).horizon*
            ((phaseEndpoint cs 0 J/n)/(1-ε)^3*(L.val.card : ℝ)) :=
          Finset.sum_le_sum (fun N hN => (hb N hN).1.2)
        _ = _ := by rw [←Finset.sum_mul]; simp only [phaseEndpoint, zero_add, NNReal.coe_sum]
  · constructor
    · exact Finset.sum_nonneg (fun N hN => (hb N hN).2.1)
    · calc
        _ ≤ ∑ N ∈ Finset.range J, (cs N).horizon*
            ((phaseEndpoint cs 0 J/n)/(1-ε)^6*((L.val.card : ℝ)^2+B*(L.val.card : ℝ))) :=
          Finset.sum_le_sum (fun N hN => (hb N hN).2.2)
        _ = _ := by rw [←Finset.sum_mul]; simp only [phaseEndpoint, zero_add, NNReal.coe_sum]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledTerminalLineMomentTotal_low_bounds
