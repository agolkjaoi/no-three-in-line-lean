import NoThreeLine.FirstLineForbiddenLaw
import NoThreeLine.TimedLineHazard

/-! A bounded harmonic value for the actual fixed-occupancy stage. The
invariant region is proved from real selected-set and clock updates. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem augTimedStep_occupancy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (s : AugTimedState cfg) (z : CandidateData n) :
    occupancy (augTimedStep cfg ε M (s,z)).val.1.physical.process L=
      occupancy s.val.1.physical.process L+if timedBirth cfg ε M (s,z) ∧ z.1.2∈L.val then 1 else 0 := by
  classical
  unfold occupancy
  rw [augTimedStep_selected]
  by_cases hb : timedBirth cfg ε M (s,z)
  · rw [if_pos hb]
    have hf := timedBirth_fresh cfg ε M (s,z) hb
    by_cases hL : z.1.2∈L.val
    · have he : insert z.1.2 s.val.1.physical.process.selected∩L.val=
          insert z.1.2 (s.val.1.physical.process.selected∩L.val) := by ext p; simp; aesop
      rw [he,Finset.card_insert_of_notMem (by simp [hf]),if_pos ⟨hb,hL⟩]
    · have he : insert z.1.2 s.val.1.physical.process.selected∩L.val=
          s.val.1.physical.process.selected∩L.val := by ext p; simp; aesop
      rw [he,if_neg (fun h=>hL h.2),Nat.add_zero]
  · rw [if_neg hb,if_neg (fun h=>hb h.1),Nat.add_zero]

theorem augTimedStep_occupancy_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (s : AugTimedState cfg) (z : CandidateData n) :
    occupancy s.val.1.physical.process L≤occupancy (augTimedStep cfg ε M (s,z)).val.1.physical.process L := by
  rw [augTimedStep_occupancy]
  exact Nat.le_add_right _ _

theorem lineCandidateSurvival_eq_occupancy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (s : AugTimedState cfg) (z : CandidateData n) :
    lineCandidateSurvival cfg ε M L (s,z)=
      if occupancy (augTimedStep cfg ε M (s,z)).val.1.physical.process L=
        occupancy s.val.1.physical.process L then 1 else 0 := by
  rw [augTimedStep_occupancy]
  unfold lineCandidateSurvival
  split_ifs <;> simp_all <;> omega

theorem augTimedLineLikelihood_eq_states {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (s : AugTimedState cfg) (z : CandidateData n) :
    augTimedLineLikelihood cfg ε M L (s,z)=
      if occupancy (augTimedStep cfg ε M (s,z)).val.1.physical.process L=occupancy s.val.1.physical.process L then
        Real.exp (specifiedClockHazardPotential (occupancy s.val.1.physical.process L)
          ((augTimedStep cfg ε M (s,z)).val.1.physical.clocks L)-
          specifiedClockHazardPotential (occupancy s.val.1.physical.process L) (s.val.1.physical.clocks L)) else 0 := by
  by_cases hd : s.val.2≤0 ∨ s.val.1.physical.process.stopped=true
  · simp only [augTimedLineLikelihood,if_pos hd,augTimedStep,augTimedStepPair,hd,if_true,
      sub_self,Real.exp_zero]
  · rw [augTimedLineLikelihood,if_neg hd,lineCandidateSurvival_eq_occupancy]
    have hk : (augTimedStep cfg ε M (s,z)).val.1.physical.clocks L=
        (selectedCurve cfg ((augTimedInput cfg s).1.1,augAdvance cfg ε M (augTimedInput cfg s,z.1.1))).2.1 L := by
      simp only [augTimedStep,augTimedStepPair,if_neg hd]
      rw [augOutcome_clocks_eq_pre]
      rfl
    rw [hk]
    unfold selectedLineLikelihood
    split_ifs <;> simp only [mul_one,mul_zero] <;> rfl

def lineStageRegion {n : ℕ} (cfg : FlowConfig n) (K : ℝ) (L : LineIndex n) (N : ℕ)
    (s : AugTimedState cfg) : Prop :=
  N≤occupancy s.val.1.physical.process L ∧
    (occupancy s.val.1.physical.process L=N → s.val.1.physical.clocks L≤K)

theorem lineStageRegion_step {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (s : AugTimedState cfg) (hs : lineStageRegion cfg K L N s) (z : CandidateData n) :
    lineStageRegion cfg K L N (augTimedStep cfg ε M (s,z)) := by
  have hmono := augTimedStep_occupancy_le cfg ε M L s z
  have hmin := hs.1
  refine ⟨hs.1.trans hmono,fun he=>?_⟩
  have hi : occupancy s.val.1.physical.process L=N := by omega
  exact augTimedStep_specifiedClock_le cfg ε M K hKcfg L hsp s (hi ▸ hN) (hs.2 hi) z

def lineStageValue {n : ℕ} (cfg : FlowConfig n) (K : ℝ) (L : LineIndex n) (N : ℕ)
    (s : AugTimedState cfg) : ℝ :=
  if occupancy s.val.1.physical.process L=N ∧ s.val.1.physical.clocks L≤K then
    Real.exp (specifiedClockHazardPotential N (s.val.1.physical.clocks L)) else 0

theorem lineStageValue_measurable {n : ℕ} (cfg : FlowConfig n) (K : ℝ) (L : LineIndex n) (N : ℕ) :
    Measurable (lineStageValue cfg K L N) := by
  have he : Measurable (fun s : AugTimedState cfg=>s.val.1.physical) :=
    (AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst
  have ho := (ExtendedState.measurable_occupancy n L).comp he
  have hk := ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp he
  unfold lineStageValue
  apply Measurable.ite ((ho.eq_const N).and (hk.le' measurable_const)).setOf _ measurable_const
  unfold specifiedClockHazardPotential
  fun_prop

theorem lineStageValue_bounds {n : ℕ} (cfg : FlowConfig n) (K : ℝ) (hK : K<2)
    (L : LineIndex n) (N : ℕ) (hN : N≤1) (s : AugTimedState cfg) :
    0≤lineStageValue cfg K L N s ∧ lineStageValue cfg K L N s≤(2/(2-K))^2 := by
  unfold lineStageValue
  split_ifs with hs
  · exact ⟨(Real.exp_pos _).le,specifiedClockHazardPotential_exp_le N _ K hN
      (s.property.1.1.2.1.2.1 L).1 hs.2 hK⟩
  · exact ⟨le_rfl,sq_nonneg _⟩

theorem lineStageValue_step_factor {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (s : AugTimedState cfg) (hs : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) (z : CandidateData n) :
    lineStageValue cfg K L N (augTimedStep cfg ε M (s,z))=
      lineStageValue cfg K L N s*augTimedLineLikelihood cfg ε M L (s,z) := by
  have hk' := augTimedStep_specifiedClock_le cfg ε M K hKcfg L hsp s (hs ▸ hN) hk z
  rw [augTimedLineLikelihood_eq_states]
  simp only [lineStageValue,hs,hk,hk',and_true,if_true]
  split_ifs
  · rw [←Real.exp_add]
    congr 1
    ring
  · ring

theorem lineStageValue_step_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hs : lineStageRegion cfg K L N s) :
    (∫ω,lineStageValue cfg K L N (augTimedClockStep cfg ε M hn (s,ω))
      ∂boardClockMeasure n (cfg.B/n))=lineStageValue cfg K L N s := by
  by_cases ho : occupancy s.val.1.physical.process L=N
  · simp_rw [augTimedClockStep,lineStageValue_step_factor cfg ε M K hKcfg L hsp N hN s ho (hs.2 ho)]
    rw [integral_const_mul,augTimedLineLikelihood_mean_one cfg ε M K hKcfg hK L hsp hn hB hm s
      (ho ▸ hN) (hs.2 ho),mul_one]
  · have hnxt (ω : BoardClockPath n) :
        occupancy (augTimedClockStep cfg ε M hn (s,ω)).val.1.physical.process L≠N := by
      have hmono := augTimedStep_occupancy_le cfg ε M L s (WinnerMarkLaw.firstMarkedRace hn ω)
      change occupancy s.val.1.physical.process L≤occupancy (augTimedClockStep cfg ε M hn (s,ω)).val.1.physical.process L at hmono
      have := hs.1
      omega
    simp only [lineStageValue,ho,hnxt,false_and,if_false,integral_zero]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineStageRegion_step
#print axioms NoThreeLine.BirthWitness.lineStageValue_step_mean
