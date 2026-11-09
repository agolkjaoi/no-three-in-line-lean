import NoThreeLine.ProtectedTimedFirstLineBirth
import NoThreeLine.ProtectedLineStageRestart
import NoThreeLine.ProtectedEnergyGuardHistory

/-! A genuine birth exit can restart with only the cell credit already
reached by the preceding occupancy-zero phase. Its saved ledger and
guard conditions are inherited from the actual timed process. -/
set_option autoImplicit false
set_option maxHeartbeats 1850000
noncomputable section
open Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem birthElapsed_pos_of_timedBirth {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (z : CandidateData n) (hb : timedBirth cfg ε M (s,z)) :
    0<birthElapsed cfg ε M (s,z) := by
  have ha : birthElapsed cfg ε M (s,z)=z.1.1 := by
    rw [birthElapsed,if_neg (show ¬birthDone cfg s from hb.1)]
    change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) z.1.1)=z.1.1
    rw [min_eq_right hb.2.1.2,max_eq_right hb.2.1.1.le]
  rw [ha]
  exact hb.2.1.1

theorem protectedLineExit_firstBirth_total_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (A : ℝ→ℝ) (hA : Monotone A) (hn : 0<n) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=0)
    (hsv : ∀q∈L.val,0≤s.2 q ∧ s.2 q≤2*cfg.B)
    (b : ℝ) (ω : BoardClockPath n)
    (hex : 0<occupancy (protectedLineExitPair cfg ε M L 0 hn s ω).1.1.val.1.physical.process L)
    (hno : ω∉protectedActualExceedance cfg ε M L 0 E A hn s b) :
    protectedStateTotal cfg L E A (protectedLineExitPair cfg ε M L 0 hn s ω).1≤b := by
  obtain ⟨k,hk,hpre,hb,hqL,_⟩ := protectedLineExitPair_first_birth cfg ε M L 0 hn s ho ω hex
  let r := protectedRecycledPair cfg ε M L hn s k ω
  let z := WinnerMarkLaw.firstMarkedRace hn r.2
  let t := birthElapsed cfg ε M (r.1.1,z)
  let w := (protectedRecycledPair cfg ε M L hn s (k+1) ω).1
  have he : (protectedLineExitPair cfg ε M L 0 hn s ω).1=w := by
    unfold protectedLineExitPair firstHitPair
    rw [hk]
    rfl
  have hs (q : Grid n) (hq : q∈L.val) : 0≤r.1.2 q ∧ r.1.2 q≤2*cfg.B :=
    protectedRecycledPair_saved_bounds_all cfg ε M L hsp q hq hn s (hsv q hq) k ω
  have hb' : timedBirth cfg ε M (r.1.1,z) := hb
  have hdrop : t=r.1.1.val.2-w.1.val.2 := birthElapsed_eq_remaining_drop cfg ε M (r.1.1,z)
  have hflow : protectedStateFlowTotal cfg L E A (r.1,t)≤b := by
    apply le_of_not_gt
    intro hh
    exact hno ((mem_protectedActualExceedance_iff cfg ε M L 0 E A hn s b ω).mpr
      ⟨k,hpre,Or.inr ⟨hb'.1,t,birthElapsed_pos_of_timedBirth cfg ε M r.1.1 z hb',hdrop.le,hh⟩⟩)
  rw [he]
  have h : protectedStateTotal cfg L E A w≤protectedStateFlowTotal cfg L E A (r.1,t) :=
    protectedStateTotal_firstLineBirth_le cfg ε M L hsp E hE A hA r.1 z hpre hb' hqL hs
  exact h.trans hflow

theorem protectedLineExit_auxReady {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (hs : s.1.val.1.AuxReady cfg.directions ε M) (ω : BoardClockPath n) :
    (protectedLineExitPair cfg ε M L N hn s ω).1.1.val.1.AuxReady cfg.directions ε M :=
  protectedRecycledPair_auxReady cfg ε M L hn s hs _ ω

end NoThreeLine

#print axioms NoThreeLine.protectedLineExit_firstBirth_total_le
#print axioms NoThreeLine.protectedLineExit_auxReady

