import NoThreeLine.ScheduledCutShortStarMain

/-! Finite weighted summation of the main short-star tuples. The actual
root-line-distinct filter and each tuple's concrete event remain on the
left. Nonnegative prices allow expansion to all tuples only on the right. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def rootDistinctTuples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (m : ℕ) :
    Finset (Fin m→↥(shortStars Γ p H)) := by
  classical
  exact Finset.univ.filter RootLinePairwise

@[simp] theorem mem_rootDistinctTuples {n m : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (f : Fin m→↥(shortStars Γ p H)) : f∈rootDistinctTuples Γ p H m ↔ RootLinePairwise f := by
  classical
  simp [rootDistinctTuples]

def mainTupleSum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) (m : ℕ)
    (a : WitnessState n) : ℝ := ∑f∈rootDistinctTuples Γ p H m,mainTupleObservable f R a

def cutStarPriceSum {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (cs : ℕ→SharedPhase n B) (N : ℕ) (t : ℝ) : ℝ :=
  ∑s∈shortStars Γ p H,cutUnitPrice cs N t s.2

theorem sum_distinct_tuple_price_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (m : ℕ)
    (price : Grid n→ℝ) (hprice : ∀q,0≤price q) :
    (∑f∈rootDistinctTuples Γ p H m,∏i : Fin m,price (f i).val.2)≤
      (∑s∈shortStars Γ p H,price s.2)^m := by
  classical
  calc
    _ ≤ ∑f : Fin m→↥(shortStars Γ p H),∏i : Fin m,price (f i).val.2 :=
      Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _)
        (fun f _ _=>Finset.prod_nonneg (fun i _=>hprice (f i).val.2))
    _ = (∑s : ↥(shortStars Γ p H),price s.val.2)^m :=
      (Fintype.sum_pow (fun s : ↥(shortStars Γ p H)=>price s.val.2) m).symm
    _ = _ := congrArg (fun x : ℝ=>x^m)
      (Finset.sum_coe_sort (shortStars Γ p H) (fun s : Grid n×Grid n=>price s.2))

theorem initial_scheduledCutPoint_mainTupleSum_bound {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H B : ℝ}
    (m : ℕ) (R : ℝ) (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (N : ℕ) (t : ℝ) (ht : t∈Set.Icc (0:ℝ) (cs N).horizon) :
    (∫ω,mainTupleSum Γ p H R m
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t)≤
      (cutStarPriceSum Γ p H cs N t)^m/(1-ε)^((2*m+1).choose 2) := by
  classical
  let W := fun ω=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) N (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p N t
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p N t
  have hW : Measurable W :=
    (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N).comp (measurable_id.prodMk measurable_const)
  have hV (ω : BoardClockPath n) : (W ω).Valid B := scheduledCutWitness_valid cs ε M deadline start _ hn _ N (ω,t)
  have hE (ω : BoardClockPath n) : EmptyLineCredit (W ω).augmented.physical :=
    scheduledCutWitness_emptyLineCredit cs ε M deadline start _ hn _ N (ω,t)
  have hunit (ω : BoardClockPath n) (q : Grid n) : (W ω).retained q=
      if q∈(W ω).augmented.physical.process.selected then 1 else 0 :=
    scheduledCutWitness_unit_retained cs ε M deadline start hn _ N (ω,t) q
  have hi (f : Fin m→↥(shortStars Γ p H)) (hf : f∈rootDistinctTuples Γ p H m) :
      Integrable (fun ω=>mainTupleObservable f R (W ω)) ν :=
    mainTupleObservable_integrable f ((mem_rootDistinctTuples Γ p H f).mp hf) R B ν W hW hV hE hunit
  change (∫ω,∑f∈rootDistinctTuples Γ p H m,mainTupleObservable f R (W ω) ∂ν)≤_
  rw [integral_finsetSum _ hi]
  calc
    _ ≤ ∑f∈rootDistinctTuples Γ p H m,
        (∏i : Fin m,cutUnitPrice cs N t (f i).val.2)/(1-ε)^((2*m+1).choose 2) := by
      apply Finset.sum_le_sum
      intro f hf
      exact initial_scheduledCutPoint_mainTuple_bound f ((mem_rootDistinctTuples Γ p H f).mp hf)
        R cs ε M deadline start hn hB hΓ hK hε0 hε N t ht
    _ = (∑f∈rootDistinctTuples Γ p H m,∏i : Fin m,cutUnitPrice cs N t (f i).val.2)/
        (1-ε)^((2*m+1).choose 2) := (Finset.sum_div _ _ _).symm
    _ ≤ _ := div_le_div_of_nonneg_right
      (sum_distinct_tuple_price_le Γ p H m (cutUnitPrice cs N t) (cutUnitPrice_nonneg cs N t ht.1))
      (pow_nonneg (sub_nonneg.mpr hε.le) _)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.sum_distinct_tuple_price_le
#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_mainTupleSum_bound
