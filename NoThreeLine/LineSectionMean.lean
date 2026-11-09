import NoThreeLine.LineSectionObserver

/-! The whole source-free mixed family is a one-step supermartingale for
the additional contact observer. The estimate is proved from the actual
capped first-race law, not assumed as an observer invariant. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator

theorem correctedPhi_measurable {n : ℕ} (Γ : Finset ZPoint) (C labels : Finset (Grid n)) :
    Measurable (correctedPhi Γ C labels) := by
  have h := (mixed_measurable Γ C ∅ labels).comp
    (WitnessState.measurable_mk (fun a : AugmentedState n => a) (fun _ => fun _ => (0:ℝ))
      measurable_id measurable_const)
  simpa only [Function.comp_def,mixed_empty] using h

theorem correctedPhi_integrable {n : ℕ} {X : Type*} [MeasurableSpace X]
    (μ : Measure X) [IsFiniteMeasure μ] (a : X → AugmentedState n) (ha : Measurable a)
    (Γ : Finset ZPoint) (C labels : Finset (Grid n)) (B : ℝ) (hv : ∀ x, (a x).Valid B) :
    Integrable (fun x => correctedPhi Γ C labels (a x)) μ := by
  have h := mixed_integrable μ (fun x => WitnessState.mk (a x) (fun _ => 0))
    (WitnessState.measurable_mk a (fun _ => fun _ => (0:ℝ)) ha measurable_const)
    Γ C ∅ labels B (fun x => ⟨hv x,fun _ => ⟨le_rfl,zero_le_one⟩,fun _ _ => rfl⟩)
  simpa only [Function.comp_def,mixed_empty] using h

theorem lineSectionObserverStep_source_free {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (C labels : Finset (Grid n))
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (hs : LineSectionInvariant cfg p s) (hCL : C ⊆ labels)
    (hE : EmptyLineCredit s.1.1.val.1.physical) (hK : cfg.K < 2) :
    (∫ ω, correctedPhi cfg.directions C labels
      (lineSectionObserverStep cfg ε M start L p E A (s,WinnerMarkLaw.firstMarkedRace hn ω)).2.2
      ∂boardClockMeasure n (cfg.B/n)) ≤ correctedPhi cfg.directions C labels s.2.2 := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  by_cases hf : s.2.1 = true
  · simp only [lineSectionObserverStep,if_pos hf,
      integral_const,probReal_univ,one_smul,le_refl]
  · have hf' : s.2.1 = false := Bool.eq_false_iff.mpr hf
    rw [hs.live hf']
    apply le_trans _ (lineSectionRawSnapshot_source_free cfg ε M L p E A s.1 C labels
      hn hB hm hs.records hCL hE hK)
    apply integral_mono
    · exact correctedPhi_integrable _ _
        (((lineSectionObserverStep_measurable cfg ε M start L p E A).comp
          (measurable_const.prodMk (WinnerMarkLaw.firstMarkedRace_measurable hn))).snd.snd)
        cfg.directions C labels cfg.B
        (fun ω => (lineSectionObserverStep_invariant cfg ε M start L p E A s _ hs).saved)
    · exact correctedPhi_integrable _ _
        ((lineSectionRawSnapshot_measurable cfg ε M L p E A).comp
          (measurable_const.prodMk (WinnerMarkLaw.firstMarkedRace_measurable hn)))
        cfg.directions C labels cfg.B
        (fun ω => lineSectionRawSnapshot_valid cfg ε M L p E A _)
    · intro ω
      exact lineSectionObserverStep_mixed_le_raw cfg ε M start L p E A s _ C labels hs hf'

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.correctedPhi_integrable
#print axioms NoThreeLine.BirthWitness.lineSectionObserverStep_source_free
