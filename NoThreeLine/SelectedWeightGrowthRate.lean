import NoThreeLine.PhysicalWeightGrowthClock
import NoThreeLine.RawLineGuardBounds
import NoThreeLine.SelectedWeightFloor

/-! The actual selected physical flow has an exact exponential growth
formula and its per-capita rate is bounded by actual outside risk plus
self rate and the specified-clock derivative. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines LineDrift

theorem physicalOutsideRisk_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (p : Grid n) :
    Continuous (fun z : Coordinates n=>BirthWitness.physicalOutsideRisk Γ mask p (e.withCoordinates z)) := by
  change Continuous (fun z : Coordinates n=>∑L∈BirthWitness.nonSpecifiedRootBoardLines Γ p,
    if p∈e.process.activeEvents ∧ occupancy e.process L.val=1 then
      ∑q∈L.val.val.erase p,phaseRate e.process mask z.1 q else 0)
  apply continuous_finsetSum
  intro L _
  split_ifs
  · exact continuous_finsetSum _ (fun q _=>(phaseRate_contDiff e.process mask q).continuous)
  · exact continuous_const

theorem selectedCurve_weight_eq_exp {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (p : Grid n)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    (selectedCurve cfg (x,t)).1 p=(x.val.process.accounts p).weight*
      Real.exp (∫u in (0:ℝ)..t,x.val.process.perCapitaGrowth cfg.directions cfg.mask (selectedCurve cfg (x,u)).1 p) := by
  have hs := selectedCurve_spec cfg x he.2.1
  have hc : Continuous (fun u : ℝ=>selectedCurve cfg (x,u)) := by
    change Continuous (fun u : ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,u))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hh := multiplicative_flow_identity (selectedGuardTime cfg x) hs.2.1.1
    (fun u=>(selectedCurve cfg (x,u)).1 p)
    (fun u=>x.val.process.perCapitaGrowth cfg.directions cfg.mask (selectedCurve cfg (x,u)).1 p)
    (((continuous_apply p).comp hc.fst).continuousOn)
    (((x.val.process.perCapitaGrowth_continuous cfg.directions cfg.mask p).comp hc.fst).continuousOn)
    (fun u hu=>by
      rw [←ProcessState.vectorField_eq_mul_perCapita]
      exact hasDerivAt_pi.mp ((hs.2.2.1 u ⟨hu.1.le,hu.2.le⟩).2.2.hasDerivAt
        (Icc_mem_nhds hu.1 hu.2)).fst p) t ht
  rw [hs.1] at hh
  have hexp (y : ℝ) : Real.exp (-y)*Real.exp y=1 := by
    rw [←Real.exp_add,neg_add_cancel,Real.exp_zero]
  calc
    _ = ((selectedCurve cfg (x,t)).1 p*Real.exp (-(∫u in (0:ℝ)..t,
        x.val.process.perCapitaGrowth cfg.directions cfg.mask (selectedCurve cfg (x,u)).1 p)))*
        Real.exp (∫u in (0:ℝ)..t,
        x.val.process.perCapitaGrowth cfg.directions cfg.mask (selectedCurve cfg (x,u)).1 p) := by
      rw [mul_assoc,hexp,mul_one]
    _ = _ := by rw [hh]; rfl

theorem selectedCurve_perCapitaGrowth_le {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K ρ : ℝ)
    (hKcfg : cfg.K≤K) (hρcfg : ρ≤cfg.rho) (hK : K<2)
    (hg : ActiveLineGuardBounds cfg.directions K ρ x.val)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (p : Grid n)
    (hstop : x.val.process.stopped=false) (hp : (x.val.process.accounts p).status=.active)
    (hw : 0<(x.val.process.accounts p).weight)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    x.val.process.perCapitaGrowth cfg.directions cfg.mask (selectedCurve cfg (x,t)).1 p≤
      cfg.B/n+BirthWitness.physicalOutsideRisk cfg.directions cfg.mask p (selectedTrajectory cfg (x,t))+
      rootDesignatedClock cfg.directions p
        (fun L=>clockRHS x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,t)) L)/(2-K) := by
  let e := selectedTrajectory cfg (x,t)
  have hev : e.Valid cfg.B := selectedTrajectory_valid cfg x he t ht
  have hguards := selectedTrajectory_activeLineGuardBounds cfg x he K ρ hKcfg hρcfg hg t ht
  have hpa : p∈e.process.activeEvents := (e.process.mem_activeEvents p).mpr hp
  have hbound := actualWeightDrift_le_risk_clock e cfg.directions cfg.mask p K hev.1 cfg.mask_nonneg
    hstop hp hK (fun L hL=>(hguards p hpa L (root_mem_designated cfg.directions p L.val hL)).1
      (designated_specified cfg.directions p L hL))
  have hpos : 0<(selectedCurve cfg (x,t)).1 p := hw.trans_le (selectedCurve_weight_ge_initial cfg x he p t ht)
  have heq : e.process.continuousCreditDrift cfg.directions (e.process.birthRate cfg.mask) p=
      (selectedCurve cfg (x,t)).1 p*x.val.process.perCapitaGrowth cfg.directions cfg.mask (selectedCurve cfg (x,t)).1 p := by
    exact (x.val.process.withWeights_continuousCreditDrift cfg.directions cfg.mask _ p).trans
      (x.val.process.vectorField_eq_mul_perCapita cfg.directions cfg.mask _ p)
  rw [heq] at hbound
  have hrate : e.process.birthRate cfg.mask p≤cfg.B/n := by
    have ha := e.process.acceptance_bounds cfg.mask cfg.B hB
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩) (fun q _=>hev.2.1.1 q) p
    rw [←ProcessState.candidate_rate_times_acceptance e.process cfg.mask cfg.B hB.ne' p]
    exact mul_le_of_le_one_right (div_nonneg hB.le (Nat.cast_nonneg n)) ha.2
  exact (le_of_mul_le_mul_left hbound hpos).trans (add_le_add (add_le_add hrate le_rfl) le_rfl)

end NoThreeLine

#print axioms NoThreeLine.physicalOutsideRisk_withCoordinates_continuous
#print axioms NoThreeLine.selectedCurve_weight_eq_exp
#print axioms NoThreeLine.selectedCurve_perCapitaGrowth_le
