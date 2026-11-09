import NoThreeLine.ScheduledCutExactLeafMoment
import NoThreeLine.ScheduledUnitPriceCap

/-! C11 one-witness moments on every actual non-specified board line,
including lines shorter than B. The source price is paid once. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments AuxiliaryODE PrimitiveLines

theorem lineLeafSites_mask_sum_bounds {n : ℕ} (mask : Grid n → ℝ)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (L : LineIndex n) (p z : Grid n) :
    0 ≤ (∑ q : lineLeafSites L p z, mask q.val) ∧
      (∑ q : lineLeafSites L p z, mask q.val) ≤ (L.val.card : ℝ) := by
  constructor
  · exact Finset.sum_nonneg (fun q _ => (hm q.val).1)
  · calc
      _ ≤ ∑ _q : lineLeafSites L p z, (1 : ℝ) := Finset.sum_le_sum (fun q _ => (hm q.val).2)
      _ = ((lineLeafSites L p z).card : ℝ) := by simp
      _ ≤ _ := by exact_mod_cast lineLeafSites_card_le L p z

theorem initial_scheduledCutPoint_selectedLine_first_bound {n : ℕ} {B : ℝ}
    (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val) (hzL : z ∈ L.val) (hpz : p ≠ z)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (N : ℕ) (t : ℝ) (ht : t ∈ Set.Icc (0 : ℝ) (cs N).horizon) :
    (∫ ω, selectedLineLeafPower mask L p z 1
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t) ≤
      (scheduledLeafUnitPrice cs start (unitBirthRetention n) N t z/(1-ε)^3) * (L.val.card : ℝ) := by
  have hh := initial_scheduledCutPoint_selectedLineLeafPower_repeat_bound mask hm L p z Γ hL hpL hzL hpz
    cs ε M deadline start hn hB hΓ hK hε0 hε 1 N t ht
  rw [physicalRepeatSum_one] at hh
  have hP : 0 ≤ scheduledLeafUnitPrice cs start (unitBirthRetention n) N t z/(1-ε)^3 :=
    div_nonneg (scheduledLeafUnitPrice_nonneg cs start _ N t ht.1 z) (pow_nonneg (sub_nonneg.mpr hε.le) _)
  exact hh.trans (mul_le_mul_of_nonneg_left (lineLeafSites_mask_sum_bounds mask hm L p z).2 hP)

theorem initial_scheduledCutPoint_selectedLine_second_bound {n : ℕ} {B : ℝ}
    (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val) (hzL : z ∈ L.val) (hpz : p ≠ z)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (N : ℕ) (t : ℝ) (ht : t ∈ Set.Icc (0 : ℝ) (cs N).horizon) :
    (∫ ω, selectedLineLeafPower mask L p z 2
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t) ≤
      (scheduledLeafUnitPrice cs start (unitBirthRetention n) N t z/(1-ε)^6) *
        ((L.val.card : ℝ)^2+B*(L.val.card : ℝ)) := by
  have hh := initial_scheduledCutPoint_selectedLineLeafPower_repeat_bound mask hm L p z Γ hL hpL hzL hpz
    cs ε M deadline start hn hB hΓ hK hε0 hε 2 N t ht
  have hP : 0 ≤ scheduledLeafUnitPrice cs start (unitBirthRetention n) N t z/(1-ε)^6 :=
    div_nonneg (scheduledLeafUnitPrice_nonneg cs start _ N t ht.1 z) (pow_nonneg (sub_nonneg.mpr hε.le) _)
  apply hh.trans
  apply mul_le_mul_of_nonneg_left _ hP
  apply (physicalRepeatSum_two_le (fun q : lineLeafSites L p z => mask q.val) (fun q => hm q.val) B hB).trans
  have hs := lineLeafSites_mask_sum_bounds mask hm L p z
  exact add_le_add (pow_le_pow_left₀ hs.1 hs.2 2)
    (mul_le_mul_of_nonneg_left hs.2 (zero_le_one.trans hB))

theorem scheduledLeafUnitPrice_unit_le_total {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (start : ℝ) (N J : ℕ) (hNJ : N < J) (t : ℝ) (ht : t ≤ (cs N).horizon) (z : Grid n) :
    scheduledLeafUnitPrice cs start (unitBirthRetention n) N t z ≤ phaseEndpoint cs 0 J/n := by
  simpa only [scheduledLeafUnitPrice,scheduled_unitBirth_price] using
    scheduled_unit_price_le_total cs J N hNJ z t ht

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_selectedLine_first_bound
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_selectedLine_second_bound
#print axioms NoThreeLine.BirthWitness.scheduledLeafUnitPrice_unit_le_total
