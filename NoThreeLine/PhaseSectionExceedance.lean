import NoThreeLine.MarkedSectionExceedance
import NoThreeLine.PhaseSectionMassSupport
import NoThreeLine.PhaseSectionContactTail

/-! Original random incoming phases transport the measurable cover of
positive executed-time section exceedances to a single full-J snapshot. -/
set_option autoImplicit false
set_option maxHeartbeats 1900000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def scheduledSectionExceededAt {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p)
    (N k : ℕ) (ω : BoardClockPath n) : Prop :=
  markedSectionExceededAt (cs N).config ε M (phaseEndpoint cs start N) L p E A hn k
    (goodPhaseSectionStart (cs N).config ε M p (phaseSectionRecycledState cs ε M deadline start L p E A hn s N ω),
      (phaseSectionRecycledPair cs ε M deadline start L p E A hn s N ω).2)

theorem scheduledSectionExceededAt_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p) (N k : ℕ) :
    Measurable (scheduledSectionExceededAt cs ε M deadline start L p E A hn s N k) := by
  have hv := phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn s N
  exact (markedSectionExceededAt_measurable (cs N).config ε M (phaseEndpoint cs start N) L p E A hn k).comp
    (((goodPhaseSectionStart_measurable (cs N).config ε M p).comp hv.fst.snd).prodMk hv.snd)

def scheduledSectionExceededBefore {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p) (J : ℕ) :
    Set (BoardClockPath n) := {ω | ∃ N < J, ∃ k, scheduledSectionExceededAt cs ε M deadline start L p E A hn s N k ω}

theorem scheduledSectionExceededBefore_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodPhaseLineSection n B p) (J : ℕ) :
    MeasurableSet (scheduledSectionExceededBefore cs ε M deadline start L p E A hn s J) := by
  apply Measurable.setOf
  exact Measurable.exists (fun N => measurable_const.and
    (Measurable.exists (fun k => scheduledSectionExceededAt_measurable cs ε M deadline start L p E A hn s N k)))

theorem scheduledSectionExceeded_phase_capture_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 0 < B) (s : GoodPhaseLineSection n B p)
    (hs : PhaseSectionMassSupport L p E A s.val) (N : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      (∃ k, scheduledSectionExceededAt cs ε M deadline start L p E A hn s N k ω) →
        (phaseSectionRecycledState cs ε M deadline start L p E A hn s (N+1) ω).val.2.1 = true ∧
        A ≤ actualLineSectionMass L p E (phaseSectionRecycledState cs ε M deadline start L p E A hn s (N+1) ω).val.2.2 := by
  let ν := boardClockMeasure n (B/n)
  let v := phaseSectionRecycledPair cs ε M deadline start L p E A hn s N
  have hv := phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn s N
  let μ := ν.map (fun ω => (v ω).1)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := Measure.isProbabilityMeasure_map hv.fst.aemeasurable
  let P : (ℕ × GoodPhaseLineSection n B p) × BoardClockPath n → Prop := fun x =>
    markedSectionExceededCaptured (cs N).config ε M (phaseEndpoint cs start N) L p E A hn
      (goodPhaseSectionStart (cs N).config ε M p x.1.2,x.2)
  have hP : Measurable P := (markedSectionExceededCaptured_measurable (cs N).config ε M
    (phaseEndpoint cs start N) L p E A hn).comp
      (((goodPhaseSectionStart_measurable (cs N).config ε M p).comp measurable_fst.snd).prodMk measurable_snd)
  have hh := residual_sections_ae ν μ ν v hv
    (phaseSectionRecycledPair_residual_product cs ε M deadline start L p E A hn hB s N) P hP
    (fun x => markedSectionExceededCaptured_ae (cs N).config ε M (phaseEndpoint cs start N) L p E A hn hB
      (goodPhaseSectionStart (cs N).config ε M p x.2))
  filter_upwards [hh,phaseSectionRecycledState_massSupport_ae cs ε M deadline start L p E A hn hB s hs N] with ω hω hm
  intro hc
  have ht := hω (phaseLineSectionStart_massSupport (cs N).config ε M L p E A _ hm) hc
  rw [phaseSectionRecycledState_succ]
  have he := goodPhaseSectionBoundary_permanent (cs N).config p deadline (phaseEndpoint cs start (N+1))
    (markedSectionTerminalPair (cs N).config ε M (phaseEndpoint cs start N) L p E A hn
      (goodPhaseSectionStart (cs N).config ε M p (v ω).1.2,(v ω).2)).1 ht.1
  change (goodPhaseSectionBoundary _ _ _ _ _).val.2.1 = true ∧ A ≤ actualLineSectionMass L p E (goodPhaseSectionBoundary _ _ _ _ _).val.2.2
  dsimp only [v,phaseSectionRecycledState] at he ht ⊢
  rw [he]
  exact ⟨rfl,ht.2⟩

theorem scheduledSectionExceeded_full_capture_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 0 < B) (s : GoodPhaseLineSection n B p)
    (hs : PhaseSectionMassSupport L p E A s.val) (J : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      ω ∈ scheduledSectionExceededBefore cs ε M deadline start L p E A hn s J →
        A ≤ actualLineSectionMass L p E (phaseSectionRecycledState cs ε M deadline start L p E A hn s J ω).val.2.2 := by
  filter_upwards [ae_all_iff.mpr (scheduledSectionExceeded_phase_capture_ae cs ε M deadline start L p E A hn hB s hs)] with ω hω
  rintro ⟨N,hN,k,hk⟩
  have hp := hω N ⟨k,hk⟩
  have he := phaseSectionRecycledState_permanent cs ε M deadline start L p E A hn s ω (N+1) hp.1 J (Nat.succ_le_of_lt hN)
  rw [he.2]
  exact hp.2

theorem initial_phaseSectionPoint_exceedance_cover_tail {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hA : 0 < A)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (m : ℕ) (hm : 0 < m) (J : ℕ) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      (scheduledSectionExceededBefore cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J) ≤
      (((((L.val ∩ E).erase p).card:ℝ)^m +
        ∑ d ∈ Finset.Ico 1 m, B^(m-d)*(d:ℝ)^m*(((L.val ∩ E).erase p).card:ℝ)^d)/(1-ε)^(m+1).choose 2)/A^m := by
  let ν := phasePointMeasure cs ε M deadline start hn hB p J
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hh := (phasePointMeasure_absolutelyContinuous cs ε M deadline start hn hB p J).ae_le
    (scheduledSectionExceeded_full_capture_ae cs ε M deadline start L p E A hn (zero_lt_one.trans_le hB)
      (initialPhaseSection B hB p deadline start) (goodPhaseSectionInitial_massSupport L p E A _) J)
  have hreal := ENNReal.toReal_mono (measure_ne_top ν _) (measure_mono_ae hh)
  exact hreal.trans (initial_phaseSectionPoint_mass_tail L p E A Γ hL hpL cs ε M deadline start hn hB hp
    hΓ hK hε0 hε m hm J A hA)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledSectionExceededBefore_measurableSet
#print axioms NoThreeLine.BirthWitness.scheduledSectionExceeded_full_capture_ae
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_exceedance_cover_tail
