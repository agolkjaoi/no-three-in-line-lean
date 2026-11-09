import NoThreeLine.PairWitnessHistories
import NoThreeLine.PairRateExpansion
import NoThreeLine.ScheduledPairTupleMoment

/-! Actual cause tuples inject into the fixed mixed-history space by their
ordered cause list. Witness choice does not multiply an actual tuple. The
physical products and distinct selected labels remain in the observable. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness MixedConnection FiniteWitnessMoments

def historyCauses {n : ℕ} (l : List (Edge n)) : Finset (Grid n) :=
  (l.map Edge.cause).toFinset

def historyObservable {n : ℕ} (a b : Grid n) (l : List (Edge n)) (e : ExtendedState n) : ℝ :=
  causeProduct a b (historyCauses l) (historyLabels l) e

theorem historyCauses_eq_tupleLabels {n m : ℕ} (l : List (Edge n)) (f : Fin m→Grid n)
    (h : l.map Edge.cause=List.ofFn f) : historyCauses l=tupleLabels f := by
  ext q
  simp only [historyCauses,h,List.mem_toFinset,List.mem_ofFn,tupleLabels,
    Finset.mem_image,Finset.mem_univ,true_and]

theorem historyCauses_card_le {n : ℕ} (l : List (Edge n)) :
    (historyCauses l).card≤l.length := by
  exact (List.toFinset_card_le _).trans_eq (List.length_map _)

theorem historyCauses_exclude_roots {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (m : ℕ) (l : List (Edge n)) (hl : l∈histories Γ a b m) :
    a∉historyCauses l ∧ b∉historyCauses l := by
  have hh := (mem_histories Γ a b m l).mp hl
  constructor
  · intro ha
    obtain ⟨e,he,hc⟩ := List.mem_map.mp (List.mem_toFinset.mp ha)
    exact (offBaseline_distinct a b e.cause (edge_cause_off_baseline Γ a b e (hh.2 e he))).2.1 hc.symm
  · intro hb
    obtain ⟨e,he,hc⟩ := List.mem_map.mp (List.mem_toFinset.mp hb)
    exact (offBaseline_distinct a b e.cause (edge_cause_off_baseline Γ a b e (hh.2 e he))).2.2 hc.symm

theorem historyObservable_nonneg {n : ℕ} (a b : Grid n) (l : List (Edge n))
    (e : ExtendedState n) (B : ℝ) (he : e.Valid B) : 0≤historyObservable a b l e :=
  causeProduct_nonneg a b _ _ e B he

theorem historyObservable_integrable {Ω : Type*} [MeasurableSpace Ω] {n : ℕ}
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω→ExtendedState n) (hW : Measurable W)
    (a b : Grid n) (l : List (Edge n)) (B : ℝ) (hv : ∀ω,(W ω).Valid B) :
    Integrable (fun ω=>historyObservable a b l (W ω)) μ :=
  causeProduct_integrable μ W hW a b _ _ B hv

theorem cause_tuple_sum_le_history {n m : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (a b : Grid n) (B : ℝ) (he : e.Valid B) (hen : pairEnabled e.process a b)
    (c : ℕ→ℝ) (hc : ∀j,0≤c j) :
    (∑ f : Fin m→causes e.process Γ a b,
      c (tupleLabels (fun i=>(f i).val)).card *
        ∏ q∈tupleLabels (fun i=>(f i).val),(e.process.accounts q).weight) ≤
    ∑ l∈histories Γ a b m,c (historyCauses l).card*historyObservable a b l e := by
  classical
  have hex (f : Fin m→causes e.process Γ a b) :=
    actual_cause_tuple_history e.process he.1 Γ a b (fun i=>(f i).val) hen.2.1 hen.2.2
      (fun i=>⟨(e.process.mem_activeEvents _).mp (Finset.mem_filter.mp (f i).property).1,
        (Finset.mem_filter.mp (f i).property).2⟩)
  choose g hg hcause hselected using hex
  have hinj : Function.Injective g := by
    intro f f' h
    have hv := List.ofFn_injective ((hcause f).symm.trans ((congrArg (List.map Edge.cause) h).trans (hcause f')))
    funext i
    exact Subtype.ext (congrFun hv i)
  have hvalue (f : Fin m→causes e.process Γ a b) :
      historyObservable a b (g f) e =
        ∏ q∈tupleLabels (fun i=>(f i).val),(e.process.accounts q).weight := by
    have hq := historyCauses_eq_tupleLabels (g f) (fun i=>(f i).val) (hcause f)
    have ha : insert a (insert b (historyCauses (g f)))⊆e.process.activeEvents := by
      apply Finset.insert_subset_iff.mpr
      refine ⟨(e.process.mem_activeEvents _).mpr hen.2.1,Finset.insert_subset_iff.mpr ⟨
        (e.process.mem_activeEvents _).mpr hen.2.2,?_⟩⟩
      rw [hq]
      intro q hq
      obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp hq
      exact (Finset.mem_filter.mp (f i).property).1
    have hs : insert a (insert b (historyCauses (g f)))⊆e.process.activeEvents ∧
        historyLabels (g f)⊆e.process.selected := ⟨ha,hselected f⟩
    rw [historyObservable,causeProduct,activeSelectedIndicator,if_pos hs,one_mul,hq]
    rfl
  calc
    _ = ∑ f : Fin m→causes e.process Γ a b,
        c (historyCauses (g f)).card*historyObservable a b (g f) e := by
      apply Finset.sum_congr rfl
      intro f _
      rw [hvalue,historyCauses_eq_tupleLabels _ _ (hcause f)]
    _ = ∑ l∈Finset.univ.image g,c (historyCauses l).card*historyObservable a b l e :=
      (Finset.sum_image (s:=Finset.univ)
        (f:=fun l=>c (historyCauses l).card*historyObservable a b l e)
        (fun f _ f' _ h=>hinj h)).symm
    _ ≤ _ := Finset.sum_le_sum_of_subset_of_nonneg
      (by intro l hl; obtain ⟨f,_,rfl⟩ := Finset.mem_image.mp hl; exact hg f)
      (fun l _ _=>mul_nonneg (hc _) (historyObservable_nonneg a b l e B he))

theorem pairRate_pow_history {n m : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (a b : Grid n) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hmask : ∀q,0≤mask q ∧ mask q≤1) (hm : 0<m) :
    pairRate e.process Γ mask e.coordinates a b^m ≤
      (∑ l∈histories Γ a b m,B^(m-(historyCauses l).card)*historyObservable a b l e)/(n:ℝ)^m := by
  have hb := pairRate_pow_repeat e Γ mask a b B hB he hmask hm
  by_cases hen : pairEnabled e.process a b
  · rw [if_pos hen] at hb
    exact hb.trans (div_le_div_of_nonneg_right
      (cause_tuple_sum_le_history e Γ a b B he hen (fun j=>B^(m-j)) (fun j=>pow_nonneg hB.le _))
      (pow_nonneg (Nat.cast_nonneg n) _))
  · rw [if_neg hen] at hb
    exact hb.trans (div_nonneg (Finset.sum_nonneg (fun l _=>
      mul_nonneg (pow_nonneg hB.le _) (historyObservable_nonneg a b l e B he)))
      (pow_nonneg (Nat.cast_nonneg n) _))

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.cause_tuple_sum_le_history
#print axioms NoThreeLine.PairWitness.pairRate_pow_history
