import NoThreeLine.ScheduledLineRemainder
import NoThreeLine.SavedCreditProductMixture

/-! A bounded density normalized at each incoming state of the actual
remaining schedule, including a partially completed first phase. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def scheduledRemainderDensity {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (J : ℕ) (x : (ℕ × ProtectedPhaseState n B) × BoardClockPath n) : ℝ :=
  if occupancy x.1.2.1.val.physical.process L=N ∧ x.1.2.1.val.physical.clocks L≤K then
    validLineStageDensity K L N x.1.2.1 (scheduledLineRemainderState cs ε M deadline start hn J x)
  else 1

section
attribute [local irreducible] scheduledLineRemainderState

theorem scheduledRemainderDensity_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (J : ℕ) : Measurable (scheduledRemainderDensity cs ε M K deadline start L N hn J) := by
  have hp : Measurable (fun x : (ℕ × ProtectedPhaseState n B) × BoardClockPath n=>x.1.2.1.val.physical) :=
    validAugPhysical_measurable.comp measurable_fst.snd.fst
  have ho := (ExtendedState.measurable_occupancy n L).comp hp
  have hk := ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp hp
  have hv := (validLineStageValue_measurable K L N).comp
    (scheduledLineRemainderState_measurable cs ε M deadline start hn J)
  have hpot : Measurable (specifiedClockHazardPotential N) := by
    unfold specifiedClockHazardPotential
    fun_prop
  unfold scheduledRemainderDensity validLineStageDensity
  exact Measurable.ite ((ho.eq_const N).and (hk.le' measurable_const)).setOf
    (((hpot.comp hk).neg.exp).mul hv) measurable_const

end

theorem scheduledRemainderDensity_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (hK : K<2) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (J : ℕ)
    (x : (ℕ × ProtectedPhaseState n B) × BoardClockPath n) :
    0≤scheduledRemainderDensity cs ε M K deadline start L N hn J x ∧
      scheduledRemainderDensity cs ε M K deadline start L N hn J x≤max 1 ((2/(2-K))^2) := by
  unfold scheduledRemainderDensity
  split_ifs with hx
  · have h := validLineStageDensity_bounds K hK L N hN x.1.2.1
      (scheduledLineRemainderState cs ε M deadline start hn J x) hx.2
    exact ⟨h.1,h.2.trans (le_max_right _ _)⟩
  · exact ⟨zero_le_one,le_max_left _ _⟩

theorem scheduledRemainderDensity_mean_one {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (J : ℕ) (a : ℕ × ProtectedPhaseState n B) :
    (∫ω,scheduledRemainderDensity cs ε M K deadline start L N hn J (a,ω)
      ∂boardClockMeasure n (B/n))=1 := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  by_cases h : occupancy a.2.1.val.physical.process L=N ∧ a.2.1.val.physical.clocks L≤K
  · simp only [scheduledRemainderDensity,if_pos h,validLineStageDensity]
    rw [integral_const_mul,scheduledLineRemainder_value_mean cs ε M K deadline start hn hB hKcfg hK L hsp
      N hN J a ⟨h.1.ge,fun _=>h.2⟩]
    exact validLineStageDensity_self K L N a.2.1 h.1 h.2
  · simp [scheduledRemainderDensity,h]

end NoThreeLine

#print axioms NoThreeLine.scheduledRemainderDensity_measurable
#print axioms NoThreeLine.scheduledRemainderDensity_mean_one
