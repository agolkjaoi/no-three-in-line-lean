import NoThreeLine.PairHistoryObservable
import NoThreeLine.PairHistoryPrice

/-! Regularity and the coarse repeated-cause bound needed to integrate
the exact history cover. No moment estimate is assumed here. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness MixedConnection FiniteWitnessMoments

theorem historyCauses_card_pos {n m : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (l : List (Edge n)) (hl : l∈histories Γ a b m) (hm : 0<m) :
    0<(historyCauses l).card := by
  have hlen := (mem_histories Γ a b m l).mp hl |>.1
  cases l with
  | nil => simp only [List.length_nil] at hlen; omega
  | cons e l => exact Finset.card_pos.mpr ⟨e.cause,by simp [historyCauses]⟩

theorem pairRate_pow_history_coarse {n m : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (a b : Grid n) (B : ℝ) (hB : 1≤B) (he : e.Valid B)
    (hmask : ∀q,0≤mask q ∧ mask q≤1) (hm : 0<m) :
    pairRate e.process Γ mask e.coordinates a b^m ≤
      B^(m-1)/(n:ℝ)^m*(∑l∈histories Γ a b m,historyObservable a b l e) := by
  have hb := pairRate_pow_history e Γ mask a b B (zero_lt_one.trans_le hB) he hmask hm
  apply hb.trans
  calc
    _ ≤ (∑l∈histories Γ a b m,B^(m-1)*historyObservable a b l e)/(n:ℝ)^m := by
      apply div_le_div_of_nonneg_right _ (pow_nonneg (Nat.cast_nonneg n) _)
      apply Finset.sum_le_sum
      intro l hl
      have hc := historyCauses_card_pos Γ a b l hl hm
      exact mul_le_mul_of_nonneg_right (pow_le_pow_right₀ hB (by omega))
        (historyObservable_nonneg a b l e B he)
    _ = _ := by rw [←Finset.mul_sum]; ring

theorem state_pairRate_measurable {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n→ℝ)
    (a b : Grid n) :
    Measurable (fun e : ExtendedState n=>pairRate e.process Γ mask e.coordinates a b) := by
  change Measurable (fun e : ExtendedState n=>
    if (e.process.accounts a).status=.active ∧ (e.process.accounts b).status=.active then
      ∑q : Grid n,if commonChange Γ e.process.selected a b q then e.process.birthRate mask q else 0
    else 0)
  apply Measurable.ite
  · exact (((CreditAccount.measurable_status.comp ((ProcessState.measurable_account n a).comp
      (ExtendedState.measurable_process n))).eq measurable_const).and
      ((CreditAccount.measurable_status.comp ((ProcessState.measurable_account n b).comp
      (ExtendedState.measurable_process n))).eq measurable_const)).setOf
  · apply Finset.measurable_sum
    intro q _
    apply Measurable.ite
    · exact (((measurable_of_countable (fun S : Finset (Grid n)=>commonChange Γ S a b q)).comp
        ((ProcessState.measurable_selected n).comp (ExtendedState.measurable_process n)))).setOf
    · exact (process_birthRate_measurable mask q).comp (ExtendedState.measurable_process n)
    · exact measurable_const
  · exact measurable_const

theorem pairRate_pow_integrable {Ω : Type*} [MeasurableSpace Ω] {n m : ℕ}
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω→ExtendedState n) (hW : Measurable W)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (a b : Grid n) (B : ℝ) (hB : 1≤B)
    (hv : ∀ω,(W ω).Valid B) (hmask : ∀q,0≤mask q ∧ mask q≤1) (hm : 0<m) :
    Integrable (fun ω=>pairRate (W ω).process Γ mask (W ω).coordinates a b^m) μ := by
  have hi := (integrable_finsetSum (histories Γ a b m) (fun l _=>
    historyObservable_integrable μ W hW a b l B hv)).const_mul (B^(m-1)/(n:ℝ)^m)
  apply hi.mono' (((state_pairRate_measurable Γ mask a b).comp hW).pow_const m).aestronglyMeasurable
  filter_upwards [] with ω
  simp only [Function.comp_apply]
  rw [Real.norm_eq_abs,abs_of_nonneg (pow_nonneg
    (pairRate_nonneg (W ω).process Γ mask (W ω).coordinates (fun q=>(hmask q).1)
      (fun q=>((hv ω).2.1.1 q).1) a b) m)]
  exact pairRate_pow_history_coarse (W ω) Γ mask a b B hB (hv ω) hmask hm

def causePriceCap (Γ : Finset ZPoint) (K δ : ℝ) (m : ℕ) : ℝ :=
  1+∑k∈Finset.range (m+1),∑d∈Finset.range (2*m+1),|causePriceConstant Γ K δ k d|

theorem causePriceCap_pos (Γ : Finset ZPoint) (K δ : ℝ) (m : ℕ) :
    0<causePriceCap Γ K δ m := by
  have h : 0≤∑k∈Finset.range (m+1),∑d∈Finset.range (2*m+1),|causePriceConstant Γ K δ k d| :=
    Finset.sum_nonneg (fun k _=>Finset.sum_nonneg (fun d _=>abs_nonneg _))
  unfold causePriceCap
  linarith

theorem causePriceConstant_le_cap (Γ : Finset ZPoint) (K δ : ℝ) (m k d : ℕ)
    (hk : k≤m) (hd : d≤2*m) : causePriceConstant Γ K δ k d≤causePriceCap Γ K δ m := by
  have hd' := Finset.single_le_sum (fun d (_ : d∈Finset.range (2*m+1))=>
    abs_nonneg (causePriceConstant Γ K δ k d)) (Finset.mem_range.mpr (by omega : d<2*m+1))
  have hk' := Finset.single_le_sum (fun k (_ : k∈Finset.range (m+1))=>
    Finset.sum_nonneg (fun d (_ : d∈Finset.range (2*m+1))=>
      abs_nonneg (causePriceConstant Γ K δ k d))) (Finset.mem_range.mpr (by omega : k<m+1))
  have hh := (le_abs_self (causePriceConstant Γ K δ k d)).trans (hd'.trans hk')
  unfold causePriceCap
  linarith

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.pairRate_pow_history_coarse
#print axioms NoThreeLine.PairWitness.pairRate_pow_integrable
#print axioms NoThreeLine.PairWitness.causePriceConstant_le_cap
