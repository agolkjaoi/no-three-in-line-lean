import NoThreeLine.RecycledRetirementCauses
import NoThreeLine.SourceInteriorCut

/-! A remaining-time cap cannot manufacture a positive boundary loss
strictly inside an original executed segment. Endpoint candidates retain
the actual <= guard convention. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section

namespace NoThreeLine
open AuxiliaryODE BirthWitness EtaMixedGenerator

theorem sourceCap_candidate_window_of_le {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ)
    (hc : 0 ≤ c) (x : AugmentedCappedInput cfg) (t : ℝ)
    (hcut : augAdvance cfg ε M (x,t) ≤ c) :
    (0 < t ∧ t ≤ augGuardTime cfg ε M (sourceCapInput cfg c x)) ↔
      (0 < t ∧ t ≤ augGuardTime cfg ε M x) := by
  rw [sourceCap_guard cfg ε M c hc x]
  constructor
  · exact fun h => ⟨h.1,h.2.trans (min_le_left _ _)⟩
  · intro h
    refine ⟨h.1,le_min h.2 ?_⟩
    change max 0 (min (augGuardTime cfg ε M x) t) ≤ c at hcut
    rwa [min_eq_right h.2,max_eq_right h.1.le] at hcut

theorem sourceCap_raw_eq_of_le {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ)
    (hc : 0 ≤ c) (x : AugmentedCappedInput cfg) (z : CandidateData n)
    (hcut : augAdvance cfg ε M (x,z.1.1) ≤ c) :
    augRawOutcome cfg ε M (sourceCapInput cfg c x,z) = augRawOutcome cfg ε M (x,z) := by
  simp only [augRawOutcome,sourceCap_candidate_window_of_le cfg ε M c hc x z.1.1 hcut,
    sourceCap_pre_eq cfg ε M c hc x z hcut]

theorem sourceCap_interior_raw {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ)
    (hc : 0 ≤ c) (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (z : CandidateData n) (hcut : c < augAdvance cfg ε M (x,z.1.1)) :
    augRawOutcome cfg ε M (sourceCapInput cfg c x,z) = selectedAugmentedCurve cfg x.1 c := by
  have hcG := hcut.trans_le (augAdvance_mem cfg ε M x he z.1.1).2
  have hct := sourceCap_interior_time_lt cfg ε M c hc x z.1.1 hcut
  have hg : augGuardTime cfg ε M (sourceCapInput cfg c x) = c := by
    rw [sourceCap_guard cfg ε M c hc x,min_eq_right hcG.le]
  have ha : augAdvance cfg ε M (sourceCapInput cfg c x,z.1.1) = c := by
    rw [sourceCap_advance cfg ε M c hc x z.1.1,min_eq_right hcut.le]
  have hw : ¬(0 < z.1.1 ∧ z.1.1 ≤ augGuardTime cfg ε M (sourceCapInput cfg c x)) := by
    rw [hg]
    exact fun h => (not_le_of_gt hct) h.2
  simp only [augRawOutcome,if_neg hw,augPreState_selectedAugmentedCurve,ha]
  rfl

theorem sourceCap_boundary_advance_le {n : ℕ} (cfg : FlowConfig n) (ε M c : ℝ)
    (hc : 0 ≤ c) (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hs : x.1.1.val.process.stopped = false) (z : CandidateData n) (p : Grid n)
    (hp : ((augRawOutcome cfg ε M (sourceCapInput cfg c x,z)).physical.process.accounts p).status = .active)
    (hb : rootResolveCause (augRawOutcome cfg ε M (sourceCapInput cfg c x,z))
      cfg.directions cfg.B cfg.K cfg.rho ε M p) :
    augAdvance cfg ε M (x,z.1.1) ≤ c := by
  by_contra h
  have ht := lt_of_not_ge h
  have hr := sourceCap_interior_raw cfg ε M c hc x he z ht
  have ho := sourceCap_interior_outcome cfg ε M c hc x he hs z ht
  have hi := ((augRawOutcome cfg ε M (sourceCapInput cfg c x,z)).resolve_inactive_iff
    cfg.directions cfg.B cfg.K cfg.rho ε M p hp).mpr hb
  change ((augOutcome cfg ε M (sourceCapInput cfg c x,z)).physical.process.accounts p).status ≠ .active at hi
  rw [ho] at hi
  rw [hr] at hp
  exact hi hp

theorem sourceRestrictState_running {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (hδ : 0 ≤ δ)
    (s : AugTimedState cfg) (hd : ¬AugTimedDone cfg (sourceRestrictState cfg δ hδ s)) :
    0 < s.val.2-δ ∧ s.val.1.physical.process.stopped = false := by
  have hR : 0 < (sourceRestrictState cfg δ hδ s).val.2 :=
    lt_of_le_of_ne (sourceRestrictState cfg δ hδ s).property.2.1
      (Ne.symm (fun h => hd (Or.inl h)))
  change 0 < max 0 (s.val.2-δ) at hR
  have hc : 0 < s.val.2-δ := by
    rcases lt_max_iff.mp hR with hzero | hpos
    · exact False.elim (lt_irrefl 0 hzero)
    · exact hpos
  exact ⟨hc,Bool.eq_false_iff.mpr (fun h => hd (Or.inr h))⟩

theorem sourceRestrict_boundary_unrestrict {n : ℕ} (cfg : FlowConfig n) (ε M δ : ℝ)
    (hδ : 0 ≤ δ) (s : AugTimedState cfg) (z : CandidateData n) (p : Grid n)
    (hb : rootStepBoundaryCause cfg ε M p (sourceRestrictState cfg δ hδ s) z) :
    rootStepBoundaryCause cfg ε M p s z ∧
      augAdvance cfg ε M (augTimedInput cfg s,z.1.1) ≤ s.val.2-δ := by
  obtain ⟨hc,hs⟩ := sourceRestrictState_running cfg δ hδ s hb.1
  have hi := sourceRestrictState_input_of_le cfg δ hδ s (sub_nonneg.mp hc.le)
  have hp := hb.2.1
  have hcause := hb.2.2
  rw [hi] at hp hcause
  have ha := sourceCap_boundary_advance_le cfg ε M (s.val.2-δ) hc.le
    (augTimedInput cfg s) s.property.1.1 hs z p hp hcause
  have he := sourceCap_raw_eq_of_le cfg ε M (s.val.2-δ) hc.le (augTimedInput cfg s) z ha
  rw [he] at hp hcause
  refine ⟨⟨?_,hp,hcause⟩,ha⟩
  rintro (hzero | hstop)
  · rw [hzero] at hc
    linarith
  · simp [hs] at hstop

end NoThreeLine

#print axioms NoThreeLine.sourceCap_raw_eq_of_le
#print axioms NoThreeLine.sourceCap_boundary_advance_le
#print axioms NoThreeLine.sourceRestrict_boundary_unrestrict
