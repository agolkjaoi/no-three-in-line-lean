import NoThreeLine.ShortStarFullIntegral

/-! Full finite short-star tuple moment under the actual scheduled cut law.
The main term has coefficient one. Repetition and the four exceptional
families have separate explicit coarse budgets. No asymptotic claim here. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def repeatMomentBudget (B δ ε H U : ℝ) (m : ℕ) : ℝ :=
  ∑aj∈repeatIndices m,repeatCoarseCost B δ ε m aj.1 aj.2*
    ((repeatPatternCount m aj.1 aj.2 : ℝ)*H^(aj.1-aj.2)*U^aj.2)

def specifiedMomentBudget (ξ : ℝ) (hξ : 0<ξ) (n g : ℕ) (S δ ε P : ℝ) (m : ℕ) : ℝ :=
  distinctCoarseCost δ ε m*(((m*(m-1) : ℕ) : ℝ)*
    (S*(specifiedExceptionConstant ξ hξ*(g : ℝ)*(n : ℝ)^(1+ξ))*S^(m-2))*P^m)

def longMomentBudget (n : ℕ) (S H R δ ε P : ℝ) (m : ℕ) : ℝ :=
  distinctCoarseCost δ ε m*(((m*(m-1) : ℕ) : ℝ)*(S*(16*H*(n : ℝ)^2/R)*S^(m-2))*P^m)

def extraMomentBudget (S R δ ε P : ℝ) (m : ℕ) : ℝ :=
  extraCoarseCost δ ε m*(((m*(m-1) : ℕ) : ℝ)*(S^2*R*S^(m-2))*P^(m+1))

def witnessMomentBudget (ξ : ℝ) (hξ : 0<ξ) (n : ℕ) (S δ ε P : ℝ) (m : ℕ) : ℝ :=
  distinctCoarseCost δ ε m*(((m^3 : ℕ) : ℝ)*
    (S^2*(witnessExceptionConstant ξ hξ*(n : ℝ)^(1+ξ))*S^(m-3))*P^m)

def shortStarMomentBudget (ξ : ℝ) (hξ : 0<ξ) (n g : ℕ)
    (S B δ ε H R unitRow coarseRow cap : ℝ) (m : ℕ) : ℝ :=
  unitRow^m/(1-ε)^(2*m+1).choose 2+
  repeatMomentBudget B δ ε H coarseRow m+
  specifiedMomentBudget ξ hξ n g S δ ε cap m+
  longMomentBudget n S H R δ ε cap m+
  extraMomentBudget S R δ ε cap m+
  witnessMomentBudget ξ hξ n S δ ε cap m

attribute [local irreducible] tuplePhysicalProduct mainTupleObservable extraTupleObservable
  rootDistinctTuples repeatedTuples countTuples repeatIndices specifiedExceptionTuples
  longExceptionTuples witnessExceptionTuples scheduledCutWitness

theorem initial_scheduledCutPoint_allTuple_bound {n : ℕ} {B : ℝ}
    (ξ : ℝ) (hξ : 0<ξ) (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H R : ℝ) (hH : 0≤H) (hR : 0<R)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (m : ℕ) :
    (∫ω,(∑f : Fin m→↥(shortStars Γ p H),tuplePhysicalProduct f
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      shortStarMomentBudget ξ hξ n Γ.card (shortStars Γ p H).card B δ ε H R
        (cutStarPriceSum Γ p H cs k t)
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
  have hclass := integral_all_le_main_repeat_exceptions Γ p H R m B (zero_le_one.trans hB) ν W hW hv he hu
  have hm := initial_scheduledCutPoint_mainTupleSum_bound (Γ:=Γ) (p:=p) (H:=H)
    m R cs ε M deadline start hn hB hΓ (fun j=>(hK j).trans_lt hK2) hε0 hε k t ht
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

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_allTuple_bound
