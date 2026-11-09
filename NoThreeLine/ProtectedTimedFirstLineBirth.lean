import NoThreeLine.ProtectedCrossingObserver
import NoThreeLine.ProtectedLedgerBirth
import NoThreeLine.ProtectedLedgerGlobalBounds

/-! At the actual first line birth, the surviving normalized credits
are preserved. The selected entry vanishes, even through resolution. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedTimedCredit_firstLineBirth {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L)
    (s : ProtectedTimedState cfg) (z : CandidateData n) (p : Grid n) (hp : p∈L.val)
    (hN : occupancy s.1.val.1.physical.process L=0)
    (hb : timedBirth cfg ε M (s.1,z)) (hqL : z.1.2∈L.val) :
    protectedTimedCredit cfg L p (protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z)))=
      if p=z.1.2 then 0 else
        protectedLineCredit L (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
          birthElapsed cfg ε M (s.1,z))) s.2 p := by
  let x := augTimedInput cfg s.1
  let e := (augPreState cfg ε M (x,z)).physical
  let v := e.birth cfg.directions z.1.2 (fun _=>false)
  have he : e.Valid cfg.B :=
    (augPreState_valid cfg ε M x s.1.property.1.1 s.1.property.1.2 z).1
  have hw : 0<z.1.1 ∧ z.1.1≤augGuardTime cfg ε M x := hb.2.1
  have ha : z.2≤e.process.acceptance cfg.mask cfg.B z.1.2 := hb.2.2.1
  have hraw : (augRawOutcome cfg ε M (x,z)).physical=v := by
    simp only [augRawOutcome,if_pos hw,ExtendedState.candidateUpdate_eq,show z.2≤
      (augPreState cfg ε M (x,z)).physical.process.acceptance cfg.mask cfg.B z.1.2 from ha,if_true,v,e]
  have ht : e=selectedTrajectory cfg (x.1.1,birthElapsed cfg ε M (s.1,z)) := by
    simp only [birthElapsed,if_neg (show ¬birthDone cfg s.1 from hb.1)]
    rfl
  change protectedLineCredit L (augTimedStepPair cfg ε M (s.1,z)).1.physical
    (protectedLineSave L s.1.val.1.physical (augTimedStepPair cfg ε M (s.1,z)).1.physical s.2) p=_
  simp only [augTimedStepPair,if_neg hb.1]
  change protectedLineCredit L (augOutcome cfg ε M (x,z)).physical
    (protectedLineSave L x.1.1.val (augOutcome cfg ε M (x,z)).physical s.2) p=_
  rw [protectedLedger_augOutcome_eq_raw cfg ε M L x s.2 p z,hraw]
  change protectedLineCredit L v (protectedLineSave L e v s.2) p=
    if p=z.1.2 then 0 else protectedLineCredit L
      (selectedTrajectory cfg (x.1.1,birthElapsed cfg ε M (s.1,z))) s.2 p
  rw [←ht]
  have hq : z.1.2∈e.process.activeEvents := (e.process.mem_activeEvents _).mpr hb.2.2.2.2
  by_cases hpq : p=z.1.2
  · subst p
    rw [if_pos rfl,protectedLineCredit_birth_eq_snapshot L e s.2 cfg.directions _ _ _
      hb.2.2.2.2]
    exact specifiedLineWeight_selected_birth e cfg.directions L _ hb.2.2.2.1 hq
  · rw [if_neg hpq]
    exact protectedLineCredit_first_line_birth L e s.2 cfg.directions _ _ _ he.1
      hb.2.2.2.1 hq hp hqL hsp hN hpq

theorem protectedStateTotal_firstLineBirth_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n))
    (hE : E⊆L.val) (A : ℝ→ℝ) (hA : Monotone A) (s : ProtectedTimedState cfg) (z : CandidateData n)
    (hN : occupancy s.1.val.1.physical.process L=0)
    (hb : timedBirth cfg ε M (s.1,z)) (hqL : z.1.2∈L.val)
    (hsv : ∀p∈L.val,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    protectedStateTotal cfg L E A (protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z)))≤
      protectedStateFlowTotal cfg L E A (s,birthElapsed cfg ε M (s.1,z)) := by
  unfold protectedStateTotal protectedStateFlowTotal protectedScalarTotal
  apply Finset.sum_le_sum
  intro p hp
  change A (protectedTimedCredit cfg L p (protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z))))≤_
  rw [protectedTimedCredit_firstLineBirth cfg ε M L hsp s z p (hE hp) hN hb hqL]
  split_ifs
  · apply hA
    let e := (augPreState cfg ε M (augTimedInput cfg s.1,z)).physical
    have he : e.Valid cfg.B :=
      (augPreState_valid cfg ε M (augTimedInput cfg s.1) s.1.property.1.1 s.1.property.1.2 z).1
    have ht : e=selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,birthElapsed cfg ε M (s.1,z)) := by
      simp only [birthElapsed,if_neg (show ¬birthDone cfg s.1 from hb.1)]
      rfl
    rw [←ht]
    exact (protectedLineCredit_bounds_all L e s.2 cfg.directions hsp p (hE hp) cfg.B he
      (hsv p (hE hp))).1
  · exact le_rfl

end NoThreeLine

#print axioms NoThreeLine.protectedTimedCredit_firstLineBirth
#print axioms NoThreeLine.protectedStateTotal_firstLineBirth_le

