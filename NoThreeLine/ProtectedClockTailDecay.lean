import NoThreeLine.SectionHeightErrorLimit
import NoThreeLine.ProtectedEnergyGuardHistory

/-! The energy-scale exponential error is smaller than every fixed
negative power. The cell's positive drift fits an arbitrarily small
linear budget for every fixed total elapsed-time and normalized cap. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open Filter
open scoped Topology
namespace NoThreeLine
open FiniteWitnessMoments SectionHeight

theorem protected_energy_optimal_exponential (x v : ℝ) (hv : 0<v) :
    Real.exp (-(x/v)*x+((x/v)^2/2)*v)=Real.exp (-(x^2/(2*v))) := by
  congr 1
  field_simp [hv.ne']
  ring

theorem exists_clock_exponential_le_power (a γ r : ℝ) (ha : 0<a) (hγ : γ<1) (hr : 0<r) :
    ∃N : ℕ,2≤N ∧ ∀n≥N,
      Real.exp (-(a*((n:ℝ)^(1-γ))/Real.log n))≤(n:ℝ)^(-r) := by
  let η := (1-γ)/2
  have hη : 0<η := by dsimp [η]; linarith
  have hlim : Tendsto (fun n : ℕ=>Real.log (n:ℝ)/(n:ℝ)^η) atTop (𝓝 (0:ℝ)) :=
    (isLittleO_log_rpow_atTop hη).tendsto_div_nhds_zero.comp tendsto_natCast_atTop_atTop
  have hlim2 : Tendsto (fun n : ℕ=>(r/a)*(Real.log (n:ℝ)/(n:ℝ)^η)^2) atTop (𝓝 (0:ℝ)) := by
    simpa using (hlim.pow 2).const_mul (r/a)
  obtain ⟨N,hN⟩ := eventually_atTop.mp (hlim2.eventually (gt_mem_nhds zero_lt_one))
  refine ⟨max N 2,le_max_right _ _,?_⟩
  intro n hn
  have hn2 : 2≤n := (le_max_right _ _).trans hn
  have hn0 : (0:ℝ)<n := by exact_mod_cast (show 0<n by omega)
  have hl : 0<Real.log (n:ℝ) := log_nat_pos hn2
  have hp : 0<(n:ℝ)^η := Real.rpow_pos_of_pos hn0 _
  have hh : (r/a)*(Real.log (n:ℝ)/(n:ℝ)^η)^2≤1 := (hN n ((le_max_left _ _).trans hn)).le
  have he : ((n:ℝ)^η)^2=(n:ℝ)^(1-γ) := by
    rw [pow_two,←Real.rpow_add hn0]
    congr 1
    dsimp [η]
    ring
  rw [div_pow,←mul_div_assoc,div_le_iff₀ (sq_pos_of_pos hp),one_mul,he] at hh
  have hh' : r*(Real.log (n:ℝ))^2≤a*((n:ℝ)^(1-γ)) := by
    rw [div_mul_eq_mul_div] at hh
    simpa only [mul_comm] using (div_le_iff₀ ha).mp hh
  have harg : r*Real.log (n:ℝ)≤a*((n:ℝ)^(1-γ))/Real.log n := by
    apply (le_div_iff₀ hl).mpr
    nlinarith only [hh']
  calc
    _ ≤ Real.exp (Real.log (n:ℝ)*(-r)) := Real.exp_le_exp.mpr (by nlinarith only [harg])
    _ = _ := (Real.rpow_def_of_pos hn0 _).symm

theorem exists_clock_positive_drift_small (T C d ε : ℝ) (hT : 0≤T) (hC : 0≤C)
    (hd : d<1) (hε : 0<ε) :
    ∃N : ℕ,2≤N ∧ ∀n≥N,∀B : ℝ,0≤B→B≤(n:ℝ)^d →
      T*(B/n)*(C*n)≤ε*n ∧
      T*(B/n)*(C*n)*(1+Real.log n)≤ε*n := by
  have hlim : Tendsto (fun n : ℕ=>(T*C)*(((n:ℝ)^d/(n:ℝ))*(1+Real.log n))) atTop (𝓝 (0:ℝ)) := by
    simpa only [mul_zero] using (tendsto_power_ratio_log d hd).const_mul (T*C)
  obtain ⟨N,hN⟩ := eventually_atTop.mp (hlim.eventually (gt_mem_nhds hε))
  refine ⟨max N 2,le_max_right _ _,?_⟩
  intro n hn B hB hBd
  have hn2 : 2≤n := (le_max_right _ _).trans hn
  have hnR : (0:ℝ)≤n := Nat.cast_nonneg n
  have hl := (log_nat_pos hn2).le
  have hratio : B/n≤(n:ℝ)^d/(n:ℝ) := div_le_div_of_nonneg_right hBd hnR
  have hscaled : (T*C)*(B/n*(1+Real.log n))≤ε :=
    (mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right hratio (by linarith)) (mul_nonneg hT hC)).trans
      (hN n ((le_max_left _ _).trans hn)).le
  have hbig : T*(B/n)*(C*n)*(1+Real.log n)≤ε*n := by
    calc
      _ = ((T*C)*(B/n*(1+Real.log n)))*n := by ring
      _ ≤ _ := mul_le_mul_of_nonneg_right hscaled hnR
  exact ⟨(le_mul_of_one_le_right (by positivity) (by linarith)).trans hbig,hbig⟩

end NoThreeLine

#print axioms NoThreeLine.protected_energy_optimal_exponential
#print axioms NoThreeLine.exists_clock_exponential_le_power
#print axioms NoThreeLine.exists_clock_positive_drift_small

