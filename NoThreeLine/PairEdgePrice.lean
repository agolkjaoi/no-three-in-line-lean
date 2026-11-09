import NoThreeLine.PairEdgeCount

/-! Exact distinct-new-witness price sums. The powers count labels in
the set difference, so an old label is never charged a second source price. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open PrimitiveLines GridLines

def edgePriceSum {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (U : Finset (Grid n)) (x : ℝ) : ℝ :=
  ∑ e∈edges Γ a b, x^((e.labels\U).card)

theorem edgePriceSum_eq {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (U : Finset (Grid n)) (x : ℝ) :
    edgePriceSum Γ a b U x=(newEdges Γ a b U 0).card+
      ((newEdges Γ a b U 1).card : ℝ)*x+((newEdges Γ a b U 2).card : ℝ)*x^2 := by
  have hmaps : ∀e∈edges Γ a b,(e.labels\U).card∈Finset.range 3 := by
    intro e he
    have h : (e.labels\U).card≤2 :=
      (Finset.card_le_card Finset.sdiff_subset).trans (edge_labels_card_le_two e)
    exact Finset.mem_range.mpr (by omega)
  have heq := Finset.sum_fiberwise_of_maps_to' hmaps (fun j : ℕ=>x^j)
  simpa only [edgePriceSum,newEdges,Finset.sum_const,nsmul_eq_mul,
    Finset.sum_range_succ,Finset.sum_range_zero,pow_zero,pow_one,mul_one,zero_add] using heq.symm

theorem edgePriceSum_nonneg {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (U : Finset (Grid n)) (x : ℝ) (hx : 0≤x) : 0≤edgePriceSum Γ a b U x :=
  Finset.sum_nonneg (fun e _=>pow_nonneg hx _)

theorem edgePriceSum_bound (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (Γ : Finset ZPoint) (a b : Grid n)
      (U : Finset (Grid n)), a∉U → b∉U → ∀ x : ℝ, 0≤x →
      edgePriceSum Γ a b U x≤((Γ.card : ℝ)+(U.card : ℝ))^2+
        2*((Γ.card : ℝ)+(U.card : ℝ))*C*(n : ℝ)^(1+ξ)*x+
        C*(n : ℝ)^(2+ξ)*x^2 := by
  obtain ⟨C,hC,h1⟩ := oneNewEdgeCover_card_le_const_rpow ξ hξ
  obtain ⟨D,hD,h2⟩ := twoNewEdgeCover_card_le_const_rpow ξ hξ
  refine ⟨C+D,add_pos hC hD,?_⟩
  intro n Γ a b U ha hb x hx
  have h0 : ((newEdges Γ a b U 0).card : ℝ)≤((Γ.card : ℝ)+(U.card : ℝ))^2 := by
    exact_mod_cast (Finset.card_le_card (newEdges_zero_subset Γ a b U)).trans
      (oldEdgeCover_card_le Γ a b U ha hb)
  have h1' : ((newEdges Γ a b U 1).card : ℝ)≤
      2*((Γ.card : ℝ)+(U.card : ℝ))*C*(n : ℝ)^(1+ξ) :=
    (Nat.cast_le.mpr (Finset.card_le_card (newEdges_one_subset Γ a b U))).trans (h1 n Γ a b U ha hb)
  have h2' : ((newEdges Γ a b U 2).card : ℝ)≤D*(n : ℝ)^(2+ξ) :=
    (Nat.cast_le.mpr (Finset.card_le_card (newEdges_two_subset Γ a b U))).trans (h2 n a b)
  rw [edgePriceSum_eq]
  calc
    _ ≤ ((Γ.card : ℝ)+(U.card : ℝ))^2+
        (2*((Γ.card : ℝ)+(U.card : ℝ))*C*(n : ℝ)^(1+ξ))*x+
        (D*(n : ℝ)^(2+ξ))*x^2 :=
      add_le_add (add_le_add h0 (mul_le_mul_of_nonneg_right h1' hx))
        (mul_le_mul_of_nonneg_right h2' (sq_nonneg x))
    _ ≤ _ := by
      have hc1 : 0≤2*((Γ.card : ℝ)+(U.card : ℝ))*D*(n : ℝ)^(1+ξ)*x := by positivity
      have hc2 : 0≤C*(n : ℝ)^(2+ξ)*x^2 := by positivity
      nlinarith

def edgePriceConstant (Γ : Finset ZPoint) (C T : ℝ) (m : ℕ) : ℝ :=
  ((Γ.card : ℝ)+2*m)^2+2*((Γ.card : ℝ)+2*m)*C*T+C*T^2+1

theorem edgePriceConstant_pos (Γ : Finset ZPoint) (C T : ℝ) (m : ℕ)
    (hC : 0≤C) (hT : 0≤T) : 0<edgePriceConstant Γ C T m := by
  unfold edgePriceConstant
  positivity

/-- The actual n per new witness cancels its source denominator exactly.
Only the subpower n^xi loss remains at this one-edge stage. -/
theorem edgePriceSum_source_bound (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (Γ : Finset ZPoint) (a b : Grid n)
      (U : Finset (Grid n)) (m : ℕ), a∉U → b∉U → U.card≤2*m →
      ∀ T : ℝ, 0≤T → edgePriceSum Γ a b U (T/n)≤edgePriceConstant Γ C T m*(n : ℝ)^ξ := by
  obtain ⟨C,hC,hbound⟩ := edgePriceSum_bound ξ hξ
  refine ⟨C,hC,?_⟩
  intro n Γ a b U m ha hb hm T hT
  have hnN : 0<n := (Nat.zero_le a.1.val).trans_lt a.1.isLt
  have hn : (0 : ℝ)<n := by exact_mod_cast hnN
  have hn1 : (1 : ℝ)≤n := by exact_mod_cast hnN
  have hpow1 : (n : ℝ)^(1+ξ)*(T/n)=T*(n : ℝ)^ξ := by
    rw [Real.rpow_add hn,Real.rpow_one]
    field_simp
  have hpow2 : (n : ℝ)^(2+ξ)*(T/n)^2=T^2*(n : ℝ)^ξ := by
    rw [Real.rpow_add hn]
    norm_num
    field_simp
  have hp : 1≤(n : ℝ)^ξ := Real.one_le_rpow hn1 hξ.le
  have hq : (Γ.card : ℝ)+(U.card : ℝ)≤(Γ.card : ℝ)+2*m := by exact_mod_cast Nat.add_le_add_left hm Γ.card
  have hq0 : 0≤(Γ.card : ℝ)+(U.card : ℝ) := by positivity
  have hb := hbound n Γ a b U ha hb (T/n) (by positivity)
  have hnorm : edgePriceSum Γ a b U (T/n)≤((Γ.card : ℝ)+(U.card : ℝ))^2+
      2*((Γ.card : ℝ)+(U.card : ℝ))*C*T*(n : ℝ)^ξ+C*T^2*(n : ℝ)^ξ := by
    calc
      _ ≤ _ := hb
      _ = _ := by
        rw [mul_assoc (2*((Γ.card : ℝ)+(U.card : ℝ))*C) _ _,hpow1,
          mul_assoc C _ _,hpow2]
        ring
  have hsquare := pow_le_pow_left₀ hq0 hq 2
  have hlin := mul_le_mul_of_nonneg_right hq (show 0≤2*C*T*(n : ℝ)^ξ by positivity)
  have hsqscale := mul_le_mul_of_nonneg_left hp (sq_nonneg ((Γ.card : ℝ)+2*m))
  unfold edgePriceConstant
  nlinarith [Real.rpow_nonneg (Nat.cast_nonneg n) ξ]

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.edgePriceSum_eq
#print axioms NoThreeLine.PairWitness.edgePriceSum_source_bound
