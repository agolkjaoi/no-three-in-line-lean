import NoThreeLine.RootPhaseActiveRecords
import NoThreeLine.SourceCutInterval

/-! A cut strictly inside an actual update interval has the unchanged
prefix records. If the physical root is active, those are the root's
saved records at that prefix, so every true record persists in later saved
snapshots. No future state or independent replacement clock is assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open Set
namespace NoThreeLine.BirthWitness

theorem sourceCutInterior_records_eq_root_saved {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (p : Grid n) (hn : 0<n)
    (s : GoodRootObservation cfg p) (hi : RootActiveRecords cfg p s.val)
    (j : ℕ) (ω : BoardClockPath n)
    (ht : s.val.1.1.val.2-δ∈Ioo
      (elapsedTime cfg ε M start hn (goodRootActual cfg p s) j ω)
      (elapsedTime cfg ε M start hn (goodRootActual cfg p s) (j+1) ω))
    (ha : ((sourceCutTerminal cfg ε M start δ hδ hn (goodRootActual cfg p s) ω).1.val.1.physical.process.accounts p).status=.active) :
    (sourceCutTerminal cfg ε M start δ hδ hn (goodRootActual cfg p s) ω).2=
      (rootObserverRecycledPair cfg ε M start p hn s.val j ω).1.2.2.2 := by
  let x := RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn)
    (goodRootActual cfg p s) j ω
  have hc := sourceCutTerminal_interior cfg ε M start δ hδ hn (goodRootActual cfg p s) j ω ht
  have hp := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M start hn
    (goodRootActual cfg p s) j ω)
  have hr := congrArg Prod.fst (rootObserverRecycledPair_projection cfg ε M start p hn s.val j ω)
  have he : (rootObserverRecycledPair cfg ε M start p hn s.val j ω).1.1=x.1.val := hr.trans hp.symm
  have hstatus : ((sourceCutTerminal cfg ε M start δ hδ hn (goodRootActual cfg p s) ω).1.val.1.physical.process.accounts p).status=
      (x.1.val.1.val.1.physical.process.accounts p).status := by
    have hh := congrArg (fun y : AugmentedState n×ℝ=>(y.1.physical.process.accounts p).status) hc.1
    simpa only [EtaMixedGenerator.selectedAugmentedCurve,selectedTrajectory,
      ExtendedState.withCoordinates,ProcessState.withWeights,augTimedInput] using hh
  have hx : (x.1.val.1.val.1.physical.process.accounts p).status=.active := hstatus.symm.trans ha
  have hsave := rootObserverRecycledPair_activeRecords cfg ε M start p hn s.val s.property.1 hi j ω
  have hroot : (((rootObserverRecycledPair cfg ε M start p hn s.val j ω).1.1).1.val.1.physical.process.accounts p).status=.active := by
    rw [he]
    exact hx
  exact hc.2.trans ((congrArg Prod.snd he).symm.trans (hsave hroot).symm)

theorem sourceCutInterior_recordsExtend_later_saved {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (p : Grid n) (hn : 0<n)
    (s : GoodRootObservation cfg p) (hi : RootActiveRecords cfg p s.val)
    (j k : ℕ) (hjk : j≤k) (ω : BoardClockPath n)
    (ht : s.val.1.1.val.2-δ∈Ioo
      (elapsedTime cfg ε M start hn (goodRootActual cfg p s) j ω)
      (elapsedTime cfg ε M start hn (goodRootActual cfg p s) (j+1) ω))
    (ha : ((sourceCutTerminal cfg ε M start δ hδ hn (goodRootActual cfg p s) ω).1.val.1.physical.process.accounts p).status=.active) :
    RecordsExtend (sourceCutTerminal cfg ε M start δ hδ hn (goodRootActual cfg p s) ω).2
      (rootObserverRecycledPair cfg ε M start p hn s.val k ω).1.2.2.2 := by
  rw [sourceCutInterior_records_eq_root_saved cfg ε M start δ hδ p hn s hi j ω ht ha]
  exact rootObserverRecycledPair_saved_record_stable cfg ε M start p hn s.val s.property.1 ω j k hjk

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.sourceCutInterior_records_eq_root_saved
#print axioms NoThreeLine.BirthWitness.sourceCutInterior_recordsExtend_later_saved
