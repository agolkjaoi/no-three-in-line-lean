import NoThreeLine.FrozenOutsideCapacityInput
import NoThreeLine.AcceptedSectionMasks

/-! The actual fixed finite schedule tag tail, with its line-input premise
supplied by frozen capacity/G13. All 112 row acceptances remain explicit
until their numerical checks have been completed. -/
set_option autoImplicit false
set_option maxHeartbeats 1900000
noncomputable section
namespace NoThreeLine.FrozenCapacity
open FrozenReference AuxiliaryODE PrimitiveLines FiniteDirections FinitePhase
  GridChord SectionHeight BirthWitness

theorem exists_uniform_acceptedFrozen_tagCause_threshold_of_rows
    (hrows : ∀ i : Fin 112, RowAccepted i) (J : ℕ) (hJ : 0<J)
    (T d zeta kappa : ℝ) (hT : 0≤T) (hd : d<1) (hzeta : 0<zeta) (hkappa : 0<kappa) :
    ∃ N : ℕ, 2≤N ∧ ∀n≥N,
      ∀ (B : ℝ) (sch : Schedule J) (a : Fin J→CheckedAcceptedPhase 32768 8)
        (index : Fin J→Fin 15348),
        (∀j,PhaseMatches (a j) (index j)) → StrictMono index →
        (∀j,sch.duration j≤(249/250)*((phaseUnits (index j):ℝ)/100000000)) →
        ∀ (K M : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B),
        ((augInitialState B hB
          (scheduleProcessDeadline sch (acceptedProcessMasks (fun j=>(a j).phase))) 0).val.physical.process.accounts p).status=.active →
        K<2 → B≤(n:ℝ)^d → sch.total≤T →
        let mask := acceptedProcessMasks (fun j=>(a j).phase)
        let cs := scheduleSharedPhases sch mask (acceptedProcessMasks_bounds _) gamma16 B K (1/8)
        let deadline := scheduleProcessDeadline sch mask
        (phasePointMeasure cs ((n:ℝ)^(-zeta)) M deadline 0 hn hB p J).real
          (scheduledBoundaryCauseBefore cs ((n:ℝ)^(-zeta)) M deadline 0 hn
            (augInitialState B hB deadline 0) p .tag J)<kappa := by
  obtain ⟨N,hN,hbound⟩ := exists_uniform_schedule_tagCause_threshold J T (4/5) (1/8)
    d zeta kappa hT (by norm_num) hd hzeta hkappa
  refine ⟨max N 1610950,by omega,?_⟩
  intro n hnN B sch a index hm hi htime K M p hn hB hp hK hBn htotal
  have hn0 : N≤n := le_trans (le_max_left _ _) hnN
  have hncap : 1610950≤n := le_trans (le_max_right _ _) hnN
  refine hbound n hn0 B sch (acceptedProcessMasks (fun j=>(a j).phase))
    (acceptedProcessMasks_bounds _) gamma16 K M p hn hB hp hK ?_ hBn htotal ?_
  · intro j q
    exact (a j).phase.boardInput_binary q
  · intro L hL
    exact (acceptedOutsideInput_le_frozen_of_rows hrows sch hJ a index hm hi
      (249/250) (by norm_num) htime p L hL hn).trans (frozen_outside_discrete_margin hncap)

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.exists_uniform_acceptedFrozen_tagCause_threshold_of_rows
