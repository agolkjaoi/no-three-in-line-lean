import NoThreeLine.ProtectedWholeExponentialSupermartingale
import NoThreeLine.NonnegativeSupermartingaleMaximal

/-! All-update energy-localized crossings for the actual whole observables.
The discrete index ranges over all real recycled updates; no time union factor. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedStateExponential_crossing {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (f : ProtectedTimedState cfg→ℝ) (F V : ExtendedState n×(Grid n→ℝ)→ℝ)
    (θ : ℝ) (hθ : 0≤θ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (μ : Measure (BoardClockPath n)) [IsProbabilityMeasure μ]
    (hX : Supermartingale (protectedStateExponential cfg ε M L f F V θ hn s)
      (protectedStateFiltration cfg ε M L hn s) μ) (r v : ℝ) :
    μ {ω | ∃k,r≤compensatedProtectedStateObservable cfg ε M L f F hn s k ω-f s ∧
      cumulativeProtectedStateSource cfg ε M L V hn s k ω≤v}≤
      ENNReal.ofReal (Real.exp (-θ*r+(θ^2/2)*v)) := by
  let a := θ^2/2
  have ha : 0≤a := by dsimp [a]; positivity
  let level := Real.exp (θ*(f s+r)-a*v)
  have hsub : {ω | ∃k,r≤compensatedProtectedStateObservable cfg ε M L f F hn s k ω-f s ∧
      cumulativeProtectedStateSource cfg ε M L V hn s k ω≤v}⊆
      {ω | ∃k,level≤protectedStateExponential cfg ε M L f F V θ hn s k ω} := by
    rintro ω ⟨k,hkr,hkv⟩
    refine ⟨k,Real.exp_le_exp.mpr ?_⟩
    change θ*(f s+r)-a*v≤θ*(compensatedProtectedStateObservable cfg ε M L f F hn s k ω)-
      a*cumulativeProtectedStateSource cfg ε M L V hn s k ω
    have h1 := mul_le_mul_of_nonneg_left (by linarith only [hkr] : f s+r≤
      compensatedProtectedStateObservable cfg ε M L f F hn s k ω) hθ
    have h2 := mul_le_mul_of_nonneg_left hkv ha
    linarith only [h1,h2]
  have hh := nonnegativeSupermartingale_maximal μ (protectedStateFiltration cfg ε M L hn s)
    (protectedStateExponential cfg ε M L f F V θ hn s) hX (fun _ _=>Real.exp_nonneg _) level (Real.exp_pos _)
  have hzero : (∫ω,protectedStateExponential cfg ε M L f F V θ hn s 0 ω ∂μ)=Real.exp (θ*f s) := by
    simp [protectedStateExponential,cumulativeProtectedStateSource,protectedRecycledPair,RecycledBoardProcess.iterate]
  rw [hzero] at hh
  have he : Real.exp (θ*f s)/level=Real.exp (-θ*r+(θ^2/2)*v) := by
    dsimp [level,a]
    rw [←Real.exp_sub]
    congr 1
    ring
  rw [he] at hh
  exact (measure_mono hsub).trans hh

theorem protectedCreditExponential_crossing {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (θ : ℝ) (hθ : 0≤θ) (r v : ℝ) :
    (phaseLineForbiddenLaw cfg ε M K L N hn s.1)
      {ω | ∃k,r≤compensatedProtectedCreditTotal cfg ε M L E hn s k ω-protectedTimedCreditTotal cfg L E s ∧
        cumulativeProtectedStateSource cfg ε M L (protectedCreditEnergyField cfg L E) hn s k ω≤v}≤
      ENNReal.ofReal (Real.exp (-θ*r+(θ^2/2)*v)) := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  exact protectedStateExponential_crossing cfg ε M L (protectedTimedCreditTotal cfg L E)
    (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ hθ hn s _
    (protectedCreditExponential_supermartingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv θ hθ) r v

theorem protectedEntropyExponential_crossing {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (θ : ℝ) (hθ : 0≤θ) (r v : ℝ) :
    (phaseLineForbiddenLaw cfg ε M K L N hn s.1)
      {ω | ∃k,r≤compensatedProtectedEntropyTotal cfg ε M L E hn s k ω-protectedTimedEntropyTotal cfg L E s ∧
        cumulativeProtectedStateSource cfg ε M L (protectedEntropyEnergyField cfg L E) hn s k ω≤v}≤
      ENNReal.ofReal (Real.exp (-θ*r+(θ^2/2)*v)) := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  exact protectedStateExponential_crossing cfg ε M L (protectedTimedEntropyTotal cfg L E)
    (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ hθ hn s _
    (protectedEntropyExponential_supermartingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv θ hθ) r v

end NoThreeLine
#print axioms NoThreeLine.protectedCreditExponential_crossing
#print axioms NoThreeLine.protectedEntropyExponential_crossing
