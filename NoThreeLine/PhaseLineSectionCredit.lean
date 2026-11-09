import NoThreeLine.PhaseLineSectionKernel

/-! The additional frozen snapshot is transported by a tested credit gap.
Artificial reopening and real deadline retirement preserve this gap.
No equality of current and permanently saved credit is assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator
attribute [local instance] Classical.propDecidable

def phaseSectionCreditGap {n : ℕ} {B : ℝ} (p : Grid n)
    (F : AugmentedState n → ℝ) (s : PhaseLineSectionObservation n B) : ℝ :=
  ((s.1.1.val.physical.process.accounts p).credit - (s.2.2.physical.process.accounts p).credit) * F s.2.2

theorem phaseSectionCreditGap_measurable {n : ℕ} {B : ℝ} (p : Grid n)
    (F : AugmentedState n → ℝ) (hF : Measurable F) : Measurable (phaseSectionCreditGap (B:=B) p F) := by
  have hc : Measurable (fun a : AugmentedState n => (a.physical.process.accounts p).credit) :=
    CreditAccount.measurable_credit.comp ((ProcessState.measurable_account n p).comp
      ((ExtendedState.measurable_process n).comp (AugmentedState.measurable_physical n)))
  exact ((hc.comp measurable_fst.fst.subtype_val).sub
    (hc.comp measurable_snd.snd)).mul (hF.comp measurable_snd.snd)

theorem phaseSectionCreditGap_norm_le {n : ℕ} {B : ℝ} (p : Grid n)
    (F : AugmentedState n → ℝ) (D : ℝ) (hF : ∀ a, a.Valid B → |F a| ≤ D)
    (s : GoodPhaseLineSection n B p) : ‖phaseSectionCreditGap p F s.val‖ ≤ B*D := by
  have hc := (s.val.1.1.val.physical.process.accounts p).credit_bounds B (s.val.1.1.property.1.2.1.1 p)
  have hs := (s.val.2.2.physical.process.accounts p).credit_bounds B (s.property.1.saved.1.2.1.1 p)
  have hg : |(s.val.1.1.val.physical.process.accounts p).credit -
      (s.val.2.2.physical.process.accounts p).credit| ≤ B := abs_le.mpr ⟨by linarith,by linarith⟩
  simpa only [phaseSectionCreditGap,Real.norm_eq_abs,abs_mul] using
    mul_le_mul hg (hF _ s.property.1.saved) (abs_nonneg _) (hc.1.trans hc.2)

theorem phaseLineSectionEnd_creditGap {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (F : AugmentedState n → ℝ) (s : MarkedLineSectionObservation cfg)
    (hs : UnmarkedLineSectionCredit cfg p s) :
    phaseSectionCreditGap p F (phaseLineSectionEnd cfg p s) = lineSectionCreditGap cfg p F s.1 := by
  by_cases h : s.2 = true ∨ phaseRootClosed p (observedTimedProjection cfg s.1.1)
  · simp only [phaseLineSectionEnd,if_pos h]
    rfl
  · simp only [phaseLineSectionEnd,if_neg h,phaseSectionCreditGap,sub_self,zero_mul]
    have hc := hs (Bool.eq_false_iff.mpr (fun hm => h (Or.inl hm)))
    simp only [lineSectionCreditGap,hc,sub_self,zero_mul]

theorem phaseLineSectionDeadline_creditGap {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (F : AugmentedState n → ℝ)
    (s : PhaseLineSectionObservation n B) (hs : PhaseLineSectionInvariant p s) :
    phaseSectionCreditGap p F (phaseLineSectionDeadline p deadline t s) = phaseSectionCreditGap p F s := by
  by_cases hf : s.2.1 = true
  · simp only [phaseLineSectionDeadline,if_pos hf,phaseSectionCreditGap,observedDeadline_credit]
  · have hl := hs.live (Bool.eq_false_iff.mpr hf)
    have hz : phaseSectionCreditGap p F s = 0 := by
      simp only [phaseSectionCreditGap,hl,sub_self,zero_mul]
    rw [hz]
    dsimp only [phaseLineSectionDeadline]
    rw [if_neg hf]
    split_ifs <;> simp only [phaseSectionCreditGap,observedDeadline_credit,sub_self,zero_mul]

theorem phaseLineSectionBoundary_creditGap {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n → ℝ) (t : ℝ) (F : AugmentedState n → ℝ)
    (s : GoodMarkedLineSection cfg p) :
    phaseSectionCreditGap p F (goodPhaseSectionBoundary cfg p deadline t s).val =
      lineSectionCreditGap cfg p F s.val.1 := by
  change phaseSectionCreditGap p F (phaseLineSectionDeadline _ _ _ (phaseLineSectionEnd _ _ _)) = _
  rw [phaseLineSectionDeadline_creditGap _ _ _ _ _ (phaseLineSectionEnd_invariant cfg p s.val s.property.1)]
  exact phaseLineSectionEnd_creditGap cfg p F s.val s.property.2.2.2

theorem phaseLineSectionStart_creditGap {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (F : AugmentedState n → ℝ) (s : GoodPhaseLineSection n cfg.B p) :
    lineSectionCreditGap cfg p F (goodPhaseSectionStart cfg ε M p s).val.1 =
      phaseSectionCreditGap p F s.val := by
  change (augTimedCredit cfg p (phaseLineSectionStart cfg ε M p s.val).1.1.1 -
    ((phaseLineSectionStart cfg ε M p s.val).1.2.2.physical.process.accounts p).credit) *
      F (phaseLineSectionStart cfg ε M p s.val).1.2.2 = _
  rw [phaseLineSectionStart_saved _ _ _ _ _ s.property.1]
  have hp := congrArg Prod.fst (phaseLineSectionStart_projection cfg ε M p s.val)
  rw [hp]
  rfl

theorem phaseSectionScheduledPair_creditGap_mean {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (F : AugmentedState n → ℝ) (hF : Measurable F)
    (D : ℝ) (hFD : ∀ a, a.Valid B → |F a| ≤ D) (hn : 0 < n) (hB : 0 < B)
    (j : ℕ) (s : GoodPhaseLineSection n B p) :
    (∫ ω, phaseSectionCreditGap p F
      (phaseSectionScheduledPair cs ε M deadline start L p E A hn j (s,ω)).1.val
      ∂boardClockMeasure n (B/n)) = phaseSectionCreditGap p F s.val := by
  let a := goodPhaseSectionStart (cs j).config ε M p s
  have he (ω : BoardClockPath n) :
      (markedSectionTerminalPair (cs j).config ε M (phaseEndpoint cs start j) L p E A hn (a,ω)).1.val.1 =
        (lineSectionTerminal (cs j).config ε M (phaseEndpoint cs start j) L p E A hn
          (goodMarkedCore (cs j).config p a) ω).val :=
    congrArg (fun r : GoodLineSectionObservation (cs j).config p × BoardClockPath n => r.1.val)
      (markedSectionTerminalPair_core (cs j).config ε M (phaseEndpoint cs start j) L p E A hn (a,ω))
  change (∫ ω, phaseSectionCreditGap p F (goodPhaseSectionBoundary (cs j).config p deadline
    (phaseEndpoint cs start (j+1)) (markedSectionTerminalPair (cs j).config ε M
      (phaseEndpoint cs start j) L p E A hn (a,ω)).1).val ∂boardClockMeasure n (B/n)) = _
  simp_rw [phaseLineSectionBoundary_creditGap,he]
  rw [lineSectionTerminal_creditGap_mean (cs j).config ε M (phaseEndpoint cs start j)
    L p E A F hF D hFD hn hB (cs j).mask_le_one]
  exact phaseLineSectionStart_creditGap (cs j).config ε M p F s

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseLineSectionBoundary_creditGap
#print axioms NoThreeLine.BirthWitness.phaseSectionScheduledPair_creditGap_mean
