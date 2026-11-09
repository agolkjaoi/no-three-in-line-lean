import NoThreeLine.VirtualAnchorFacts
import NoThreeLine.ScheduledBoardLabelScale

/-! Actual deterministic-cut board expectations of fixed virtual anchors.
Each of the a distinct selected witnesses pays one actual birth price.
The physical leaves remain weighted; there is no additional B^a loss. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness

def physicalBoardConstant (Γ : Finset ZPoint) (K δ : ℝ) (a : ℕ) : ℝ :=
  (2:ℝ)^Γ.card * (δ^((a+1)^3))⁻¹ * (2:ℝ)^((2*a+1).choose 2) * (starPriceMultiplier Γ K)^a

theorem physicalBoardConstant_pos (Γ : Finset ZPoint) (K δ : ℝ) (hδ : 0 < δ) (a : ℕ) :
    0 < physicalBoardConstant Γ K δ a := by
  unfold physicalBoardConstant starPriceMultiplier
  have hh : 0 < max 1 (protection 1 K) := lt_of_lt_of_le zero_lt_one (le_max_left _ _)
  positivity

theorem initial_scheduledCutBoard_anchor_time_bound {n a : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ : ℝ)
    (q : Grid n) (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (L : LineIndex n) (hqL : q ∉ L.val) (g : Fin a → candidates L q) (hg : g ∈ anchors L q a)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK0 : 0 ≤ K) (hK2 : K < 2)
    (hK : ∀ j, (cs j).K ≤ K) (hρ : ∀ j, ρ ≤ (cs j).rho) (hρ1 : ρ ≤ 1)
    (hδ : 0 < δ) (hδ1 : δ ≤ 1) (hδρ : δ ≤ ρ) (hδK : δ ≤ (2-K)/2)
    (hε0 : 0 ≤ ε) (hε : ε ≤ 1/2) (k : ℕ) (t : ℝ) (ht : t ∈ Icc (0:ℝ) (cs k).horizon) :
    (∫ ω, anchorProduct g
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
      ∂boardClockMeasure n (B/n)) ≤
      physicalBoardConstant Γ K δ a * ((phaseEndpoint cs start k-start+t)/n)^a := by
  let C := insert q (rawLeaves (fun i => (g i).val))
  let D := rawWitnesses (fun i => (g i).val)
  let U := C ∪ D
  have hC : C.card = a+1 := anchorRootLeaves_card g hg hqL
  have hD : D.card = a := anchorWitnesses_card g hg
  have hU : U.card ≤ 2*a+1 := anchorLabels_card_le g hg hqL
  have hb := initial_scheduledCutBoard_physicalLeaf_coarse_product cs ε M deadline start K ρ δ
    q hn hB Γ C D U (Finset.mem_insert_self _ _) (Finset.Subset.refl _)
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 (by linarith) k t ht
  have hprod0 : 0 ≤ ∏ z ∈ D, cutSelectedCoarsePrice cs start k t z :=
    Finset.prod_nonneg (fun z _ => cutSelectedCoarsePrice_nonneg cs start k t ht.1 z)
  have hp := cutSelectedCoarsePrice_prod_le_time cs Γ K start k t ht.1 hΓ hK hK2 D
  rw [hD] at hp
  have hpow : (2:ℝ)^(U.card.choose 2) ≤ 2^((2*a+1).choose 2) :=
    pow_le_pow_right₀ (by norm_num) (Nat.choose_le_choose 2 hU)
  have hratio : (∏ z ∈ D, cutSelectedCoarsePrice cs start k t z)/(1-ε)^(U.card.choose 2) ≤
      (((phaseEndpoint cs start k-start+t)/n) * starPriceMultiplier Γ K)^a *
        (2:ℝ)^((2*a+1).choose 2) := by
    apply (div_eta_pow_le_half _ ε hprod0 hε _).trans
    exact mul_le_mul hp hpow (by positivity) (hprod0.trans hp)
  change (∫ ω, physicalLeafProduct C D q _ ∂boardClockMeasure n (B/n)) ≤ _
  apply hb.trans
  rw [hC]
  calc
    _ ≤ (2:ℝ)^Γ.card * ((δ^((a+1)^3))⁻¹ *
        ((((phaseEndpoint cs start k-start+t)/n) * starPriceMultiplier Γ K)^a *
          (2:ℝ)^((2*a+1).choose 2))) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hratio (by positivity)) (by positivity)
    _ = _ := by unfold physicalBoardConstant; rw [mul_pow]; ring

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.initial_scheduledCutBoard_anchor_time_bound
