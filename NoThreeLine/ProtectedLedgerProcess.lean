import NoThreeLine.ProtectedInactiveStatus
import NoThreeLine.TerminalResidualLaw

/-! A passive ledger on the actual augmented timed process. Both the
physical state and the residual board project pathwise to the unchanged
original process; the ledger also preserves the residual product law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE

abbrev ProtectedTimedState {n : ℕ} (cfg : FlowConfig n) := AugTimedState cfg×(Grid n→ℝ)

def protectedRemember {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (s : ProtectedTimedState cfg) (v : AugTimedState cfg) : ProtectedTimedState cfg :=
  (v,protectedLineSave L s.1.val.1.physical v.val.1.physical s.2)

theorem protectedRemember_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) :
    Measurable (fun x : ProtectedTimedState cfg×AugTimedState cfg=>protectedRemember cfg L x.1 x.2) := by
  have hphys : Measurable (fun s : AugTimedState cfg=>s.val.1.physical) :=
    (AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst
  exact measurable_snd.prodMk ((protectedLineSave_measurable L).comp
    (((hphys.comp measurable_fst.fst).prodMk (hphys.comp measurable_snd)).prodMk measurable_fst.snd))

def protectedRestartStep {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (x : ProtectedTimedState cfg×BoardClockPath n) : ProtectedTimedState cfg×BoardClockPath n :=
  let r := augRestartStep cfg ε M hn (x.1.1,x.2)
  (protectedRemember cfg L x.1 r.1,r.2)

theorem protectedRestartStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n) :
    Measurable (protectedRestartStep cfg ε M L hn) := by
  have hr : Measurable (fun x : ProtectedTimedState cfg×BoardClockPath n=>augRestartStep cfg ε M hn (x.1.1,x.2)) :=
    (augRestartStep_measurable cfg ε M hn).comp (measurable_fst.fst.prodMk measurable_snd)
  exact ((protectedRemember_measurable cfg L).comp (measurable_fst.prodMk hr.fst)).prodMk hr.snd

theorem protectedRestartStep_projection {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (x : ProtectedTimedState cfg×BoardClockPath n) :
    ((protectedRestartStep cfg ε M L hn x).1.1,(protectedRestartStep cfg ε M L hn x).2)=
      augRestartStep cfg ε M hn (x.1.1,x.2) := rfl

theorem protectedRestartStep_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (rate : ℝ) (hrate : 0<rate) (s : ProtectedTimedState cfg) :
    (boardClockMeasure n rate).map (fun ω=>protectedRestartStep cfg ε M L hn (s,ω))=
      ((boardClockMeasure n rate).map (fun ω=>(protectedRestartStep cfg ε M L hn (s,ω)).1)).prod
        (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hrate
  have hremember : Measurable (protectedRemember cfg L s) :=
    (protectedRemember_measurable cfg L).comp (measurable_const.prodMk measurable_id)
  have hp : Measurable (fun r : AugTimedState cfg×BoardClockPath n=>(protectedRemember cfg L s r.1,r.2)) :=
    (hremember.comp measurable_fst).prodMk measurable_snd
  have hs : Measurable (fun ω=>augRestartStep cfg ε M hn (s.1,ω)) :=
    (augRestartStep_measurable cfg ε M hn).comp (measurable_const.prodMk measurable_id)
  have ht : Measurable (fun ω=>augTimedClockStep cfg ε M hn (s.1,ω)) :=
    (augTimedClockStep_measurable cfg ε M hn).comp (measurable_const.prodMk measurable_id)
  letI : IsProbabilityMeasure ((boardClockMeasure n rate).map (fun ω=>augTimedClockStep cfg ε M hn (s.1,ω))) :=
    Measure.isProbabilityMeasure_map ht.aemeasurable
  have hh := congrArg (fun μ : Measure (AugTimedState cfg×BoardClockPath n)=>
    μ.map (fun r=>(protectedRemember cfg L s r.1,r.2))) (augRestartStep_map cfg ε M hn rate hrate s.1)
  rw [Measure.map_map hp hs,map_pair_with_fresh_right _ _ _ hremember,Measure.map_map hremember ht] at hh
  exact hh

def protectedRecycledPair {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ProtectedTimedState cfg×BoardClockPath n :=
  RecycledBoardProcess.iterate (protectedRestartStep cfg ε M L hn) s k ω

theorem protectedRecycledPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (s : ProtectedTimedState cfg) (k : ℕ) : Measurable (protectedRecycledPair cfg ε M L hn s k) :=
  RecycledBoardProcess.iterate_measurable _ (protectedRestartStep_measurable cfg ε M L hn) s k

theorem protectedRecycledPair_projection {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    ((protectedRecycledPair cfg ε M L hn s k ω).1.1,(protectedRecycledPair cfg ε M L hn s k ω).2)=
      augRecycledPair cfg ε M hn s.1 k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change augRestartStep cfg ε M hn
      ((protectedRecycledPair cfg ε M L hn s k ω).1.1,(protectedRecycledPair cfg ε M L hn s k ω).2)=_
    rw [ih]
    rfl

theorem protectedRecycledPair_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (rate : ℝ) (hrate : 0<rate) (s : ProtectedTimedState cfg) (k : ℕ) :
    (boardClockMeasure n rate).map (protectedRecycledPair cfg ε M L hn s k)=
      (FiniteTransitionLaw.stateLaw (fun x=>(protectedRestartStep cfg ε M L hn x).1)
        (boardClockMeasure n rate) s k).prod (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hrate
  exact RecycledBoardProcess.iterate_map _ (protectedRestartStep_measurable cfg ε M L hn) _
    (protectedRestartStep_map cfg ε M L hn rate hrate) s k

theorem protectedRecycledPair_saved_inactive {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (s : ProtectedTimedState cfg) (p : Grid n) (hp : (s.1.val.1.physical.process.accounts p).status≠.active)
    (k : ℕ) (ω : BoardClockPath n) : (protectedRecycledPair cfg ε M L hn s k ω).1.2 p=s.2 p := by
  induction k with
  | zero => rfl
  | succ k ih =>
    have he := congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s k ω)
    have hs : ((protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.physical.process.accounts p).status≠.active := by
      rw [he,augRecycledPair_inactive_status cfg ε M hn s.1 p hp]
      exact hp
    change protectedLineSave L (protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.physical _
      (protectedRecycledPair cfg ε M L hn s k ω).1.2 p=_
    rw [protectedLineSave_inactive L _ _ _ p hs]
    exact ih

end NoThreeLine

#print axioms NoThreeLine.protectedRecycledPair_projection
#print axioms NoThreeLine.protectedRecycledPair_map
#print axioms NoThreeLine.protectedRecycledPair_saved_inactive
