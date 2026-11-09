import NoThreeLine.ProtectedCellOnePhasePowerTail
import NoThreeLine.ClockFinitePhaseLinearInput

/-! The actual one-phase estimate supplies both occupancy stages with a
fixed share of the canonical clock gap. No phase-tail premise remains. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

theorem exists_canonicalClockCell_phase_power_tail (T D d γ δ : ℝ) (J : ℕ)
    (hT : 0≤T) (hD : 0<D) (hd : 0≤d) (hdγ : d≤γ) (hγ : γ<1)
    (hδ : 0<δ) (hJ : 0<J) :
    ∃n0 : ℕ,2≤n0 ∧ ∀n≥n0,∀(B : ℝ) (cs : ℕ→SharedPhase n B)
      (Γ : Finset ZPoint) (ε K : ℝ) (hn : 0<n),
      (∀j,(cs j).directions=Γ) → 1+2*(Γ.card:ℝ)≤D →
      (∀j<J,((cs j).horizon:ℝ)≤T) → 1≤B → B≤(n:ℝ)^d →
      (∀j,(cs j).K≤K) → K<2 →
      ∀(L : LineIndex n),specified Γ L → ∀i : Fin J,
      canonicalClockCellPhaseTails cs ε ((n:ℝ)^γ) K L hn δ J i (2*(n:ℝ)^(-(3:ℝ))) := by
  let g := (δ/2)/(J:ℝ)
  have hg : 0<g := div_pos (by linarith) (by exact_mod_cast hJ)
  obtain ⟨n0,hn0,htail⟩ := exists_protectedCell_onePhase_power_tail T (1+δ) D d γ g 3
    hT (by linarith) hD hd hdγ hγ hg (by norm_num)
  refine ⟨n0,hn0,?_⟩
  intro n hnn B cs Γ ε K hn hΓ hcount htime hB hBd hKcfg hK L hsp i
  let E := L.val∩clockMaskCells cs J i
  let step := (δ/2)*(n:ℝ)/(J:ℝ)
  have hstep : g*(n:ℝ)=step := by dsimp [g,step]; ring
  have hcap := clockMaskCellCap_le_linear hn cs Γ L hsp δ J i
  have hpart (N : ℕ) (hN : N≤1) (lo hi : ℝ)
      (hhi : hi≤clockMaskCellCap cs L δ J i) :
      protectedUniformPhaseGapTail cs ε ((n:ℝ)^γ) K L N E id hn J lo hi step
        (2*(n:ℝ)^(-(3:ℝ))) := by
    intro j hj b _ hbhi v ho hk hs hsv hb
    have hspj : specified (cs j).config.directions L := by
      change specified (cs j).directions L
      rw [hΓ j]
      exact hsp
    have hcountj : 1+2*((cs j).config.directions.card:ℝ)≤D := by
      change 1+2*((cs j).directions.card:ℝ)≤D
      rw [hΓ j]
      exact hcount
    have hcredit : protectedTimedCreditTotal (cs j).config L E v≤b := hb
    exact htail n hnn (cs j).config ε K L N E hn v (b+step)
      (htime j hj) hcountj hB hBd (hKcfg j) hK (cs j).mask_le_one
      hspj hN Finset.inter_subset_left ho hk hs
      (fun q hq=>hsv q (Finset.mem_inter.mp hq).1)
      ((hbhi.trans hhi).trans hcap)
      (by rw [hstep]; exact add_le_add hcredit le_rfl)
  constructor
  · exact hpart 0 (by omega) (E.card:ℝ) (clockMaskCellCap cs L (δ/2) J i) (by
      unfold clockMaskCellCap
      have hprod : 0≤δ*(n:ℝ) := mul_nonneg hδ.le (Nat.cast_nonneg _)
      nlinarith)
  · exact hpart 1 le_rfl (clockMaskCellCap cs L (δ/2) J i) (clockMaskCellCap cs L δ J i) le_rfl

end NoThreeLine
#print axioms NoThreeLine.exists_canonicalClockCell_phase_power_tail
