import NoThreeLine.StateMeasurable

/-! Measurability of actual geometry-before-retirement birth and thinning,
with the real product measurable structure on full process states. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

theorem birthGeometry_measurable {n : ℕ} (Γ : Finset (ℤ × ℤ)) (p q : Grid n) :
    Measurable (fun x : Finset (Grid n) × CreditAccount => birthGeometry Γ x.1 p q x.2) := by
  unfold birthGeometry
  apply Measurable.ite
  · exact (measurableSet_singleton CreditStatus.active).preimage
      (CreditAccount.measurable_status.comp measurable_snd)
  · by_cases hpq : p = q
    · simp only [if_pos hpq]
      exact measurable_const
    · simp only [if_neg hpq]
      apply Measurable.ite
      · exact (Set.to_countable {S : Finset (Grid n) | GeometricallyDead (insert q S) p}).measurableSet.preimage
          measurable_fst
      · exact measurable_const
      · apply CreditAccount.measurable_mk _ _ measurable_const
        exact ((measurable_of_countable (fun S : Finset (Grid n) => birthMultiplier Γ S p q)).comp
          measurable_fst).mul (CreditAccount.measurable_weight.comp measurable_snd)
  · exact measurable_snd

theorem birthAccount_measurable {n : ℕ} (Γ : Finset (ℤ × ℤ)) (p q : Grid n) :
    Measurable (fun x : (Finset (Grid n) × CreditAccount) × Bool =>
      birthAccount Γ x.1.1 p q x.1.2 x.2) :=
  CreditAccount.measurable_retire.comp
    (((birthGeometry_measurable Γ p q).comp measurable_fst).prodMk measurable_snd)

theorem ProcessState.measurable_account (n : ℕ) (p : Grid n) :
    Measurable (fun s : ProcessState n => s.accounts p) :=
  (measurable_pi_apply p).comp (measurable_accounts n)

theorem ProcessState.measurable_birth_fixed {n : ℕ} (Γ : Finset (ℤ × ℤ)) (q : Grid n) :
    Measurable (fun x : ProcessState n × (Grid n → Bool) => x.1.birth Γ q x.2) := by
  unfold birth
  apply Measurable.ite
  · exact ((measurableSet_singleton false).preimage
      ((measurable_stopped n).comp measurable_fst)).inter
      ((measurableSet_singleton CreditStatus.active).preimage
        (CreditAccount.measurable_status.comp ((measurable_account n q).comp measurable_fst)))
  · apply measurable_mk _ _ _ _ _ measurable_const
    · exact (measurable_of_countable (fun S : Finset (Grid n) => insert q S)).comp
        ((measurable_selected n).comp measurable_fst)
    · apply measurable_pi_lambda
      intro p
      exact (birthAccount_measurable Γ p q).comp
        ((((measurable_selected n).comp measurable_fst).prodMk
          ((measurable_account n p).comp measurable_fst)).prodMk
            ((measurable_pi_apply p).comp measurable_snd))
  · exact measurable_fst

theorem ProcessState.measurable_birth {n : ℕ} (Γ : Finset (ℤ × ℤ)) :
    Measurable (fun x : (ProcessState n × (Grid n → Bool)) × Grid n =>
      x.1.1.birth Γ x.2 x.1.2) :=
  measurable_from_prod_countable_left (fun q => measurable_birth_fixed Γ q)

theorem ProcessState.measurable_acceptance {n : ℕ} (mask : Grid n → ℝ) (B : ℝ) (q : Grid n) :
    Measurable (fun s : ProcessState n => s.acceptance mask B q) := by
  unfold acceptance
  apply Measurable.ite
  · exact ((measurableSet_singleton false).preimage (measurable_stopped n)).inter
      ((measurableSet_singleton CreditStatus.active).preimage
        (CreditAccount.measurable_status.comp (measurable_account n q)))
  · exact ((CreditAccount.measurable_weight.comp (measurable_account n q)).const_mul _).div_const B
  · exact measurable_const

theorem ProcessState.measurable_thinnedBirth_fixed {n : ℕ} (Γ : Finset (ℤ × ℤ))
    (mask : Grid n → ℝ) (B : ℝ) (q : Grid n) :
    Measurable (fun x : (ProcessState n × (Grid n → Bool)) × ℝ =>
      x.1.1.thinnedBirth Γ q x.1.2 (x.1.1.acceptance mask B q) x.2) := by
  unfold thinnedBirth
  apply Measurable.ite
  · exact measurableSet_le measurable_snd
      ((measurable_acceptance mask B q).comp measurable_fst.fst)
  · exact (measurable_birth_fixed Γ q).comp measurable_fst
  · exact measurable_fst.fst

theorem ProcessState.measurable_thinnedBirth {n : ℕ} (Γ : Finset (ℤ × ℤ))
    (mask : Grid n → ℝ) (B : ℝ) :
    Measurable (fun x : ((ProcessState n × (Grid n → Bool)) × ℝ) × Grid n =>
      x.1.1.1.thinnedBirth Γ x.2 x.1.1.2 (x.1.1.1.acceptance mask B x.2) x.1.2) :=
  measurable_from_prod_countable_left (fun q => measurable_thinnedBirth_fixed Γ mask B q)

end NoThreeLine

#print axioms NoThreeLine.ProcessState.measurable_birth
#print axioms NoThreeLine.ProcessState.measurable_thinnedBirth
