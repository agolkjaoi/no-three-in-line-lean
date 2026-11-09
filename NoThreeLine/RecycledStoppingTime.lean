import NoThreeLine.AugmentedRecycledMartingale

/-! First completion is a genuine extended-natural stopping time for the
actual state-history filtration. On noncompletion it is infinity, whereas
the total terminal selector uses a zero fallback only on that null set. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

def firstCompletion {Ω : Type*} (P : ℕ → Ω → Prop) (ω : Ω) : WithTop ℕ := by
  classical
  exact if h : ∃ k, P k ω then (Nat.find h : WithTop ℕ) else ⊤

theorem firstCompletion_le_iff {Ω : Type*} (P : ℕ → Ω → Prop) (ω : Ω) (k : ℕ) :
    firstCompletion P ω ≤ (k : WithTop ℕ) ↔ ∃ j, j ≤ k ∧ P j ω := by
  classical
  by_cases h : ∃ j, P j ω
  · rw [firstCompletion,dif_pos h]
    constructor
    · intro hk
      exact ⟨Nat.find h,WithTop.coe_le_coe.mp hk,Nat.find_spec h⟩
    · rintro ⟨j,hjk,hj⟩
      exact WithTop.coe_le_coe.mpr ((Nat.find_min' h hj).trans hjk)
  · rw [firstCompletion,dif_neg h]
    constructor
    · intro hk
      exact False.elim ((not_le_of_gt (WithTop.coe_lt_top k)) hk)
    · rintro ⟨j,hjk,hj⟩
      exact False.elim (h ⟨j,hj⟩)

def augRecycledCompletionTime {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) : BoardClockPath n → WithTop ℕ :=
  firstCompletion (fun k ω => AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1)

theorem augRecycledCompletionTime_le_iff {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) (k : ℕ) :
    augRecycledCompletionTime cfg ε M hn s ω ≤ (k : WithTop ℕ) ↔
      AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1 := by
  rw [augRecycledCompletionTime,firstCompletion_le_iff]
  constructor
  · rintro ⟨j,hjk,hj⟩
    rw [augRecycledPair_absorbing cfg ε M hn s ω j hj k hjk]
    exact hj
  · intro hk
    exact ⟨k,le_rfl,hk⟩

theorem augRecycledCompletionTime_isStoppingTime {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) :
    IsStoppingTime (augRecycledStateFiltration cfg ε M hn s) (augRecycledCompletionTime cfg ε M hn s) := by
  intro k
  have ht : Measurable (fun a : Fin (k+1) → AugTimedState cfg => AugTimedDone cfg (a (Fin.last k))) :=
    (augTimedDone_measurable cfg).comp (measurable_pi_apply (Fin.last k))
  have hm : Measurable[augRecycledStateFiltration cfg ε M hn s k]
      (fun ω => AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1) :=
    ht.comp (comap_measurable (StateHistory.history (fun j ω => (augRecycledPair cfg ε M hn s j ω).1) k))
  have hset : MeasurableSet[augRecycledStateFiltration cfg ε M hn s k]
      {ω | AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1} :=
    @Measurable.setOf (BoardClockPath n) (augRecycledStateFiltration cfg ε M hn s k) _ hm
  have he : {ω | augRecycledCompletionTime cfg ε M hn s ω ≤ (k : WithTop ℕ)} =
      {ω | AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1} := by
    ext ω
    exact augRecycledCompletionTime_le_iff cfg ε M hn s ω k
  change MeasurableSet[augRecycledStateFiltration cfg ε M hn s k]
    {ω | augRecycledCompletionTime cfg ε M hn s ω ≤ (k : WithTop ℕ)}
  exact he.symm ▸ hset

theorem augRecycledCompletionTime_eq_index_of_exists {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (ω : BoardClockPath n)
    (h : ∃ k, AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1) :
    augRecycledCompletionTime cfg ε M hn s ω = (augRecycledCompletionIndex cfg ε M hn s ω : WithTop ℕ) := by
  classical
  have hi : augRecycledCompletionIndex cfg ε M hn s ω = Nat.find h := by
    apply le_antisymm
    · exact Nat.find_min' (augRecycledCompletionPredicate_exists cfg ε M hn s ω) (Or.inl (Nat.find_spec h))
    · exact Nat.find_min' h (augRecycledTerminal_done_of_exists cfg ε M hn s ω h)
  rw [augRecycledCompletionTime,firstCompletion,dif_pos h,hi]

theorem augRecycledCompletionTime_finite_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), augRecycledCompletionTime cfg ε M hn s ω < ⊤ := by
  filter_upwards [augRecycledPair_completes_ae cfg ε M hn hB s] with ω hω
  rw [augRecycledCompletionTime_eq_index_of_exists cfg ε M hn s ω hω]
  exact WithTop.coe_lt_top _

theorem augRecycledCompletionTime_ae_eq_index {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    augRecycledCompletionTime cfg ε M hn s =ᵐ[boardClockMeasure n (cfg.B/n)]
      (fun ω => (augRecycledCompletionIndex cfg ε M hn s ω : WithTop ℕ)) := by
  filter_upwards [augRecycledPair_completes_ae cfg ε M hn hB s] with ω hω
  exact augRecycledCompletionTime_eq_index_of_exists cfg ε M hn s ω hω

end NoThreeLine

#print axioms NoThreeLine.augRecycledCompletionTime_isStoppingTime
#print axioms NoThreeLine.augRecycledCompletionTime_finite_ae
#print axioms NoThreeLine.augRecycledCompletionTime_ae_eq_index
