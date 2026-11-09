import NoThreeLine.RecycledLineStage

/-! Normalized finite and terminal likelihoods on one real occupancy stage.
No initial clock zero or empty incoming selected set is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def lineStageDensity {n : ℕ} (cfg : FlowConfig n) (K : ℝ) (L : LineIndex n) (N : ℕ)
    (s v : AugTimedState cfg) : ℝ :=
  Real.exp (-specifiedClockHazardPotential N (s.val.1.physical.clocks L))*lineStageValue cfg K L N v

theorem lineStageDensity_measurable {n : ℕ} (cfg : FlowConfig n) (K : ℝ) (L : LineIndex n) (N : ℕ)
    (s : AugTimedState cfg) : Measurable (lineStageDensity cfg K L N s) :=
  (lineStageValue_measurable cfg K L N).const_mul _

theorem lineStageDensity_self {n : ℕ} (cfg : FlowConfig n) (K : ℝ) (L : LineIndex n) (N : ℕ)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) : lineStageDensity cfg K L N s s=1 := by
  simp only [lineStageDensity,lineStageValue,ho,hk,and_self,if_true]
  rw [←Real.exp_add,neg_add_cancel,Real.exp_zero]

theorem lineStageDensity_bounds {n : ℕ} (cfg : FlowConfig n) (K : ℝ) (hK : K<2)
    (L : LineIndex n) (N : ℕ) (hN : N≤1) (s v : AugTimedState cfg)
    (hk : s.val.1.physical.clocks L≤K) :
    0≤lineStageDensity cfg K L N s v ∧ lineStageDensity cfg K L N s v≤(2/(2-K))^2 := by
  have hi := (specifiedClockHazardPotential_bounds N _ K hN (s.property.1.1.2.1.2.1 L).1 hk hK).1
  have he : Real.exp (-specifiedClockHazardPotential N (s.val.1.physical.clocks L))≤1 :=
    Real.exp_le_one_iff.mpr (neg_nonpos.mpr hi)
  have hb := lineStageValue_bounds cfg K hK L N hN v
  exact ⟨mul_nonneg (Real.exp_pos _).le hb.1,(mul_le_of_le_one_left hb.1 he).trans hb.2⟩

theorem lineStageDensity_recycled_mean_one {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) (k : ℕ) :
    (∫ω,lineStageDensity cfg K L N s (augRecycledPair cfg ε M hn s k ω).1
      ∂boardClockMeasure n (cfg.B/n))=1 := by
  have hs : lineStageRegion cfg K L N s := ⟨ho.ge,fun _=>hk⟩
  unfold lineStageDensity
  rw [integral_const_mul,lineStageValue_recycled_mean cfg ε M K hKcfg hK L hsp N hN hn hB hm s hs k]
  exact lineStageDensity_self cfg K L N s ho hk

def terminalLineStageDensity {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (s : AugTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  lineStageDensity cfg K L N s (augRecycledTerminal cfg ε M hn s ω)

theorem terminalLineStageDensity_measurable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (s : AugTimedState cfg) :
    Measurable (terminalLineStageDensity cfg ε M K L N hn s) :=
  (lineStageDensity_measurable cfg K L N s).comp (augRecycledTerminal_measurable cfg ε M hn s)

theorem terminalLineStageDensity_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hK : K<2) (L : LineIndex n) (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B)
    (s : AugTimedState cfg) : Integrable (terminalLineStageDensity cfg ε M K L N hn s)
      (boardClockMeasure n (cfg.B/n)) :=
  (lineStageValue_terminal_integrable cfg ε M K hK L N hN hn hB s).const_mul _

theorem terminalLineStageDensity_mean_one {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) :
    (∫ω,terminalLineStageDensity cfg ε M K L N hn s ω ∂boardClockMeasure n (cfg.B/n))=1 := by
  have hs : lineStageRegion cfg K L N s := ⟨ho.ge,fun _=>hk⟩
  unfold terminalLineStageDensity lineStageDensity
  rw [integral_const_mul,lineStageValue_terminal_mean cfg ε M K hKcfg hK L hsp N hN hn hB hm s hs]
  exact lineStageDensity_self cfg K L N s ho hk

theorem terminalLineStageDensity_formula {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (s : AugTimedState cfg)
    (ho : occupancy s.val.1.physical.process L=N) (hk : s.val.1.physical.clocks L≤K)
    (ω : BoardClockPath n) :
    terminalLineStageDensity cfg ε M K L N hn s ω=
      if occupancy (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process L=N then
        Real.exp (specifiedClockHazardPotential N ((augRecycledTerminal cfg ε M hn s ω).val.1.physical.clocks L)-
          specifiedClockHazardPotential N (s.val.1.physical.clocks L)) else 0 := by
  have hs : lineStageRegion cfg K L N s := ⟨ho.ge,fun _=>hk⟩
  have hv : lineStageRegion cfg K L N (augRecycledTerminal cfg ε M hn s ω) :=
    lineStageRegion_recycled cfg ε M K hKcfg L hsp N hN hn s hs _ ω
  unfold terminalLineStageDensity lineStageDensity lineStageValue
  by_cases he : occupancy (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process L=N
  · rw [if_pos ⟨he,hv.2 he⟩,if_pos he,←Real.exp_add]
    congr 1
    ring
  · rw [if_neg (fun h=>he h.1),if_neg he,mul_zero]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineStageDensity_recycled_mean_one
#print axioms NoThreeLine.BirthWitness.terminalLineStageDensity_mean_one
#print axioms NoThreeLine.BirthWitness.terminalLineStageDensity_formula
