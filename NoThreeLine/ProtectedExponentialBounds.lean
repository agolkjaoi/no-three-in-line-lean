import NoThreeLine.ProtectedTimedExponential
import NoThreeLine.ProtectedCenteredBounds

/-! Fixed-incoming finite bounds for the actual compensated exponential.
Both elapsed primitives are bounded on the actual compact guard interval.
The scalar parameter may have either sign; this is not a sharp tail bound. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedTimedWeightedExponential_exists_bound {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n))
    (hE : E⊆L.val) (A S V : ℝ→ℝ) (θ D : ℝ)
    (hAD : ∀c∈Icc (0:ℝ) (2*cfg.B),0≤A c ∧ A c≤D)
    (hS : Continuous S) (hV : Continuous V)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    ∃R:ℝ,∀z,0≤protectedTimedWeightedExponential cfg ε M L E A S V θ s z ∧
      protectedTimedWeightedExponential cfg ε M L E A S V θ s z≤R := by
  obtain ⟨C,hC0,hC⟩ := protectedRunningScalarSource_exists_bound cfg ε M s.1 S hS
  obtain ⟨F,hF0,hF⟩ := protectedRunningScalarSource_exists_bound cfg ε M s.1 V hV
  refine ⟨(2/(2-K))^2*Real.exp (|θ| *((E.card:ℝ)*D+C)+(θ^2/2)*F),fun z=>?_⟩
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
  have hθ : θ*(protectedScalarTotal L E A v.1.val.1.physical v.2-
      protectedRunningScalarSource cfg ε M s.1 S z)≤|θ| *((E.card:ℝ)*D+C) := by
    apply (le_abs_self _).trans
    rw [abs_mul]
    exact mul_le_mul_of_nonneg_left (by simpa only [Real.norm_eq_abs] using hnorm) (abs_nonneg θ)
  have hcoef : 0≤θ^2/2 := div_nonneg (sq_nonneg θ) (by norm_num)
  have henergy : -((θ^2/2)*protectedRunningScalarSource cfg ε M s.1 V z)≤(θ^2/2)*F := by
    apply (neg_le_abs _).trans
    rw [abs_mul,abs_of_nonneg hcoef]
    exact mul_le_mul_of_nonneg_left (by simpa only [Real.norm_eq_abs] using hF z) hcoef
  have hexp : protectedTimedExponential cfg ε M L E A S V θ s z≤
      Real.exp (|θ| *((E.card:ℝ)*D+C)+(θ^2/2)*F) := by
    apply Real.exp_le_exp.mpr
    change θ*(protectedScalarTotal L E A v.1.val.1.physical v.2-
      protectedRunningScalarSource cfg ε M s.1 S z)-
        (θ^2/2)*protectedRunningScalarSource cfg ε M s.1 V z≤_
    linarith
  exact ⟨mul_nonneg hl.1 (Real.exp_nonneg _),
    mul_le_mul hl.2 hexp (Real.exp_nonneg _) (sq_nonneg _)⟩

theorem protectedTimedWeightedExponential_integrable {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n))
    (hE : E⊆L.val) (A S V : ℝ→ℝ) (θ D : ℝ)
    (hAD : ∀c∈Icc (0:ℝ) (2*cfg.B),0≤A c ∧ A c≤D)
    (hA : Measurable A) (hS : Continuous S) (hV : Continuous V)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (μ : Measure (CandidateData n)) [IsFiniteMeasure μ] :
    Integrable (protectedTimedWeightedExponential cfg ε M L E A S V θ s) μ := by
  obtain ⟨R,hR⟩ := protectedTimedWeightedExponential_exists_bound cfg ε M K hKcfg hK
    L hsp E hE A S V θ D hAD hS hV s hN hk hsv
  exact GenericCreditIteration.bounded_nonnegative_integrable μ _
    (protectedTimedWeightedExponential_measurable cfg ε M L E A S V θ hA hS hV s) R hR

end NoThreeLine

#print axioms NoThreeLine.protectedTimedWeightedExponential_exists_bound
#print axioms NoThreeLine.protectedTimedWeightedExponential_integrable
