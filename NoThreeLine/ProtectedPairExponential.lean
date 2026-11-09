import NoThreeLine.ProtectedWholeEnergyHistory
import NoThreeLine.ProtectedExponentialFirstMean

/-! Joint two-state reconstruction and uniform finite caps for an
exponential compensated by actual source and whole-event energy. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedPairExponential {n : ℕ} (cfg : FlowConfig n)
    (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (θ : ℝ) (x : ProtectedTimedState cfg×ProtectedTimedState cfg) : ℝ :=
  Real.exp (θ*(f x.2-protectedStatePairGenericSource cfg F x)-
    (θ^2/2)*protectedStatePairGenericSource cfg V x)

theorem protectedPairExponential_measurable {n : ℕ} (cfg : FlowConfig n)
    (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (θ : ℝ) (hf : Measurable f) (hF : Measurable F) (hV : Measurable V) :
    Measurable (protectedPairExponential cfg f F V θ) :=
  Real.measurable_exp.comp ((((hf.comp measurable_snd).sub
    (protectedStatePairGenericSource_measurable cfg F hF)).const_mul θ).sub
    ((protectedStatePairGenericSource_measurable cfg V hV).const_mul (θ^2/2)))

theorem protectedPairExponential_actual {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (θ : ℝ) (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n) :
    protectedPairExponential cfg f F V θ (s,(protectedRestartStep cfg ε M L hn (s,ω)).1)=
      Real.exp (θ*(f (protectedRestartStep cfg ε M L hn (s,ω)).1-
        protectedClockStateSource cfg ε M F hn (s,ω))-
          (θ^2/2)*protectedClockStateSource cfg ε M V hn (s,ω)) := by
  unfold protectedPairExponential
  have hF : protectedStatePairGenericSource cfg F (s,(protectedRestartStep cfg ε M L hn (s,ω)).1)=
      protectedClockStateSource cfg ε M F hn (s,ω) :=
    protectedStatePairGenericSource_actual cfg ε M L F s (WinnerMarkLaw.firstMarkedRace hn ω)
  have hV : protectedStatePairGenericSource cfg V (s,(protectedRestartStep cfg ε M L hn (s,ω)).1)=
      protectedClockStateSource cfg ε M V hn (s,ω) :=
    protectedStatePairGenericSource_actual cfg ε M L V s (WinnerMarkLaw.firstMarkedRace hn ω)
  rw [hF,hV]

theorem protectedPairExponential_actual_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (θ D C W : ℝ) (hC : 0≤C) (hW : 0≤W)
    (hf : ∀s : ProtectedTimedState cfg,(∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)→‖f s‖≤D)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hV : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖V (e,saved)‖≤W)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (ω : BoardClockPath n) :
    0≤protectedPairExponential cfg f F V θ (s,(protectedRestartStep cfg ε M L hn (s,ω)).1) ∧
      protectedPairExponential cfg f F V θ (s,(protectedRestartStep cfg ε M L hn (s,ω)).1)≤
        Real.exp (|θ| *(D+(cfg.horizon:ℝ)*C)+(θ^2/2)*((cfg.horizon:ℝ)*W)) := by
  rw [protectedPairExponential_actual]
  have hnxt := hf (protectedRestartStep cfg ε M L hn (s,ω)).1
    (fun p hp=>protectedLineSave_timed_bounds_all cfg ε M L hsp p (hE hp) s (hsv p hp) _)
  have hr := protectedClockStateSource_bound cfg ε M E F C hC hF hn s hsv ω
  have hv := protectedClockStateSource_bound cfg ε M E V W hW hV hn s hsv ω
  have hnrm := (norm_sub_le (f (protectedRestartStep cfg ε M L hn (s,ω)).1)
    (protectedClockStateSource cfg ε M F hn (s,ω))).trans (add_le_add hnxt hr)
  have hθ : θ*(f (protectedRestartStep cfg ε M L hn (s,ω)).1-
      protectedClockStateSource cfg ε M F hn (s,ω))≤|θ| *(D+(cfg.horizon:ℝ)*C) := by
    apply (le_abs_self _).trans
    rw [abs_mul]
    exact mul_le_mul_of_nonneg_left (by simpa only [Real.norm_eq_abs] using hnrm) (abs_nonneg θ)
  have hc : 0≤θ^2/2 := by positivity
  have hv' : -((θ^2/2)*protectedClockStateSource cfg ε M V hn (s,ω))≤(θ^2/2)*((cfg.horizon:ℝ)*W) := by
    apply (neg_le_abs _).trans
    rw [abs_mul,abs_of_nonneg hc]
    exact mul_le_mul_of_nonneg_left (by simpa only [Real.norm_eq_abs] using hv) hc
  exact ⟨Real.exp_nonneg _,Real.exp_le_exp.mpr (by linarith only [hθ,hv'])⟩

theorem protectedPairCreditExponential_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (θ : ℝ) (hθ : 0≤θ) :
    (∫ω,protectedPairExponential cfg (protectedTimedCreditTotal cfg L E)
      (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ
      (s,(protectedRestartStep cfg ε M L hn (s,ω)).1) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤
      Real.exp (θ*protectedTimedCreditTotal cfg L E s) := by
  simp_rw [protectedPairExponential_actual]
  exact firstLineForbiddenLaw_protectedCreditExp_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv θ hθ

theorem protectedPairEntropyExponential_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (θ : ℝ) (hθ : 0≤θ) :
    (∫ω,protectedPairExponential cfg (protectedTimedEntropyTotal cfg L E)
      (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ
      (s,(protectedRestartStep cfg ε M L hn (s,ω)).1) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤
      Real.exp (θ*protectedTimedEntropyTotal cfg L E s) := by
  simp_rw [protectedPairExponential_actual]
  exact firstLineForbiddenLaw_protectedEntropyExp_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv θ hθ

end NoThreeLine
#print axioms NoThreeLine.protectedPairCreditExponential_first_mean
#print axioms NoThreeLine.protectedPairEntropyExponential_first_mean
