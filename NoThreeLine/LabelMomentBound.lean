import NoThreeLine.LabelMomentRecursion

/-! Repeated-label terms cost at most the number of old labels times the
largest deterministic weight. The resulting rising-product bound has
leading coefficient one; it does not multiply the main term by m!. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteWitnessMoments

theorem nextLabel_sum_le {α : Type*} [Fintype α] [DecidableEq α] (S : Finset α) (w b : α→ℝ)
    (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) (W : ℝ) (hW : ∀q,w q≤W) :
    (∑q : α,w q*(if q∈S then 1 else b q))≤(∑q : α,w q*b q)+(S.card:ℝ)*W := by
  calc
    _≤∑q : α,(w q*b q+(if q∈S then w q else 0)) := by
      apply Finset.sum_le_sum
      intro q _
      split_ifs
      · nlinarith [mul_nonneg (hw q) (hb q)]
      · simp only [add_zero,le_refl]
    _=(∑q : α,w q*b q)+∑q∈S,w q := by
      rw [Finset.sum_add_distrib]
      congr 1
      rw [←Finset.sum_filter]
      simp
    _≤(∑q : α,w q*b q)+(S.card:ℝ)*W := by
      apply add_le_add le_rfl
      simpa only [Finset.sum_const,nsmul_eq_mul] using
        (Finset.sum_le_sum (s:=S) (fun q _=>hW q))

theorem tupleMoment_succ_le {α : Type*} [Fintype α] [DecidableEq α] (A : Finset α) (w b : α→ℝ)
    (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) (m : ℕ) :
    tupleMoment A w b (m+1)≤
      ((∑q : α,w q*b q)+((A.card:ℝ)+m)*W)*tupleMoment A w b m := by
  rw [tupleMoment_succ]
  have hc (f : Fin m→α) : ((A∪tupleLabels f).card:ℝ)≤(A.card:ℝ)+m := by
    exact_mod_cast (Finset.card_union_le A (tupleLabels f)).trans
      (Nat.add_le_add_left (tupleLabels_card_le f) A.card)
  calc
    _≤∑f : Fin m→α,tuplePrice A w b f*((∑q : α,w q*b q)+((A.card:ℝ)+m)*W) := by
      apply Finset.sum_le_sum
      intro f _
      apply mul_le_mul_of_nonneg_left _ (tuplePrice_nonneg A w b hw hb f)
      exact (nextLabel_sum_le (A∪tupleLabels f) w b hw hb W hW).trans
        (add_le_add le_rfl (mul_le_mul_of_nonneg_right (hc f) hW0))
    _=_ := by rw [←Finset.sum_mul]; exact mul_comm _ _

theorem tupleMoment_le_rising_product {α : Type*} [Fintype α] [DecidableEq α]
    (A : Finset α) (w b : α→ℝ) (hw : ∀q,0≤w q) (hb : ∀q,0≤b q)
    (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) (m : ℕ) :
    tupleMoment A w b m≤∏j∈Finset.range m,((∑q : α,w q*b q)+((A.card:ℝ)+j)*W) := by
  have hM : 0≤∑q : α,w q*b q := Finset.sum_nonneg (fun q _=>mul_nonneg (hw q) (hb q))
  induction m with
  | zero => simp only [tupleMoment_zero,Finset.range_zero,Finset.prod_empty,le_refl]
  | succ m ih =>
    apply (tupleMoment_succ_le A w b hw hb W hW0 hW m).trans
    have hcoef : 0≤(∑q : α,w q*b q)+((A.card:ℝ)+m)*W :=
      add_nonneg hM (mul_nonneg (add_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)) hW0)
    simpa only [Finset.prod_range_succ,mul_comm] using mul_le_mul_of_nonneg_left ih hcoef

theorem tupleMoment_le_power {α : Type*} [Fintype α] [DecidableEq α]
    (A : Finset α) (w b : α→ℝ) (hw : ∀q,0≤w q) (hb : ∀q,0≤b q)
    (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) (m : ℕ) :
    tupleMoment A w b m≤((∑q : α,w q*b q)+((A.card:ℝ)+m)*W)^m := by
  apply (tupleMoment_le_rising_product A w b hw hb W hW0 hW m).trans
  calc
    _≤∏_j∈Finset.range m,((∑q : α,w q*b q)+((A.card:ℝ)+m)*W) := by
      apply Finset.prod_le_prod
      · intro j _
        exact add_nonneg (Finset.sum_nonneg (fun q _=>mul_nonneg (hw q) (hb q)))
          (mul_nonneg (add_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)) hW0)
      · intro j hj
        apply add_le_add le_rfl
        apply mul_le_mul_of_nonneg_right _ hW0
        exact add_le_add le_rfl (by exact_mod_cast (Finset.mem_range.mp hj).le)
    _=_ := by simp

theorem pow_add_error_bound (M E : ℝ) (hM : 0≤M) (hE : 0≤E) (m : ℕ) :
    (M+E)^(m+1)≤M^(m+1)+((m+1:ℕ):ℝ)*E*(M+E)^m := by
  induction m with
  | zero => simp
  | succ m ih =>
    have hpow := pow_le_pow_left₀ hM (le_add_of_nonneg_right hE) (m+1)
    calc
      _=(M+E)^(m+1)*(M+E) := pow_succ _ _
      _≤(M^(m+1)+((m+1:ℕ):ℝ)*E*(M+E)^m)*(M+E) :=
        mul_le_mul_of_nonneg_right ih (add_nonneg hM hE)
      _=M^(m+1)*M+E*M^(m+1)+((m+1:ℕ):ℝ)*E*(M+E)^(m+1) := by
        rw [pow_succ (M+E) m]
        ring
      _≤_ := by
        rw [pow_succ M (m+1)]
        simp only [Nat.cast_add,Nat.cast_one]
        nlinarith [mul_le_mul_of_nonneg_left hpow hE]

theorem tupleMoment_le_main_add_error {α : Type*} [Fintype α] [DecidableEq α]
    (w b : α→ℝ) (hw : ∀q,0≤w q) (hb : ∀q,0≤b q)
    (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) (m : ℕ) :
    tupleMoment ∅ w b m≤(∑q : α,w q*b q)^m+
      (m:ℝ)^2*W*((∑q : α,w q*b q)+(m:ℝ)*W)^(m-1) := by
  have hM : 0≤∑q : α,w q*b q := Finset.sum_nonneg (fun q _=>mul_nonneg (hw q) (hb q))
  cases m with
  | zero => simp only [tupleMoment_zero,pow_zero,Nat.cast_zero,zero_pow (by decide : 2≠0),zero_mul,add_zero,le_refl]
  | succ m =>
    have hh := tupleMoment_le_power (∅ : Finset α) w b hw hb W hW0 hW (m+1)
    simp only [Finset.card_empty,Nat.cast_zero,zero_add] at hh
    apply hh.trans
    have he := pow_add_error_bound (∑q : α,w q*b q) (((m+1:ℕ):ℝ)*W) hM
      (mul_nonneg (Nat.cast_nonneg _) hW0) m
    simpa only [Nat.add_sub_cancel,pow_two,mul_assoc] using he

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.tupleMoment_le_rising_product
#print axioms NoThreeLine.FiniteWitnessMoments.tupleMoment_le_main_add_error
