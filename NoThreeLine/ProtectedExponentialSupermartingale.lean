import NoThreeLine.ProtectedExponentialKernelHistory
import NoThreeLine.ProtectedStateExponential
import NoThreeLine.HistoryWeightedIntegralLE

/-! Past compensation factors are pulled through actual history inequalities.
No independence of a residual clock under the forbidden law is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedStateExponential_supermartingale {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (hf : Measurable f) (hF : Measurable F) (hV : Measurable V)
    (θ D C W : ℝ) (hC : 0≤C) (hW : 0≤W)
    (hfD : ∀s : ProtectedTimedState cfg,(∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)→‖f s‖≤D)
    (hFC : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hVW : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖V (e,saved)‖≤W)
    (hfirst : ∀v : ProtectedTimedState cfg,occupancy v.1.val.1.physical.process L≤1→
      v.1.val.1.physical.clocks L≤K→(∀p∈E,0≤v.2 p ∧ v.2 p≤2*cfg.B)→
      (∫ω,protectedPairExponential cfg f F V θ (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)
        ∂firstLineForbiddenLaw cfg ε M L hn v.1)≤Real.exp (θ*f v))
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Supermartingale (protectedStateExponential cfg ε M L f F V θ hn s)
      (protectedStateFiltration cfg ε M L hn s) (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  let Q := phaseLineForbiddenLaw cfg ε M K L N hn s.1
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  let P := Real.exp (|θ| *((cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W))
  let R := Real.exp (|θ| *D)
  have hv (j : ℕ) (ω : BoardClockPath n) (p) (hp : p∈E) :=
    protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hE hp) hn s (hsv p hp) j ω
  have hp (j : ℕ) (ω : BoardClockPath n) :
      ‖protectedPastExponential cfg ε M L F V θ hn s j ω‖≤P :=
    protectedPastExponential_bound cfg ε M L hsp E hE F V θ C W hC hW hFC hVW hn s hsv j ω
  have hr (j : ℕ) (ω : BoardClockPath n) :
      ‖Real.exp (θ*f (protectedRecycledPair cfg ε M L hn s j ω).1)‖≤R := by
    rw [Real.norm_eq_abs,abs_of_pos (Real.exp_pos _)]
    apply Real.exp_le_exp.mpr
    apply (le_abs_self _).trans
    rw [abs_mul]
    exact mul_le_mul_of_nonneg_left (hfD _ (hv j ω)) (abs_nonneg θ)
  have hx (j : ℕ) (ω : BoardClockPath n) :
      ‖protectedStateExponential cfg ε M L f F V θ hn s j ω‖≤P*R := by
    rw [protectedStateExponential_factor,norm_mul]
    exact mul_le_mul (hp j ω) (hr j ω) (norm_nonneg _) (Real.exp_nonneg _)
  have hmX (j : ℕ) := protectedStateExponential_measurable_history cfg ε M L f F V θ hf hF hV hn s j
  have hiX (j : ℕ) : Integrable (protectedStateExponential cfg ε M L f F V θ hn s j) Q :=
    (integrable_const (P*R)).mono' ((hmX j).mono
      ((protectedStateFiltration cfg ε M L hn s).le j) le_rfl).aestronglyMeasurable (ae_of_all _ (hx j))
  apply supermartingale_of_setIntegral_succ_le (fun j=>(hmX j).stronglyMeasurable) hiX
  intro k A hA
  let b := fun ω=>protectedPairExponential cfg f F V θ
    ((protectedRecycledPair cfg ε M L hn s k ω).1,(protectedRecycledPair cfg ε M L hn s (k+1) ω).1)
  let c := fun ω=>Real.exp (θ*f (protectedRecycledPair cfg ε M L hn s k ω).1)
  have hbm : Measurable b := (protectedPairExponential_measurable cfg f F V θ hf hF hV).comp
    ((protectedRecycledPair_measurable cfg ε M L hn s k).fst.prodMk
      (protectedRecycledPair_measurable cfg ε M L hn s (k+1)).fst)
  have hb (ω : BoardClockPath n) : ‖b ω‖≤
      Real.exp (|θ| *(D+(cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W)) := by
    have h := protectedPairExponential_actual_bound cfg ε M L hsp E hE f F V θ D C W hC hW
      hfD hFC hVW hn (protectedRecycledPair cfg ε M L hn s k ω).1 (hv k ω)
      (protectedRecycledPair cfg ε M L hn s k ω).2
    have h0 : 0≤b ω := h.1
    rw [Real.norm_eq_abs,abs_of_nonneg h0]
    exact h.2
  have hbi : Integrable b Q := (integrable_const _).mono' hbm.aestronglyMeasurable (ae_of_all _ hb)
  have hci : Integrable c Q := (integrable_const R).mono'
    (Real.measurable_exp.comp ((hf.comp (protectedRecycledPair_measurable cfg ε M L hn s k).fst).const_mul θ)).aestronglyMeasurable
    (ae_of_all _ (hr k))
  have hle := history_weighted_setIntegral_le Q (protectedStateFiltration cfg ε M L hn s k)
    ((protectedStateFiltration cfg ε M L hn s).le k)
    (protectedPastExponential cfg ε M L F V θ hn s k)
    (protectedPastExponential_measurable_history cfg ε M L F V θ hF hV hn s k)
    P (hp k) (fun _=>Real.exp_nonneg _) b c hbi hci
    (protectedExponentialKernel_history_integral_le cfg ε M K hKcfg hK L hsp N hN E hE hn hB
      f F V hf hF hV θ D C W hC hW hfD hFC hVW hfirst hm s ho hk hsv k) A hA
  simpa only [protectedStateExponential_succ_factor,protectedStateExponential_factor] using hle

end NoThreeLine
#print axioms NoThreeLine.protectedStateExponential_supermartingale
