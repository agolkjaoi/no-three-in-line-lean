import NoThreeLine.ScheduledCutShortStarRepeat
import NoThreeLine.ScheduledCutCoarsePriceCap
import NoThreeLine.ShortStarPairExceptionCounts

/-! Coarse actual cut expectations on an explicitly restricted set of
root-line-distinct tuples; application to the actual long-leaf-pair event.
This does not alter the coefficient-one main estimate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def distinctCoarseCost (δ ε : ℝ) (m : ℕ) : ℝ :=
  (δ^((m+1)^3))⁻¹/(1-ε)^(2*m+1).choose 2

theorem distinctCoarseCost_nonneg (δ ε : ℝ) (hδ : 0≤δ) (hε : ε≤1) (m : ℕ) :
    0≤distinctCoarseCost δ ε m :=
  div_nonneg (inv_nonneg.mpr (pow_nonneg hδ _)) (pow_nonneg (sub_nonneg.mpr hε) _)

theorem initial_scheduledCutPoint_distinct_coarse_bound {n m : ℕ} {B H : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (f : Fin m→↥(shortStars Γ p H)) (hf : RootLinePairwise f) :
    (∫ω,tuplePhysicalProduct f
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
        distinctCoarseCost δ ε m*∏z∈witnessLabels f,cutSelectedCoarsePrice cs start k t z := by
  classical
  by_cases hex : ∃s : ProcessState n,TupleRealized f s
  · have hp : f∈possibleTuples Γ p H m m m := Finset.mem_filter.mpr
      ⟨Finset.mem_univ _,leafLabels_card f hf,witnessLabels_card f hf,hex⟩
    have hh := initial_scheduledCutPoint_repeatTuple_bound cs ε M deadline start K ρ δ p hn hB Γ
      hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht f hp
    simpa only [repeatCoarseCost,distinctCoarseCost,Nat.sub_self,pow_zero,one_mul,two_mul] using hh
  · have hz : (fun ω : BoardClockPath n=>tuplePhysicalProduct f
        (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
          (initialGoodPhaseObservation B hB deadline start) k (ω,t)))=fun _=>0 := by
      funext ω
      by_contra h
      exact hex ⟨_,tuplePhysicalProduct_ne_zero_realized f _
        (scheduledCutWitness_valid cs ε M deadline start _ hn _ k (ω,t)).1.1.1 h⟩
    rw [hz,integral_zero]
    exact mul_nonneg (distinctCoarseCost_nonneg δ ε hδ.le hε.le m)
      (Finset.prod_nonneg (fun z _=>cutSelectedCoarsePrice_nonneg cs start k t ht.1 z))

theorem initial_scheduledCutPoint_distinct_family_bound {n m : ℕ} {B H : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (F : Finset (Fin m→↥(shortStars Γ p H))) (hF : F⊆rootDistinctTuples Γ p H m) :
    (∫ω,(∑f∈F,tuplePhysicalProduct f
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
        distinctCoarseCost δ ε m*((F.card : ℝ)*(coarseCutPriceCap cs k t)^m) := by
  classical
  let W := fun ω=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) k (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p k t
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p k t
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k).comp (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B := scheduledCutWitness_valid cs ε M deadline start _ hn _ k (ω,t)
  have hcost := distinctCoarseCost_nonneg δ ε hδ.le hε.le m
  change (∫ω,(∑f∈F,tuplePhysicalProduct f (W ω)) ∂ν)≤_
  rw [integral_finsetSum _ (fun f _=>tuplePhysicalProduct_integrable f B (zero_le_one.trans hB) ν W hW hv)]
  calc
    _ ≤ ∑f∈F,distinctCoarseCost δ ε m*(coarseCutPriceCap cs k t)^m := by
      apply Finset.sum_le_sum
      intro f hf
      have hd := (mem_rootDistinctTuples Γ p H f).mp (hF hf)
      apply (initial_scheduledCutPoint_distinct_coarse_bound cs ε M deadline start K ρ δ p hn hB Γ
        hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht f hd).trans
      apply mul_le_mul_of_nonneg_left _ hcost
      calc
        _ ≤ ∏_z∈witnessLabels f,coarseCutPriceCap cs k t := Finset.prod_le_prod
          (fun z _=>cutSelectedCoarsePrice_nonneg cs start k t ht.1 z)
          (fun z _=>cutSelectedCoarsePrice_le_cap cs start k t ht.1 z)
        _ = _ := by simp only [Finset.prod_const,witnessLabels_card f hd]
    _ = _ := by simp only [Finset.sum_const,nsmul_eq_mul]; ring

theorem initial_scheduledCutPoint_long_exception_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (H R : ℝ) (hH : 0≤H) (hR : 0<R)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (m : ℕ) :
    (∫ω,(∑f∈longExceptionTuples Γ p H R m,tuplePhysicalProduct f
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      distinctCoarseCost δ ε m*(((m*(m-1) : ℕ) : ℝ)*
        (((shortStars Γ p H).card : ℝ)*(16*H*(n : ℝ)^2/R)*((shortStars Γ p H).card : ℝ)^(m-2))*
          (coarseCutPriceCap cs k t)^m) := by
  apply (initial_scheduledCutPoint_distinct_family_bound cs ε M deadline start K ρ δ p hn hB Γ
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht
    (longExceptionTuples Γ p H R m) (pairExceptionTuples_subset Γ p H _)).trans
  exact mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right
    (longExceptionTuples_card_le Γ p H R hH hR m) (pow_nonneg (coarseCutPriceCap_nonneg cs k t ht.1) _))
    (distinctCoarseCost_nonneg δ ε hδ.le hε.le m)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_distinct_family_bound
#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_long_exception_bound
