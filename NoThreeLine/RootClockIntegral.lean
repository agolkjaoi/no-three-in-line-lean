import NoThreeLine.PhysicalWeightGrowthClock
import NoThreeLine.ModeFlowSelection

/-! The S1 specified-clock derivative integrates to the actual clock
increment. The finite set of geometric lines is fixed by the root. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines LineDrift

theorem rootDesignatedClock_continuous {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) :
    Continuous (rootDesignatedClock Γ p) := by
  unfold rootDesignatedClock
  exact continuous_finsetSum _ (fun L _=>continuous_apply _)

theorem rootDesignatedClockRHS_continuous {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (p : Grid n) :
    Continuous (fun z : Coordinates n=>rootDesignatedClock Γ p (fun L=>clockRHS s Γ mask z L)) := by
  unfold rootDesignatedClock
  exact continuous_finsetSum _ (fun L _=>(clockRHS_contDiff s Γ mask _).continuous)

theorem flow_rootDesignatedClock_integral_between {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (T : ℝ) (z : ℝ→Coordinates n)
    (hz : ContinuousOn z (Icc 0 T))
    (hd : ∀t∈Ioo 0 T,HasDerivAt z (vectorField s Γ mask (z t)) t)
    (p : Grid n) (a b : ℝ) (ha : 0≤a) (hab : a≤b) (hb : b≤T) :
    (∫u in a..b,rootDesignatedClock Γ p (fun L=>clockRHS s Γ mask (z u) L))=
      rootDesignatedClock Γ p (z b).2.1-rootDesignatedClock Γ p (z a).2.1 := by
  have hsub : Icc a b⊆Icc (0:ℝ) T := Icc_subset_Icc ha hb
  have hc := (rootDesignatedClock_continuous Γ p).comp_continuousOn hz.snd.fst
  have hc' := (rootDesignatedClockRHS_continuous s Γ mask p).comp_continuousOn hz
  have hi : IntervalIntegrable
      (fun u=>rootDesignatedClock Γ p (fun L=>clockRHS s Γ mask (z u) L)) volume a b := by
    apply ContinuousOn.intervalIntegrable
    simpa only [uIcc_of_le hab,Function.comp_def] using hc'.mono hsub
  apply intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le hab (hc.mono hsub) _ hi
  intro u hu
  unfold rootDesignatedClock
  apply HasDerivAt.fun_sum
  intro L _
  exact hasDerivAt_pi.mp (hd u ⟨ha.trans_lt hu.1,hu.2.trans_le hb⟩).snd.fst _

theorem selected_rootDesignatedClock_integral {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (p : Grid n)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    (∫u in (0:ℝ)..t,rootDesignatedClock cfg.directions p
      (fun L=>clockRHS x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,u)) L))=
      rootDesignatedClock cfg.directions p (selectedCurve cfg (x,t)).2.1-
        rootDesignatedClock cfg.directions p x.val.clocks := by
  have hs := selectedCurve_spec cfg x he.2.1
  have hc : Continuous (fun u : ℝ=>selectedCurve cfg (x,u)) := by
    change Continuous (fun u : ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,u))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hh := flow_rootDesignatedClock_integral_between x.val.process cfg.directions cfg.mask
    (selectedGuardTime cfg x) (fun u=>selectedCurve cfg (x,u)) hc.continuousOn
    (fun u hu=>(hs.2.2.1 u ⟨hu.1.le,hu.2.le⟩).2.2.hasDerivAt (Icc_mem_nhds hu.1 hu.2))
    p 0 t le_rfl ht.1 ht.2
  simpa only [hs.1,ExtendedState.coordinates] using hh

end NoThreeLine

#print axioms NoThreeLine.flow_rootDesignatedClock_integral_between
#print axioms NoThreeLine.selected_rootDesignatedClock_integral
