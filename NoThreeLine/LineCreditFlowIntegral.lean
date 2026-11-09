import NoThreeLine.ClockInvariants

/-! Exact integral decrement of a real line credit along the fixed-mode
ODE, on any subinterval. The damping includes its actual activation gate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.AuxiliaryODE

theorem flow_lineCredit_integral_between {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (T : ℝ)
    (z : ℝ→Coordinates n) (hz : ContinuousOn z (Icc 0 T))
    (hd : ∀t∈Ioo 0 T,HasDerivAt z (vectorField s Γ mask (z t)) t)
    (L : LineIndex n) (a b : ℝ) (ha : 0≤a) (hab : a≤b) (hb : b≤T) :
    (z a).2.2 L-(z b).2.2 L=
      ∫u in a..b,(z u).2.2 L*creditDamping s Γ mask (z u) L := by
  have hsub : Icc a b⊆Icc (0:ℝ) T := Icc_subset_Icc ha hb
  have hr : ContinuousOn (fun u=>(z u).2.2 L) (Icc 0 T) :=
    (continuous_apply L).comp_continuousOn hz.snd.snd
  have hcont : ContinuousOn (fun u=>(z u).2.2 L*creditDamping s Γ mask (z u) L) (Icc a b) :=
    (hr.mul ((creditDamping_continuous s Γ mask L).comp_continuousOn hz)).mono hsub
  have hi : IntervalIntegrable (fun u=>(z u).2.2 L*creditDamping s Γ mask (z u) L) volume a b := by
    apply ContinuousOn.intervalIntegrable
    simpa only [uIcc_of_le hab] using hcont
  have hder : ∀u∈Ioo a b,HasDerivAt (fun u=>-(z u).2.2 L)
      ((z u).2.2 L*creditDamping s Γ mask (z u) L) u := by
    intro u hu
    have hh := (hasDerivAt_pi.mp (hd u ⟨ha.trans_lt hu.1,hu.2.trans_le hb⟩).snd.snd L).neg
    apply hh.congr_deriv
    change -lineCreditRHS s Γ mask (z u) L=_
    rw [lineCreditRHS_eq_mul]
    ring
  have he := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le hab (hr.neg.mono hsub) hder hi
  simp only [Pi.neg_apply] at he
  linarith

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.flow_lineCredit_integral_between
