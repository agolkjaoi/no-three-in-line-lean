import NoThreeLine.ProcessODE

/-! Convert a weight curve in one fixed discrete mode to the actual common
state, and derive the derivative of saved point credit from its weight ODE.
No positivity or global flow is silently supplied by this conversion. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine

def ProcessState.withWeights {n : ℕ} (s : ProcessState n) (w : Grid n → ℝ) : ProcessState n :=
  ⟨s.selected,fun p => ⟨(s.accounts p).status,w p⟩,s.stopped⟩

@[simp] theorem ProcessState.withWeights_status {n : ℕ} (s : ProcessState n)
    (w : Grid n → ℝ) (p : Grid n) :
    ((s.withWeights w).accounts p).status = (s.accounts p).status := rfl

@[simp] theorem ProcessState.withWeights_weight {n : ℕ} (s : ProcessState n)
    (w : Grid n → ℝ) (p : Grid n) : ((s.withWeights w).accounts p).weight = w p := rfl

theorem ProcessState.withWeights_self {n : ℕ} (s : ProcessState n) :
    s.withWeights (fun p => (s.accounts p).weight) = s := by
  cases s with
  | mk selected accounts stopped =>
    congr

theorem ProcessState.withWeights_valid {n : ℕ} (s : ProcessState n)
    (w : Grid n → ℝ) (hs : s.Valid) (hw : ∀ p, 0 ≤ w p) : (s.withWeights w).Valid :=
  ⟨hs.1,hs.2.1,hw⟩

theorem ProcessState.withWeights_credit {n : ℕ} (s : ProcessState n)
    (w : Grid n → ℝ) (p : Grid n) :
    ((s.withWeights w).accounts p).credit =
      if (s.accounts p).status = .active ∨ (s.accounts p).status = .retired then w p else 0 := rfl

theorem ProcessState.withWeights_continuousCreditDrift {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask w : Grid n → ℝ) (p : Grid n) :
    (s.withWeights w).continuousCreditDrift Γ ((s.withWeights w).birthRate mask) p =
      s.compensatedVectorField Γ mask w p := by
  exact ((s.withWeights w).compensatedVectorField_at_state Γ mask p).symm

theorem ProcessState.flow_credit_continuousOn {n : ℕ} (s : ProcessState n)
    (w : ℝ → Grid n → ℝ) (I : Set ℝ) (hw : ContinuousOn w I) (p : Grid n) :
    ContinuousOn (fun t => ((s.withWeights (w t)).accounts p).credit) I := by
  by_cases hp : (s.accounts p).status = .active ∨ (s.accounts p).status = .retired
  · simpa only [withWeights_credit,if_pos hp,Function.comp_def] using
      (continuous_apply p).comp_continuousOn hw
  · simpa only [withWeights_credit,if_neg hp] using
      (continuous_const.continuousOn : ContinuousOn (fun _ : ℝ => (0 : ℝ)) I)

theorem ProcessState.flow_credit_hasDerivAt {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ)
    (w : ℝ → Grid n → ℝ) (t : ℝ) (p : Grid n)
    (hd : HasDerivAt w (s.compensatedVectorField Γ mask (w t)) t) :
    HasDerivAt (fun u => ((s.withWeights (w u)).accounts p).credit)
      ((s.withWeights (w t)).continuousCreditDrift Γ ((s.withWeights (w t)).birthRate mask) p) t := by
  rw [withWeights_continuousCreditDrift]
  by_cases hp : (s.accounts p).status = .active ∨ (s.accounts p).status = .retired
  · simpa only [withWeights_credit,if_pos hp] using (hasDerivAt_pi.mp hd p)
  · have hpa : (s.accounts p).status ≠ .active := fun h => hp (Or.inl h)
    have hz : s.compensatedVectorField Γ mask (w t) p = 0 := by
      simp [compensatedVectorField,hpa]
    simpa only [withWeights_credit,if_neg hp,hz] using (hasDerivAt_const t (0 : ℝ))

theorem ProcessState.flow_drift_continuousOn {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ)
    (w : ℝ → Grid n → ℝ) (I : Set ℝ) (hw : ContinuousOn w I) (p : Grid n) :
    ContinuousOn (fun t =>
      (s.withWeights (w t)).continuousCreditDrift Γ ((s.withWeights (w t)).birthRate mask) p) I := by
  simp only [withWeights_continuousCreditDrift]
  exact (continuous_apply p).comp_continuousOn
    ((s.compensatedVectorField_contDiff Γ mask).continuous.comp_continuousOn hw)

end NoThreeLine

#print axioms NoThreeLine.ProcessState.withWeights_continuousCreditDrift
#print axioms NoThreeLine.ProcessState.flow_credit_hasDerivAt
