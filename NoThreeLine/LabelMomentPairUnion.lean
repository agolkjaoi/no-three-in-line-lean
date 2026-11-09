import NoThreeLine.LabelMomentPair

/-! A prescribed bad relation between distinct labels is summed over every
pair of positions. Repetitions of the remaining labels are retained. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteWitnessMoments

def tuplePermEquiv {α : Type*} {m : ℕ} (σ : Equiv.Perm (Fin m)) :
    (Fin m→α) ≃ (Fin m→α) where
  toFun f := fun i=>f (σ i)
  invFun f := fun i=>f (σ.symm i)
  left_inv f := by funext i; simp
  right_inv f := by funext i; simp

theorem tupleLabels_perm {α : Type*} [DecidableEq α] {m : ℕ}
    (σ : Equiv.Perm (Fin m)) (f : Fin m→α) :
    tupleLabels (fun i=>f (σ i))=tupleLabels f := by
  ext q
  simp only [tupleLabels,Finset.mem_image,Finset.mem_univ,true_and]
  constructor
  · rintro ⟨i,hi⟩
    exact ⟨σ i,hi⟩
  · rintro ⟨i,hi⟩
    exact ⟨σ.symm i,by simpa using hi⟩

theorem tuplePrice_perm {α : Type*} [DecidableEq α] {m : ℕ}
    (A : Finset α) (w b : α→ℝ) (σ : Equiv.Perm (Fin m)) (f : Fin m→α) :
    tuplePrice A w b (fun i=>f (σ i))=tuplePrice A w b f := by
  unfold tuplePrice
  rw [tupleLabels_perm]
  congr 1
  exact Equiv.prod_comp σ (fun i=>w (f i))

theorem exists_perm_pair {ι : Type*} [DecidableEq ι] (a b i j : ι)
    (hab : a≠b) (hij : i≠j) :
    ∃σ : Equiv.Perm ι,σ a=i ∧ σ b=j := by
  let σ₀ : Equiv.Perm ι := Equiv.swap a i
  have ha : σ₀ a=i := Equiv.swap_apply_left a i
  have hk : σ₀.symm j≠a := by
    intro hh
    have he := congrArg σ₀ hh
    rw [Equiv.apply_symm_apply,ha] at he
    exact hij he.symm
  refine ⟨(Equiv.swap b (σ₀.symm j)).trans σ₀,?_,?_⟩
  · change σ₀ (Equiv.swap b (σ₀.symm j) a)=i
    rw [Equiv.swap_apply_of_ne_of_ne hab hk.symm,ha]
  · change σ₀ (Equiv.swap b (σ₀.symm j) b)=j
    rw [Equiv.swap_apply_left,Equiv.apply_symm_apply]

theorem pair_position_sum_eq {α : Type*} [Fintype α] [DecidableEq α]
    (R : α→α→Prop) [DecidableRel R] (w b : α→ℝ) (m : ℕ)
    (i j : Fin (m+2)) (hij : i≠j) :
    (∑f : Fin (m+2)→α,if R (f i) (f j) then tuplePrice ∅ w b f else 0)=
      ∑f : Fin (m+2)→α,if R (f 0) (f 1) then tuplePrice ∅ w b f else 0 := by
  obtain ⟨σ,hi,hj⟩ := exists_perm_pair (0:Fin (m+2)) 1 i j (Fin.zero_ne_one' (n:=m+1)) hij
  apply Fintype.sum_equiv (tuplePermEquiv σ)
  intro f
  change (if R (f i) (f j) then tuplePrice ∅ w b f else 0)=
    if R (f (σ 0)) (f (σ 1)) then tuplePrice ∅ w b (fun k=>f (σ k)) else 0
  rw [hi,hj,tuplePrice_perm]

theorem pair_position_moment_bound {α : Type*} [Fintype α] [DecidableEq α]
    (R : α→α→Prop) [DecidableRel R] (hR : ∀q r,R q r→q≠r)
    (w b : α→ℝ) (hw : ∀q,0≤w q) (hb : ∀q,0≤b q)
    (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) (m : ℕ)
    (i j : Fin (m+2)) (hij : i≠j) :
    (∑f : Fin (m+2)→α,if R (f i) (f j) then tuplePrice ∅ w b f else 0)≤
      pairWeight R w b*((∑q : α,w q*b q)+((m+2:ℕ):ℝ)*W)^m := by
  rw [pair_position_sum_eq R w b m i j hij]
  exact first_pair_moment_bound R hR w b hw hb W hW0 hW m

theorem bad_pair_price_le_sum {α : Type*} [DecidableEq α]
    (R : α→α→Prop) [DecidableRel R] (w b : α→ℝ)
    (hw : ∀q,0≤w q) (hb : ∀q,0≤b q) {m : ℕ} (f : Fin m→α) :
    (if ∃i j,i≠j ∧ R (f i) (f j) then tuplePrice ∅ w b f else 0)≤
      ∑i : Fin m,∑j : Fin m,if i≠j ∧ R (f i) (f j) then tuplePrice ∅ w b f else 0 := by
  have hn (i j : Fin m) :
      0≤(if i≠j ∧ R (f i) (f j) then tuplePrice ∅ w b f else 0) := by
    split_ifs
    · exact tuplePrice_nonneg ∅ w b hw hb f
    · exact le_rfl
  by_cases hx : ∃i j,i≠j ∧ R (f i) (f j)
  · rw [if_pos hx]
    obtain ⟨i,j,hij,hr⟩ := hx
    have hj := Finset.single_le_sum (fun k (_ : k∈(Finset.univ:Finset (Fin m)))=>hn i k)
      (Finset.mem_univ j)
    have hi : (∑j : Fin m,if i≠j ∧ R (f i) (f j) then tuplePrice ∅ w b f else 0)≤
        ∑i : Fin m,∑j : Fin m,if i≠j ∧ R (f i) (f j) then tuplePrice ∅ w b f else 0 := Finset.single_le_sum
      (fun k (_ : k∈(Finset.univ:Finset (Fin m)))=>Finset.sum_nonneg (fun l _=>hn k l))
      (Finset.mem_univ i)
    have hj' : tuplePrice ∅ w b f≤∑j : Fin m,
        if i≠j ∧ R (f i) (f j) then tuplePrice ∅ w b f else 0 := by
      rw [if_pos (And.intro hij hr)] at hj
      exact hj
    exact hj'.trans hi
  · rw [if_neg hx]
    exact Finset.sum_nonneg (fun i _=>Finset.sum_nonneg (fun j _=>hn i j))

theorem bad_pair_moment_bound {α : Type*} [Fintype α] [DecidableEq α]
    (R : α→α→Prop) [DecidableRel R] (hR : ∀q r,R q r→q≠r)
    (w b : α→ℝ) (hw : ∀q,0≤w q) (hb : ∀q,0≤b q)
    (W : ℝ) (hW0 : 0≤W) (hW : ∀q,w q≤W) (m : ℕ) :
    (∑f : Fin (m+2)→α,
      if ∃i j,i≠j ∧ R (f i) (f j) then tuplePrice ∅ w b f else 0)≤
      ((m+2:ℕ):ℝ)^2*pairWeight R w b*((∑q : α,w q*b q)+((m+2:ℕ):ℝ)*W)^m := by
  let B := pairWeight R w b*((∑q : α,w q*b q)+((m+2:ℕ):ℝ)*W)^m
  have hB : 0≤B := mul_nonneg (pairWeight_nonneg R w b hw hb)
    (pow_nonneg (add_nonneg (Finset.sum_nonneg (fun q _=>mul_nonneg (hw q) (hb q)))
      (mul_nonneg (Nat.cast_nonneg _) hW0)) m)
  calc
    _ ≤ ∑f : Fin (m+2)→α,∑i : Fin (m+2),∑j : Fin (m+2),
        if i≠j ∧ R (f i) (f j) then tuplePrice ∅ w b f else 0 :=
      Finset.sum_le_sum (fun f _=>bad_pair_price_le_sum R w b hw hb f)
    _ = ∑i : Fin (m+2),∑j : Fin (m+2),∑f : Fin (m+2)→α,
        if i≠j ∧ R (f i) (f j) then tuplePrice ∅ w b f else 0 := by
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro i _
      rw [Finset.sum_comm]
    _ ≤ ∑i : Fin (m+2),∑j : Fin (m+2),B := by
      apply Finset.sum_le_sum
      intro i _
      apply Finset.sum_le_sum
      intro j _
      by_cases hij : i≠j
      · have he (f : Fin (m+2)→α) :
            (if i≠j ∧ R (f i) (f j) then tuplePrice ∅ w b f else 0)=
              if R (f i) (f j) then tuplePrice ∅ w b f else 0 := by
          by_cases hr : R (f i) (f j)
          · rw [if_pos ⟨hij,hr⟩,if_pos hr]
          · rw [if_neg (fun hh=>hr hh.2),if_neg hr]
        simp_rw [he]
        exact pair_position_moment_bound R hR w b hw hb W hW0 hW m i j hij
      · simpa only [hij,false_and,if_false,Finset.sum_const_zero] using hB
    _ = _ := by simp only [Finset.sum_const,Finset.card_univ,Fintype.card_fin,nsmul_eq_mul]; dsimp [B]; ring

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.tuplePrice_perm
#print axioms NoThreeLine.FiniteWitnessMoments.bad_pair_moment_bound
