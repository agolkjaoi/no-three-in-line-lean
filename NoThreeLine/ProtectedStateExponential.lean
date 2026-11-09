import NoThreeLine.ProtectedPairExponential

/-! Actual accumulated-source and accumulated-energy exponentials. The
factorization uses the same recycled residual and real elapsed integrals. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedPastExponential {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (hn : 0<n)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  Real.exp (-θ*cumulativeProtectedStateSource cfg ε M L F hn s k ω-
    (θ^2/2)*cumulativeProtectedStateSource cfg ε M L V hn s k ω)

def protectedStateExponential {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (θ : ℝ) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  Real.exp (θ*(f (protectedRecycledPair cfg ε M L hn s k ω).1-
    cumulativeProtectedStateSource cfg ε M L F hn s k ω)-
    (θ^2/2)*cumulativeProtectedStateSource cfg ε M L V hn s k ω)

theorem protectedPastExponential_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (hF : Measurable F) (hV : Measurable V) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance
      (protectedPastExponential cfg ε M L F V θ hn s k) :=
  Real.measurable_exp.comp (((cumulativeProtectedStateSource_measurable_history cfg ε M L F hF hn s k).const_mul (-θ)).sub
    ((cumulativeProtectedStateSource_measurable_history cfg ε M L V hV hn s k).const_mul (θ^2/2)))

theorem protectedStateExponential_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (θ : ℝ) (hf : Measurable f) (hF : Measurable F) (hV : Measurable V)
    (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance
      (protectedStateExponential cfg ε M L f F V θ hn s k) :=
  Real.measurable_exp.comp ((((hf.comp (protectedState_measurable_history cfg ε M L hn s k)).sub
    (cumulativeProtectedStateSource_measurable_history cfg ε M L F hF hn s k)).const_mul θ).sub
    ((cumulativeProtectedStateSource_measurable_history cfg ε M L V hV hn s k).const_mul (θ^2/2)))

theorem protectedStateExponential_factor {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (θ : ℝ) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    protectedStateExponential cfg ε M L f F V θ hn s k ω=
      protectedPastExponential cfg ε M L F V θ hn s k ω*
        Real.exp (θ*f (protectedRecycledPair cfg ε M L hn s k ω).1) := by
  unfold protectedStateExponential protectedPastExponential
  rw [←Real.exp_add]
  congr 1
  ring

theorem protectedStateExponential_succ_factor {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (θ : ℝ) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    protectedStateExponential cfg ε M L f F V θ hn s (k+1) ω=
      protectedPastExponential cfg ε M L F V θ hn s k ω*
        protectedPairExponential cfg f F V θ ((protectedRecycledPair cfg ε M L hn s k ω).1,
          (protectedRecycledPair cfg ε M L hn s (k+1) ω).1) := by
  have he := protectedPairExponential_actual cfg ε M L f F V θ hn
    (protectedRecycledPair cfg ε M L hn s k ω).1 (protectedRecycledPair cfg ε M L hn s k ω).2
  have he' : protectedPairExponential cfg f F V θ ((protectedRecycledPair cfg ε M L hn s k ω).1,
      (protectedRecycledPair cfg ε M L hn s (k+1) ω).1)=
      Real.exp (θ*(f (protectedRecycledPair cfg ε M L hn s (k+1) ω).1-
        protectedClockStateSource cfg ε M F hn (protectedRecycledPair cfg ε M L hn s k ω))-
        (θ^2/2)*protectedClockStateSource cfg ε M V hn (protectedRecycledPair cfg ε M L hn s k ω)) := he
  rw [he']
  unfold protectedStateExponential protectedPastExponential
  rw [cumulativeProtectedStateSource_succ,cumulativeProtectedStateSource_succ,←Real.exp_add]
  congr 1
  ring

theorem protectedPastExponential_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ C W : ℝ) (hC : 0≤C) (hW : 0≤W)
    (hFC : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hVW : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖V (e,saved)‖≤W)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (k : ℕ) (ω : BoardClockPath n) :
    ‖protectedPastExponential cfg ε M L F V θ hn s k ω‖≤
      Real.exp (|θ| *((cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W)) := by
  have hF := cumulativeProtectedStateSource_bound cfg ε M L hsp E hE F C hC hFC hn s hsv k ω
  have hV := cumulativeProtectedStateSource_bound cfg ε M L hsp E hE V W hW hVW hn s hsv k ω
  have hc : 0≤θ^2/2 := by positivity
  unfold protectedPastExponential
  rw [Real.norm_eq_abs,abs_of_pos (Real.exp_pos _)]
  apply Real.exp_le_exp.mpr
  have h1 : -θ*cumulativeProtectedStateSource cfg ε M L F hn s k ω≤|θ| *((cfg.horizon:ℝ)*C) := by
    apply (le_abs_self _).trans
    rw [abs_mul,abs_neg]
    exact mul_le_mul_of_nonneg_left hF (abs_nonneg θ)
  have h2 : -((θ^2/2)*cumulativeProtectedStateSource cfg ε M L V hn s k ω)≤
      (θ^2/2)*((cfg.horizon:ℝ)*W) := by
    apply (neg_le_abs _).trans
    rw [abs_mul,abs_of_nonneg hc]
    exact mul_le_mul_of_nonneg_left hV hc
  linarith only [h1,h2]

end NoThreeLine
#print axioms NoThreeLine.protectedStateExponential_succ_factor
#print axioms NoThreeLine.protectedPastExponential_bound
