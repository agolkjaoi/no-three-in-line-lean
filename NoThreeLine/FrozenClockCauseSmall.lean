import NoThreeLine.ClockFinitePhaseUniformTail
import NoThreeLine.ClockFinitePhasePolynomialLoss
import NoThreeLine.FrozenClockFinitePhaseCause

/-! The frozen specified-line input and the actual two occupancy-stage
tails give a uniform small point clock cause for a fixed number of phases. -/
set_option autoImplicit false
set_option maxHeartbeats 2200000
noncomputable section
open MeasureTheory
namespace NoThreeLine.FrozenCapacity
open FrozenReference AuxiliaryODE BirthWitness PrimitiveLines FiniteDirections FinitePhase SpecifiedBoardCount

theorem exists_accepted_frozen_clockCause_small_of_margin
    (T d γ lam δ tol : ℝ) (J : ℕ) (hT : 0≤T) (hJ : 0<J)
    (hd0 : 0≤d) (hdγ : d≤γ) (hγ : γ<1) (hδ : 0<δ)
    (hgap : lam+T*δ<255/128) (htol : 0<tol) :
    ∃n0 : ℕ,2≤n0 ∧ ∀n≥n0,
      ∀(sch : Schedule J) (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348),
      (∀j,PhaseMatches (a j) (index j)) → StrictMono index →
      ∀(B ρ ε : ℝ),0<ε →
      (∀j,sch.duration j≤(249/250)*((phaseUnits (index j):ℝ)/100000000)) →
      ∀(hn : 0<n) (hB : 1≤B),B≤(n:ℝ)^d → sch.total≤T →
      (249/250)*(639781503/320000000)+((249/250)*12312)/(n:ℝ)≤lam →
      ∀p : Grid n,
      let mask : Fin J→Grid n→ℝ := acceptedProcessMasks (fun j=>(a j).phase)
      let cs := scheduleSharedPhases sch mask (acceptedProcessMasks_bounds _) gamma16 B (255/128) ρ
      let deadline := scheduleProcessDeadline sch mask
      (phasePointMeasure cs ε ((n:ℝ)^γ) deadline 0 hn hB p J).real
        (scheduledBoundaryCauseBefore cs ε ((n:ℝ)^γ) deadline 0 hn
          (augInitialState B hB deadline 0) p .clock J)≤tol := by
  obtain ⟨nP,hnP,hP⟩ := exists_canonicalClockCell_phase_power_tail T 33 d γ δ J
    hT (by norm_num) hd0 hdγ hγ hδ hJ
  obtain ⟨nF,hnF,hF⟩ := exists_clockFinitePhase_point_bound_le (255/128) J 124 tol htol
  refine ⟨max nP nF,hnP.trans (le_max_left _ _),?_⟩
  intro n hnn sch a index hm hi B ρ ε hε hd hn hB hBd htime hmargin p
  let mask : Fin J→Grid n→ℝ := acceptedProcessMasks (fun j=>(a j).phase)
  let cs := scheduleSharedPhases sch mask (acceptedProcessMasks_bounds _) gamma16 B (255/128) ρ
  let deadline := scheduleProcessDeadline sch mask
  have hΓ (j : ℕ) : (cs j).directions=gamma16 :=
    scheduleSharedPhases_directions sch mask (acceptedProcessMasks_bounds _) gamma16 B (255/128) ρ j
  have hKcfg (j : ℕ) : (cs j).K=255/128 := by
    dsimp only [cs,scheduleSharedPhases]
    split <;> rfl
  have hphase := hP n ((le_max_left _ _).trans hnn) B cs gamma16 ε (255/128) hn hΓ
    (by rw [gamma16_card_and_lineCount.1]; norm_num)
    (fun j hj=>(scheduleSharedPhases_horizon_le_total sch mask (acceptedProcessMasks_bounds _)
      gamma16 B (255/128) ρ j hj).trans htime) hB hBd (fun j=>(hKcfg j).le) (by norm_num)
  have hmpos : 0<(n:ℝ)^γ := Real.rpow_pos_of_pos (by exact_mod_cast hn) _
  have hclock := accepted_frozen_clockCause_point_real_le_of_phase sch hJ a index hm hi
    B ρ ε ((n:ℝ)^γ) T lam δ hε hmpos hd hn hB hδ.le htime hgap hmargin p
    (2*(n:ℝ)^(-(3:ℝ))) (by positivity)
    (fun L hL i=>hphase L (Finset.mem_filter.mp hL).2 i)
  have hn1 : (1:ℝ)≤n := by exact_mod_cast (show 1≤n by omega)
  have hBn : B≤n := hBd.trans (by
    simpa only [Real.rpow_one] using Real.rpow_le_rpow_of_exponent_le hn1 (hdγ.trans_lt hγ).le)
  exact hclock.trans (hF n ((le_max_right _ _).trans hnn) B (zero_le_one.trans hB) hBn)

theorem exists_accepted_frozen_clockCause_small
    (T d γ tol : ℝ) (J : ℕ) (hT : 0≤T) (hJ : 0<J)
    (hd0 : 0≤d) (hdγ : d≤γ) (hγ : γ<1) (htol : 0<tol) :
    ∃n0 : ℕ,2≤n0 ∧ ∀n≥n0,
      ∀(sch : Schedule J) (a : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348),
      (∀j,PhaseMatches (a j) (index j)) → StrictMono index →
      ∀(B ρ ε : ℝ),0<ε →
      (∀j,sch.duration j≤(249/250)*((phaseUnits (index j):ℝ)/100000000)) →
      ∀(hn : 0<n) (hB : 1≤B),B≤(n:ℝ)^d → sch.total≤T →
      ∀p : Grid n,
      let mask : Fin J→Grid n→ℝ := acceptedProcessMasks (fun j=>(a j).phase)
      let cs := scheduleSharedPhases sch mask (acceptedProcessMasks_bounds _) gamma16 B (255/128) ρ
      let deadline := scheduleProcessDeadline sch mask
      (phasePointMeasure cs ε ((n:ℝ)^γ) deadline 0 hn hB p J).real
        (scheduledBoundaryCauseBefore cs ε ((n:ℝ)^γ) deadline 0 hn
          (augInitialState B hB deadline 0) p .clock J)≤tol := by
  obtain ⟨lam,δ,hδ,hgap,N,hN,hmargin⟩ := exists_uniform_frozenClockSlack T hT
  obtain ⟨n0,hn0,hsmall⟩ := exists_accepted_frozen_clockCause_small_of_margin T d γ lam δ tol J
    hT hJ hd0 hdγ hγ hδ hgap htol
  refine ⟨max n0 N,hn0.trans (le_max_left _ _),?_⟩
  intro n hnn sch a index hm hi B ρ ε hε hd hn hB hBd htime p
  exact hsmall n ((le_max_left _ _).trans hnn) sch a index hm hi B ρ ε hε hd hn hB hBd htime
    (hmargin n ((le_max_right _ _).trans hnn)) p

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.exists_accepted_frozen_clockCause_small_of_margin
#print axioms NoThreeLine.FrozenCapacity.exists_accepted_frozen_clockCause_small
