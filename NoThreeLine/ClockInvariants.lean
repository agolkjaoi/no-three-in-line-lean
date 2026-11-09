import NoThreeLine.AuxiliaryODE
import NoThreeLine.FlowPositivity
import Mathlib.Analysis.Calculus.Deriv.MeanValue

/-! Coordinate invariants of the actual fixed-mode weight/k/r ODE.
No sign or boundedness of the path is assumed. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators

namespace NoThreeLine.AuxiliaryODE

def clockDamping {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (L : LineIndex n) : ℝ :=
  if s.stopped = false ∧ specified Γ L ∧ occupancy s L ≤ 1 then
    lineIntensity s mask z L / (2 - (occupancy s L : ℝ)) else 0

def creditDamping {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (L : LineIndex n) : ℝ :=
  if s.stopped = false ∧ ¬specified Γ L ∧ occupancy s L = 1 then
    lineIntensity s mask z L else 0

theorem clockRHS_eq_gap_mul {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (L : LineIndex n) :
    clockRHS s Γ mask z L = (2 - z.2.1 L) * clockDamping s Γ mask z L := by
  unfold clockRHS clockDamping
  split_ifs <;> ring

theorem lineCreditRHS_eq_mul {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (L : LineIndex n) :
    lineCreditRHS s Γ mask z L = z.2.2 L * (-creditDamping s Γ mask z L) := by
  unfold lineCreditRHS creditDamping
  split_ifs <;> ring

theorem clockDamping_continuous {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (L : LineIndex n) :
    Continuous (fun z => clockDamping s Γ mask z L) := by
  unfold clockDamping
  split_ifs
  · exact (lineIntensity_contDiff s mask L).continuous.div_const _
  · exact continuous_const

theorem creditDamping_continuous {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (L : LineIndex n) :
    Continuous (fun z => creditDamping s Γ mask z L) := by
  unfold creditDamping
  split_ifs
  · exact (lineIntensity_contDiff s mask L).continuous
  · exact continuous_const

theorem lineIntensity_nonneg {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ)
    (z : Coordinates n) (hm : ∀ p, 0 ≤ mask p) (hw : ∀ p, 0 ≤ z.1 p) (L : LineIndex n) :
    0 ≤ lineIntensity s mask z L := by
  apply Finset.sum_nonneg
  intro p _
  unfold phaseRate
  split_ifs
  · exact div_nonneg (mul_nonneg (hm p) (hw p)) (Nat.cast_nonneg n)
  · exact le_rfl

theorem clockDamping_nonneg {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n)
    (hm : ∀ p, 0 ≤ mask p) (hw : ∀ p, 0 ≤ z.1 p) (L : LineIndex n) :
    0 ≤ clockDamping s Γ mask z L := by
  unfold clockDamping
  split_ifs with h
  · have hN : (occupancy s L : ℝ) ≤ 1 := by exact_mod_cast h.2.2
    exact div_nonneg (lineIntensity_nonneg s mask z hm hw L) (by linarith)
  · exact le_rfl

theorem creditDamping_nonneg {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n)
    (hm : ∀ p, 0 ≤ mask p) (hw : ∀ p, 0 ≤ z.1 p) (L : LineIndex n) :
    0 ≤ creditDamping s Γ mask z L := by
  unfold creditDamping
  split_ifs
  · exact lineIntensity_nonneg s mask z hm hw L
  · exact le_rfl

theorem scalar_flow_constant (T : ℝ) (hT : 0 ≤ T) (v : ℝ → ℝ)
    (hv : ContinuousOn v (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt v 0 t) (t : ℝ) (ht : t ∈ Icc 0 T) : v t = v 0 := by
  have he := multiplicative_flow_identity T hT v (fun _ => 0) hv continuous_const.continuousOn
    (fun u hu => by simpa using hd u hu) t ht
  simpa using he

section Flow
variable {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ)
  (T : ℝ) (hT : 0 ≤ T) (z : ℝ → Coordinates n) (hz : ContinuousOn z (Icc 0 T))
  (hd : ∀ t ∈ Ioo 0 T, HasDerivAt z (vectorField s Γ mask (z t)) t)
include hT hz hd

theorem flow_weights_nonneg (h0 : ∀ p, 0 ≤ (z 0).1 p) (t : ℝ) (ht : t ∈ Icc 0 T)
    (p : Grid n) : 0 ≤ (z t).1 p :=
  s.flow_weight_nonneg Γ mask T hT (fun u => (z u).1) hz.fst
    (fun u hu => (hd u hu).fst) h0 t ht p

theorem flow_weight_inactive_constant (p : Grid n) (hp : (s.accounts p).status ≠ .active)
    (t : ℝ) (ht : t ∈ Icc 0 T) : (z t).1 p = (z 0).1 p := by
  apply scalar_flow_constant T hT (fun u => (z u).1 p)
    ((continuous_apply p).comp_continuousOn hz.fst) _ t ht
  intro u hu
  have hh := hasDerivAt_pi.mp (hd u hu).fst p
  simpa [vectorField, ProcessState.compensatedVectorField, hp] using hh

theorem flow_clock_gap_deriv (L : LineIndex n) (t : ℝ) (ht : t ∈ Ioo 0 T) :
    HasDerivAt (fun u => 2 - (z u).2.1 L)
      ((2 - (z t).2.1 L) * (-clockDamping s Γ mask (z t) L)) t := by
  have hh := (hasDerivAt_pi.mp (hd t ht).snd.fst L).const_sub 2
  exact hh.congr_deriv (by change -clockRHS s Γ mask (z t) L = _; rw [clockRHS_eq_gap_mul]; ring)

theorem flow_clock_upper (L : LineIndex n) (h0 : (z 0).2.1 L ≤ 2)
    (t : ℝ) (ht : t ∈ Icc 0 T) : (z t).2.1 L ≤ 2 := by
  have hh := multiplicative_flow_nonneg T hT (fun u => 2 - (z u).2.1 L)
    (fun u => -clockDamping s Γ mask (z u) L)
    (continuous_const.continuousOn.sub ((continuous_apply L).comp_continuousOn hz.snd.fst))
    (((clockDamping_continuous s Γ mask L).comp_continuousOn hz).neg)
    (flow_clock_gap_deriv s Γ mask T hT z hz hd L) (sub_nonneg.mpr h0) t ht
  linarith

theorem flow_clock_strict_upper (L : LineIndex n) (h0 : (z 0).2.1 L < 2)
    (t : ℝ) (ht : t ∈ Icc 0 T) : (z t).2.1 L < 2 := by
  have hh := multiplicative_flow_pos T hT (fun u => 2 - (z u).2.1 L)
    (fun u => -clockDamping s Γ mask (z u) L)
    (continuous_const.continuousOn.sub ((continuous_apply L).comp_continuousOn hz.snd.fst))
    (((clockDamping_continuous s Γ mask L).comp_continuousOn hz).neg)
    (flow_clock_gap_deriv s Γ mask T hT z hz hd L) (sub_pos.mpr h0) t ht
  linarith

theorem flow_clock_lower (hm : ∀ p, 0 ≤ mask p) (hw0 : ∀ p, 0 ≤ (z 0).1 p)
    (L : LineIndex n) (hk0 : 0 ≤ (z 0).2.1 L) (hk2 : (z 0).2.1 L ≤ 2)
    (t : ℝ) (ht : t ∈ Icc 0 T) : 0 ≤ (z t).2.1 L := by
  have hmono : MonotoneOn (fun u => (z u).2.1 L) (Icc 0 T) := by
    apply monotoneOn_of_hasDerivWithinAt_nonneg (convex_Icc 0 T)
      ((continuous_apply L).comp_continuousOn hz.snd.fst)
      (f' := fun u => clockRHS s Γ mask (z u) L)
    · intro u hu
      rw [interior_Icc] at hu
      exact (hasDerivAt_pi.mp (hd u hu).snd.fst L).hasDerivWithinAt
    · intro u hu
      rw [interior_Icc] at hu
      rw [clockRHS_eq_gap_mul]
      exact mul_nonneg (sub_nonneg.mpr (flow_clock_upper s Γ mask T hT z hz hd L hk2 u
        ⟨hu.1.le, hu.2.le⟩))
        (clockDamping_nonneg s Γ mask (z u) hm
          (flow_weights_nonneg s Γ mask T hT z hz hd hw0 u ⟨hu.1.le, hu.2.le⟩) L)
  exact hk0.trans (hmono ⟨le_rfl, hT⟩ ht ht.1)

theorem flow_lineCredit_nonneg (L : LineIndex n) (h0 : 0 ≤ (z 0).2.2 L)
    (t : ℝ) (ht : t ∈ Icc 0 T) : 0 ≤ (z t).2.2 L := by
  apply multiplicative_flow_nonneg T hT (fun u => (z u).2.2 L)
    (fun u => -creditDamping s Γ mask (z u) L)
    ((continuous_apply L).comp_continuousOn hz.snd.snd)
    (((creditDamping_continuous s Γ mask L).comp_continuousOn hz).neg) _ h0 t ht
  intro u hu
  simpa only [vectorField, lineCreditRHS_eq_mul] using hasDerivAt_pi.mp (hd u hu).snd.snd L

theorem flow_lineCredit_upper (hm : ∀ p, 0 ≤ mask p) (hw0 : ∀ p, 0 ≤ (z 0).1 p)
    (L : LineIndex n) (hr0 : 0 ≤ (z 0).2.2 L) (hr1 : (z 0).2.2 L ≤ 1)
    (t : ℝ) (ht : t ∈ Icc 0 T) : (z t).2.2 L ≤ 1 := by
  have hanti : AntitoneOn (fun u => (z u).2.2 L) (Icc 0 T) := by
    apply antitoneOn_of_hasDerivWithinAt_nonpos (convex_Icc 0 T)
      ((continuous_apply L).comp_continuousOn hz.snd.snd)
      (f' := fun u => lineCreditRHS s Γ mask (z u) L)
    · intro u hu
      rw [interior_Icc] at hu
      exact (hasDerivAt_pi.mp (hd u hu).snd.snd L).hasDerivWithinAt
    · intro u hu
      rw [interior_Icc] at hu
      rw [lineCreditRHS_eq_mul]
      exact mul_nonpos_of_nonneg_of_nonpos
        (flow_lineCredit_nonneg s Γ mask T hT z hz hd L hr0 u ⟨hu.1.le, hu.2.le⟩)
        (neg_nonpos.mpr (creditDamping_nonneg s Γ mask (z u) hm
          (flow_weights_nonneg s Γ mask T hT z hz hd hw0 u ⟨hu.1.le, hu.2.le⟩) L))
  exact (hanti ⟨le_rfl, hT⟩ ht ht.1).trans hr1

theorem flow_clock_inactive_constant (L : LineIndex n)
    (hL : ¬(s.stopped = false ∧ specified Γ L ∧ occupancy s L ≤ 1))
    (t : ℝ) (ht : t ∈ Icc 0 T) : (z t).2.1 L = (z 0).2.1 L := by
  apply scalar_flow_constant T hT (fun u => (z u).2.1 L)
    ((continuous_apply L).comp_continuousOn hz.snd.fst) _ t ht
  intro u hu
  simpa only [vectorField, clockRHS, if_neg hL] using hasDerivAt_pi.mp (hd u hu).snd.fst L

theorem flow_lineCredit_inactive_constant (L : LineIndex n)
    (hL : ¬(s.stopped = false ∧ ¬specified Γ L ∧ occupancy s L = 1))
    (t : ℝ) (ht : t ∈ Icc 0 T) : (z t).2.2 L = (z 0).2.2 L := by
  apply scalar_flow_constant T hT (fun u => (z u).2.2 L)
    ((continuous_apply L).comp_continuousOn hz.snd.snd) _ t ht
  intro u hu
  simpa only [vectorField, lineCreditRHS, if_neg hL] using hasDerivAt_pi.mp (hd u hu).snd.snd L

end Flow
end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.flow_clock_lower
#print axioms NoThreeLine.AuxiliaryODE.flow_clock_strict_upper
#print axioms NoThreeLine.AuxiliaryODE.flow_lineCredit_upper
