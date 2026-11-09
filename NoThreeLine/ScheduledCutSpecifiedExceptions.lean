import NoThreeLine.ScheduledCutStarExceptions

/-! Exception (i): the four actual cross-label specified relations are
retained, and the proved G3 pair count supplies the coarse cut expectation. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def specifiedExceptionTuples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (m : ℕ) :=
  pairExceptionTuples Γ p H m (specifiedPairs Γ p H)

theorem mem_specifiedExceptionTuples {n m : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (f : Fin m→↥(shortStars Γ p H)) :
    f∈specifiedExceptionTuples Γ p H m ↔ RootLinePairwise f ∧ ¬NoSpecifiedCrossPairs f := by
  classical
  have he (i j : Fin m) : ((f i).val,(f j).val)∈specifiedPairs Γ p H ↔
      SpecifiedOverlap Γ (f i).val (f j).val := by
    simp [specifiedPairs,(f i).property,(f j).property]
  simp [specifiedExceptionTuples,pairExceptionTuples,NoSpecifiedCrossPairs,he]

def specifiedExceptionConstant (ξ : ℝ) (hξ : 0<ξ) : ℝ :=
  Classical.choose (specifiedPairs_card_le_const_rpow ξ hξ)

theorem specifiedExceptionConstant_pos (ξ : ℝ) (hξ : 0<ξ) :
    0<specifiedExceptionConstant ξ hξ := (Classical.choose_spec (specifiedPairs_card_le_const_rpow ξ hξ)).1

theorem specifiedExceptionTuples_card_le (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (m : ℕ) :
    ((specifiedExceptionTuples Γ p H m).card : ℝ)≤
      ((m*(m-1) : ℕ) : ℝ)*(((shortStars Γ p H).card : ℝ)*
        (specifiedExceptionConstant ξ hξ*(Γ.card : ℝ)*(n : ℝ)^(1+ξ))*
          ((shortStars Γ p H).card : ℝ)^(m-2)) := by
  have hpair := (Classical.choose_spec (specifiedPairs_card_le_const_rpow ξ hξ)).2 n Γ p H
  have hcount : ((specifiedExceptionTuples Γ p H m).card : ℝ)≤
      ((m*(m-1) : ℕ) : ℝ)*((specifiedPairs Γ p H).card*
        ((shortStars Γ p H).card : ℝ)^(m-2)) := by
    exact_mod_cast pairExceptionTuples_card_le Γ p H m (specifiedPairs Γ p H)
  exact hcount.trans (mul_le_mul_of_nonneg_left
    (mul_le_mul_of_nonneg_right hpair (by positivity)) (Nat.cast_nonneg _))

theorem initial_scheduledCutPoint_specified_exception_bound {n : ℕ} {B : ℝ}
    (ξ : ℝ) (hξ : 0<ξ) (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (H : ℝ)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (m : ℕ) :
    (∫ω,(∑f∈specifiedExceptionTuples Γ p H m,tuplePhysicalProduct f
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      distinctCoarseCost δ ε m*(((m*(m-1) : ℕ) : ℝ)*
        (((shortStars Γ p H).card : ℝ)*
          (specifiedExceptionConstant ξ hξ*(Γ.card : ℝ)*(n : ℝ)^(1+ξ))*
            ((shortStars Γ p H).card : ℝ)^(m-2))*(coarseCutPriceCap cs k t)^m) := by
  apply (initial_scheduledCutPoint_distinct_family_bound cs ε M deadline start K ρ δ p hn hB Γ
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht
    (specifiedExceptionTuples Γ p H m) (pairExceptionTuples_subset Γ p H _)).trans
  exact mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right
    (specifiedExceptionTuples_card_le ξ hξ Γ p H m) (pow_nonneg (coarseCutPriceCap_nonneg cs k t ht.1) _))
    (distinctCoarseCost_nonneg δ ε hδ.le hε.le m)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.specifiedExceptionConstant_pos
#print axioms NoThreeLine.ShortStars.mem_specifiedExceptionTuples
#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_specified_exception_bound
