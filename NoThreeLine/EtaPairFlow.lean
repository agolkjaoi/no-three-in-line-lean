import NoThreeLine.PairInfluence

/-! Construct eta from the integral of the actual common-change rate.
The solution, its bounds, and the cost of reaching the eta floor are proved
directly; the rate or the eta trajectory is not a research assumption. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.AuxiliaryODE

def etaAlong {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (η₀ : EtaCoordinates n)
    (t : ℝ) (a b : Grid n) : ℝ :=
  η₀ a b * Real.exp (-(∫ u in (0 : ℝ)..t, pairRate s Γ mask (z u) a b))

theorem etaAlong_initial {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (η₀ : EtaCoordinates n) :
    etaAlong s Γ mask z η₀ 0 = η₀ := by
  funext a b
  simp [etaAlong]

theorem etaAlong_hasDerivAt {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (hz : Continuous z)
    (η₀ : EtaCoordinates n) (t : ℝ) :
    HasDerivAt (etaAlong s Γ mask z η₀)
      (etaRHS s Γ mask (z t) (etaAlong s Γ mask z η₀ t)) t := by
  apply hasDerivAt_pi.mpr
  intro a
  apply hasDerivAt_pi.mpr
  intro b
  have hc : Continuous (fun u => pairRate s Γ mask (z u) a b) :=
    (pairRate_contDiff s Γ mask a b).continuous.comp hz
  have hd := intervalIntegral.integral_hasDerivAt_right (hc.intervalIntegrable 0 t)
    hc.aestronglyMeasurable.stronglyMeasurableAtFilter hc.continuousAt
  exact ((hd.neg.exp).const_mul (η₀ a b)).congr_deriv (by
    simp only [etaRHS,etaAlong,Pi.neg_apply]
    ring)

theorem etaAlong_continuous {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (hz : Continuous z) (η₀ : EtaCoordinates n) :
    Continuous (etaAlong s Γ mask z η₀) := by
  exact continuous_iff_continuousAt.mpr (fun t => (etaAlong_hasDerivAt s Γ mask z hz η₀ t).continuousAt)

theorem etaAlong_joint_continuous {n : ℕ} {X : Type*} [TopologicalSpace X]
    (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ)
    (z : X × ℝ → Coordinates n) (hz : Continuous z)
    (η₀ : X → EtaCoordinates n) (hη₀ : Continuous η₀) :
    Continuous (fun x : X × ℝ => etaAlong s Γ mask (fun u => z (x.1,u)) (η₀ x.1) x.2) := by
  apply continuous_pi
  intro a
  apply continuous_pi
  intro b
  have hc : Continuous (fun x : (X × ℝ) × ℝ => pairRate s Γ mask (z (x.1.1,x.2)) a b) :=
    (pairRate_contDiff s Γ mask a b).continuous.comp
      (hz.comp (continuous_fst.fst.prodMk continuous_snd))
  have hi : Continuous (fun x : X × ℝ => ∫ u in (0 : ℝ)..x.2, pairRate s Γ mask (z (x.1,u)) a b) :=
    intervalIntegral.continuous_parametric_intervalIntegral_of_continuous hc continuous_snd
  exact (((continuous_apply b).comp ((continuous_apply a).comp hη₀)).comp continuous_fst).mul
    (Real.continuous_exp.comp hi.neg)

theorem etaAlong_nonneg {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (η₀ : EtaCoordinates n)
    (t : ℝ) (a b : Grid n) (hη : 0 ≤ η₀ a b) : 0 ≤ etaAlong s Γ mask z η₀ t a b :=
  mul_nonneg hη (Real.exp_pos _).le

theorem etaAlong_pos {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (η₀ : EtaCoordinates n)
    (t : ℝ) (a b : Grid n) (hη : 0 < η₀ a b) : 0 < etaAlong s Γ mask z η₀ t a b :=
  mul_pos hη (Real.exp_pos _)

theorem etaAlong_le_initial {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (η₀ : EtaCoordinates n)
    (t : ℝ) (ht : 0 ≤ t) (hm : ∀ p, 0 ≤ mask p)
    (hw : ∀ u ∈ Icc (0 : ℝ) t, ∀ p, 0 ≤ (z u).1 p)
    (a b : Grid n) (hη : 0 ≤ η₀ a b) : etaAlong s Γ mask z η₀ t a b ≤ η₀ a b := by
  have hi : 0 ≤ ∫ u in (0 : ℝ)..t, pairRate s Γ mask (z u) a b :=
    intervalIntegral.integral_nonneg ht (fun u hu => pairRate_nonneg s Γ mask (z u) hm (hw u hu) a b)
  unfold etaAlong
  exact mul_le_of_le_one_right hη (Real.exp_le_one_iff.mpr (neg_nonpos.mpr hi))

theorem etaAlong_inactive {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (η₀ : EtaCoordinates n)
    (t : ℝ) (a b : Grid n) (ha : (s.accounts a).status ≠ .active) :
    etaAlong s Γ mask z η₀ t a b = η₀ a b := by
  simp only [etaAlong,pairRate_inactive_left s Γ mask _ a b ha]
  simp

theorem etaAlong_stopped {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (η₀ : EtaCoordinates n)
    (t : ℝ) (hs : s.stopped = true) : etaAlong s Γ mask z η₀ t = η₀ := by
  funext a b
  simp only [etaAlong,pairRate_stopped s Γ mask _ a b hs]
  simp

theorem etaAlong_floor_cost {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (z : ℝ → Coordinates n) (η₀ : EtaCoordinates n)
    (t ε : ℝ) (a b : Grid n) (hη : η₀ a b = 1)
    (hfloor : etaAlong s Γ mask z η₀ t a b ≤ 1-ε) :
    ε ≤ ∫ u in (0 : ℝ)..t, pairRate s Γ mask (z u) a b := by
  have he := Real.add_one_le_exp (-(∫ u in (0 : ℝ)..t, pairRate s Γ mask (z u) a b))
  simp only [etaAlong,hη,one_mul] at hfloor
  linarith

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.etaAlong_hasDerivAt
#print axioms NoThreeLine.AuxiliaryODE.etaAlong_joint_continuous
#print axioms NoThreeLine.AuxiliaryODE.etaAlong_le_initial
#print axioms NoThreeLine.AuxiliaryODE.etaAlong_floor_cost
