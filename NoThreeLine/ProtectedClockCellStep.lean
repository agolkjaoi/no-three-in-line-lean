import NoThreeLine.ProtectedClockCellRate
import NoThreeLine.RootClockIntegral

/-! The actual elapsed segment, including its raw right endpoint,
spends at most its duration times the protected cell budget. Birth and
boundary resolution preserve the clock value reached by the flow. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem selectedClockRHS_integral {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (hx : x.val.Valid cfg.B) (L : LineIndex n) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    (∫u in (0:ℝ)..t,clockRHS x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,u)) L)=
      (selectedCurve cfg (x,t)).2.1 L-x.val.clocks L := by
  let z := fun u=>selectedCurve cfg (x,u)
  have hc : Continuous z := selectedLineSectionCurve_continuous cfg x
  have hcL : Continuous (fun u=>(z u).2.1 L) := (continuous_apply L).comp hc.snd.fst
  have hI : IntervalIntegrable (fun u=>clockRHS x.val.process cfg.directions cfg.mask (z u) L) volume 0 t :=
    ((clockRHS_contDiff x.val.process cfg.directions cfg.mask L).continuous.comp hc).intervalIntegrable _ _
  have hs := selectedCurve_spec cfg x hx.2.1
  have hh := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le ht.1 hcL.continuousOn
    (fun u hu=>hasDerivAt_pi.mp ((hs.2.2.1 u ⟨hu.1.le,hu.2.le.trans ht.2⟩).2.2.hasDerivAt
      (Icc_mem_nhds hu.1 (hu.2.trans_le ht.2))).snd.fst L) hI
  simpa only [z,hs.1,ExtendedState.coordinates,vectorField] using hh

theorem augTimedStep_clock_le_protected_cells {n : ℕ} {ι : Type*} [Fintype ι]
    (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hsp : specified cfg.directions L)
    (s : ProtectedTimedState cfg) (z : CandidateData n)
    (cells : ι→Finset (Grid n)) (c cap : ι→ℝ) (hc : ∀i,0≤c i) (hcap : ∀i,0≤cap i)
    (hm : cfg.mask=sectionCellMask cells c)
    (hsv : ∀p∈L.val,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (hbound : occupancy s.1.val.1.physical.process L≤1 →
      ∀ t : ℝ, 0<t → t≤birthElapsed cfg ε M (s.1,z) →
        ∀i,protectedStateFlowTotal cfg L (L.val∩cells i) id (s,t)≤cap i) :
    (augTimedStep cfg ε M (s.1,z)).val.1.physical.clocks L-s.1.val.1.physical.clocks L≤
      birthElapsed cfg ε M (s.1,z)*((∑i,c i*cap i)/n) := by
  by_cases hd : birthDone cfg s.1
  · rw [augTimedStep_done cfg ε M _ ((birthDone_iff cfg s.1).mp hd)]
    simp [birthElapsed,hd]
  · let x := (augTimedInput cfg s.1).1.1
    let t := augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1)
    have ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x) := by
      have h := augAdvance_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1 z.1.1
      exact ⟨h.1,h.2.trans (augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1).2⟩
    let f := fun u=>clockRHS x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,u)) L
    let C := (∑i,c i*cap i)/n
    have hf : IntervalIntegrable f volume 0 t :=
      ((clockRHS_contDiff x.val.process cfg.directions cfg.mask L).continuous.comp
        (selectedLineSectionCurve_continuous cfg x)).intervalIntegrable _ _
    have hb (u : ℝ) (hu : u∈Ioo (0:ℝ) t) : f u≤C := by
      change clockRHS x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,u)) L≤C
      rw [hm]
      exact clockRHS_le_protected_cell_budget x.val cfg.directions L hsp cells c cap hc hcap
        (selectedCurve cfg (x,u)) s.2 cfg.B
        (selectedTrajectory_valid cfg x s.1.property.1.1 u ⟨hu.1.le,hu.2.le.trans ht.2⟩)
        hsv (fun ho i=>hbound ho u hu.1 (by simpa only [birthElapsed,if_neg hd] using hu.2.le) i)
    have hi := intervalIntegral.integral_mono_on_of_le_Ioo ht.1 hf intervalIntegrable_const hb
    have htD : birthElapsed cfg ε M (s.1,z)=t := if_neg hd
    rw [htD]
    change (augTimedStepPair cfg ε M (s.1,z)).1.physical.clocks L-s.1.val.1.physical.clocks L≤t*C
    have hd' : ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true) := hd
    simp only [augTimedStepPair,if_neg hd']
    rw [augOutcome_clocks_eq_pre]
    change (selectedCurve cfg (x,t)).2.1 L-x.val.clocks L≤t*C
    rw [←selectedClockRHS_integral cfg x s.1.property.1.1 L t ht]
    simpa only [intervalIntegral.integral_const,sub_zero,smul_eq_mul] using hi

end NoThreeLine

#print axioms NoThreeLine.selectedClockRHS_integral
#print axioms NoThreeLine.augTimedStep_clock_le_protected_cells

