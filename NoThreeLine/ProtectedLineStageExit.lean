import NoThreeLine.RecycledFirstHit
import NoThreeLine.ProtectedLedgerTerminal
import NoThreeLine.RecycledLineStage
import NoThreeLine.LineStageSurvival

/-! Stop the actual saved book at the first new line birth, or physical
completion if that comes first. The residual is the actual remaining
board and is independent of the stopped payload under the original law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE BirthWitness RecycledBoardProcess

def protectedLineExitTest {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) (N : ℕ)
    (s : ProtectedTimedState cfg) : Prop :=
  N<occupancy s.1.val.1.physical.process L ∨ AugTimedDone cfg s.1

theorem protectedLineExitTest_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) (N : ℕ) :
    Measurable (protectedLineExitTest cfg L N) := by
  have hp : Measurable (fun s : ProtectedTimedState cfg=>s.1.val.1.physical) :=
    (AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)
  have ho := (ExtendedState.measurable_occupancy n L).comp hp
  have ht : Measurable (fun k : ℕ=>N<k) := measurable_of_countable _
  exact (ht.comp ho).or ((augTimedDone_measurable cfg).comp measurable_fst)

def protectedLineExitPair {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n) :
    ProtectedTimedState cfg × BoardClockPath n :=
  firstHitPair (protectedRestartStep cfg ε M L hn) (protectedLineExitTest cfg L N) s ω

theorem protectedLineExitPair_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) :
    Measurable (fun x : ProtectedTimedState cfg × BoardClockPath n=>protectedLineExitPair cfg ε M L N hn x.1 x.2) :=
  firstHitPair_joint_measurable _ (protectedRestartStep_measurable cfg ε M L hn) _
    (protectedLineExitTest_measurable cfg L N)

theorem protectedLineExit_exists_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∃k,protectedLineExitTest cfg L N
      (protectedRecycledPair cfg ε M L hn s k ω).1 := by
  filter_upwards [augRecycledPair_completes_ae cfg ε M hn hB s.1] with ω h
  obtain ⟨k,hk⟩ := h
  refine ⟨k,Or.inr ?_⟩
  rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s k ω)]
  exact hk

theorem protectedLineExitPair_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) :
    (boardClockMeasure n (cfg.B/n)).map (protectedLineExitPair cfg ε M L N hn s)=
      ((boardClockMeasure n (cfg.B/n)).map (fun ω=>(protectedLineExitPair cfg ε M L N hn s ω).1)).prod
        (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact firstHitPair_map _ (protectedRestartStep_measurable cfg ε M L hn) _
    (protectedLineExitTest_measurable cfg L N) _
    (protectedRestartStep_map cfg ε M L hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    s (protectedLineExit_exists_ae cfg ε M L N hn hB s)

theorem protectedLineExitPair_first_birth {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (ω : BoardClockPath n)
    (hex : N<occupancy (protectedLineExitPair cfg ε M L N hn s ω).1.1.val.1.physical.process L) :
    ∃k, firstHitIndex (protectedRestartStep cfg ε M L hn) (protectedLineExitTest cfg L N) s ω=k+1 ∧
      let r := protectedRecycledPair cfg ε M L hn s k ω
      occupancy r.1.1.val.1.physical.process L=N ∧
      timedBirth cfg ε M (r.1.1,WinnerMarkLaw.firstMarkedRace hn r.2) ∧
      (WinnerMarkLaw.firstMarkedRace hn r.2).1.2∈L.val ∧
      occupancy (protectedLineExitPair cfg ε M L N hn s ω).1.1.val.1.physical.process L=N+1 := by
  let F := protectedRestartStep cfg ε M L hn
  let H := protectedLineExitTest cfg L N
  let i := firstHitIndex F H s ω
  have hpos : 0 < i := by
    by_contra h
    have hi : i=0 := by omega
    change N<occupancy (protectedRecycledPair cfg ε M L hn s i ω).1.1.val.1.physical.process L at hex
    rw [hi] at hex
    change N<occupancy s.1.val.1.physical.process L at hex
    omega
  obtain ⟨k,hk⟩ : ∃ k,i=k+1 := ⟨i-1,by omega⟩
  let r := protectedRecycledPair cfg ε M L hn s k ω
  have hno : ¬H r.1 := by
    intro h
    have hm : i≤k := firstHitIndex_le F H s ω k h
    omega
  have hpre : occupancy r.1.1.val.1.physical.process L=N := by
    apply le_antisymm (le_of_not_gt (fun h=>hno (Or.inl h)))
    have hp : r.1.1=(augRecycledPair cfg ε M hn s.1 k ω).1 :=
      congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s k ω)
    rw [hp,←ho]
    exact recycled_occupancy_monotone cfg ε M L hn s.1 ω (Nat.zero_le k)
  have he : protectedLineExitPair cfg ε M L N hn s ω=
      protectedRecycledPair cfg ε M L hn s (k+1) ω := by
    change protectedRecycledPair cfg ε M L hn s i ω=_
    rw [hk]
  let z := WinnerMarkLaw.firstMarkedRace hn r.2
  have hh := augTimedStep_occupancy cfg ε M L r.1.1 z
  change occupancy (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1.val.1.physical.process L=
    occupancy r.1.1.val.1.physical.process L+(if timedBirth cfg ε M (r.1.1,z) ∧ z.1.2∈L.val then 1 else 0) at hh
  rw [←he,hpre] at hh
  have hb : timedBirth cfg ε M (r.1.1,z) ∧ z.1.2∈L.val := by
    by_contra h
    rw [if_neg h,Nat.add_zero] at hh
    omega
  exact ⟨k,hk,hpre,hb.1,hb.2,by simpa only [if_pos hb] using hh⟩

end NoThreeLine

#print axioms NoThreeLine.protectedLineExitPair_map
#print axioms NoThreeLine.protectedLineExitPair_first_birth
