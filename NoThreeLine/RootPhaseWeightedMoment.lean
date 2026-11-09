import NoThreeLine.RootPhaseMomentExpansion

/-! Every finite degree of the actual canonical all-phase frozen witness
sum has a coarse-price main power plus the proved collision error. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines FiniteWitnessMoments

theorem initial_rootPhasePoint_power_label_sum {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (w : Grid n→ℝ) (m N : ℕ) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (hw0 : ∀q,0≤w q) :
    (∫ω,activeWitnessPower w m p (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)
      ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      ∑f : Fin m→Grid n,tuplePrice ∅ w (accumulatedPhaseCoarsePrice cs start e N) f/
        (1-ε)^(insert p (tupleLabels f)).card.choose 2 := by
  apply (initial_rootPhasePoint_power_weighted_expansion cs ε M deadline start p hn hB e w m N hw0).trans
  calc
    _≤∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
        ((∏q∈tupleLabels f,accumulatedPhaseCoarsePrice cs start e N q)/(1-ε)^(insert p (tupleLabels f)).card.choose 2) :=
      Finset.sum_le_sum (fun f _=>mul_le_mul_of_nonneg_left
        (initial_rootPhasePoint_all_labels_coarse_product cs ε M deadline start p hn hB e Γ (tupleLabels f)
          hΓ hK hε0 hε N) (Finset.prod_nonneg (fun i _=>hw0 (f i))))
    _=_ := by simp only [tuplePrice,Finset.sdiff_empty,mul_div_assoc]

theorem initial_rootPhasePoint_active_power_coarse {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (w : Grid n→ℝ) (m N : ℕ) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (hw0 : ∀q,0≤w q) (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) :
    let A := ∑q,w q*accumulatedPhaseCoarsePrice cs start e N q
    (∫ω,activeWitnessPower w m p (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)
      ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      (A^m+(m:ℝ)^2*W*(A+(m:ℝ)*W)^(m-1))/(1-ε)^(m+1).choose 2 :=
  (initial_rootPhasePoint_power_label_sum cs ε M deadline start p hn hB e Γ w m N hΓ hK hε0 hε hw0).trans
    (tupleMoment_eta_sum_le_main_add_error w (accumulatedPhaseCoarsePrice cs start e N) hw0
      (accumulatedPhaseCoarsePrice_nonneg cs start e N) p m (1-ε) (sub_pos.mpr hε)
      (sub_le_self _ hε0) W hW0 hW)

theorem initial_rootPhasePoint_witnessPower_coarse {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (w : Grid n→ℝ) (m N : ℕ) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (hw0 : ∀q,0≤w q) (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) :
    let A := ∑q,w q*accumulatedPhaseCoarsePrice cs start e N q
    (∫ω,witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)^m
      ∂phasePointMeasure cs ε M deadline start hn hB p N)≤
      (A^m+(m:ℝ)^2*W*(A+(m:ℝ)*W)^(m-1))/(1-ε)^(m+1).choose 2 := by
  dsimp only
  rw [initial_rootPhasePoint_power_mean_eq cs ε M deadline start p hn hB e hp w m N]
  exact initial_rootPhasePoint_active_power_coarse cs ε M deadline start p hn hB e Γ w m N hΓ hK hε0 hε hw0 W hW0 hW

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_power_label_sum
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_witnessPower_coarse
