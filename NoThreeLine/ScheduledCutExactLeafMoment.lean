import NoThreeLine.PhysicalLeafMomentAssembly
import NoThreeLine.ScheduledCutLineBirthMoment

/-! Actual scheduled-cut moments with the exact physical repetition sum.
No B <= lineCard assumption is used; all product inputs are supplied by
the proved actual cut source estimate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments AuxiliaryODE PrimitiveLines

theorem initial_scheduledCutPoint_lineLeafPower_repeat_bound {n : ℕ} {B : ℝ} {α : Type*}
    [Fintype α] [DecidableEq α] (leaf : α → Grid n) (hinj : Function.Injective leaf)
    (mask : α → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val) (hzL : z ∈ L.val)
    (hleaf : ∀ q, leaf q ∈ L.val) (hpz : p ≠ z) (hnep : ∀ q, leaf q ≠ p) (hnez : ∀ q, leaf q ≠ z)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (e : Retention n)
    (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (k N : ℕ) (t : ℝ) (ht : t ∈ Set.Icc (0 : ℝ) (cs N).horizon) :
    (∫ ω, lineLeafPower leaf mask L p z k
      (scheduledCutWitness cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t) ≤
      (scheduledLeafUnitPrice cs start e N t z/(1-ε)^(k+2).choose 2) * physicalRepeatSum mask B k := by
  let Z := fun ω => scheduledCutWitness cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p N t
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p N t
  have hZ : Measurable Z :=
    (scheduledCutWitness_measurable cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N).comp
      (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (Z ω).Valid B :=
    scheduledCutWitness_valid cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t)
  exact lineLeafPower_integral_le_repeatSum ν Z hZ B (lt_of_lt_of_le zero_lt_one hB) hv
    leaf hinj mask hm L p z Γ hL hpL hleaf hnep k _
    (fun f => initial_scheduledCutPoint_physical_tuple_product leaf p z f L Γ hL hpL hzL hleaf hpz hnez
      cs ε M deadline start hn hB e hΓ hK hε0 hε N t ht)

theorem initial_scheduledCutPoint_selectedLineLeafPower_repeat_bound {n : ℕ} {B : ℝ}
    (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val) (hzL : z ∈ L.val) (hpz : p ≠ z)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (k N : ℕ) (t : ℝ) (ht : t ∈ Set.Icc (0 : ℝ) (cs N).horizon) :
    (∫ ω, selectedLineLeafPower mask L p z k
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t) ≤
      (scheduledLeafUnitPrice cs start (unitBirthRetention n) N t z/(1-ε)^(k+2).choose 2) *
        physicalRepeatSum (fun q : lineLeafSites L p z => mask q.val) B k := by
  classical
  have hmem (q : lineLeafSites L p z) : q.val ∈ L.val ∧ q.val ≠ p ∧ q.val ≠ z := by
    have hh := Finset.mem_erase.mp q.property
    have hj := Finset.mem_erase.mp hh.2
    exact ⟨hj.2,hj.1,hh.1⟩
  have he : (fun ω => selectedLineLeafPower mask L p z k
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))) =
      (fun ω => lineLeafPower (fun q : lineLeafSites L p z => q.val) (fun q => mask q.val) L p z k
        (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))) := by
    funext ω
    rw [initial_scheduledCutWitness_selectedLine_eq]
    exact boardLineLeafPower_eq_subtype mask L p z k _ B
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
  rw [he]
  exact initial_scheduledCutPoint_lineLeafPower_repeat_bound
    (fun q : lineLeafSites L p z => q.val) Subtype.val_injective (fun q => mask q.val) (fun q => hm q.val)
    L p z Γ hL hpL hzL (fun q => (hmem q).1) hpz (fun q => (hmem q).2.1) (fun q => (hmem q).2.2)
    cs ε M deadline start hn hB (unitBirthRetention n) hΓ hK hε0 hε k N t ht

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_lineLeafPower_repeat_bound
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_selectedLineLeafPower_repeat_bound
