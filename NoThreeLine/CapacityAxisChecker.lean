import NoThreeLine.AxisRectangleIntegral
import NoThreeLine.OpenBandMaximum
import NoThreeLine.CapacityCellGeometry

/-! Finite open-band checks for actual horizontal and vertical chords of the
16-grid field. The factor 1/2 is the primitive-axis parity spacing. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators Classical
namespace NoThreeLine.FrozenCapacity

def axisSlot (vertical : Bool) (p : Fin 256) : Fin 16 :=
  if vertical then ⟨p.val/16,by omega⟩ else ⟨p.val%16,Nat.mod_lt _ (by decide)⟩

def axisBandValue (vertical : Bool) (w : Fin 256→ℚ) (j : Fin 16) : ℚ :=
  ∑ p : Fin 256, if axisSlot vertical p=j then w p/16 else 0

def AxisCheck (vertical : Bool) (w : Fin 256→ℚ) (U : ℚ) : Prop :=
  0≤U ∧ ∀ j : Fin 16, axisBandValue vertical w j≤2*U

theorem cell_horizontal_term (p : Fin 256) (w y : ℝ) :
    (if (cellRect p).real.y0<y ∧ y<(cellRect p).real.y1 then
      max 0 ((cellRect p).real.x1-(cellRect p).real.x0)*w else 0) =
    if CapacityAxis.openBand16 (axisSlot false p) y then w/16 else 0 := by
  simp only [cellRect,QRect.real,axisSlot,Bool.false_eq_true,ite_false,
    CapacityAxis.openBand16,Rat.cast_div,Rat.cast_add,Rat.cast_one,Rat.cast_natCast,Rat.cast_ofNat,Nat.cast_add,Nat.cast_one]
  have h : max (0:ℝ) ((((p.val/16:ℕ):ℝ)+1)/16-((p.val/16:ℕ):ℝ)/16)=1/16 := by
    rw [show ((((p.val/16:ℕ):ℝ)+1)/16-((p.val/16:ℕ):ℝ)/16)=(1/16:ℝ) by ring]
    norm_num
  rw [h]
  congr 1
  ring

theorem cell_vertical_term (p : Fin 256) (w x : ℝ) :
    (if (cellRect p).real.x0<x ∧ x<(cellRect p).real.x1 then
      max 0 ((cellRect p).real.y1-(cellRect p).real.y0)*w else 0) =
    if CapacityAxis.openBand16 (axisSlot true p) x then w/16 else 0 := by
  simp only [cellRect,QRect.real,axisSlot,ite_true,
    CapacityAxis.openBand16,Rat.cast_div,Rat.cast_add,Rat.cast_one,Rat.cast_natCast,Rat.cast_ofNat,Nat.cast_add,Nat.cast_one]
  have h : max (0:ℝ) ((((p.val%16:ℕ):ℝ)+1)/16-((p.val%16:ℕ):ℝ)/16)=1/16 := by
    rw [show ((((p.val%16:ℕ):ℝ)+1)/16-((p.val%16:ℕ):ℝ)/16)=(1/16:ℝ) by ring]
    norm_num
  rw [h]
  congr 1
  ring

theorem axisCheck_real_bands (vertical : Bool) (w : Fin 256→ℚ) (U : ℚ)
    (hc : AxisCheck vertical w U) (j : Fin 16) :
    (∑ p : Fin 256, if axisSlot vertical p=j then (w p:ℝ)/16 else 0)≤2*(U:ℝ) := by
  have h := hc.2 j
  unfold axisBandValue at h
  have h' : ((∑ p : Fin 256, if axisSlot vertical p=j then w p/16 else 0 : ℚ):ℝ)≤
      ((2*U:ℚ):ℝ) := by exact_mod_cast h
  push_cast at h'
  simpa only [apply_ite,Rat.cast_div,Rat.cast_ofNat,Rat.cast_zero] using h'

theorem horizontal_axisCheck_sound (w : Fin 256→ℚ) (U : ℚ)
    (hc : AxisCheck false w U) (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(w p:ℝ))) x y 0 / 2≤(U:ℝ) := by
  have hU : (0:ℝ)≤2*(U:ℝ) := mul_nonneg (by norm_num) (by exact_mod_cast hc.1)
  have h := CapacityAxis.openBand16_sum_le Finset.univ (axisSlot false)
    (fun p=>(w p:ℝ)/16) (2*(U:ℝ)) hU (axisCheck_real_bands false w U hc) y
  have he : directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(w p:ℝ))) x y 0 =
      ∑ p : Fin 256, if CapacityAxis.openBand16 (axisSlot false p) y then (w p:ℝ)/16 else 0 := by
    simp only [directionalChord,Matrix.cons_val_zero,zero_mul,add_zero]
    rw [rectangleField_horizontal_integral_eq]
    exact Finset.sum_congr rfl (fun p _=>cell_horizontal_term p (w p) y)
  rw [he]
  linarith

theorem vertical_axisCheck_sound (w : Fin 256→ℚ) (U : ℚ)
    (hc : AxisCheck true w U) (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(w p:ℝ))) x y 0 / 2≤(U:ℝ) := by
  have hU : (0:ℝ)≤2*(U:ℝ) := mul_nonneg (by norm_num) (by exact_mod_cast hc.1)
  have h := CapacityAxis.openBand16_sum_le Finset.univ (axisSlot true)
    (fun p=>(w p:ℝ)/16) (2*(U:ℝ)) hU (axisCheck_real_bands true w U hc) x
  have he : directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(w p:ℝ))) x y 0 =
      ∑ p : Fin 256, if CapacityAxis.openBand16 (axisSlot true p) x then (w p:ℝ)/16 else 0 := by
    change (∫ t : ℝ, rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(w p:ℝ)) (x+0*(t-y)) t) = _
    simp only [zero_mul,add_zero]
    rw [rectangleField_vertical_integral_eq]
    exact Finset.sum_congr rfl (fun p _=>cell_vertical_term p (w p) x)
  rw [he]
  linarith

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.horizontal_axisCheck_sound
#print axioms NoThreeLine.FrozenCapacity.vertical_axisCheck_sound
