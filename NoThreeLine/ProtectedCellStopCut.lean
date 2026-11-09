import NoThreeLine.FirstUpperHitMeasurable
import NoThreeLine.ProtectedCellCutDrift
import NoThreeLine.ProtectedWholeCostRegularity

/-! Select the first upper contact of the real cell credit or the
remaining entropy cost. The local cut is capped by the actual guard. -/
set_option autoImplicit false
set_option maxHeartbeats 2200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedCellStopSignal {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (cap : ℝ) (x : (ProtectedTimedState cfg×ℝ)×ℝ) : ℝ :=
  max (protectedStateFlowTotal cfg L E id (x.1.1,x.2)-cap)
    (protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1.1,x.2)-x.1.2)

theorem protectedCellStopSignal_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (cap : ℝ) : Measurable (protectedCellStopSignal cfg L E cap) := by
  have h := measurable_fst.fst.prodMk
    (measurable_snd : Measurable (Prod.snd : (ProtectedTimedState cfg×ℝ)×ℝ→ℝ))
  exact (((protectedStateFlowTotal_measurable cfg L E id measurable_id).comp h).sub measurable_const).max
    (((protectedLocalStateSource_measurable cfg (protectedWholeCostField cfg L E)
      ((protectedWholeCostRate_measurable cfg.directions cfg.mask L E).comp measurable_fst)).comp h).sub
      measurable_fst.snd)

theorem protectedCellStopSignal_continuous {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (E : Finset (Grid n)) (cap : ℝ) (x : ProtectedTimedState cfg×ℝ) :
    Continuous (fun u=>protectedCellStopSignal cfg L E cap (x,u)) := by
  let a := (augTimedInput cfg x.1.1).1.1
  let w := fun u=>protectedWholeCostRate (selectedTrajectory cfg (a,u)) cfg.directions cfg.mask L E
  have hw : Continuous w :=
    (protectedWholeCostRate_withCoordinates_continuous a.val cfg.directions cfg.mask L E).comp
      (selectedLedgerCurve_continuous cfg a)
  have hI : Continuous (fun u : ℝ=>∫t in (0:ℝ)..u,w t) :=
    intervalIntegral.continuous_primitive (fun a b=>hw.intervalIntegrable a b) 0
  change Continuous (fun u : ℝ=>max (protectedStateFlowTotal cfg L E id (x.1,u)-cap)
    ((∫t in (0:ℝ)..max 0 u,w t)-x.2))
  exact ((protectedStateFlowTotal_continuous cfg L E id continuous_id x.1).sub continuous_const).max
    ((hI.comp (continuous_const.max continuous_id)).sub (continuous_const (y:=x.2)))

def protectedCellStopCut {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (cap : ℝ) (x : ProtectedTimedState cfg×ℝ) : ℝ :=
  min (augGuardTime cfg ε M (augTimedInput cfg x.1.1))
    (firstClosedHit cfg.horizon (fun t=>protectedCellStopSignal cfg L E cap (x,t)) (Ici 0))

theorem protectedCellStopCut_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (cap : ℝ) : Measurable (protectedCellStopCut cfg ε M L E cap) :=
  ((augGuardTime_measurable cfg ε M).comp
    ((augTimedInput_measurable cfg).comp measurable_fst.fst)).min
      (firstUpperHit_measurable cfg.horizon 0 cfg.horizon.coe_nonneg (protectedCellStopSignal cfg L E cap)
        (protectedCellStopSignal_measurable cfg L E cap) (protectedCellStopSignal_continuous cfg L E cap))

theorem protectedCellStopCut_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (cap : ℝ) (x : ProtectedTimedState cfg×ℝ) :
    protectedCellStopCut cfg ε M L E cap x∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg x.1.1)) := by
  exact ⟨le_min (augGuardTime_mem cfg ε M _ x.1.1.property.1.1).1
      (firstClosedHit_bounds cfg.horizon cfg.horizon.coe_nonneg _ _
        (protectedCellStopSignal_continuous cfg L E cap x) isClosed_Ici).1,min_le_left _ _⟩

theorem protectedCellStopCut_before {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (cap : ℝ) (x : ProtectedTimedState cfg×ℝ) (t : ℝ)
    (ht : 0≤t) (hcut : t<protectedCellStopCut cfg ε M L E cap x) :
    protectedStateFlowTotal cfg L E id (x.1,t)<cap ∧
      protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1,t)<x.2 := by
  have hn := firstClosedHit_before cfg.horizon cfg.horizon.coe_nonneg _ _
    (protectedCellStopSignal_continuous cfg L E cap x) isClosed_Ici t ht
      (hcut.trans_le (min_le_right _ _))
  change ¬0≤protectedCellStopSignal cfg L E cap (x,t) at hn
  simpa only [protectedCellStopSignal,max_lt_iff,sub_neg] using (lt_of_not_ge hn)

theorem protectedCellStopCut_at_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (cap : ℝ) (x : ProtectedTimedState cfg×ℝ)
    (h0 : protectedStateTotal cfg L E id x.1≤cap) (hr : 0≤x.2) :
    protectedStateFlowTotal cfg L E id (x.1,protectedCellStopCut cfg ε M L E cap x)≤cap ∧
      protectedLocalStateSource cfg (protectedWholeCostField cfg L E)
        (x.1,protectedCellStopCut cfg ε M L E cap x)≤x.2 := by
  let τ := protectedCellStopCut cfg ε M L E cap x
  let f := fun t=>protectedCellStopSignal cfg L E cap (x,t)
  have hτ : 0≤τ := (protectedCellStopCut_bounds cfg ε M L E cap x).1
  have h : f τ≤0 := by
    by_cases hz : τ=0
    · rw [hz]
      change max (protectedStateFlowTotal cfg L E id (x.1,0)-cap)
        (protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1,0)-x.2)≤0
      have hC : protectedStateFlowTotal cfg L E id (x.1,0)=protectedStateTotal cfg L E id x.1 := by
        unfold protectedStateFlowTotal protectedStateTotal protectedScalarTotal
        apply Finset.sum_congr rfl
        intro p _
        exact selectedProtectedLedger_zero cfg (augTimedInput cfg x.1.1).1.1 x.1.1.property.1.1 L x.1.2 p
      rw [hC]
      simp only [protectedLocalStateSource,max_self,intervalIntegral.integral_same]
      exact max_le (sub_nonpos.mpr h0) (sub_nonpos.mpr hr)
    · have hs : Ico (0:ℝ) τ⊆{t | f t≤0} := by
        intro u hu
        have hp := protectedCellStopCut_before cfg ε M L E cap x u hu.1 hu.2
        exact max_le (sub_nonpos.mpr hp.1.le) (sub_nonpos.mpr hp.2.le)
      have hc := closure_minimal hs
        (isClosed_le (protectedCellStopSignal_continuous cfg L E cap x) continuous_const)
      rw [closure_Ico (lt_of_le_of_ne hτ (Ne.symm hz)).ne] at hc
      exact hc ⟨hτ,le_rfl⟩
  change max (protectedStateFlowTotal cfg L E id (x.1,τ)-cap)
    (protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1,τ)-x.2)≤0 at h
  exact ⟨sub_nonpos.mp ((le_max_left _ _).trans h),sub_nonpos.mp ((le_max_right _ _).trans h)⟩

theorem protectedCellStopCut_contact {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (cap : ℝ) (x : ProtectedTimedState cfg×ℝ) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg x.1.1)))
    (h : cap≤protectedStateFlowTotal cfg L E id (x.1,t) ∨
      x.2≤protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1,t)) :
    let u := protectedCellStopCut cfg ε M L E cap x
    u≤t ∧ (cap≤protectedStateFlowTotal cfg L E id (x.1,u) ∨
      x.2≤protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1,u)) := by
  let T := (cfg.horizon:ℝ)
  let f := fun u=>protectedCellStopSignal cfg L E cap (x,u)
  let v := firstClosedHit T f (Ici 0)
  let g := augGuardTime cfg ε M (augTimedInput cfg x.1.1)
  have hg : g≤T := (augGuardTime_le_remaining cfg ε M _ x.1.1.property.2.1).trans x.1.1.property.2.2
  have hf : 0≤f t := by
    rcases h with h | h
    · exact (sub_nonneg.mpr h).trans (le_max_left _ _)
    · exact (sub_nonneg.mpr h).trans (le_max_right _ _)
  have hv : v≤t := (firstClosedHit_le_iff T cfg.horizon.coe_nonneg f (Ici 0)
    (protectedCellStopSignal_continuous cfg L E cap x) isClosed_Ici t).mpr
      ⟨t,⟨ht.1,ht.2.trans hg⟩,le_rfl,Or.inr hf⟩
  have hfv : 0≤f v := by
    by_cases he : v=t
    · rwa [he]
    · exact firstClosedHit_contact T cfg.horizon.coe_nonneg f (Ici 0)
        (protectedCellStopSignal_continuous cfg L E cap x) isClosed_Ici
        ((lt_of_le_of_ne hv he).trans_le (ht.2.trans hg))
  change min g v≤t ∧ (cap≤protectedStateFlowTotal cfg L E id (x.1,min g v) ∨
    x.2≤protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1,min g v))
  rw [min_eq_right (hv.trans ht.2)]
  refine ⟨hv,?_⟩
  change 0≤max (protectedStateFlowTotal cfg L E id (x.1,v)-cap)
    (protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1,v)-x.2) at hfv
  simpa only [le_max_iff,sub_nonneg] using hfv

theorem protectedCellStopCut_contact_of_lt_guard {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (cap : ℝ) (x : ProtectedTimedState cfg×ℝ)
    (hu : protectedCellStopCut cfg ε M L E cap x<augGuardTime cfg ε M (augTimedInput cfg x.1.1)) :
    let u := protectedCellStopCut cfg ε M L E cap x
    cap≤protectedStateFlowTotal cfg L E id (x.1,u) ∨
      x.2≤protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1,u) := by
  let f := fun u=>protectedCellStopSignal cfg L E cap (x,u)
  let v := firstClosedHit cfg.horizon f (Ici 0)
  let g := augGuardTime cfg ε M (augTimedInput cfg x.1.1)
  change min g v<g at hu
  have hv : v<g := by
    by_contra h
    rw [min_eq_left (le_of_not_gt h)] at hu
    exact (lt_irrefl g) hu
  have hg : g≤(cfg.horizon:ℝ) :=
    (augGuardTime_le_remaining cfg ε M _ x.1.1.property.2.1).trans x.1.1.property.2.2
  have hc := firstClosedHit_contact cfg.horizon cfg.horizon.coe_nonneg f (Ici 0)
    (protectedCellStopSignal_continuous cfg L E cap x) isClosed_Ici (hv.trans_le hg)
  change 0≤max (protectedStateFlowTotal cfg L E id (x.1,v)-cap)
    (protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1,v)-x.2) at hc
  change cap≤protectedStateFlowTotal cfg L E id (x.1,min g v) ∨
    x.2≤protectedLocalStateSource cfg (protectedWholeCostField cfg L E) (x.1,min g v)
  rw [min_eq_right hv.le]
  simpa only [le_max_iff,sub_nonneg] using hc

end NoThreeLine

#print axioms NoThreeLine.protectedCellStopCut_measurable
#print axioms NoThreeLine.protectedCellStopCut_at_le
#print axioms NoThreeLine.protectedCellStopCut_contact

