import NoThreeLine.RootFreezeRecycled
import NoThreeLine.ObservedTerminalLaw

/-! Select the frozen snapshot at the existing actual physical completion
index. It is measurable, eventually constant almost surely, and has the
same main-root credit as the actual terminal process on every board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine.BirthWitness

def rootObserverTerminalPair {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : RootObservation cfg × BoardClockPath n) : RootObservation cfg × BoardClockPath n :=
  rootObserverRecycledPair cfg ε M start p hn x.1 (augRecycledCompletionIndex cfg ε M hn x.1.1.1 x.2) x.2

def rootObserverTerminal {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : RootObservation cfg × BoardClockPath n) : RootObservation cfg :=
  (rootObserverTerminalPair cfg ε M start p hn x).1

theorem rootObserverTerminalPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) : Measurable (rootObserverTerminalPair cfg ε M start p hn) := by
  classical
  exact Measurable.find (rootObserverRecycledPair_joint_measurable cfg ε M start p hn)
    (fun k=>((augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).comp
      (measurable_fst.fst.fst.prodMk measurable_snd)).setOf)
    (fun x : RootObservation cfg × BoardClockPath n=>augRecycledCompletionPredicate_exists cfg ε M hn x.1.1.1 x.2)

theorem rootObserverTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) : Measurable (rootObserverTerminal cfg ε M start p hn) :=
  (rootObserverTerminalPair_measurable cfg ε M start p hn).fst

theorem rootObserverTerminalPair_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (x : RootObservation cfg × BoardClockPath n) :
    ((rootObserverTerminalPair cfg ε M start p hn x).1.1,(rootObserverTerminalPair cfg ε M start p hn x).2)=
      observedRecycledTerminalPair cfg ε M start hn (x.1.1,x.2) :=
  rootObserverRecycledPair_projection cfg ε M start p hn x.1 _ x.2

theorem rootObserverTerminal_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (x : RootObservation cfg × BoardClockPath n) :
    (rootObserverTerminal cfg ε M start p hn x).1=observedRecycledTerminal cfg ε M start hn (x.1.1,x.2) :=
  congrArg Prod.fst (rootObserverTerminalPair_projection cfg ε M start p hn x)

theorem rootObserverTerminal_invariant {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (x : RootObservation cfg × BoardClockPath n)
    (hx : RootObserverInvariant cfg p x.1) :
    RootObserverInvariant cfg p (rootObserverTerminal cfg ε M start p hn x) :=
  rootObserverRecycledPair_invariant cfg ε M start p hn x.1 hx _ x.2

theorem rootObserverTerminal_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (x : RootObservation cfg × BoardClockPath n)
    (hx : RootObserverInvariant cfg p x.1) :
    ((rootObserverTerminal cfg ε M start p hn x).2.2.1.physical.process.accounts p).credit=
      augTimedCredit cfg p (observedRecycledTerminal cfg ε M start hn (x.1.1,x.2)).1 :=
  rootObserverRecycledPair_credit cfg ε M start p hn x.1 hx _ x.2

theorem rootObserverTerminal_expected_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s) :
    (∫ω,((rootObserverTerminal cfg ε M start p hn (s,ω)).2.2.1.physical.process.accounts p).credit
      ∂boardClockMeasure n (cfg.B/n))=augTimedCredit cfg p s.1.1 := by
  have he (ω : BoardClockPath n) := rootObserverTerminal_credit cfg ε M start p hn (s,ω) hs
  simp_rw [he]
  exact observedRecycledTerminal_expected_credit cfg ε M start hn hB hm s.1 p

theorem rootObserverTerminal_frozen_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),(rootObserverTerminal cfg ε M start p hn (s,ω)).2.1=true := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.1.1] with ω hω
  apply (rootObserverTerminal_invariant cfg ε M start p hn (s,ω) hs).closed_iff.mpr
  left
  rw [rootObserverTerminal_projection]
  change (observedRecycledTerminal cfg ε M start hn (s.1,ω)).1.val.2≤0 ∨
    (observedRecycledTerminal cfg ε M start hn (s.1,ω)).1.val.1.physical.process.stopped=true
  rw [observedRecycledTerminal_base]
  exact hω.imp (fun h=>h.le) id

theorem rootObserverTerminal_saved_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀ᶠk in atTop,
      (rootObserverRecycledPair cfg ε M start p hn s k ω).1.2=
        (rootObserverTerminal cfg ε M start p hn (s,ω)).2 := by
  filter_upwards [rootObserverTerminal_frozen_ae cfg ε M start p hn hB s hs] with ω hω
  filter_upwards [eventually_ge_atTop (augRecycledCompletionIndex cfg ε M hn s.1.1 ω)] with k hk
  exact rootObserverRecycledPair_frozen_stable cfg ε M start p hn s ω _ hω k hk

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rootObserverTerminalPair_measurable
#print axioms NoThreeLine.BirthWitness.rootObserverTerminal_projection
#print axioms NoThreeLine.BirthWitness.rootObserverTerminal_expected_credit
#print axioms NoThreeLine.BirthWitness.rootObserverTerminal_saved_stable_ae
