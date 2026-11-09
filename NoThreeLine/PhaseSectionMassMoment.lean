import NoThreeLine.PhaseSectionLeafMoment
import NoThreeLine.PhaseLineSectionPointSupport

/-! The actual C22 credit-weighted active line/cell mass at the cross-phase
saved snapshot. An initially active root removes its gate under the same
full-phase point law. Lower distinct-degree errors remain explicit. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

theorem sectionLeafPower_actual_mass {n : ℕ} (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (m : ℕ) (a : AugmentedState n)
    (hp : (a.physical.process.accounts p).status = .active) :
    sectionLeafPower (fun q : (L.val ∩ E).erase p => q.val) L p m a = actualLineSectionMass L p E a ^ m := by
  rw [sectionLeafPower,if_pos ((ProcessState.mem_activeEvents _ p).mpr hp)]
  rw [Finset.sum_coe_sort ((L.val ∩ E).erase p)
    (fun q : Grid n => if q ∈ a.physical.process.activeEvents then (a.physical.process.accounts q).weight else 0)]
  simp only [ProcessState.mem_activeEvents]
  rfl

theorem initial_phaseSectionPoint_mass_moment {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (m : ℕ) (hm : 0 < m) (J : ℕ) :
    (∫ ω, actualLineSectionMass L p E
      (phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J ω).val.2.2 ^ m
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      ((((L.val ∩ E).erase p).card:ℝ)^m +
        ∑ a ∈ Finset.Ico 1 m, B^(m-a)*(a:ℝ)^m*(((L.val ∩ E).erase p).card:ℝ)^a)/(1-ε)^(m+1).choose 2 := by
  let S := (L.val ∩ E).erase p
  let leaf : S → Grid n := fun q => q.val
  have hleaf (q : S) : leaf q ∈ L.val := (Finset.mem_inter.mp (Finset.mem_erase.mp q.property).2).1
  have hne (q : S) : leaf q ≠ p := (Finset.mem_erase.mp q.property).1
  have hh := initial_phaseSectionPoint_sectionLeafPower_degree_bound leaf Subtype.val_injective L p Γ hL hpL hleaf hne
    cs ε M deadline start E A hn hB hΓ hK hε0 hε m hm J
  have he : (∫ ω, actualLineSectionMass L p E
      (phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J ω).val.2.2 ^ m
      ∂phasePointMeasure cs ε M deadline start hn hB p J) =
      ∫ ω, sectionLeafPower leaf L p m
      (phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J ω).val.2.2
      ∂phasePointMeasure cs ε M deadline start hn hB p J := by
    apply integral_congr_ae
    filter_upwards [initial_phaseSectionPoint_active_ae cs ε M deadline start L p E A hn hB hp J] with ω hω
    exact (sectionLeafPower_actual_mass L p E m _ hω).symm
  rw [he]
  simpa only [Fintype.card_coe,S] using hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.sectionLeafPower_actual_mass
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_mass_moment
