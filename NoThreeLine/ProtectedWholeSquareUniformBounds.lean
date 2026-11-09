import NoThreeLine.ProtectedWholeSquareCandidate
import NoThreeLine.ProtectedEntropyUniformBounds

/-! Coarse finite bounds for the actual whole-square sources on every
valid incoming state. These bounds are for integrability, not sharp tails. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

private theorem norm_sum_const_bound {ι : Type*} (S : Finset ι) (f : ι→ℝ) (C : ℝ)
    (hf : ∀p∈S,‖f p‖≤C) : ‖∑p∈S,f p‖≤(S.card:ℝ)*C := by
  calc
    _ ≤ ∑p∈S,‖f p‖ := norm_sum_le _ _
    _ ≤ ∑_p∈S,C := Finset.sum_le_sum hf
    _ = _ := by simp only [Finset.sum_const,nsmul_eq_mul]

private theorem norm_subsum_const_bound {ι : Type*} (S E : Finset ι) (hSE : S⊆E)
    (f : ι→ℝ) (C : ℝ) (hC : 0≤C) (hf : ∀p∈S,‖f p‖≤C) :
    ‖∑p∈S,f p‖≤(E.card:ℝ)*C := by
  exact (norm_sum_const_bound S f C hf).trans
    (mul_le_mul_of_nonneg_right (by exact_mod_cast Finset.card_le_card hSE) hC)

private theorem active_specified_credit_bounds {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (L : LineIndex n) (hsp : specified Γ L)
    (p : Grid n) (hpL : p∈L.val) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hp : (e.process.accounts p).status=.active) :
    0≤specifiedLineWeight e L p ∧ specifiedLineWeight e L p≤2*B := by
  have hc := protectedLineCredit_bounds_all L e (fun _=>0) Γ hsp p hpL B he
    ⟨le_rfl,by positivity⟩
  simpa only [protectedLineCredit_active L e (fun _=>0) p hp] using hc

theorem protectedWholeTotal_norm_bounds {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (L : LineIndex n) (hsp : specified Γ L) (E : Finset (Grid n))
    (hE : E⊆L.val) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hsv : ∀p∈E,0≤saved p ∧ saved p≤2*B) :
    ‖protectedCreditTotal L E e saved‖≤(E.card:ℝ)*(2*B) ∧
      ‖protectedEntropyTotal L E B e saved‖≤(E.card:ℝ)*(2*B) := by
  have hc (p) (hp : p∈E) := protectedLineCredit_bounds_all L e saved Γ hsp p (hE hp) B he (hsv p hp)
  constructor
  · apply norm_sum_const_bound
    intro p hp
    rw [Real.norm_eq_abs,abs_of_nonneg (hc p hp).1]
    exact (hc p hp).2
  · apply norm_sum_const_bound
    intro p hp
    have hh := protectedEntropy_bounds B _ hB (hc p hp).1 (hc p hp).2
    change ‖protectedEntropy B (protectedLineCredit L e saved p)‖≤2*B
    rw [Real.norm_eq_abs,abs_of_nonneg hh.1]
    exact hh.2

theorem protectedWholeDeletion_norm_bounds {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (L : LineIndex n) (hsp : specified Γ L) (E : Finset (Grid n))
    (hE : E⊆L.val) (B : ℝ) (hB : 0<B) (he : e.Valid B) (q : Grid n) :
    ‖protectedExternalDeletion e Γ L E q‖≤(E.card:ℝ)*(4*B) ∧
      ‖protectedEntropyDeletion e Γ L E q B‖≤(E.card:ℝ)*(4*B) := by
  classical
  have hc (p) (hp : p∈E.filter (fun p=>(e.process.accounts p).status=.active)) :=
    active_specified_credit_bounds e Γ L hsp p (hE (Finset.mem_filter.mp hp).1) B hB he
      (Finset.mem_filter.mp hp).2
  constructor
  · apply norm_subsum_const_bound _ E (Finset.filter_subset _ _) _ (4*B) (by positivity)
    intro p hp
    have hJ := birthMultiplier_bounds Γ e.process.selected p q
    have ht0 := mul_nonneg (sub_nonneg.mpr hJ.2) (hc p hp).1
    rw [Real.norm_eq_abs,abs_of_nonneg ht0]
    exact (mul_le_mul_of_nonneg_right (show 1-birthMultiplier Γ e.process.selected p q≤1 by linarith)
      (hc p hp).1).trans (by nlinarith [(hc p hp).2])
  · apply norm_subsum_const_bound _ E (Finset.filter_subset _ _) _ (4*B) (by positivity)
    intro p hp
    have hJ := birthMultiplier_bounds Γ e.process.selected p q
    have hh := protectedEntropy_bounds B _ hB (hc p hp).1 (hc p hp).2
    have hhc := protectedEntropy_bounds B _ hB (mul_nonneg hJ.1 (hc p hp).1)
      ((mul_le_of_le_one_left (hc p hp).1 hJ.2).trans (hc p hp).2)
    calc
      _ ≤ ‖protectedEntropy B (specifiedLineWeight e L p)‖+
        ‖protectedEntropy B (birthMultiplier Γ e.process.selected p q*specifiedLineWeight e L p)‖ := norm_sub_le _ _
      _ ≤ 2*B+2*B := by
        rw [Real.norm_eq_abs,Real.norm_eq_abs,abs_of_nonneg hh.1,abs_of_nonneg hhc.1]
        exact add_le_add hh.2 hhc.2
      _ = _ := by ring

theorem protectedExternalEventRate_norm_bound {n : ℕ} (e : ExtendedState n)
    (mask : Grid n→ℝ) (L : LineIndex n) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (f : Grid n→ℝ) (D : ℝ) (hD : 0≤D)
    (hf : ∀q∈e.process.activeEvents,‖f q‖≤D) :
    ‖protectedExternalEventRate e mask L f‖≤(n:ℝ)^2*(B/n)*D := by
  have hr (q : Grid n) : 0≤e.process.birthRate mask q ∧ e.process.birthRate mask q≤B/n := by
    refine ⟨e.process.birthRate_nonneg mask (fun q=>(hm q).1) he.1 q,?_⟩
    have ha := e.process.acceptance_bounds mask B hB hm (fun q _=>he.2.1.1 q) q
    rw [←ProcessState.candidate_rate_times_acceptance e.process mask B hB.ne' q]
    exact mul_le_of_le_one_right (div_nonneg hB.le (Nat.cast_nonneg n)) ha.2
  have hcard : (e.process.activeEvents.card:ℝ)≤(n:ℝ)^2 := by
    exact_mod_cast (show e.process.activeEvents.card≤n^2 by
      simpa [Grid,pow_two] using Finset.card_le_univ e.process.activeEvents)
  calc
    _ ≤ (e.process.activeEvents.card:ℝ)*((B/n)*D) := by
      apply norm_sum_const_bound
      intro q hq
      split_ifs
      · simp only [norm_zero]; positivity
      · rw [norm_mul,Real.norm_eq_abs,abs_of_nonneg (hr q).1]
        exact mul_le_mul (hr q).2 (hf q hq) (norm_nonneg _) (div_nonneg hB.le (Nat.cast_nonneg n))
    _ ≤ (n:ℝ)^2*((B/n)*D) := mul_le_mul_of_nonneg_right hcard (by positivity)
    _ = _ := by ring

def protectedWholeSquareSourceCap (n : ℕ) (B : ℝ) (a : ℕ) (pointCap : ℝ) : ℝ :=
  2*((a:ℝ)*(2*B))*((a:ℝ)*pointCap)+(n:ℝ)^2*(B/n)*((a:ℝ)*(4*B))^2

theorem protectedCreditSquareSource_norm_bound {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (hsp : specified Γ L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (hsv : ∀p∈E,0≤saved p ∧ saved p≤2*B) :
    ‖protectedCreditSquareSource e saved Γ mask L E‖≤
      protectedWholeSquareSourceCap n B E.card ((B/n)*B) := by
  have ht := (protectedWholeTotal_norm_bounds e saved Γ L hsp E hE B hB he hsv).1
  have hs : ‖protectedCreditTotalSource e mask L E‖≤(E.card:ℝ)*((B/n)*B) := by
    apply norm_sum_const_bound
    intro p hp
    have h := protectedLinePositiveDrift_bounds_all e Γ mask L hsp p (hE hp) B he hm
    rw [Real.norm_eq_abs,abs_of_nonneg h.1]
    exact h.2
  have hj := protectedExternalEventRate_norm_bound e mask L B hB he hm
    (fun q=>(protectedExternalDeletion e Γ L E q)^2) (((E.card:ℝ)*(4*B))^2) (sq_nonneg _) (by
      intro q _
      rw [norm_pow]
      exact pow_le_pow_left₀ (norm_nonneg _) (protectedWholeDeletion_norm_bounds e Γ L hsp E hE B hB he q).1 2)
  unfold protectedCreditSquareSource protectedWholeSquareSourceCap
  apply (norm_add_le _ _).trans
  apply add_le_add _ hj
  rw [norm_mul,norm_mul,show ‖(2:ℝ)‖=2 by norm_num]
  exact mul_le_mul (mul_le_mul_of_nonneg_left ht (by norm_num)) hs (norm_nonneg _) (by positivity)

theorem protectedEntropySquareSource_norm_bound {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (hsp : specified Γ L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (B : ℝ) (hB : 0<B) (he : e.Valid B)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (hsv : ∀p∈E,0≤saved p ∧ saved p≤2*B) :
    ‖protectedEntropySquareSource e saved Γ mask L E B‖≤
      protectedWholeSquareSourceCap n B E.card (protectedEntropySourceCap n B) := by
  have ht := (protectedWholeTotal_norm_bounds e saved Γ L hsp E hE B hB he hsv).2
  have hs : ‖protectedEntropyTotalSource e saved Γ mask L E B‖≤(E.card:ℝ)*protectedEntropySourceCap n B := by
    apply norm_sum_const_bound
    intro p hp
    exact protectedEntropySource_bounds_all e saved Γ mask L hsp p (hE hp) B hB he hm
  have hj := protectedExternalEventRate_norm_bound e mask L B hB he hm
    (fun q=>(protectedEntropyDeletion e Γ L E q B)^2) (((E.card:ℝ)*(4*B))^2) (sq_nonneg _) (by
      intro q _
      rw [norm_pow]
      exact pow_le_pow_left₀ (norm_nonneg _) (protectedWholeDeletion_norm_bounds e Γ L hsp E hE B hB he q).2 2)
  unfold protectedEntropySquareSource protectedWholeSquareSourceCap
  apply (norm_add_le _ _).trans
  apply add_le_add _ hj
  rw [norm_mul,norm_mul,show ‖(2:ℝ)‖=2 by norm_num]
  exact mul_le_mul (mul_le_mul_of_nonneg_left ht (by norm_num)) hs (norm_nonneg _) (by positivity)

end NoThreeLine
#print axioms NoThreeLine.protectedCreditSquareSource_norm_bound
#print axioms NoThreeLine.protectedEntropySquareSource_norm_bound
