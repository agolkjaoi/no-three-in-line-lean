import NoThreeLine.RootFreezeActiveSupport
import NoThreeLine.RootFreezeMoments

/-! For an initially active root, its saved boundary is active almost
surely under the existing actual point measure. Inactive saved snapshots
have zero density, so their indicators can now be removed with a proof. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

theorem rootPoint_boundary_active_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (hp : (s.val.1.val.1.physical.process.accounts p).status=.active) :
    ∀ᵐω∂withinPhasePointMeasure cfg ε M hn s.val.1 p,
      ((rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω).augmented.physical.process.accounts p).status=.active := by
  have hZm : Measurable (fun ω=>augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s.val.1 ω)) :=
    (augTimedCredit_measurable cfg p).comp (augRecycledTerminal_measurable cfg ε M hn s.val.1)
  have hpos : ∀ᵐω∂withinPhasePointMeasure cfg ε M hn s.val.1 p,
      0<augTimedCredit cfg p (augRecycledTerminal cfg ε M hn s.val.1 ω) :=
    savedCreditMeasure_positive_ae _ _ hZm
  filter_upwards [hpos] with ω hω
  by_contra hi
  have hz : ((rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω).augmented.physical.process.accounts p).credit=0 :=
    rootObserverTerminal_active_support cfg ε M start p hn s.val s.property.1 hp ω hi
  rw [rootBoundaryWitness_credit cfg ε M start e p hn _ (goodRootInitial cfg p s).property.1 ω] at hz
  exact (ne_of_gt hω) hz

theorem rootPoint_boundary_witness_mean_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (hp : (s.val.1.val.1.physical.process.accounts p).status=.active) :
    (∫ω,witnessProduct D (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)=
        ∫ω,activeWitness D p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
          ∂withinPhasePointMeasure cfg ε M hn s.val.1 p := by
  apply integral_congr_ae
  filter_upwards [rootPoint_boundary_active_ae cfg ε M start e p hn s hp] with ω hω
  simp only [activeWitness,if_pos hω]

theorem rootPoint_boundary_power_mean_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (hp : (s.val.1.val.1.physical.process.accounts p).status=.active) :
    (∫ω,witnessSum w (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)^m
      ∂withinPhasePointMeasure cfg ε M hn s.val.1 p)=
        ∫ω,activeWitnessPower w m p (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)
          ∂withinPhasePointMeasure cfg ε M hn s.val.1 p := by
  apply integral_congr_ae
  filter_upwards [rootPoint_boundary_active_ae cfg ε M start e p hn s hp] with ω hω
  simp only [activeWitnessPower,if_pos hω]

theorem rootPoint_boundary_tail_event_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (w : Grid n→ℝ) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (hp : (s.val.1.val.1.physical.process.accounts p).status=.active) (r : ℝ) :
    let W := rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val
    let ν := withinPhasePointMeasure cfg ε M hn s.val.1 p
    ν.real {ω | r≤witnessSum w (W ω)}=
      ν.real {ω | ((W ω).augmented.physical.process.accounts p).status=.active ∧ r≤witnessSum w (W ω)} := by
  dsimp only
  apply congrArg ENNReal.toReal
  apply measure_congr
  filter_upwards [rootPoint_boundary_active_ae cfg ε M start e p hn s hp] with ω hω
  change (r≤witnessSum w (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω)) =
    (((rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω).augmented.physical.process.accounts p).status=.active ∧
      r≤witnessSum w (rootBoundaryWitness cfg ε M start e p hn (goodRootInitial cfg p s).val ω))
  apply propext
  simp only [hω,true_and]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rootPoint_boundary_active_ae
#print axioms NoThreeLine.BirthWitness.rootPoint_boundary_witness_mean_eq
#print axioms NoThreeLine.BirthWitness.rootPoint_boundary_power_mean_eq
#print axioms NoThreeLine.BirthWitness.rootPoint_boundary_tail_event_eq
