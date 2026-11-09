import NoThreeLine.LineSectionMassSupport
import NoThreeLine.PhaseLineSectionCapture
import NoThreeLine.PhaseLineSectionInitial

/-! Contact mass support across original phase boundaries. A physically
closed root is separated from a mass-contact flag; artificial horizons are
reopened by the actual boundary operation. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def PhaseSectionMassSupport {n : ℕ} {B : ℝ} (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (s : PhaseLineSectionObservation n B) : Prop :=
  s.2.1 = true → A ≤ actualLineSectionMass L p E s.2.2 ∨ phaseRootClosed p s.1

theorem phaseSectionMassSupport_measurable {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) :
    Measurable (PhaseSectionMassSupport (B:=B) L p E A) :=
  (measurable_snd.fst.eq_const true).imp
    ((measurable_const.le' ((actualLineSectionMass_measurable L p E).comp measurable_snd.snd)).or
      ((phaseRootClosed_measurable p).comp measurable_fst))

theorem phaseLineSectionStart_massSupport {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : PhaseLineSectionObservation n cfg.B) (hs : PhaseSectionMassSupport L p E A s) :
    MarkedSectionMassSupport cfg L p E A (phaseLineSectionStart cfg ε M p s) := by
  classical
  unfold phaseLineSectionStart
  split_ifs with hf
  · intro _
    exact hs hf
  · intro h
    exact False.elim (Bool.noConfusion h)

theorem phaseLineSectionEnd_massSupport {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : MarkedLineSectionObservation cfg) (hs : MarkedSectionMassSupport cfg L p E A s) :
    PhaseSectionMassSupport L p E A (phaseLineSectionEnd cfg p s) := by
  classical
  dsimp only [phaseLineSectionEnd]
  split_ifs with h
  · intro _
    rcases h with hm | hc
    · exact hs hm
    · exact Or.inr hc
  · intro hf
    exact False.elim (Bool.noConfusion hf)

theorem phaseLineSectionDeadline_massSupport {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (deadline : Grid n → ℝ) (t : ℝ) (s : PhaseLineSectionObservation n B)
    (hs : PhaseSectionMassSupport L p E A s) :
    PhaseSectionMassSupport L p E A (phaseLineSectionDeadline p deadline t s) := by
  classical
  dsimp only [phaseLineSectionDeadline]
  split_ifs with hf hc
  · intro _
    exact (hs hf).imp_right (observedDeadline_rootClosed deadline t s.1 p)
  · intro _
    exact Or.inr hc
  · intro h
    exact False.elim (Bool.noConfusion h)

theorem goodPhaseSectionInitial_massSupport {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : GoodPhaseObservation n B) :
    PhaseSectionMassSupport L p E A (goodPhaseSectionInitial p s).val := by
  classical
  intro hf
  by_cases hc : phaseRootClosed p s.val
  · exact Or.inr hc
  · simp only [goodPhaseSectionInitial,if_neg hc,Bool.false_eq_true] at hf

theorem phaseSectionScheduledPair_massSupport_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < B) (j : ℕ) (s : GoodPhaseLineSection n B p) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n), PhaseSectionMassSupport L p E A s.val →
      PhaseSectionMassSupport L p E A
        (phaseSectionScheduledPair cs ε M deadline start L p E A hn j (s,ω)).1.val := by
  filter_upwards [markedSectionTerminal_massSupport_ae (cs j).config ε M (phaseEndpoint cs start j)
    L p E A hn hB (goodPhaseSectionStart (cs j).config ε M p s)] with ω hω
  intro hs
  exact phaseLineSectionDeadline_massSupport L p E A deadline (phaseEndpoint cs start (j+1)) _
    (phaseLineSectionEnd_massSupport (cs j).config L p E A _
      (hω (phaseLineSectionStart_massSupport (cs j).config ε M L p E A s.val hs)))

theorem phaseSectionRecycledState_massSupport_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < B) (s : GoodPhaseLineSection n B p) (hs : PhaseSectionMassSupport L p E A s.val) (J : ℕ) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n), PhaseSectionMassSupport L p E A
      (phaseSectionRecycledState cs ε M deadline start L p E A hn s J ω).val := by
  induction J with
  | zero => exact Filter.Eventually.of_forall (fun _ => hs)
  | succ J ih =>
    let ν := boardClockMeasure n (B/n)
    let v := phaseSectionRecycledPair cs ε M deadline start L p E A hn s J
    have hv := phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn s J
    letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
    let μ := ν.map (fun ω => (v ω).1)
    letI : IsProbabilityMeasure μ := Measure.isProbabilityMeasure_map hv.fst.aemeasurable
    let P : (ℕ × GoodPhaseLineSection n B p) × BoardClockPath n → Prop := fun x =>
      PhaseSectionMassSupport L p E A x.1.2.val → PhaseSectionMassSupport L p E A
        (phaseSectionScheduledPair cs ε M deadline start L p E A hn J (x.1.2,x.2)).1.val
    have hP : Measurable P :=
      ((phaseSectionMassSupport_measurable L p E A).comp measurable_fst.snd.subtype_val).imp
        ((phaseSectionMassSupport_measurable L p E A).comp
          (((phaseSectionScheduledPair_measurable cs ε M deadline start L p E A hn J).comp
            (measurable_fst.snd.prodMk measurable_snd)).fst.subtype_val))
    have hh := residual_sections_ae ν μ ν v hv
      (phaseSectionRecycledPair_residual_product cs ε M deadline start L p E A hn hB s J) P hP
      (fun x => phaseSectionScheduledPair_massSupport_ae cs ε M deadline start L p E A hn hB J x.2)
    filter_upwards [ih,hh] with ω hi hi'
    rw [phaseSectionRecycledState_succ]
    exact hi' hi

theorem initial_phaseSection_massSupport_all_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n), ∀ J, PhaseSectionMassSupport L p E A
      (phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) J ω).val :=
  ae_all_iff.mpr (phaseSectionRecycledState_massSupport_ae cs ε M deadline start L p E A hn
    (zero_lt_one.trans_le hB) _ (goodPhaseSectionInitial_massSupport L p E A _) )

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseLineSectionDeadline_massSupport
#print axioms NoThreeLine.BirthWitness.phaseSectionRecycledState_massSupport_ae
#print axioms NoThreeLine.BirthWitness.initial_phaseSection_massSupport_all_ae
