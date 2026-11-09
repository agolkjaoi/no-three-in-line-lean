import NoThreeLine.MarkedSectionContactCapture
import NoThreeLine.CandidateGuardNoTie

/-! Strict interior contacts along random incoming original phases are
captured by the one full-phase saved snapshot. Actual residual product laws
and actual completion supply the almost-everywhere qualification. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE
attribute [local instance] Classical.propDecidable

theorem goodPhaseSectionBoundary_permanent {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (s : GoodMarkedLineSection cfg p) (hs : s.val.2 = true) :
    (goodPhaseSectionBoundary cfg p deadline t s).val.2 = (true,s.val.1.2.2) := by
  change (phaseLineSectionDeadline p deadline t (phaseLineSectionEnd cfg p s.val)).2 = _
  have he : (phaseLineSectionEnd cfg p s.val).2 = (true,s.val.1.2.2) := by
    simp only [phaseLineSectionEnd,hs,true_or,if_true]
  simp only [phaseLineSectionDeadline,he,if_true]

def scheduledSectionContactAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p)
    (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  markedSectionContactAt (cs N).config ε M (phaseEndpoint cs start N) L p E A hn k
    (goodPhaseSectionStart (cs N).config ε M p (phaseSectionRecycledState cs ε M deadline start L p E A hn s N ω),
      (phaseSectionRecycledPair cs ε M deadline start L p E A hn s N ω).2)

theorem scheduledSectionContactAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p) (N k : ℕ) :
    Measurable (scheduledSectionContactAt cs ε M deadline start L p E A hn s N k) := by
  have hv := phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn s N
  exact (markedSectionContactAt_measurable (cs N).config ε M (phaseEndpoint cs start N) L p E A hn k).comp
    (((goodPhaseSectionStart_measurable (cs N).config ε M p).comp hv.fst.snd).prodMk hv.snd)

theorem phaseSectionRecycledPair_residual_product {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 0 < B) (s : GoodPhaseLineSection n B p) (N : ℕ) :
    (boardClockMeasure n (B/n)).map (phaseSectionRecycledPair cs ε M deadline start L p E A hn s N) =
      ((boardClockMeasure n (B/n)).map (fun ω =>
        (phaseSectionRecycledPair cs ε M deadline start L p E A hn s N ω).1)).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  unfold phaseSectionRecycledPair
  rw [RecycledBoardProcess.iterate_state_map _
    (phaseSectionRestartStep_measurable cs ε M deadline start L p E A hn) _
    (phaseSectionRestartStep_residual_product cs ε M deadline start L p E A hn hB) (0,s) N]
  exact RecycledBoardProcess.iterate_map _
    (phaseSectionRestartStep_measurable cs ε M deadline start L p E A hn) _
    (phaseSectionRestartStep_residual_product cs ε M deadline start L p E A hn hB) (0,s) N

theorem scheduledSectionContact_phase_capture_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 0 < B) (s : GoodPhaseLineSection n B p) (N : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      (∃ k, scheduledSectionContactAt cs ε M deadline start L p E A hn s N k ω) →
        (phaseSectionRecycledState cs ε M deadline start L p E A hn s (N+1) ω).val.2.1 = true ∧
        A ≤ actualLineSectionMass L p E (phaseSectionRecycledState cs ε M deadline start L p E A hn s (N+1) ω).val.2.2 := by
  let ν := boardClockMeasure n (B/n)
  let v := phaseSectionRecycledPair cs ε M deadline start L p E A hn s N
  have hv : Measurable v := phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn s N
  let μ := ν.map (fun ω => (v ω).1)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := Measure.isProbabilityMeasure_map hv.fst.aemeasurable
  let P : (ℕ × GoodPhaseLineSection n B p) × BoardClockPath n → Prop := fun x =>
    markedSectionContactCaptured (cs N).config ε M (phaseEndpoint cs start N) L p E A hn
      (goodPhaseSectionStart (cs N).config ε M p x.1.2,x.2)
  have hP : Measurable P := (markedSectionContactCaptured_measurable (cs N).config ε M
    (phaseEndpoint cs start N) L p E A hn).comp
      (((goodPhaseSectionStart_measurable (cs N).config ε M p).comp measurable_fst.snd).prodMk measurable_snd)
  have hh := residual_sections_ae ν μ ν v hv
    (phaseSectionRecycledPair_residual_product cs ε M deadline start L p E A hn hB s N) P hP
    (fun x => markedSectionContactCaptured_ae (cs N).config ε M (phaseEndpoint cs start N) L p E A hn hB
      (goodPhaseSectionStart (cs N).config ε M p x.2))
  filter_upwards [hh] with ω hω
  intro hc
  have ht := hω hc
  rw [phaseSectionRecycledState_succ]
  have he := goodPhaseSectionBoundary_permanent (cs N).config p deadline (phaseEndpoint cs start (N+1))
    (markedSectionTerminalPair (cs N).config ε M (phaseEndpoint cs start N) L p E A hn
      (goodPhaseSectionStart (cs N).config ε M p (v ω).1.2,(v ω).2)).1 ht.1
  change (goodPhaseSectionBoundary _ _ _ _ _).val.2.1 = true ∧ A ≤ actualLineSectionMass L p E (goodPhaseSectionBoundary _ _ _ _ _).val.2.2
  dsimp only [v,phaseSectionRecycledState] at he ht ⊢
  rw [he]
  exact ⟨rfl,ht.2⟩

theorem scheduledSectionContact_full_capture_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 0 < B) (s : GoodPhaseLineSection n B p) (J : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      (∃ N < J, ∃ k, scheduledSectionContactAt cs ε M deadline start L p E A hn s N k ω) →
        A ≤ actualLineSectionMass L p E (phaseSectionRecycledState cs ε M deadline start L p E A hn s J ω).val.2.2 := by
  filter_upwards [ae_all_iff.mpr (scheduledSectionContact_phase_capture_ae cs ε M deadline start L p E A hn hB s)] with ω hω
  rintro ⟨N,hN,k,hk⟩
  have hp := hω N ⟨k,hk⟩
  have he := phaseSectionRecycledState_permanent cs ε M deadline start L p E A hn s ω (N+1) hp.1 J (Nat.succ_le_of_lt hN)
  rw [he.2]
  exact hp.2

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledSectionContactAt_measurable
#print axioms NoThreeLine.BirthWitness.scheduledSectionContact_full_capture_ae
