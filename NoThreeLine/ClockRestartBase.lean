import NoThreeLine.WinnerMarkLaw

/-! Concrete ingredients for restart: iid sequence head/tail decomposition
and the unnormalized residual exponential law at a deterministic time.
No random-history restart or full process is assumed or asserted. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine.ClockRestartBase

def tail (ω : ClockPath) : ClockPath := fun k => ω (k + 1)

theorem tail_measurable : Measurable tail := by unfold tail; fun_prop

def headTail (ω : ClockPath) : ℝ × ClockPath := (ω 0, tail ω)

theorem headTail_measurable : Measurable headTail :=
  (measurable_pi_apply 0).prodMk tail_measurable

theorem iid_tail_map (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    (Measure.infinitePi (fun _ : ℕ => μ)).map tail = Measure.infinitePi (fun _ : ℕ => μ) :=
  Measure.map_infinitePi_infinitePi_of_inj (P := fun _ : ℕ => μ)
    (f := fun k : ℕ => k + 1) (by intro a b h; change a + 1 = b + 1 at h; omega)

theorem iid_head_tail_independent (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    IndepFun (fun ω : ClockPath => ω 0) tail (Measure.infinitePi (fun _ : ℕ => μ)) := by
  let m : ℕ → MeasurableSpace ClockPath := fun k =>
    MeasurableSpace.comap (fun ω : ClockPath => ω k) inferInstance
  have hm (k : ℕ) : m k ≤ (inferInstance : MeasurableSpace ClockPath) :=
    (measurable_pi_apply k).comap_le
  have hi : iIndep m (Measure.infinitePi (fun _ : ℕ => μ)) :=
    (iIndepFun_infinitePi (P := fun _ : ℕ => μ)
      (X := fun _ (x : ℝ) => x) (fun _ => measurable_id)).iIndep
  have hdisj : Disjoint ({0} : Set ℕ) (Ioi 0) := by
    apply Set.disjoint_left.mpr
    intro k hk hz
    simp only [mem_singleton_iff] at hk
    simpa [hk] using hz
  have hh := indep_iSup_of_disjoint hm hi hdisj
  have hsup : (⨆ k ∈ Ioi (0 : ℕ), m k) = ⨆ j : ℕ, m (j+1) := by
    apply le_antisymm
    · apply iSup_le
      intro k
      apply iSup_le
      intro hk
      obtain ⟨j, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_of_gt hk)
      exact le_iSup (fun j : ℕ => m (j+1)) j
    · apply iSup_le
      intro j
      exact le_iSup_of_le (j+1) (le_iSup_of_le (Nat.zero_lt_succ j) le_rfl)
  rw [hsup] at hh
  simp only [iSup_singleton] at hh
  rw [IndepFun_iff_Indep]
  change Indep (m 0) (MeasurableSpace.comap (fun ω : ClockPath => fun k => ω (k+1)) inferInstance) _
  rw [MeasurableSpace.comap_process_pi]
  exact hh

theorem iid_headTail_map (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    (Measure.infinitePi (fun _ : ℕ => μ)).map headTail =
      μ.prod (Measure.infinitePi (fun _ : ℕ => μ)) := by
  have hh := (iid_head_tail_independent μ).map_prod_eq_prod_map_map
    (measurable_pi_apply 0).aemeasurable tail_measurable.aemeasurable
  rw [Measure.infinitePi_map_eval, iid_tail_map] at hh
  exact hh

theorem clock_headTail_map (rate : ℝ) (hr : 0 < rate) :
    (clockMeasure rate).map headTail = (expMeasure rate).prod (clockMeasure rate) := by
  letI := isProbabilityMeasure_expMeasure hr
  exact iid_headTail_map (expMeasure rate)

theorem marks_headTail_map : markSequenceMeasure.map headTail = markMeasure.prod markSequenceMeasure :=
  iid_headTail_map markMeasure

theorem exp_residual_restrict_map (rate t : ℝ) (hr : 0 < rate) (ht : 0 ≤ t) :
    ((expMeasure rate).restrict (Ioi t)).map (fun x => x - t) =
      (ENNReal.ofReal (Real.exp (-(rate*t)))) • expMeasure rate := by
  letI := isProbabilityMeasure_expMeasure hr
  apply Measure.ext_of_Iic
  intro a
  apply (measureReal_eq_measureReal_iff (by finiteness) (by
    rw [Measure.smul_apply]
    exact ENNReal.mul_ne_top ENNReal.ofReal_ne_top (measure_ne_top _ _))).mp
  rw [measureReal_def, Measure.map_apply (by fun_prop) measurableSet_Iic,
    Measure.restrict_apply (measurableSet_Iic.preimage (by fun_prop))]
  have he : (fun x : ℝ => x - t) ⁻¹' Iic a ∩ Ioi t = Ioc t (t+a) := by
    ext x
    simp only [mem_inter_iff, mem_preimage, mem_Iic, mem_Ioi, mem_Ioc]
    constructor <;> rintro ⟨h₁,h₂⟩ <;> constructor <;> linarith
  rw [he]
  change (expMeasure rate).real (Ioc t (t+a)) = _
  rw [measureReal_ennreal_smul_apply, ENNReal.toReal_ofReal (Real.exp_pos _).le,
    expMeasure_real_Iic rate a hr]
  by_cases ha : 0 ≤ a
  · rw [if_pos ha, ← Iic_sdiff_Iic,
      measureReal_sdiff (Iic_subset_Iic.mpr (by linarith)) measurableSet_Iic,
      expMeasure_real_Iic rate (t+a) hr, expMeasure_real_Iic rate t hr,
      if_pos (by linarith : 0 ≤ t+a), if_pos ht]
    rw [mul_add, neg_add, Real.exp_add]
    ring
  · rw [if_neg ha, Ioc_eq_empty (by linarith : ¬t < t+a)]
    simp

end NoThreeLine.ClockRestartBase

#print axioms NoThreeLine.ClockRestartBase.clock_headTail_map
#print axioms NoThreeLine.ClockRestartBase.marks_headTail_map
#print axioms NoThreeLine.ClockRestartBase.exp_residual_restrict_map
