import NoThreeLine.NonnegativeSupermartingaleMaximal

/-! Insert one observation between updates and freeze its first hit forever.
The original X need not be a supermartingale: only the inserted conditional
mean inequality and agreement on a missed cut are required. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Classical

namespace NoThreeLine

def insertedCutHit {Ω : Type*} (E : ℕ → Set Ω) : ℕ → Set Ω
  | 0 => ∅
  | k+1 => insertedCutHit E k ∪ E k

def insertedCutValue {Ω : Type*} (X Z : ℕ → Ω → ℝ) (E : ℕ → Set Ω) : ℕ → Ω → ℝ
  | 0 => X 0
  | k+1 => fun ω => if ω ∈ insertedCutHit E k then insertedCutValue X Z E k ω else Z k ω

theorem mem_insertedCutHit {Ω : Type*} (E : ℕ → Set Ω) (k : ℕ) (ω : Ω) :
    ω ∈ insertedCutHit E k ↔ ∃j<k, ω ∈ E j := by
  induction k with
  | zero => simp [insertedCutHit]
  | succ k ih =>
      change (ω ∈ insertedCutHit E k ∨ ω ∈ E k) ↔ _
      rw [ih]
      constructor
      · rintro (⟨j,hj,he⟩ | he)
        · exact ⟨j,Nat.lt.step hj,he⟩
        · exact ⟨k,Nat.lt_succ_self k,he⟩
      · rintro ⟨j,hj,he⟩
        by_cases h : j<k
        · exact Or.inl ⟨j,h,he⟩
        · have heq : j=k := by omega
          exact Or.inr (heq ▸ he)

theorem insertedCutValue_frozen_succ {Ω : Type*} (X Z : ℕ → Ω → ℝ)
    (E : ℕ → Set Ω) (k : ℕ) (ω : Ω) (h : ω ∈ insertedCutHit E k) :
    insertedCutValue X Z E (k+1) ω = insertedCutValue X Z E k ω := by
  simp only [insertedCutValue, if_pos h]

theorem insertedCutValue_eq_of_not_hit {Ω : Type*} (X Z : ℕ → Ω → ℝ)
    (E : ℕ → Set Ω) (hcontinue : ∀k ω, ω ∉ E k → Z k ω = X (k+1) ω)
    (k : ℕ) (ω : Ω) (h : ω ∉ insertedCutHit E k) :
    insertedCutValue X Z E k ω = X k ω := by
  cases k with
  | zero => rfl
  | succ k =>
      have hH : ω ∉ insertedCutHit E k := fun hw => h (Or.inl hw)
      have hE : ω ∉ E k := fun hw => h (Or.inr hw)
      simpa only [insertedCutValue, if_neg hH] using hcontinue k ω hE

theorem insertedCutHit_measurable {Ω : Type*} [MeasurableSpace Ω]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω)) (E : ℕ → Set Ω)
    (hE : ∀k, MeasurableSet[F (k+1)] (E k)) (k : ℕ) :
    MeasurableSet[F k] (insertedCutHit E k) := by
  induction k with
  | zero => exact @MeasurableSet.empty Ω (F 0)
  | succ k ih => exact ((F.mono (Nat.le_succ k)) _ ih).union (hE k)

theorem insertedCutValue_measurable {Ω : Type*} [MeasurableSpace Ω]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (X Z : ℕ → Ω → ℝ) (E : ℕ → Set Ω)
    (hX : ∀k, Measurable[F k] (X k)) (hZ : ∀k, Measurable[F (k+1)] (Z k))
    (hE : ∀k, MeasurableSet[F (k+1)] (E k)) (k : ℕ) :
    Measurable[F k] (insertedCutValue X Z E k) := by
  induction k with
  | zero => exact hX 0
  | succ k ih =>
      exact Measurable.ite
        ((F.mono (Nat.le_succ k)) _ (insertedCutHit_measurable F E hE k))
        (ih.mono (F.mono (Nat.le_succ k)) le_rfl) (hZ k)

theorem insertedCutValue_bounds {Ω : Type*} (X Z : ℕ → Ω → ℝ)
    (E : ℕ → Set Ω) (B : ℝ)
    (hXB : ∀k ω, 0 ≤ X k ω ∧ X k ω ≤ B)
    (hZB : ∀k ω, 0 ≤ Z k ω ∧ Z k ω ≤ B) (k : ℕ) (ω : Ω) :
    0 ≤ insertedCutValue X Z E k ω ∧ insertedCutValue X Z E k ω ≤ B := by
  induction k with
  | zero => exact hXB 0 ω
  | succ k ih =>
      simp only [insertedCutValue]
      split_ifs
      · exact ih
      · exact hZB k ω

theorem insertedCutValue_supermartingale {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (X Z : ℕ → Ω → ℝ) (E : ℕ → Set Ω) (B : ℝ)
    (hX : ∀k, Measurable[F k] (X k)) (hZ : ∀k, Measurable[F (k+1)] (Z k))
    (hE : ∀k, MeasurableSet[F (k+1)] (E k))
    (hXB : ∀k ω, 0 ≤ X k ω ∧ X k ω ≤ B)
    (hZB : ∀k ω, 0 ≤ Z k ω ∧ Z k ω ≤ B)
    (hmean : ∀k A, MeasurableSet[F k] A → (∫ω in A, Z k ω ∂μ) ≤ ∫ω in A, X k ω ∂μ)
    (hcontinue : ∀k ω, ω ∉ E k → Z k ω = X (k+1) ω) :
    Supermartingale (insertedCutValue X Z E) F μ := by
  have hYm := insertedCutValue_measurable F X Z E hX hZ hE
  have hYB := insertedCutValue_bounds X Z E B hXB hZB
  have hiY (k : ℕ) : Integrable (insertedCutValue X Z E k) μ :=
    Integrable.of_bound ((hYm k).mono (F.le k) le_rfl).aestronglyMeasurable B
      (ae_of_all μ (fun ω => by simpa only [Real.norm_eq_abs, abs_of_nonneg (hYB k ω).1] using (hYB k ω).2))
  have hiX (k : ℕ) : Integrable (X k) μ :=
    Integrable.of_bound ((hX k).mono (F.le k) le_rfl).aestronglyMeasurable B
      (ae_of_all μ (fun ω => by simpa only [Real.norm_eq_abs, abs_of_nonneg (hXB k ω).1] using (hXB k ω).2))
  have hiZ (k : ℕ) : Integrable (Z k) μ :=
    Integrable.of_bound ((hZ k).mono (F.le (k+1)) le_rfl).aestronglyMeasurable B
      (ae_of_all μ (fun ω => by simpa only [Real.norm_eq_abs, abs_of_nonneg (hZB k ω).1] using (hZB k ω).2))
  apply supermartingale_of_setIntegral_succ_le (fun k => (hYm k).stronglyMeasurable) hiY
  intro k A hA
  let H := insertedCutHit E k
  have hH : MeasurableSet[F k] H := insertedCutHit_measurable F E hE k
  have hHa : MeasurableSet H := F.le k _ hH
  have hnext : insertedCutValue X Z E (k+1) =
      fun ω => H.indicator (insertedCutValue X Z E k) ω + Hᶜ.indicator (Z k) ω := by
    funext ω
    by_cases hw : ω ∈ H <;> simp [insertedCutValue, H, Set.indicator, hw]
  have hprev : insertedCutValue X Z E k =
      fun ω => H.indicator (insertedCutValue X Z E k) ω + Hᶜ.indicator (X k) ω := by
    funext ω
    by_cases hw : ω ∈ H
    · simp [Set.indicator, hw]
    · have he := insertedCutValue_eq_of_not_hit X Z E hcontinue k ω hw
      simp [Set.indicator, hw, he]
  calc
    (∫ω in A, insertedCutValue X Z E (k+1) ω ∂μ) =
        (∫ω in A ∩ H, insertedCutValue X Z E k ω ∂μ) + ∫ω in A ∩ Hᶜ, Z k ω ∂μ := by
      rw [hnext, integral_add ((hiY k).indicator hHa).integrableOn
        ((hiZ k).indicator hHa.compl).integrableOn,
        setIntegral_indicator hHa, setIntegral_indicator hHa.compl]
    _ ≤ (∫ω in A ∩ H, insertedCutValue X Z E k ω ∂μ) + ∫ω in A ∩ Hᶜ, X k ω ∂μ :=
      add_le_add le_rfl (hmean k (A ∩ Hᶜ) (hA.inter hH.compl))
    _ = ∫ω in A, insertedCutValue X Z E k ω ∂μ := by
      conv_rhs => rw [hprev]
      rw [integral_add ((hiY k).indicator hHa).integrableOn
        ((hiX k).indicator hHa.compl).integrableOn,
        setIntegral_indicator hHa, setIntegral_indicator hHa.compl]

theorem insertedCutValue_maximal {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (X Z : ℕ → Ω → ℝ) (E : ℕ → Set Ω) (B : ℝ)
    (hX : ∀k, Measurable[F k] (X k)) (hZ : ∀k, Measurable[F (k+1)] (Z k))
    (hE : ∀k, MeasurableSet[F (k+1)] (E k))
    (hXB : ∀k ω, 0 ≤ X k ω ∧ X k ω ≤ B)
    (hZB : ∀k ω, 0 ≤ Z k ω ∧ Z k ω ≤ B)
    (hmean : ∀k A, MeasurableSet[F k] A → (∫ω in A, Z k ω ∂μ) ≤ ∫ω in A, X k ω ∂μ)
    (hcontinue : ∀k ω, ω ∉ E k → Z k ω = X (k+1) ω)
    (r : ℝ) (hr : 0 < r) :
    μ {ω | ∃k, r ≤ insertedCutValue X Z E k ω} ≤
      ENNReal.ofReal ((∫ω, X 0 ω ∂μ) / r) := by
  exact nonnegativeSupermartingale_maximal μ F (insertedCutValue X Z E)
    (insertedCutValue_supermartingale μ F X Z E B hX hZ hE hXB hZB hmean hcontinue)
    (fun k ω => (insertedCutValue_bounds X Z E B hXB hZB k ω).1) r hr

end NoThreeLine
#print axioms NoThreeLine.insertedCutValue_supermartingale
#print axioms NoThreeLine.insertedCutValue_maximal
