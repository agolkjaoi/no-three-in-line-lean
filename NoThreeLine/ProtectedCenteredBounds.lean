import NoThreeLine.ProtectedCenteredTimed

/-! Fixed-incoming finite bounds for the real elapsed-source centered square.
The compact source bound is internal; no uniform-in-incoming bound is claimed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedRunningScalarSource_exists_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (S : ℝ→ℝ) (hS : Continuous S) :
    ∃C:ℝ,0≤C ∧ ∀z,‖protectedRunningScalarSource cfg ε M s S z‖≤C := by
  let T := augGuardTime cfg ε M (augTimedInput cfg s)
  have hT := augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1
  obtain ⟨C,hC⟩ := isCompact_Icc.exists_bound_of_continuousOn
    (s:=Icc (0:ℝ) T) (sourcePrimitive_continuous S hS).continuousOn
  have hC0 : 0≤C := (norm_nonneg (sourcePrimitive S 0)).trans (hC 0 ⟨le_rfl,hT.1⟩)
  refine ⟨C,hC0,fun z=>?_⟩
  unfold protectedRunningScalarSource
  split_ifs
  · simpa only [norm_zero] using hC0
  · change ‖sourcePrimitive S (augAdvance cfg ε M (augTimedInput cfg s,z.1.1))‖≤C
    exact hC _ (augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1)

theorem protectedTimedWeightedCenteredSquare_exists_bound {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n))
    (hE : E⊆L.val) (A S : ℝ→ℝ) (D : ℝ)
    (hAD : ∀c∈Icc (0:ℝ) (2*cfg.B),0≤A c ∧ A c≤D) (hS : Continuous S)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    ∃R:ℝ,∀z,0≤protectedTimedWeightedCenteredSquare cfg ε M L E A S s z ∧
      protectedTimedWeightedCenteredSquare cfg ε M L E A S s z≤R := by
  obtain ⟨C,hC0,hC⟩ := protectedRunningScalarSource_exists_bound cfg ε M s.1 S hS
  refine ⟨(2/(2-K))^2*((E.card:ℝ)*D+C)^2,fun z=>?_⟩
  let v := protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z))
  have hv (p : Grid n) (hp : p∈E) : 0≤v.2 p ∧ v.2 p≤2*cfg.B :=
    protectedLineSave_timed_bounds_all cfg ε M L hsp p (hE hp) s (hsv p hp) z
  have hb := protectedScalarTotal_bounds L E A cfg.B D cfg.directions hsp hE
    v.1.val.1.physical v.1.property.1.1 v.2 hv hAD
  have hl := augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk z
  have hnorm : ‖protectedScalarTotal L E A v.1.val.1.physical v.2-
      protectedRunningScalarSource cfg ε M s.1 S z‖≤(E.card:ℝ)*D+C := by
    apply (norm_sub_le _ _).trans
    apply add_le_add _ (hC z)
    simpa only [Real.norm_eq_abs,abs_of_nonneg hb.1] using hb.2
  have hsq : (protectedScalarTotal L E A v.1.val.1.physical v.2-
      protectedRunningScalarSource cfg ε M s.1 S z)^2≤((E.card:ℝ)*D+C)^2 := by
    simpa only [Real.norm_eq_abs,sq_abs] using pow_le_pow_left₀ (norm_nonneg _) hnorm 2
  exact ⟨mul_nonneg hl.1 (sq_nonneg _),
    mul_le_mul hl.2 hsq (sq_nonneg _) (sq_nonneg _)⟩

theorem protectedTimedWeightedCenteredSquare_integrable {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n))
    (hE : E⊆L.val) (A S : ℝ→ℝ) (D : ℝ)
    (hAD : ∀c∈Icc (0:ℝ) (2*cfg.B),0≤A c ∧ A c≤D)
    (hA : Measurable A) (hS : Continuous S) (s : ProtectedTimedState cfg)
    (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (μ : Measure (CandidateData n)) [IsFiniteMeasure μ] :
    Integrable (protectedTimedWeightedCenteredSquare cfg ε M L E A S s) μ := by
  obtain ⟨R,hR⟩ := protectedTimedWeightedCenteredSquare_exists_bound cfg ε M K hKcfg hK
    L hsp E hE A S D hAD hS s hN hk hsv
  exact GenericCreditIteration.bounded_nonnegative_integrable μ _
    (protectedTimedWeightedCenteredSquare_measurable cfg ε M L E A S hA hS s) R hR

end NoThreeLine

#print axioms NoThreeLine.protectedRunningScalarSource_exists_bound
#print axioms NoThreeLine.protectedTimedWeightedCenteredSquare_exists_bound
#print axioms NoThreeLine.protectedTimedWeightedCenteredSquare_integrable
