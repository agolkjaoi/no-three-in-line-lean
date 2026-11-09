import NoThreeLine.LineStageHistoryComparison
import NoThreeLine.PhaseWeightGrowth

/-! The same line-stage value on valid physical augmented states, so it
can be transported across changing masks and actual deadline retirement. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def validLineStageValue {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ)
    (e : ValidAugmentedState n B) : ℝ :=
  if occupancy e.val.physical.process L=N ∧ e.val.physical.clocks L≤K then
    Real.exp (specifiedClockHazardPotential N (e.val.physical.clocks L)) else 0

def validLineStageRegion {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ)
    (e : ValidAugmentedState n B) : Prop :=
  N≤occupancy e.val.physical.process L ∧ (occupancy e.val.physical.process L=N → e.val.physical.clocks L≤K)

theorem validLineStageValue_measurable {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ) :
    Measurable (validLineStageValue (B:=B) K L N) := by
  have he : Measurable (fun e : ValidAugmentedState n B=>e.val.physical) :=
    (AugmentedState.measurable_physical n).comp measurable_subtype_coe
  have ho := (ExtendedState.measurable_occupancy n L).comp he
  have hk := ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp he
  unfold validLineStageValue
  apply Measurable.ite ((ho.eq_const N).and (hk.le' measurable_const)).setOf _ measurable_const
  unfold specifiedClockHazardPotential
  fun_prop

theorem validLineStageRegion_measurable {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ) :
    Measurable (validLineStageRegion (B:=B) K L N) := by
  have he : Measurable (fun e : ValidAugmentedState n B=>e.val.physical) :=
    (AugmentedState.measurable_physical n).comp measurable_subtype_coe
  have ho := (ExtendedState.measurable_occupancy n L).comp he
  have hk := ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp he
  exact (measurable_const.le' ho).and ((ho.eq_const N).imp (hk.le' measurable_const))

theorem validLineStageValue_bounds {n : ℕ} {B : ℝ} (K : ℝ) (hK : K<2)
    (L : LineIndex n) (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B) :
    0≤validLineStageValue K L N e ∧ validLineStageValue K L N e≤(2/(2-K))^2 := by
  unfold validLineStageValue
  split_ifs with h
  · exact ⟨(Real.exp_pos _).le,specifiedClockHazardPotential_exp_le N _ K hN
      (e.property.1.2.1.2.1 L).1 h.2 hK⟩
  · exact ⟨le_rfl,sq_nonneg _⟩

theorem augValidDeadlineRetirement_occupancy {n : ℕ} {B : ℝ} (deadline : Grid n→ℝ) (t : ℝ)
    (e : ValidAugmentedState n B) (L : LineIndex n) :
    occupancy (augValidDeadlineRetirement deadline t e).val.physical.process L=occupancy e.val.physical.process L := by
  unfold augValidDeadlineRetirement
  split <;> rfl

theorem augValidDeadlineRetirement_clocks {n : ℕ} {B : ℝ} (deadline : Grid n→ℝ) (t : ℝ)
    (e : ValidAugmentedState n B) :
    (augValidDeadlineRetirement deadline t e).val.physical.clocks=e.val.physical.clocks := by
  unfold augValidDeadlineRetirement
  split <;> rfl

theorem validLineStageValue_retire {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ)
    (deadline : Grid n→ℝ) (t : ℝ) (e : ValidAugmentedState n B) :
    validLineStageValue K L N (augValidDeadlineRetirement deadline t e)=validLineStageValue K L N e := by
  simp only [validLineStageValue,augValidDeadlineRetirement_occupancy,augValidDeadlineRetirement_clocks]

theorem validLineStageRegion_retire {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ)
    (deadline : Grid n→ℝ) (t : ℝ) (e : ValidAugmentedState n B) :
    validLineStageRegion K L N (augValidDeadlineRetirement deadline t e)↔validLineStageRegion K L N e := by
  simp only [validLineStageRegion,augValidDeadlineRetirement_occupancy,augValidDeadlineRetirement_clocks]

def validLineStageDensity {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ)
    (e v : ValidAugmentedState n B) : ℝ :=
  Real.exp (-specifiedClockHazardPotential N (e.val.physical.clocks L))*validLineStageValue K L N v

theorem validLineStageDensity_measurable {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ)
    (e : ValidAugmentedState n B) : Measurable (validLineStageDensity K L N e) :=
  (validLineStageValue_measurable K L N).const_mul _

theorem validLineStageDensity_bounds {n : ℕ} {B : ℝ} (K : ℝ) (hK : K<2)
    (L : LineIndex n) (N : ℕ) (hN : N≤1) (e v : ValidAugmentedState n B)
    (hk : e.val.physical.clocks L≤K) :
    0≤validLineStageDensity K L N e v ∧ validLineStageDensity K L N e v≤(2/(2-K))^2 := by
  have hi := (specifiedClockHazardPotential_bounds N _ K hN (e.property.1.2.1.2.1 L).1 hk hK).1
  have hf : Real.exp (-specifiedClockHazardPotential N (e.val.physical.clocks L))≤1 :=
    Real.exp_le_one_iff.mpr (neg_nonpos.mpr hi)
  have hb := validLineStageValue_bounds K hK L N hN v
  exact ⟨mul_nonneg (Real.exp_pos _).le hb.1,(mul_le_of_le_one_left hb.1 hf).trans hb.2⟩

theorem validLineStageDensity_self {n : ℕ} {B : ℝ} (K : ℝ) (L : LineIndex n) (N : ℕ)
    (e : ValidAugmentedState n B) (ho : occupancy e.val.physical.process L=N)
    (hk : e.val.physical.clocks L≤K) : validLineStageDensity K L N e e=1 := by
  simp only [validLineStageDensity,validLineStageValue,ho,hk,and_self,if_true]
  rw [←Real.exp_add,neg_add_cancel,Real.exp_zero]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.validLineStageValue_retire
#print axioms NoThreeLine.BirthWitness.validLineStageDensity_bounds
