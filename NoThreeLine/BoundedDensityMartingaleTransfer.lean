import NoThreeLine.BoundedMartingaleTerminal
import NoThreeLine.SavedCreditHistory

/-! Bounded martingales under an actual terminal-density change of measure.
The application must supply both original-law martingales and the density's
almost-sure eventual stability. No independence under the changed law is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem savedCreditMeasure_bounded_history_setIntegral {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) [IsFiniteMeasure P] (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (Z z : Ω → ℝ) (hZm : Measurable Z) (hZi : Integrable Z P) (hZ0 : ∀ω, 0≤Z ω)
    (k : ℕ) (hCE : condExp (F k) P Z =ᵐ[P] z) (f : Ω → ℝ)
    (hf : @Measurable Ω ℝ (F k) inferInstance f) (B : ℝ) (hb : ∀ω, ‖f ω‖≤B)
    (E : Set Ω) (hE : MeasurableSet[F k] E) :
    (∫ω in E, f ω ∂savedCreditMeasure P Z)=∫ω in E, z ω*f ω ∂P := by
  classical
  have hE0 := F.le k E hE
  have hf0 := hf.mono (F.le k) le_rfl
  have hib (ω : Ω) : ‖E.indicator f ω‖≤max B 0 := by
    by_cases hω : ω∈E
    · simpa only [indicator_of_mem hω] using (hb ω).trans (le_max_left B 0)
    · simp only [indicator_of_notMem hω,norm_zero]
      exact le_max_right _ _
  have hi : Integrable (Z*(E.indicator f)) P :=
    hZi.mul_bdd (hf0.indicator hE0).aestronglyMeasurable (ae_of_all _ hib)
  have hh := savedCreditMeasure_history_integral P F Z z hZm hZi hZ0 k hCE
    (E.indicator f) (hf.indicator hE) hi
  have he : (fun ω=>z ω*E.indicator f ω)=E.indicator (fun ω=>z ω*f ω) := by
    funext ω
    by_cases hω : ω∈E <;> simp [hω]
  rw [he,integral_indicator hE0,integral_indicator hE0] at hh
  exact hh

theorem bounded_density_martingale_transfer {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) [IsFiniteMeasure P] (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (D H : ℕ → Ω → ℝ) (hD : Martingale D F P)
    (hDH : Martingale (fun k ω=>D k ω*H k ω) F P)
    (BD BH : ℝ) (hbD : ∀k ω, ‖D k ω‖≤BD) (hbH : ∀k ω, ‖H k ω‖≤BH)
    (hHm : ∀k, @Measurable Ω ℝ (F k) inferInstance (H k))
    (Z : Ω → ℝ) (hZm : Measurable Z) (hZi : Integrable Z P) (hZ0 : ∀ω, 0≤Z ω)
    (hstable : ∀ᵐω ∂P, ∀ᶠk in atTop, D k ω=Z ω)
    [IsFiniteMeasure (savedCreditMeasure P Z)] :
    Martingale H F (savedCreditMeasure P Z) := by
  have hCE (k : ℕ) : condExp (F k) P Z =ᵐ[P] D k :=
    martingale_terminal_condExp P F D hD BD hbD Z hZi hstable k
  have hadp : StronglyAdapted F H := fun k=>(hHm k).stronglyMeasurable
  have hi (k : ℕ) : Integrable (H k) (savedCreditMeasure P Z) := by
    apply (integrable_const BH).mono' ((hHm k).mono (F.le k) le_rfl).aestronglyMeasurable
    exact ae_of_all _ (hbH k)
  have heq (k : ℕ) (E : Set Ω) (hE : MeasurableSet[F k] E) :
      (∫ω in E,H (k+1) ω ∂savedCreditMeasure P Z)=
        ∫ω in E,H k ω ∂savedCreditMeasure P Z := by
    rw [savedCreditMeasure_bounded_history_setIntegral P F Z (D (k+1)) hZm hZi hZ0
      (k+1) (hCE (k+1)) (H (k+1)) (hHm (k+1)) BH (hbH (k+1)) E
      (F.mono (Nat.le_succ k) E hE)]
    rw [savedCreditMeasure_bounded_history_setIntegral P F Z (D k) hZm hZi hZ0
      k (hCE k) (H k) (hHm k) BH (hbH k) E hE]
    exact (hDH.setIntegral_eq (Nat.le_succ k) hE).symm
  rw [martingale_iff]
  exact ⟨supermartingale_of_setIntegral_succ_le hadp hi (fun k E hE=>(heq k E hE).le),
    submartingale_of_setIntegral_le_succ hadp hi (fun k E hE=>(heq k E hE).ge)⟩

end NoThreeLine

#print axioms NoThreeLine.savedCreditMeasure_bounded_history_setIntegral
#print axioms NoThreeLine.bounded_density_martingale_transfer
