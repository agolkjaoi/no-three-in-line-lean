import NoThreeLine.ProtectedDeletionLedger
import NoThreeLine.SelectedLineClockBound
import NoThreeLine.VirtualContinuousContact

/-! Whole-event loss at the actual pre-birth segment endpoint. The real
physical and auxiliary guards supply the inclusive virtual and clock bounds.
Only the initial bounds are hypotheses; no future-time mass bound is assumed. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem augPreState_virtual_upper {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (L : LineIndex n) (q : Grid n)
    (hinit : virtualMass x.1.1.val.process cfg.directions x.1.1.val.coordinates L q≤M)
    (z : (ℝ×Grid n)×ℝ) :
    virtualMass (augPreState cfg ε M (x,z)).physical.process cfg.directions
      (augPreState cfg ε M (x,z)).physical.coordinates L q≤M := by
  change virtualMass (selectedTrajectory cfg (x.1.1,augAdvance cfg ε M (x,z.1.1))).process
    cfg.directions (selectedTrajectory cfg (x.1.1,augAdvance cfg ε M (x,z.1.1))).coordinates L q≤M
  rw [BirthWitness.selectedTrajectory_virtualMass]
  have ht := augAdvance_mem cfg ε M x he z.1.1
  exact selectedAuxTime_virtual_upper cfg ε M x.1 he L q hinit _
    ⟨ht.1,ht.2.trans (augGuardTime_le_aux cfg ε M x)⟩

theorem augPreState_external_deletion_bound {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n)
    (hE : E⊆L.val) (hs : x.1.1.val.process.stopped=false)
    (hsp : specified cfg.directions L) (hq : (x.1.1.val.process.accounts q).status=.active)
    (hqL : q∉L.val) (hN : occupancy x.1.1.val.process L≤1)
    (hKcfg : cfg.K≤K) (hclock : x.1.1.val.clocks L≤K) (hK : K<2)
    (hinit : virtualMass x.1.1.val.process cfg.directions x.1.1.val.coordinates L q≤M)
    (z : (ℝ×Grid n)×ℝ) :
    protectedExternalDeletion (augPreState cfg ε M (x,z)).physical cfg.directions L E q≤
      M+2*(cfg.directions.card:ℝ)*cfg.B ∧
    (protectedExternalDeletion (augPreState cfg ε M (x,z)).physical cfg.directions L E q)^2≤
      (M+2*(cfg.directions.card:ℝ)*cfg.B)*
        protectedExternalDeletion (augPreState cfg ε M (x,z)).physical cfg.directions L E q := by
  have ht := augAdvance_mem cfg ε M x he z.1.1
  have htG : augAdvance cfg ε M (x,z.1.1)∈Icc (0:ℝ) (selectedGuardTime cfg x.1.1) :=
    ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M x he).2⟩
  have hpre : (augPreState cfg ε M (x,z)).physical.Valid cfg.B :=
    cappedPreState_valid cfg (augPhysicalInput cfg ε M x) he z
  have hcl : (augPreState cfg ε M (x,z)).physical.clocks L≤K :=
    selectedCurve_specifiedClock_le cfg x.1.1 he K hKcfg L hsp hN hclock _ htG
  have hv := augPreState_virtual_upper cfg ε M x he L q hinit z
  exact ⟨protectedExternalDeletion_closed_bound _ cfg.directions L E q cfg.B K M
    hpre hE hs hsp hq hqL hN hcl hK hv,
    protectedExternalDeletion_closed_square _ cfg.directions L E q cfg.B K M
    hpre hE hs hsp hq hqL hN hcl hK hv⟩

end NoThreeLine

#print axioms NoThreeLine.augPreState_virtual_upper
#print axioms NoThreeLine.augPreState_external_deletion_bound
