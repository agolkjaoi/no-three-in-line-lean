import NoThreeLine.SelectedWeightGrowthRate
import NoThreeLine.RootClockIntegral

/-! Actual selected-flow weight growth, integrated through every physical
cap including its endpoint, with the actual risk and clock increment. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def selectedOutsideRiskIntegral {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (p : Grid n) (t : ℝ) : ℝ :=
  ∫u in (0:ℝ)..t,BirthWitness.physicalOutsideRisk cfg.directions cfg.mask p (selectedTrajectory cfg (x,u))

theorem selected_growth_integral_le {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K ρ : ℝ)
    (hKcfg : cfg.K≤K) (hρcfg : ρ≤cfg.rho) (hK : K<2)
    (hg : ActiveLineGuardBounds cfg.directions K ρ x.val)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (p : Grid n)
    (hstop : x.val.process.stopped=false) (hp : (x.val.process.accounts p).status=.active)
    (hw : 0<(x.val.process.accounts p).weight)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    (∫u in (0:ℝ)..t,x.val.process.perCapitaGrowth cfg.directions cfg.mask (selectedCurve cfg (x,u)).1 p)≤
      (cfg.B/n)*t+selectedOutsideRiskIntegral cfg x p t+
      (rootDesignatedClock cfg.directions p (selectedCurve cfg (x,t)).2.1-
        rootDesignatedClock cfg.directions p x.val.clocks)/(2-K) := by
  have hc : Continuous (fun u : ℝ=>selectedCurve cfg (x,u)) := by
    change Continuous (fun u : ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,u))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hgi : IntervalIntegrable
      (fun u=>x.val.process.perCapitaGrowth cfg.directions cfg.mask (selectedCurve cfg (x,u)).1 p) volume 0 t :=
    ((x.val.process.perCapitaGrowth_continuous cfg.directions cfg.mask p).comp hc.fst).intervalIntegrable 0 t
  have hfi : IntervalIntegrable
      (fun u=>BirthWitness.physicalOutsideRisk cfg.directions cfg.mask p (selectedTrajectory cfg (x,u))) volume 0 t :=
    ((physicalOutsideRisk_withCoordinates_continuous x.val cfg.directions cfg.mask p).comp hc).intervalIntegrable 0 t
  have hki : IntervalIntegrable (fun u=>rootDesignatedClock cfg.directions p
      (fun L=>clockRHS x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,u)) L)) volume 0 t :=
    ((rootDesignatedClockRHS_continuous x.val.process cfg.directions cfg.mask p).comp hc).intervalIntegrable 0 t
  have hci : IntervalIntegrable (fun _ : ℝ=>cfg.B/n) volume 0 t := intervalIntegrable_const
  calc
    _ ≤ ∫u in (0:ℝ)..t, cfg.B/n+
        BirthWitness.physicalOutsideRisk cfg.directions cfg.mask p (selectedTrajectory cfg (x,u))+
        rootDesignatedClock cfg.directions p
          (fun L=>clockRHS x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,u)) L)/(2-K) := by
      apply intervalIntegral.integral_mono_on ht.1 hgi ((hci.add hfi).add (hki.div_const _))
      intro u hu
      exact selectedCurve_perCapitaGrowth_le cfg x he K ρ hKcfg hρcfg hK hg hB hm p hstop hp hw
        u ⟨hu.1,hu.2.trans ht.2⟩
    _ = _ := by
      rw [intervalIntegral.integral_add (hci.add hfi) (hki.div_const _),intervalIntegral.integral_add hci hfi]
      simp only [intervalIntegral.integral_div]
      rw [selected_rootDesignatedClock_integral cfg x he p t ht]
      simp only [intervalIntegral.integral_const,sub_zero,smul_eq_mul,selectedOutsideRiskIntegral]
      ring

theorem selectedCurve_log_growth_le {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K ρ : ℝ)
    (hKcfg : cfg.K≤K) (hρcfg : ρ≤cfg.rho) (hK : K<2)
    (hg : ActiveLineGuardBounds cfg.directions K ρ x.val)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (p : Grid n)
    (hstop : x.val.process.stopped=false) (hp : (x.val.process.accounts p).status=.active)
    (hw : 0<(x.val.process.accounts p).weight)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    Real.log ((selectedCurve cfg (x,t)).1 p)-Real.log (x.val.process.accounts p).weight≤
      (cfg.B/n)*t+selectedOutsideRiskIntegral cfg x p t+
      (rootDesignatedClock cfg.directions p (selectedCurve cfg (x,t)).2.1-
        rootDesignatedClock cfg.directions p x.val.clocks)/(2-K) := by
  rw [selectedCurve_weight_eq_exp cfg x he p t ht,Real.log_mul hw.ne' (Real.exp_ne_zero _),Real.log_exp]
  have hh := selected_growth_integral_le cfg x he K ρ hKcfg hρcfg hK hg hB hm p hstop hp hw t ht
  linarith

end NoThreeLine

#print axioms NoThreeLine.selected_growth_integral_le
#print axioms NoThreeLine.selectedCurve_log_growth_le
