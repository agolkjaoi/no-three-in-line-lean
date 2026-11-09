import NoThreeLine.DeterministicClockRestart

/-! Simultaneous deterministic residual clocks on any finite index set.
The index set may be all board sites or all sites other than a fixed winner.
This is a section law, not a random-time restart theorem. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine.FiniteClockRestart
open DeterministicClockRestart

theorem pi_const_smul {ι α : Type*} [Fintype ι] [MeasurableSpace α]
    (μ : Measure α) [IsProbabilityMeasure μ] (c : ℝ≥0∞) (hc : c ≠ ∞) :
    Measure.pi (fun _ : ι => c • μ) = c ^ Fintype.card ι • Measure.pi (fun _ : ι => μ) := by
  letI : IsFiniteMeasure (c • μ) := ⟨by
    rw [Measure.smul_apply, measure_univ, smul_eq_mul, mul_one]
    exact lt_top_iff_ne_top.mpr hc⟩
  apply Measure.pi_eq
  intro S hS
  simp only [Measure.smul_apply, Measure.pi_pi, smul_eq_mul, Finset.prod_mul_distrib,
    Finset.prod_const, Finset.card_univ]

def markedFamilyMeasure (ι : Type*) [Fintype ι] (rate : ℝ) : Measure (ι → MarkedClockPath) :=
  Measure.pi (fun _ : ι => markedClockMeasure rate)

def allSurvive {ι : Type*} (t : ℝ) : Set (ι → MarkedClockPath) :=
  {ω | ∀ i, t < (ω i).1 0}

def residualFamily {ι : Type*} (t : ℝ) (ω : ι → MarkedClockPath) : ι → MarkedClockPath :=
  fun i => residualMarked t (ω i)

theorem residualFamily_measurable (ι : Type*) (t : ℝ) : Measurable (@residualFamily ι t) :=
  measurable_pi_lambda _ (fun i => (residualMarked_measurable t).comp (measurable_pi_apply i))

theorem finite_residual_restrict_map (ι : Type*) [Fintype ι]
    (rate t : ℝ) (hr : 0 < rate) (ht : 0 ≤ t) :
    ((markedFamilyMeasure ι rate).restrict (allSurvive t)).map (residualFamily t) =
      (ENNReal.ofReal (Real.exp (-(rate*t)))) ^ Fintype.card ι • markedFamilyMeasure ι rate := by
  letI := markedClockMeasure_probability rate hr
  have hs : allSurvive (ι := ι) t =
      Set.univ.pi (fun _ : ι => {ω : MarkedClockPath | t < ω.1 0}) := by
    ext ω
    simp [allSurvive]
  rw [markedFamilyMeasure, hs, Measure.restrict_pi_pi]
  change (Measure.pi (fun _ : ι => (markedClockMeasure rate).restrict {ω | t < ω.1 0})).map
    (fun ω i => residualMarked t (ω i)) = _
  rw [Measure.pi_map_pi (fun _ => (residualMarked_measurable t).aemeasurable)]
  simp_rw [marked_residual_restrict_map rate t hr ht]
  exact pi_const_smul (markedClockMeasure rate) _ ENNReal.ofReal_ne_top

theorem finite_residual_restrict_map_exp (ι : Type*) [Fintype ι]
    (rate t : ℝ) (hr : 0 < rate) (ht : 0 ≤ t) :
    ((markedFamilyMeasure ι rate).restrict (allSurvive t)).map (residualFamily t) =
      (ENNReal.ofReal (Real.exp (-((Fintype.card ι : ℝ)*rate*t)))) • markedFamilyMeasure ι rate := by
  rw [finite_residual_restrict_map ι rate t hr ht, ← ENNReal.ofReal_pow (Real.exp_pos _).le,
    ← Real.exp_nat_mul]
  congr 3
  ring

theorem board_residual_restrict_map (n : ℕ) (rate t : ℝ) (hr : 0 < rate) (ht : 0 ≤ t) :
    ((boardClockMeasure n rate).restrict (allSurvive t)).map (residualFamily t) =
      (ENNReal.ofReal (Real.exp (-((n : ℝ)^2*rate*t)))) • boardClockMeasure n rate := by
  letI := markedClockMeasure_probability rate hr
  have he : boardClockMeasure n rate = markedFamilyMeasure (Grid n) rate :=
    Measure.infinitePi_eq_pi _
  rw [he, finite_residual_restrict_map_exp (Grid n) rate t hr ht]
  simp only [Fintype.card_prod, Fintype.card_fin, Nat.cast_mul, pow_two]

theorem candidate_board_residual_restrict_map {n : ℕ} (hn : 0 < n) (B t : ℝ)
    (hB : 0 < B) (ht : 0 ≤ t) :
    ((boardClockMeasure n (B/n)).restrict (allSurvive t)).map (residualFamily t) =
      (ENNReal.ofReal (Real.exp (-(n*B*t)))) • boardClockMeasure n (B/n) := by
  rw [board_residual_restrict_map n (B/n) t (div_pos hB (by exact_mod_cast hn)) ht]
  have hn0 : (n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  have he : (n : ℝ)^2*(B/n)*t = n*B*t := by field_simp
  rw [he]

abbrev OtherSites {n : ℕ} (p : Grid n) := {q : Grid n // q ≠ p}

theorem otherSites_residual_restrict_map {n : ℕ} (p : Grid n)
    (rate t : ℝ) (hr : 0 < rate) (ht : 0 ≤ t) :
    ((markedFamilyMeasure (OtherSites p) rate).restrict (allSurvive t)).map (residualFamily t) =
      (ENNReal.ofReal (Real.exp (-((Fintype.card (OtherSites p) : ℝ)*rate*t)))) •
        markedFamilyMeasure (OtherSites p) rate :=
  finite_residual_restrict_map_exp (OtherSites p) rate t hr ht

end NoThreeLine.FiniteClockRestart

#print axioms NoThreeLine.FiniteClockRestart.candidate_board_residual_restrict_map
#print axioms NoThreeLine.FiniteClockRestart.otherSites_residual_restrict_map
