import NoThreeLine.RootPhaseWeightedMoment
import NoThreeLine.WitnessLabelSeparation
import NoThreeLine.LabelMomentSplit

/-! The actual canonical all-phase point-law moment has a unit-price
main term, a repeated-label error, and a coarse-price error supported on
distinct specified-line witness pairs. No phase is reinitialized. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines FiniteWitnessMoments

theorem initial_rootPhasePoint_weighted_split {n m : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (w : Grid n→ℝ) (f : Fin m→Grid n) (N : ℕ)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (hw0 : ∀q,0≤w q)
    (hroot : ∀q,w q≠0→¬specifiedPair Γ p q) :
    (∏i : Fin m,w (f i))*(∫ω,activeWitness (tupleLabels f) p
      (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω) ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      splitTuplePrice (specifiedDistinctPair Γ) w (accumulatedPhaseUnitPrice cs start e N)
        (accumulatedPhaseCoarsePrice cs start e N) f/(1-ε)^(insert p (tupleLabels f)).card.choose 2 := by
  classical
  by_cases hf : ∃i j,i≠j ∧ specifiedDistinctPair Γ (f i) (f j)
  · simpa only [splitTuplePrice,if_pos hf,tuplePrice,Finset.sdiff_empty,mul_div_assoc] using
      mul_le_mul_of_nonneg_left
        (initial_rootPhasePoint_all_labels_coarse_product cs ε M deadline start p hn hB e Γ (tupleLabels f)
          hΓ hK hε0 hε N) (Finset.prod_nonneg (fun i _=>hw0 (f i)))
  · by_cases hp : (∏i : Fin m,w (f i))=0
    · simp only [splitTuplePrice,if_neg hf,tuplePrice,hp,zero_mul,zero_div,le_refl]
    · have hsep := separated_insert_tupleLabels_of_prod_ne_zero Γ p w f hroot hp hf
      simpa only [splitTuplePrice,if_neg hf,tuplePrice,Finset.sdiff_empty,mul_div_assoc] using
        mul_le_mul_of_nonneg_left
          (initial_rootPhasePoint_all_labels_unit_product cs ε M deadline start p hn hB e Γ (tupleLabels f)
            hΓ hK hsep hε0 hε N) (Finset.prod_nonneg (fun i _=>hw0 (f i)))

theorem initial_rootPhasePoint_active_power_separated {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (w : Grid n→ℝ) (m N : ℕ) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (hw0 : ∀q,0≤w q) (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W)
    (hroot : ∀q,w q≠0→¬specifiedPair Γ p q) :
    let A := ∑q,w q*accumulatedPhaseUnitPrice cs start e N q
    let C := ∑q,w q*accumulatedPhaseCoarsePrice cs start e N q
    let J := pairWeight (specifiedDistinctPair Γ) w (accumulatedPhaseCoarsePrice cs start e N)
    (∫ω,activeWitnessPower w (m+2) p (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)
      ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      (A^(m+2)+((m+2:ℕ):ℝ)^2*W*(A+((m+2:ℕ):ℝ)*W)^(m+1)+
        ((m+2:ℕ):ℝ)^2*J*(C+((m+2:ℕ):ℝ)*W)^m)/(1-ε)^(m+3).choose 2 := by
  classical
  dsimp only
  apply (initial_rootPhasePoint_power_weighted_expansion cs ε M deadline start p hn hB e w (m+2) N hw0).trans
  apply (Finset.sum_le_sum (fun f _=>initial_rootPhasePoint_weighted_split cs ε M deadline start p hn hB e Γ
    w f N hΓ hK hε0 hε hw0 hroot)).trans
  exact split_tuple_eta_moment_bound (specifiedDistinctPair Γ) (fun _ _ h=>h.1)
    w (accumulatedPhaseUnitPrice cs start e N) (accumulatedPhaseCoarsePrice cs start e N) hw0
    (accumulatedPhaseUnitPrice_nonneg cs start e N) (accumulatedPhaseCoarsePrice_nonneg cs start e N)
    W hW0 hW m p (1-ε) (sub_pos.mpr hε) (sub_le_self _ hε0)

theorem initial_rootPhasePoint_witnessPower_separated {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (w : Grid n→ℝ) (m N : ℕ) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (hw0 : ∀q,0≤w q) (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W)
    (hroot : ∀q,w q≠0→¬specifiedPair Γ p q) :
    let A := ∑q,w q*accumulatedPhaseUnitPrice cs start e N q
    let C := ∑q,w q*accumulatedPhaseCoarsePrice cs start e N q
    let J := pairWeight (specifiedDistinctPair Γ) w (accumulatedPhaseCoarsePrice cs start e N)
    (∫ω,witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)^(m+2)
      ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      (A^(m+2)+((m+2:ℕ):ℝ)^2*W*(A+((m+2:ℕ):ℝ)*W)^(m+1)+
        ((m+2:ℕ):ℝ)^2*J*(C+((m+2:ℕ):ℝ)*W)^m)/(1-ε)^(m+3).choose 2 := by
  dsimp only
  rw [initial_rootPhasePoint_power_mean_eq cs ε M deadline start p hn hB e hp w (m+2) N]
  exact initial_rootPhasePoint_active_power_separated cs ε M deadline start p hn hB e Γ w m N hΓ hK
    hε0 hε hw0 W hW0 hW hroot

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_weighted_split
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_witnessPower_separated
