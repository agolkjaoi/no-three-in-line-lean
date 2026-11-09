import NoThreeLine.LabelMomentSplit
import Mathlib.Topology.Algebra.Field

/-! Homogeneous normalization of the proved unit/collision/pair moment
bound. The analytic limit keeps the unit main coefficient exactly one. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.FiniteWitnessMoments

def separatedMomentBound (m : ℕ) (A C W J ε : ℝ) : ℝ :=
  (A^(m+2)+((m+2:ℕ):ℝ)^2*W*(A+((m+2:ℕ):ℝ)*W)^(m+1)+
    ((m+2:ℕ):ℝ)^2*J*(C+((m+2:ℕ):ℝ)*W)^m)/(1-ε)^(m+3).choose 2

theorem separatedMomentBound_nonneg (m : ℕ) (A C W J ε : ℝ)
    (hA : 0≤A) (hC : 0≤C) (hW : 0≤W) (hJ : 0≤J) (hε : ε≤1) :
    0≤separatedMomentBound m A C W J ε := by
  unfold separatedMomentBound
  have he : 0≤1-ε := sub_nonneg.mpr hε
  positivity

theorem separatedMomentBound_mono (m : ℕ) (A C W J A' C' W' J' ε : ℝ)
    (hA : 0≤A) (hC : 0≤C) (hW : 0≤W) (hJ : 0≤J) (hε : ε≤1)
    (hAA : A≤A') (hCC : C≤C') (hWW : W≤W') (hJJ : J≤J') :
    separatedMomentBound m A C W J ε≤separatedMomentBound m A' C' W' J' ε := by
  unfold separatedMomentBound
  have he : 0≤1-ε := sub_nonneg.mpr hε
  have hW' : 0≤W' := hW.trans hWW
  have hJ' : 0≤J' := hJ.trans hJJ
  gcongr

theorem separatedMomentBound_scale (m : ℕ) (A C W J ε L : ℝ) :
    separatedMomentBound m (A*L) (C*L) (W*L) (J*L^2) ε=
      L^(m+2)*separatedMomentBound m A C W J ε := by
  unfold separatedMomentBound
  rw [show A*L+((m+2:ℕ):ℝ)*(W*L)=(A+((m+2:ℕ):ℝ)*W)*L by ring]
  rw [show C*L+((m+2:ℕ):ℝ)*(W*L)=(C+((m+2:ℕ):ℝ)*W)*L by ring]
  simp only [mul_pow,pow_add,pow_one,pow_two]
  ring

theorem separatedMomentBound_normalize (m : ℕ) (A C W J ε L : ℝ) :
    separatedMomentBound m A C W J ε/L^(m+2)=
      separatedMomentBound m (A/L) (C/L) (W/L) (J/L^2) ε := by
  simpa only [div_eq_mul_inv,inv_pow,mul_comm] using
    (separatedMomentBound_scale m A C W J ε L⁻¹).symm

theorem tendsto_separatedMomentBound {α : Type*} {l : Filter α} (m : ℕ)
    (A C W J ε : α→ℝ) (a c : ℝ)
    (hA : Tendsto A l (𝓝 a)) (hC : Tendsto C l (𝓝 c))
    (hW : Tendsto W l (𝓝 0)) (hJ : Tendsto J l (𝓝 0)) (hε : Tendsto ε l (𝓝 0)) :
    Tendsto (fun x=>separatedMomentBound m (A x) (C x) (W x) (J x) (ε x)) l (𝓝 (a^(m+2))) := by
  have hw := (hW.const_mul (((m+2:ℕ):ℝ)^2)).mul
    ((hA.add (hW.const_mul ((m+2:ℕ):ℝ))).pow (m+1))
  have hj := (hJ.const_mul (((m+2:ℕ):ℝ)^2)).mul
    ((hC.add (hW.const_mul ((m+2:ℕ):ℝ))).pow m)
  have hd := ((tendsto_const_nhds (x:=(1:ℝ))).sub hε).pow ((m+3).choose 2)
  have hh := ((hA.pow (m+2)).add hw).add hj
  have hdiv := hh.div hd (by simp : (1-(0:ℝ))^((m+3).choose 2)≠0)
  convert hdiv using 1 <;> simp [separatedMomentBound]
  ext x
  rfl

theorem tendsto_normalized_separatedMomentBound {α : Type*} {l : Filter α} (m : ℕ)
    (A C W J ε L : α→ℝ) (a c : ℝ)
    (hA : Tendsto (fun x=>A x/L x) l (𝓝 a))
    (hC : Tendsto (fun x=>C x/L x) l (𝓝 c))
    (hW : Tendsto (fun x=>W x/L x) l (𝓝 0))
    (hJ : Tendsto (fun x=>J x/(L x)^2) l (𝓝 0)) (hε : Tendsto ε l (𝓝 0)) :
    Tendsto (fun x=>separatedMomentBound m (A x) (C x) (W x) (J x) (ε x)/(L x)^(m+2)) l (𝓝 (a^(m+2))) := by
  simp_rw [separatedMomentBound_normalize]
  exact tendsto_separatedMomentBound m _ _ _ _ _ a c hA hC hW hJ hε

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.separatedMomentBound_normalize
#print axioms NoThreeLine.FiniteWitnessMoments.tendsto_normalized_separatedMomentBound
