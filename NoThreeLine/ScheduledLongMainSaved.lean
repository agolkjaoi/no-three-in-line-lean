import NoThreeLine.ScheduledLineFutureCost
import NoThreeLine.LongWitnessReindex
import NoThreeLine.ScheduledProxyMainExcess
import NoThreeLine.RootPhaseMomentExpansion

/-! The actual prefix long main path is bounded, under the original full-J
point law, by the already constructed saved witness sum with deterministic
birth-time future-cost retention. Only the analytic schedule is restricted;
the physical deadline function and full process are kept verbatim. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines GridLines FiniteDirections

theorem scheduledLongMain_prefix_le_saved_witness_point_ae {P n : ℕ}
    (s : FinitePhase.Schedule P) (mask : Fin P→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint) (B K ρ ε M : ℝ)
    (deadline : Grid n→ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (k J : ℕ) (hk : k≤P) (hkJ : k≤J) (H : ℝ) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let e := longWitnessRetention (s.prefix k hk) (FinitePhase.prefixMask hk mask)
      (FinitePhase.prefixMask_bounds hk mask hm) Γ p H
    ∀ᵐω∂phasePointMeasure cs ε M deadline 0 hn hB p J,
    scheduledLongMainPath cs ε M deadline 0 hn hB Γ p k H ω≤
      witnessSum (longWitnessWeight (s.prefix k hk) Γ p H)
        (initialRootPhaseWitness cs ε M deadline 0 p hn hB e J ω) := by
  classical
  dsimp only
  let cs := scheduleSharedPhases s mask hm Γ B K ρ
  let b := fun ω=>initialRootPhaseRecords cs ε M deadline 0 p hn hB J ω
  let f := fun ω z=>if (b ω z).1=true then
    lineFutureCost (s.prefix k hk) (FinitePhase.prefixMask hk mask) p z (b ω z).2 else 0
  have hae : ∀ᵐω∂phasePointMeasure cs ε M deadline 0 hn hB p J,
      ∀L : RootBoardLineIndex p,∀z : Grid n,z∈L.val.val.erase p→
      (∑N∈Finset.range k,scheduledLineMainPath cs ε M deadline 0 hn hB (cs N).mask L.val p z N ω)/n≤f ω z := by
    apply ae_all_iff.mpr
    intro L
    apply ae_all_iff.mpr
    intro z
    by_cases hz : z∈L.val.val.erase p
    · have he : L.val.val=lineThrough p z :=
        congrArg (fun A : RootBoardLineIndex p=>A.val.val)
          (rootBoardLine_unique p z (Finset.ne_of_mem_erase hz).symm L (Finset.mem_of_mem_erase hz))
      filter_upwards [scheduledLineMain_prefix_le_futureCost_point_ae s mask hm Γ B K ρ ε M
        deadline p hn hB k J hk hkJ L.val z he] with ω hω
      exact fun _=>hω
    · exact ae_of_all _ (fun _ hz'=>False.elim (hz hz'))
  filter_upwards [hae] with ω hω
  calc
    _ ≤ ∑L∈longRootBoardLines Γ p H,∑z∈L.val.val.erase p,f ω z := by
      unfold scheduledLongMainPath
      apply Finset.sum_le_sum
      intro L _
      rw [Finset.sum_div]
      exact Finset.sum_le_sum (fun z hz=>hω L z hz)
    _ = ∑z : Grid n,if longWitnessEligible Γ p H z then f ω z else 0 :=
      longRootBoardLine_witness_sum Γ p H (f ω)
    _ = _ := by
      have he := longWitnessSum_eq_recorded_cost (s.prefix k hk) (FinitePhase.prefixMask hk mask)
        (FinitePhase.prefixMask_bounds hk mask hm) Γ p H
        (rootPhaseRecycledState cs ε M deadline 0 p hn
          (initialGoodPhaseRootObservation B hB p deadline 0) J ω).val.2.2.1 (b ω)
      change _=witnessSum (longWitnessWeight (s.prefix k hk) Γ p H)
        ⟨_,recordedValue (longWitnessRetention (s.prefix k hk) (FinitePhase.prefixMask hk mask)
          (FinitePhase.prefixMask_bounds hk mask hm) Γ p H) (b ω)⟩
      rw [he]
      apply Finset.sum_congr rfl
      intro z _
      by_cases hb : (b ω z).1=true <;> by_cases hz : longWitnessEligible Γ p H z <;>
        simp [f,longWitnessCost,hb,hz]

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledLongMain_prefix_le_saved_witness_point_ae
