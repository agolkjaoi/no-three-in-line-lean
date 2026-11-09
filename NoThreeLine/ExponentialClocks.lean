import NoThreeLine.ThinnedBirth
import NoThreeLine.ClockSeries
import Mathlib.Probability.Distributions.Exponential
import Mathlib.Probability.Independence.InfinitePi
import Mathlib.Probability.BorelCantelli
import Mathlib.Topology.Algebra.InfiniteSum.Real

/-! An actual independent exponential waiting-time sequence and its
non-explosion. This does not yet attach the clocks to a state-dependent flow
or assert a counting-process compensator. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped ENNReal Topology BigOperators

namespace NoThreeLine

abbrev ClockPath := ℕ → ℝ

def clockMeasure (rate : ℝ) : Measure ClockPath :=
  Measure.infinitePi (fun _ : ℕ => expMeasure rate)

theorem clockMeasure_probability (rate : ℝ) (hr : 0 < rate) :
    IsProbabilityMeasure (clockMeasure rate) := by
  letI := isProbabilityMeasure_expMeasure hr
  unfold clockMeasure
  infer_instance

theorem clockMeasure_map_wait (rate : ℝ) (hr : 0 < rate) (k : ℕ) :
    (clockMeasure rate).map (fun ω => ω k) = expMeasure rate := by
  letI := isProbabilityMeasure_expMeasure hr
  exact Measure.infinitePi_map_eval (fun _ : ℕ => expMeasure rate) k

theorem clockMeasure_independent (rate : ℝ) (hr : 0 < rate) :
    iIndepFun (fun k : ℕ => fun ω : ClockPath => ω k) (clockMeasure rate) := by
  letI := isProbabilityMeasure_expMeasure hr
  exact iIndepFun_infinitePi (X := fun (_ : ℕ) (x : ℝ) => x) (fun _ => measurable_id)

theorem expMeasure_real_Iic (rate x : ℝ) (hr : 0 < rate) :
    (expMeasure rate).real (Iic x) = if 0 ≤ x then 1-Real.exp (-(rate*x)) else 0 := by
  letI := isProbabilityMeasure_expMeasure hr
  rw [← cdf_eq_real]
  exact cdf_expMeasure_eq hr x

theorem expMeasure_ae_positive (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ x ∂expMeasure rate, 0 < x := by
  letI := isProbabilityMeasure_expMeasure hr
  have hz : expMeasure rate (Iic 0) = 0 := by
    apply (measureReal_eq_zero_iff).mp
    simp [expMeasure_real_Iic rate 0 hr]
  rw [ae_iff]
  simpa only [not_lt,Set.Iic] using hz

theorem expMeasure_real_Ioi (rate x : ℝ) (hr : 0 < rate) (hx : 0 ≤ x) :
    (expMeasure rate).real (Ioi x) = Real.exp (-(rate*x)) := by
  letI := isProbabilityMeasure_expMeasure hr
  rw [← compl_Iic,measureReal_compl measurableSet_Iic,
    expMeasure_real_Iic rate x hr,if_pos hx,probReal_univ]
  ring

theorem clockMeasure_ae_positive (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂clockMeasure rate, ∀ k, 0 < ω k := by
  apply ae_all_iff.mpr
  intro k
  have hh := expMeasure_ae_positive rate hr
  rw [← clockMeasure_map_wait rate hr k] at hh
  exact (ae_map_iff (measurable_pi_apply k).aemeasurable measurableSet_Ioi).mp hh

def clockLongWait (k : ℕ) : Set ClockPath := {ω | 1 < ω k}

theorem clockLongWait_measurable (k : ℕ) : MeasurableSet (clockLongWait k) := by
  exact measurableSet_lt measurable_const (measurable_pi_apply k)

theorem clockLongWait_measure (rate : ℝ) (hr : 0 < rate) (k : ℕ) :
    clockMeasure rate (clockLongWait k) = expMeasure rate (Ioi 1) := by
  rw [← clockMeasure_map_wait rate hr k,Measure.map_apply (by fun_prop) measurableSet_Ioi]
  rfl

theorem clockLongWait_independent (rate : ℝ) (hr : 0 < rate) :
    iIndepSet clockLongWait (clockMeasure rate) := by
  rw [iIndepSet_iff_meas_biInter clockLongWait_measurable]
  intro S
  apply (clockMeasure_independent rate hr).meas_biInter
  intro k _
  exact measurableSet_Ioi.preimage (comap_measurable (fun ω : ClockPath => ω k))

theorem clockMeasure_ae_long_waits (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂clockMeasure rate, ∃ᶠ k in atTop, 1 < ω k := by
  letI := clockMeasure_probability rate hr
  letI := isProbabilityMeasure_expMeasure hr
  have hne : expMeasure rate (Ioi 1) ≠ 0 := by
    intro hz
    have he := expMeasure_real_Ioi rate 1 hr (by norm_num)
    rw [measureReal_def,hz,ENNReal.toReal_zero] at he
    exact (ne_of_gt (Real.exp_pos _)) he.symm
  have hsum : (∑' k : ℕ, clockMeasure rate (clockLongWait k)) = ∞ := by
    simp_rw [clockLongWait_measure rate hr]
    exact ENNReal.tsum_const_eq_top_of_ne_zero hne
  have hlim := measure_limsup_eq_one clockLongWait_measurable
    (clockLongWait_independent rate hr) hsum
  have hae : ∀ᵐ ω ∂clockMeasure rate, ω ∈ limsup clockLongWait atTop := by
    apply (ae_mem_iff_measure_eq
      (MeasurableSet.measurableSet_limsup clockLongWait_measurable).nullMeasurableSet).mpr
    simpa only [measure_univ] using hlim
  filter_upwards [hae] with ω hω
  exact (mem_limsup_iff_frequently_mem).mp hω

/-- Every finite time interval contains only finitely many arrivals almost surely.
This is supplied by the actual exponential product law, not a path assumption. -/
theorem clockMeasure_nonexplosive (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂clockMeasure rate,
      StrictMono (arrivalTime ω) ∧ Tendsto (arrivalTime ω) atTop atTop ∧
        ∀ T : ℝ, Set.Finite {k | arrivalTime ω k ≤ T} := by
  filter_upwards [clockMeasure_ae_positive rate hr,clockMeasure_ae_long_waits rate hr] with ω hp hl
  have hd := arrivalTime_tendsto_of_long_waits ω (fun k => (hp k).le) hl
  exact ⟨arrivalTime_strictMono ω hp,hd,finite_arrivals_before ω hd⟩

end NoThreeLine

#print axioms NoThreeLine.clockMeasure_independent
#print axioms NoThreeLine.clockMeasure_ae_positive
#print axioms NoThreeLine.clockLongWait_independent
#print axioms NoThreeLine.clockMeasure_nonexplosive
