import NoThreeLine.RecycledBoardProcess
import NoThreeLine.NoiseTransitionLaw

/-! Reusing residual noise agrees with a transition on a possibly different
noise space, provided the actual one-step joint law returns independent noise. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.RecycledBoardProcess

theorem section_state_map {S W V : Type*}
    [MeasurableSpace S] [MeasurableSpace W] [MeasurableSpace V]
    (F : S × W → S × W) (hF : Measurable F) (ψ : S × V → S)
    (ν : Measure W) (ρ : Measure V) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun w => F (s,w)) =
      (ρ.map (fun v => ψ (s,v))).prod ν) (s : S) :
    ν.map (fun w => (F (s,w)).1) = ρ.map (fun v => ψ (s,v)) := by
  have h := congrArg (fun μ : Measure (S × W) => μ.map Prod.fst) (hsection s)
  have hs : Measurable (fun w : W => F (s,w)) :=
    hF.comp (measurable_const.prodMk measurable_id)
  rw [Measure.map_map measurable_fst hs,Measure.map_fst_prod,measure_univ,one_smul] at h
  exact h

theorem iterate_map_other_noise {S W V : Type*}
    [MeasurableSpace S] [MeasurableSpace W] [MeasurableSpace V]
    (F : S × W → S × W) (hF : Measurable F) (ψ : S × V → S) (hψ : Measurable ψ)
    (ν : Measure W) (ρ : Measure V) [IsProbabilityMeasure ν] [IsProbabilityMeasure ρ]
    (hsection : ∀ s, ν.map (fun w => F (s,w)) =
      (ρ.map (fun v => ψ (s,v))).prod ν) (s : S) (k : ℕ) :
    ν.map (iterate F s k) = (FiniteTransitionLaw.stateLaw ψ ρ s k).prod ν := by
  have heq := section_state_map F hF ψ ν ρ hsection
  have hself (s : S) : ν.map (fun w => F (s,w)) =
      (ν.map (fun w => (F (s,w)).1)).prod ν := by
    rw [heq s]
    exact hsection s
  rw [iterate_map F hF ν hself s k,
    stateLaw_eq_of_transition_laws (fun a => (F a).1) ψ hF.fst hψ ν ρ heq s k]

end NoThreeLine.RecycledBoardProcess

#print axioms NoThreeLine.RecycledBoardProcess.iterate_map_other_noise
