import NoThreeLine.SectionLeafExpansion
import NoThreeLine.PhysicalRepeatByDegree
import NoThreeLine.PhaseLineSectionProduct

/-! Actual full-phase D-empty section moments. The all-distinct main
coefficient is one and the lower distinct-degree errors remain separate,
with no B <= line-length premise. Root/all-leaf active gates are retained. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

theorem initial_phaseSectionPoint_tuple_product {n : ℕ} {B : ℝ} {α : Type*} [DecidableEq α]
    {m : ℕ} (leaf : α → Grid n) (p : Grid n) (f : Fin m → α)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (J : ℕ) :
    (∫ ω, rootLeafPhi Γ (physicalRootLabels leaf p f) p
      (phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J ω).val.2.2.physical
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤ 1/(1-ε)^(m+1).choose 2 := by
  classical
  let C := physicalRootLabels leaf p f
  have hc : C.card ≤ m+1 := by
    have h0 := Finset.card_image_le (s:=tupleLabels f) (f:=leaf)
    have h1 := Finset.card_insert_le p ((tupleLabels f).image leaf)
    have h2 := tupleLabels_card_le f
    change C.card ≤ ((tupleLabels f).image leaf).card+1 at h1
    omega
  apply (initial_phaseSectionPoint_leaf_product cs ε M deadline start L p E A hn hB Γ hΓ hK
    C C (Finset.mem_insert_self _ _) (Finset.Subset.refl _) hε0 hε J).trans
  exact div_le_div_of_nonneg_left zero_le_one (pow_pos (sub_pos.mpr hε) _)
    (pow_le_pow_of_le_one (sub_nonneg.mpr hε.le) (by linarith) (Nat.choose_le_choose 2 hc))

theorem initial_phaseSectionPoint_sectionLeafPower_repeat_bound {n : ℕ} {B : ℝ} {α : Type*}
    [Fintype α] [DecidableEq α] (leaf : α → Grid n) (hinj : Function.Injective leaf)
    (L : LineIndex n) (p : Grid n) (Γ : Finset ZPoint) (hL : ¬specified Γ L)
    (hpL : p ∈ L.val) (hleaf : ∀ q, leaf q ∈ L.val) (hne : ∀ q, leaf q ≠ p)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (m J : ℕ) :
    (∫ ω, sectionLeafPower leaf L p m
      (phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J ω).val.2.2
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      physicalRepeatSum (fun _ : α => 1) B m/(1-ε)^(m+1).choose 2 := by
  let V := phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J
  let ν := phasePointMeasure cs ε M deadline start hn hB p J
  let coef (f : Fin m → α) := B^(m-(tupleLabels f).card)
  let price := 1/(1-ε)^(m+1).choose 2
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hB0 : 0 < B := zero_lt_one.trans_le hB
  have hv : Measurable V := (phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn
    (initialPhaseSection B hB p deadline start) J).fst.snd
  have hi : Integrable (fun ω => sectionLeafPower leaf L p m (V ω).val.2.2) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      ((sectionLeafPower_measurable leaf L p m).comp hv.subtype_val.snd.snd) ((B*Fintype.card α)^m)
      (fun ω => sectionLeafPower_bounds leaf L p m _ B hB0.le (V ω).property.1.saved)
  have hj (f : Fin m → α) : Integrable (fun ω => rootLeafPhi Γ (physicalRootLabels leaf p f) p (V ω).val.2.2.physical) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      ((rootLeafPhi_measurable Γ (physicalRootLabels leaf p f) p).comp
        ((AugmentedState.measurable_physical n).comp hv.subtype_val.snd.snd))
      (rootLeafCap (physicalRootLabels leaf p f) p B)
      (fun ω => rootLeafPhi_bounds Γ (physicalRootLabels leaf p f) p _ B (V ω).property.1.saved.1)
  have hb (f : Fin m → α) : (∫ ω, rootLeafPhi Γ (physicalRootLabels leaf p f) p (V ω).val.2.2.physical ∂ν) ≤ price :=
    initial_phaseSectionPoint_tuple_product leaf p f cs ε M deadline start L E A hn hB Γ hΓ hK hε0 hε J
  calc
    _ ≤ ∫ ω, ∑ f : Fin m → α, coef f * rootLeafPhi Γ (physicalRootLabels leaf p f) p (V ω).val.2.2.physical ∂ν :=
      integral_mono hi (integrable_finsetSum _ (fun f _ => (hj f).const_mul (coef f))) (fun ω => by
        rw [sectionLeafPower_eq_sum]
        exact Finset.sum_le_sum (fun f _ => sectionLeafTuple_le_rootLeaf leaf hinj L p Γ hL hpL hleaf hne
          f _ B hB0 (V ω).property.1.saved))
    _ = ∑ f : Fin m → α, coef f * (∫ ω, rootLeafPhi Γ (physicalRootLabels leaf p f) p (V ω).val.2.2.physical ∂ν) := by
      rw [integral_finsetSum _ (fun f _ => (hj f).const_mul (coef f))]
      simp_rw [integral_const_mul]
    _ ≤ ∑ f : Fin m → α, coef f * price := Finset.sum_le_sum
      (fun f _ => mul_le_mul_of_nonneg_left (hb f) (pow_nonneg hB0.le _))
    _ = _ := by
      simp only [physicalRepeatSum,Finset.prod_const_one,mul_one,div_eq_mul_inv,price,coef,Finset.sum_mul,one_mul]

theorem initial_phaseSectionPoint_sectionLeafPower_degree_bound {n : ℕ} {B : ℝ} {α : Type*}
    [Fintype α] [DecidableEq α] (leaf : α → Grid n) (hinj : Function.Injective leaf)
    (L : LineIndex n) (p : Grid n) (Γ : Finset ZPoint) (hL : ¬specified Γ L)
    (hpL : p ∈ L.val) (hleaf : ∀ q, leaf q ∈ L.val) (hne : ∀ q, leaf q ≠ p)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (m : ℕ) (hm : 0 < m) (J : ℕ) :
    (∫ ω, sectionLeafPower leaf L p m
      (phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J ω).val.2.2
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
      ((Fintype.card α:ℝ)^m + ∑ a ∈ Finset.Ico 1 m, B^(m-a)*(a:ℝ)^m*(Fintype.card α:ℝ)^a)/(1-ε)^(m+1).choose 2 :=
  (initial_phaseSectionPoint_sectionLeafPower_repeat_bound leaf hinj L p Γ hL hpL hleaf hne
    cs ε M deadline start E A hn hB hΓ hK hε0 hε m J).trans
      (div_le_div_of_nonneg_right (physicalRepeatSum_unit_degree_bound B (zero_le_one.trans hB) m hm)
        (pow_nonneg (sub_nonneg.mpr hε.le) _))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_sectionLeafPower_repeat_bound
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_sectionLeafPower_degree_bound
