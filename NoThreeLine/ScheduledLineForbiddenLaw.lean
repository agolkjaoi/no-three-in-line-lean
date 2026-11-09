import NoThreeLine.ScheduledLineStageMartingale

/-! A normalized line-stage law over actual scheduled phases. Its density
bound is independent of the number of phases. History comparisons use
the conditional density and allow later line births under the base law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def scheduledLineForbiddenLaw {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (L : LineIndex n) (N : ℕ) (e : ValidAugmentedState n B) (J : ℕ) : Measure (BoardClockPath n) :=
  savedCreditMeasure (boardClockMeasure n (B/n)) (scheduledLineStageDensity cs ε M K deadline start hn L N e J)

theorem scheduledLineForbiddenLaw_probability {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K) (J : ℕ) :
    IsProbabilityMeasure (scheduledLineForbiddenLaw cs ε M K deadline start hn L N e J) :=
  savedCreditMeasure_probability _ _
    (scheduledLineStageDensity_integrable cs ε M K deadline start hn hB hK L N hN e hk J)
    (fun ω=>(validLineStageDensity_bounds K hK L N hN e _ hk).1)
    (scheduledLineStageDensity_mean_one cs ε M K deadline start hn hB hKcfg hK L hsp N hN e he hk J)

theorem scheduledLineForbiddenLaw_absolutelyContinuous {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (L : LineIndex n) (N : ℕ) (e : ValidAugmentedState n B) (J : ℕ) :
    scheduledLineForbiddenLaw cs ε M K deadline start hn L N e J ≪ boardClockMeasure n (B/n) :=
  savedCreditMeasure_absolutelyContinuous _ _

theorem scheduledLineForbiddenLaw_occupancy {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (L : LineIndex n) (N : ℕ) (e : ValidAugmentedState n B) (J : ℕ) :
    ∀ᵐω ∂scheduledLineForbiddenLaw cs ε M K deadline start hn L N e J,
      occupancy (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process L=N := by
  have hp := savedCreditMeasure_positive_ae (boardClockMeasure n (B/n))
    (scheduledLineStageDensity cs ε M K deadline start hn L N e J)
    (scheduledLineStageDensity_measurable cs ε M K deadline start hn L N e J)
  filter_upwards [hp] with ω hpos
  by_contra hne
  simp only [scheduledLineStageDensity,validLineStageDensity,validLineStageValue,hne,false_and,if_false,mul_zero] at hpos
  exact (lt_irrefl (0:ℝ)) hpos

theorem scheduledLineForbiddenLaw_event_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (hK : K<2)
    (L : LineIndex n) (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (hk : e.val.physical.clocks L≤K) (J : ℕ) (E : Set (BoardClockPath n)) (hE : MeasurableSet E) :
    (scheduledLineForbiddenLaw cs ε M K deadline start hn L N e J).real E≤
      (2/(2-K))^2*(boardClockMeasure n (B/n)).real E := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  rw [scheduledLineForbiddenLaw,savedCreditMeasure_real_apply _ _
    (scheduledLineStageDensity_integrable cs ε M K deadline start hn hB hK L N hN e hk J)
    (fun ω=>(validLineStageDensity_bounds K hK L N hN e _ hk).1) E hE]
  calc
    _ ≤ ∫_ω in E,(2/(2-K))^2 ∂boardClockMeasure n (B/n) :=
      integral_mono_ae
        (scheduledLineStageDensity_integrable cs ε M K deadline start hn hB hK L N hN e hk J).integrableOn
        (integrable_const _) (ae_of_all _ (fun ω=>(validLineStageDensity_bounds K hK L N hN e _ hk).2))
    _ = _ := by rw [setIntegral_const,smul_eq_mul,mul_comm]

theorem scheduledLineForbiddenLaw_history_event {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K)
    (k J : ℕ) (hkJ : k≤J) (E : Set (BoardClockPath n))
    (hE : MeasurableSet[recycledPhasesFiltration cs ε M deadline start hn e k] E) :
    (scheduledLineForbiddenLaw cs ε M K deadline start hn L N e J).real E=
      ∫ω in E,scheduledLineStageDensity cs ε M K deadline start hn L N e k ω ∂boardClockMeasure n (B/n) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact savedCreditMeasure_history_event _ (recycledPhasesFiltration cs ε M deadline start hn e)
    _ _ (scheduledLineStageDensity_integrable cs ε M K deadline start hn hB hK L N hN e hk J)
    (fun ω=>(validLineStageDensity_bounds K hK L N hN e _ hk).1) k
    (scheduledLineStageDensity_condExp cs ε M K deadline start hn hB hKcfg hK L hsp N hN e he hk k J hkJ) E hE

theorem scheduledLineStageDensity_ge_one {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K)
    (J : ℕ) (ω : BoardClockPath n)
    (hsurv : occupancy (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process L=N) :
    1≤scheduledLineStageDensity cs ε M K deadline start hn L N e J ω := by
  rw [←validLineStageDensity_self K L N e he hk]
  exact mul_le_mul_of_nonneg_left
    (recycledPhaseState_lineStageValue_ge_on_survival cs ε M K deadline start hn hKcfg hK L hsp N hN e he hk J ω hsurv)
    (Real.exp_pos _).le

theorem scheduledLineForbiddenLaw_history_event_ge {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K)
    (k J : ℕ) (hkJ : k≤J) (E : Set (BoardClockPath n))
    (hE : MeasurableSet[recycledPhasesFiltration cs ε M deadline start hn e k] E)
    (hsurv : ∀ω∈E,occupancy (recycledPhaseState cs ε M deadline start hn e k ω).val.physical.process L=N) :
    (boardClockMeasure n (B/n)).real E≤(scheduledLineForbiddenLaw cs ε M K deadline start hn L N e J).real E := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  rw [scheduledLineForbiddenLaw_history_event cs ε M K deadline start hn hB hKcfg hK L hsp N hN e he hk k J hkJ E hE]
  have hleft : (boardClockMeasure n (B/n)).real E=∫_ω in E,(1:ℝ) ∂boardClockMeasure n (B/n) := by simp
  rw [hleft]
  apply integral_mono_ae (integrable_const _)
    (scheduledLineStageDensity_integrable cs ε M K deadline start hn hB hK L N hN e hk k).integrableOn
  filter_upwards [ae_restrict_mem ((recycledPhasesFiltration cs ε M deadline start hn e).le k E hE)] with ω hω
  exact scheduledLineStageDensity_ge_one cs ε M K deadline start hn hKcfg hK L hsp N hN e he hk k ω (hsurv ω hω)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledLineForbiddenLaw_probability
#print axioms NoThreeLine.BirthWitness.scheduledLineForbiddenLaw_occupancy
#print axioms NoThreeLine.BirthWitness.scheduledLineForbiddenLaw_event_le
#print axioms NoThreeLine.BirthWitness.scheduledLineForbiddenLaw_history_event_ge
