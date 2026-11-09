import NoThreeLine.ProtectedCompensatedMartingale

/-! The original physical completion selector also closes the real
protected compensation martingale. The terminal source is its actual
finite sum of elapsed running integrals. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def terminalCompensatedProtectedCredit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  compensatedProtectedCredit cfg ε M L p hn s (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω

theorem terminalCompensatedProtectedCredit_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (s : ProtectedTimedState cfg) :
    Measurable (terminalCompensatedProtectedCredit cfg ε M L p hn s) := by
  classical
  exact Measurable.find
    (fun k=>(compensatedProtectedCredit_measurable_history cfg ε M L p hn s k).mono
      ((protectedStateFiltration cfg ε M L hn s).le k) le_rfl)
    (fun k=>(augRecycledCompletionPredicate_measurable cfg ε M hn s.1 k).setOf)
    (augRecycledCompletionPredicate_exists cfg ε M hn s.1)

theorem compensatedProtectedCredit_norm_bound {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hn : 0<n) (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (ω : BoardClockPath n) :
    ‖compensatedProtectedCredit cfg ε M L p hn s k ω‖≤2*cfg.B+(cfg.horizon:ℝ)*((cfg.B/n)*cfg.B) := by
  have hc := protectedRecycledPair_credit_bounds_all cfg ε M L hsp p hpL hn s hsv k ω
  have ha := cumulativeProtectedSource_bounds cfg ε M L hsp p hpL hn hB hm s k ω
  exact (norm_sub_le _ _).trans (by
    simpa only [Real.norm_eq_abs,abs_of_nonneg hc.1,abs_of_nonneg ha.1] using add_le_add hc.2 ha.2)

theorem cumulativeProtectedSource_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀ᶠk in atTop,
      cumulativeProtectedSource cfg ε M L p hn s k ω=
        cumulativeProtectedSource cfg ε M L p hn s (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.1] with ω hω
  let N := augRecycledCompletionIndex cfg ε M hn s.1 ω
  have hd : AugTimedDone cfg (protectedRecycledPair cfg ε M L hn s N ω).1.1 := by
    rw [congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s N ω)]
    exact hω
  have htail (j : ℕ) (hj : N≤j) : protectedClockRunningSource cfg ε M L p hn
      (protectedRecycledPair cfg ε M L hn s j ω)=0 := by
    have he := protectedRecycledPair_absorbing cfg ε M L hn s ω N hd j hj
    have hdone : birthDone cfg (protectedRecycledPair cfg ε M L hn s j ω).1.1 := by
      rw [he]
      exact (birthDone_iff cfg _).mpr hd
    change (protectedRecycledPair cfg ε M L hn s j ω).1.1.val.2≤0 ∨
      (protectedRecycledPair cfg ε M L hn s j ω).1.1.val.1.physical.process.stopped=true at hdone
    simp only [protectedClockRunningSource,protectedRunningSource,if_pos hdone]
  filter_upwards [eventually_ge_atTop N] with k hk
  change cumulativeProtectedSource cfg ε M L p hn s k ω=cumulativeProtectedSource cfg ε M L p hn s N ω
  induction k,hk using Nat.le_induction with
  | base => rfl
  | succ j hj ih => rw [cumulativeProtectedSource_succ,htail j hj,add_zero,ih]

theorem compensatedProtectedCredit_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀ᶠk in atTop,
      compensatedProtectedCredit cfg ε M L p hn s k ω=terminalCompensatedProtectedCredit cfg ε M L p hn s ω := by
  filter_upwards [protectedRecycledTerminalPair_stable_ae cfg ε M L hn hB s,
    cumulativeProtectedSource_stable_ae cfg ε M L p hn hB s] with ω hp ha
  filter_upwards [hp,ha] with k hpk hak
  exact congrArg₂ (fun x y=>protectedTimedCredit cfg L p x.1-y) hpk hak

theorem terminalCompensatedProtectedCredit_condExp {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) :
    condExp (protectedStateFiltration cfg ε M L hn s k) (phaseLineForbiddenLaw cfg ε M K L N hn s.1)
      (terminalCompensatedProtectedCredit cfg ε M L p hn s)=ᵐ[phaseLineForbiddenLaw cfg ε M K L N hn s.1]
        compensatedProtectedCredit cfg ε M L p hn s k := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  apply martingale_terminal_condExp _ (protectedStateFiltration cfg ε M L hn s)
    (compensatedProtectedCredit cfg ε M L p hn s)
    (compensatedProtectedCredit_martingale cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm s ho hk hsv)
    (2*cfg.B+(cfg.horizon:ℝ)*((cfg.B/n)*cfg.B))
  · exact compensatedProtectedCredit_norm_bound cfg ε M L hsp p hpL hn hB.le hm s hsv
  · apply (integrable_const _).mono' (terminalCompensatedProtectedCredit_measurable cfg ε M L p hn s).aestronglyMeasurable
    exact ae_of_all _ (fun ω=>compensatedProtectedCredit_norm_bound cfg ε M L hsp p hpL hn hB.le hm s hsv _ ω)
  · exact (phaseLineForbiddenLaw_absolutelyContinuous cfg ε M K L N hn s.1).ae_le
      (compensatedProtectedCredit_stable_ae cfg ε M L p hn hB s)

theorem terminalCompensatedProtectedCredit_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,terminalCompensatedProtectedCredit cfg ε M L p hn s ω
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=protectedTimedCredit cfg L p s := by
  let Q := phaseLineForbiddenLaw cfg ε M K L N hn s.1
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have hc := terminalCompensatedProtectedCredit_condExp cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm s ho hk hsv 0
  calc
    _ = ∫ω,condExp (protectedStateFiltration cfg ε M L hn s 0) Q
        (terminalCompensatedProtectedCredit cfg ε M L p hn s) ω ∂Q :=
      (integral_condExp ((protectedStateFiltration cfg ε M L hn s).le 0)).symm
    _ = ∫ω,compensatedProtectedCredit cfg ε M L p hn s 0 ω ∂Q := integral_congr_ae hc
    _ = _ := compensatedProtectedCredit_finite_mean cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm s ho hk hsv 0

end NoThreeLine

#print axioms NoThreeLine.compensatedProtectedCredit_stable_ae
#print axioms NoThreeLine.terminalCompensatedProtectedCredit_condExp
#print axioms NoThreeLine.terminalCompensatedProtectedCredit_mean
