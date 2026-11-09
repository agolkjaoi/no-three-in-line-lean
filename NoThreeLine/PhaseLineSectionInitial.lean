import NoThreeLine.PhaseLineSectionMean
import NoThreeLine.FinitePhaseUnitProduct
import NoThreeLine.PhasePointLaw

/-! Canonical initialization retains the original initial deadline retirement.
The actual multi-phase section observer projects to the existing full-phase
state and its point-density credit. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator PrimitiveLines
attribute [local instance] Classical.propDecidable

def goodPhaseSectionInitial {n : ℕ} {B : ℝ} (p : Grid n) (s : GoodPhaseObservation n B) :
    GoodPhaseLineSection n B p :=
  ⟨(s.val,(if phaseRootClosed p s.val then true else false),s.val.1.val),
    ⟨s.property.1,s.val.1.property,fun _ => rfl,by
      intro hf hc
      simp only [if_pos hc] at hf
      exact Bool.noConfusion hf⟩,s.property.2⟩

theorem goodPhaseSectionInitial_measurable {n : ℕ} {B : ℝ} (p : Grid n) :
    Measurable (goodPhaseSectionInitial (B:=B) p) := by
  have hf : Measurable (fun s : GoodPhaseObservation n B =>
      if phaseRootClosed p s.val then true else false) :=
    Measurable.ite ((phaseRootClosed_measurable p).comp measurable_subtype_coe).setOf
      measurable_const measurable_const
  exact (measurable_subtype_coe.prodMk
    (hf.prodMk measurable_subtype_coe.fst.subtype_val)).subtype_mk

def initialPhaseSection {n : ℕ} (B : ℝ) (hB : 1 ≤ B) (p : Grid n)
    (deadline : Grid n → ℝ) (start : ℝ) : GoodPhaseLineSection n B p :=
  goodPhaseSectionInitial p (initialGoodPhaseObservation B hB deadline start)

theorem goodPhaseSectionInitial_creditGap {n : ℕ} {B : ℝ} (p : Grid n)
    (F : AugmentedState n → ℝ) (s : GoodPhaseObservation n B) :
    phaseSectionCreditGap p F (goodPhaseSectionInitial p s).val = 0 := by
  simp only [phaseSectionCreditGap,goodPhaseSectionInitial,sub_self,zero_mul]

theorem phaseSectionRecycledState_actual {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (s : GoodPhaseLineSection n B p) (k : ℕ) (ω : BoardClockPath n) :
    (phaseSectionRecycledState cs ε M deadline start L p E A hn s k ω).val.1 =
      observedRecycledPhaseState cs ε M deadline start hn s.val.1 k ω :=
  congrArg (fun r : (ℕ × PhaseObservation n B) × BoardClockPath n => r.1.2)
    (phaseSectionRecycledPair_projection cs ε M deadline start L p E A hn s k ω)

theorem initial_phaseSection_current_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B) (k : ℕ) (ω : BoardClockPath n) :
    ((phaseSectionRecycledState cs ε M deadline start L p E A hn
      (initialPhaseSection B hB p deadline start) k ω).val.1.1.val.physical.process.accounts p).credit =
      phasePointCredit cs ε M deadline start hn hB p k ω := by
  rw [phaseSectionRecycledState_actual]
  change validAugStateCredit B p (observedRecycledPhaseState cs ε M deadline start hn
    (initialGoodPhaseObservation B hB deadline start).val k ω).1 = _
  rw [observedRecycledPhaseState_base]
  rfl

theorem initial_phaseSection_mixed_le_one {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (Γ : Finset ZPoint) (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2)
    (C labels : Finset (Grid n)) (hCL : C ⊆ labels) (k : ℕ) :
    (∫ ω, phaseSectionMixed p Γ C labels (phaseSectionRecycledState cs ε M deadline start L p E A hn
      (initialPhaseSection B hB p deadline start) k ω) ∂boardClockMeasure n (B/n)) ≤ 1 := by
  apply (phaseSection_mixed_expected_le cs ε M deadline start L p E A hn (zero_lt_one.trans_le hB)
    Γ hΓ hK C labels hCL _ k).trans
  have hi := initialGoodPhase_unit_initial_bound cs ε M deadline start Γ (unitBirthRetention n) C labels
    hB (hΓ 0) ∅ (Finset.empty_subset C)
  simpa only [Finset.sdiff_empty,Finset.prod_empty,goodPhaseMixed,mixed_empty,phaseWitness,
    phaseSectionMixed,initialPhaseSection,goodPhaseSectionInitial] using hi

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_phaseSection_current_credit
#print axioms NoThreeLine.BirthWitness.initial_phaseSection_mixed_le_one
