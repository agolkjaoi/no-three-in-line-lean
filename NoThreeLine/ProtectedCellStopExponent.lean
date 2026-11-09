import NoThreeLine.ProtectedCellStoppedSurplus
import NoThreeLine.ProtectedStoppedCutExponential

/-! Identify the first-stop witness with an attained value of the
inserted-cut exponential, at the original boundary or the strict cut. -/
set_option autoImplicit false
set_option maxHeartbeats 2150000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedStoppedCutExponential_attains_cellCut {n : ℕ}
    (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (E : Finset (Grid n))
    (A : ℝ→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ) (k : ℕ) (ω : BoardClockPath n) (t : ℝ)
    (hbefore : ∀j<k,ω∉protectedCutReached cfg ε M L cut hn s param j)
    (ht : t=0 ∨ (t=cut ((protectedRecycledPair cfg ε M L hn s k ω).1,param k ω) ∧
      ω∈protectedCutReached cfg ε M L cut hn s param k)) :
    ∃j,protectedStoppedCutExponential cfg ε M L (fun x=>protectedScalarTotal L E A x.1 x.2)
      F V θ cut hn s param j ω=
      Real.exp (θ*protectedCellCutCompensated cfg ε M L E A F hn s k ω t-
        (θ^2/2)*cumulativeProtectedCutSource cfg ε M L V hn s k ω t) := by
  let G := fun x : ExtendedState n×(Grid n→ℝ)=>protectedScalarTotal L E A x.1 x.2
  let U := protectedCutReached cfg ε M L cut hn s param
  have hnot : ω∉insertedCutHit U k := by
    intro h
    obtain ⟨j,hj,hU⟩ := (mem_insertedCutHit U k ω).mp h
    exact hbefore j hj hU
  rcases ht with rfl | ⟨rfl,hcut⟩
  · refine ⟨k,?_⟩
    unfold protectedStoppedCutExponential
    rw [insertedCutValue_eq_of_not_hit _ _ U
      (protectedCutObservation_of_not_reached cfg ε M L G F V θ cut hn s param) k ω hnot]
    rw [cumulativeProtectedCutSource_zero]
    unfold protectedCellCutCompensated
    rw [protectedStateFlowTotal_zero,cumulativeProtectedCutSource_zero]
    rfl
  · refine ⟨k+1,?_⟩
    unfold protectedStoppedCutExponential
    have hnot' : ω∉insertedCutHit (protectedCutReached cfg ε M L cut hn s param) k := hnot
    simp only [insertedCutValue,if_neg hnot']
    rw [protectedCutObservation_of_reached cfg ε M L G F V θ cut hn s param k ω hcut]
    unfold protectedPastExponential protectedLocalStateExponential protectedCellCutCompensated
      cumulativeProtectedCutSource
    rw [←Real.exp_add]
    congr 1
    change _ + (θ*(protectedStateFlowTotal cfg L E A
      ((protectedRecycledPair cfg ε M L hn s k ω).1,
        cut ((protectedRecycledPair cfg ε M L hn s k ω).1,param k ω)) - _) - _) = _
    ring

theorem protectedCellCut_level_le {n : ℕ}
    (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (E : Finset (Grid n))
    (A : ℝ→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (hθ : 0≤θ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ) (k : ℕ) (ω : BoardClockPath n) (t r v : ℝ)
    (hbefore : ∀j<k,ω∉protectedCutReached cfg ε M L cut hn s param j)
    (ht : t=0 ∨ (t=cut ((protectedRecycledPair cfg ε M L hn s k ω).1,param k ω) ∧
      ω∈protectedCutReached cfg ε M L cut hn s param k))
    (hr : r≤protectedCellCutCompensated cfg ε M L E A F hn s k ω t-protectedStateTotal cfg L E A s)
    (hv : cumulativeProtectedCutSource cfg ε M L V hn s k ω t≤v) :
    ∃j,Real.exp (θ*(protectedStateTotal cfg L E A s+r)-(θ^2/2)*v)≤
      protectedStoppedCutExponential cfg ε M L (fun x=>protectedScalarTotal L E A x.1 x.2)
        F V θ cut hn s param j ω := by
  obtain ⟨j,hj⟩ := protectedStoppedCutExponential_attains_cellCut cfg ε M L E A F V θ cut hn s param
    k ω t hbefore ht
  refine ⟨j,?_⟩
  rw [hj]
  apply Real.exp_le_exp.mpr
  have h1 := mul_le_mul_of_nonneg_left
    (show protectedStateTotal cfg L E A s+r≤protectedCellCutCompensated cfg ε M L E A F hn s k ω t by linarith) hθ
  have h2 := mul_le_mul_of_nonneg_left hv (show 0≤θ^2/2 by positivity)
  exact sub_le_sub h1 h2

end NoThreeLine

#print axioms NoThreeLine.protectedStoppedCutExponential_attains_cellCut
#print axioms NoThreeLine.protectedCellCut_level_le

