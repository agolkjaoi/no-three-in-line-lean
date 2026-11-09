import NoThreeLine.ProtectedStateSourceHistory

/-! Actual signed state-source sums are adapted and have total variation
bounded by the real remaining-time drop, with no number-of-updates factor. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def cumulativeProtectedStateSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,protectedClockStateSource cfg ε M F hn (protectedRecycledPair cfg ε M L hn s j ω)

def cumulativeProtectedStateVariation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,‖protectedClockStateSource cfg ε M F hn (protectedRecycledPair cfg ε M L hn s j ω)‖

theorem cumulativeProtectedStateSource_succ {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeProtectedStateSource cfg ε M L F hn s (k+1) ω=
      cumulativeProtectedStateSource cfg ε M L F hn s k ω+
        protectedClockStateSource cfg ε M F hn (protectedRecycledPair cfg ε M L hn s k ω) :=
  Finset.sum_range_succ _ _

theorem cumulativeProtectedStateSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hF : Measurable F) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    Measurable (cumulativeProtectedStateSource cfg ε M L F hn s k) :=
  Finset.measurable_sum _ (fun j _=>(protectedClockStateSource_measurable cfg ε M F hF hn).comp
    (protectedRecycledPair_measurable cfg ε M L hn s j))

theorem cumulativeProtectedStateSource_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hF : Measurable F)
    (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance
      (cumulativeProtectedStateSource cfg ε M L F hn s k) := by
  apply Finset.measurable_sum
  intro j hj
  exact (protectedClockStateSource_measurable_history cfg ε M L F hF hn s j).mono
    ((protectedStateFiltration cfg ε M L hn s).mono (Nat.succ_le_of_lt (Finset.mem_range.mp hj))) le_rfl

theorem cumulativeProtectedStateSource_stronglyAdapted {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hF : Measurable F)
    (hn : 0<n) (s : ProtectedTimedState cfg) :
    StronglyAdapted (protectedStateFiltration cfg ε M L hn s) (cumulativeProtectedStateSource cfg ε M L F hn s) :=
  fun k=>(cumulativeProtectedStateSource_measurable_history cfg ε M L F hF hn s k).stronglyMeasurable

theorem cumulativeProtectedStateVariation_elapsed_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (C : ℝ)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (k : ℕ) (ω : BoardClockPath n) :
    cumulativeProtectedStateVariation cfg ε M L F hn s k ω≤
      (s.1.val.2-(protectedRecycledPair cfg ε M L hn s k ω).1.1.val.2)*C := by
  induction k with
  | zero => simp [cumulativeProtectedStateVariation,protectedRecycledPair,RecycledBoardProcess.iterate]
  | succ k ih =>
    let x := protectedRecycledPair cfg ε M L hn s k ω
    have hx (p) (hp : p∈E) := protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hE hp) hn s (hsv p hp) k ω
    have hb := protectedStateSource_elapsed_bound cfg ε M E F C hF x.1 hx (WinnerMarkLaw.firstMarkedRace hn x.2)
    rw [birthElapsed_eq_remaining_drop cfg ε M] at hb
    unfold cumulativeProtectedStateVariation
    rw [Finset.sum_range_succ]
    calc
      _ ≤ (s.1.val.2-x.1.1.val.2)*C+
          (x.1.1.val.2-(augTimedStep cfg ε M (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)).val.2)*C := add_le_add ih hb
      _ = _ := by
        change _=(s.1.val.2-(augTimedStep cfg ε M (x.1.1,WinnerMarkLaw.firstMarkedRace hn x.2)).val.2)*_
        ring

theorem cumulativeProtectedStateSource_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (C : ℝ) (hC : 0≤C)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (k : ℕ) (ω : BoardClockPath n) :
    ‖cumulativeProtectedStateSource cfg ε M L F hn s k ω‖≤(cfg.horizon:ℝ)*C := by
  have ht : ‖cumulativeProtectedStateSource cfg ε M L F hn s k ω‖≤
      cumulativeProtectedStateVariation cfg ε M L F hn s k ω := norm_sum_le _ _
  exact (ht.trans (cumulativeProtectedStateVariation_elapsed_bound cfg ε M L hsp E hE F C hF hn s hsv k ω)).trans
    (mul_le_mul_of_nonneg_right ((sub_le_self _
      (protectedRecycledPair cfg ε M L hn s k ω).1.1.property.2.1).trans s.1.property.2.2) hC)

theorem cumulativeProtectedStateSource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hFm : Measurable F) (C : ℝ) (hC : 0≤C)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (k : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (cumulativeProtectedStateSource cfg ε M L F hn s k) μ :=
  (integrable_const _).mono' (cumulativeProtectedStateSource_measurable cfg ε M L F hFm hn s k).aestronglyMeasurable
    (ae_of_all _ (fun ω=>cumulativeProtectedStateSource_bound cfg ε M L hsp E hE F C hC hF hn s hsv k ω))

end NoThreeLine
#print axioms NoThreeLine.cumulativeProtectedStateSource_stronglyAdapted
#print axioms NoThreeLine.cumulativeProtectedStateVariation_elapsed_bound
#print axioms NoThreeLine.cumulativeProtectedStateSource_integrable
