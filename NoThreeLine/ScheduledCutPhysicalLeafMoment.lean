import NoThreeLine.PhysicalLeafPointMoment
import NoThreeLine.ScheduledCutLeafProduct

/-! The same physical-leaf expansion at the actual inherited scheduled cut.
The cut-state active indicators are retained. The source price includes the
old phases and the elapsed current phase; no fresh state or birth record is
inserted, and no full-future density consistency is invoked. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments AuxiliaryODE PrimitiveLines

def scheduledLeafUnitPrice {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start : ℝ)
    (e : Retention n) (N : ℕ) (t : ℝ) (z : Grid n) : ℝ :=
  accumulatedPhaseUnitPrice cs start e N z+
    ∫u in (0:ℝ)..t,phaseUnitCoefficient (cs N).config (phaseEndpoint cs start N) e z u

theorem scheduledLeafUnitPrice_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start : ℝ)
    (e : Retention n) (N : ℕ) (t : ℝ) (ht : 0≤t) (z : Grid n) : 0≤scheduledLeafUnitPrice cs start e N t z :=
  add_nonneg (accumulatedPhaseUnitPrice_nonneg cs start e N z)
    (intervalIntegral.integral_nonneg ht (fun u _=>
      (phaseUnitCoefficient_bounds (cs N).config (phaseEndpoint cs start N) e (cs N).mask_le_one z u).1))

theorem initial_scheduledCutPoint_physical_tuple_product {n : ℕ} {B : ℝ} {α : Type*}
    [DecidableEq α] {k : ℕ} (leaf : α→Grid n) (p z : Grid n) (f : Fin k→α)
    (L : LineIndex n) (Γ : Finset ZPoint) (hL : ¬specified Γ L)
    (hpL : p∈L.val) (hzL : z∈L.val) (hleaf : ∀q,leaf q∈L.val)
    (hpz : p≠z) (hnez : ∀q,leaf q≠z)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (N : ℕ) (t : ℝ) (ht : t∈Set.Icc (0:ℝ) (cs N).horizon) :
    (∫ω,rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p
      (scheduledCutWitness cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t)≤
      scheduledLeafUnitPrice cs start e N t z/(1-ε)^(k+2).choose 2 := by
  classical
  let C := physicalRootLabels leaf p f
  have hpC : p∈C := Finset.mem_insert_self _ _
  have hzC : z∉C := by
    intro hh
    rcases Finset.mem_insert.mp hh with he|he
    · exact hpz he.symm
    · obtain ⟨q,hq,heq⟩ := Finset.mem_image.mp he
      exact hnez q heq
  have hCL : C⊆L.val := (physicalRootLabels_subset_iff leaf p f _).mpr ⟨hpL,fun i=>hleaf (f i)⟩
  have hCD : Disjoint C {z} := Finset.disjoint_singleton_right.mpr hzC
  have hCDL : C∪{z}⊆L.val := Finset.union_subset hCL (Finset.singleton_subset_iff.mpr hzL)
  have hsep := separatedLabels_of_subset_nonspecified_line Γ (C∪{z}) L hL hCDL
  have hc : (C∪{z}).card≤k+2 := by
    have hc0 := Finset.card_image_le (s:=tupleLabels f) (f:=leaf)
    have hc1 := Finset.card_insert_le p ((tupleLabels f).image leaf)
    have hc2 := Finset.card_union_le C ({z}:Finset (Grid n))
    have hc3 := tupleLabels_card_le f
    simp only [Finset.card_singleton] at hc2
    change C.card≤((tupleLabels f).image leaf).card+1 at hc1
    omega
  have hh := initial_scheduledCutPoint_leaf_unit_product cs ε M deadline start p hn hB e Γ
    C {z} (C∪{z}) hpC hΓ hK hCD (Finset.Subset.refl _) hsep hε0 hε N t ht
  simp only [Finset.prod_singleton] at hh
  apply hh.trans
  exact div_le_div_of_nonneg_left (scheduledLeafUnitPrice_nonneg cs start e N t ht.1 z)
    (pow_pos (sub_pos.mpr hε) _) (pow_le_pow_of_le_one (sub_nonneg.mpr hε.le)
      (by linarith) (Nat.choose_le_choose 2 hc))

theorem initial_scheduledCutPoint_lineLeafPower_bound {n : ℕ} {B : ℝ} {α : Type*}
    [Fintype α] [DecidableEq α] (leaf : α→Grid n) (hinj : Function.Injective leaf)
    (mask : α→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p∈L.val) (hzL : z∈L.val)
    (hleaf : ∀q,leaf q∈L.val) (hpz : p≠z) (hnep : ∀q,leaf q≠p) (hnez : ∀q,leaf q≠z)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k N : ℕ) (t : ℝ) (ht : t∈Set.Icc (0:ℝ) (cs N).horizon) :
    (∫ω,lineLeafPower leaf mask L p z k
      (scheduledCutWitness cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t)≤
      (scheduledLeafUnitPrice cs start e N t z/(1-ε)^(k+2).choose 2)*
        ((∑q : α,mask q)^k+(k:ℝ)^2*B*((∑q : α,mask q)+(k:ℝ)*B)^(k-1)) := by
  let Z := fun ω=>scheduledCutWitness cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p N t
  let coef (f : Fin k→α) := (∏i : Fin k,mask (f i))*B^(k-(tupleLabels f).card)
  let price := scheduledLeafUnitPrice cs start e N t z/(1-ε)^(k+2).choose 2
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p N t
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  have hZ : Measurable Z :=
    (scheduledCutWitness_measurable cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N).comp (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (Z ω).Valid B := scheduledCutWitness_valid cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t)
  have hc0 (f : Fin k→α) : 0≤coef f := mul_nonneg
    (Finset.prod_nonneg (fun i _=>(hm (f i)).1)) (pow_nonneg hB0.le _)
  have hi : Integrable (fun ω=>lineLeafPower leaf mask L p z k (Z ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((lineLeafPower_measurable leaf mask L p z k).comp hZ) ((B*Fintype.card α)^k)
      (fun ω=>lineLeafPower_bounds leaf mask hm L p z k _ B hB0.le (hv ω))
  have hj (f : Fin k→α) : Integrable
      (fun ω=>rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p (Z ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((rootLeafWitness_measurable Γ (physicalRootLabels leaf p f) {z} p).comp hZ)
      (rootLeafCap (physicalRootLabels leaf p f) p B)
      (fun ω=>rootLeafWitness_bounds Γ (physicalRootLabels leaf p f) {z} p _ B (hv ω))
  have hb (f : Fin k→α) : (∫ω,rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p (Z ω) ∂ν)≤price :=
    initial_scheduledCutPoint_physical_tuple_product leaf p z f L Γ hL hpL hzL hleaf hpz hnez
      cs ε M deadline start hn hB e hΓ hK hε0 hε N t ht
  have hprice : 0≤price := div_nonneg (scheduledLeafUnitPrice_nonneg cs start e N t ht.1 z)
    (pow_nonneg (sub_nonneg.mpr hε.le) _)
  calc
    _ ≤ ∫ω,∑f : Fin k→α,coef f*rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p (Z ω) ∂ν :=
      integral_mono hi (integrable_finsetSum _ (fun f _=>(hj f).const_mul (coef f))) (fun ω=>by
        rw [lineLeafPower_eq_sum]
        exact Finset.sum_le_sum (fun f _=>lineLeafTuple_le_rootLeaf leaf hinj mask (fun q=>(hm q).1)
          L p z Γ hL hpL hleaf hnep f _ B hB0 (hv ω)))
    _ = ∑f : Fin k→α,coef f*(∫ω,rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p (Z ω) ∂ν) := by
      rw [integral_finsetSum _ (fun f _=>(hj f).const_mul (coef f))]
      simp_rw [integral_const_mul]
    _ ≤ ∑f : Fin k→α,coef f*price := Finset.sum_le_sum (fun f _=>mul_le_mul_of_nonneg_left (hb f) (hc0 f))
    _ = price*physicalRepeatSum mask B k := by
      unfold physicalRepeatSum
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro f _
      dsimp only [coef]
      ring
    _ ≤ _ := mul_le_mul_of_nonneg_left (physicalRepeatSum_le_main_error mask hm B hB0 k) hprice

theorem initial_scheduledCutPoint_lineLeafPower_length_bound {n : ℕ} {B : ℝ} {α : Type*}
    [Fintype α] [DecidableEq α] (leaf : α→Grid n) (hinj : Function.Injective leaf)
    (mask : α→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p∈L.val) (hzL : z∈L.val)
    (hleaf : ∀q,leaf q∈L.val) (hpz : p≠z) (hnep : ∀q,leaf q≠p) (hnez : ∀q,leaf q≠z)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k N : ℕ) (t : ℝ) (ht : t∈Set.Icc (0:ℝ) (cs N).horizon) (ell : ℝ) (hBell : B≤ell) (hell : (Fintype.card α:ℝ)≤ell) :
    (∫ω,lineLeafPower leaf mask L p z k
      (scheduledCutWitness cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t)≤
      (scheduledLeafUnitPrice cs start e N t z/(1-ε)^(k+2).choose 2)*
        ((∑q : α,mask q)^k+physicalRepeatErrorConstant k*B*ell^(k-1)) := by
  have hh := initial_scheduledCutPoint_lineLeafPower_bound leaf hinj mask hm L p z Γ hL hpL hzL hleaf hpz hnep hnez
    cs ε M deadline start hn hB e hΓ hK hε0 hε k N t ht
  have hD : (∑q : α,mask q)≤ell := (show (∑q : α,mask q)≤(Fintype.card α:ℝ) by
    simpa using Finset.sum_le_sum (s:=Finset.univ) (fun q _=>(hm q).2)).trans hell
  have hD0 : 0≤∑q : α,mask q := Finset.sum_nonneg (fun q _=>(hm q).1)
  have hB0 : 0≤B := zero_le_one.trans hB
  have hbase : (∑q : α,mask q)+(k:ℝ)*B≤((k:ℝ)+1)*ell := by
    nlinarith [mul_le_mul_of_nonneg_left hBell (Nat.cast_nonneg k)]
  apply hh.trans
  apply mul_le_mul_of_nonneg_left _ (div_nonneg (scheduledLeafUnitPrice_nonneg cs start e N t ht.1 z)
    (pow_nonneg (sub_nonneg.mpr hε.le) _))
  apply add_le_add le_rfl
  calc
    _ ≤ (k:ℝ)^2*B*(((k:ℝ)+1)*ell)^(k-1) := mul_le_mul_of_nonneg_left
      (pow_le_pow_left₀ (add_nonneg hD0 (mul_nonneg (Nat.cast_nonneg k) hB0)) hbase _) (by positivity)
    _ = _ := by rw [mul_pow]; unfold physicalRepeatErrorConstant; ring

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_physical_tuple_product
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_lineLeafPower_bound
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_lineLeafPower_length_bound
