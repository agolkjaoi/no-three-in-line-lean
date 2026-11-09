import NoThreeLine.ProtectedParameterCutPast

/-! The inserted-cut observation uses only before/after states and the past.
Strict interior cuts freeze the selected-flow value; the complementary
branch is exactly the next ordinary compensated observation. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedCutObservation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  protectedPastExponential cfg ε M L F V θ hn s k ω*
    protectedParameterCutExponential cfg G F V θ cut
      (((protectedRecycledPair cfg ε M L hn s k ω).1,
        (protectedRecycledPair cfg ε M L hn s (k+1) ω).1),param k ω)

def protectedCutReached {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ) (k : ℕ) : Set (BoardClockPath n) :=
  {ω | cut ((protectedRecycledPair cfg ε M L hn s k ω).1,param k ω)<
    (protectedRecycledPair cfg ε M L hn s k ω).1.1.val.2-
    (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1.val.2}

theorem protectedCutObservation_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ) (k : ℕ) (ω : BoardClockPath n) :
    0≤protectedCutObservation cfg ε M L G F V θ cut hn s param k ω :=
  mul_nonneg (Real.exp_nonneg _) (protectedCutPairExponential_nonneg cfg G F V θ _ _)

theorem protectedCutObservation_of_not_reached {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ) (k : ℕ) (ω : BoardClockPath n)
    (h : ω∉protectedCutReached cfg ε M L cut hn s param k) :
    protectedCutObservation cfg ε M L G F V θ cut hn s param k ω=
      protectedStateExponential cfg ε M L (fun v=>G (v.1.val.1.physical,v.2)) F V θ hn s (k+1) ω := by
  rw [protectedStateExponential_succ_factor]
  unfold protectedCutObservation protectedParameterCutExponential protectedCutPairExponential
  rw [if_pos (le_of_not_gt h)]

theorem protectedCutObservation_of_reached {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ) (k : ℕ) (ω : BoardClockPath n)
    (h : ω∈protectedCutReached cfg ε M L cut hn s param k) :
    protectedCutObservation cfg ε M L G F V θ cut hn s param k ω=
      protectedPastExponential cfg ε M L F V θ hn s k ω*
        protectedLocalStateExponential cfg G F V θ
          ((protectedRecycledPair cfg ε M L hn s k ω).1,
            cut ((protectedRecycledPair cfg ε M L hn s k ω).1,param k ω)) := by
  unfold protectedCutObservation protectedParameterCutExponential protectedCutPairExponential
  rw [if_neg (not_le.mpr h)]

theorem protectedCutObservation_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (hG : Measurable G) (hF : Measurable F) (hV : Measurable V)
    (cut : ProtectedTimedState cfg×ℝ→ℝ) (hc : Measurable cut) (hn : 0<n) (s : ProtectedTimedState cfg)
    (param : ℕ→BoardClockPath n→ℝ)
    (hp : ∀k,@Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance (param k))
    (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s (k+1)) inferInstance
      (protectedCutObservation cfg ε M L G F V θ cut hn s param k) ∧
    MeasurableSet[protectedStateFiltration cfg ε M L hn s (k+1)]
      (protectedCutReached cfg ε M L cut hn s param k) := by
  have hmono := (protectedStateFiltration cfg ε M L hn s).mono (Nat.le_succ k)
  have hb := (protectedState_measurable_history cfg ε M L hn s k).mono hmono le_rfl
  have ha := protectedState_measurable_history cfg ε M L hn s (k+1)
  have ht := (hp k).mono hmono le_rfl
  constructor
  · exact ((protectedPastExponential_measurable_history cfg ε M L F V θ hF hV hn s k).mono hmono le_rfl).mul
      ((protectedParameterCutExponential_measurable cfg G F V θ cut hG hF hV hc).comp ((hb.prodMk ha).prodMk ht))
  · exact measurableSet_lt (hc.comp (hb.prodMk ht))
      ((measurable_subtype_coe.snd.comp hb.fst).sub (measurable_subtype_coe.snd.comp ha.fst))

end NoThreeLine
#print axioms NoThreeLine.protectedCutObservation_history
#print axioms NoThreeLine.protectedCutObservation_of_not_reached
#print axioms NoThreeLine.protectedCutObservation_of_reached
