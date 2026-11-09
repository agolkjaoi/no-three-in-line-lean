import NoThreeLine.ProtectedLineDrift
import NoThreeLine.SelectedWeightGrowthRate

/-! The protected continuous drift is the derivative of the actual live
weight divided by its specified-line protection along the selected flow. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines LineDrift

theorem specifiedLineWeight_withCoordinates {n : ℕ} (e : ExtendedState n)
    (L : LineIndex n) (p : Grid n) (z : Coordinates n) :
    specifiedLineWeight (e.withCoordinates z) L p=
      z.1 p*(2-z.2.1 L)/(2-(occupancy e.process L:ℝ)) := by
  change z.1 p/((2-(occupancy e.process L:ℝ))/(2-z.2.1 L))=_
  simp only [div_eq_mul_inv,inv_mul_cancel₀,inv_inv,mul_inv_rev]
  ring

theorem flow_specifiedLineWeight_hasDerivAt {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n)
    (z : ℝ→Coordinates n) (t : ℝ)
    (hs : e.process.stopped=false) (hsp : specified Γ L) (hN : occupancy e.process L≤1)
    (hd : HasDerivAt z (vectorField e.process Γ mask (z t)) t) :
    HasDerivAt (fun u=>specifiedLineWeight (e.withCoordinates (z u)) L p)
      (protectedLineContinuousDrift (e.withCoordinates (z t)) Γ mask L p) t := by
  have hw := hasDerivAt_pi.mp hd.fst p
  have hk := hasDerivAt_pi.mp hd.snd.fst L
  have hh : HasDerivAt
      (fun u : ℝ=>(z u).1 p*(2-(z u).2.1 L)/(2-(occupancy e.process L:ℝ)))
      (((vectorField e.process Γ mask (z t)).1 p*(2-(z t).2.1 L)+
        (z t).1 p*(0-clockRHS e.process Γ mask (z t) L))/(2-(occupancy e.process L:ℝ))) t :=
    (hw.mul ((hasDerivAt_const t (2:ℝ)).sub hk)).div_const (2-(occupancy e.process L:ℝ))
  have heq : protectedLineContinuousDrift (e.withCoordinates (z t)) Γ mask L p=
      ((vectorField e.process Γ mask (z t)).1 p*(2-(z t).2.1 L)+
        (z t).1 p*(0-clockRHS e.process Γ mask (z t) L))/(2-(occupancy e.process L:ℝ)) := by
    unfold protectedLineContinuousDrift
    rw [specifiedLineWeight_withCoordinates]
    change (e.process.withWeights (z t).1).continuousCreditDrift Γ
        ((e.process.withWeights (z t).1).birthRate mask) p/protection (occupancy e.process L) ((z t).2.1 L)-
        lineIntensity e.process mask (z t) L*b (occupancy e.process L)*
          ((z t).1 p*(2-(z t).2.1 L)/(2-(occupancy e.process L:ℝ)))=_
    rw [ProcessState.withWeights_continuousCreditDrift]
    simp only [vectorField,clockRHS,hs,hsp,hN,and_self,if_true,protection,b,
      div_eq_mul_inv,mul_inv_rev,inv_inv]
    ring
  rw [heq]
  simpa only [specifiedLineWeight_withCoordinates] using hh

theorem selected_specifiedLineWeight_hasDerivAt {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (p : Grid n)
    (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>specifiedLineWeight (selectedTrajectory cfg (x,u)) L p)
      (protectedLineContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p) t :=
  flow_specifiedLineWeight_hasDerivAt x.val cfg.directions cfg.mask L p _ t hs hsp hN
    (((selectedCurve_spec cfg x he.2.1).2.2.1 t ⟨ht.1.le,ht.2.le⟩).2.2.hasDerivAt
      (Icc_mem_nhds ht.1 ht.2))

theorem selected_protectedLine_derivative_generator {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (L : LineIndex n) (p : Grid n)
    (hs : x.val.process.stopped=false) (hp : (x.val.process.accounts p).status=.active)
    (hpL : p∈L.val) (hsp : specified cfg.directions L) (positive : Grid n→Grid n→Bool)
    (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>specifiedLineWeight (selectedTrajectory cfg (x,u)) L p)
      ((selectedTrajectory cfg (x,t)).process.birthRate cfg.mask p*
          (1-b (occupancy x.val.process L))*specifiedLineWeight (selectedTrajectory cfg (x,t)) L p-
        protectedExternalJumpRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask positive L p) t := by
  have hN := state_designated_count_le_one x.val.process cfg.directions p he.1 hp L.val
    ((specified_iff_designated cfg.directions p L hpL).mp hsp)
  have hd := selected_specifiedLineWeight_hasDerivAt cfg x he L p hs hsp hN t ht
  have hg := protectedLine_generator (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask positive L p
    (selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩).1 hs hp hpL hsp
  convert hd using 1
  change _=protectedLineContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p
  change protectedLineContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p+
      protectedExternalJumpRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask positive L p=
    (selectedTrajectory cfg (x,t)).process.birthRate cfg.mask p*
      (1-b (occupancy x.val.process L))*specifiedLineWeight (selectedTrajectory cfg (x,t)) L p at hg
  linarith

end NoThreeLine

#print axioms NoThreeLine.flow_specifiedLineWeight_hasDerivAt
#print axioms NoThreeLine.selected_protectedLine_derivative_generator
