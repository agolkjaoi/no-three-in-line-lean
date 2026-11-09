import NoThreeLine.SectionHeightErrorLimit

/-! C22's scalar height sum: the moment degree is fixed before n. This
statement is uniform in the physical cap B <= n^d and keeps the eta floor. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open Filter
open scoped BigOperators Topology

namespace NoThreeLine.SectionHeight
open FiniteWitnessMoments

theorem heightMomentEnvelope_mono (n : ℕ) (B C δ : ℝ) (hB : 0≤B) (hBC : B≤C)
    (hδ : 0≤δ) (m h : ℕ) :
    heightMomentEnvelope n B δ m h ≤ heightMomentEnvelope n C δ m h := by
  unfold heightMomentEnvelope
  apply add_le_add le_rfl
  apply Finset.sum_le_sum
  intro a _
  exact div_le_div_of_nonneg_right
    (mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right
      (pow_le_pow_left₀ hB hBC _) (by positivity)) (by positivity)) (by positivity)

theorem height_sum_le_main_add_error (n : ℕ) (hn : 0<n) (B δ : ℝ)
    (hB : 0≤B) (hBn : B≤n) (hδ : 0<δ) (m : ℕ) (hm : 2≤m) :
    (∑h∈Finset.Ico 1 n, (4*(h:ℝ))*heightMomentEnvelope n B δ m h) ≤
      (∑h∈Finset.Ico 1 n, (4*(h:ℝ))*(2/(2+δ*(h:ℝ)))^m)+heightErrorEnvelope n B δ m := by
  simp only [heightMomentEnvelope,mul_add,Finset.sum_add_distrib]
  exact add_le_add le_rfl (height_error_sum_le n hn B δ hB hBn hδ m hm)

theorem exists_uniform_height_envelope_threshold (δ d ζ κ : ℝ)
    (hδ : 0<δ) (hd : d<1) (hζ : 0<ζ) (hκ : 0<κ) :
    ∃ m : ℕ, 3≤m ∧ ∃ N : ℕ, 2≤N ∧ ∀ n : ℕ, N≤n →
      ∀ B : ℝ, 0≤B → B≤(n:ℝ)^d →
        (∑h∈Finset.Ico 1 n, (4*(h:ℝ))*heightMomentEnvelope n B δ m h) /
          (1-(n:ℝ)^(-ζ))^(m+1).choose 2 < κ := by
  obtain ⟨m0,hm0,hdegree⟩ := exists_height_degree_floor d hd
  obtain ⟨m,hm,hm0m,hmain⟩ := exists_uniform_height_main_degree δ (κ/4) hδ (by positivity) m0
  have herr := heightErrorEnvelope_tendsto δ d m hd (hdegree m hm0m)
  have hfloor : Tendsto (fun n : ℕ => (1-(n:ℝ)^(-ζ))^(m+1).choose 2) atTop (𝓝 (1:ℝ)) := by
    simpa only [sub_zero,one_pow] using
      ((tendsto_const_nhds (x := (1:ℝ))).sub (tendsto_nat_rpow_negative ζ hζ)).pow ((m+1).choose 2)
  have hall : ∀ᶠ n : ℕ in atTop, 2≤n ∧
      heightErrorEnvelope n ((n:ℝ)^d) δ m < κ/4 ∧
      (1:ℝ)/2<(1-(n:ℝ)^(-ζ))^(m+1).choose 2 :=
    (eventually_ge_atTop 2).and ((herr.eventually (gt_mem_nhds (by positivity))).and
      (hfloor.eventually (lt_mem_nhds (by norm_num))))
  obtain ⟨N,hN⟩ := eventually_atTop.mp hall
  refine ⟨m,hm,max N 2,le_max_right _ _,?_⟩
  intro n hNn B hB hBn
  have hns := hN n ((le_max_left _ _).trans hNn)
  have hn : 0<n := by omega
  have hn1 : (1:ℝ)≤n := by exact_mod_cast (show 1≤n by omega)
  have hcap : (n:ℝ)^d≤n := by
    simpa only [Real.rpow_one] using Real.rpow_le_rpow_of_exponent_le hn1 hd.le
  have hsum : (∑h∈Finset.Ico 1 n, (4*(h:ℝ))*heightMomentEnvelope n B δ m h) < κ/2 := by
    calc
      _ ≤ ∑h∈Finset.Ico 1 n, (4*(h:ℝ))*heightMomentEnvelope n ((n:ℝ)^d) δ m h :=
        Finset.sum_le_sum (fun h _ => mul_le_mul_of_nonneg_left
          (heightMomentEnvelope_mono n B ((n:ℝ)^d) δ hB hBn hδ.le m h) (by positivity))
      _ ≤ (∑h∈Finset.Ico 1 n, (4*(h:ℝ))*(2/(2+δ*(h:ℝ)))^m)+
          heightErrorEnvelope n ((n:ℝ)^d) δ m :=
        height_sum_le_main_add_error n hn ((n:ℝ)^d) δ (Real.rpow_nonneg (Nat.cast_nonneg n) d)
          hcap hδ m (by omega)
      _ < κ/4+κ/4 := add_lt_add (hmain n) hns.2.1
      _ = κ/2 := by ring
  apply (div_lt_iff₀ (lt_trans (by norm_num : (0:ℝ)<1/2) hns.2.2)).mpr
  have := mul_lt_mul_of_pos_left hns.2.2 hκ
  linarith

end NoThreeLine.SectionHeight
#print axioms NoThreeLine.SectionHeight.exists_uniform_height_envelope_threshold
