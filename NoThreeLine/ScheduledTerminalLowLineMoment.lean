import NoThreeLine.ScheduledCutLowLineMoment
import NoThreeLine.ScheduledCutLeafPowerTower

/-! One-witness first and second physical line moments under the actual
full-J terminal point law. Every non-specified line is allowed, even L<B. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem scheduledTerminal_selectedLine_low_bounds_ae {n : ℕ} {B : ℝ}
    (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val) (hzL : z ∈ L.val) (hpz : p ≠ z)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (N J : ℕ) (hNJ : N < J) :
    ∀ᵐ t : ℝ ∂volume, ∀ ht : t ∈ Ioo 0 ((cs N).horizon : ℝ),
    (∫ ω, selectedLineLeafPower mask L p z 1
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      (phaseEndpoint cs 0 J/n)/(1-ε)^3 * (L.val.card : ℝ) ∧
    (∫ ω, selectedLineLeafPower mask L p z 2
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      (phaseEndpoint cs 0 J/n)/(1-ε)^6 * ((L.val.card : ℝ)^2+B*(L.val.card : ℝ)) := by
  have h1 := scheduledCutLineLeafPower_terminal_mean_ae cs ε M deadline start hn hB mask hm L p z 1 N J hNJ
  have h2 := scheduledCutLineLeafPower_terminal_mean_ae cs ε M deadline start hn hB mask hm L p z 2 N J hNJ
  filter_upwards [h1,h2] with t ht1 ht2 ht
  have ht' : t ∈ Icc (0 : ℝ) (cs N).horizon := ⟨ht.1.le,ht.2.le⟩
  have hprice := scheduledLeafUnitPrice_unit_le_total cs start N J hNJ t ht.2.le z
  constructor
  · rw [ht1 ht]
    apply (initial_scheduledCutPoint_selectedLine_first_bound mask hm L p z Γ hL hpL hzL hpz
      cs ε M deadline start hn hB hΓ hK hε0 hε N t ht').trans
    exact mul_le_mul_of_nonneg_right
      (div_le_div_of_nonneg_right hprice (pow_nonneg (sub_nonneg.mpr hε.le) 3)) (Nat.cast_nonneg _)
  · rw [ht2 ht]
    apply (initial_scheduledCutPoint_selectedLine_second_bound mask hm L p z Γ hL hpL hzL hpz
      cs ε M deadline start hn hB hΓ hK hε0 hε N t ht').trans
    exact mul_le_mul_of_nonneg_right
      (div_le_div_of_nonneg_right hprice (pow_nonneg (sub_nonneg.mpr hε.le) 6))
      (add_nonneg (sq_nonneg _) (mul_nonneg (zero_le_one.trans hB) (Nat.cast_nonneg _)))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledTerminal_selectedLine_low_bounds_ae
