import NoThreeLine.ProtectedForbiddenHistory
import NoThreeLine.ProtectedRunningAccumulation

/-! The actual saved protected credit minus its real running source is
a martingale under the constructed whole-phase forbidden-line law.
No conditional compensation identity is supplied as an assumption. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def compensatedProtectedCredit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1-
    cumulativeProtectedSource cfg ε M L p hn s k ω

theorem compensatedProtectedCredit_measurable_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) :
    @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance
      (compensatedProtectedCredit cfg ε M L p hn s k) :=
  ((protectedTimedCredit_measurable cfg L p).comp (protectedState_measurable_history cfg ε M L hn s k)).sub
    (cumulativeProtectedSource_measurable_history cfg ε M L p hn s k)

theorem protectedRecycledCredit_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (fun ω=>protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((protectedTimedCredit_measurable cfg L p).comp (protectedRecycledPair_measurable cfg ε M L hn s k).fst)
    (2*cfg.B) (protectedRecycledPair_credit_bounds_all cfg ε M L hsp p hpL hn s hsv k)

theorem protectedClockRunningSource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg) (k : ℕ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (fun ω=>protectedClockRunningSource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω)) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((protectedClockRunningSource_measurable cfg ε M L p hn).comp (protectedRecycledPair_measurable cfg ε M L hn s k))
    ((cfg.horizon:ℝ)*((cfg.B/n)*cfg.B))
    (fun ω=>protectedRunningSource_bounds_all cfg ε M L hsp p hpL hB hm _)

theorem compensatedProtectedCredit_martingale {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Martingale (compensatedProtectedCredit cfg ε M L p hn s) (protectedStateFiltration cfg ε M L hn s)
      (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  let Q := phaseLineForbiddenLaw cfg ε M K L N hn s.1
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have hiC (j : ℕ) := protectedRecycledCredit_integrable cfg ε M L hsp p hpL hn s hsv j Q
  have hiA (j : ℕ) := cumulativeProtectedSource_integrable cfg ε M L hsp p hpL hn hB.le hm s j Q
  have hiR (j : ℕ) := protectedClockRunningSource_integrable cfg ε M L hsp p hpL hn hB.le hm s j Q
  have hadp : StronglyAdapted (protectedStateFiltration cfg ε M L hn s)
      (compensatedProtectedCredit cfg ε M L p hn s) :=
    fun j=>(compensatedProtectedCredit_measurable_history cfg ε M L p hn s j).stronglyMeasurable
  have hi (j : ℕ) : Integrable (compensatedProtectedCredit cfg ε M L p hn s j) Q := (hiC j).sub (hiA j)
  have heq (k : ℕ) (E : Set (BoardClockPath n))
      (hE : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] E) :
      (∫ω in E,compensatedProtectedCredit cfg ε M L p hn s (k+1) ω ∂Q)=
        ∫ω in E,compensatedProtectedCredit cfg ε M L p hn s k ω ∂Q := by
    have hh := protectedForbidden_history_compensation cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm
      s ho hk hsv k E hE
    change (∫ω in E,protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s (k+1) ω).1 ∂Q)=
      ∫ω in E,(protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1+
        protectedClockRunningSource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω)) ∂Q at hh
    rw [integral_add (hiC k).integrableOn (hiR k).integrableOn] at hh
    have hiAR : Integrable (fun ω=>cumulativeProtectedSource cfg ε M L p hn s k ω+
        protectedClockRunningSource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω)) Q :=
      (hiA k).add (hiR k)
    simp only [compensatedProtectedCredit]
    simp_rw [cumulativeProtectedSource_succ]
    rw [integral_sub (hiC (k+1)).integrableOn hiAR.integrableOn,
      integral_add (hiA k).integrableOn (hiR k).integrableOn,
      integral_sub (hiC k).integrableOn (hiA k).integrableOn,hh]
    ring
  rw [martingale_iff]
  exact ⟨supermartingale_of_setIntegral_succ_le hadp hi (fun k E hE=>(heq k E hE).le),
    submartingale_of_setIntegral_le_succ hadp hi (fun k E hE=>(heq k E hE).ge)⟩

theorem compensatedProtectedCredit_finite_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) :
    (∫ω,compensatedProtectedCredit cfg ε M L p hn s k ω
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=protectedTimedCredit cfg L p s := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have ht := (compensatedProtectedCredit_martingale cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm
    s ho hk hsv).setIntegral_eq (Nat.zero_le k) MeasurableSet.univ
  simpa [compensatedProtectedCredit,cumulativeProtectedSource,protectedRecycledPair,RecycledBoardProcess.iterate] using ht.symm

end NoThreeLine

#print axioms NoThreeLine.compensatedProtectedCredit_martingale
#print axioms NoThreeLine.compensatedProtectedCredit_finite_mean
