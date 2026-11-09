import NoThreeLine.FiniteTripleRestriction
import NoThreeLine.ScheduledCutStarExceptions

/-! Exception (iv): an existing third tuple witness lies on the line of
the first two leaves. The actual three-slot event is retained in the sum. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness FiniteTuplePattern

def witnessExceptionTuples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (m : ℕ) :
    Finset (Fin m→↥(shortStars Γ p H)) := by
  classical
  exact (rootDistinctTuples Γ p H m).filter (fun f=>∃i j k : Fin m,i≠j ∧ k≠i ∧ k≠j ∧
    (((f i).val,(f j).val),(f k).val)∈witnessTriples Γ p H)

theorem mem_witnessExceptionTuples {n m : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (f : Fin m→↥(shortStars Γ p H)) :
    f∈witnessExceptionTuples Γ p H m ↔ RootLinePairwise f ∧ ¬NoThirdWitnessException f := by
  classical
  simp [witnessExceptionTuples,NoThirdWitnessException]

def witnessExceptionConstant (ξ : ℝ) (hξ : 0<ξ) : ℝ :=
  Classical.choose (witnessTriples_card_le_const_rpow ξ hξ)

theorem witnessExceptionConstant_pos (ξ : ℝ) (hξ : 0<ξ) :
    0<witnessExceptionConstant ξ hξ := (Classical.choose_spec (witnessTriples_card_le_const_rpow ξ hξ)).1

theorem witnessExceptionTuples_card_le (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (m : ℕ) :
    ((witnessExceptionTuples Γ p H m).card : ℝ)≤
      ((m^3 : ℕ) : ℝ)*(((shortStars Γ p H).card : ℝ)^2*
        (witnessExceptionConstant ξ hξ*(n : ℝ)^(1+ξ))*
          ((shortStars Γ p H).card : ℝ)^(m-3)) := by
  classical
  have hs : witnessExceptionTuples Γ p H m⊆someTripleRestricted m
      (Subtype.val : ↥(shortStars Γ p H)→Grid n×Grid n) (witnessTriples Γ p H) := by
    intro f hf
    exact (mem_someTripleRestricted m _ _ f).mpr (Finset.mem_filter.mp hf).2
  have hnat : (witnessExceptionTuples Γ p H m).card≤
      m^3*((witnessTriples Γ p H).card*(shortStars Γ p H).card^(m-3)) :=
    (Finset.card_le_card hs).trans (by
      simpa only [Fintype.card_coe] using someTripleRestricted_card_le m
        (Subtype.val : ↥(shortStars Γ p H)→Grid n×Grid n) Subtype.val_injective (witnessTriples Γ p H))
  have hc : ((witnessExceptionTuples Γ p H m).card : ℝ)≤
      ((m^3 : ℕ) : ℝ)*((witnessTriples Γ p H).card*((shortStars Γ p H).card : ℝ)^(m-3)) := by
    exact_mod_cast hnat
  have htrip := (Classical.choose_spec (witnessTriples_card_le_const_rpow ξ hξ)).2 n Γ p H
  exact hc.trans (mul_le_mul_of_nonneg_left
    (mul_le_mul_of_nonneg_right htrip (by positivity)) (Nat.cast_nonneg _))

theorem initial_scheduledCutPoint_witness_exception_bound {n : ℕ} {B : ℝ}
    (ξ : ℝ) (hξ : 0<ξ) (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (H : ℝ)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (m : ℕ) :
    (∫ω,(∑f∈witnessExceptionTuples Γ p H m,tuplePhysicalProduct f
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      distinctCoarseCost δ ε m*(((m^3 : ℕ) : ℝ)*
        (((shortStars Γ p H).card : ℝ)^2*
          (witnessExceptionConstant ξ hξ*(n : ℝ)^(1+ξ))*
            ((shortStars Γ p H).card : ℝ)^(m-3))*(coarseCutPriceCap cs k t)^m) := by
  classical
  apply (initial_scheduledCutPoint_distinct_family_bound cs ε M deadline start K ρ δ p hn hB Γ
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht
    (witnessExceptionTuples Γ p H m) (Finset.filter_subset _ _)).trans
  exact mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right
    (witnessExceptionTuples_card_le ξ hξ Γ p H m) (pow_nonneg (coarseCutPriceCap_nonneg cs k t ht.1) _))
    (distinctCoarseCost_nonneg δ ε hδ.le hε.le m)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.witnessExceptionConstant_pos
#print axioms NoThreeLine.ShortStars.mem_witnessExceptionTuples
#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_witness_exception_bound
