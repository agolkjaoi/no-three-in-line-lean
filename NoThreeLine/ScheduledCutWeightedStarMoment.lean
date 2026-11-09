import NoThreeLine.ScheduledCutWeightedStarMain
import NoThreeLine.ScheduledCutShortStarMoment

/-! Full tuple bound with a deterministic weight on each star. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

attribute [local irreducible] tuplePhysicalProduct mainTupleObservable extraTupleObservable
  rootDistinctTuples repeatedTuples countTuples repeatIndices specifiedExceptionTuples
  longExceptionTuples witnessExceptionTuples scheduledCutWitness

theorem initial_scheduledCutPoint_weightedAllTuple_bound {n : ℕ} {B : ℝ}
    (ξ : ℝ) (hξ : 0<ξ) (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H R : ℝ) (hH : 0≤H) (hR : 0<R)
    (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (m : ℕ) :
    (∫ω,weightedPhysicalTupleSum Γ p H m w
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      shortStarMomentBudget ξ hξ n Γ.card (shortStars Γ p H).card B δ ε H R
        (weightedCutStarPriceSum Γ p H w cs k t)
        (∑star∈shortStars Γ p H,cutSelectedCoarsePrice cs start k t star.2)
        (coarseCutPriceCap cs k t) m := by
  classical
  let W := fun ω=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) k (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p k t
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p k t
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k).comp (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B := scheduledCutWitness_valid cs ε M deadline start _ hn _ k (ω,t)
  have he (ω : BoardClockPath n) : EmptyLineCredit (W ω).augmented.physical :=
    scheduledCutWitness_emptyLineCredit cs ε M deadline start _ hn _ k (ω,t)
  have hu (ω : BoardClockPath n) (q : Grid n) : (W ω).retained q=
      if q∈(W ω).augmented.physical.process.selected then 1 else 0 :=
    scheduledCutWitness_unit_retained cs ε M deadline start hn _ k (ω,t) q
  have hclass := integral_weighted_all_le_main_repeat_exceptions Γ p H R m w hw B
    (zero_le_one.trans hB) ν W hW hv he hu
  have hm := initial_scheduledCutPoint_weightedMain_bound (Γ:=Γ) (p:=p) (H:=H)
    m R w (fun s=>(hw s).1) cs ε M deadline start hn hB hΓ
    (fun j=>(hK j).trans_lt hK2) hε0 hε k t ht
  have hr : (∑aj∈repeatIndices m,
      ∫ω,(∑f∈countTuples Γ p H m aj.1 aj.2,tuplePhysicalProduct f (W ω)) ∂ν)≤
      repeatMomentBudget B δ ε H (∑star∈shortStars Γ p H,cutSelectedCoarsePrice cs start k t star.2) m := by
    apply Finset.sum_le_sum
    intro aj _
    exact initial_scheduledCutPoint_countTuple_sum_bound cs ε M deadline start K ρ δ p hn hB Γ H hH
      hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht m aj.1 aj.2
  have h1 := initial_scheduledCutPoint_specified_exception_bound ξ hξ cs ε M deadline start K ρ δ p hn hB Γ H
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht m
  have h2 := initial_scheduledCutPoint_long_exception_bound cs ε M deadline start K ρ δ p hn hB Γ H R hH hR
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht m
  have h3 := initial_scheduledCutPoint_extra_exception_bound cs ε M deadline start K ρ δ p hn hB Γ H R hR.le
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht m
  have h4 := initial_scheduledCutPoint_witness_exception_bound ξ hξ cs ε M deadline start K ρ δ p hn hB Γ H
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht m
  exact hclass.trans (add_le_add (add_le_add (add_le_add (add_le_add (add_le_add hm hr) h1) h2) h3) h4)

def maskedCutStarPriceSum {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (cs : ℕ→SharedPhase n B) (k : ℕ) (t : ℝ) : ℝ :=
  ∑s∈shortStars Γ p H,(cs k).mask s.1*cutUnitPrice cs k t s.2

theorem current_mask_row_eq {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (cs : ℕ→SharedPhase n B) (k : ℕ) (t : ℝ) :
    weightedCutStarPriceSum Γ p H (fun s=>(cs k).mask s.val.1) cs k t=
      maskedCutStarPriceSum Γ p H cs k t :=
  Finset.sum_coe_sort (shortStars Γ p H) (fun s=>(cs k).mask s.1*cutUnitPrice cs k t s.2)

theorem initial_scheduledCutPoint_currentMaskTuple_bound {n : ℕ} {B : ℝ}
    (ξ : ℝ) (hξ : 0<ξ) (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H R : ℝ) (hH : 0≤H) (hR : 0<R)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (m : ℕ) :
    (∫ω,weightedPhysicalTupleSum Γ p H m (fun s=>(cs k).mask s.val.1)
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      shortStarMomentBudget ξ hξ n Γ.card (shortStars Γ p H).card B δ ε H R
        (maskedCutStarPriceSum Γ p H cs k t)
        (∑star∈shortStars Γ p H,cutSelectedCoarsePrice cs start k t star.2)
        (coarseCutPriceCap cs k t) m := by
  rw [←current_mask_row_eq Γ p H cs k t]
  exact initial_scheduledCutPoint_weightedAllTuple_bound ξ hξ cs ε M deadline start K ρ δ p hn hB Γ H R hH hR
    (fun s=>(cs k).mask s.val.1) (fun s=>⟨(cs k).mask_nonneg s.val.1,(cs k).mask_le_one s.val.1⟩)
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht m

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_weightedAllTuple_bound
#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_currentMaskTuple_bound
