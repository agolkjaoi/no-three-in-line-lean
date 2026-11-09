import NoThreeLine.ProtectedLineStageExit
import NoThreeLine.ObservedPhaseContinuation
import NoThreeLine.ProtectedLedgerGlobalBounds

/-! Restart at the actual random stage exit. State-event restriction
preserves the product with the real residual board, and continuation
agrees pathwise with the original updates after the exit index. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

theorem protectedLineExitPair_restrict_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg)
    (E : Set (ProtectedTimedState cfg)) (hE : MeasurableSet E) :
    let ν := boardClockMeasure n (cfg.B/n)
    let r := protectedLineExitPair cfg ε M L N hn s
    (ν.restrict ((fun ω=>(r ω).1) ⁻¹' E)).map r=
      ((ν.map (fun ω=>(r ω).1)).restrict E).prod ν := by
  let ν := boardClockMeasure n (cfg.B/n)
  let r := protectedLineExitPair cfg ε M L N hn s
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hr : Measurable r := (protectedLineExitPair_joint_measurable cfg ε M L N hn).comp
    (measurable_const.prodMk measurable_id)
  have he : (fun ω=>(r ω).1) ⁻¹' E=r ⁻¹' (E×ˢ(univ : Set (BoardClockPath n))) := by
    ext ω
    simp
  change (ν.restrict ((fun ω=>(r ω).1) ⁻¹' E)).map r=((ν.map (fun ω=>(r ω).1)).restrict E).prod ν
  rw [he,←Measure.restrict_map hr (hE.prod MeasurableSet.univ),
    show ν.map r=(ν.map (fun ω=>(r ω).1)).prod ν from protectedLineExitPair_map cfg ε M L N hn hB s,
    ←Measure.restrict_prod_eq_prod_univ]

theorem protectedLineExitPair_continue {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n) (k : ℕ) :
    let i := firstHitIndex (protectedRestartStep cfg ε M L hn) (protectedLineExitTest cfg L N) s ω
    let r := protectedLineExitPair cfg ε M L N hn s ω
    protectedRecycledPair cfg ε M L hn r.1 k r.2=
      protectedRecycledPair cfg ε M L hn s (i+k) ω :=
  (iterate_add (protectedRestartStep cfg ε M L hn) s _ k ω).symm

theorem protectedLineExitPair_birth_bounds {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n)
    (s : ProtectedTimedState cfg) (ho : occupancy s.1.val.1.physical.process L=N)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (ω : BoardClockPath n)
    (hex : N<occupancy (protectedLineExitPair cfg ε M L N hn s ω).1.1.val.1.physical.process L) :
    let v := (protectedLineExitPair cfg ε M L N hn s ω).1
    occupancy v.1.val.1.physical.process L=N+1 ∧ v.1.val.1.physical.clocks L≤K ∧
      0≤v.2 p ∧ v.2 p≤2*cfg.B := by
  obtain ⟨k,hi,hpre,_,_,hpost⟩ := protectedLineExitPair_first_birth cfg ε M L N hn s ho ω hex
  let r := protectedRecycledPair cfg ε M L hn s k ω
  have hp : r.1.1=(augRecycledPair cfg ε M hn s.1 k ω).1 :=
    congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s k ω)
  have hreg : lineStageRegion cfg K L N r.1.1 := by
    rw [hp]
    exact lineStageRegion_recycled cfg ε M K hKcfg L hsp N hN hn s.1 ⟨ho.ge,fun _=>hk⟩ k ω
  have hNpre : occupancy r.1.1.val.1.physical.process L≤1 := by rw [hpre]; exact hN
  have hclock := augTimedStep_specifiedClock_le cfg ε M K hKcfg L hsp r.1.1 hNpre (hreg.2 hpre)
    (WinnerMarkLaw.firstMarkedRace hn r.2)
  change _ ∧ _ ∧ _ ∧ _
  refine ⟨hpost,?_,?_⟩
  · unfold protectedLineExitPair firstHitPair
    rw [hi]
    exact hclock
  · exact protectedRecycledPair_saved_bounds_all cfg ε M L hsp p hpL hn s hsv _ ω

end NoThreeLine

#print axioms NoThreeLine.protectedLineExitPair_restrict_map
#print axioms NoThreeLine.protectedLineExitPair_continue
#print axioms NoThreeLine.protectedLineExitPair_birth_bounds
