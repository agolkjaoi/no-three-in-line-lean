import NoThreeLine.WitnessFlowRegularity

/-! Domination of the actual uniform-board, uniform-mark candidate mean.
All bounds are derived from Valid and deterministic retention in [0,1]. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem candidateMixedMean_bounds {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n→ℝ) (B : ℝ) (hn : 0<n) (hB : 0<B)
    (ha : a.Valid B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hret : ∀q,0≤retention q ∧ retention q≤1) :
    0≤candidateMixedMean a Γ C D L mask retention B ∧ candidateMixedMean a Γ C D L mask retention B≤mixedCap C B := by
  have hα := a.augmented.physical.process.acceptance_bounds mask B hB hm (fun q _=>ha.1.1.2.1.1 q)
  have hb (q : Grid n) := a.birth_valid B ha Γ q retention (hret q)
  have hterm (q : Grid n) :
      0≤∫mark,mixed Γ C D L (thinnedWitness a Γ mask B q retention mark) ∂markMeasure ∧
      (∫mark,mixed Γ C D L (thinnedWitness a Γ mask B q retention mark) ∂markMeasure)≤mixedCap C B := by
    rw [witness_mark_mean a Γ C D L mask retention B hB ha hm]
    constructor
    · exact add_nonneg (mul_nonneg (hα q).1 (mixed_nonneg _ Γ C D L B (hb q)))
        (mul_nonneg (sub_nonneg.mpr (hα q).2) (mixed_nonneg a Γ C D L B ha))
    · calc
        _ ≤ a.augmented.physical.process.acceptance mask B q*mixedCap C B+
            (1-a.augmented.physical.process.acceptance mask B q)*mixedCap C B := add_le_add
          (mul_le_mul_of_nonneg_left (mixed_le_cap _ Γ C D L B (hb q)) (hα q).1)
          (mul_le_mul_of_nonneg_left (mixed_le_cap a Γ C D L B ha) (sub_nonneg.mpr (hα q).2))
        _ = _ := by ring
  have hn2 : 0<(n:ℝ)^2 := pow_pos (by exact_mod_cast hn) _
  unfold candidateMixedMean
  refine ⟨div_nonneg (Finset.sum_nonneg (fun q _=>(hterm q).1)) hn2.le,?_⟩
  apply (div_le_iff₀ hn2).mpr
  calc
    _ ≤ ∑_q : Grid n,mixedCap C B := Finset.sum_le_sum (fun q _=>(hterm q).2)
    _ = _ := by simp [Grid,pow_two,mul_comm]

theorem integrableOn_of_nonneg_bound {X : Type*} [MeasurableSpace X] (μ : Measure X)
    (E : Set X) (hE : MeasurableSet E) [IsFiniteMeasure (μ.restrict E)] (f : X→ℝ) (hf : Measurable f)
    (B : ℝ) (hb : ∀x∈E,0≤f x ∧ f x≤B) : IntegrableOn f E μ := by
  apply (integrable_const B).mono' hf.aestronglyMeasurable
  filter_upwards [ae_restrict_mem hE] with x hx
  simpa only [Real.norm_eq_abs,abs_of_nonneg (hb x hx).1] using (hb x hx).2

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.candidateMixedMean_bounds
