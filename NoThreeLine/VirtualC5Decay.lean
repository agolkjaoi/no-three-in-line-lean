import NoThreeLine.VirtualMomentGeometry
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

/-! The scalar decay after the actual n^3 finite line/point union. Degree
is chosen once, before n; constants depending on that degree stay fixed. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped BigOperators Topology

namespace NoThreeLine.VirtualWitness

theorem scalar_C4_sum_le {n m : ℕ} (B d ξ : ℝ) (hn : 1≤n)
    (hB : 0≤B) (hBd : B≤(n:ℝ)^d) (hξd : ξ≤d) :
    (∑ a ∈ Finset.Icc 1 m, B^(m-a)*(n:ℝ)^((a:ℝ)*ξ)) ≤
      (m:ℝ)*(n:ℝ)^((m:ℝ)*d) := by
  have hN : 1≤(n:ℝ) := by exact_mod_cast hn
  have hN0 : 0≤(n:ℝ) := Nat.cast_nonneg n
  calc
    _ ≤ ∑ _a ∈ Finset.Icc 1 m, (n:ℝ)^((m:ℝ)*d) := by
      apply Finset.sum_le_sum
      intro a ha
      have ham : a≤m := (Finset.mem_Icc.mp ha).2
      have he : (n:ℝ)^((a:ℝ)*ξ) ≤ ((n:ℝ)^d)^a := by
        rw [← Real.rpow_mul_natCast hN0]
        exact Real.rpow_le_rpow_of_exponent_le hN (by nlinarith)
      calc
        _ ≤ ((n:ℝ)^d)^(m-a)*((n:ℝ)^d)^a :=
          mul_le_mul (pow_le_pow_left₀ hB hBd _) he
            (Real.rpow_nonneg hN0 _) (pow_nonneg (Real.rpow_nonneg hN0 _) _)
        _ = _ := by
          rw [← pow_add, Nat.sub_add_cancel ham, ← Real.rpow_mul_natCast hN0, mul_comm d]
    _ = _ := by simp

theorem scalar_C5_power_le {n m : ℕ} (C B d γ ξ : ℝ) (hn : 1≤n)
    (hC : 0≤C) (hB : 0≤B) (hBd : B≤(n:ℝ)^d) (hξd : ξ≤d) :
    C*(n:ℝ)^3*(∑ a ∈ Finset.Icc 1 m, B^(m-a)*(n:ℝ)^((a:ℝ)*ξ)) / ((n:ℝ)^γ)^m ≤
      C*(m:ℝ)*(n:ℝ)^(3-(m:ℝ)*(γ-d)) := by
  have hN : 0<(n:ℝ) := by exact_mod_cast (lt_of_lt_of_le Nat.zero_lt_one hn)
  calc
    _ ≤ C*(n:ℝ)^3*((m:ℝ)*(n:ℝ)^((m:ℝ)*d)) / ((n:ℝ)^γ)^m :=
      div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_left (scalar_C4_sum_le B d ξ hn hB hBd hξd)
          (mul_nonneg hC (pow_nonneg hN.le _))) (pow_nonneg (Real.rpow_nonneg hN.le _) _)
    _ = _ := by
      rw [← Real.rpow_mul_natCast hN.le]
      have he : (n:ℝ)^3*(n:ℝ)^((m:ℝ)*d) / (n:ℝ)^(γ*(m:ℝ)) =
          (n:ℝ)^(3-(m:ℝ)*(γ-d)) := by
        rw [← Real.rpow_natCast, ← Real.rpow_add hN, ← Real.rpow_sub hN]
        congr 1
        push_cast
        ring
      calc
        _ = C*(m:ℝ)*((n:ℝ)^3*(n:ℝ)^((m:ℝ)*d)/(n:ℝ)^(γ*(m:ℝ))) := by ring
        _ = _ := by rw [he]

theorem exists_C5_degree (d γ r : ℝ) (hdγ : d<γ) :
    ∃ m : ℕ, 0<m ∧ 3-(m:ℝ)*(γ-d) < -r := by
  obtain ⟨m,hm⟩ := exists_nat_gt (max 0 ((r+3)/(γ-d)))
  have hm0 : 0<(m:ℝ) := (le_max_left _ _).trans_lt hm
  have hm' : (r+3)/(γ-d)<m := (le_max_right _ _).trans_lt hm
  refine ⟨m,by exact_mod_cast hm0,?_⟩
  have := (div_lt_iff₀ (sub_pos.mpr hdγ)).mp hm'
  linarith

theorem C5_power_eventually_le (C d γ r : ℝ) (m : ℕ)
    (hm : 3-(m:ℝ)*(γ-d) < -r) :
    ∀ᶠ n : ℕ in atTop, C*(m:ℝ)*(n:ℝ)^(3-(m:ℝ)*(γ-d)) ≤ (n:ℝ)^(-r) := by
  let e := 3-(m:ℝ)*(γ-d)+r
  have he : e<0 := by dsimp [e]; linarith
  have ht : Tendsto (fun n : ℕ => C*(m:ℝ)*(n:ℝ)^e) atTop (𝓝 0) := by
    have ht0 := (tendsto_rpow_neg_atTop (neg_pos.mpr he)).comp
      (tendsto_natCast_atTop_atTop (R:=ℝ))
    simpa only [neg_neg, mul_zero, Function.comp_apply] using ht0.const_mul (C*(m:ℝ))
  filter_upwards [ht.eventually (gt_mem_nhds (show (0:ℝ)<1 by norm_num)),
    eventually_ge_atTop (1:ℕ)] with n hn hn1
  have hN : 0<(n:ℝ) := by exact_mod_cast (lt_of_lt_of_le Nat.zero_lt_one hn1)
  have hh := mul_le_mul_of_nonneg_right hn.le (Real.rpow_nonneg hN.le (-r))
  have hp : (n:ℝ)^e*(n:ℝ)^(-r)=(n:ℝ)^(3-(m:ℝ)*(γ-d)) := by
    rw [← Real.rpow_add hN]
    congr 1
    dsimp [e]
    ring
  calc
    _ = (C*(m:ℝ)*(n:ℝ)^e)*(n:ℝ)^(-r) := by
      rw [← hp]
      ring
    _ ≤ _ := by simpa only [one_mul] using hh

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.scalar_C5_power_le
#print axioms NoThreeLine.VirtualWitness.exists_C5_degree
#print axioms NoThreeLine.VirtualWitness.C5_power_eventually_le
