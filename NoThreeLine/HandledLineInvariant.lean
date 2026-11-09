import NoThreeLine.PendingGuardFlow

/-! A processed tag line contains no remaining active point. Its intensity
is zero and its line-credit coordinate freezes through subsequent flow. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators

namespace NoThreeLine.AuxiliaryODE

def HandledInactive {n : ℕ} (s : ProcessState n) (handled : Finset (LineIndex n)) : Prop :=
  ∀ L ∈ handled, ∀ p ∈ L.val, (s.accounts p).status ≠ .active

theorem handledInactive_empty {n : ℕ} (s : ProcessState n) : HandledInactive s ∅ := by
  simp [HandledInactive]

theorem handledInactive_withWeights {n : ℕ} (s : ProcessState n)
    (handled : Finset (LineIndex n)) (h : HandledInactive s handled) (w : Grid n → ℝ) :
    HandledInactive (s.withWeights w) handled := h

theorem handledInactive_birth {n : ℕ} (s : ProcessState n)
    (handled : Finset (LineIndex n)) (h : HandledInactive s handled)
    (Γ : Finset PrimitiveLines.ZPoint) (q : Grid n) (positive : Grid n → Bool) :
    HandledInactive (s.birth Γ q positive) handled := by
  intro L hL p hp ha
  apply h L hL p hp
  unfold ProcessState.birth at ha
  split_ifs at ha
  · exact (birthGeometry_active Γ s.selected p q (s.accounts p)
      (CreditAccount.retire_active _ _ ha)).1
  · exact ha

theorem handledInactive_resolve {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (k r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n)) (hh : HandledInactive s handled) :
    HandledInactive (resolveBoundary s Γ B K ρ k r handled)
      (handledAfter s Γ r ρ handled) := by
  intro L hL p hp ha
  unfold resolveBoundary at ha
  split_ifs at ha with hc
  · have hold : (s.accounts p).status = .active := CreditAccount.retire_active _ _ ha
    simp [ProcessState.stop,CreditAccount.retire,hold] at ha
  · have hold : (s.accounts p).status = .active := CreditAccount.retire_active _ _ ha
    rcases Finset.mem_union.mp hL with hprior | hnew
    · exact hh L hprior p hp hold
    · have hpos : boundaryRetirement s Γ B ρ r handled p = true := by
        simp only [boundaryRetirement,decide_eq_true_eq]
        exact Or.inr ⟨L,hnew,hp⟩
      simp [ProcessState.retire,CreditAccount.retire,hold,hpos] at ha

theorem handled_lineIntensity_zero {n : ℕ} (s : ProcessState n)
    (handled : Finset (LineIndex n)) (hh : HandledInactive s handled)
    (mask : Grid n → ℝ) (z : Coordinates n) (L : LineIndex n) (hL : L ∈ handled) :
    lineIntensity s mask z L = 0 := by
  apply Finset.sum_eq_zero
  intro p hp
  simp [phaseRate,hh L hL p hp]

theorem handled_lineCreditRHS_zero {n : ℕ} (s : ProcessState n)
    (handled : Finset (LineIndex n)) (hh : HandledInactive s handled)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (z : Coordinates n)
    (L : LineIndex n) (hL : L ∈ handled) : lineCreditRHS s Γ mask z L = 0 := by
  simp [lineCreditRHS,handled_lineIntensity_zero s handled hh mask z L hL]

theorem handled_lineCredit_constant {n : ℕ} (s : ProcessState n)
    (handled : Finset (LineIndex n)) (hh : HandledInactive s handled)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ)
    (T : ℝ) (hT : 0 ≤ T) (z : ℝ → Coordinates n)
    (hz : ContinuousOn z (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt z (vectorField s Γ mask (z t)) t)
    (L : LineIndex n) (hL : L ∈ handled) (t : ℝ) (ht : t ∈ Icc 0 T) :
    (z t).2.2 L = (z 0).2.2 L := by
  apply scalar_flow_constant T hT (fun u => (z u).2.2 L)
    ((continuous_apply L).comp_continuousOn hz.snd.snd) _ t ht
  intro u hu
  have hdu := hasDerivAt_pi.mp (hd u hu).snd.snd L
  simpa only [vectorField,handled_lineCreditRHS_zero s handled hh Γ mask (z u) L hL] using hdu

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.handledInactive_resolve
#print axioms NoThreeLine.AuxiliaryODE.handled_lineCredit_constant
