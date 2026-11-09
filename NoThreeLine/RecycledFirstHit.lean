import NoThreeLine.StableResidualProduct
import NoThreeLine.RecycledPhaseKernel

/-! A measurable first state hit on the actual recycled board. The
residual law follows from freezing at the hit, finite product laws, and
eventual stability. The total selector has a zero fallback. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine.RecycledBoardProcess

def firstHitPredicate {S W : Type*} (F : S×W→S×W) (H : S→Prop) (s : S) (k : ℕ) (w : W) : Prop :=
  H (state F s k w) ∨ ¬∃ j,H (state F s j w)

theorem firstHitPredicate_exists {S W : Type*} (F : S×W→S×W) (H : S→Prop) (s : S) (w : W) :
    ∃ k,firstHitPredicate F H s k w := by
  classical
  by_cases h : ∃ k,H (state F s k w)
  · obtain ⟨k,hk⟩ := h
    exact ⟨k,Or.inl hk⟩
  · exact ⟨0,Or.inr h⟩

def firstHitIndex {S W : Type*} (F : S×W→S×W) (H : S→Prop) (s : S) (w : W) : ℕ := by
  classical
  exact Nat.find (firstHitPredicate_exists F H s w)

theorem firstHitIndex_le {S W : Type*} (F : S×W→S×W) (H : S→Prop) (s : S) (w : W)
    (k : ℕ) (hk : H (state F s k w)) : firstHitIndex F H s w≤k := by
  classical
  exact Nat.find_min' (firstHitPredicate_exists F H s w) (Or.inl hk)

def firstHitPair {S W : Type*} (F : S×W→S×W) (H : S→Prop) (s : S) (w : W) : S×W :=
  iterate F s (firstHitIndex F H s w) w

theorem firstHitPair_hits {S W : Type*} (F : S×W→S×W) (H : S→Prop) (s : S) (w : W)
    (h : ∃ k,H (state F s k w)) : H (firstHitPair F H s w).1 := by
  classical
  exact (Nat.find_spec (firstHitPredicate_exists F H s w)).resolve_right (fun hn=>hn h)

theorem firstHitPair_joint_measurable {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S×W→S×W) (hF : Measurable F) (H : S→Prop) (hH : Measurable H) :
    Measurable (fun x : S×W=>firstHitPair F H x.1 x.2) := by
  classical
  have hm (k : ℕ) : Measurable (fun x : S×W=>H (iterate F x.1 k x.2).1) :=
    hH.comp (iterate_joint_measurable F hF k).fst
  have hp (k : ℕ) : MeasurableSet {x : S×W | firstHitPredicate F H x.1 k x.2} :=
    ((hm k).or (Measurable.exists hm).not).setOf
  unfold firstHitPair firstHitIndex
  exact Measurable.find (iterate_joint_measurable F hF) hp
    (fun x=>firstHitPredicate_exists F H x.1 x.2)

def freezeAtHit {S W : Type*} (F : S×W→S×W) (H : S→Prop) (x : S×W) : S×W := by
  classical
  exact if H x.1 then x else F x

theorem freezeAtHit_measurable {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S×W→S×W) (hF : Measurable F) (H : S→Prop) (hH : Measurable H) :
    Measurable (freezeAtHit F H) :=
  Measurable.ite (hH.comp measurable_fst).setOf measurable_id hF

theorem freezeAtHit_map {S W : Type*} [MeasurableSpace S]
    [MeasurableSpace W] (F : S×W→S×W) (H : S→Prop) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s,ν.map (fun w=>F (s,w))=(ν.map (fun w=>(F (s,w)).1)).prod ν)
    (s : S) :
    ν.map (fun w=>freezeAtHit F H (s,w))=(ν.map (fun w=>(freezeAtHit F H (s,w)).1)).prod ν := by
  classical
  by_cases h : H s
  · simp only [freezeAtHit,if_pos h]
    change ν.map (Prod.mk s)=(ν.map (fun _ : W=>s)).prod ν
    rw [Measure.map_const,measure_univ,one_smul,Measure.dirac_prod]
  · simpa only [freezeAtHit,if_neg h] using hsection s

theorem iterate_freezeAtHit_eq_before {S W : Type*} (F : S×W→S×W) (H : S→Prop) (s : S) (w : W)
    (k : ℕ) (hk : k≤firstHitIndex F H s w) :
    iterate (freezeAtHit F H) s k w=iterate F s k w := by
  classical
  induction k with
  | zero => rfl
  | succ k ih =>
    change freezeAtHit F H (iterate (freezeAtHit F H) s k w)=F (iterate F s k w)
    rw [ih (Nat.le_of_succ_le hk)]
    have h : ¬H (state F s k w) := fun h=>Nat.not_lt_of_ge (firstHitIndex_le F H s w k h) hk
    exact if_neg h

theorem iterate_freezeAtHit_stable {S W : Type*} (F : S×W→S×W) (H : S→Prop) (s : S) (w : W)
    (h : ∃ k,H (state F s k w)) :
    ∀ᶠ k in atTop,iterate (freezeAtHit F H) s k w=firstHitPair F H s w := by
  classical
  have hH := firstHitPair_hits F H s w h
  filter_upwards [eventually_ge_atTop (firstHitIndex F H s w)] with k hk
  induction k,hk using Nat.le_induction with
  | base => exact iterate_freezeAtHit_eq_before F H s w _ le_rfl
  | succ k hk ih =>
    change freezeAtHit F H (iterate (freezeAtHit F H) s k w)=_
    rw [ih]
    exact if_pos hH

theorem firstHitPair_map {S W : Type*} [MeasurableSpace S]
    [MeasurableSpace W] (F : S×W→S×W) (hF : Measurable F) (H : S→Prop) (hH : Measurable H)
    (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s,ν.map (fun w=>F (s,w))=(ν.map (fun w=>(F (s,w)).1)).prod ν)
    (s : S) (hex : ∀ᵐ w∂ν,∃ k,H (state F s k w)) :
    ν.map (firstHitPair F H s)=(ν.map (fun w=>(firstHitPair F H s w).1)).prod ν := by
  let G := freezeAtHit F H
  have hG := freezeAtHit_measurable F hF H hH
  have hsect := freezeAtHit_map F H ν hsection
  apply residual_product_of_eventually_stable ν ν (iterate G s) (firstHitPair F H s)
    (iterate_measurable G hG s)
    ((firstHitPair_joint_measurable F hF H hH).comp (measurable_const.prodMk measurable_id))
  · intro k
    rw [iterate_map G hG ν hsect,iterate_state_map G hG ν hsect]
  · exact hex.mono (fun w hw=>iterate_freezeAtHit_stable F H s w hw)

end NoThreeLine.RecycledBoardProcess

#print axioms NoThreeLine.RecycledBoardProcess.iterate_freezeAtHit_eq_before
#print axioms NoThreeLine.RecycledBoardProcess.firstHitPair_joint_measurable
#print axioms NoThreeLine.RecycledBoardProcess.firstHitPair_map
