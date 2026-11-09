import NoThreeLine.ProtectedLineStageRestart
import NoThreeLine.PhaseLineForbiddenLaw

/-! A jointly measurable line-stage density for a random incoming state.
Outside the specified occupancy/clock region its normalized extension is
the original board law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem augTimedPhysical_measurable {n : ℕ} (cfg : FlowConfig n) :
    Measurable (fun s : AugTimedState cfg=>s.val.1.physical) :=
  (AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst

theorem terminalLineStageDensity_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) :
    Measurable (fun x : AugTimedState cfg × BoardClockPath n=>
      terminalLineStageDensity cfg ε M K L N hn x.1 x.2) := by
  have hc : Measurable (fun s : AugTimedState cfg=>s.val.1.physical.clocks L) :=
    ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp (augTimedPhysical_measurable cfg)
  have hp : Measurable (specifiedClockHazardPotential N) := by
    unfold specifiedClockHazardPotential
    fun_prop
  exact ((hp.comp (hc.comp measurable_fst)).neg.exp).mul
    ((lineStageValue_measurable cfg K L N).comp (augRecycledTerminalPair_joint_measurable cfg ε M hn).fst)

def restartLineDensity {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (x : ProtectedTimedState cfg × BoardClockPath n) : ℝ :=
  if occupancy x.1.1.val.1.physical.process L=N ∧ x.1.1.val.1.physical.clocks L≤K then
    terminalLineStageDensity cfg ε M K L N hn x.1.1 x.2 else 1

section
attribute [local irreducible] terminalLineStageDensity

set_option maxHeartbeats 500000 in
theorem restartLineDensity_measurable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) : Measurable (restartLineDensity cfg ε M K L N hn) := by
  have hp : Measurable (fun x : ProtectedTimedState cfg × BoardClockPath n=>x.1.1.val.1.physical) :=
    (augTimedPhysical_measurable cfg).comp measurable_fst.fst
  have ho := (ExtendedState.measurable_occupancy n L).comp hp
  have hk := ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp hp
  have hs : Measurable (fun x : ProtectedTimedState cfg × BoardClockPath n=>
      occupancy x.1.1.val.1.physical.process L=N ∧ x.1.1.val.1.physical.clocks L≤K) :=
    (ho.eq_const N).and (hk.le' measurable_const)
  have hd : Measurable (fun x : ProtectedTimedState cfg × BoardClockPath n=>
      terminalLineStageDensity cfg ε M K L N hn x.1.1 x.2) :=
    (terminalLineStageDensity_joint_measurable cfg ε M K L N hn).comp
      (measurable_fst.fst.prodMk measurable_snd)
  unfold restartLineDensity
  exact Measurable.ite hs.setOf hd measurable_const

end

theorem restartLineDensity_bounds {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hK : K<2) (L : LineIndex n) (N : ℕ) (hN : N≤1) (hn : 0<n)
    (x : ProtectedTimedState cfg × BoardClockPath n) :
    0≤restartLineDensity cfg ε M K L N hn x ∧
      restartLineDensity cfg ε M K L N hn x≤max 1 ((2/(2-K))^2) := by
  unfold restartLineDensity
  split_ifs with hx
  · have h := lineStageDensity_bounds cfg K hK L N hN x.1.1
      (augRecycledTerminal cfg ε M hn x.1.1 x.2) hx.2
    exact ⟨h.1,h.2.trans (le_max_right _ _)⟩
  · exact ⟨zero_le_one,le_max_left _ _⟩

theorem restartLineDensity_mean_one {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) :
    (∫ω,restartLineDensity cfg ε M K L N hn (s,ω) ∂boardClockMeasure n (cfg.B/n))=1 := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  by_cases h : occupancy s.1.val.1.physical.process L=N ∧ s.1.val.1.physical.clocks L≤K
  · simpa only [restartLineDensity,if_pos h] using
      terminalLineStageDensity_mean_one cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 h.1 h.2
  · simp [restartLineDensity,h]

theorem restartLineDensity_firstBirth {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n)
    (s : ProtectedTimedState cfg) (ho : occupancy s.1.val.1.physical.process L=0)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (ω : BoardClockPath n)
    (hex : 0<occupancy (protectedLineExitPair cfg ε M L 0 hn s ω).1.1.val.1.physical.process L) :
    let r := protectedLineExitPair cfg ε M L 0 hn s ω
    restartLineDensity cfg ε M K L 1 hn r=terminalLineStageDensity cfg ε M K L 1 hn r.1.1 r.2 := by
  have h := protectedLineExitPair_birth_bounds cfg ε M K hKcfg L hsp 0 (by omega) p hpL hn s ho hk hsv ω hex
  exact if_pos ⟨h.1,h.2.1⟩

end NoThreeLine

#print axioms NoThreeLine.terminalLineStageDensity_joint_measurable
#print axioms NoThreeLine.restartLineDensity_mean_one
#print axioms NoThreeLine.restartLineDensity_firstBirth
