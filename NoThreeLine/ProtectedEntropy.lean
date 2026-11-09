import NoThreeLine.ProtectedDeletionLedger
import Mathlib.Analysis.SpecialFunctions.Log.NegMulLog

/-! A continuous zero-compatible protected entropy, its actual birth defect,
and comparison of entropy cost with whole-event physical loss. -/
set_option autoImplicit false
noncomputable section
open Set MeasureTheory
namespace NoThreeLine

def protectedEntropy (B c : ℝ) : ℝ := c*(1+Real.log (2*B))-c*Real.log c

def protectedEntropySlope (B c : ℝ) : ℝ := Real.log (2*B/c)

def protectedEntropyCost (J : ℝ) : ℝ := J*Real.log J-J+1

@[simp] theorem protectedEntropy_zero (B : ℝ) : protectedEntropy B 0=0 := by
  simp [protectedEntropy]

theorem protectedEntropy_eq (B c : ℝ) (hB : 0<B) :
    protectedEntropy B c=c*(1+Real.log (2*B/c)) := by
  by_cases hc : c=0
  · simp [hc]
  · rw [Real.log_div (by positivity) hc]
    unfold protectedEntropy
    ring

theorem protectedEntropy_continuous (B : ℝ) : Continuous (protectedEntropy B) :=
  (continuous_id.mul continuous_const).sub Real.continuous_mul_log

theorem protectedEntropy_measurable (B : ℝ) : Measurable (protectedEntropy B) :=
  (protectedEntropy_continuous B).measurable

theorem protectedEntropy_hasDerivAt (B c : ℝ) (hB : 0<B) (hc : 0<c) :
    HasDerivAt (protectedEntropy B) (protectedEntropySlope B c) c := by
  have h := ((hasDerivAt_id c).mul_const (1+Real.log (2*B))).sub
    (Real.hasDerivAt_mul_log hc.ne')
  convert! h using 1
  unfold protectedEntropySlope
  rw [Real.log_div (by positivity) hc.ne']
  ring

theorem protectedEntropy_scaling (B c J : ℝ) :
    protectedEntropy B (J*c)=J*protectedEntropy B c-(J*c)*Real.log J := by
  by_cases hc : c=0
  · simp [hc]
  by_cases hJ : J=0
  · simp [hJ]
  unfold protectedEntropy
  rw [Real.log_mul hJ hc]
  ring

theorem protectedEntropy_birth_identity (B c J : ℝ) (hB : 0<B) :
    protectedEntropySlope B c*c*(1-J)+protectedEntropy B (J*c)-protectedEntropy B c=
      -c*protectedEntropyCost J := by
  by_cases hc : c=0
  · simp [hc]
  rw [protectedEntropy_scaling]
  unfold protectedEntropySlope protectedEntropy protectedEntropyCost
  rw [Real.log_div (by positivity) hc]
  ring

theorem protectedEntropyCost_nonneg (J : ℝ) (hJ : 0≤J) : 0≤protectedEntropyCost J := by
  have := Real.self_sub_one_le_mul_log hJ
  unfold protectedEntropyCost
  linarith

@[simp] theorem protectedEntropyCost_zero : protectedEntropyCost 0=1 := by
  simp [protectedEntropyCost]

@[simp] theorem protectedEntropyCost_one : protectedEntropyCost 1=0 := by
  simp [protectedEntropyCost]

theorem protectedEntropyCost_half : protectedEntropyCost (1/2)=(1-Real.log 2)/2 := by
  unfold protectedEntropyCost
  rw [Real.log_div one_ne_zero (by norm_num : (2:ℝ)≠0)]
  simp only [Real.log_one]
  ring

theorem protectedEntropyCost_margin : 0<1-Real.log 2 ∧ 1-Real.log 2≤1 := by
  have h := Real.log_lt_sub_one_of_pos (by norm_num : (0:ℝ)<2) (by norm_num : (2:ℝ)≠1)
  have h0 := Real.log_nonneg (by norm_num : (1:ℝ)≤2)
  constructor <;> linarith

theorem protectedEntropyCost_actual_bounds (J : ℝ) (hJ : J=0 ∨ J=1/2 ∨ J=1) :
    (1-Real.log 2)*(1-J)≤protectedEntropyCost J ∧ protectedEntropyCost J≤1-J := by
  rcases hJ with rfl|rfl|rfl
  · simp only [protectedEntropyCost_zero,sub_zero,mul_one]
    exact ⟨protectedEntropyCost_margin.2,le_rfl⟩
  · rw [protectedEntropyCost_half]
    constructor
    · ring_nf; exact le_rfl
    · linarith [protectedEntropyCost_margin.2]
  · simp

theorem protectedEntropy_nonneg (B c : ℝ) (hB : 0<B) (hc : 0≤c) (hcap : c≤2*B) :
    0≤protectedEntropy B c := by
  by_cases h0 : c=0
  · simp [h0]
  have hpos : 0<c := lt_of_le_of_ne hc (Ne.symm h0)
  rw [protectedEntropy_eq B c hB]
  exact mul_nonneg hc (by have := Real.log_nonneg ((le_div_iff₀ hpos).mpr (by simpa using hcap)); linarith)

end NoThreeLine
#print axioms NoThreeLine.protectedEntropy_continuous
#print axioms NoThreeLine.protectedEntropy_hasDerivAt
#print axioms NoThreeLine.protectedEntropy_birth_identity
#print axioms NoThreeLine.protectedEntropyCost_actual_bounds
