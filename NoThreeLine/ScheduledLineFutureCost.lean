import NoThreeLine.SavedBirthGateIntegral
import NoThreeLine.LongLineRetention
import NoThreeLine.SchedulePrefix

/-! The actual selected-line main mass on a literal analytic prefix is
paid by the saved witness's recorded-birth future cost. Physical phases,
deadlines and the full terminal point measure are not replaced. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE GridLines

theorem lineMaskRate_eq_rate {P n : ℕ} (s : FinitePhase.Schedule P)
    (mask : Fin P→Grid n→ℝ) (p z : Grid n) (t : ℝ) :
    lineMaskRate s mask p z t=s.rate (fun j=>∑q∈witnessLeaves p z,mask j q) t := by
  unfold lineMaskRate FinitePhase.Schedule.rate FinitePhase.rate
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro j _
  by_cases ht : t∈Ico (s.lo j) (s.hi j)
  · simp [FinitePhase.pulse,ht]
  · simp [FinitePhase.pulse,ht]

theorem savedLineFutureCost_eq_phase_sum {P n : ℕ} (s : FinitePhase.Schedule P)
    (mask : Fin P→Grid n→ℝ) (p z : Grid n) (b : BirthRecords n) :
    (∑j : Fin P,∫t in (0:ℝ)..s.duration j,
      recordedBirthGate b z (s.lo j+t)*(∑q∈witnessLeaves p z,mask j q))/n=
      if (b z).1=true then lineFutureCost s mask p z (b z).2 else 0 := by
  rw [←schedule_recordedBirthGate_integral]
  have he : s.rate (fun j=>∑q∈witnessLeaves p z,mask j q)=lineMaskRate s mask p z :=
    funext (fun t=>(lineMaskRate_eq_rate s mask p z t).symm)
  rw [he,recordedBirthGate_integral b z _ (lineMaskRate_integrable s mask p z) s.total s.total_nonneg]
  by_cases hb : (b z).1=true <;> simp [hb,lineFutureCost]

theorem scheduledLineMain_sum_le_futureCost_point_ae {P n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (J : ℕ) (hPJ : P≤J)
    (s : FinitePhase.Schedule P) (mask : Fin P→Grid n→ℝ)
    (hmask : ∀j : Fin P,(cs j.val).mask=mask j)
    (hlo : ∀j : Fin P,phaseEndpoint cs 0 j.val=s.lo j)
    (hH : ∀j : Fin P,((cs j.val).horizon:ℝ)=s.duration j)
    (L : LineIndex n) (z : Grid n) (hL : L.val=lineThrough p z) :
    ∀ᵐω∂phasePointMeasure cs ε M deadline 0 hn hB p J,
    (∑N∈Finset.range P,scheduledLineMainPath cs ε M deadline 0 hn hB (cs N).mask L p z N ω)/n≤
      if (initialRootPhaseRecords cs ε M deadline 0 p hn hB J ω z).1=true then
        lineFutureCost s mask p z (initialRootPhaseRecords cs ε M deadline 0 p hn hB J ω z).2 else 0 := by
  have hae := ae_all_iff.mpr (fun j : Fin P=>
    scheduledLineMainPath_le_savedBirthGate_point_ae cs ε M deadline 0 p hn hB j.val J
      (j.isLt.trans_le hPJ) (cs j.val).mask (cs j.val).mask_nonneg L z)
  filter_upwards [hae] with ω hω
  rw [←savedLineFutureCost_eq_phase_sum s mask p z
    (initialRootPhaseRecords cs ε M deadline 0 p hn hB J ω)]
  apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
  rw [←Fin.sum_univ_eq_sum_range]
  apply Finset.sum_le_sum
  intro j _
  have hh := hω j
  rw [hH j,hlo j,hmask j] at hh
  have hleaf : lineLeafSites L p z=witnessLeaves p z := by rw [lineLeafSites,hL]; rfl
  simpa only [hleaf,hmask j] using hh

theorem scheduledLineMain_prefix_le_futureCost_point_ae {P n : ℕ}
    (s : FinitePhase.Schedule P) (mask : Fin P→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ)) (B K ρ ε M : ℝ)
    (deadline : Grid n→ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (k J : ℕ) (hk : k≤P) (hkJ : k≤J) (L : LineIndex n) (z : Grid n)
    (hL : L.val=lineThrough p z) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    ∀ᵐω∂phasePointMeasure cs ε M deadline 0 hn hB p J,
    (∑N∈Finset.range k,scheduledLineMainPath cs ε M deadline 0 hn hB (cs N).mask L p z N ω)/n≤
      if (initialRootPhaseRecords cs ε M deadline 0 p hn hB J ω z).1=true then
        lineFutureCost (s.prefix k hk) (FinitePhase.prefixMask hk mask) p z
          (initialRootPhaseRecords cs ε M deadline 0 p hn hB J ω z).2 else 0 := by
  dsimp only
  apply scheduledLineMain_sum_le_futureCost_point_ae _ ε M deadline p hn hB J hkJ
    (s.prefix k hk) (FinitePhase.prefixMask hk mask) _ _ _ L z hL
  · intro j
    exact scheduleSharedPhases_mask s mask hm Γ B K ρ (j.castLE hk)
  · intro j
    exact scheduleSharedPhases_lo s mask hm Γ B K ρ (j.castLE hk)
  · intro j
    exact scheduleSharedPhases_horizon s mask hm Γ B K ρ (j.castLE hk)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.savedLineFutureCost_eq_phase_sum
#print axioms NoThreeLine.BirthWitness.scheduledLineMain_sum_le_futureCost_point_ae
#print axioms NoThreeLine.BirthWitness.scheduledLineMain_prefix_le_futureCost_point_ae
