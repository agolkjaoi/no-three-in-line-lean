import NoThreeLine.ShortStarMaskedPower

/-! Measurability and a finite deterministic cap for the actual masked
short-star intensity. These supply the full-future cut tower hypotheses. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

theorem weightedStarIntensity_measurable {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (w : ↥(shortStars Γ p H)→ℝ) : Measurable (weightedStarIntensity Γ p H w) := by
  classical
  have he : weightedStarIntensity Γ p H w=(fun a=>weightedPhysicalTupleSum Γ p H 1 w a) := by
    funext a
    simpa only [pow_one] using (weighted_tuple_sum_eq_power Γ p H 1 (by decide) w a).symm
  rw [he]
  exact Finset.measurable_sum _ (fun f _=>(tuplePhysicalProduct_measurable f).const_mul (tupleWeight w f))

theorem weightedStarIntensity_bounds {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1)
    (a : WitnessState n) (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    0≤weightedStarIntensity Γ p H w a ∧
      weightedStarIntensity Γ p H w a≤((shortStars Γ p H).card : ℝ)*B := by
  classical
  have he : weightedStarIntensity Γ p H w a=weightedPhysicalTupleSum Γ p H 1 w a := by
    simpa only [pow_one] using (weighted_tuple_sum_eq_power Γ p H 1 (by decide) w a).symm
  rw [he]
  constructor
  · exact Finset.sum_nonneg (fun f _=>mul_nonneg (tupleWeight_bounds w hw f).1
      (tuplePhysicalProduct_bounds f a B hB ha).1)
  · calc
      _ ≤ ∑_f : Fin 1→↥(shortStars Γ p H),B := by
        apply Finset.sum_le_sum
        intro f _
        have hh := (mul_le_of_le_one_left (tuplePhysicalProduct_bounds f a B hB ha).1
          (tupleWeight_bounds w hw f).2).trans (tuplePhysicalProduct_bounds f a B hB ha).2
        simpa only [pow_one] using hh
      _ = _ := by simp

theorem weightedStarIntensity_pow_integrable {Ω : Type*} [MeasurableSpace Ω]
    {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1) (m : ℕ)
    (B : ℝ) (hB : 0≤B) (μ : Measure Ω) [IsFiniteMeasure μ]
    (W : Ω→WitnessState n) (hW : Measurable W) (hV : ∀ω,(W ω).Valid B) :
    Integrable (fun ω=>weightedStarIntensity Γ p H w (W ω)^m) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    (((weightedStarIntensity_measurable Γ p H w).comp hW).pow_const m)
    ((((shortStars Γ p H).card : ℝ)*B)^m)
    (fun ω=>⟨pow_nonneg (weightedStarIntensity_bounds Γ p H w hw (W ω) B hB (hV ω)).1 m,
      pow_le_pow_left₀ (weightedStarIntensity_bounds Γ p H w hw (W ω) B hB (hV ω)).1
        (weightedStarIntensity_bounds Γ p H w hw (W ω) B hB (hV ω)).2 m⟩)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.weightedStarIntensity_measurable
#print axioms NoThreeLine.ShortStars.weightedStarIntensity_bounds
#print axioms NoThreeLine.ShortStars.weightedStarIntensity_pow_integrable
