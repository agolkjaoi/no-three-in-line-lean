import NoThreeLine.SectionHeightMain

/-! Lower image-degree errors in the actual height envelope. The degree-one
term is separated; all higher degrees use the finite harmonic bound. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.SectionHeight

def heightErrorEnvelope (n : ℕ) (B δ : ℝ) (m : ℕ) : ℝ :=
  (8/δ^m)*(n:ℝ)*(B/(n:ℝ))^(m-1) +
    (∑ a ∈ Finset.Ico 2 m, 4*2^a*(a:ℝ)^m/δ^m)*(B/(n:ℝ))*(1+Real.log (n:ℝ))

theorem height_degree_term_eq (n h : ℕ) (hn : 0<n) (hh : 0<h)
    (B δ : ℝ) (hδ : 0<δ) (m a : ℕ) (ha : a≤m) :
    (4*(h:ℝ))*(B^(m-a)*(a:ℝ)^m*(2*(n:ℝ)/(h:ℝ))^a/(δ*(n:ℝ))^m) =
      (4*2^a*(a:ℝ)^m/δ^m)*(B/(n:ℝ))^(m-a)*((h:ℝ)/(h:ℝ)^a) := by
  have hn0 : (n:ℝ)≠0 := ne_of_gt (by exact_mod_cast hn)
  have hh0 : (h:ℝ)≠0 := ne_of_gt (by exact_mod_cast hh)
  have he : m=a+(m-a) := by omega
  have hp : (n:ℝ)^m=(n:ℝ)^a*(n:ℝ)^(m-a) := by rw [←pow_add,←he]
  simp only [div_pow,mul_pow]
  field_simp [hn0,hh0,hδ.ne']
  rw [hp]
  ring

theorem height_harmonic_le (n : ℕ) (hn : 0<n) :
    (∑h∈Finset.Ico 1 n, (1:ℝ)/(h:ℝ)) ≤ 1+Real.log (n:ℝ) := by
  calc
    _ ≤ ∑h∈Finset.Icc 1 n, (1:ℝ)/(h:ℝ) := by
      apply Finset.sum_le_sum_of_subset_of_nonneg
      · intro h hh
        exact Finset.mem_Icc.mpr ⟨(Finset.mem_Ico.mp hh).1,(Finset.mem_Ico.mp hh).2.le⟩
      · intro h _ _; positivity
    _ = (harmonic n:ℝ) := (real_harmonic_eq_sum n).symm
    _ ≤ _ := by
      simpa only [Nat.floor_natCast] using harmonic_floor_le_one_add_log (n:ℝ) (by exact_mod_cast hn)

theorem height_degree_one_sum_le (n : ℕ) (hn : 0<n) (B δ : ℝ)
    (hB : 0≤B) (hδ : 0<δ) (m : ℕ) (hm : 1≤m) :
    (∑h∈Finset.Ico 1 n,
      (4*(h:ℝ))*(B^(m-1)*(1:ℝ)^m*(2*(n:ℝ)/(h:ℝ))^1/(δ*(n:ℝ))^m)) ≤
      (8/δ^m)*(n:ℝ)*(B/(n:ℝ))^(m-1) := by
  have he : (∑h∈Finset.Ico 1 n,
      (4*(h:ℝ))*(B^(m-1)*(1:ℝ)^m*(2*(n:ℝ)/(h:ℝ))^1/(δ*(n:ℝ))^m)) =
      ((Finset.Ico 1 n).card:ℝ)*((8/δ^m)*(B/(n:ℝ))^(m-1)) := by
    calc
      _ = ∑h∈Finset.Ico 1 n, (8/δ^m)*(B/(n:ℝ))^(m-1) := by
        apply Finset.sum_congr rfl
        intro h hh
        have hh0 : (h:ℝ)≠0 := ne_of_gt (by exact_mod_cast (Finset.mem_Ico.mp hh).1)
        simpa [hh0,show (4:ℝ)*2=8 by norm_num] using
          height_degree_term_eq n h hn (Finset.mem_Ico.mp hh).1 B δ hδ m 1 hm
      _ = _ := by simp only [Finset.sum_const,nsmul_eq_mul]
  rw [he]
  have hc : ((Finset.Ico 1 n).card:ℝ) ≤ (n:ℝ) := by
    exact_mod_cast (show (Finset.Ico 1 n).card ≤ n by simp)
  calc
    _ ≤ (n:ℝ)*((8/δ^m)*(B/(n:ℝ))^(m-1)) :=
      mul_le_mul_of_nonneg_right hc (by positivity)
    _ = _ := by ring

theorem height_degree_ge_two_sum_le (n : ℕ) (hn : 0<n) (B δ : ℝ)
    (hB : 0≤B) (hBn : B≤n) (hδ : 0<δ) (m a : ℕ) (ha : 2≤a) (ham : a<m) :
    (∑h∈Finset.Ico 1 n,
      (4*(h:ℝ))*(B^(m-a)*(a:ℝ)^m*(2*(n:ℝ)/(h:ℝ))^a/(δ*(n:ℝ))^m)) ≤
      (4*2^a*(a:ℝ)^m/δ^m)*(B/(n:ℝ))*(1+Real.log (n:ℝ)) := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  have hr0 : 0≤B/(n:ℝ) := div_nonneg hB hnR.le
  have hr1 : B/(n:ℝ)≤1 := (div_le_one hnR).mpr hBn
  have hp : (B/(n:ℝ))^(m-a) ≤ B/(n:ℝ) := by
    simpa only [pow_one] using pow_le_pow_of_le_one hr0 hr1 (show 1≤m-a by omega)
  calc
    _ ≤ ∑h∈Finset.Ico 1 n, (4*2^a*(a:ℝ)^m/δ^m)*(B/(n:ℝ))*((1:ℝ)/(h:ℝ)) := by
      apply Finset.sum_le_sum
      intro h hh
      have hh1 : (1:ℝ)≤h := by exact_mod_cast (Finset.mem_Ico.mp hh).1
      have hhR : (0:ℝ)<h := by linarith
      have hhpow : (h:ℝ)^2≤(h:ℝ)^a := pow_le_pow_right₀ hh1 ha
      have hratio : (h:ℝ)/(h:ℝ)^a ≤ (1:ℝ)/(h:ℝ) := by
        apply (div_le_div_of_nonneg_left hhR.le (pow_pos hhR 2) hhpow).trans
        exact le_of_eq (by field_simp)
      rw [height_degree_term_eq n h hn (Finset.mem_Ico.mp hh).1 B δ hδ m a ham.le]
      exact mul_le_mul (mul_le_mul_of_nonneg_left hp (by positivity)) hratio
        (by positivity) (by positivity)
    _ = (4*2^a*(a:ℝ)^m/δ^m)*(B/(n:ℝ))*(∑h∈Finset.Ico 1 n, (1:ℝ)/(h:ℝ)) := by
      rw [Finset.mul_sum]
    _ ≤ _ := mul_le_mul_of_nonneg_left (height_harmonic_le n hn) (by positivity)

theorem height_error_sum_le (n : ℕ) (hn : 0<n) (B δ : ℝ)
    (hB : 0≤B) (hBn : B≤n) (hδ : 0<δ) (m : ℕ) (hm : 2≤m) :
    (∑h∈Finset.Ico 1 n, (4*(h:ℝ)) *
      ∑a∈Finset.Ico 1 m, B^(m-a)*(a:ℝ)^m*(2*(n:ℝ)/(h:ℝ))^a/(δ*(n:ℝ))^m) ≤
      heightErrorEnvelope n B δ m := by
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm,Finset.sum_eq_sum_Ico_succ_bot (show 1<m by omega)]
  simp only [Nat.cast_one,show 1+1=2 from rfl]
  unfold heightErrorEnvelope
  apply add_le_add (height_degree_one_sum_le n hn B δ hB hδ m (by omega))
  calc
    _ ≤ ∑a∈Finset.Ico 2 m, (4*2^a*(a:ℝ)^m/δ^m)*(B/(n:ℝ))*(1+Real.log (n:ℝ)) :=
      Finset.sum_le_sum (fun a ha => height_degree_ge_two_sum_le n hn B δ hB hBn hδ m a
        (Finset.mem_Ico.mp ha).1 (Finset.mem_Ico.mp ha).2)
    _ = _ := by rw [Finset.sum_mul,Finset.sum_mul]

end NoThreeLine.SectionHeight
#print axioms NoThreeLine.SectionHeight.height_error_sum_le
