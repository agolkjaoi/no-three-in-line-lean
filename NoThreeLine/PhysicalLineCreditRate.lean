import NoThreeLine.CappedLineCreditRate

/-! The line-credit decay rate as a measurable function of the actual
full physical state, with its stopping/occupancy/direction gate retained. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def physicalLineCreditRate {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ)
    (L : LineIndex n) (e : ExtendedState n) : ℝ :=
  e.lineCredits L * creditDamping e.process Γ mask e.coordinates L

theorem physicalLineCreditRate_measurable {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (L : LineIndex n) : Measurable (physicalLineCreditRate Γ mask L) := by
  have hm : Measurable (fun x : Coordinates n × ProcessMode n =>
      x.1.2.2 L * creditDamping (modeSkeleton x.2) Γ mask x.1 L) :=
    measurable_from_prod_countable_left (fun m =>
      (((continuous_apply L).comp continuous_snd.snd).mul
        (creditDamping_continuous (modeSkeleton m) Γ mask L)).measurable)
  exact hm.comp ((ExtendedState.measurable_coordinates n).prodMk (ExtendedState.measurable_mode n))

theorem physicalLineCreditRate_selected {n : ℕ} (cfg : FlowConfig n)
    (e : StateBall n cfg.box) (L : LineIndex n) (t : ℝ) :
    physicalLineCreditRate cfg.directions cfg.mask L (selectedTrajectory cfg (e,t)) =
      selectedLineCreditRate cfg e L t := rfl

theorem cappedLineCreditRate_physical {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (s : AugTimedState cfg) (t : ℝ) :
    cappedLineCreditRate cfg ε M L (s,t) =
      physicalLineCreditRate cfg.directions cfg.mask L
        (selectedTrajectory cfg ((augTimedInput cfg s).1.1,augAdvance cfg ε M (augTimedInput cfg s,t))) := rfl

theorem physicalLineCreditRate_stopped {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (L : LineIndex n) (e : ExtendedState n)
    (hs : e.process.stopped = true) : physicalLineCreditRate Γ mask L e = 0 := by
  simp [physicalLineCreditRate,creditDamping,hs]

theorem physicalLineCreditRate_bounds {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (L : LineIndex n) (e : ExtendedState n) (B : ℝ)
    (hB : 0 < B) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (he : e.Valid B) :
    0 ≤ physicalLineCreditRate Γ mask L e ∧
      physicalLineCreditRate Γ mask L e ≤ (L.val.card : ℝ) * (B/n) := by
  have hrate (q : Grid n) : 0 ≤ e.process.birthRate mask q ∧ e.process.birthRate mask q ≤ B/n := by
    have hα := e.process.acceptance_bounds mask B hB hm (fun q _ => he.2.1.1 q) q
    rw [← ProcessState.candidate_rate_times_acceptance e.process mask B hB.ne' q]
    have hb : 0 ≤ B/(n : ℝ) := div_nonneg hB.le (Nat.cast_nonneg n)
    exact ⟨mul_nonneg hb hα.1,mul_le_of_le_one_right hb hα.2⟩
  have hi : lineIntensity e.process mask e.coordinates L = ∑ q ∈ L.val, e.process.birthRate mask q := rfl
  have hsum0 : 0 ≤ ∑ q ∈ L.val, e.process.birthRate mask q :=
    Finset.sum_nonneg (fun q _ => (hrate q).1)
  have hsum : (∑ q ∈ L.val, e.process.birthRate mask q) ≤ (L.val.card : ℝ) * (B/n) := by
    calc
      _ ≤ ∑ _q ∈ L.val, B/n := Finset.sum_le_sum (fun q _ => (hrate q).2)
      _ = _ := by simp
  have hr := he.2.1.2.2 L
  unfold physicalLineCreditRate creditDamping
  split_ifs
  · rw [hi]
    exact ⟨mul_nonneg hr.1 hsum0,(mul_le_of_le_one_left hsum0 hr.2).trans hsum⟩
  · simp only [mul_zero]
    exact ⟨le_rfl,by positivity⟩

end NoThreeLine

#print axioms NoThreeLine.physicalLineCreditRate_measurable
#print axioms NoThreeLine.physicalLineCreditRate_selected
#print axioms NoThreeLine.physicalLineCreditRate_bounds
