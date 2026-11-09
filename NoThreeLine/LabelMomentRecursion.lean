import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Real.Basic
import Mathlib.Tactic

/-! Exact finite-label moment recursion, including repeated labels. A seed
set records labels whose birth price has already been paid. No probability
or independence assumption enters these finite algebraic identities. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteWitnessMoments

def tupleLabels {α : Type*} [DecidableEq α] {m : ℕ} (f : Fin m→α) : Finset α :=
  Finset.univ.image f

def tuplePrice {α : Type*} [DecidableEq α] (A : Finset α) (w b : α→ℝ)
    {m : ℕ} (f : Fin m→α) : ℝ :=
  (∏i : Fin m,w (f i))*(∏q∈tupleLabels f\A,b q)

def tupleMoment {α : Type*} [Fintype α] [DecidableEq α] (A : Finset α)
    (w b : α→ℝ) (m : ℕ) : ℝ := ∑f : Fin m→α,tuplePrice A w b f

theorem tupleLabels_cons {α : Type*} [DecidableEq α] {m : ℕ} (q : α) (f : Fin m→α) :
    tupleLabels (Fin.cons q f)=insert q (tupleLabels f) := by
  ext r
  simp [tupleLabels,Fin.exists_fin_succ,eq_comm]

theorem tupleLabels_card_le {α : Type*} [DecidableEq α] {m : ℕ} (f : Fin m→α) :
    (tupleLabels f).card≤m := by
  simpa only [tupleLabels,Finset.card_univ,Fintype.card_fin] using Finset.card_image_le (s:=Finset.univ) (f:=f)

theorem tuplePrice_nonneg {α : Type*} [DecidableEq α] (A : Finset α) (w b : α→ℝ)
    (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) {m : ℕ} (f : Fin m→α) : 0≤tuplePrice A w b f :=
  mul_nonneg (Finset.prod_nonneg (fun i _=>hw (f i))) (Finset.prod_nonneg (fun q _=>hb q))

theorem tupleMoment_nonneg {α : Type*} [Fintype α] [DecidableEq α] (A : Finset α) (w b : α→ℝ)
    (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) (m : ℕ) : 0≤tupleMoment A w b m :=
  Finset.sum_nonneg (fun f _=>tuplePrice_nonneg A w b hw hb f)

theorem tuplePrice_cons {α : Type*} [DecidableEq α] (A : Finset α) (w b : α→ℝ)
    {m : ℕ} (q : α) (f : Fin m→α) :
    tuplePrice A w b (Fin.cons q f)=
      tuplePrice A w b f*(w q*(if q∈A∪tupleLabels f then 1 else b q)) := by
  unfold tuplePrice
  rw [Fin.prod_univ_succ,tupleLabels_cons]
  simp only [Fin.cons_zero,Fin.cons_succ]
  by_cases hA : q∈A
  · rw [Finset.insert_sdiff_of_mem _ hA,if_pos (Finset.mem_union_left _ hA)]
    ring
  · by_cases hf : q∈tupleLabels f
    · rw [Finset.insert_eq_of_mem hf,if_pos (Finset.mem_union_right _ hf)]
      ring
    · rw [Finset.insert_sdiff_of_notMem _ hA,
        Finset.prod_insert (by simp only [Finset.mem_sdiff,hf,false_and,not_false_eq_true]),
        if_neg (by simp only [Finset.mem_union,hA,hf,or_self,not_false_eq_true])]
      ring

theorem tupleMoment_zero {α : Type*} [Fintype α] [DecidableEq α] (A : Finset α) (w b : α→ℝ) :
    tupleMoment A w b 0=1 := by
  simp [tupleMoment,tuplePrice,tupleLabels]

theorem tupleMoment_succ {α : Type*} [Fintype α] [DecidableEq α] (A : Finset α) (w b : α→ℝ) (m : ℕ) :
    tupleMoment A w b (m+1)=
      ∑f : Fin m→α,tuplePrice A w b f*(∑q : α,w q*(if q∈A∪tupleLabels f then 1 else b q)) := by
  unfold tupleMoment
  rw [←(Fin.consEquiv (fun _ : Fin (m+1)=>α)).sum_comp (tuplePrice A w b)]
  rw [Fintype.sum_prod_type,Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro f _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q _
  exact tuplePrice_cons A w b q f

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.tuplePrice_cons
#print axioms NoThreeLine.FiniteWitnessMoments.tupleMoment_succ
