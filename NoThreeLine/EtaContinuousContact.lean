import NoThreeLine.EtaRateCost

/-! Eta contact on the actual executed segment is exactly raw endpoint
contact. Candidate geometry preserves eta, so no no-tie assumption is needed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem etaContact_eq_actual_endpoint {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (wait t : ℝ)
    (ht : t∈Icc (0:ℝ) (augAdvance cfg ε M (x,wait))) (a b : Grid n) (hab : a≠b)
    (hh : selectedEtaCurve cfg (x.1,t) a b≤1-ε) :
    t=augAdvance cfg ε M (x,wait) ∧ t=augGuardTime cfg ε M x ∧ t=selectedAuxTime cfg ε M x.1 := by
  have ha := augAdvance_mem cfg ε M x he wait
  have hg := augGuardTime_le_aux cfg ε M x
  have hle : t≤selectedAuxTime cfg ε M x.1 := ht.2.trans (ha.2.trans hg)
  have hge : selectedAuxTime cfg ε M x.1≤t := by
    by_contra hn
    exact (not_le_of_gt ((selectedAuxTime_before cfg ε M x.1 t ht.1 (lt_of_not_ge hn)).1 a b hab)) hh
  exact ⟨le_antisymm ht.2 (ha.2.trans (hg.trans hge)),
    le_antisymm (ht.2.trans ha.2) (hg.trans hge),le_antisymm hle hge⟩

def etaRawPairHit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n)
    (x : AugTimedState cfg×CandidateData n) : Prop :=
  ¬AugTimedDone cfg x.1 ∧ (augRawOutcome cfg ε M (augTimedInput cfg x.1,x.2)).eta a b≤1-ε

def etaSegmentContact {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n)
    (x : AugTimedState cfg×CandidateData n) : Prop :=
  ¬AugTimedDone cfg x.1 ∧ ∃t,t∈Icc (0:ℝ) (augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1)) ∧
    selectedEtaCurve cfg ((augTimedInput cfg x.1).1,t) a b≤1-ε

theorem etaSegmentContact_iff_raw {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hab : a≠b) (x : AugTimedState cfg×CandidateData n) :
    etaSegmentContact cfg ε M a b x ↔ etaRawPairHit cfg ε M a b x := by
  constructor
  · rintro ⟨hd,t,ht,hh⟩
    have he := etaContact_eq_actual_endpoint cfg ε M (augTimedInput cfg x.1) x.1.property.1.1
      x.2.1.1 t ht a b hab hh
    refine ⟨hd,?_⟩
    rw [augRawOutcome_eta_eq_curve,←he.1]
    exact hh
  · rintro ⟨hd,hh⟩
    refine ⟨hd,augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1),?_,?_⟩
    · exact ⟨(augAdvance_mem cfg ε M (augTimedInput cfg x.1) x.1.property.1.1 x.2.1.1).1,le_rfl⟩
    · rwa [augRawOutcome_eta_eq_curve] at hh

theorem etaRawPairHit_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (a b : Grid n) :
    Measurable (etaRawPairHit cfg ε M a b) := by
  have hr := (augRawOutcome_measurable cfg ε M).comp
    (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd)
  have hη := (measurable_pi_apply b).comp ((measurable_pi_apply a).comp
    ((AugmentedState.measurable_eta n).comp hr))
  exact ((augTimedDone_measurable cfg).comp measurable_fst).not.and (hη.le' measurable_const)

theorem etaSegmentContact_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (a b : Grid n) (hab : a≠b) : Measurable (etaSegmentContact cfg ε M a b) := by
  have he : etaSegmentContact cfg ε M a b=etaRawPairHit cfg ε M a b :=
    funext (fun x=>propext (etaSegmentContact_iff_raw cfg ε M a b hab x))
  rw [he]
  exact etaRawPairHit_measurable cfg ε M a b

end NoThreeLine

#print axioms NoThreeLine.etaContact_eq_actual_endpoint
#print axioms NoThreeLine.etaSegmentContact_iff_raw
#print axioms NoThreeLine.etaSegmentContact_measurable
