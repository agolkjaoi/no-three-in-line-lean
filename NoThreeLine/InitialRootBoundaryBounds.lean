import NoThreeLine.RootFreezePointSupport
import NoThreeLine.InitialRootWitness

/-! True boundary witness products, fixed moments and tails without an
activity indicator, for canonical roots whose deadline is after the start.
Indicator removal is justified by zero actual point density on inactive
saved snapshots; it is not asserted for initially retired roots. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem initialGoodObservation_active_of_before_deadline {n : ℕ} (cfg : FlowConfig n)
    (ε M : ℝ) (hB : 1≤cfg.B) (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n)
    (hp : start<deadline p) :
    ((initialGoodObservation cfg ε M hB deadline start).val.1.val.1.physical.process.accounts p).status=.active := by
  change (CreditAccount.retire ⟨.active,1⟩ (decide (deadline p≤start))).status=.active
  simp only [CreditAccount.retire,not_le.mpr hp,decide_false,Bool.false_eq_true,and_false,if_false]

theorem initial_rootBoundary_witness_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hpD : p∉D) (hDL : insert p D⊆L) (hε0 : 0≤ε) (hε : ε<1)
    (deadline : Grid n→ℝ) (hp : start<deadline p) :
    let s := initialGoodObservation cfg ε M hB deadline start
    (∫ω,witnessProduct D (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        (∏q∈D,∫u in (0:ℝ)..(cfg.horizon:ℝ),(cfg.mask q*e.value q (start+u)/n)*
          max 1 (protection 1 cfg.K)^cfg.directions.card)/(1-ε)^L.card.choose 2 := by
  dsimp only
  rw [rootPoint_boundary_witness_mean_eq cfg ε M start e D p hn _
    (initialGoodObservation_active_of_before_deadline cfg ε M hB deadline start p hp)]
  exact initial_rootPoint_activeWitness_product cfg ε M start e D L p hn hB hm hK hpD hDL hε0 hε deadline

theorem initial_rootBoundary_witnessPower_moment {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hε0 : 0≤ε) (hε : ε<1) (deadline : Grid n→ℝ) (hp : start<deadline p) (hw0 : ∀q,0≤w q) :
    let s := initialGoodObservation cfg ε M hB deadline start
    (∫ω,witnessSum w (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)^m
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)≤
        ∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
          (((cfg.horizon:ℝ)*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^(Finset.univ.image f).card/
            (1-ε)^(insert p (Finset.univ.image f)).card.choose 2) := by
  dsimp only
  rw [rootPoint_boundary_power_mean_eq cfg ε M start e w m p hn _
    (initialGoodObservation_active_of_before_deadline cfg ε M hB deadline start p hp)]
  exact initial_rootPoint_activeWitnessPower_moment cfg ε M start e w m p hn hB hm hK hε0 hε deadline hw0

theorem initial_rootBoundary_witness_tail {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n)
    (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hε0 : 0≤ε) (hε : ε<1) (deadline : Grid n→ℝ) (hp : start<deadline p)
    (hw0 : ∀q,0≤w q) (r : ℝ) (hr : 0<r) :
    let s := initialGoodObservation cfg ε M hB deadline start
    let W := rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val
    (withinPhasePointMeasure cfg ε M hn s.val.1 p).real {ω | r≤witnessSum w (W ω)}≤
      (∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*
        (((cfg.horizon:ℝ)*((1/n)*max 1 (protection 1 cfg.K)^cfg.directions.card))^(Finset.univ.image f).card/
          (1-ε)^(insert p (Finset.univ.image f)).card.choose 2))/r^m := by
  dsimp only
  rw [rootPoint_boundary_tail_event_eq cfg ε M start e w p hn _
    (initialGoodObservation_active_of_before_deadline cfg ε M hB deadline start p hp) r]
  exact initial_rootPoint_witness_tail cfg ε M start e w m p hn hB hm hK hε0 hε deadline hw0 r hr

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initialGoodObservation_active_of_before_deadline
#print axioms NoThreeLine.BirthWitness.initial_rootBoundary_witness_product
#print axioms NoThreeLine.BirthWitness.initial_rootBoundary_witnessPower_moment
#print axioms NoThreeLine.BirthWitness.initial_rootBoundary_witness_tail
