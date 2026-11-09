import NoThreeLine.WitnessSourceKernel
import NoThreeLine.EmptyLineCreditReachability

/-! All-state S7 step kernel. The subtype carries only the actually
preserved record consistency and empty-line-credit invariant, not C-active
or a one-step expectation assertion. Done and inactive-C branches are proved. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem observedClockStep_source_bound_all {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (s : TimedObservation cfg) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hs : RecordsConsistent cfg s)
    (hCL : C⊆L) (hCD : Disjoint C D) (hE : EmptyLineCredit s.1.val.1.physical) (hK : cfg.K<2) :
    (∫ω,mixed cfg.directions C D L (observedWitness cfg e (observedClockStep cfg ε M start hn (s,ω)))
      ∂boardClockMeasure n (cfg.B/n))≤
      mixed cfg.directions C D L (observedWitness cfg e s)+stepSourceIntegral cfg ε M start e C D L s := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  by_cases hx : observationDone cfg s
  · have hf (ω : BoardClockPath n) : observedClockStep cfg ε M start hn (s,ω)=s :=
      observedStep_frozen cfg ε M start _ hx
    simp only [hf,stepSourceIntegral,if_pos hx,add_zero,integral_const,probReal_univ,one_smul,le_refl]
  · rw [stepSourceIntegral,if_neg hx]
    by_cases hC : C⊆s.1.val.1.physical.process.activeEvents
    · exact observedClockStep_source_bound cfg ε M start e s C D L hn hB hm hs hx hC hCL hCD hE hK
    · have hf (ω : BoardClockPath n) : mixed cfg.directions C D L
          (observedWitness cfg e (observedClockStep cfg ε M start hn (s,ω)))=0 :=
        observedStep_mixed_zero cfg ε M start e _ C D L hC
      rw [mixed_eq_zero_of_not_active _ cfg.directions C D L hC,
        observedSourceIntegral_zero_of_not_active cfg ε M start e s C D L hC]
      simp only [hf,integral_zero,add_zero,le_refl]

abbrev GoodObservation {n : ℕ} (cfg : FlowConfig n) :=
  {s : TimedObservation cfg // RecordsConsistent cfg s ∧ EmptyLineCredit s.1.val.1.physical}

def goodObservedStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : GoodObservation cfg×CandidateData n) : GoodObservation cfg :=
  ⟨observedStep cfg ε M start (x.1.val,x.2),
    observedStep_consistent cfg ε M start _ x.1.property.1,
    emptyLineCredit_augTimedStep cfg ε M x.1.val.1 x.2 x.1.property.2⟩

theorem goodObservedStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) :
    Measurable (goodObservedStep cfg ε M start) :=
  ((observedStep_measurable cfg ε M start).comp
    ((measurable_subtype_coe.comp measurable_fst).prodMk measurable_snd)).subtype_mk

def goodObservedClockStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : GoodObservation cfg×BoardClockPath n) : GoodObservation cfg :=
  goodObservedStep cfg ε M start (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem goodObservedClockStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n) :
    Measurable (goodObservedClockStep cfg ε M start hn) :=
  (goodObservedStep_measurable cfg ε M start).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

def goodMixed {n : ℕ} (cfg : FlowConfig n) (e : Retention n) (C D L : Finset (Grid n))
    (s : GoodObservation cfg) : ℝ := mixed cfg.directions C D L (observedWitness cfg e s.val)

def goodUpperMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodObservation cfg) : ℝ :=
  goodMixed cfg e C D L s+stepSourceIntegral cfg ε M start e C D L s.val

theorem goodMixed_measurable {n : ℕ} (cfg : FlowConfig n) (e : Retention n) (C D L : Finset (Grid n)) :
    Measurable (goodMixed cfg e C D L) :=
  ((mixed_measurable cfg.directions C D L).comp (observedWitness_measurable cfg e)).comp measurable_subtype_coe

theorem goodUpperMean_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) : Measurable (goodUpperMean cfg ε M start e C D L) :=
  (goodMixed_measurable cfg e C D L).add
    ((stepSourceIntegral_measurable cfg ε M start e C D L).comp measurable_subtype_coe)

theorem goodMixed_bounds {n : ℕ} (cfg : FlowConfig n) (e : Retention n) (C D L : Finset (Grid n))
    (s : GoodObservation cfg) : 0≤goodMixed cfg e C D L s ∧ goodMixed cfg e C D L s≤mixedCap C cfg.B :=
  ⟨mixed_nonneg _ cfg.directions C D L cfg.B (observedWitness_valid cfg e s.val s.property.1),
    mixed_le_cap _ cfg.directions C D L cfg.B (observedWitness_valid cfg e s.val s.property.1)⟩

theorem goodUpperMean_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (s : GoodObservation cfg) : 0≤goodUpperMean cfg ε M start e C D L s ∧
      goodUpperMean cfg ε M start e C D L s≤mixedCap C cfg.B+(cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K := by
  have hp := goodMixed_bounds cfg e C D L s
  have hq := stepSourceIntegral_bounds cfg ε M start e s.val C D L s.property.1 hB hm hK
  exact ⟨add_nonneg hp.1 hq.1,add_le_add hp.2 hq.2⟩

theorem goodObservedClockStep_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodObservation cfg) :
    (∫ω,goodMixed cfg e C D L (goodObservedClockStep cfg ε M start hn (s,ω))
      ∂boardClockMeasure n (cfg.B/n))≤goodUpperMean cfg ε M start e C D L s :=
  observedClockStep_source_bound_all cfg ε M start e s.val C D L hn hB hm s.property.1 hCL hCD s.property.2 hK

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedClockStep_source_bound_all
#print axioms NoThreeLine.BirthWitness.goodObservedClockStep_mean
