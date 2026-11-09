import NoThreeLine.ProtectedStateSourceForbidden

/-! The real whole-phase forbidden law compensates an actual bounded
observable by its actual accumulated source. Concrete sources are supplied
by the square applications, not postulated as stochastic brackets. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def compensatedProtectedStateObservable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (f : ProtectedTimedState cfg→ℝ) (F : ExtendedState n×(Grid n→ℝ)→ℝ)
    (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  f (protectedRecycledPair cfg ε M L hn s k ω).1-cumulativeProtectedStateSource cfg ε M L F hn s k ω

theorem compensatedProtectedStateObservable_martingale {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (S : Finset (Grid n)) (hS : S⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (f : ProtectedTimedState cfg→ℝ) (hfm : Measurable f)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hFm : Measurable F) (D C : ℝ) (hC : 0≤C)
    (hfD : ∀v : ProtectedTimedState cfg,(∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B)→‖f v‖≤D)
    (hFC : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈S,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hfirst : ∀v : ProtectedTimedState cfg,occupancy v.1.val.1.physical.process L≤1→
      v.1.val.1.physical.clocks L≤K→(∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B)→
      (∫ω,f (protectedRestartStep cfg ε M L hn (v,ω)).1 ∂firstLineForbiddenLaw cfg ε M L hn v.1)=
        ∫ω,(f v+protectedClockStateSource cfg ε M F hn (v,ω)) ∂firstLineForbiddenLaw cfg ε M L hn v.1)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈S,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Martingale (compensatedProtectedStateObservable cfg ε M L f F hn s) (protectedStateFiltration cfg ε M L hn s)
      (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  let Q := phaseLineForbiddenLaw cfg ε M K L N hn s.1
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have hv (j : ℕ) (ω : BoardClockPath n) (p) (hp : p∈S) :=
    protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hS hp) hn s (hsv p hp) j ω
  have hiC (j : ℕ) : Integrable (fun ω=>f (protectedRecycledPair cfg ε M L hn s j ω).1) Q :=
    (integrable_const D).mono' ((hfm.comp (protectedRecycledPair_measurable cfg ε M L hn s j).fst).aestronglyMeasurable)
      (ae_of_all _ (fun ω=>hfD _ (hv j ω)))
  have hiA (j : ℕ) := cumulativeProtectedStateSource_integrable cfg ε M L hsp S hS F hFm C hC hFC hn s hsv j Q
  have hiR (j : ℕ) : Integrable (fun ω=>protectedClockStateSource cfg ε M F hn (protectedRecycledPair cfg ε M L hn s j ω)) Q :=
    (integrable_const ((cfg.horizon:ℝ)*C)).mono'
      (((protectedClockStateSource_measurable cfg ε M F hFm hn).comp (protectedRecycledPair_measurable cfg ε M L hn s j)).aestronglyMeasurable)
      (ae_of_all _ (fun ω=>protectedClockStateSource_bound cfg ε M S F C hC hFC hn _ (hv j ω) _))
  have hadp : StronglyAdapted (protectedStateFiltration cfg ε M L hn s)
      (compensatedProtectedStateObservable cfg ε M L f F hn s) :=
    fun j=>((hfm.comp (protectedState_measurable_history cfg ε M L hn s j)).sub
      (cumulativeProtectedStateSource_measurable_history cfg ε M L F hFm hn s j)).stronglyMeasurable
  have hi (j : ℕ) : Integrable (compensatedProtectedStateObservable cfg ε M L f F hn s j) Q := (hiC j).sub (hiA j)
  have heq (k : ℕ) (A : Set (BoardClockPath n))
      (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
      (∫ω in A,compensatedProtectedStateObservable cfg ε M L f F hn s (k+1) ω ∂Q)=
        ∫ω in A,compensatedProtectedStateObservable cfg ε M L f F hn s k ω ∂Q := by
    have hh := protectedStateSourceForbidden_history_compensation cfg ε M K hKcfg hK L hsp N hN S hS hn hB
      f hfm F hFm D C hC hfD hFC hfirst hm s ho hk hsv k A hA
    change (∫ω in A,f (protectedRecycledPair cfg ε M L hn s (k+1) ω).1 ∂Q)=
      ∫ω in A,(f (protectedRecycledPair cfg ε M L hn s k ω).1+
        protectedClockStateSource cfg ε M F hn (protectedRecycledPair cfg ε M L hn s k ω)) ∂Q at hh
    rw [integral_add (hiC k).integrableOn (hiR k).integrableOn] at hh
    have hiAR : Integrable (fun ω=>cumulativeProtectedStateSource cfg ε M L F hn s k ω+
        protectedClockStateSource cfg ε M F hn (protectedRecycledPair cfg ε M L hn s k ω)) Q := (hiA k).add (hiR k)
    simp only [compensatedProtectedStateObservable]
    simp_rw [cumulativeProtectedStateSource_succ]
    rw [integral_sub (hiC (k+1)).integrableOn hiAR.integrableOn,
      integral_add (hiA k).integrableOn (hiR k).integrableOn,
      integral_sub (hiC k).integrableOn (hiA k).integrableOn,hh]
    ring
  rw [martingale_iff]
  exact ⟨supermartingale_of_setIntegral_succ_le hadp hi (fun k A hA=>(heq k A hA).le),
    submartingale_of_setIntegral_le_succ hadp hi (fun k A hA=>(heq k A hA).ge)⟩

end NoThreeLine
#print axioms NoThreeLine.compensatedProtectedStateObservable_martingale
