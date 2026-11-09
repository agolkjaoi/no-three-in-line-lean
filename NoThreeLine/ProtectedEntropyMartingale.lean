import NoThreeLine.ProtectedEntropyForbiddenHistory
import NoThreeLine.ProtectedEntropyAccumulation

/-! The entropy of actual saved protected credit minus its real running source is
a martingale under the constructed whole-phase forbidden-line law.
No conditional compensation identity is supplied as an assumption.
The signed source is the actual entropy drift minus the birth cost. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def compensatedProtectedEntropy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1-
    cumulativeProtectedEntropySource cfg ε M L p hn s k ω

theorem compensatedProtectedEntropy_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance
      (compensatedProtectedEntropy cfg ε M L p hn s k) :=
  ((protectedTimedEntropy_measurable cfg L p).comp (protectedState_measurable_history cfg ε M L hn s k)).sub
    (cumulativeProtectedEntropySource_measurable_history cfg ε M L p hn s k)

theorem protectedRecycledEntropy_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (fun ω=>protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((protectedTimedEntropy_measurable cfg L p).comp (protectedRecycledPair_measurable cfg ε M L hn s k).fst)
    (2*cfg.B) (fun ω=>protectedTimedEntropy_bounds_all cfg L hsp p hpL hB _
      (protectedRecycledPair_saved_bounds_all cfg ε M L hsp p hpL hn s hsv k ω))

theorem protectedClockRunningEntropySource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg) (k : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (fun ω=>protectedClockRunningEntropySource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω)) μ := by
  apply (integrable_const ((cfg.horizon:ℝ)*protectedEntropySourceCap n cfg.B)).mono'
    (((protectedClockRunningEntropySource_measurable cfg ε M L p hn).comp
      (protectedRecycledPair_measurable cfg ε M L hn s k)).aestronglyMeasurable)
  exact ae_of_all _ (fun ω=>protectedRunningEntropySource_bounds_all cfg ε M L hsp p hpL hB hm _ _)

theorem compensatedProtectedEntropy_martingale {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Martingale (compensatedProtectedEntropy cfg ε M L p hn s) (protectedStateFiltration cfg ε M L hn s)
      (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  let Q := phaseLineForbiddenLaw cfg ε M K L N hn s.1
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have hiC (j : ℕ) := protectedRecycledEntropy_integrable cfg ε M L hsp p hpL hn hB s hsv j Q
  have hiA (j : ℕ) := cumulativeProtectedEntropySource_integrable cfg ε M L hsp p hpL hn hB hm s j Q
  have hiR (j : ℕ) := protectedClockRunningEntropySource_integrable cfg ε M L hsp p hpL hn hB hm s j Q
  have hadp : StronglyAdapted (protectedStateFiltration cfg ε M L hn s)
      (compensatedProtectedEntropy cfg ε M L p hn s) :=
    fun j=>(compensatedProtectedEntropy_measurable_history cfg ε M L p hn s j).stronglyMeasurable
  have hi (j : ℕ) : Integrable (compensatedProtectedEntropy cfg ε M L p hn s j) Q := (hiC j).sub (hiA j)
  have heq (k : ℕ) (E : Set (BoardClockPath n))
      (hE : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] E) :
      (∫ω in E,compensatedProtectedEntropy cfg ε M L p hn s (k+1) ω ∂Q)=
        ∫ω in E,compensatedProtectedEntropy cfg ε M L p hn s k ω ∂Q := by
    have hh := protectedEntropyForbidden_history_compensation cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm
      s ho hk hsv k E hE
    change (∫ω in E,protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s (k+1) ω).1 ∂Q)=
      ∫ω in E,(protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1+
        protectedClockRunningEntropySource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω)) ∂Q at hh
    rw [integral_add (hiC k).integrableOn (hiR k).integrableOn] at hh
    have hiAR : Integrable (fun ω=>cumulativeProtectedEntropySource cfg ε M L p hn s k ω+
        protectedClockRunningEntropySource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω)) Q :=
      (hiA k).add (hiR k)
    simp only [compensatedProtectedEntropy]
    simp_rw [cumulativeProtectedEntropySource_succ]
    rw [integral_sub (hiC (k+1)).integrableOn hiAR.integrableOn,
      integral_add (hiA k).integrableOn (hiR k).integrableOn,
      integral_sub (hiC k).integrableOn (hiA k).integrableOn,hh]
    ring
  rw [martingale_iff]
  exact ⟨supermartingale_of_setIntegral_succ_le hadp hi (fun k E hE=>(heq k E hE).le),
    submartingale_of_setIntegral_le_succ hadp hi (fun k E hE=>(heq k E hE).ge)⟩

theorem compensatedProtectedEntropy_finite_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) :
    (∫ω,compensatedProtectedEntropy cfg ε M L p hn s k ω
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=protectedTimedEntropy cfg L p s := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have ht := (compensatedProtectedEntropy_martingale cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm
    s ho hk hsv).setIntegral_eq (Nat.zero_le k) MeasurableSet.univ
  simpa [compensatedProtectedEntropy,cumulativeProtectedEntropySource,protectedRecycledPair,RecycledBoardProcess.iterate] using ht.symm

end NoThreeLine

#print axioms NoThreeLine.compensatedProtectedEntropy_martingale
#print axioms NoThreeLine.compensatedProtectedEntropy_finite_mean
