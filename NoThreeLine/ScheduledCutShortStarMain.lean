import NoThreeLine.ShortStarMainIntegral
import NoThreeLine.ScheduledCutPhysicalLeafMoment
import NoThreeLine.ScheduledCutUnitWitness

/-! Main short-star tuple under the actual inherited scheduled-cut point
law. The concrete exceptional configurations remain inside the observable's
event, and the bound uses the actual elapsed unit birth prices once. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness

theorem sourceCutTerminal_emptyLineCredit {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    EmptyLineCredit (sourceCutTerminal cfg ε M start δ hδ hn s ω).1.val.1.physical :=
  observedRecycledTerminal_emptyLineCredit cfg ε M (start-δ) hn (sourceRestrictGood cfg δ hδ s) ω

theorem scheduledCutWitness_emptyLineCredit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (hn : 0<n)
    (s : GoodPhaseObservation n B) (k : ℕ) (x : BoardClockPath n×ℝ) :
    EmptyLineCredit (scheduledCutWitness cs ε M deadline start e hn s k x).augmented.physical := by
  dsimp only [scheduledCutWitness,scheduledCutObservation,phaseCutObservation,observedWitness]
  exact sourceCutTerminal_emptyLineCredit _ _ _ _ _ _ _ _ _

end NoThreeLine.BirthWitness

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def cutUnitPrice {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (N : ℕ) (t : ℝ) (q : Grid n) : ℝ :=
  ((∑j∈Finset.range N,(cs j).horizon*(cs j).mask q)+t*(cs N).mask q)/n

theorem cutUnitPrice_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (N : ℕ) (t : ℝ) (ht : 0≤t) (q : Grid n) : 0≤cutUnitPrice cs N t q := by
  have hh := scheduledLeafUnitPrice_nonneg cs 0 (unitBirthRetention n) N t ht q
  simpa only [scheduledLeafUnitPrice,scheduled_unitBirth_price,cutUnitPrice] using hh

theorem initial_scheduledCutPoint_mainTuple_bound {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H B : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (R : ℝ)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (N : ℕ) (t : ℝ) (ht : t∈Set.Icc (0:ℝ) (cs N).horizon) :
    (∫ω,mainTupleObservable f R
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t)≤
      (∏i : Fin m,cutUnitPrice cs N t (f i).val.2)/(1-ε)^((2*m+1).choose 2) := by
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
  by_cases hN : NoSpecifiedCrossPairs f
  · have hp : p∉leafLabels f∪witnessLabels f := root_not_mem_labels f
    have hCD : Disjoint (insert p (leafLabels f)) (witnessLabels f) := by
      apply Finset.disjoint_left.mpr
      intro q hq hqD
      rcases Finset.mem_insert.mp hq with hqp|hqC
      · subst q
        exact hp (Finset.mem_union_right _ hqD)
      · exact Finset.disjoint_left.mp (leaf_witness_disjoint f hD) hqC hqD
    have hCL : insert p (leafLabels f)∪witnessLabels f⊆insert p (leafLabels f∪witnessLabels f) := by
      rw [Finset.insert_union]
    have hsep : SeparatedLabels Γ (insert p (leafLabels f)∪witnessLabels f) := by
      rw [Finset.insert_union]
      exact separatedLabels_tuple f hN
    have hcard : (insert p (leafLabels f∪witnessLabels f)).card=2*m+1 := by
      rw [Finset.card_insert_of_notMem hp,label_union_card f hD]
    have hb := initial_scheduledCutPoint_leaf_unit_product cs ε M deadline start p hn hB
      (unitBirthRetention n) Γ (insert p (leafLabels f)) (witnessLabels f)
      (insert p (leafLabels f∪witnessLabels f)) (Finset.mem_insert_self _ _) hΓ hK hCD hCL hsep
      hε0 hε N t ht
    rw [hcard] at hb
    simp_rw [scheduled_unitBirth_price] at hb
    have hprod : (∏q∈witnessLabels f,cutUnitPrice cs N t q)=
        ∏i : Fin m,cutUnitPrice cs N t (f i).val.2 :=
      Finset.prod_image (fun i _ j _ hij=>witness_injective f hD hij)
    change (∫ω,rootLeafWitness Γ (insert p (leafLabels f)) (witnessLabels f) p (W ω) ∂ν)≤
      (∏q∈witnessLabels f,cutUnitPrice cs N t q)/(1-ε)^((2*m+1).choose 2) at hb
    rw [hprod] at hb
    exact (integral_mainTupleObservable_le f hD R B ν W hW hV hE hunit).trans hb
  · have hz : (fun ω=>mainTupleObservable f R (W ω))=fun _=>0 := by
      funext ω
      exact mainTupleObservable_zero_of_not_separated f R hN (W ω)
    change (∫ω,mainTupleObservable f R (W ω) ∂ν)≤_
    rw [hz,integral_zero]
    exact div_nonneg (Finset.prod_nonneg (fun i _=>cutUnitPrice_nonneg cs N t ht.1 (f i).val.2))
      (pow_nonneg (sub_nonneg.mpr hε.le) _)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.BirthWitness.scheduledCutWitness_emptyLineCredit
#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_mainTuple_bound
