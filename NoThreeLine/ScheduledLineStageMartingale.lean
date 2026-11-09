import NoThreeLine.ScheduledLineStagePath

/-! A line-stage density martingale on the actual original-board phase
history, with varying physical masks and unchanged absolute deadlines. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem scheduledLineStageDensity_martingale {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K) :
    Martingale (fun j ω=>validLineStageDensity K L N e (recycledPhaseState cs ε M deadline start hn e j ω))
      (recycledPhasesFiltration cs ε M deadline start hn e) (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have heq := RecycledBoardProcess.section_state_map (recycledPhaseStep cs ε M deadline start hn)
    (recycledPhaseStep_measurable cs ε M deadline start hn) (augPhaseIndexedStep cs ε M deadline start hn)
    _ _ (recycledPhaseStep_map cs ε M deadline start hn hB)
  have hsection (a : ℕ×ValidAugmentedState n B) :
      (boardClockMeasure n (B/n)).map (fun ω=>recycledPhaseStep cs ε M deadline start hn (a,ω))=
        ((boardClockMeasure n (B/n)).map (fun ω=>(recycledPhaseStep cs ε M deadline start hn (a,ω)).1)).prod
          (boardClockMeasure n (B/n)) := by
    rw [heq a]
    exact recycledPhaseStep_map cs ε M deadline start hn hB a
  apply RecycledBoardProcess.credit_martingale_of_invariant (recycledPhaseStep cs ε M deadline start hn)
    (recycledPhaseStep_measurable cs ε M deadline start hn) _ hsection
    (fun a=>validLineStageDensity K L N e a.2) ((validLineStageDensity_measurable K L N e).comp measurable_snd)
    ((2/(2-K))^2) (fun a=>validLineStageDensity_bounds K hK L N hN e a.2 hk)
    (fun a=>validLineStageRegion K L N a.2) ((validLineStageRegion_measurable K L N).comp measurable_snd)
    (fun a ha ω=>recycledScheduledPair_lineStageRegion cs ε M K deadline start hn a.1 (hKcfg a.1)
      L (hsp a.1) N hN a.2 ha ω) _ (0,e) ⟨he.ge,fun _=>hk⟩
  intro a ha
  change (∫ω,Real.exp (-specifiedClockHazardPotential N (e.val.physical.clocks L))*
      validLineStageValue K L N (recycledScheduledPair cs ε M deadline start hn a.1 (a.2,ω)).1
        ∂boardClockMeasure n (B/n))=_
  rw [integral_const_mul,recycledScheduledPair_lineStageValue_mean cs ε M K deadline start hn hB a.1
    (hKcfg a.1) hK L (hsp a.1) N hN a.2 ha]
  rfl

def scheduledLineStageDensity {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (L : LineIndex n) (N : ℕ) (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  validLineStageDensity K L N e (recycledPhaseState cs ε M deadline start hn e J ω)

theorem scheduledLineStageDensity_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (L : LineIndex n) (N : ℕ) (e : ValidAugmentedState n B) (J : ℕ) :
    Measurable (scheduledLineStageDensity cs ε M K deadline start hn L N e J) :=
  (validLineStageDensity_measurable K L N e).comp (recycledPhaseState_measurable cs ε M deadline start hn e J)

theorem scheduledLineStageDensity_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (hK : K<2)
    (L : LineIndex n) (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (hk : e.val.physical.clocks L≤K) (J : ℕ) :
    Integrable (scheduledLineStageDensity cs ε M K deadline start hn L N e J) (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (scheduledLineStageDensity_measurable cs ε M K deadline start hn L N e J) ((2/(2-K))^2)
    (fun ω=>validLineStageDensity_bounds K hK L N hN e _ hk)

theorem scheduledLineStageDensity_mean_one {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K) (J : ℕ) :
    (∫ω,scheduledLineStageDensity cs ε M K deadline start hn L N e J ω ∂boardClockMeasure n (B/n))=1 := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hh := (scheduledLineStageDensity_martingale cs ε M K deadline start hn hB hKcfg hK L hsp N hN e he hk).setIntegral_eq
    (Nat.zero_le J) MeasurableSet.univ
  simp only [setIntegral_univ] at hh
  change (∫_ω : BoardClockPath n,validLineStageDensity K L N e e ∂boardClockMeasure n (B/n))=_ at hh
  rw [validLineStageDensity_self K L N e he hk] at hh
  simpa [scheduledLineStageDensity] using hh.symm

theorem scheduledLineStageDensity_condExp {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K)
    (k J : ℕ) (hkJ : k≤J) :
    condExp (recycledPhasesFiltration cs ε M deadline start hn e k) (boardClockMeasure n (B/n))
      (scheduledLineStageDensity cs ε M K deadline start hn L N e J)=ᵐ[boardClockMeasure n (B/n)]
      scheduledLineStageDensity cs ε M K deadline start hn L N e k :=
  (scheduledLineStageDensity_martingale cs ε M K deadline start hn hB hKcfg hK L hsp N hN e he hk).condExp_ae_eq hkJ

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledLineStageDensity_martingale
#print axioms NoThreeLine.BirthWitness.scheduledLineStageDensity_mean_one
#print axioms NoThreeLine.BirthWitness.scheduledLineStageDensity_condExp
