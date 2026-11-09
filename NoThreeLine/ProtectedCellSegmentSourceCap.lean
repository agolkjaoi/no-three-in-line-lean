import NoThreeLine.ProtectedCellSourceCap
import NoThreeLine.ProtectedCenteredGenerator
import NoThreeLine.ProtectedCrossingObserver
import NoThreeLine.ProtectedEnergyGuardHistory

/-! Integrate the sharp cell-mass source bounds on the real selected
curve, including any cut of the actually executed flow segment. -/
set_option autoImplicit false
set_option maxHeartbeats 2050000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness LineDrift

theorem protectedCellSegment_sources_le {n : ℕ} (cfg : FlowConfig n) (ε M d : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (hE : E⊆L.val) (hsp : specified cfg.directions L)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hBd : cfg.B≤(n:ℝ)^d)
    (hm : ∀q,cfg.mask q≤1) (v : ProtectedTimedState cfg)
    (N : ℕ) (hN : N≤1) (ho : occupancy v.1.val.1.physical.process L=N)
    (hsv : ∀q∈E,0≤v.2 q ∧ v.2 q≤2*cfg.B)
    (cap t : ℝ) (ht : t∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg v.1)))
    (hcap : ∀u∈Ioo (0:ℝ) t,protectedStateFlowTotal cfg L E id (v,u)≤cap) :
    let x := (augTimedInput cfg v.1).1.1
    let e := fun u=>selectedTrajectory cfg (x,u)
    let C := fun u=>protectedCreditSourceField cfg L E (e u,v.2)
    let H := fun u=>protectedEntropySourceField cfg L E (e u,v.2)
    let V := fun u=>protectedWholeCostField cfg L E (e u,v.2)
    let β := (cfg.B/n)*(1-b N)
    (∫u in (0:ℝ)..t,C u)≤t*(β*cap) ∧
      (∫u in (0:ℝ)..t,H u)+(∫u in (0:ℝ)..t,V u)≤
        t*(β*((entropyLogConstant d*Real.log n)*max 1 cap)) := by
  let x := (augTimedInput cfg v.1).1.1
  let e := fun u=>selectedTrajectory cfg (x,u)
  let C := fun u=>protectedCreditSourceField cfg L E (e u,v.2)
  let H := fun u=>protectedEntropySourceField cfg L E (e u,v.2)
  let V := fun u=>protectedWholeCostField cfg L E (e u,v.2)
  let β := (cfg.B/n)*(1-b N)
  have hb : 0<cfg.B := zero_lt_one.trans_le hB
  have hβ : 0≤β := mul_nonneg (div_nonneg hb.le (Nat.cast_nonneg n)) (one_sub_b_bounds N hN).1
  have hCI : IntervalIntegrable C volume 0 t :=
    (selectedCreditSource_continuous cfg x L E).intervalIntegrable 0 t
  have hHI : IntervalIntegrable H volume 0 t :=
    (selectedEntropySource_continuous cfg x L E v.2 hb).intervalIntegrable 0 t
  have hVI : IntervalIntegrable V volume 0 t :=
    ((protectedWholeCostRate_withCoordinates_continuous x.val cfg.directions cfg.mask L E).comp
      (selectedLedgerCurve_continuous cfg x)).intervalIntegrable 0 t
  have hlog := entropy_log_scale cfg.B d hn hB hd hBd
  have hstep (u : ℝ) (hu : u∈Ioo (0:ℝ) t) :
      C u≤β*cap ∧ H u+V u≤β*((entropyLogConstant d*Real.log n)*max 1 cap) := by
    have ht' := augGuardTime_mem cfg ε M (augTimedInput cfg v.1) v.1.property.1.1
    have hv : (e u).Valid cfg.B :=
      selectedTrajectory_valid cfg x v.1.property.1.1 u ⟨hu.1.le,hu.2.le.trans (ht.2.trans ht'.2)⟩
    have ho' : occupancy (e u).process L=N := ho
    have hm' (q) : 0≤cfg.mask q ∧ cfg.mask q≤1 := ⟨cfg.mask_nonneg q,hm q⟩
    have hM : protectedCreditTotal L E (e u) v.2≤cap := hcap u hu
    have hC := protectedCreditTotalSource_le_mass (e u) v.2 cfg.directions cfg.mask L E
      cfg.B hb hv hm' hsp hE (ho' ▸ hN) hsv
    have hH := protectedEntropyTotalSource_add_cost_le_entropy (e u) v.2 cfg.directions cfg.mask L E
      cfg.B hb hv hm' hsp hE (ho' ▸ hN) hsv
    have hHC := (protectedEntropyTotal_nonneg_le_credit_log (e u) v.2 cfg.directions L E
      cfg.B d hn hB hd hBd hv hsp hE hsv).2
    rw [ho'] at hC hH
    exact ⟨hC.trans (mul_le_mul_of_nonneg_left hM hβ),
      hH.trans (mul_le_mul_of_nonneg_left
        (hHC.trans (mul_le_mul_of_nonneg_left (max_le_max le_rfl hM) (hlog.1.trans hlog.2))) hβ)⟩
  constructor
  · have hi := intervalIntegral.integral_mono_on_of_le_Ioo ht.1 hCI intervalIntegrable_const
      (fun u hu=>(hstep u hu).1)
    simpa only [intervalIntegral.integral_const,sub_zero,smul_eq_mul] using hi
  · have hi := intervalIntegral.integral_mono_on_of_le_Ioo ht.1 (hHI.add hVI) intervalIntegrable_const
      (fun u hu=>(hstep u hu).2)
    rw [intervalIntegral.integral_add hHI hVI] at hi
    simpa only [intervalIntegral.integral_const,sub_zero,smul_eq_mul] using hi

end NoThreeLine

#print axioms NoThreeLine.protectedCellSegment_sources_le

