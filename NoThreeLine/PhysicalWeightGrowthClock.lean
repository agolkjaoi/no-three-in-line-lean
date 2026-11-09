import NoThreeLine.ActualOutsideRisk

/-! Actual S1 weight growth is paid by the outside risk, the self birth
rate and the derivative of a finite specified-line clock budget. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine
open PrimitiveLines GridLines LineDrift AuxiliaryODE

def rootDesignatedClock {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (k : LineIndex n→ℝ) : ℝ :=
  ∑L : ↥(designatedLines Γ p), k ⟨L.val,designated_is_boardLine Γ p L.val L.property⟩

theorem rootDesignatedClock_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (k : LineIndex n→ℝ) (K : ℝ) (hK : 0≤K)
    (hk : ∀L : LineIndex n,L.val∈designatedLines Γ p → k L≤K) :
    rootDesignatedClock Γ p k≤Γ.card*K := by
  classical
  have hc : (designatedLines Γ p).card≤Γ.card :=
    (Finset.card_le_card Finset.inter_subset_left).trans
      ((Finset.card_image_le).trans (Finset.card_filter_le _ _))
  calc
    _ ≤ ∑_L : ↥(designatedLines Γ p),K := Finset.sum_le_sum (fun L _=>hk _ L.property)
    _ = (designatedLines Γ p).card*K := by simp
    _ ≤ _ := mul_le_mul_of_nonneg_right (by exact_mod_cast hc) hK

theorem designated_growth_le_clockRHS {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (k r : LineIndex n→ℝ)
    (p : Grid n) (L : LineIndex n) (K : ℝ)
    (hs : s.Valid) (hm : ∀q,0≤mask q) (hstop : s.stopped=false)
    (hp : (s.accounts p).status=.active) (hL : L.val∈designatedLines Γ p)
    (hK : K<2) (hk : k L≤K) :
    ((∑q∈L.val,s.birthRate mask q)-s.birthRate mask p)*b (s.selected∩L.val).card≤
      clockRHS s Γ mask ((fun q=>(s.accounts q).weight),(k,r)) L/(2-K) := by
  have hN : occupancy s L≤1 := state_designated_count_le_one s Γ p hs hp L.val hL
  have hNr : ((occupancy s L):ℝ)≤1 := by exact_mod_cast hN
  have hb : 0≤b (occupancy s L) := by unfold b; exact div_nonneg (by norm_num) (by linarith)
  have hrate : 0≤∑q∈L.val,s.birthRate mask q := Finset.sum_nonneg (fun q _=>s.birthRate_nonneg mask hm hs q)
  have hp0 := s.birthRate_nonneg mask hm hs p
  have hden : 0<2-K := by linarith
  rw [clockRHS,if_pos ⟨hstop,designated_specified Γ p L hL,hN⟩,lineIntensity_at_state]
  apply (le_div_iff₀ hden).mpr
  calc
    _ ≤ ((∑q∈L.val,s.birthRate mask q)*b (occupancy s L))*(2-K) :=
      mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right (sub_le_self _ hp0) hb) hden.le
    _ ≤ ((∑q∈L.val,s.birthRate mask q)*b (occupancy s L))*(2-k L) :=
      mul_le_mul_of_nonneg_left (by linarith) (mul_nonneg hrate hb)
    _ = _ := by unfold b; ring

theorem actualWeightDrift_le_risk_clock {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (p : Grid n) (K : ℝ)
    (he : e.process.Valid) (hm : ∀q,0≤mask q) (hstop : e.process.stopped=false)
    (hp : (e.process.accounts p).status=.active) (hK : K<2)
    (hk : ∀L : LineIndex n,L.val∈designatedLines Γ p → e.clocks L≤K) :
    e.process.continuousCreditDrift Γ (e.process.birthRate mask) p≤
      (e.process.accounts p).weight*(e.process.birthRate mask p+
        BirthWitness.physicalOutsideRisk Γ mask p e+
        rootDesignatedClock Γ p (fun L=>clockRHS e.process Γ mask e.coordinates L)/(2-K)) := by
  rw [state_continuousDrift_S1 e.process Γ mask p he hstop hp]
  have hpa : p∈e.process.activeEvents := (e.process.mem_activeEvents p).mpr hp
  rw [BirthWitness.physicalOutsideRisk_eq_S1 Γ mask p e he,if_pos hpa]
  apply mul_le_mul_of_nonneg_left _ (he.2.2 p)
  apply add_le_add le_rfl
  rw [rootDesignatedClock,Finset.sum_div]
  rw [←Finset.sum_coe_sort (designatedLines Γ p)]
  exact Finset.sum_le_sum (fun L _=>designated_growth_le_clockRHS e.process Γ mask
    e.clocks e.lineCredits p ⟨L.val,designated_is_boardLine Γ p L.val L.property⟩ K
    he hm hstop hp L.property hK
    (hk ⟨L.val,designated_is_boardLine Γ p L.val L.property⟩ L.property))

end NoThreeLine

#print axioms NoThreeLine.rootDesignatedClock_le
#print axioms NoThreeLine.designated_growth_le_clockRHS
#print axioms NoThreeLine.actualWeightDrift_le_risk_clock
