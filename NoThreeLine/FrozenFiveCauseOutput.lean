import NoThreeLine.FrozenClockCauseSmall
import NoThreeLine.FrozenOtherThreeCauses
import NoThreeLine.FrozenOutsideTagSmall
import NoThreeLine.ScheduleFiveCauseOutput

/-! The five actual retirement causes share one frozen schedule, root
deadline, guard scales and point law. The remaining schedule inputs are
the accepted finite geometry, mass and root-deadline pair bound. -/
set_option autoImplicit false
set_option maxHeartbeats 2900000
noncomputable section
open MeasureTheory
namespace NoThreeLine.FrozenCapacity
open FrozenReference AuxiliaryODE BirthWitness FinitePhase FiniteDirections

theorem exists_uniform_accepted_frozen_output_of_inputs
    (hrows : ∀ i : Fin 112, RowAccepted i)
    (T a d γ ζ mass : ℝ) (J : ℕ) (hT : 0≤T) (hJ : 0<J)
    (ha : 0≤a) (had : a<d) (hdγ : d<γ) (hγ : γ<1)
    (hζ : 0<ζ) (hζd : ζ<1-d) (hmass : (1501/1000:ℝ)<mass) :
    ∃n0 : ℕ,2≤n0 ∧ ∀n≥n0,
      ∀(sch : Schedule J) (aPhase : Fin J→CheckedAcceptedPhase 32768 8) (index : Fin J→Fin 15348),
      (∀j,PhaseMatches (aPhase j) (index j)) → StrictMono index →
      (∀j,sch.duration j≤(249/250)*((phaseUnits (index j):ℝ)/100000000)) → sch.total≤T →
      let mask := acceptedProcessMasks (fun j=>(aPhase j).phase)
      mass≤sch.boardInputMass mask →
      (∀p : Grid n,0<scheduleProcessDeadline sch mask p →
        normalizedPairSum p (fun q=>sch.cumulative (fun j=>mask j q)
          (scheduleProcessDeadline sch mask p))≤a*Real.log n) →
      ∃S : Finset (Grid n),NoThree S ∧ 1501*n≤1000*S.card := by
  let κ := (mass-1501/1000)/(10*mass)
  have hmass0 : 0<mass := by linarith
  have hκ : 0<κ := div_pos (sub_pos.mpr hmass) (by positivity)
  have hret : (1-5*κ)*mass=(mass+1501/1000)/2 := by
    dsimp [κ]
    field_simp [hmass0.ne']
    <;> ring
  have hret0 : 0≤1-5*κ := by
    refine nonneg_of_mul_nonneg_left ?_ hmass0
    rw [hret]
    linarith
  obtain ⟨n3,hn3,h3⟩ := exists_uniform_frozen_weight_eta_virtual_small T a d γ ζ κ
    hT ha had hdγ hγ hζ hζd hκ
  obtain ⟨nC,_,hC⟩ := exists_accepted_frozen_clockCause_small T d γ κ J hT hJ
    (ha.trans had.le) hdγ.le hγ hκ
  obtain ⟨nT,_,hTag⟩ := exists_uniform_acceptedFrozen_tagCause_threshold_of_rows hrows J hJ
    T d ζ κ hT (hdγ.trans hγ) hζ hκ
  refine ⟨max n3 (max nC nT),hn3.trans (le_max_left _ _),?_⟩
  intro n hnN sch aPhase index hm hi htime htotal mask hml hpair
  have hn3n : n3≤n := (le_max_left _ _).trans hnN
  have hnCn : nC≤n := (le_max_left _ _).trans ((le_max_right _ _).trans hnN)
  have hnTn : nT≤n := (le_max_right _ _).trans ((le_max_right _ _).trans hnN)
  have hn : 0<n := by omega
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  let B := (n:ℝ)^d
  have hB : 1≤B := Real.one_le_rpow (by exact_mod_cast (show 1≤n by omega)) (ha.trans had.le)
  let ε := (n:ℝ)^(-ζ)
  let M := (n:ℝ)^γ
  have hε : 0<ε := Real.rpow_pos_of_pos hnR _
  let deadline := scheduleProcessDeadline sch mask
  have hcause := schedule_exists_noThree_from_five_causes sch mask (acceptedProcessMasks_bounds _)
    gamma16 B (255/128) (1/8) ε M hn hB (5*κ)
  obtain ⟨S,hS,hcard⟩ := hcause (by
    intro p hp
    obtain ⟨hWeight,hEta,hVirt⟩ := h3 n hn3n J sch mask (acceptedProcessMasks_bounds _) p htotal hp (hpair p hp)
    have hclock := hC n hnCn sch aPhase index hm hi B (1/8) ε hε htime hn hB le_rfl htotal p
    have hinit := augInitialState_active_of_before_deadline B hB deadline 0 p hp
    have htag := hTag n hnTn B sch aPhase index hm hi htime (255/128) M p hn hB hinit (by norm_num) le_rfl htotal
    dsimp only at hWeight hEta hVirt hclock htag ⊢
    linarith only [hWeight,hEta,hVirt,hclock,htag.le])
  have hlast : (1501/1000:ℝ)*(n:ℝ)≤(S.card:ℝ) := by
    calc
      _ ≤ ((mass+1501/1000)/2)*(n:ℝ) :=
        mul_le_mul_of_nonneg_right (by linarith) hnR.le
      _ = (1-5*κ)*((n:ℝ)*mass) := by rw [←hret]; ring
      _ ≤ (1-5*κ)*((n:ℝ)*sch.boardInputMass mask) :=
        mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hml hnR.le) hret0
      _ ≤ _ := hcard
  refine ⟨S,hS,?_⟩
  exact_mod_cast (show (1501:ℝ)*(n:ℝ)≤1000*(S.card:ℝ) by linarith only [hlast])

end NoThreeLine.FrozenCapacity

#print axioms NoThreeLine.FrozenCapacity.exists_uniform_accepted_frozen_output_of_inputs

