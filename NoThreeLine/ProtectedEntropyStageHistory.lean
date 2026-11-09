import NoThreeLine.ProtectedEntropyStageStep
import NoThreeLine.RecycledInvariantSignedIntegral

/-! The actual recycled residual product law lifts the step compensation
to every event in the complete saved-ledger history. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedEntropyStage_history_equal_integrals {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (hs : lineStageRegion cfg K L N s.1) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (k : ℕ) (E : Set (BoardClockPath n)) (hE : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] E) :
    (∫ω in E,lineStageValue cfg K L N (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1*
      protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s (k+1) ω).1
      ∂boardClockMeasure n (cfg.B/n))=
      ∫ω in E,lineStageValue cfg K L N (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1*
        (protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1+
          protectedClockRunningEntropySource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω))
        ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let F := protectedRestartStep cfg ε M L hn
  have hF := protectedRestartStep_measurable cfg ε M L hn
  let R : ProtectedTimedState cfg→Prop := fun v=>lineStageRegion cfg K L N v.1 ∧ 0≤v.2 p ∧ v.2 p≤2*cfg.B
  have hRm : Measurable R := ((lineStageRegion_measurable cfg K L N).comp measurable_fst).and
    ((measurable_const.le' ((measurable_pi_apply p).comp measurable_snd)).and
      (((measurable_pi_apply p).comp measurable_snd).le' measurable_const))
  have hR (v : ProtectedTimedState cfg) (hv : R v) (ω : BoardClockPath n) : R (F (v,ω)).1 :=
    ⟨lineStageRegion_step cfg ε M K hKcfg L hsp N hN v.1 hv.1 _,
      protectedLineSave_timed_bounds_all cfg ε M L hsp p hpL v hv.2 _⟩
  let f : ProtectedTimedState cfg×BoardClockPath n→ℝ := fun x=>
    lineStageValue cfg K L N (F x).1.1*protectedTimedEntropy cfg L p (F x).1
  let g : ProtectedTimedState cfg×BoardClockPath n→ℝ := fun x=>
    lineStageValue cfg K L N (F x).1.1*
      (protectedTimedEntropy cfg L p x.1+protectedClockRunningEntropySource cfg ε M L p hn x)
  have hf : Measurable f := ((lineStageValue_measurable cfg K L N).comp hF.fst.fst).mul
    ((protectedTimedEntropy_measurable cfg L p).comp hF.fst)
  have hg : Measurable g := ((lineStageValue_measurable cfg K L N).comp hF.fst.fst).mul
    (((protectedTimedEntropy_measurable cfg L p).comp measurable_fst).add
      (protectedClockRunningEntropySource_measurable cfg ε M L p hn))
  have hfB (x : ProtectedTimedState cfg×BoardClockPath n) (hx : R x.1) :
      ‖f x‖≤(2/(2-K))^2*(2*cfg.B) := by
    have hd := lineStageValue_bounds cfg K hK L N hN (F x).1.1
    have hc := protectedTimedEntropy_bounds_all cfg L hsp p hpL hB (F x).1 (hR x.1 hx x.2).2
    change ‖lineStageValue cfg K L N (F x).1.1*protectedTimedEntropy cfg L p (F x).1‖≤_
    rw [norm_mul,Real.norm_eq_abs,abs_of_nonneg hd.1,Real.norm_eq_abs,abs_of_nonneg hc.1]
    exact mul_le_mul hd.2 hc.2 hc.1 (sq_nonneg _)
  have hgC (x : ProtectedTimedState cfg×BoardClockPath n) (hx : R x.1) :
      ‖g x‖≤(2/(2-K))^2*(2*cfg.B+(cfg.horizon:ℝ)*protectedEntropySourceCap n cfg.B) := by
    have hd := lineStageValue_bounds cfg K hK L N hN (F x).1.1
    have hc := protectedTimedEntropy_bounds_all cfg L hsp p hpL hB x.1 hx.2
    have hr := protectedRunningEntropySource_bounds_all cfg ε M L hsp p hpL hB hm
      x.1 (WinnerMarkLaw.firstMarkedRace hn x.2)
    have hb : ‖protectedTimedEntropy cfg L p x.1+protectedClockRunningEntropySource cfg ε M L p hn x‖≤
        2*cfg.B+(cfg.horizon:ℝ)*protectedEntropySourceCap n cfg.B :=
      (norm_add_le _ _).trans (add_le_add (by simpa only [Real.norm_eq_abs,abs_of_nonneg hc.1] using hc.2) hr)
    change ‖lineStageValue cfg K L N (F x).1.1*(_+_)‖≤_
    rw [norm_mul,Real.norm_eq_abs,abs_of_nonneg hd.1]
    exact mul_le_mul hd.2 hb (norm_nonneg _) (sq_nonneg _)
  exact RecycledBoardProcess.history_equal_integrals_of_invariant_signed F hF _
    (protectedRestartStep_map cfg ε M L hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    R hRm hR f g hf hg _ _ hfB hgC
    (fun v hv=>protectedEntropyStage_step_equal_mean cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm v hv.1 hv.2)
    s ⟨hs,hsv⟩ k E hE

theorem protectedEntropyDensity_history_equal_integrals {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (hs : lineStageRegion cfg K L N s.1) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (k : ℕ) (E : Set (BoardClockPath n)) (hE : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] E) :
    (∫ω in E,lineStageDensity cfg K L N s.1 (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1*
      protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s (k+1) ω).1
      ∂boardClockMeasure n (cfg.B/n))=
      ∫ω in E,lineStageDensity cfg K L N s.1 (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1*
        (protectedTimedEntropy cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1+
          protectedClockRunningEntropySource cfg ε M L p hn (protectedRecycledPair cfg ε M L hn s k ω))
        ∂boardClockMeasure n (cfg.B/n) := by
  simp only [lineStageDensity,mul_assoc]
  rw [integral_const_mul,integral_const_mul,
    protectedEntropyStage_history_equal_integrals cfg ε M K hKcfg hK L hsp N hN p hpL hn hB hm s hs hsv k E hE]

end NoThreeLine

#print axioms NoThreeLine.protectedEntropyStage_history_equal_integrals
#print axioms NoThreeLine.protectedEntropyDensity_history_equal_integrals
