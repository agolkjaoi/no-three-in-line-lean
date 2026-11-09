import NoThreeLine.ProtectedRunningHistory

/-! The actual positive running source telescopes against remaining time.
Its bound is independent of the number of recycled updates, and it is
adapted to the full saved-ledger history. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def cumulativeProtectedSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,protectedClockRunningSource cfg ε M L p hn
    (protectedRecycledPair cfg ε M L hn s j ω)

theorem cumulativeProtectedSource_succ {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeProtectedSource cfg ε M L p hn s (k+1) ω=
      cumulativeProtectedSource cfg ε M L p hn s k ω+
        protectedClockRunningSource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω) :=
  Finset.sum_range_succ _ _

theorem cumulativeProtectedSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    Measurable (cumulativeProtectedSource cfg ε M L p hn s k) :=
  Finset.measurable_sum _ (fun j _=>(protectedClockRunningSource_measurable cfg ε M L p hn).comp
    (protectedRecycledPair_measurable cfg ε M L hn s j))

theorem cumulativeProtectedSource_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance
      (cumulativeProtectedSource cfg ε M L p hn s k) := by
  apply Finset.measurable_sum
  intro j hj
  exact (protectedClockRunningSource_measurable_history cfg ε M L p hn s j).mono
    ((protectedStateFiltration cfg ε M L hn s).mono (Nat.succ_le_of_lt (Finset.mem_range.mp hj))) le_rfl

theorem cumulativeProtectedSource_elapsed_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeProtectedSource cfg ε M L p hn s k ω≤
      (s.1.val.2-(protectedRecycledPair cfg ε M L hn s k ω).1.1.val.2)*((cfg.B/n)*cfg.B) := by
  induction k with
  | zero => simp [cumulativeProtectedSource,protectedRecycledPair,RecycledBoardProcess.iterate]
  | succ k ih =>
    let x := protectedRecycledPair cfg ε M L hn s k ω
    have hb := (protectedRunningSource_elapsed_bounds_all cfg ε M L hsp p hpL hB hm
      (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)).2
    rw [birthElapsed_eq_remaining_drop cfg ε M] at hb
    rw [cumulativeProtectedSource_succ]
    calc
      _ ≤ (s.1.val.2-x.1.1.val.2)*((cfg.B/n)*cfg.B)+
          (x.1.1.val.2-(augTimedStep cfg ε M (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)).val.2)*
            ((cfg.B/n)*cfg.B) := add_le_add ih hb
      _ = _ := by
        change _=(s.1.val.2-(augTimedStep cfg ε M (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)).val.2)*_
        ring

theorem cumulativeProtectedSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    0≤cumulativeProtectedSource cfg ε M L p hn s k ω ∧
      cumulativeProtectedSource cfg ε M L p hn s k ω≤(cfg.horizon:ℝ)*((cfg.B/n)*cfg.B) := by
  constructor
  · exact Finset.sum_nonneg (fun j _=>
      (protectedRunningSource_bounds_all cfg ε M L hsp p hpL hB hm _).1)
  · exact (cumulativeProtectedSource_elapsed_bound cfg ε M L hsp p hpL hn hB hm s k ω).trans
      (mul_le_mul_of_nonneg_right ((sub_le_self _
        (protectedRecycledPair cfg ε M L hn s k ω).1.1.property.2.1).trans s.1.property.2.2)
        (mul_nonneg (div_nonneg hB (Nat.cast_nonneg n)) hB))

theorem cumulativeProtectedSource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (k : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (cumulativeProtectedSource cfg ε M L p hn s k) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable _ _
    (cumulativeProtectedSource_measurable cfg ε M L p hn s k) ((cfg.horizon:ℝ)*((cfg.B/n)*cfg.B))
    (cumulativeProtectedSource_bounds cfg ε M L hsp p hpL hn hB hm s k)

end NoThreeLine

#print axioms NoThreeLine.cumulativeProtectedSource_measurable_history
#print axioms NoThreeLine.cumulativeProtectedSource_elapsed_bound
#print axioms NoThreeLine.cumulativeProtectedSource_integrable
