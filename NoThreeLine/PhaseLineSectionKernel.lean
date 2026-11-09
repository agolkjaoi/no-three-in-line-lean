import NoThreeLine.MarkedLineSectionTerminal
import NoThreeLine.RootPhaseInvariantKernel

/-! The actual permanently marked contact observer across original phase
boundaries. Empty-line credit, reopen domination and the unmarked credit
identity are supplied by preserved invariants; they are not kernel axioms. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator PrimitiveLines

abbrev GoodPhaseLineSection (n : ℕ) (B : ℝ) (p : Grid n) :=
  {s : PhaseLineSectionObservation n B //
    PhaseLineSectionInvariant p s ∧ EmptyLineCredit s.1.1.val.physical}

def goodPhaseSectionActual {n : ℕ} {B : ℝ} (p : Grid n)
    (s : GoodPhaseLineSection n B p) : GoodPhaseObservation n B :=
  ⟨s.val.1,s.property.1.records,s.property.2⟩

theorem goodPhaseSectionActual_measurable {n : ℕ} {B : ℝ} (p : Grid n) :
    Measurable (goodPhaseSectionActual (B:=B) p) := measurable_subtype_coe.fst.subtype_mk

def goodPhaseSectionStart {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : GoodPhaseLineSection n cfg.B p) : GoodMarkedLineSection cfg p :=
  ⟨phaseLineSectionStart cfg ε M p s.val,
    phaseLineSectionStart_invariant cfg ε M p s.val s.property.1,
    by rw [phaseLineSectionStart_projection]; exact s.property.2,
    phaseLineSectionStart_reopenBound cfg ε M p s.val,
    phaseLineSectionStart_credit cfg ε M p s.val⟩

theorem goodPhaseSectionStart_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (goodPhaseSectionStart cfg ε M p) :=
  ((phaseLineSectionStart_measurable cfg ε M p).comp measurable_subtype_coe).subtype_mk

def goodPhaseSectionBoundary {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (s : GoodMarkedLineSection cfg p) : GoodPhaseLineSection n cfg.B p :=
  ⟨phaseLineSectionBoundary cfg p deadline t s.val,
    phaseLineSectionBoundary_invariant cfg p deadline t s.val s.property.1,
    by rw [phaseLineSectionBoundary_projection]
       exact emptyLineCredit_augValidDeadlineRetirement deadline t
         (augTimedStateProjection cfg s.val.1.1.1) s.property.2.1⟩

theorem goodPhaseSectionBoundary_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) : Measurable (goodPhaseSectionBoundary cfg p deadline t) :=
  ((phaseLineSectionBoundary_measurable cfg p deadline t).comp measurable_subtype_coe).subtype_mk

def phaseSectionScheduledPair {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (j : ℕ)
    (x : GoodPhaseLineSection n B p × BoardClockPath n) : GoodPhaseLineSection n B p × BoardClockPath n :=
  let r := markedSectionTerminalPair (cs j).config ε M (phaseEndpoint cs start j) L p E A hn
    (goodPhaseSectionStart (cs j).config ε M p x.1,x.2)
  (goodPhaseSectionBoundary (cs j).config p deadline (phaseEndpoint cs start (j+1)) r.1,r.2)

theorem phaseSectionScheduledPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (j : ℕ) :
    Measurable (phaseSectionScheduledPair cs ε M deadline start L p E A hn j) := by
  have hr := (markedSectionTerminalPair_measurable (cs j).config ε M (phaseEndpoint cs start j) L p E A hn).comp
    (((goodPhaseSectionStart_measurable (cs j).config ε M p).comp measurable_fst).prodMk measurable_snd)
  exact ((goodPhaseSectionBoundary_measurable (cs j).config p deadline _).comp hr.fst).prodMk hr.snd

theorem phaseSectionScheduledPair_projection {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (j : ℕ)
    (x : GoodPhaseLineSection n B p × BoardClockPath n) :
    ((phaseSectionScheduledPair cs ε M deadline start L p E A hn j x).1.val.1,
      (phaseSectionScheduledPair cs ε M deadline start L p E A hn j x).2) =
      observedScheduledPair cs ε M deadline start hn j (x.1.val.1,x.2) := by
  unfold phaseSectionScheduledPair goodPhaseSectionBoundary
  rw [phaseLineSectionBoundary_projection]
  have h := congrArg (fun r : TimedObservation (cs j).config × BoardClockPath n =>
    (observedDeadline deadline (phaseEndpoint cs start (j+1)) (observedTimedProjection (cs j).config r.1),r.2))
      (markedSectionTerminalPair_projection (cs j).config ε M (phaseEndpoint cs start j) L p E A hn
        (goodPhaseSectionStart (cs j).config ε M p x.1,x.2))
  simpa only [goodPhaseSectionStart,phaseLineSectionStart_projection,
    observedScheduledPair,observedPhaseRecycledPair] using h

theorem phaseSectionScheduledPair_residual_product {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 0 < B) (j : ℕ)
    (s : GoodPhaseLineSection n B p) :
    (boardClockMeasure n (B/n)).map (fun ω => phaseSectionScheduledPair cs ε M deadline start L p E A hn j (s,ω)) =
      ((boardClockMeasure n (B/n)).map (fun ω =>
        (phaseSectionScheduledPair cs ε M deadline start L p E A hn j (s,ω)).1)).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let a := goodPhaseSectionStart (cs j).config ε M p s
  let d := goodPhaseSectionBoundary (cs j).config p deadline (phaseEndpoint cs start (j+1))
  have hd : Measurable d := goodPhaseSectionBoundary_measurable (cs j).config p deadline _
  have ht : Measurable (fun ω : BoardClockPath n => markedSectionTerminalPair (cs j).config ε M
      (phaseEndpoint cs start j) L p E A hn (a,ω)) :=
    (markedSectionTerminalPair_measurable (cs j).config ε M _ L p E A hn).comp (measurable_const.prodMk measurable_id)
  have hp : Measurable (fun r : GoodMarkedLineSection (cs j).config p × BoardClockPath n => (d r.1,r.2)) :=
    (hd.comp measurable_fst).prodMk measurable_snd
  have h := congrArg (fun μ : Measure (GoodMarkedLineSection (cs j).config p × BoardClockPath n) =>
    μ.map (fun r => (d r.1,r.2)))
      (markedSectionTerminal_residual_product (cs j).config ε M (phaseEndpoint cs start j) L p E A hn hB a)
  rw [Measure.map_map hp ht,map_pair_with_fresh_right _ _ d hd,Measure.map_map hd ht.fst] at h
  exact h

def phaseSectionMixed {n : ℕ} {B : ℝ} (p : Grid n) (Γ : Finset ZPoint)
    (C labels : Finset (Grid n)) (s : GoodPhaseLineSection n B p) : ℝ :=
  correctedPhi Γ C labels s.val.2.2

theorem phaseSectionMixed_measurable {n : ℕ} {B : ℝ} (p : Grid n) (Γ : Finset ZPoint)
    (C labels : Finset (Grid n)) : Measurable (phaseSectionMixed (B:=B) p Γ C labels) :=
  (correctedPhi_measurable Γ C labels).comp measurable_subtype_coe.snd.snd

theorem phaseSectionScheduledPair_mean_le {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 0 < B) (j : ℕ)
    (hK : (cs j).config.K < 2) (s : GoodPhaseLineSection n B p)
    (C labels : Finset (Grid n)) (hCL : C ⊆ labels) :
    (∫ ω, phaseSectionMixed p (cs j).config.directions C labels
      (phaseSectionScheduledPair cs ε M deadline start L p E A hn j (s,ω)).1
      ∂boardClockMeasure n (B/n)) ≤ phaseSectionMixed p (cs j).config.directions C labels s := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let a := goodPhaseSectionStart (cs j).config ε M p s
  let term := fun ω => markedSectionTerminalPair (cs j).config ε M (phaseEndpoint cs start j) L p E A hn (a,ω)
  have ht : Measurable term := (markedSectionTerminalPair_measurable (cs j).config ε M _ L p E A hn).comp
    (measurable_const.prodMk measurable_id)
  have hle := markedSectionTerminal_mixed_mean_le (cs j).config ε M (phaseEndpoint cs start j)
    L p E A hn hB (cs j).mask_le_one hK a C labels hCL
  have hstart : correctedPhi (cs j).config.directions C labels a.val.1.2.2 =
      phaseSectionMixed p (cs j).config.directions C labels s := by
    change correctedPhi _ _ _ (phaseLineSectionStart (cs j).config ε M p s.val).1.2.2 = _
    rw [phaseLineSectionStart_saved _ _ _ _ _ s.property.1]
    rfl
  rw [hstart] at hle
  apply le_trans _ hle
  apply integral_mono
  · exact correctedPhi_integrable _ _
      (((phaseSectionScheduledPair_measurable cs ε M deadline start L p E A hn j).comp
        (measurable_const.prodMk measurable_id)).fst.subtype_val.snd.snd)
      _ C labels B (fun ω => (phaseSectionScheduledPair cs ε M deadline start L p E A hn j (s,ω)).1.property.1.saved)
  · exact correctedPhi_integrable _ _ ht.fst.subtype_val.fst.snd.snd _ C labels B
      (fun ω => (term ω).1.property.1.core.saved)
  · intro ω
    exact phaseLineSectionBoundary_mixed_le (cs j).config p deadline (phaseEndpoint cs start (j+1))
      (term ω).1.val (term ω).1.property.1 (term ω).1.property.2.2.1 C labels

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseSectionScheduledPair_projection
#print axioms NoThreeLine.BirthWitness.phaseSectionScheduledPair_residual_product
#print axioms NoThreeLine.BirthWitness.phaseSectionScheduledPair_mean_le
