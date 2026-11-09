import NoThreeLine.ScheduledLineRestartSurvival
import NoThreeLine.ScheduledLineSurvival

/-! Terminal exclusion of a second birth implies exclusion at every
actual within-phase update, using original completion and monotonicity. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem scheduledLineRestartLaw_all_occupancy_le_one {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<B) (J : ℕ)
    (hKcfg : ∀j,(cs j).K≤K) (hsp : ∀j,specified (cs j).directions L)
    (s : ProtectedPhaseState n B) (ho : occupancy s.1.val.physical.process L=0)
    (hk : s.1.val.physical.clocks L≤K) (hsv : 0≤s.2.1 p ∧ s.2.1 p≤2*B)
    (hA : s.2.2=0) :
    ∀ᵐω∂scheduledLineRestartLaw cs ε M K deadline start L hn J s,∀j<J,∀k,
      let r := augRecycledPair (cs j).config ε M hn
        (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn s.1 j ω)) k
        (recycledPhases cs ε M deadline start hn s.1 j ω).2
      occupancy r.1.val.1.physical.process L≤1 := by
  have hAC : scheduledLineRestartLaw cs ε M K deadline start L hn J s ≪ boardClockMeasure n (B/n) :=
    savedCreditMeasure_absolutelyContinuous _ _
  filter_upwards [scheduledLineRestartLaw_terminal_occupancy_le_one cs ε M K deadline start L p hpL
    hn hB J hKcfg hsp s ho hk hsv hA,
    hAC.ae_le (validScheduledPhasesCompletion_ae cs ε M deadline start hn hB s.1)] with ω hf hd
  intro j hj k
  let cfg := (cs j).config
  let a := augPhaseStart cfg ε M (recycledPhaseState cs ε M deadline start hn s.1 j ω)
  let w := (recycledPhases cs ε M deadline start hn s.1 j ω).2
  let i := augRecycledCompletionIndex cfg ε M hn a w
  have hi : occupancy (augRecycledTerminal cfg ε M hn a w).val.1.physical.process L≤1 := by
    have hm := recycledPhaseState_occupancy_monotone cs ε M deadline start hn L s.1 ω
      (show j+1≤J from hj)
    have he := scheduledTerminal_occupancy cs ε M deadline start hn s.1 j ω L
    change occupancy (augRecycledTerminal cfg ε M hn a w).val.1.physical.process L=_ at he
    rw [he]
    exact hm.trans hf
  change occupancy (augRecycledPair cfg ε M hn a k w).1.val.1.physical.process L≤1
  by_cases hki : k ≤ i
  · exact (recycled_occupancy_monotone cfg ε M L hn a w hki).trans hi
  · rw [augRecycledPair_absorbing cfg ε M hn a w i (hd j) k (le_of_not_ge hki)]
    exact hi

end NoThreeLine

#print axioms NoThreeLine.scheduledLineRestartLaw_all_occupancy_le_one
