import NoThreeLine.LineCreditFlowIntegral
import NoThreeLine.AugmentedCappedSegment

/-! Actual selected line-credit loss, including all physical/auxiliary caps
and the discrete candidate and boundary updates. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

def selectedLineCreditRate {n : ℕ} (cfg : FlowConfig n)
    (e : StateBall n cfg.box) (L : LineIndex n) (u : ℝ) : ℝ :=
  (selectedTrajectory cfg (e,u)).lineCredits L *
    creditDamping e.val.process cfg.directions cfg.mask (selectedCurve cfg (e,u)) L

theorem selectedLineCreditRate_continuous {n : ℕ} (cfg : FlowConfig n)
    (e : StateBall n cfg.box) (L : LineIndex n) :
    Continuous (selectedLineCreditRate cfg e L) := by
  have hc : Continuous (fun t : ℝ => selectedCurve cfg (e,t)) := by
    change Continuous (fun t : ℝ => (selectedModeFlow cfg e.val.mode).curve (stateInitialBall e,t))
    exact (selectedModeFlow cfg e.val.mode).continuous_curve.comp
      (continuous_const.prodMk continuous_id)
  exact ((continuous_apply L).comp hc.snd.snd).mul
    ((creditDamping_continuous e.val.process cfg.directions cfg.mask L).comp hc)

theorem selectedLineCredit_integral_between {n : ℕ} (cfg : FlowConfig n)
    (e : StateBall n cfg.box) (he : e.val.Valid cfg.B) (L : LineIndex n)
    (a b : ℝ) (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ selectedGuardTime cfg e) :
    (selectedTrajectory cfg (e,a)).lineCredits L -
      (selectedTrajectory cfg (e,b)).lineCredits L =
        ∫ u in a..b, selectedLineCreditRate cfg e L u := by
  have hc : Continuous (fun t : ℝ => selectedCurve cfg (e,t)) := by
    change Continuous (fun t : ℝ => (selectedModeFlow cfg e.val.mode).curve (stateInitialBall e,t))
    exact (selectedModeFlow cfg e.val.mode).continuous_curve.comp
      (continuous_const.prodMk continuous_id)
  apply flow_lineCredit_integral_between e.val.process cfg.directions cfg.mask
    (selectedGuardTime cfg e) (fun t => selectedCurve cfg (e,t)) hc.continuousOn
      _ L a b ha hab hb
  intro t ht
  exact ((selectedCurve_spec cfg e he.2.1).2.2.1 t ⟨ht.1.le,ht.2.le⟩).2.2.hasDerivAt
    (Icc_mem_nhds ht.1 ht.2)

theorem selectedLineCredit_integral {n : ℕ} (cfg : FlowConfig n)
    (e : StateBall n cfg.box) (he : e.val.Valid cfg.B) (L : LineIndex n)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (selectedGuardTime cfg e)) :
    e.val.lineCredits L - (selectedTrajectory cfg (e,t)).lineCredits L =
      ∫ u in (0 : ℝ)..t, selectedLineCreditRate cfg e L u := by
  have h := selectedLineCredit_integral_between cfg e he L 0 t le_rfl ht.1 ht.2
  have hinit : (selectedTrajectory cfg (e,0)).lineCredits L = e.val.lineCredits L := by
    change (selectedCurve cfg (e,0)).2.2 L = _
    rw [(selectedCurve_spec cfg e he.2.1).1]
    rfl
  rwa [hinit] at h

theorem AugmentedState.resolve_lineCredits {n : ℕ} (a : AugmentedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ) :
    (a.resolve Γ B K ρ ε M).physical.lineCredits = a.physical.lineCredits := by
  unfold AugmentedState.resolve
  split_ifs <;> rfl

theorem augOutcome_lineCredits {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ × Grid n) × ℝ) :
    (augOutcome cfg ε M (x,z)).physical.lineCredits =
      (selectedTrajectory cfg (x.1.1,augAdvance cfg ε M (x,z.1.1))).lineCredits := by
  rw [augOutcome,AugmentedState.resolve_lineCredits]
  unfold augRawOutcome
  split_ifs
  · rfl
  · rfl

theorem augOutcome_lineCredit_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (z : (ℝ × Grid n) × ℝ) (L : LineIndex n) :
    x.1.1.val.lineCredits L - (augOutcome cfg ε M (x,z)).physical.lineCredits L =
      ∫ u in (0 : ℝ)..augAdvance cfg ε M (x,z.1.1),
        selectedLineCreditRate cfg x.1.1 L u := by
  rw [augOutcome_lineCredits]
  have ht := augAdvance_mem cfg ε M x he z.1.1
  exact selectedLineCredit_integral cfg x.1.1 he L _
    ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M x he).2⟩

end NoThreeLine

#print axioms NoThreeLine.selectedLineCredit_integral_between
#print axioms NoThreeLine.augOutcome_lineCredits
#print axioms NoThreeLine.augOutcome_lineCredit_integral
