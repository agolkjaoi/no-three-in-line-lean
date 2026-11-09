import NoThreeLine.ScheduledCutWeightedStarMoment

/-! Actual masked short-star intensity and its exact finite tuple expansion. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def starTerm {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (w : ↥(shortStars Γ p H)→ℝ) (a : WitnessState n) (s : ↥(shortStars Γ p H)) : ℝ :=
  w s*activeLeafWeight s.val.1 a*a.augmented.physical.lineCredits (starRootLine s)*
    (if s.val.2∈a.augmented.physical.process.selected then 1 else 0)

def weightedStarIntensity {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (w : ↥(shortStars Γ p H)→ℝ) (a : WitnessState n) : ℝ :=
  (if p∈a.augmented.physical.process.activeEvents then 1 else 0)*
    ∑s : ↥(shortStars Γ p H),starTerm w a s

theorem weighted_tuple_sum_eq_indicator_pow {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (m : ℕ) (w : ↥(shortStars Γ p H)→ℝ) (a : WitnessState n) :
    weightedPhysicalTupleSum Γ p H m w a=
      (if p∈a.augmented.physical.process.activeEvents then 1 else 0)*
        (∑s : ↥(shortStars Γ p H),starTerm w a s)^m := by
  classical
  rw [Fintype.sum_pow,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro f _
  simp only [starTerm,Finset.prod_mul_distrib,tupleWeight,tuplePhysicalProduct]
  ring

theorem weighted_tuple_sum_eq_power {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (m : ℕ) (hm : 0<m) (w : ↥(shortStars Γ p H)→ℝ) (a : WitnessState n) :
    weightedPhysicalTupleSum Γ p H m w a=weightedStarIntensity Γ p H w a^m := by
  rw [weighted_tuple_sum_eq_indicator_pow]
  unfold weightedStarIntensity
  by_cases hp : p∈a.augmented.physical.process.activeEvents
  · simp only [if_pos hp,one_mul]
  · simp only [if_neg hp,zero_mul,zero_pow (Nat.ne_of_gt hm)]

theorem masked_price_row_eq_input {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (cs : ℕ→SharedPhase n B) (k : ℕ) (t : ℝ) :
    maskedCutStarPriceSum Γ p H cs k t=
      (∑s∈shortStars Γ p H,(cs k).mask s.1*
        ((∑j∈Finset.range k,(cs j).horizon*(cs j).mask s.2)+t*(cs k).mask s.2))/n := by
  classical
  unfold maskedCutStarPriceSum cutUnitPrice
  simp_rw [←mul_div_assoc]
  exact (Finset.sum_div _ _ _).symm

attribute [local irreducible] scheduledCutWitness weightedStarIntensity weightedPhysicalTupleSum

theorem initial_scheduledCutPoint_maskedIntensity_moment {n : ℕ} {B : ℝ}
    (ξ : ℝ) (hξ : 0<ξ) (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H R : ℝ) (hH : 0≤H) (hR : 0<R)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (m : ℕ) (hm : 0<m) :
    (∫ω,(weightedStarIntensity Γ p H (fun s=>(cs k).mask s.val.1)
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))^m
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      shortStarMomentBudget ξ hξ n Γ.card (shortStars Γ p H).card B δ ε H R
        (maskedCutStarPriceSum Γ p H cs k t)
        (∑star∈shortStars Γ p H,cutSelectedCoarsePrice cs start k t star.2)
        (coarseCutPriceCap cs k t) m := by
  simpa only [weighted_tuple_sum_eq_power Γ p H m hm] using
    initial_scheduledCutPoint_currentMaskTuple_bound ξ hξ cs ε M deadline start K ρ δ p hn hB Γ H R hH hR
      hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht m

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.weighted_tuple_sum_eq_power
#print axioms NoThreeLine.ShortStars.masked_price_row_eq_input
#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_maskedIntensity_moment
