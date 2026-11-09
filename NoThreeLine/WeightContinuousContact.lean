import NoThreeLine.ScheduledRawWeightHit
import NoThreeLine.VirtualGuardHit

/-! A weight-cap contact on an actually executed continuous segment is at
the physical/combined guard endpoint. The candidate tie is kept explicit. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem weightContact_eq_actual_endpoint {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hs : x.1.1.val.process.stopped = false) (p : Grid n)
    (hp : (x.1.1.val.process.accounts p).status = .active) (wait t : ℝ)
    (ht : t ∈ Icc (0 : ℝ) (augAdvance cfg ε M (x,wait)))
    (hh : cfg.B ≤ (selectedCurve cfg (x.1.1,t)).1 p) :
    t = augAdvance cfg ε M (x,wait) ∧ t = augGuardTime cfg ε M x ∧
      t = selectedGuardTime cfg x.1.1 := by
  have ha := augAdvance_mem cfg ε M x he wait
  have hg := (augGuardTime_mem cfg ε M x he).2
  have hge : selectedGuardTime cfg x.1.1 ≤ t := by
    by_contra hn
    have hz := (selectedCurve_spec cfg x.1.1 he.2.1).2.2.2.1 t ⟨ht.1,lt_of_not_ge hn⟩
    exact (not_le_of_gt (pendingGuardSet_avoids_weight x.1.1.val.process cfg.directions cfg.B cfg.K cfg.rho
      x.1.1.val.handled (selectedCurve cfg (x.1.1,t)) hs hz p hp)) hh
  exact ⟨le_antisymm ht.2 (ha.2.trans (hg.trans hge)),
    le_antisymm (ht.2.trans ha.2) (hg.trans hge),
    le_antisymm (ht.2.trans (ha.2.trans hg)) hge⟩

def weightGuardPhysical {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) : ExtendedState n :=
  selectedTrajectory cfg ((augTimedInput cfg s).1.1,augGuardTime cfg ε M (augTimedInput cfg s))

theorem weightGuardPhysical_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (weightGuardPhysical cfg ε M) :=
  (selectedTrajectory_measurable cfg).comp
    ((augTimedInput_measurable cfg).fst.fst.prodMk
      ((augGuardTime_measurable cfg ε M).comp (augTimedInput_measurable cfg)))

def weightSegmentContact {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (x : AugTimedState cfg × CandidateData n) : Prop :=
  ¬AugTimedDone cfg x.1 ∧ ∃ t,
    t ∈ Icc (0 : ℝ) (augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1)) ∧
    ((selectedTrajectory cfg ((augTimedInput cfg x.1).1.1,t)).process.accounts p).status = .active ∧
    cfg.B ≤ ((selectedTrajectory cfg ((augTimedInput cfg x.1).1.1,t)).process.accounts p).weight

theorem weightSegmentContact_iff_endpoint {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (x : AugTimedState cfg × CandidateData n) :
    weightSegmentContact cfg ε M p x ↔ ¬AugTimedDone cfg x.1 ∧
      augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1) = augGuardTime cfg ε M (augTimedInput cfg x.1) ∧
      ((weightGuardPhysical cfg ε M x.1).process.accounts p).status = .active ∧
      cfg.B ≤ ((weightGuardPhysical cfg ε M x.1).process.accounts p).weight := by
  constructor
  · rintro ⟨hd,t,ht,hp,hh⟩
    have hs : x.1.val.1.physical.process.stopped = false := Bool.eq_false_iff.mpr (not_or.mp hd).2
    have he := weightContact_eq_actual_endpoint cfg ε M (augTimedInput cfg x.1) x.1.property.1.1
      hs p hp x.2.1.1 t ht hh
    refine ⟨hd,he.1.symm.trans he.2.1,?_,?_⟩
    · exact hp
    · rw [weightGuardPhysical,← he.2.1]
      exact hh
  · rintro ⟨hd,ha,hp,hh⟩
    refine ⟨hd,augGuardTime cfg ε M (augTimedInput cfg x.1),?_,hp,hh⟩
    rw [ha]
    exact ⟨(augGuardTime_mem cfg ε M (augTimedInput cfg x.1) x.1.property.1.1).1,le_rfl⟩

theorem weightSegmentContact_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (weightSegmentContact cfg ε M p) := by
  have he : weightSegmentContact cfg ε M p = (fun x : AugTimedState cfg × CandidateData n =>
      ¬AugTimedDone cfg x.1 ∧
      augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1) = augGuardTime cfg ε M (augTimedInput cfg x.1) ∧
      ((weightGuardPhysical cfg ε M x.1).process.accounts p).status = .active ∧
      cfg.B ≤ ((weightGuardPhysical cfg ε M x.1).process.accounts p).weight) := by
    funext x
    exact propext (weightSegmentContact_iff_endpoint cfg ε M p x)
  rw [he]
  have hi := (augTimedInput_measurable cfg).comp (measurable_fst : Measurable
    (Prod.fst : AugTimedState cfg × CandidateData n → AugTimedState cfg))
  have hc := (ProcessState.measurable_account n p).comp ((ExtendedState.measurable_process n).comp
    ((weightGuardPhysical_measurable cfg ε M).comp (measurable_fst : Measurable
      (Prod.fst : AugTimedState cfg × CandidateData n → AugTimedState cfg))))
  exact ((augTimedDone_measurable cfg).comp measurable_fst).not.and
    ((((augAdvance_measurable cfg ε M).comp (hi.prodMk measurable_snd.fst.fst)).eq
      ((augGuardTime_measurable cfg ε M).comp hi)).and
      (((CreditAccount.measurable_status.comp hc).eq_const .active).and
        (measurable_const.le' (CreditAccount.measurable_weight.comp hc))))

theorem weightSegmentContact_rawHit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (x : AugTimedState cfg × CandidateData n)
    (hh : weightSegmentContact cfg ε M p x) (hw : 0 ≤ x.2.1.1)
    (hne : x.2.1.1 ≠ augGuardTime cfg ε M (augTimedInput cfg x.1)) :
    rawWeightCapHit cfg ε M p x := by
  obtain ⟨hd,ha,hp,hcap⟩ := (weightSegmentContact_iff_endpoint cfg ε M p x).mp hh
  have hle : augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1) ≤ x.2.1.1 :=
    max_le hw (min_le_right _ _)
  rw [ha] at hle
  have hlate := lt_of_le_of_ne hle hne.symm
  refine ⟨hd,?_,?_⟩ <;>
    rw [augRawOutcome_physical_eq_guard_of_late cfg ε M (augTimedInput cfg x.1) x.1.property.1.1 x.2 hlate]
  · exact hp
  · exact hcap

end NoThreeLine

#print axioms NoThreeLine.weightContact_eq_actual_endpoint
#print axioms NoThreeLine.weightSegmentContact_measurable
#print axioms NoThreeLine.weightSegmentContact_rawHit
