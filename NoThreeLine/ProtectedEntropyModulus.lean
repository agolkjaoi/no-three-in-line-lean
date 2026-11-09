import NoThreeLine.ProtectedEntropy

/-! Entropy loss estimates which remain valid as individual credit tends to
zero. The finite whole-event estimate uses a free positive reference scale. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators
namespace NoThreeLine

theorem protectedEntropy_loss_bounds (B c J : ℝ) (hB : 0<B)
    (hc : 0≤c) (hcap : c≤2*B) (hJ : J=0 ∨ J=1/2 ∨ J=1) :
    0≤protectedEntropy B c-protectedEntropy B (J*c) ∧
    protectedEntropy B c-protectedEntropy B (J*c)≤protectedEntropy B ((1-J)*c) := by
  have hJ0 : 0≤J := by rcases hJ with rfl|rfl|rfl <;> norm_num
  have hJ1 : J≤1 := by rcases hJ with rfl|rfl|rfl <;> norm_num
  have hs : 0≤protectedEntropySlope B c := by
    by_cases h0 : c=0
    · simp [h0,protectedEntropySlope]
    · exact Real.log_nonneg ((le_div_iff₀ (lt_of_le_of_ne hc (Ne.symm h0))).mpr (by simpa using hcap))
  have hi := protectedEntropy_birth_identity B c J hB
  constructor
  · have hp := mul_nonneg (mul_nonneg hs hc) (sub_nonneg.mpr hJ1)
    have hcost := mul_nonneg hc (protectedEntropyCost_nonneg J hJ0)
    linarith
  · rcases hJ with rfl|rfl|rfl
    · simp
    · have hh := protectedEntropy_scaling B c (1/2)
      have hl : Real.log (1/2:ℝ) = -Real.log 2 := by rw [Real.log_div one_ne_zero (by norm_num)]; simp
      rw [hl] at hh
      have he : (1-(1/2:ℝ))*c=(1/2)*c := by ring
      rw [he]
      nlinarith [mul_nonneg hc (Real.log_nonneg (by norm_num : (1:ℝ)≤2))]
    · simp

theorem credit_mul_log_ratio_le_sqrt (d v : ℝ) (hd : 0≤d) (hv : 0<v) :
    d*Real.log (v/d)≤2*Real.sqrt v*Real.sqrt d := by
  by_cases h0 : d=0
  · simp [h0]
  have hdpos : 0<d := lt_of_le_of_ne hd (Ne.symm h0)
  have hl := Real.log_le_rpow_div (div_nonneg hv.le hd) (by norm_num : (0:ℝ)<1/2)
  rw [←Real.sqrt_eq_rpow,Real.sqrt_div hv.le] at hl
  calc
    _ ≤ d*((Real.sqrt v/Real.sqrt d)/(1/2)) := mul_le_mul_of_nonneg_left hl hd
    _ = 2*Real.sqrt v*Real.sqrt d := by
      have hs : Real.sqrt d≠0 := (Real.sqrt_pos.mpr hdpos).ne'
      field_simp
      nlinarith [Real.sq_sqrt hd]

theorem protectedEntropy_sqrt_bound (B d v : ℝ) (hB : 0<B) (hd : 0≤d) (hv : 0<v) :
    protectedEntropy B d≤(1+Real.log (2*B/v))*d+2*Real.sqrt v*Real.sqrt d := by
  by_cases h0 : d=0
  · simp [h0]
  have he : protectedEntropy B d=(1+Real.log (2*B/v))*d+d*Real.log (v/d) := by
    rw [protectedEntropy_eq B d hB,Real.log_div (by positivity) h0,
      Real.log_div (by positivity) hv.ne',Real.log_div hv.ne' h0]
    ring
  rw [he]
  exact add_le_add le_rfl (credit_mul_log_ratio_le_sqrt d v hd hv)

theorem protectedEntropy_sum_sqrt_bound {ι : Type*} (S : Finset ι) (d : ι→ℝ)
    (B v D : ℝ) (hB : 0<B) (hv : 0<v) (hvB : v≤2*B)
    (hd : ∀i∈S,0≤d i) (hD : ∑i∈S,d i≤D) (hN : (S.card:ℝ)*v≤D) :
    (∑i∈S,protectedEntropy B (d i))≤
      (3+Real.log (2*B/v))*Real.sqrt (D*(∑i∈S,d i)) := by
  let Δ := ∑i∈S,d i
  let Z := ∑i∈S,Real.sqrt (d i)
  have hΔ : 0≤Δ := Finset.sum_nonneg hd
  have hD0 : 0≤D := hΔ.trans hD
  have hL : 0≤1+Real.log (2*B/v) := by
    have := Real.log_nonneg ((le_div_iff₀ hv).mpr (by simpa using hvB))
    linarith
  have hΔroot : Δ≤Real.sqrt (D*Δ) := Real.le_sqrt_of_sq_le (by
    have := mul_le_mul_of_nonneg_right hD hΔ
    nlinarith)
  have hZ : Z^2≤(S.card:ℝ)*Δ := by
    have h := Finset.sum_sq_le_sum_mul_sum_of_sq_le_mul S
      (f:=fun _=> (1:ℝ)) (g:=d) (r:=fun i=>Real.sqrt (d i))
      (fun _ _=>zero_le_one) hd (fun i hi=>by rw [Real.sq_sqrt (hd i hi),one_mul])
    simpa [Z,Δ] using h
  have hZroot : Real.sqrt v*Z≤Real.sqrt (D*Δ) := by
    apply Real.le_sqrt_of_sq_le
    rw [mul_pow,Real.sq_sqrt hv.le]
    exact (mul_le_mul_of_nonneg_left hZ hv.le).trans
      (by convert mul_le_mul_of_nonneg_right hN hΔ using 1 <;> ring)
  calc
    _ ≤ ∑i∈S,((1+Real.log (2*B/v))*d i+2*Real.sqrt v*Real.sqrt (d i)) :=
      Finset.sum_le_sum (fun i hi=>protectedEntropy_sqrt_bound B (d i) v hB (hd i hi) hv)
    _ = (1+Real.log (2*B/v))*Δ+2*(Real.sqrt v*Z) := by
      simp only [Finset.sum_add_distrib,←Finset.mul_sum,Δ,Z]
      ring
    _ ≤ (1+Real.log (2*B/v))*Real.sqrt (D*Δ)+2*Real.sqrt (D*Δ) :=
      add_le_add (mul_le_mul_of_nonneg_left hΔroot hL) (mul_le_mul_of_nonneg_left hZroot (by norm_num))
    _ = _ := by ring

theorem protectedEntropy_sum_square_bound {ι : Type*} (S : Finset ι) (d : ι→ℝ)
    (B v D Y : ℝ) (hB : 0<B) (hv : 0<v) (hvB : v≤2*B)
    (hd : ∀i∈S,0≤d i) (hD : ∑i∈S,d i≤D) (hN : (S.card:ℝ)*v≤D)
    (hY : 0≤Y) (hYsum : Y≤∑i∈S,protectedEntropy B (d i)) :
    Y^2≤D*(3+Real.log (2*B/v))^2*(∑i∈S,d i) := by
  have hb := hYsum.trans (protectedEntropy_sum_sqrt_bound S d B v D hB hv hvB hd hD hN)
  have hh := mul_self_le_mul_self hY hb
  rw [←pow_two,←pow_two,mul_pow,Real.sq_sqrt (mul_nonneg
    ((Finset.sum_nonneg hd).trans hD) (Finset.sum_nonneg hd))] at hh
  convert! hh using 1 <;> ring

end NoThreeLine
#print axioms NoThreeLine.protectedEntropy_loss_bounds
#print axioms NoThreeLine.protectedEntropy_sum_square_bound
