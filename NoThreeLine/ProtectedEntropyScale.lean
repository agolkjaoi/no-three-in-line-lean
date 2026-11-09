import NoThreeLine.ProtectedEntropyEventBounds

/-! A deterministic reference credit of 1/(n²+1) controls entropy jumps.
This is not a lower bound on any actual credit. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def entropyReference (n : ℕ) : ℝ := 1/((n:ℝ)^2+1)
def entropyLogConstant (d : ℝ) : ℝ := d+2+(3+Real.log 4)/Real.log 2

theorem entropyReference_pos (n : ℕ) : 0<entropyReference n := by unfold entropyReference; positivity

theorem entropyReference_le_one (n : ℕ) : entropyReference n≤1 := by
  unfold entropyReference
  exact (div_le_iff₀ (by positivity)).mpr (by nlinarith [sq_nonneg (n:ℝ)])

theorem entropyReference_card_le_one {n : ℕ} (E : Finset (Grid n)) :
    (E.card:ℝ)*entropyReference n≤1 := by
  have hc : E.card≤n^2 := by
    simpa [Grid,pow_two] using Finset.card_le_univ E
  have hcr : (E.card:ℝ)≤(n:ℝ)^2 := by exact_mod_cast hc
  unfold entropyReference
  rw [mul_one_div]
  exact (div_le_iff₀ (by positivity)).mpr (by nlinarith)

theorem entropy_log_scale {n : ℕ} (B d : ℝ) (hn : 2≤n) (hB : 1≤B)
    (hd : 0≤d) (hBd : B≤(n:ℝ)^d) :
    0≤3+Real.log (2*B/entropyReference n) ∧
    3+Real.log (2*B/entropyReference n)≤entropyLogConstant d*Real.log n := by
  have hn1 : (1:ℝ)≤n := by exact_mod_cast (show 1≤n by omega)
  have hn2 : (2:ℝ)≤n := by exact_mod_cast hn
  have hnp : (0:ℝ)<n := lt_of_lt_of_le zero_lt_one hn1
  have hv := entropyReference_pos n
  have hv1 := entropyReference_le_one n
  have hratio : 0<2*B/entropyReference n := div_pos (by linarith) hv
  have hlog0 : 0≤Real.log (2*B/entropyReference n) :=
    Real.log_nonneg ((le_div_iff₀ hv).mpr (by nlinarith))
  have hb : 2*B/entropyReference n≤4*(n:ℝ)^(d+2) := by
    calc
      _ = 2*B*((n:ℝ)^2+1) := by simp [entropyReference,div_eq_mul_inv]
      _ ≤ 2*(n:ℝ)^d*(2*(n:ℝ)^2) :=
        mul_le_mul (mul_le_mul_of_nonneg_left hBd (by norm_num))
          (by nlinarith [sq_nonneg ((n:ℝ)-1)]) (by positivity) (by positivity)
      _ = _ := by rw [Real.rpow_add hnp]; norm_num; ring
  have hlog := Real.log_le_log hratio hb
  rw [Real.log_mul (by norm_num : (4:ℝ)≠0) (Real.rpow_pos_of_pos hnp (d+2)).ne',
    Real.log_rpow hnp] at hlog
  have hlog2 : 0<Real.log 2 := Real.log_pos (by norm_num)
  have hl2 : Real.log 2≤Real.log n := Real.log_le_log (by norm_num) hn2
  have hc0 : 0≤(3+Real.log 4)/Real.log 2 := div_nonneg
    (by have := Real.log_nonneg (by norm_num : (1:ℝ)≤4); linarith) hlog2.le
  have hcm := mul_le_mul_of_nonneg_left hl2 hc0
  rw [div_mul_cancel₀ _ hlog2.ne'] at hcm
  constructor
  · linarith
  · unfold entropyLogConstant
    nlinarith

theorem protectedEntropyDeletion_log_square {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K D d : ℝ)
    (he : e.Valid B) (hn : 2≤n) (hB : 1≤B) (hd : 0≤d) (hBd : B≤(n:ℝ)^d)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hD1 : 1≤D) (hD : protectedExternalDeletion e Γ L E q≤D) :
    (1-Real.log 2)*(protectedEntropyDeletion e Γ L E q B)^2≤
      D*(entropyLogConstant d)^2*(Real.log n)^2*protectedEventCost e Γ L E q := by
  have hc0 := protectedEventCost_nonneg e Γ L E q B K he hN hclock hK
  have hh := protectedEntropyDeletion_cost_square e Γ L E q B K (entropyReference n) D he
    (lt_of_lt_of_le zero_lt_one hB) hN hclock hK (entropyReference_pos n)
    ((entropyReference_le_one n).trans (by linarith))
    ((entropyReference_card_le_one E).trans hD1) hD
  have hl := entropy_log_scale B d hn hB hd hBd
  have hsq := mul_self_le_mul_self hl.1 hl.2
  have hmul := mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hsq (by linarith : 0≤D)) hc0
  apply hh.trans
  convert! hmul using 1 <;> ring

theorem protectedEntropyDeletion_power_cost {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K d γ : ℝ)
    (he : e.Valid B) (hn : 2≤n) (hB : 1≤B) (hd : 0≤d) (hdγ : d≤γ) (hBd : B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hq : (e.process.accounts q).status=.active) (hqL : q∉L.val)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hvirtual : virtualMass e.process Γ e.coordinates L q≤(n:ℝ)^γ) :
    (1-Real.log 2)*(protectedEntropyDeletion e Γ L E q B)^2≤
      (1+2*(Γ.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2*
        protectedEventCost e Γ L E q := by
  have hn1 : 1≤n := by omega
  have hγ : 0≤γ := hd.trans hdγ
  have hpow : (1:ℝ)≤(n:ℝ)^γ := Real.one_le_rpow (by exact_mod_cast hn1) hγ
  exact protectedEntropyDeletion_log_square e Γ L E q B K _ d he hn hB hd hBd hN hclock hK
    (by nlinarith [(Nat.cast_nonneg Γ.card : (0:ℝ)≤Γ.card)])
    (protectedExternalDeletion_power_bound e Γ L E q B K d γ he hn1 hBd hdγ hE hs hsp hq hqL hN hclock hK hvirtual).1

end NoThreeLine
#print axioms NoThreeLine.entropy_log_scale
#print axioms NoThreeLine.protectedEntropyDeletion_power_cost
