import NoThreeLine.StateWeightFlow
import NoThreeLine.MultiplicativeFlow

/-! Nonnegative and positive weights along the actual compensation ODE.
The coefficient is derived from the defined finite generator, with no
nonnegativity assumption on the path itself. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators

namespace NoThreeLine

def ProcessState.perCapitaGrowth {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask w : Grid n → ℝ) (p : Grid n) : ℝ :=
  if s.stopped = false ∧ (s.accounts p).status = .active then
    ∑ q ∈ s.activeEvents, (mask q*w q/n)*localGrowthFactor Γ s.selected p q
  else 0

theorem ProcessState.vectorField_eq_mul_perCapita {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask w : Grid n → ℝ) (p : Grid n) :
    s.compensatedVectorField Γ mask w p = w p * s.perCapitaGrowth Γ mask w p := by
  unfold compensatedVectorField perCapitaGrowth
  split_ifs <;> ring

theorem ProcessState.perCapitaGrowth_continuous {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (p : Grid n) :
    Continuous (fun w => s.perCapitaGrowth Γ mask w p) := by
  unfold perCapitaGrowth
  split_ifs <;> fun_prop

theorem ProcessState.flow_weight_nonneg {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (T : ℝ) (hT : 0 ≤ T)
    (w : ℝ → Grid n → ℝ) (hw : ContinuousOn w (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt w (s.compensatedVectorField Γ mask (w t)) t)
    (h0 : ∀ p, 0 ≤ w 0 p) (t : ℝ) (ht : t ∈ Icc 0 T) (p : Grid n) : 0 ≤ w t p := by
  apply multiplicative_flow_nonneg T hT (fun t => w t p)
    (fun t => s.perCapitaGrowth Γ mask (w t) p) _ _ _ (h0 p) t ht
  · exact (continuous_apply p).comp_continuousOn hw
  · exact (s.perCapitaGrowth_continuous Γ mask p).comp_continuousOn hw
  · intro u hu
    rw [← s.vectorField_eq_mul_perCapita]
    exact hasDerivAt_pi.mp (hd u hu) p

theorem ProcessState.flow_weight_pos {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (T : ℝ) (hT : 0 ≤ T)
    (w : ℝ → Grid n → ℝ) (hw : ContinuousOn w (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt w (s.compensatedVectorField Γ mask (w t)) t)
    (p : Grid n) (h0 : 0 < w 0 p) (t : ℝ) (ht : t ∈ Icc 0 T) : 0 < w t p := by
  apply multiplicative_flow_pos T hT (fun t => w t p)
    (fun t => s.perCapitaGrowth Γ mask (w t) p) _ _ _ h0 t ht
  · exact (continuous_apply p).comp_continuousOn hw
  · exact (s.perCapitaGrowth_continuous Γ mask p).comp_continuousOn hw
  · intro u hu
    rw [← s.vectorField_eq_mul_perCapita]
    exact hasDerivAt_pi.mp (hd u hu) p

theorem ProcessState.flow_valid {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (T : ℝ) (hT : 0 ≤ T) (hs : s.Valid)
    (w : ℝ → Grid n → ℝ) (hw : ContinuousOn w (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt w (s.compensatedVectorField Γ mask (w t)) t)
    (h0 : w 0 = fun p => (s.accounts p).weight) (t : ℝ) (ht : t ∈ Icc 0 T) :
    (s.withWeights (w t)).Valid := by
  apply s.withWeights_valid (w t) hs
  intro p
  apply s.flow_weight_nonneg Γ mask T hT w hw hd _ t ht p
  intro q
  simpa only [h0] using hs.2.2 q

end NoThreeLine

#print axioms NoThreeLine.ProcessState.flow_weight_nonneg
#print axioms NoThreeLine.ProcessState.flow_weight_pos
#print axioms NoThreeLine.ProcessState.flow_valid
