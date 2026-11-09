import NoThreeLine.BirthCreditContinuity
import NoThreeLine.WinnerMarkIntegral
import NoThreeLine.BoundedFlowCredit

/-! Credit at the first actual board-clock candidate, or the horizon.
The event is read from the existing infinite product of site clocks. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine

theorem ProcessState.withWeights_thinned_credit_measurable {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B : ℝ) (q p : Grid n) :
    Measurable (fun x : (Grid n → ℝ) × ℝ =>
      (((s.withWeights x.1).thinnedBirth Γ q (fun _ => false)
        ((s.withWeights x.1).acceptance mask B q) x.2).accounts p).credit) := by
  have he : (fun x : (Grid n → ℝ) × ℝ =>
      (((s.withWeights x.1).thinnedBirth Γ q (fun _ => false)
        ((s.withWeights x.1).acceptance mask B q) x.2).accounts p).credit) =
      (fun x : (Grid n → ℝ) × ℝ =>
        if x.2 ≤ (s.withWeights x.1).acceptance mask B q then
          (((s.withWeights x.1).birth Γ q (fun _ => false)).accounts p).credit
        else ((s.withWeights x.1).accounts p).credit) := by
    funext x
    unfold thinnedBirth
    split_ifs <;> rfl
  rw [he]
  apply Measurable.ite
  · exact measurableSet_le measurable_snd
      ((s.withWeights_acceptance_continuous mask B q).measurable.comp measurable_fst)
  · exact (s.withWeights_birth_credit_continuous Γ q p (fun _ => false)).measurable.comp
      measurable_fst
  · exact (s.withWeights_credit_continuous p).measurable.comp measurable_fst

def ProcessState.firstCreditObservable {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B T : ℝ)
    (w : ℝ → Grid n → ℝ) (p : Grid n) (x : (ℝ × Grid n) × ℝ) : ℝ :=
  if x.1.1 ≤ T then
    (((s.withWeights (w x.1.1)).thinnedBirth Γ x.1.2 (fun _ => false)
      ((s.withWeights (w x.1.1)).acceptance mask B x.1.2) x.2).accounts p).credit
  else ((s.withWeights (w T)).accounts p).credit

theorem ProcessState.firstCreditObservable_measurable {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B T : ℝ)
    (w : ℝ → Grid n → ℝ) (hw : Continuous w) (p : Grid n) :
    Measurable (s.firstCreditObservable Γ mask B T w p) := by
  classical
  let f : (ℝ × ℝ) × Grid n → ℝ := fun x =>
    if x.1.1 ≤ T then
      (((s.withWeights (w x.1.1)).thinnedBirth Γ x.2 (fun _ => false)
        ((s.withWeights (w x.1.1)).acceptance mask B x.2) x.1.2).accounts p).credit
    else ((s.withWeights (w T)).accounts p).credit
  have hf : Measurable f := by
    apply measurable_from_prod_countable_left
    intro q
    apply Measurable.ite
    · exact measurableSet_le measurable_fst measurable_const
    · exact (s.withWeights_thinned_credit_measurable Γ mask B q p).comp
        ((hw.measurable.comp measurable_fst).prodMk measurable_snd)
    · exact measurable_const
  exact hf.comp ((measurable_fst.fst.prodMk measurable_snd).prodMk measurable_fst.snd)

theorem ProcessState.firstCreditObservable_bounds {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B T : ℝ)
    (w : ℝ → Grid n → ℝ) (hw : ∀ t p, 0 ≤ w t p ∧ w t p ≤ B)
    (p : Grid n) (x : (ℝ × Grid n) × ℝ) :
    0 ≤ s.firstCreditObservable Γ mask B T w p x ∧
      s.firstCreditObservable Γ mask B T w p x ≤ B := by
  unfold firstCreditObservable
  split_ifs
  · exact (s.withWeights (w x.1.1)).thinnedBirth_credit_bounds Γ x.1.2 p (fun _ => false)
      _ x.2 B (hw x.1.1 p)
  · exact ((s.withWeights (w T)).accounts p).credit_bounds B (hw T p)

theorem ProcessState.actual_first_candidate_credit {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B T : ℝ)
    (hn : 0 < n) (hB : 0 < B) (hT : 0 ≤ T) (hs : s.Valid)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (w : ℝ → Grid n → ℝ) (hw : Continuous w)
    (hwB : ∀ t q, 0 ≤ w t q ∧ w t q ≤ B)
    (hwinit : w 0 = fun p => (s.accounts p).weight)
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt w (s.compensatedVectorField Γ mask (w t)) t)
    (p : Grid n) :
    (∫ ω, s.firstCreditObservable Γ mask B T w p (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂boardClockMeasure n (B/n)) = (s.accounts p).credit := by
  letI := isProbabilityMeasure_expMeasure (mul_pos (show (0 : ℝ) < n by exact_mod_cast hn) hB)
  have hi : Integrable (s.firstCreditObservable Γ mask B T w p)
      (((expMeasure (n*B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure) := by
    apply Integrable.of_bound (s.firstCreditObservable_measurable Γ mask B T w hw p).aestronglyMeasurable B
    apply Filter.Eventually.of_forall
    intro x
    have hb := s.firstCreditObservable_bounds Γ mask B T w hwB p x
    simpa only [Real.norm_eq_abs,abs_of_nonneg hb.1] using hb.2
  rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn B hB _ hi]
  have he (t : ℝ) :
      (∑ q : Grid n, ∫ z, s.firstCreditObservable Γ mask B T w p ((t,q),z) ∂markMeasure) /
          (n : ℝ)^2 =
        if t ≤ T then (s.withWeights (w t)).candidateCreditMean Γ mask B (fun _ _ => false) p
        else ((s.withWeights (w T)).accounts p).credit := by
    by_cases ht : t ≤ T
    · simp [firstCreditObservable,ht,ProcessState.candidateCreditMean]
    · have hn0 : (n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
      simp [firstCreditObservable,ht,Grid,Finset.sum_const,Fintype.card_prod,Fintype.card_fin,
        nsmul_eq_mul,pow_two,hn0]
  simp_rw [he]
  exact s.bounded_flow_first_candidate_credit Γ mask B T hn hB hT hs hm w hw.continuousOn
    (fun t _ q _ => (hwB t q).2) hwinit hd (fun _ _ _ => false) p

end NoThreeLine

#print axioms NoThreeLine.ProcessState.firstCreditObservable_measurable
#print axioms NoThreeLine.ProcessState.actual_first_candidate_credit
