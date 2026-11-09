import NoThreeLine.PhaseLineSectionProcess
import NoThreeLine.PhaseLineSectionCredit

/-! D-empty source-free means and tested credit transport for the actual
multi-phase additional-contact observer on one original clock board. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator PrimitiveLines

theorem phaseSectionMixed_bounds {n : ℕ} {B : ℝ} (p : Grid n) (Γ : Finset ZPoint)
    (C labels : Finset (Grid n)) (s : GoodPhaseLineSection n B p) :
    0 ≤ phaseSectionMixed p Γ C labels s ∧ phaseSectionMixed p Γ C labels s ≤ mixedCap C B := by
  have hv : (WitnessState.mk s.val.2.2 (fun _ => 0)).Valid B :=
    ⟨s.property.1.saved,fun _ => ⟨le_rfl,zero_le_one⟩,fun _ _ => rfl⟩
  exact ⟨correctedPhi_nonneg _ Γ C labels B s.property.1.saved,
    by simpa only [mixed_empty,phaseSectionMixed] using mixed_le_cap _ Γ C ∅ labels B hv⟩

theorem phaseSection_mixed_supermartingale {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 0 < B)
    (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (C labels : Finset (Grid n)) (hCL : C ⊆ labels) (s : GoodPhaseLineSection n B p) :
    Supermartingale
      (fun k ω => phaseSectionMixed p Γ C labels (phaseSectionRecycledState cs ε M deadline start L p E A hn s k ω))
      (StateHistory.filtration
        (RecycledBoardProcess.state (phaseSectionRestartStep cs ε M deadline start L p E A hn) (0,s))
        (RecycledBoardProcess.state_measurable _
          (phaseSectionRestartStep_measurable cs ε M deadline start L p E A hn) (0,s)))
      (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  apply RecycledBoardProcess.credit_supermartingale _
    (phaseSectionRestartStep_measurable cs ε M deadline start L p E A hn) _
    (phaseSectionRestartStep_residual_product cs ε M deadline start L p E A hn hB)
    (fun a : ℕ × GoodPhaseLineSection n B p => phaseSectionMixed p Γ C labels a.2)
    ((phaseSectionMixed_measurable p Γ C labels).comp measurable_snd) (mixedCap C B)
    (fun a => phaseSectionMixed_bounds p Γ C labels a.2)
  intro a
  simpa only [phaseSectionRestartStep,SharedPhase.config,hΓ] using
    phaseSectionScheduledPair_mean_le cs ε M deadline start L p E A hn hB a.1 (hK a.1) a.2 C labels hCL

theorem phaseSection_mixed_expected_le {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 0 < B)
    (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (C labels : Finset (Grid n)) (hCL : C ⊆ labels) (s : GoodPhaseLineSection n B p) (k : ℕ) :
    (∫ ω, phaseSectionMixed p Γ C labels (phaseSectionRecycledState cs ε M deadline start L p E A hn s k ω)
      ∂boardClockMeasure n (B/n)) ≤ phaseSectionMixed p Γ C labels s := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let z : ℕ × GoodPhaseLineSection n B p → ℝ := fun a => phaseSectionMixed p Γ C labels a.2
  have hz : Measurable z := (phaseSectionMixed_measurable p Γ C labels).comp measurable_snd
  have hb (a : ℕ × GoodPhaseLineSection n B p) : 0 ≤ z a ∧ z a ≤ mixedCap C B :=
    phaseSectionMixed_bounds p Γ C labels a.2
  have hm (a : ℕ × GoodPhaseLineSection n B p) :
      (∫ ω, z (phaseSectionRestartStep cs ε M deadline start L p E A hn (a,ω)).1
        ∂boardClockMeasure n (B/n)) ≤ z a := by
    simpa only [z,phaseSectionRestartStep,SharedPhase.config,hΓ] using
      phaseSectionScheduledPair_mean_le cs ε M deadline start L p E A hn hB a.1 (hK a.1) a.2 C labels hCL
  induction k with
  | zero => simp [phaseSectionRecycledState,phaseSectionRecycledPair,RecycledBoardProcess.iterate]
  | succ k ih =>
    have h := RecycledBoardProcess.history_estimate _
      (phaseSectionRestartStep_measurable cs ε M deadline start L p E A hn) _
      (phaseSectionRestartStep_residual_product cs ε M deadline start L p E A hn hB)
      z z hz hz (mixedCap C B) (mixedCap C B) hb hb hm (0,s) k Set.univ MeasurableSet.univ
    simp only [Measure.restrict_univ] at h
    exact h.trans ih

theorem phaseSection_creditGap_expected {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (F : AugmentedState n → ℝ) (hF : Measurable F)
    (D : ℝ) (hFD : ∀ a, a.Valid B → |F a| ≤ D) (hn : 0 < n) (hB : 0 < B)
    (s : GoodPhaseLineSection n B p) (k : ℕ) :
    (∫ ω, phaseSectionCreditGap p F (phaseSectionRecycledState cs ε M deadline start L p E A hn s k ω).val
      ∂boardClockMeasure n (B/n)) = phaseSectionCreditGap p F s.val := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact RecycledBoardProcess.bounded_signed_expected _
    (phaseSectionRestartStep_measurable cs ε M deadline start L p E A hn) _
    (phaseSectionRestartStep_residual_product cs ε M deadline start L p E A hn hB)
    (fun a : ℕ × GoodPhaseLineSection n B p => phaseSectionCreditGap p F a.2.val)
    ((phaseSectionCreditGap_measurable p F hF).comp measurable_snd.subtype_val) (B*D)
    (fun a => phaseSectionCreditGap_norm_le p F D hFD a.2)
    (fun a => phaseSectionScheduledPair_creditGap_mean cs ε M deadline start L p E A F hF D hFD hn hB a.1 a.2)
    (0,s) k

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseSection_mixed_supermartingale
#print axioms NoThreeLine.BirthWitness.phaseSection_mixed_expected_le
#print axioms NoThreeLine.BirthWitness.phaseSection_creditGap_expected
