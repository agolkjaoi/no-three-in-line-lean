import NoThreeLine.ScheduledCutLineBirthMoment
import NoThreeLine.SelectedLineRegularity
import NoThreeLine.LongLineOvershootIntegral

/-! The actual scheduled-cut one-birth source price and physical line moment
are supplied to the weighted positive-excess estimate. The active-root gate
and the birth indicator are retained; this is a cut point-law assertion. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

theorem initial_scheduledCutPoint_line_overshoot_bound {n : ℕ} {B : ℝ}
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p∈L.val) (hzL : z∈L.val) (hpz : p≠z)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k N : ℕ) (t : ℝ) (ht : t∈Set.Icc (0:ℝ) (cs N).horizon)
    (hBL : B≤(L.val.card:ℝ)) (δ : ℝ) (hδ : 0<δ) :
    (∫ω,selectedLineGate p z
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))*
      max (boardLineMass mask L p
        (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
          (initialGoodPhaseObservation B hB deadline start) N (ω,t))-
        ∑q∈lineLeafSites L p z,mask q) 0
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t)≤
      ((((∑j∈Finset.range N,(cs j).horizon*(cs j).mask z)+t*(cs N).mask z)/n)/
        (1-ε)^(k+3).choose 2)*
      (δ*(L.val.card:ℝ)+(L.val.card:ℝ)/(1+δ)^k+
        physicalRepeatErrorConstant (k+1)*B/δ^k) := by
  let W := fun ω=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) N (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p N t
  let f := fun ω=>selectedLineGate p z (W ω)
  let H := fun ω=>boardLineMass mask L p (W ω)
  let D := ∑q∈lineLeafSites L p z,mask q
  let P₀ := ((∑j∈Finset.range N,(cs j).horizon*(cs j).mask z)+t*(cs N).mask z)/n
  let P := P₀/(1-ε)^(k+3).choose 2
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p N t
  have hW : Measurable W :=
    (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N).comp (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B :=
    scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t)
  have hB0 : 0≤B := zero_le_one.trans hB
  have hP₀ : 0≤P₀ := by
    have hh := scheduledLeafUnitPrice_nonneg cs start (unitBirthRetention n) N t ht.1 z
    simpa only [scheduledLeafUnitPrice,scheduled_unitBirth_price] using hh
  have hP : 0≤P := div_nonneg hP₀ (pow_nonneg (sub_nonneg.mpr hε.le) _)
  have hD : 0≤D := Finset.sum_nonneg (fun q _=>(hm q).1)
  have hDL : D≤(L.val.card:ℝ) := by
    calc
      D ≤ ((lineLeafSites L p z).card:ℝ) := by
        simpa using
          (Finset.sum_le_sum (s:=lineLeafSites L p z) (fun q _=>(hm q).2))
      _ ≤ _ := by exact_mod_cast lineLeafSites_card_le L p z
  have hLpos : 0<(L.val.card:ℝ) := (lt_of_lt_of_le zero_lt_one hB).trans_le hBL
  have hprice0 : (∫ω,f ω ∂ν)≤P₀/(1-ε)^(0+2).choose 2 := by
    have hh := initial_scheduledCutPoint_selectedLineLeafPower_bound mask hm L p z Γ hL hpL hzL hpz
      cs ε M deadline start hn hB hΓ hK hε0 hε 0 N t ht hBL
    simpa only [selectedLineLeafPower_eq_gate_mul,pow_zero,mul_one,physicalRepeatErrorConstant,
      Nat.cast_zero,zero_pow (by norm_num : 2≠0),zero_mul,mul_zero,add_zero] using hh
  have hprice : (∫ω,f ω ∂ν)≤P := hprice0.trans
    (div_le_div_of_nonneg_left hP₀ (pow_pos (sub_pos.mpr hε) _)
      (pow_le_pow_of_le_one (sub_nonneg.mpr hε.le) (by linarith)
        (Nat.choose_le_choose 2 (by omega : 0+2≤k+3))))
  have hmoment : (∫ω,f ω*(H ω)^(k+1) ∂ν)≤
      P*(D^(k+1)+physicalRepeatErrorConstant (k+1)*B*(L.val.card:ℝ)^k) := by
    have hh := initial_scheduledCutPoint_selectedLineLeafPower_bound mask hm L p z Γ hL hpL hzL hpz
      cs ε M deadline start hn hB hΓ hK hε0 hε (k+1) N t ht hBL
    simpa only [selectedLineLeafPower_eq_gate_mul,Nat.add_sub_cancel,Nat.add_assoc] using hh
  exact weighted_positive_excess_from_moment ν f H (B*(L.val.card:ℝ)) D (L.val.card:ℝ)
    δ B (physicalRepeatErrorConstant (k+1)) P k
    ((selectedLineGate_measurable p z).comp hW) ((boardLineMass_measurable mask L p).comp hW)
    (fun ω=>selectedLineGate_bounds p z (W ω))
    (fun ω=>boardLineMass_bounds mask hm L p (W ω) B hB0 (hv ω))
    (mul_nonneg hB0 (Nat.cast_nonneg _)) hD hLpos hDL hδ hB0
    (by unfold physicalRepeatErrorConstant; positivity) hP hprice hmoment

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_line_overshoot_bound
