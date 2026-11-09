import NoThreeLine.ValidLineStageValue

/-! The actual completed phase and its absolute deadline retirement
preserve the line-stage region and the mean of its physical state value. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem recycledScheduledPair_lineStageRegion {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (j : ℕ) (hKcfg : (cs j).K≤K) (L : LineIndex n) (hsp : specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B) (he : validLineStageRegion K L N e)
    (ω : BoardClockPath n) :
    validLineStageRegion K L N (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1 := by
  rw [recycledScheduledPair,validLineStageRegion_retire]
  exact lineStageRegion_recycled (cs j).config ε M K hKcfg L hsp N hN hn
    (augPhaseStart (cs j).config ε M e) he _ ω

theorem recycledScheduledPair_lineStageValue_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (j : ℕ) (hKcfg : (cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B) (he : validLineStageRegion K L N e) :
    (∫ω,validLineStageValue K L N (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1
      ∂boardClockMeasure n (B/n))=validLineStageValue K L N e := by
  simp only [recycledScheduledPair,validLineStageValue_retire]
  exact lineStageValue_terminal_mean (cs j).config ε M K hKcfg hK L hsp N hN hn hB
    (cs j).mask_le_one (augPhaseStart (cs j).config ε M e) he

theorem recycledScheduledPair_occupancy_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j : ℕ)
    (L : LineIndex n) (e : ValidAugmentedState n B) (ω : BoardClockPath n) :
    occupancy e.val.physical.process L≤
      occupancy (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical.process L := by
  rw [recycledScheduledPair,augValidDeadlineRetirement_occupancy]
  exact recycled_occupancy_monotone (cs j).config ε M L hn (augPhaseStart (cs j).config ε M e) ω
    (Nat.zero_le (augRecycledCompletionIndex (cs j).config ε M hn (augPhaseStart (cs j).config ε M e) ω))

theorem recycledScheduledPair_lineStageValue_ge_on_survival {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (j : ℕ) (hKcfg : (cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K)
    (ω : BoardClockPath n)
    (hsurv : occupancy (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical.process L=N) :
    validLineStageValue K L N e≤validLineStageValue K L N (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1 := by
  rw [recycledScheduledPair,augValidDeadlineRetirement_occupancy] at hsurv
  rw [recycledScheduledPair,validLineStageValue_retire]
  have hh := lineStageDensity_recycled_ge_one (cs j).config ε M K hKcfg hK L hsp N hN hn
    (augPhaseStart (cs j).config ε M e) he hk
    (augRecycledCompletionIndex (cs j).config ε M hn (augPhaseStart (cs j).config ε M e) ω) ω hsurv
  apply (mul_le_mul_iff_of_pos_left (Real.exp_pos (-specifiedClockHazardPotential N (e.val.physical.clocks L)))).mp
  change lineStageDensity (cs j).config K L N (augPhaseStart (cs j).config ε M e)
      (augPhaseStart (cs j).config ε M e)≤_
  rw [lineStageDensity_self (cs j).config K L N _ he hk]
  exact hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.recycledScheduledPair_lineStageValue_mean
#print axioms NoThreeLine.BirthWitness.recycledScheduledPair_lineStageValue_ge_on_survival
