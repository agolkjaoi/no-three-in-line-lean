import NoThreeLine.ScheduledCutFutureTower
import NoThreeLine.SelectedLineRegularity

/-! Actual active-root/selected-witness leaf powers have the same mean
under the current cut density and the full future terminal point law,
for almost every calendar time. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem selectedLineLeafPower_measurable {n : ℕ} (mask : Grid n → ℝ) (L : LineIndex n)
    (p z : Grid n) (k : ℕ) : Measurable (selectedLineLeafPower mask L p z k) := by
  have he : selectedLineLeafPower mask L p z k = fun a => selectedLineGate p z a * (boardLineMass mask L p a)^k :=
    funext (selectedLineLeafPower_eq_gate_mul mask L p z k)
  rw [he]
  exact (selectedLineGate_measurable p z).mul ((boardLineMass_measurable mask L p).pow_const k)

theorem selectedLineLeafPower_bounds {n : ℕ} (mask : Grid n → ℝ)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (L : LineIndex n) (p z : Grid n) (k : ℕ)
    (a : WitnessState n) (B : ℝ) (hB : 0 ≤ B) (ha : a.Valid B) :
    0 ≤ selectedLineLeafPower mask L p z k a ∧ selectedLineLeafPower mask L p z k a ≤ (B*(L.val.card : ℝ))^k := by
  rw [selectedLineLeafPower_eq_gate_mul]
  have hg := selectedLineGate_bounds p z a
  have hb := boardLineMass_bounds mask hm L p a B hB ha
  exact ⟨mul_nonneg hg.1 (pow_nonneg hb.1 k),
    (mul_le_of_le_one_left (pow_nonneg hb.1 k) hg.2).trans (pow_le_pow_left₀ hb.1 hb.2 k)⟩

theorem scheduledCutLineLeafPower_terminal_mean_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (L : LineIndex n) (p z : Grid n) (k N J : ℕ) (hNJ : N < J) :
    ∀ᵐ t : ℝ ∂volume, ∀ ht : t ∈ Ioo 0 ((cs N).horizon : ℝ),
    (∫ ω, selectedLineLeafPower mask L p z k
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂phasePointMeasure cs ε M deadline start hn hB p J) =
    ∫ ω, selectedLineLeafPower mask L p z k
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t := by
  let A := (B*(L.val.card : ℝ))^k
  have hA : 0 ≤ A := pow_nonneg (mul_nonneg (zero_le_one.trans hB) (Nat.cast_nonneg _)) _
  let F := fun (_t : ℝ) (v : TimedObservation (cs N).config) =>
    min (max (selectedLineLeafPower mask L p z k (observedWitness (cs N).config (unitBirthRetention n) v)) 0) A
  have hF (t : ℝ) : Measurable (F t) :=
    (((selectedLineLeafPower_measurable mask L p z k).comp
      (observedWitness_measurable (cs N).config (unitBirthRetention n))).max measurable_const).min measurable_const
  have hb (t : ℝ) (v : TimedObservation (cs N).config) : 0 ≤ F t v ∧ F t v ≤ A :=
    ⟨le_min (le_max_right _ _) hA,min_le_right _ _⟩
  have hfactual (t : ℝ) (ω : BoardClockPath n) :
      F t (scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t)) =
      selectedLineLeafPower mask L p z k (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t)) := by
    have hh := selectedLineLeafPower_bounds mask hm L p z k _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
    exact (congrArg (fun x => min x A) (max_eq_left hh.1)).trans (min_eq_left hh.2)
  have he := scheduledCut_future_point_integral_ae cs ε M deadline start hn hB N (J-(N+1)) p F hF A hb
  have hindex : N+1+(J-(N+1))=J := Nat.add_sub_of_le (Nat.succ_le_of_lt hNJ)
  simpa only [hindex,hfactual] using he

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.selectedLineLeafPower_measurable
#print axioms NoThreeLine.BirthWitness.selectedLineLeafPower_bounds
#print axioms NoThreeLine.BirthWitness.scheduledCutLineLeafPower_terminal_mean_ae
