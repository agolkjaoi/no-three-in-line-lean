import NoThreeLine.RootPhaseHistoryEstimate

/-! Finite scheduled-phase S7 accumulation for the actual saved-root
observer. The source increment is the actual ordinary running source on
that phase's actual remaining original board. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open PrimitiveLines

def rootPhaseSourceIncrement {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) (j : ℕ) (ω : BoardClockPath n) : ℝ :=
  phaseRootActualSource (cs j).config ε M (phaseEndpoint cs start j) p e C D L hn
    (rootPhaseRecycledState cs ε M deadline start p hn s j ω,
      (rootPhaseRecycledPair cs ε M deadline start p hn s j ω).2)

theorem rootPhaseSourceIncrement_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) (j : ℕ) :
    Measurable (rootPhaseSourceIncrement cs ε M deadline start p hn e C D L s j) :=
  (phaseRootActualSource_measurable (cs j).config ε M _ p e C D L hn).comp
    ((rootPhaseRecycledPair_measurable cs ε M deadline start p hn s j).fst.snd.prodMk
      (rootPhaseRecycledPair_measurable cs ε M deadline start p hn s j).snd)

theorem rootPhaseSourceIncrement_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) (j : ℕ)
    (hK : (cs j).K<2) (ω : BoardClockPath n) :
    0≤rootPhaseSourceIncrement cs ε M deadline start p hn e C D L s j ω ∧
      rootPhaseSourceIncrement cs ε M deadline start p hn e C D L s j ω≤
        (cs j).horizon*sourceCap (cs j).directions C D B (cs j).K :=
  phaseRootActualSource_bounds (cs j).config ε M _ p e C D L hn (cs j).mask_le_one hK _

theorem rootPhaseSourceIncrement_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) (j : ℕ)
    (hK : (cs j).K<2) :
    Integrable (rootPhaseSourceIncrement cs ε M deadline start p hn e C D L s j) (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (rootPhaseSourceIncrement_measurable cs ε M deadline start p hn e C D L s j) _
    (rootPhaseSourceIncrement_bounds cs ε M deadline start p hn e C D L s j hK)

def cumulativeRootPhaseSource {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,rootPhaseSourceIncrement cs ε M deadline start p hn e C D L s j ω

theorem cumulativeRootPhaseSource_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) (k : ℕ)
    (hK : ∀j,(cs j).K<2) :
    Integrable (cumulativeRootPhaseSource cs ε M deadline start p hn e C D L s k) (boardClockMeasure n (B/n)) :=
  integrable_finset_sum _ (fun j _=>rootPhaseSourceIncrement_integrable cs ε M deadline start p hn hB e C D L s j (hK j))

theorem cumulativeRootPhaseSource_succ {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) (k : ℕ) (ω : BoardClockPath n) :
    cumulativeRootPhaseSource cs ε M deadline start p hn e C D L s (k+1) ω=
      cumulativeRootPhaseSource cs ε M deadline start p hn e C D L s k ω+
      rootPhaseSourceIncrement cs ε M deadline start p hn e C D L s k ω := Finset.sum_range_succ _ _

theorem rootPhaseMixed_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) (k : ℕ) :
    Integrable (fun ω=>goodPhaseRootMixed p Γ e C D L (rootPhaseRecycledState cs ε M deadline start p hn s k ω))
      (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((goodPhaseRootMixed_measurable p Γ e C D L).comp
      (rootPhaseRecycledPair_measurable cs ε M deadline start p hn s k).fst.snd) _
    (fun _=>goodPhaseRootMixed_bounds p Γ e C D L _)

theorem rootPhase_expected_mixed_cumulative {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (Γ : Finset ZPoint) (e : Retention n) (C D L : Finset (Grid n))
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hCL : C⊆L) (hCD : Disjoint C D)
    (s : GoodPhaseRootObservation n B p) (k : ℕ) :
    (∫ω,goodPhaseRootMixed p Γ e C D L (rootPhaseRecycledState cs ε M deadline start p hn s k ω)
      ∂boardClockMeasure n (B/n))≤goodPhaseRootMixed p Γ e C D L s+
      ∫ω,cumulativeRootPhaseSource cs ε M deadline start p hn e C D L s k ω ∂boardClockMeasure n (B/n) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  induction k with
  | zero =>
    simp only [rootPhaseRecycledState,rootPhaseRecycledPair,RecycledBoardProcess.iterate,
      cumulativeRootPhaseSource,Finset.range_zero,Finset.sum_empty,integral_const,probReal_univ,one_smul,integral_zero,add_zero,le_refl]
  | succ k ih =>
    have h := rootPhase_running_history_estimate cs ε M deadline start p hn hB Γ e C D L s k
      (hΓ k) (hK k) hCL hCD univ MeasurableSet.univ
    simp only [preimage_univ,setIntegral_univ] at h
    change _≤∫ω,goodPhaseRootMixed p Γ e C D L (rootPhaseRecycledState cs ε M deadline start p hn s k ω)+
      rootPhaseSourceIncrement cs ε M deadline start p hn e C D L s k ω ∂boardClockMeasure n (B/n) at h
    rw [integral_add (rootPhaseMixed_integrable cs ε M deadline start p hn hB Γ e C D L s k)
      (rootPhaseSourceIncrement_integrable cs ε M deadline start p hn hB e C D L s k (hK k))] at h
    simp_rw [cumulativeRootPhaseSource_succ]
    rw [integral_add (cumulativeRootPhaseSource_integrable cs ε M deadline start p hn hB e C D L s k hK)
      (rootPhaseSourceIncrement_integrable cs ε M deadline start p hn hB e C D L s k (hK k))]
    exact h.trans (by linarith)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.rootPhase_expected_mixed_cumulative
