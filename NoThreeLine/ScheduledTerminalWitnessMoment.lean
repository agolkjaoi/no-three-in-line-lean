import NoThreeLine.ScheduledTerminalLineMomentSum

/-! The witness sum includes both the squared line mass and the physical
self-rate term B times the first line mass. Every candidate witness is an
actual selected point different from the active root. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def scheduledTerminalWitnessMoment {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (L : LineIndex n)
    (p : Grid n) (J : ℕ) : ℝ :=
  ∑ z ∈ L.val.erase p,
    (scheduledTerminalLineMomentTotal cs ε M deadline start hn hB mask L p z 2 J +
      B*scheduledTerminalLineMomentTotal cs ε M deadline start hn hB mask L p z 1 J)

theorem scheduledTerminalWitnessMoment_bound {n : ℕ} {B : ℝ}
    (mask : ℕ → Grid n → ℝ) (hm : ∀ N q, 0 ≤ mask N q ∧ mask N q ≤ 1)
    (L : LineIndex n) (p : Grid n) (Γ : Finset ZPoint)
    (hL : ¬specified Γ L) (hpL : p ∈ L.val)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (J : ℕ) :
    0 ≤ scheduledTerminalWitnessMoment cs ε M deadline start hn hB mask L p J ∧
    scheduledTerminalWitnessMoment cs ε M deadline start hn hB mask L p J ≤
      (phaseEndpoint cs 0 J)^2/(n*(1-ε)^6)*((L.val.card : ℝ)^3+2*B*(L.val.card : ℝ)^2) := by
  classical
  let T := phaseEndpoint cs 0 J
  let d := (L.val.card : ℝ)
  have hT : 0 ≤ T := phaseEndpoint_zero_nonneg cs J
  have hd : 0 ≤ d := Nat.cast_nonneg _
  have hB0 : 0 ≤ B := zero_le_one.trans hB
  have hη : 0 < 1-ε := sub_pos.mpr hε
  have hpow : (1-ε)^6 ≤ (1-ε)^3 := by
    have h3 : (1-ε)^3 ≤ 1 := pow_le_one₀ hη.le (by linarith)
    have hh := mul_le_mul_of_nonneg_left h3 (pow_nonneg hη.le 3)
    nlinarith only [hh]
  have hcoef : (T/n)/(1-ε)^3 ≤ (T/n)/(1-ε)^6 :=
    div_le_div_of_nonneg_left (div_nonneg hT (Nat.cast_nonneg _)) (pow_pos hη 6) hpow
  let C := T*((T/n)/(1-ε)^6*(d^2+2*B*d))
  have hC : 0 ≤ C := by unfold C; positivity
  have hb (z : Grid n) (hz : z ∈ L.val.erase p) :=
    scheduledTerminalLineMomentTotal_low_bounds mask hm L p z Γ hL hpL
      (Finset.mem_erase.mp hz).2 (Finset.mem_erase.mp hz).1.symm
      cs ε M deadline start hn hB hΓ hK hε0 hε J
  constructor
  · exact Finset.sum_nonneg (fun z hz => add_nonneg (hb z hz).2.1 (mul_nonneg hB0 (hb z hz).1.1))
  · calc
      _ ≤ ∑ z ∈ L.val.erase p, C := by
        apply Finset.sum_le_sum
        intro z hz
        calc
          _ ≤ T*((T/n)/(1-ε)^6*(d^2+B*d)) + B*(T*((T/n)/(1-ε)^3*d)) :=
            add_le_add (hb z hz).2.2 (mul_le_mul_of_nonneg_left (hb z hz).1.2 hB0)
          _ ≤ T*((T/n)/(1-ε)^6*(d^2+B*d)) + B*(T*((T/n)/(1-ε)^6*d)) :=
            add_le_add le_rfl (mul_le_mul_of_nonneg_left
              (mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right hcoef hd) hT) hB0)
          _ = C := by unfold C; ring
      _ = ((L.val.erase p).card : ℝ)*C := by simp only [Finset.sum_const, nsmul_eq_mul]
      _ ≤ d*C := mul_le_mul_of_nonneg_right
        (by dsimp [d]; exact_mod_cast (show (L.val.erase p).card ≤ L.val.card from Finset.card_erase_le)) hC
      _ = _ := by
        change d*(T*((T/n)/(1-ε)^6*(d^2+2*B*d))) = T^2/(n*(1-ε)^6)*(d^3+2*B*d^2)
        field_simp
        <;> ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledTerminalWitnessMoment_bound
