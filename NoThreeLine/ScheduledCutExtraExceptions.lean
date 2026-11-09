import NoThreeLine.ShortStarExtraEvent
import NoThreeLine.ScheduledCutExtraCandidates

/-! Exception (iii) under the actual scheduled cut point law. The actual
existence-of-an-extra-selected-point event remains inside the observable. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

attribute [local irreducible] tupleExtraProduct extraTupleObservable scheduledCutWitness extraCandidates rootDistinctTuples

theorem initial_scheduledCutPoint_extra_exception_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (H R : ℝ) (hR : 0≤R)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (m : ℕ) :
    (∫ω,(∑f∈rootDistinctTuples Γ p H m,extraTupleObservable f R
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      extraCoarseCost δ ε m*(((m*(m-1) : ℕ) : ℝ)*
        (((shortStars Γ p H).card : ℝ)^2*R*((shortStars Γ p H).card : ℝ)^(m-2))*
          (coarseCutPriceCap cs k t)^(m+1)) := by
  classical
  let W := fun ω=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) k (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p k t
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p k t
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k).comp (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B := scheduledCutWitness_valid cs ε M deadline start _ hn _ k (ω,t)
  have hi : Integrable (fun ω=>∑f∈rootDistinctTuples Γ p H m,extraTupleObservable f R (W ω)) ν :=
    integrable_finsetSum _ (fun f _=>extraTupleObservable_integrable f R B (zero_le_one.trans hB) ν W hW hv)
  have hj : Integrable (fun ω=>∑fv∈extraCandidates Γ p H R m,tupleExtraProduct fv.1 fv.2 (W ω)) ν :=
    integrable_finsetSum _ (fun fv _=>tupleExtraProduct_integrable fv.1 fv.2 B (zero_le_one.trans hB) ν W hW hv)
  have hh := integral_mono hi hj (fun ω=>sum_extraTupleObservable_le_candidates Γ p H R m
    (W ω) B (zero_le_one.trans hB) (hv ω))
  exact hh.trans (initial_scheduledCutPoint_extra_candidate_sum_bound cs ε M deadline start K ρ δ p hn hB Γ H R hR
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht m)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_extra_exception_bound
