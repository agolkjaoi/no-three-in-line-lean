import NoThreeLine.LabelMomentBound

/-! Two prescribed distinct witness labels pay their birth prices once.
The other labels may repeat either prescribed label or each other; a seed
moment bounds all such repetitions without an independence assertion. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteWitnessMoments

theorem sum_tuple_succ {α : Type*} [Fintype α] (m : ℕ) (F : (Fin (m+1)→α)→ℝ) :
    (∑f : Fin (m+1)→α,F f)=∑q : α,∑f : Fin m→α,F (Fin.cons q f) := by
  rw [←(Fin.consEquiv (fun _ : Fin (m+1)=>α)).sum_comp F,Fintype.sum_prod_type]
  rfl

theorem tuplePrice_cons_seed {α : Type*} [DecidableEq α] (A : Finset α) (w b : α→ℝ)
    {m : ℕ} (q : α) (f : Fin m→α) :
    tuplePrice A w b (Fin.cons q f)=
      (w q*(if q∈A then 1 else b q))*tuplePrice (insert q A) w b f := by
  by_cases hA : q∈A
  · rw [Finset.insert_eq_of_mem hA,tuplePrice_cons,if_pos hA,
      if_pos (Finset.mem_union_left _ hA)]
    ring
  · have hset : insert q (tupleLabels f)\A=insert q (tupleLabels f\insert q A) := by
      ext r
      by_cases hr : r=q
      · subst r; simp [hA]
      · simp [hr]
    unfold tuplePrice
    rw [Fin.prod_univ_succ,tupleLabels_cons,hset,
      Finset.prod_insert (by simp : q∉tupleLabels f\insert q A),if_neg hA]
    simp only [Fin.cons_zero,Fin.cons_succ]
    ring

theorem tuplePrice_two_seed {α : Type*} [DecidableEq α] (w b : α→ℝ) {m : ℕ}
    (q r : α) (hqr : q≠r) (f : Fin m→α) :
    tuplePrice ∅ w b (Fin.cons q (Fin.cons r f))=
      (w q*w r*b q*b r)*tuplePrice {r,q} w b f := by
  rw [tuplePrice_cons_seed,tuplePrice_cons_seed]
  simp only [Finset.notMem_empty,if_false,Finset.insert_empty,Finset.mem_singleton,
    if_neg hqr.symm]
  ring

theorem two_seed_moment_bound {α : Type*} [Fintype α] [DecidableEq α] (w b : α→ℝ)
    (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W)
    (q r : α) (hqr : q≠r) (m : ℕ) :
    (∑f : Fin m→α,tuplePrice ∅ w b (Fin.cons q (Fin.cons r f)))≤
      (w q*w r*b q*b r)*((∑z : α,w z*b z)+((m+2:ℕ):ℝ)*W)^m := by
  simp_rw [tuplePrice_two_seed w b q r hqr]
  rw [←Finset.mul_sum]
  apply mul_le_mul_of_nonneg_left _ (mul_nonneg (mul_nonneg (mul_nonneg (hw q) (hw r)) (hb q)) (hb r))
  have hh := tupleMoment_le_power ({r,q}:Finset α) w b hw hb W hW0 hW m
  simpa only [tupleMoment,Finset.card_pair hqr.symm,Nat.cast_add,Nat.cast_ofNat,add_comm (2:ℝ)] using hh

def pairWeight {α : Type*} [Fintype α] (R : α→α→Prop) [DecidableRel R] (w b : α→ℝ) : ℝ :=
  ∑q : α,∑r : α,if R q r then w q*w r*b q*b r else 0

theorem pairWeight_nonneg {α : Type*} [Fintype α] (R : α→α→Prop) [DecidableRel R] (w b : α→ℝ)
    (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) : 0≤pairWeight R w b := by
  apply Finset.sum_nonneg
  intro q _
  apply Finset.sum_nonneg
  intro r _
  split_ifs
  · exact mul_nonneg (mul_nonneg (mul_nonneg (hw q) (hw r)) (hb q)) (hb r)
  · exact le_rfl

theorem first_pair_moment_bound {α : Type*} [Fintype α] [DecidableEq α]
    (R : α→α→Prop) [DecidableRel R] (hR : ∀q r,R q r→q≠r)
    (w b : α→ℝ) (hw : ∀q,0≤w q) (hb : ∀q,0≤b q)
    (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) (m : ℕ) :
    (∑f : Fin (m+2)→α,if R (f 0) (f 1) then tuplePrice ∅ w b f else 0)≤
      pairWeight R w b*((∑q : α,w q*b q)+((m+2:ℕ):ℝ)*W)^m := by
  rw [sum_tuple_succ]
  simp_rw [sum_tuple_succ m]
  simp only [show (1:Fin (m+2))=Fin.succ (0:Fin (m+1)) from rfl,Fin.cons_succ,Fin.cons_zero]
  unfold pairWeight
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro q _
  rw [Finset.sum_mul]
  apply Finset.sum_le_sum
  intro r _
  by_cases hqr : R q r
  · simp only [if_pos hqr]
    exact two_seed_moment_bound w b hw hb W hW0 hW q r (hR q r hqr) m
  · simp only [if_neg hqr,Finset.sum_const_zero,zero_mul,le_refl]

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.tuplePrice_two_seed
#print axioms NoThreeLine.FiniteWitnessMoments.first_pair_moment_bound
