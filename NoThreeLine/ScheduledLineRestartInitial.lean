import NoThreeLine.ProtectedLineExitInitialCredit
import NoThreeLine.ScheduledProtectedClockPhase

/-! The actual first-birth mixture starts in occupancy one with the
clock cap, saved bounds and guard readiness. The incoming cell credit
can exceed a lower threshold only if stage zero has already exceeded it. -/
set_option autoImplicit false
set_option maxHeartbeats 2200000
noncomputable section
open Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

theorem recycledPhaseState_auxReady {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (e : ValidAugmentedState n B) (he : e.val.AuxReady Γ ε M) (j : ℕ) (ω : BoardClockPath n) :
    (recycledPhaseState cs ε M deadline start hn e j ω).val.AuxReady Γ ε M := by
  induction j with
  | zero => exact he
  | succ j ih =>
    rw [recycledPhaseState_succ_eq,recycledScheduledPair]
    apply augValidDeadlineRetirement_auxReady
    let cfg := (cs j).config
    let s := augPhaseStart cfg ε M (recycledPhaseState cs ε M deadline start hn e j ω)
    let v := (recycledPhases cs ε M deadline start hn e j ω).2
    have hs : s.val.1.AuxReady cfg.directions ε M := by
      change (recycledPhaseState cs ε M deadline start hn e j ω).val.AuxReady (cs j).directions ε M
      rw [hΓ j]
      exact ih
    have ht := augRecycledPair_auxReady cfg ε M hn s hs (augRecycledCompletionIndex cfg ε M hn s v) v
    rw [←hΓ j]
    exact ht

theorem scheduledLineExit_stageOne_initial {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hE : E⊆L.val) (A : ℝ→ℝ) (hA : Monotone A)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (J : ℕ) (s : ProtectedPhaseState n B)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hsp : ∀j,specified (cs j).directions L)
    (ho : occupancy s.1.val.physical.process L=0) (hk : s.1.val.physical.clocks L≤K)
    (hsv : ∀q∈L.val,0≤s.2.1 q ∧ s.2.1 q≤2*B)
    (hs : s.1.val.AuxReady Γ ε M) (b : ℝ) (ω : BoardClockPath n) :
    let a := (scheduledLineExitIterate cs ε M deadline start L 0 hn J s J ω).1
    a.1<J →
      let v := unpackProtectedTimed (cs a.1).config a.2
      occupancy v.1.val.1.physical.process L=1 ∧
      v.1.val.1.physical.clocks L≤K ∧ v.1.val.1.AuxReady (cs a.1).directions ε M ∧
      (∀q∈L.val,0≤v.2 q ∧ v.2 q≤2*B) ∧
      (ω∉scheduledProtectedExceedance cs ε M deadline start L 0 E A hn b J s →
        protectedStateTotal (cs a.1).config L E A v≤b) := by
  intro a ha
  let ref := fun j=>protectedScheduledIterate cs ε M deadline start L p hn J s j ω
  rcases scheduledLineExitIterate_cases cs ε M deadline start L 0 p hn J s ho.le J le_rfl ω with
    ⟨he,_⟩ | ⟨j,hj,hocc,hex,he⟩
  · have hi := protectedScheduledIterate_index cs ε M deadline start L p hn J s J le_rfl ω
    have hidx : a.1=J := (congrArg (fun x=>x.1.1) he).trans hi
    omega
  · let cfg := (cs j).config
    let w := protectedPhaseStart cfg ε M (ref j).1.2
    let z := protectedLineExitPair cfg ε M L 0 hn w (ref j).2
    have he' : a=(j,packProtectedTimed cfg z.1) := congrArg Prod.fst he
    simp only [he',unpackProtectedTimed_pack]
    have hocc0 : occupancy w.1.val.1.physical.process L=0 := Nat.eq_zero_of_le_zero hocc
    have hp := protectedScheduledIterate_projection cs ε M deadline start L p hn J s j hj.le ω
    have hphysical : w.1.val.1=(recycledPhaseState cs ε M deadline start hn s.1 j ω).val :=
      congrArg (fun x=>x.1.2.val) hp
    have hk' : w.1.val.1.physical.clocks L≤K := by
      rw [hphysical]
      exact (recycledPhaseState_lineStageRegion cs ε M K deadline start hn hKcfg L hsp 0 (by omega)
        s.1 ⟨ho.ge,fun _=>hk⟩ j ω).2 (hphysical ▸ hocc0)
    have hw : w.1.val.1.AuxReady cfg.directions ε M := by
      rw [hphysical]
      change (recycledPhaseState cs ε M deadline start hn s.1 j ω).val.AuxReady (cs j).directions ε M
      rw [hΓ j]
      exact recycledPhaseState_auxReady cs ε M deadline start hn Γ hΓ s.1 hs j ω
    have hsv' (q : Grid n) (hq : q∈L.val) : 0≤w.2 q ∧ w.2 q≤2*cfg.B :=
      protectedScheduled_saved_at cs ε M deadline start L p hn J s hsp q hq (hsv q hq) j hj.le ω
    have hb (q : Grid n) (hq : q∈L.val) :=
      protectedLineExitPair_birth_bounds cfg ε M K (hKcfg j) L (hsp j) 0 (by omega)
        q hq hn w hocc0 hk' (hsv' q hq) (ref j).2 hex
    refine ⟨(hb p hpL).1,(hb p hpL).2.1,
      protectedLineExit_auxReady cfg ε M L 0 hn w hw (ref j).2,
      fun q hq=>(hb q hq).2.2,?_⟩
    intro hno
    apply protectedLineExit_firstBirth_total_le cfg ε M L (hsp j) E hE A hA hn w hocc0 hsv'
      b (ref j).2 hex
    intro h
    exact hno ((mem_scheduledProtectedExceedance_iff_original cs ε M deadline start L 0 E A p hn b J s ω).mpr
      ⟨j,hj,h⟩)

end NoThreeLine

#print axioms NoThreeLine.recycledPhaseState_auxReady
#print axioms NoThreeLine.scheduledLineExit_stageOne_initial

