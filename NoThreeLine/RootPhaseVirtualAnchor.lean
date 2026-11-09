import NoThreeLine.RootPhasePhysicalCoarse
import NoThreeLine.ScheduledVirtualAnchor

/-! Fixed virtual anchors under the original board law of the full-phase
saved root snapshot. Only the deterministic source-price arithmetic is
shared with the cut theorem, not the cut observation or its law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness

theorem accumulatedCoarsePrice_prod_le_time {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (Γ : Finset ZPoint) (K start : ℝ) (J : ℕ)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K ≤ K) (hK2 : K < 2)
    (D : Finset (Grid n)) :
    (∏ z ∈ D, accumulatedPhaseCoarsePrice cs start (unitBirthRetention n) J z) ≤
      ((phaseEndpoint cs start J-start)/n * starPriceMultiplier Γ K)^D.card := by
  simpa only [cutSelectedCoarsePrice, intervalIntegral.integral_same, add_zero] using
    cutSelectedCoarsePrice_prod_le_time cs Γ K start J 0 le_rfl hΓ hK hK2 D

theorem initial_rootPhaseBoard_anchor_time_bound {n a : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ : ℝ)
    (q : Grid n) (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (L : LineIndex n) (hqL : q ∉ L.val) (g : Fin a → candidates L q) (hg : g ∈ anchors L q a)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK0 : 0 ≤ K) (hK2 : K < 2)
    (hK : ∀ j, (cs j).K ≤ K) (hρ : ∀ j, ρ ≤ (cs j).rho) (hρ1 : ρ ≤ 1)
    (hδ : 0 < δ) (hδ1 : δ ≤ 1) (hδρ : δ ≤ ρ) (hδK : δ ≤ (2-K)/2)
    (hε0 : 0 ≤ ε) (hε : ε ≤ 1/2) (J : ℕ) :
    (∫ ω, anchorProduct g
      (initialRootPhaseWitness cs ε M deadline start q hn hB (unitBirthRetention n) J ω).augmented.physical
      ∂boardClockMeasure n (B/n)) ≤
      physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start J-start)/n)^a := by
  let C := insert q (rawLeaves (fun i => (g i).val))
  let D := rawWitnesses (fun i => (g i).val)
  let U := C ∪ D
  have hC : C.card = a+1 := anchorRootLeaves_card g hg hqL
  have hD : D.card = a := anchorWitnesses_card g hg
  have hU : U.card ≤ 2*a+1 := anchorLabels_card_le g hg hqL
  have hb := initial_rootPhaseBoard_physicalLeaf_coarse_product cs ε M deadline start K ρ δ
    q hn hB Γ C D U (Finset.mem_insert_self _ _) (Finset.Subset.refl _)
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 (by linarith) J
  have hprod0 : 0 ≤ ∏ z ∈ D, accumulatedPhaseCoarsePrice cs start (unitBirthRetention n) J z :=
    Finset.prod_nonneg (fun z _ => accumulatedPhaseCoarsePrice_nonneg cs start _ J z)
  have hp := accumulatedCoarsePrice_prod_le_time cs Γ K start J hΓ hK hK2 D
  rw [hD] at hp
  have hpow : (2:ℝ)^(U.card.choose 2) ≤ 2^((2*a+1).choose 2) :=
    pow_le_pow_right₀ (by norm_num) (Nat.choose_le_choose 2 hU)
  have hratio : (∏ z ∈ D, accumulatedPhaseCoarsePrice cs start (unitBirthRetention n) J z) /
      (1-ε)^(U.card.choose 2) ≤
      (((phaseEndpoint cs start J-start)/n) * starPriceMultiplier Γ K)^a *
        (2:ℝ)^((2*a+1).choose 2) := by
    apply (div_eta_pow_le_half _ ε hprod0 hε _).trans
    exact mul_le_mul hp hpow (by positivity) (hprod0.trans hp)
  change (∫ ω, physicalLeafProduct C D q _ ∂boardClockMeasure n (B/n)) ≤ _
  apply hb.trans
  rw [hC]
  calc
    _ ≤ (2:ℝ)^Γ.card * ((δ^((a+1)^3))⁻¹ *
        ((((phaseEndpoint cs start J-start)/n) * starPriceMultiplier Γ K)^a *
          (2:ℝ)^((2*a+1).choose 2))) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hratio (by positivity)) (by positivity)
    _ = _ := by unfold physicalBoardConstant; rw [mul_pow]; ring

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.initial_rootPhaseBoard_anchor_time_bound
