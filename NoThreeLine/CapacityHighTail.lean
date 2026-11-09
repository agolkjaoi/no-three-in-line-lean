import NoThreeLine.CapacityCellGeometry

/-! Actual six-pair cell supremum, giving a bound for every height at least 8.
There is no finite truncation of the high-height directions. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
noncomputable section
namespace NoThreeLine.FrozenCapacity

theorem pairWeight_bounds (r s : Fin 4) (hrs : r≠s) (p : Fin 256) :
    0≤(pairWeight r s p:ℝ) ∧ (pairWeight r s p:ℝ)≤(1181489833/100000000:ℝ) := by
  have h : ∀ r s : Fin 4, r≠s → ∀ p : Fin 256,
      0≤pairWeight r s p ∧ pairWeight r s p≤(1181489833/100000000:ℚ) := by
    decide +kernel
  constructor
  · exact_mod_cast (h r s hrs p).1
  · have hu : (pairWeight r s p:ℝ)≤((1181489833/100000000:ℚ):ℝ) := by
      exact_mod_cast (h r s hrs p).2
    norm_num at hu ⊢
    exact hu

theorem pairChord_cap (r s : Fin 4) (hrs : r≠s) (f : Fin 4) (x y u : ℝ) :
    0≤directionalChord f (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight r s p:ℝ))) x y u ∧
    directionalChord f (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight r s p:ℝ))) x y u≤(1181489833/100000000:ℝ) := by
  have h := fieldChord_bounds_all_slopes Finset.univ (fun p=>(cellRect p).real.chart f)
    (fun p=>(pairWeight r s p:ℝ)) (1181489833/100000000)
    (chartRootX f x y) (chartRootY f x y) u (by norm_num)
    (rectanglesSeparated_chart _ _ cellRect_separated f)
    (fun p _=>pairWeight_bounds r s hrs p) (fun p _=>(cellRect_inUnit p).chart f)
  simpa only [rectangleField_chartChord_eq] using h

theorem pairCapacity_high (r s : Fin 4) (hrs : r≠s) (f : Fin 4) (x y u : ℝ)
    (h : ℕ) (hh : 8≤h) :
    directionalChord f (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight r s p:ℝ))) x y u/(2*(h:ℝ))≤(1181489833/1600000000:ℝ) := by
  have hc := (pairChord_cap r s hrs f x y u).2
  have hh' : (8:ℝ)≤h := by exact_mod_cast hh
  have hd : 0<2*(h:ℝ) := by linarith
  apply (div_le_iff₀ hd).mpr
  nlinarith

theorem scaled_pairCapacity_high (r s : Fin 4) (hrs : r≠s) (f : Fin 4) (x y u : ℝ)
    (h : ℕ) (hh : 8≤h) :
    (249/250:ℝ)*(directionalChord f
      (rectangleField Finset.univ (fun p=>(cellRect p).real)
        (fun p=>(pairWeight r s p:ℝ))) x y u/(2*(h:ℝ)))≤
      (294190968417/400000000000:ℝ) := by
  have hp := mul_le_mul_of_nonneg_left (pairCapacity_high r s hrs f x y u h hh)
    (by norm_num : (0:ℝ)≤249/250)
  norm_num at hp ⊢
  exact hp

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.pairWeight_bounds
#print axioms NoThreeLine.FrozenCapacity.scaled_pairCapacity_high
