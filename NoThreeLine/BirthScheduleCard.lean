import NoThreeLine.BirthPhaseAccumulation
import NoThreeLine.ScheduledBoardProcess

/-! Actual finite-schedule expected cardinality equals the accumulated
integrated birth rate, starting from the canonical empty selected set. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

theorem validSelectedIndicator_sum {n : ℕ} (B : ℝ) (s : ValidAugmentedState n B) :
    (∑p : Grid n,validSelectedIndicator B p s)=(s.val.physical.process.selected.card:ℝ) := by
  classical
  simp [validSelectedIndicator]

def totalScheduledBirthRate {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑p : Grid n,cumulativeScheduledBirthRate cs ε M deadline start p hn e k ω

theorem totalScheduledBirthRate_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (e : ValidAugmentedState n B) (k : ℕ) :
    Measurable (totalScheduledBirthRate cs ε M deadline start hn e k) :=
  Finset.measurable_sum _ (fun p _=>cumulativeScheduledBirthRate_measurable cs ε M deadline start p hn e k)

theorem totalScheduledBirthRate_integrable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    Integrable (totalScheduledBirthRate cs ε M deadline start hn e k) (boardClockMeasure n (B/n)) :=
  integrable_finset_sum _ (fun p _=>cumulativeScheduledBirthRate_integrable cs ε M deadline start p hn hB e k)

theorem finitePhase_card_compensation {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    (∫ω,((recycledPhaseState cs ε M deadline start hn e k ω).val.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (B/n))=(e.val.physical.process.selected.card:ℝ)+
        ∫ω,totalScheduledBirthRate cs ε M deadline start hn e k ω ∂boardClockMeasure n (B/n) := by
  simp_rw [← validSelectedIndicator_sum]
  rw [integral_finset_sum _ (fun p _=>recycledPhaseSelected_integrable cs ε M deadline start p hn hB e k)]
  simp_rw [finitePhase_selectedIndicator_compensation cs ε M deadline start _ hn hB e k]
  rw [Finset.sum_add_distrib]
  congr 1
  exact (integral_finset_sum _ (fun p _=>
    cumulativeScheduledBirthRate_integrable cs ε M deadline start p hn hB e k)).symm

theorem finitePhase_initial_card_compensation {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (k : ℕ) :
    (∫ω,((recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) k ω).val.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (B/n))=
        ∫ω,totalScheduledBirthRate cs ε M deadline start hn (augInitialState B hB deadline start) k ω
          ∂boardClockMeasure n (B/n) := by
  rw [finitePhase_card_compensation cs ε M deadline start hn (lt_of_lt_of_le zero_lt_one hB),
    augInitialState_selected]
  simp

def scheduleBirthIntegral {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀j p,0≤m j p ∧ m j p≤1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) (ω : BoardClockPath n) : ℝ :=
  totalScheduledBirthRate (scheduleSharedPhases s m hm Γ B K ρ) ε M (scheduleProcessDeadline s m) 0 hn
    (augInitialState B hB (scheduleProcessDeadline s m) 0) J ω

theorem schedule_card_compensation {J n : ℕ} (s : FinitePhase.Schedule J) (m : Fin J → Grid n → ℝ)
    (hm : ∀j p,0≤m j p ∧ m j p≤1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) :
    (∫ω,((scheduleProcessOutput s m hm Γ B K ρ ε M hn hB ω).val.physical.process.selected.card:ℝ)
      ∂boardClockMeasure n (B/n))=
        ∫ω,scheduleBirthIntegral s m hm Γ B K ρ ε M hn hB ω ∂boardClockMeasure n (B/n) :=
  finitePhase_initial_card_compensation _ ε M _ 0 hn hB J

theorem scheduleBirthIntegral_integrable {J n : ℕ} (s : FinitePhase.Schedule J)
    (m : Fin J → Grid n → ℝ) (hm : ∀j p,0≤m j p ∧ m j p≤1) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ ε M : ℝ) (hn : 0<n) (hB : 1≤B) :
    Integrable (scheduleBirthIntegral s m hm Γ B K ρ ε M hn hB) (boardClockMeasure n (B/n)) :=
  totalScheduledBirthRate_integrable _ ε M _ 0 hn (lt_of_lt_of_le zero_lt_one hB) _ J

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.finitePhase_card_compensation
#print axioms NoThreeLine.BirthWitness.schedule_card_compensation
