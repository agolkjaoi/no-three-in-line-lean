import NoThreeLine.BirthScheduledMean

/-! Accumulate the actual integrated birth rates through finite scheduled
phases on the same original board, and telescope the selected indicators. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def scheduledBirthIncrement {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : ValidAugmentedState n B) (j : ℕ) (ω : BoardClockPath n) : ℝ :=
  phaseBirthRate (cs j).config ε M p hn
    (recycledPhaseState cs ε M deadline start hn e j ω,
      (recycledPhases cs ε M deadline start hn e j ω).2)

theorem scheduledBirthIncrement_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : ValidAugmentedState n B) (j : ℕ) :
    Measurable (scheduledBirthIncrement cs ε M deadline start p hn e j) := by
  have hp : Measurable (fun ω=>(recycledPhaseState cs ε M deadline start hn e j ω,
      (recycledPhases cs ε M deadline start hn e j ω).2)) :=
    (recycledPhaseState_measurable cs ε M deadline start hn e j).prodMk
      (recycledPhases_measurable cs ε M deadline start hn e j).snd
  exact (phaseBirthRate_measurable (cs j).config ε M p hn).comp hp

theorem scheduledBirthIncrement_bounds {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) (j : ℕ) (ω : BoardClockPath n) :
    0≤scheduledBirthIncrement cs ε M deadline start p hn e j ω ∧
      scheduledBirthIncrement cs ε M deadline start p hn e j ω≤(cs j).horizon*(B/n) :=
  phaseBirthRate_bounds (cs j).config ε M p hn hB (cs j).mask_le_one _

theorem scheduledBirthIncrement_integrable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) (j : ℕ) :
    Integrable (scheduledBirthIncrement cs ε M deadline start p hn e j) (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (scheduledBirthIncrement_measurable cs ε M deadline start p hn e j)
    ((cs j).horizon*(B/n)) (scheduledBirthIncrement_bounds cs ε M deadline start p hn hB e j)

def cumulativeScheduledBirthRate {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : ValidAugmentedState n B) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,scheduledBirthIncrement cs ε M deadline start p hn e j ω

theorem cumulativeScheduledBirthRate_succ {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : ValidAugmentedState n B) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeScheduledBirthRate cs ε M deadline start p hn e (k+1) ω=
      cumulativeScheduledBirthRate cs ε M deadline start p hn e k ω+
        scheduledBirthIncrement cs ε M deadline start p hn e k ω := Finset.sum_range_succ _ _

theorem cumulativeScheduledBirthRate_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : ValidAugmentedState n B) (k : ℕ) :
    Measurable (cumulativeScheduledBirthRate cs ε M deadline start p hn e k) :=
  Finset.measurable_sum _ (fun j _=>scheduledBirthIncrement_measurable cs ε M deadline start p hn e j)

theorem cumulativeScheduledBirthRate_bounds {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) (k : ℕ) (ω : BoardClockPath n) :
    0≤cumulativeScheduledBirthRate cs ε M deadline start p hn e k ω ∧
      cumulativeScheduledBirthRate cs ε M deadline start p hn e k ω≤
        (phaseEndpoint cs start k-start)*(B/n) := by
  constructor
  · exact Finset.sum_nonneg (fun j _=>(scheduledBirthIncrement_bounds cs ε M deadline start p hn hB e j ω).1)
  · calc
      _ ≤ ∑j∈Finset.range k,(cs j).horizon*(B/n) :=
        Finset.sum_le_sum (fun j _=>(scheduledBirthIncrement_bounds cs ε M deadline start p hn hB e j ω).2)
      _ = _ := by simp [phaseEndpoint,Finset.sum_mul]

theorem cumulativeScheduledBirthRate_integrable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    Integrable (cumulativeScheduledBirthRate cs ε M deadline start p hn e k) (boardClockMeasure n (B/n)) :=
  integrable_finset_sum _ (fun j _=>scheduledBirthIncrement_integrable cs ε M deadline start p hn hB e j)

theorem recycledPhaseSelected_integrable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    Integrable (fun ω=>validSelectedIndicator B p (recycledPhaseState cs ε M deadline start hn e k ω))
      (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((validSelectedIndicator_measurable B p).comp (recycledPhaseState_measurable cs ε M deadline start hn e k))
    1 (fun ω=>validSelectedIndicator_bounds B p _)

theorem finitePhase_selectedIndicator_compensation {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    (∫ω,validSelectedIndicator B p (recycledPhaseState cs ε M deadline start hn e k ω)
      ∂boardClockMeasure n (B/n))=validSelectedIndicator B p e+
        ∫ω,cumulativeScheduledBirthRate cs ε M deadline start p hn e k ω ∂boardClockMeasure n (B/n) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  induction k with
  | zero => simp [cumulativeScheduledBirthRate,recycledPhaseState,recycledPhases,RecycledBoardProcess.iterate]
  | succ k ih =>
    have h := scheduled_selectedIndicator_mean cs ε M deadline start p hn hB e k
    change (∫ω,validSelectedIndicator B p (recycledPhaseState cs ε M deadline start hn e (k+1) ω)
      ∂boardClockMeasure n (B/n))=∫ω,
        validSelectedIndicator B p (recycledPhaseState cs ε M deadline start hn e k ω)+
          scheduledBirthIncrement cs ε M deadline start p hn e k ω ∂boardClockMeasure n (B/n) at h
    rw [integral_add (recycledPhaseSelected_integrable cs ε M deadline start p hn hB e k)
      (scheduledBirthIncrement_integrable cs ε M deadline start p hn hB e k),ih] at h
    rw [h]
    simp_rw [cumulativeScheduledBirthRate_succ]
    rw [integral_add (cumulativeScheduledBirthRate_integrable cs ε M deadline start p hn hB e k)
      (scheduledBirthIncrement_integrable cs ε M deadline start p hn hB e k)]
    ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cumulativeScheduledBirthRate_bounds
#print axioms NoThreeLine.BirthWitness.finitePhase_selectedIndicator_compensation
