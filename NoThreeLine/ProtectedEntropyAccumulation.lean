import NoThreeLine.ProtectedEntropyHistory

/-! The total absolute signed source is controlled by actual elapsed
time, with no update-count factor, and is observed in the real history. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def cumulativeProtectedEntropySource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,protectedClockRunningEntropySource cfg ε M L p hn
    (protectedRecycledPair cfg ε M L hn s j ω)

def cumulativeProtectedEntropyVariation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,‖protectedClockRunningEntropySource cfg ε M L p hn
    (protectedRecycledPair cfg ε M L hn s j ω)‖

theorem cumulativeProtectedEntropySource_succ {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeProtectedEntropySource cfg ε M L p hn s (k+1) ω=
      cumulativeProtectedEntropySource cfg ε M L p hn s k ω+
        protectedClockRunningEntropySource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω) :=
  Finset.sum_range_succ _ _

theorem cumulativeProtectedEntropySource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    Measurable (cumulativeProtectedEntropySource cfg ε M L p hn s k) :=
  Finset.measurable_sum _ (fun j _=>(protectedClockRunningEntropySource_measurable cfg ε M L p hn).comp
    (protectedRecycledPair_measurable cfg ε M L hn s j))

theorem cumulativeProtectedEntropySource_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance
      (cumulativeProtectedEntropySource cfg ε M L p hn s k) := by
  apply Finset.measurable_sum
  intro j hj
  exact (protectedClockRunningEntropySource_measurable_history cfg ε M L p hn s j).mono
    ((protectedStateFiltration cfg ε M L hn s).mono (Nat.succ_le_of_lt (Finset.mem_range.mp hj))) le_rfl

theorem cumulativeProtectedEntropySource_stronglyAdapted {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) :
    StronglyAdapted (protectedStateFiltration cfg ε M L hn s) (cumulativeProtectedEntropySource cfg ε M L p hn s) :=
  fun k=>(cumulativeProtectedEntropySource_measurable_history cfg ε M L p hn s k).stronglyMeasurable

theorem cumulativeProtectedEntropyVariation_elapsed_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeProtectedEntropyVariation cfg ε M L p hn s k ω≤
      (s.1.val.2-(protectedRecycledPair cfg ε M L hn s k ω).1.1.val.2)*protectedEntropySourceCap n cfg.B := by
  induction k with
  | zero => simp [cumulativeProtectedEntropyVariation,protectedRecycledPair,RecycledBoardProcess.iterate]
  | succ k ih =>
    let x := protectedRecycledPair cfg ε M L hn s k ω
    have hb := protectedRunningEntropySource_elapsed_bound cfg ε M L hsp p hpL hB hm
      x.1 (WinnerMarkLaw.firstMarkedRace hn x.2)
    rw [birthElapsed_eq_remaining_drop cfg ε M] at hb
    unfold cumulativeProtectedEntropyVariation
    rw [Finset.sum_range_succ]
    calc
      _ ≤ (s.1.val.2-x.1.1.val.2)*protectedEntropySourceCap n cfg.B+
          (x.1.1.val.2-(augTimedStep cfg ε M (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)).val.2)*
            protectedEntropySourceCap n cfg.B := add_le_add ih hb
      _ = _ := by
        change _=(s.1.val.2-(augTimedStep cfg ε M (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)).val.2)*_
        ring

theorem cumulativeProtectedEntropySource_norm_le_variation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    ‖cumulativeProtectedEntropySource cfg ε M L p hn s k ω‖≤cumulativeProtectedEntropyVariation cfg ε M L p hn s k ω :=
  norm_sum_le _ _

theorem cumulativeProtectedEntropySource_elapsed_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    ‖cumulativeProtectedEntropySource cfg ε M L p hn s k ω‖≤
      (s.1.val.2-(protectedRecycledPair cfg ε M L hn s k ω).1.1.val.2)*protectedEntropySourceCap n cfg.B :=
  (cumulativeProtectedEntropySource_norm_le_variation cfg ε M L p hn s k ω).trans
    (cumulativeProtectedEntropyVariation_elapsed_bound cfg ε M L hsp p hpL hn hB hm s k ω)

theorem cumulativeProtectedEntropySource_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    ‖cumulativeProtectedEntropySource cfg ε M L p hn s k ω‖≤(cfg.horizon:ℝ)*protectedEntropySourceCap n cfg.B :=
  (cumulativeProtectedEntropySource_elapsed_bound cfg ε M L hsp p hpL hn hB hm s k ω).trans
    (mul_le_mul_of_nonneg_right ((sub_le_self _
      (protectedRecycledPair cfg ε M L hn s k ω).1.1.property.2.1).trans s.1.property.2.2)
      (protectedEntropySourceCap_nonneg n cfg.B hB.le))

theorem cumulativeProtectedEntropySource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (k : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (cumulativeProtectedEntropySource cfg ε M L p hn s k) μ := by
  apply (integrable_const ((cfg.horizon:ℝ)*protectedEntropySourceCap n cfg.B)).mono'
    (cumulativeProtectedEntropySource_measurable cfg ε M L p hn s k).aestronglyMeasurable
  exact ae_of_all _ (cumulativeProtectedEntropySource_bound cfg ε M L hsp p hpL hn hB hm s k)

end NoThreeLine
#print axioms NoThreeLine.cumulativeProtectedEntropySource_stronglyAdapted
#print axioms NoThreeLine.cumulativeProtectedEntropyVariation_elapsed_bound
#print axioms NoThreeLine.cumulativeProtectedEntropySource_integrable
