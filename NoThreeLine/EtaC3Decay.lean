import NoThreeLine.ScheduledEtaC3
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

/-! Scalar C3 normalization. The degree is chosen before the board size;
the repeated-cause power is exactly B^(m-1). -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.PairWitness

def etaC3Exponent (d ξ ζ : ℝ) (m : ℕ) : ℝ := 4-d-(m:ℝ)*(1-d-2*ξ-ζ)

theorem scalar_C3_power_le {n m : ℕ} (A B d ξ ζ : ℝ) (hn : 1≤n) (hm : 1≤m)
    (hA : 0≤A) (hB : 0≤B) (hBd : B≤(n:ℝ)^d) :
    (n:ℝ)^4*(A*(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ)*B^(m-1)/((n:ℝ)^(-ζ))^m)≤
      A*(n:ℝ)^(etaC3Exponent d ξ ζ m) := by
  have hN : 0<(n:ℝ) := by exact_mod_cast (lt_of_lt_of_le Nat.zero_lt_one hn)
  have hrep : B^(m-1)≤((n:ℝ)^d)^(m-1) := pow_le_pow_left₀ hB hBd _
  apply (mul_le_mul_of_nonneg_left
    (div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hrep
      (mul_nonneg hA (Real.rpow_nonneg hN.le _))) (pow_nonneg (Real.rpow_nonneg hN.le _) _))
    (pow_nonneg hN.le 4)).trans
  have hp : (n:ℝ)^4*(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ)*((n:ℝ)^d)^(m-1)/((n:ℝ)^(-ζ))^m=
      (n:ℝ)^(etaC3Exponent d ξ ζ m) := by
    rw [←Real.rpow_natCast (n:ℝ) 4,←Real.rpow_mul_natCast hN.le,
      ←Real.rpow_mul_natCast hN.le,←Real.rpow_add hN,←Real.rpow_add hN,←Real.rpow_sub hN]
    congr 1
    rw [Nat.cast_sub hm]
    simp only [Nat.cast_one,etaC3Exponent]
    push_cast
    ring
  calc
    _ = A*((n:ℝ)^4*(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ)*((n:ℝ)^d)^(m-1)/((n:ℝ)^(-ζ))^m) := by ring
    _ = A*(n:ℝ)^(etaC3Exponent d ξ ζ m) := by rw [hp]
    _ ≤ _ := le_rfl

theorem exists_C3_degree (d ξ ζ r : ℝ) (hgap : 0<1-d-2*ξ-ζ) :
    ∃m : ℕ, 2≤m ∧ etaC3Exponent d ξ ζ m < -r := by
  obtain ⟨m,hm⟩ := exists_nat_gt (max 2 ((r+4-d)/(1-d-2*ξ-ζ)))
  have hm2 : (2:ℝ)<m := (le_max_left _ _).trans_lt hm
  have hmg := (div_lt_iff₀ hgap).mp ((le_max_right _ _).trans_lt hm)
  refine ⟨m,by exact_mod_cast hm2.le,?_⟩
  dsimp [etaC3Exponent]
  nlinarith

theorem C3_power_eventually_le (A d ξ ζ r : ℝ) (m : ℕ)
    (hm : etaC3Exponent d ξ ζ m < -r) :
    ∀ᶠn : ℕ in atTop,A*(n:ℝ)^(etaC3Exponent d ξ ζ m)≤(n:ℝ)^(-r) := by
  let e := etaC3Exponent d ξ ζ m+r
  have he : e<0 := by dsimp [e]; linarith
  have ht : Tendsto (fun n : ℕ=>A*(n:ℝ)^e) atTop (𝓝 0) := by
    have ht0 := (tendsto_rpow_neg_atTop (neg_pos.mpr he)).comp
      (tendsto_natCast_atTop_atTop (R:=ℝ))
    simpa only [neg_neg,mul_zero,Function.comp_apply] using ht0.const_mul A
  filter_upwards [ht.eventually (gt_mem_nhds (show (0:ℝ)<1 by norm_num)),
    eventually_ge_atTop (1:ℕ)] with n hn hn1
  have hN : 0<(n:ℝ) := by exact_mod_cast (lt_of_lt_of_le Nat.zero_lt_one hn1)
  have hh := mul_le_mul_of_nonneg_right hn.le (Real.rpow_nonneg hN.le (-r))
  have hp : (n:ℝ)^e*(n:ℝ)^(-r)=(n:ℝ)^(etaC3Exponent d ξ ζ m) := by
    rw [←Real.rpow_add hN]
    congr 1
    dsimp [e]
    ring
  calc
    _ = (A*(n:ℝ)^e)*(n:ℝ)^(-r) := by rw [←hp]; ring
    _ ≤ _ := by simpa only [one_mul] using hh

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.scalar_C3_power_le
#print axioms NoThreeLine.PairWitness.exists_C3_degree
#print axioms NoThreeLine.PairWitness.C3_power_eventually_le
