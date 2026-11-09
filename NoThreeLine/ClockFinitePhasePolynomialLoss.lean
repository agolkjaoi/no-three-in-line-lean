import NoThreeLine.ClockFinitePhaseLinearInput

/-! The finite phase, cell, and line counts preserve smallness when the
uniform one-phase crossing estimate is twice the inverse cube of n. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
namespace NoThreeLine

theorem exists_clockFinitePhase_point_bound_le (K : ℝ) (J D : ℕ) (a : ℝ) (ha : 0<a) :
    ∃n0 : ℕ,2≤n0 ∧ ∀n≥n0,∀B : ℝ,0≤B → B≤n →
      B*((n:ℝ)*D)*((J:ℝ)*
        ((2/(2-K))^2*(J:ℝ)*(2*(n:ℝ)^(-(3:ℝ)))+
          (2*(n:ℝ)^(-(3:ℝ))+(2/(2-K))^2*((J-1:ℕ):ℝ)*(2*(n:ℝ)^(-(3:ℝ))))))≤a := by
  let A := (2/(2-K))^2
  let P := 2*(D:ℝ)*(J:ℝ)*(A*(J:ℝ)+(1+A*((J-1:ℕ):ℝ)))
  obtain ⟨m,hm⟩ := exists_nat_gt (P/a)
  refine ⟨max m 2,le_max_right _ _,?_⟩
  intro n hn B _ hBn
  have hnR : (0:ℝ)<n := by
    exact_mod_cast (show 0<n from zero_lt_two.trans_le ((le_max_right m 2).trans hn))
  have hmn : (m:ℝ)≤n := by exact_mod_cast (le_max_left m 2).trans hn
  have hP : P/(n:ℝ)≤a := by
    have h := (div_le_iff₀ ha).mp (hm.le.trans hmn)
    exact (div_le_iff₀ hnR).mpr (by simpa only [mul_comm] using h)
  let q := (n:ℝ)^(-(3:ℝ))
  have hq : q=((n:ℝ)^3)⁻¹ := by
    rw [show q=(n:ℝ)^(-(3:ℝ)) from rfl,Real.rpow_neg hnR.le]
    norm_num
  let W := (J:ℝ)*(A*(J:ℝ)*(2*q)+(2*q+A*((J-1:ℕ):ℝ)*(2*q)))
  have hW : 0≤W := by dsimp [W,A,q]; positivity
  change B*((n:ℝ)*D)*W≤a
  calc
    _ ≤ (n:ℝ)*((n:ℝ)*D)*W := mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right hBn (mul_nonneg hnR.le (Nat.cast_nonneg D))) hW
    _ = P/(n:ℝ) := by dsimp [W,P]; rw [hq]; field_simp [hnR.ne']
    _ ≤ a := hP

end NoThreeLine

#print axioms NoThreeLine.exists_clockFinitePhase_point_bound_le

