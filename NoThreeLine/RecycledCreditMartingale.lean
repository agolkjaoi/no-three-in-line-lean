import NoThreeLine.IndependentHistoryIntegral

/-! Bounded state credit is a martingale for the natural state-history
filtration of a process driven by its actual recycled residual noise. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.RecycledBoardProcess

def state {S W : Type*} (F : S × W → S × W) (s : S) (k : ℕ) (w : W) : S := (iterate F s k w).1

theorem state_measurable {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (s : S) (k : ℕ) : Measurable (state F s k) :=
  (iterate_measurable F hF s k).fst

theorem history_residual_product {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun w => F (s,w)) =
      (ν.map (fun w => (F (s,w)).1)).prod ν) (s : S) (k : ℕ) :
    ν.map (fun w => (StateHistory.history (state F s) k w,(iterate F s k w).2)) =
      (ν.map (StateHistory.history (state F s) k)).prod ν := by
  have hp : Measurable (fun w => (StateHistory.history (state F s) k w,(iterate F s k w).2)) :=
    (StateHistory.history_measurable (state F s) (state_measurable F hF s) k).prodMk
      (iterate_measurable F hF s k).snd
  have h := RememberedRestart.history_residual_map F hF (fun a => (F a).1) hF.fst ν ν hsection s k
  change ν.map (fun w => (StateHistory.history (state F s) k w,(iterate F s k w).2)) = _ at h
  have hfst := congrArg (fun μ : Measure ((Fin (k+1) → S) × W) => μ.map Prod.fst) h
  rw [Measure.map_map measurable_fst hp,Measure.map_fst_prod,measure_univ,one_smul] at hfst
  change ν.map (StateHistory.history (state F s) k) = _ at hfst
  rw [hfst]
  exact h

theorem history_credit {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun w => F (s,w)) =
      (ν.map (fun w => (F (s,w)).1)).prod ν)
    (z : S → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ s, 0 ≤ z s ∧ z s ≤ B)
    (hmean : ∀ s, (∫ w, z (F (s,w)).1 ∂ν) = z s) (s : S) (k : ℕ)
    (E : Set W) (hE : MeasurableSet[StateHistory.filtration (state F s) (state_measurable F hF s) k] E) :
    (∫ w in E, z (state F s (k+1) w) ∂ν) = ∫ w in E, z (state F s k w) ∂ν := by
  change MeasurableSet[MeasurableSpace.comap (StateHistory.history (state F s) k) inferInstance] E at hE
  obtain ⟨A,hA,rfl⟩ := hE
  let H := StateHistory.history (state F s) k
  have hH : Measurable H := StateHistory.history_measurable _ (state_measurable F hF s) k
  letI : IsProbabilityMeasure (ν.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let f : (Fin (k+1) → S) × W → ℝ := fun a => z (F (a.1 (Fin.last k),a.2)).1
  let g : (Fin (k+1) → S) → ℝ := fun a => z (a (Fin.last k))
  have hf : Measurable f := hz.comp (hF.comp
    (((measurable_pi_apply (Fin.last k)).comp measurable_fst).prodMk measurable_snd)).fst
  have hg : Measurable g := hz.comp (measurable_pi_apply (Fin.last k))
  have hfi : Integrable f ((ν.map H).prod ν) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ f hf B (fun a => hb _)
  have heq := independent_history_setIntegral ν ν H (fun w => (iterate F s k w).2) hH
    (iterate_measurable F hF s k).snd (history_residual_product F hF ν hsection s k)
    f g hf hg hfi (fun a => hmean (a (Fin.last k))) A hA
  exact heq

theorem credit_martingale {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun w => F (s,w)) =
      (ν.map (fun w => (F (s,w)).1)).prod ν)
    (z : S → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ s, 0 ≤ z s ∧ z s ≤ B)
    (hmean : ∀ s, (∫ w, z (F (s,w)).1 ∂ν) = z s) (s : S) :
    Martingale (fun k w => z (state F s k w))
      (StateHistory.filtration (state F s) (state_measurable F hF s)) ν := by
  have hadp := StateHistory.state_stronglyAdapted (state F s) (state_measurable F hF s) z hz
  have hi (k : ℕ) : Integrable (fun w => z (state F s k w)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ (hz.comp (state_measurable F hF s k)) B (fun _ => hb _)
  rw [martingale_iff]
  exact ⟨supermartingale_of_setIntegral_succ_le hadp hi (fun k E hE =>
    (history_credit F hF ν hsection z hz B hb hmean s k E hE).le),
    submartingale_of_setIntegral_le_succ hadp hi (fun k E hE =>
      (history_credit F hF ν hsection z hz B hb hmean s k E hE).ge)⟩

end NoThreeLine.RecycledBoardProcess

#print axioms NoThreeLine.RecycledBoardProcess.history_residual_product
#print axioms NoThreeLine.RecycledBoardProcess.history_credit
#print axioms NoThreeLine.RecycledBoardProcess.credit_martingale
