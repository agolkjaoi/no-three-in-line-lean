import NoThreeLine.RootSavedObservation
import NoThreeLine.InactiveSavedCredit

/-! A root observer carried alongside the unchanged physical step. The
whole snapshot freezes together on the first root closure, after birth
geometry and before resolution. Later physical steps still run normally. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator

abbrev RootObservation {n : ℕ} (cfg : FlowConfig n) :=
  TimedObservation cfg × (Bool × SavedObservation n)

def rootObserverInitial {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : TimedObservation cfg) : RootObservation cfg :=
  (s,(if rootClosed cfg p s then true else false),savedObservation cfg s)

def rootObserverStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (x : RootObservation cfg × CandidateData n) : RootObservation cfg :=
  let next := observedStep cfg ε M start (x.1.1,x.2)
  if x.1.2.1=true then (next,x.1.2)
  else if rootClosed cfg p next then (next,true,rawStepSaved cfg ε M start (x.1.1,x.2))
  else (next,false,savedObservation cfg next)

structure RootObserverInvariant {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : RootObservation cfg) : Prop where
  records : RecordsConsistent cfg s.1
  saved : SavedValid cfg.B s.2.2
  closed_iff : s.2.1=true ↔ rootClosed cfg p s.1
  live : s.2.1=false → s.2.2=savedObservation cfg s.1
  credit : (s.2.2.1.physical.process.accounts p).credit=
    (s.1.1.val.1.physical.process.accounts p).credit

theorem rootObserverInitial_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (rootObserverInitial cfg p) :=
  measurable_id.prodMk ((Measurable.ite (rootClosed_measurable cfg p).setOf
    measurable_const measurable_const).prodMk (savedObservation_measurable cfg))

theorem rootObserverStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) :
    Measurable (rootObserverStep cfg ε M start p) := by
  have hi : Measurable (fun x : RootObservation cfg × CandidateData n=>(x.1.1,x.2)) :=
    measurable_fst.fst.prodMk measurable_snd
  have hn := (observedStep_measurable cfg ε M start).comp hi
  apply Measurable.ite (measurable_fst.snd.fst.eq measurable_const).setOf
  · exact hn.prodMk measurable_fst.snd
  · apply Measurable.ite ((rootClosed_measurable cfg p).comp hn).setOf
    · exact hn.prodMk (measurable_const.prodMk ((rawStepSaved_measurable cfg ε M start).comp hi))
    · exact hn.prodMk (measurable_const.prodMk ((savedObservation_measurable cfg).comp hn))

theorem rootObserverStep_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (x : RootObservation cfg × CandidateData n) :
    (rootObserverStep cfg ε M start p x).1=observedStep cfg ε M start (x.1.1,x.2) := by
  dsimp only [rootObserverStep]
  split_ifs <;> rfl

theorem rootObserverInitial_invariant {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : TimedObservation cfg) (hs : RecordsConsistent cfg s) :
    RootObserverInvariant cfg p (rootObserverInitial cfg p s) := by
  refine ⟨hs,savedObservation_valid cfg s hs,?_,fun _=>rfl,rfl⟩
  change (if rootClosed cfg p s then true else false)=true ↔ rootClosed cfg p s
  by_cases hc : rootClosed cfg p s <;> simp [hc]

theorem rootObserverStep_preserves_frozen {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (x : RootObservation cfg × CandidateData n) (hx : x.1.2.1=true) :
    (rootObserverStep cfg ε M start p x).2=x.1.2 := by
  simp only [rootObserverStep,if_pos hx]

theorem rootObserverStep_first_closure {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (x : RootObservation cfg × CandidateData n) (hx : x.1.2.1=false)
    (hc : rootClosed cfg p (observedStep cfg ε M start (x.1.1,x.2))) :
    (rootObserverStep cfg ε M start p x).2=(true,rawStepSaved cfg ε M start (x.1.1,x.2)) := by
  simp only [rootObserverStep,hx,Bool.false_eq_true,if_false,if_pos hc]

theorem rootObserverStep_live {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (x : RootObservation cfg × CandidateData n) (hx : x.1.2.1=false)
    (hc : ¬rootClosed cfg p (observedStep cfg ε M start (x.1.1,x.2))) :
    (rootObserverStep cfg ε M start p x).2=
      (false,savedObservation cfg (observedStep cfg ε M start (x.1.1,x.2))) := by
  simp only [rootObserverStep,hx,Bool.false_eq_true,if_false,if_neg hc]

theorem rootObserverStep_invariant {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (s : RootObservation cfg) (z : CandidateData n)
    (hs : RootObserverInvariant cfg p s) :
    RootObserverInvariant cfg p (rootObserverStep cfg ε M start p (s,z)) := by
  have hr := observedStep_consistent cfg ε M start (s.1,z) hs.records
  by_cases hf : s.2.1=true
  · simp only [rootObserverStep,if_pos hf]
    have hc := hs.closed_iff.mp hf
    refine ⟨hr,hs.saved,?_,?_,?_⟩
    · exact ⟨fun _=>observedStep_rootClosed cfg ε M start (s.1,z) p hc,fun _=>hf⟩
    · intro h
      exact False.elim (Bool.noConfusion (hf.symm.trans h))
    · exact hs.credit.trans (observedStep_closed_credit cfg ε M start (s.1,z) p hc).symm
  · by_cases hc : rootClosed cfg p (observedStep cfg ε M start (s.1,z))
    · simp only [rootObserverStep,if_neg hf,if_pos hc]
      refine ⟨hr,rawStepSaved_valid cfg ε M start (s.1,z) hs.records,?_,?_,?_⟩
      · exact ⟨fun _=>hc,fun _=>rfl⟩
      · intro h
        exact False.elim (Bool.noConfusion h)
      · exact rawStepSaved_credit cfg ε M start (s.1,z) p
    · simp only [rootObserverStep,if_neg hf,if_neg hc]
      refine ⟨hr,savedObservation_valid cfg _ hr,?_,fun _=>rfl,rfl⟩
      constructor
      · intro h
        exact False.elim (Bool.noConfusion h)
      · intro h
        exact False.elim (hc h)

theorem rootObserverStep_mixed_le_raw {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (p : Grid n) (s : RootObservation cfg) (z : CandidateData n)
    (C D L : Finset (Grid n)) (hs : RootObserverInvariant cfg p s) (hf : s.2.1=false) :
    mixed cfg.directions C D L (savedWitness e (rootObserverStep cfg ε M start p (s,z)).2.2)≤
      mixed cfg.directions C D L (savedWitness e (rawStepSaved cfg ε M start (s.1,z))) := by
  by_cases hc : rootClosed cfg p (observedStep cfg ε M start (s.1,z))
  · rw [rootObserverStep_first_closure cfg ε M start p (s,z) hf hc]
  · rw [rootObserverStep_live cfg ε M start p (s,z) hf hc,savedWitness_observation]
    exact observedStep_mixed_le_rawStepSaved cfg ε M start e (s.1,z) C D L hs.records

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rootObserverStep_measurable
#print axioms NoThreeLine.BirthWitness.rootObserverStep_projection
#print axioms NoThreeLine.BirthWitness.rootObserverStep_invariant
#print axioms NoThreeLine.BirthWitness.rootObserverStep_mixed_le_raw
