import NoThreeLine.PairEdgePrice
import NoThreeLine.PairWitnessHistories

/-! The full mixed witness-history sum with one price per distinct label.
All one-edge geometric bounds are supplied internally; the state-dependent
choice of evidence is not a cardinality assumption. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open PrimitiveLines GridLines

def historyPriceSum {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (U : Finset (Grid n)) (x : ℝ) (m : ℕ) : ℝ :=
  ∑ l∈histories Γ a b m,x^((historyLabels l\U).card)

theorem historyPriceSum_zero {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (U : Finset (Grid n)) (x : ℝ) : historyPriceSum Γ a b U x 0=1 := by
  simp [historyPriceSum,histories,historyLabels]

theorem historyPriceSum_succ {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (U : Finset (Grid n)) (x : ℝ) (m : ℕ) :
    historyPriceSum Γ a b U x (m+1)=∑e∈edges Γ a b,
      x^((e.labels\U).card)*historyPriceSum Γ a b (U∪e.labels) x m := by
  unfold historyPriceSum
  rw [history_sum_succ]
  apply Finset.sum_congr rfl
  intro e he
  simp_rw [history_new_labels_card,pow_add]
  exact (Finset.mul_sum _ _ _).symm

theorem historyPriceSum_mono {n : ℕ} (Γ : Finset ZPoint) (a b : Grid n)
    (U : Finset (Grid n)) (x y : ℝ) (m : ℕ) (hx : 0≤x) (hxy : x≤y) :
    historyPriceSum Γ a b U x m≤historyPriceSum Γ a b U y m :=
  Finset.sum_le_sum (fun l _=>pow_le_pow_left₀ hx hxy _)

theorem historyPriceSum_source_bound (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (Γ : Finset ZPoint) (a b : Grid n)
      (T : ℝ), 0≤T → ∀ (M m : ℕ) (U : Finset (Grid n)),
      a∉U → b∉U → U.card+2*m≤2*M →
      historyPriceSum Γ a b U (T/n) m≤(edgePriceConstant Γ C T M*(n : ℝ)^ξ)^m := by
  obtain ⟨C,hC,hrow⟩ := edgePriceSum_source_bound ξ hξ
  refine ⟨C,hC,?_⟩
  intro n Γ a b T hT M m
  induction m with
  | zero => intro U ha hb hcard; simp [historyPriceSum_zero]
  | succ m ih =>
      intro U ha hb hcard
      let A := edgePriceConstant Γ C T M*(n : ℝ)^ξ
      have hA : 0≤A := mul_nonneg (edgePriceConstant_pos Γ C T M hC.le hT).le
        (Real.rpow_nonneg (Nat.cast_nonneg n) ξ)
      have hU : U.card≤2*M := by omega
      have hpoint (e : Edge n) (he : e∈edges Γ a b) :
          historyPriceSum Γ a b (U∪e.labels) (T/n) m≤A^m := by
        have hex := edge_labels_exclude_roots_cause Γ a b e he
        have hcard' : (U∪e.labels).card+2*m≤2*M := by
          have hu := Finset.card_union_le U e.labels
          have hec := edge_labels_card_le_two e
          omega
        exact ih (U∪e.labels) (by simpa only [Finset.mem_union,not_or] using And.intro ha hex.1)
          (by simpa only [Finset.mem_union,not_or] using And.intro hb hex.2.1) hcard'
      rw [historyPriceSum_succ]
      calc
        _ ≤ ∑e∈edges Γ a b,(T/n)^((e.labels\U).card)*A^m := by
          apply Finset.sum_le_sum
          intro e he
          exact mul_le_mul_of_nonneg_left (hpoint e he) (pow_nonneg (by positivity) _)
        _ = edgePriceSum Γ a b U (T/n)*A^m := (Finset.sum_mul _ _ _).symm
        _ ≤ A*A^m := mul_le_mul_of_nonneg_right (hrow n Γ a b U M ha hb hU T hT)
          (pow_nonneg hA m)
        _ = A^(m+1) := by ring

/-- Starting with no known witness gives the full fixed finite history
sum. The exponent is its actual union cardinality, not a count of slots. -/
theorem all_history_source_price_bound (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (Γ : Finset ZPoint) (a b : Grid n)
      (T : ℝ), 0≤T → ∀ m : ℕ,
      (∑l∈histories Γ a b m,(T/n)^((historyLabels l).card))≤
        (edgePriceConstant Γ C T m)^m*(n : ℝ)^((m : ℝ)*ξ) := by
  obtain ⟨C,hC,hbound⟩ := historyPriceSum_source_bound ξ hξ
  refine ⟨C,hC,?_⟩
  intro n Γ a b T hT m
  have h := hbound n Γ a b T hT m m ∅ (by simp) (by simp) (by simp)
  simp only [historyPriceSum,Finset.sdiff_empty] at h
  calc
    _ ≤ (edgePriceConstant Γ C T m*(n : ℝ)^ξ)^m := h
    _ = _ := by
      rw [mul_pow,Real.rpow_pow_comm (Nat.cast_nonneg n),
        ←Real.rpow_natCast_mul (Nat.cast_nonneg n) m ξ]

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.historyPriceSum_succ
#print axioms NoThreeLine.PairWitness.all_history_source_price_bound
