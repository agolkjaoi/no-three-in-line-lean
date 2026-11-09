import NoThreeLine.RootFreezeTerminal

/-! Starting with an active main root, the simultaneous saved snapshot has
zero credit whenever its own root is inactive. The first closing snapshot
is pre-resolution, so positive retirement is not inserted into this claim.
The result is pathwise at every finite iterate and at the total terminal
selector. It does not assert an active indicator identity under a point law. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine

theorem birthAccount_raw_inactive_credit_zero {n : ℕ}
    (Γ : Finset PrimitiveLines.ZPoint) (S : Finset (Grid n)) (p q : Grid n)
    (a : CreditAccount) (ha : a.status=.active)
    (hi : (birthAccount Γ S p q a false).status≠.active) :
    (birthAccount Γ S p q a false).credit=0 := by
  have hm : birthMultiplier Γ S p q=0 := by
    by_contra hm
    exact hi ((MixedConnection.birthAccount_active_iff Γ S p q a ha).mpr hm)
  rcases a with ⟨status,w⟩
  change status=.active at ha
  subst status
  rw [birthAccount_active_credit,hm,zero_mul]

theorem ProcessState.birth_raw_inactive_credit_zero {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (p q : Grid n)
    (hp : (s.accounts p).status=.active)
    (hi : ((s.birth Γ q (fun _=>false)).accounts p).status≠.active) :
    ((s.birth Γ q (fun _=>false)).accounts p).credit=0 := by
  unfold ProcessState.birth at hi ⊢
  split_ifs at hi ⊢
  · exact birthAccount_raw_inactive_credit_zero Γ s.selected p q (s.accounts p) hp hi
  · exact False.elim (hi hp)

theorem ExtendedState.candidateUpdate_raw_inactive_credit_zero {n : ℕ}
    (e : ExtendedState n) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ)
    (B : ℝ) (p q : Grid n) (mark : ℝ)
    (hp : (e.process.accounts p).status=.active)
    (hi : ((e.candidateUpdate Γ mask B q (fun _=>false) mark).process.accounts p).status≠.active) :
    ((e.candidateUpdate Γ mask B q (fun _=>false) mark).process.accounts p).credit=0 := by
  rw [candidateUpdate_eq] at hi ⊢
  split_ifs at hi ⊢
  · exact ProcessState.birth_raw_inactive_credit_zero e.process Γ p q hp hi
  · exact False.elim (hi hp)

theorem augRawOutcome_inactive_credit_zero_of_active {n : ℕ} (cfg : FlowConfig n)
    (ε M : ℝ) (x : AugmentedCappedInput cfg) (p : Grid n)
    (z : BirthWitness.CandidateData n)
    (hp : (x.1.1.val.process.accounts p).status=.active)
    (hi : ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).status≠.active) :
    ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).credit=0 := by
  have hpre : ((augPreState cfg ε M (x,z)).physical.process.accounts p).status=.active := hp
  unfold augRawOutcome at hi ⊢
  split_ifs at hi ⊢
  · exact ExtendedState.candidateUpdate_raw_inactive_credit_zero _ _ _ _ p _ _ hpre hi
  · exact False.elim (hi hpre)

namespace BirthWitness

theorem rawStepSaved_inactive_credit_zero_of_active {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (s : TimedObservation cfg) (p : Grid n) (z : CandidateData n)
    (hp : (s.1.val.1.physical.process.accounts p).status=.active)
    (hi : ((rawStepSaved cfg ε M start (s,z)).1.physical.process.accounts p).status≠.active) :
    ((rawStepSaved cfg ε M start (s,z)).1.physical.process.accounts p).credit=0 := by
  by_cases hd : observationDone cfg s
  · rw [rawStepSaved_done cfg ε M start (s,z) hd] at hi ⊢
    exact False.elim (hi hp)
  · simp only [rawStepSaved,if_neg hd] at hi ⊢
    exact augRawOutcome_inactive_credit_zero_of_active cfg ε M (augTimedInput cfg s.1) p z hp hi

def RootSavedActiveSupport {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : RootObservation cfg) : Prop :=
  (s.2.2.1.physical.process.accounts p).status≠.active →
    (s.2.2.1.physical.process.accounts p).credit=0

theorem rootObserverInitial_active_support {n : ℕ} (cfg : FlowConfig n)
    (p : Grid n) (s : TimedObservation cfg)
    (hp : (s.1.val.1.physical.process.accounts p).status=.active) :
    RootSavedActiveSupport cfg p (rootObserverInitial cfg p s) := by
  intro hi
  exact False.elim (hi hp)

theorem rootObserverStep_active_support {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (s : RootObservation cfg) (z : CandidateData n)
    (hs : RootObserverInvariant cfg p s) (hp : RootSavedActiveSupport cfg p s) :
    RootSavedActiveSupport cfg p (rootObserverStep cfg ε M start p (s,z)) := by
  by_cases hf : s.2.1=true
  · simpa only [RootSavedActiveSupport,rootObserverStep,if_pos hf] using hp
  · have ha : (s.1.1.val.1.physical.process.accounts p).status=.active := by
      by_contra ha
      exact hf (hs.closed_iff.mpr (Or.inr ha))
    by_cases hc : rootClosed cfg p (observedStep cfg ε M start (s.1,z))
    · simp only [RootSavedActiveSupport,rootObserverStep,if_neg hf,if_pos hc]
      exact rawStepSaved_inactive_credit_zero_of_active cfg ε M start s.1 p z ha
    · simp only [RootSavedActiveSupport,rootObserverStep,if_neg hf,if_neg hc]
      intro hi
      exact False.elim (hc (Or.inr hi))

theorem rootObserverRecycledPair_active_support {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n) (s : TimedObservation cfg)
    (hs : RecordsConsistent cfg s)
    (hp : (s.1.val.1.physical.process.accounts p).status=.active)
    (k : ℕ) (ω : BoardClockPath n) :
    RootSavedActiveSupport cfg p
      (rootObserverRecycledPair cfg ε M start p hn (rootObserverInitial cfg p s) k ω).1 := by
  induction k with
  | zero => exact rootObserverInitial_active_support cfg p s hp
  | succ k ih =>
      exact rootObserverStep_active_support cfg ε M start p _ _
        (rootObserverRecycledPair_invariant cfg ε M start p hn _
          (rootObserverInitial_invariant cfg p s hs) k ω) ih

theorem rootObserverTerminal_active_support {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n) (s : TimedObservation cfg)
    (hs : RecordsConsistent cfg s)
    (hp : (s.1.val.1.physical.process.accounts p).status=.active)
    (ω : BoardClockPath n) :
    RootSavedActiveSupport cfg p
      (rootObserverTerminal cfg ε M start p hn (rootObserverInitial cfg p s,ω)) :=
  rootObserverRecycledPair_active_support cfg ε M start p hn s hs hp _ ω

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.augRawOutcome_inactive_credit_zero_of_active
#print axioms NoThreeLine.BirthWitness.rootObserverStep_active_support
#print axioms NoThreeLine.BirthWitness.rootObserverRecycledPair_active_support
#print axioms NoThreeLine.BirthWitness.rootObserverTerminal_active_support
