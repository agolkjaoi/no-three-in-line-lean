import NoThreeLine.RootCutRecords
import NoThreeLine.SourceCutAfterCompletion
import NoThreeLine.CalendarSegmentPartition

/-! On the same original board, every true active-root cut record is
preserved in the terminal saved snapshot, away from the countable actual
update endpoints. Completion and endpoint avoidance are supplied a.e. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem rootObserver_recordsExtend_terminal_of_frozen {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (ω : BoardClockPath n)
    (hf : (rootObserverTerminal cfg ε M start p hn (s,ω)).2.1=true) (j : ℕ) :
    RecordsExtend (rootObserverRecycledPair cfg ε M start p hn s j ω).1.2.2.2
      (rootObserverTerminal cfg ε M start p hn (s,ω)).2.2.2 := by
  let N := augRecycledCompletionIndex cfg ε M hn s.1.1 ω
  rcases le_total j N with hj|hj
  · exact rootObserverRecycledPair_saved_record_stable cfg ε M start p hn s hs ω j N hj
  · have he := congrArg (fun v : Bool×SavedObservation n=>v.2.2)
      (rootObserverRecycledPair_frozen_stable cfg ε M start p hn s ω N hf j hj)
    rw [he]
    exact recordsExtend_refl _

theorem sourceCut_recordsExtend_terminal_of_avoid {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodRootObservation cfg p) (hi : RootActiveRecords cfg p s.val)
    (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1.1 ω))
    (hf : (rootObserverTerminal cfg ε M start p hn (s.val,ω)).2.1=true)
    (t : ℝ) (ht : t∈Ioo (0:ℝ) s.val.1.1.val.2)
    (hne : ∀j,t≠elapsedTime cfg ε M start hn (goodRootActual cfg p s) j ω)
    (ha : ((sourceCutTerminal cfg ε M start (s.val.1.1.val.2-t) (sub_nonneg.mpr ht.2.le)
      hn (goodRootActual cfg p s) ω).1.val.1.physical.process.accounts p).status=.active) :
    RecordsExtend (sourceCutTerminal cfg ε M start (s.val.1.1.val.2-t) (sub_nonneg.mpr ht.2.le)
      hn (goodRootActual cfg p s) ω).2 (rootObserverTerminal cfg ε M start p hn (s.val,ω)).2.2.2 := by
  let N := augRecycledCompletionIndex cfg ε M hn s.val.1.1 ω
  let a := fun j=>elapsedTime cfg ε M start hn (goodRootActual cfg p s) j ω
  have hzero : a 0=0 := sub_self _
  by_cases hlt : t<a N
  · obtain ⟨j,hj,hjt⟩ := CalendarIntegral.exists_open_segment a N t
      ⟨by rw [hzero]; exact ht.1,hlt⟩ (fun j _=>hne j)
    have hc := sourceCutInterior_records_eq_root_saved cfg ε M start (s.val.1.1.val.2-t)
      (sub_nonneg.mpr ht.2.le) p hn s hi j ω (by convert hjt using 1 <;> simp) ha
    rw [hc]
    exact rootObserver_recordsExtend_terminal_of_frozen cfg ε M start p hn s.val s.property.1 ω hf j
  · have hgt : a N<t := lt_of_le_of_ne (le_of_not_gt hlt) (hne N).symm
    have he := sourceCutTerminal_after_completion cfg ε M start (s.val.1.1.val.2-t)
      (sub_nonneg.mpr ht.2.le) hn (goodRootActual cfg p s) ω hd
        (by simpa only [a,N,goodRootActual,sub_sub_cancel] using hgt)
    have hr := rootObserverTerminal_projection cfg ε M start p hn (s.val,ω)
    have hactive : (((rootObserverTerminal cfg ε M start p hn (s.val,ω)).1).1.val.1.physical.process.accounts p).status=.active := by
      rw [he] at ha
      rw [hr]
      exact ha
    have hs := rootObserverRecycledPair_activeRecords cfg ε M start p hn s.val s.property.1 hi N ω
    have hs' : (rootObserverTerminal cfg ε M start p hn (s.val,ω)).2.2.2=
        (observedRecycledTerminal cfg ε M start hn (s.val.1,ω)).2 := (hs hactive).trans (congrArg Prod.snd hr)
    rw [he,hs']
    exact recordsExtend_refl _

theorem sourceCut_recordsExtend_terminal_ae {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<cfg.B)
    (s : GoodRootObservation cfg p) (hi : RootActiveRecords cfg p s.val) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀ᵐt : ℝ∂volume,
    ∀ht : t∈Ioo (0:ℝ) s.val.1.1.val.2,
    ((sourceCutTerminal cfg ε M start (s.val.1.1.val.2-t) (sub_nonneg.mpr ht.2.le)
      hn (goodRootActual cfg p s) ω).1.val.1.physical.process.accounts p).status=.active →
    RecordsExtend (sourceCutTerminal cfg ε M start (s.val.1.1.val.2-t) (sub_nonneg.mpr ht.2.le)
      hn (goodRootActual cfg p s) ω).2 (rootObserverTerminal cfg ε M start p hn (s.val,ω)).2.2.2 := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.val.1.1,
    rootObserverTerminal_frozen_ae cfg ε M start p hn hB s.val s.property.1] with ω hd hf
  filter_upwards [CalendarIntegral.ae_avoids_endpoints
    (fun j=>elapsedTime cfg ε M start hn (goodRootActual cfg p s) j ω)] with t ht
  exact fun htI ha=>sourceCut_recordsExtend_terminal_of_avoid cfg ε M start p hn s hi ω hd hf t htI ht ha

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.sourceCut_recordsExtend_terminal_of_avoid
#print axioms NoThreeLine.BirthWitness.sourceCut_recordsExtend_terminal_ae
