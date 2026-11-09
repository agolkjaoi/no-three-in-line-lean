import NoThreeLine.PhaseLineSectionPermanent
import NoThreeLine.LineSectionTerminalCapture

/-! A strict interior contact of the actual marked observer is retained by
one terminal snapshot. Its measurable event uses countable update indices;
no union factor in the number of updates is introduced. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set Filter

namespace NoThreeLine.BirthWitness
open AuxiliaryODE
attribute [local instance] Classical.propDecidable

def markedSectionContactAt {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (k : ℕ) (x : GoodMarkedLineSection cfg p × BoardClockPath n) : Prop :=
  let v := RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) x.1 k x.2
  v.1.val.1.2.1 = false ∧
    selectedLineSectionTime cfg L p E A (augTimedInput cfg v.1.val.1.1.1).1.1 <
      augAdvance cfg ε M (augTimedInput cfg v.1.val.1.1.1,(WinnerMarkLaw.firstMarkedRace hn v.2).1.1)

theorem markedSectionContactAt_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (k : ℕ) :
    Measurable (markedSectionContactAt cfg ε M start L p E A hn k) := by
  have hv := RecycledBoardProcess.iterate_joint_measurable _
    (goodMarkedRestart_measurable cfg ε M start L p E A hn) k
  have hs := measurable_subtype_coe.comp hv.fst
  exact (hs.fst.snd.fst.eq_const false).and (Measurable.lt
    ((selectedLineSectionTime_measurable cfg L p E A).comp
      ((augTimedInput_measurable cfg).comp hs.fst.fst.fst).fst.fst)
    ((augAdvance_measurable cfg ε M).comp
      (((augTimedInput_measurable cfg).comp hs.fst.fst.fst).prodMk
        (((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hv.snd).fst.fst))))

theorem markedSectionContactAt_post {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (k : ℕ) (ω : BoardClockPath n)
    (h : markedSectionContactAt cfg ε M start L p E A hn k (s,ω)) :
    (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s (k+1) ω).1.val.2 = true ∧
      A ≤ actualLineSectionMass L p E
        (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s (k+1) ω).1.val.1.2.2 := by
  let v := RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω
  let z := WinnerMarkLaw.firstMarkedRace hn v.2
  change v.1.val.1.2.1 = false ∧
    selectedLineSectionTime cfg L p E A (augTimedInput cfg v.1.val.1.1.1).1.1 <
      augAdvance cfg ε M (augTimedInput cfg v.1.val.1.1.1,z.1.1) at h
  have hp : lineSectionPermanentContact cfg ε M L p E A (v.1.val.1.1,z) :=
    ⟨h.2.trans_le ((augAdvance_mem cfg ε M _ v.1.val.1.1.1.property.1.1 z.1.1).2.trans
      ((augGuardTime_le_remaining cfg ε M _ v.1.val.1.1.1.property.2.1).trans v.1.val.1.1.1.property.2.2)),h.2.le⟩
  have hh := lineSectionObserverStep_interior_contact cfg ε M start L p E A v.1.val.1 z v.1.property.1.core h.1 h.2
  constructor
  · change (goodMarkedStep cfg ε M start L p E A (v.1,z)).val.2 = true
    simp only [goodMarkedStep,markedLineSectionStep,h.1,hp,true_and,or_true,if_true]
  · exact hh.2.2

def markedSectionContactCaptured {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodMarkedLineSection cfg p × BoardClockPath n) : Prop :=
  (∃ k, markedSectionContactAt cfg ε M start L p E A hn k x) →
    (markedSectionTerminalPair cfg ε M start L p E A hn x).1.val.2 = true ∧
      A ≤ actualLineSectionMass L p E (markedSectionTerminalPair cfg ε M start L p E A hn x).1.val.1.2.2

theorem markedSectionContactCaptured_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) :
    Measurable (markedSectionContactCaptured cfg ε M start L p E A hn) := by
  have ht := (markedSectionTerminalPair_measurable cfg ε M start L p E A hn).fst.subtype_val
  have hc : Measurable (fun x => ∃ k, markedSectionContactAt cfg ε M start L p E A hn k x) :=
    Measurable.exists (markedSectionContactAt_measurable cfg ε M start L p E A hn)
  exact hc.imp ((ht.snd.eq_const true).and
    (measurable_const.le' ((actualLineSectionMass_measurable L p E).comp ht.fst.snd.snd)))

theorem markedSectionContactCaptured_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : GoodMarkedLineSection cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), markedSectionContactCaptured cfg ε M start L p E A hn (s,ω) := by
  filter_upwards [markedSectionTerminalPair_stable_ae cfg ε M start L p E A hn hB s] with ω hω
  rintro ⟨k,hk⟩
  have hp := markedSectionContactAt_post cfg ε M start L p E A hn s k ω hk
  obtain ⟨j,hj,hj'⟩ := (hω.and (eventually_ge_atTop (k+1))).exists
  have hs := goodMarkedIterate_permanent cfg ε M start L p E A hn s ω (k+1) hp.1 j hj'
  rw [hj] at hs
  exact ⟨hs.1,hs.2.symm ▸ hp.2⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.markedSectionContactCaptured_measurable
#print axioms NoThreeLine.BirthWitness.markedSectionContactCaptured_ae
