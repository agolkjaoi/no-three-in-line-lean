import NoThreeLine.ProtectedWholeLinearMartingale

/-! The actual physical completion selector stabilizes every real
state-source accumulation, including signed sources and jump energy. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem cumulativeProtectedStateSource_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (F : ExtendedState n×(Grid n→ℝ)→ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀ᶠk in atTop,
      cumulativeProtectedStateSource cfg ε M L F hn s k ω=
        cumulativeProtectedStateSource cfg ε M L F hn s (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.1] with ω hω
  let J := augRecycledCompletionIndex cfg ε M hn s.1 ω
  have hd : AugTimedDone cfg (protectedRecycledPair cfg ε M L hn s J ω).1.1 := by
    rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s J ω)]
    exact hω
  have htail (j : ℕ) (hj : J≤j) : protectedClockStateSource cfg ε M F hn
      (protectedRecycledPair cfg ε M L hn s j ω)=0 := by
    have he := protectedRecycledPair_absorbing cfg ε M L hn s ω J hd j hj
    have hdone : birthDone cfg (protectedRecycledPair cfg ε M L hn s j ω).1.1 := by
      rw [he]
      exact (birthDone_iff cfg _).mpr hd
    change (protectedRecycledPair cfg ε M L hn s j ω).1.1.val.2≤0 ∨
      (protectedRecycledPair cfg ε M L hn s j ω).1.1.val.1.physical.process.stopped=true at hdone
    simp only [protectedClockStateSource,protectedRunningScalarSource,if_pos hdone]
  filter_upwards [eventually_ge_atTop J] with k hk
  change cumulativeProtectedStateSource cfg ε M L F hn s k ω=cumulativeProtectedStateSource cfg ε M L F hn s J ω
  induction k,hk using Nat.le_induction with
  | base => rfl
  | succ j hj ih => rw [cumulativeProtectedStateSource_succ,htail j hj,add_zero,ih]

theorem compensatedProtectedStateObservable_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (f : ProtectedTimedState cfg→ℝ)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀ᶠk in atTop,
      compensatedProtectedStateObservable cfg ε M L f F hn s k ω=
        compensatedProtectedStateObservable cfg ε M L f F hn s (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω := by
  filter_upwards [protectedRecycledTerminalPair_stable_ae cfg ε M L hn hB s,
    cumulativeProtectedStateSource_stable_ae cfg ε M L F hn hB s] with ω hp ha
  filter_upwards [hp,ha] with k hpk hak
  exact congrArg₂ (fun x y=>f x.1-y) hpk hak

theorem protectedCompletion_evaluate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : ProtectedTimedState cfg) (f : ℕ→BoardClockPath n→ℝ)
    (hf : ∀k,Measurable (f k)) :
    Measurable (fun ω=>f (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω) := by
  classical
  exact Measurable.find hf (fun k=>(augRecycledCompletionPredicate_measurable cfg ε M hn s.1 k).setOf)
    (augRecycledCompletionPredicate_exists cfg ε M hn s.1)

end NoThreeLine
#print axioms NoThreeLine.cumulativeProtectedStateSource_stable_ae
#print axioms NoThreeLine.compensatedProtectedStateObservable_stable_ae
