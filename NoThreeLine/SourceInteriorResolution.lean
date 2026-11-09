import NoThreeLine.SourceCutMeasurable
import NoThreeLine.EtaMixedActualSegment

/-! A deterministic cut strictly inside the actual guard interval does not
trigger boundary resolution. These are identities of the actual physical and
eta states, including handled tags, rather than identities only of credit. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE EtaMixedGenerator

theorem ProcessState.retire_eq_self_of_no_active {n : ℕ} (s : ProcessState n)
    (positive : Grid n → Bool)
    (h : ∀ p, (s.accounts p).status = .active → positive p = false) :
    s.retire positive = s := by
  have ha : (fun p => (s.accounts p).retire (positive p)) = s.accounts := by
    funext p
    by_cases hp : (s.accounts p).status = .active
    · simp [CreditAccount.retire,hp,h p hp]
    · simp [CreditAccount.retire,hp]
  unfold ProcessState.retire
  rw [ha]

theorem ExtendedState.resolve_eq_self_of_no_pending {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ)
    (hs : e.process.stopped = false)
    (hp : ¬pendingBoundary e.process Γ B K ρ e.clocks e.lineCredits e.handled) :
    e.resolve Γ B K ρ = e := by
  classical
  have hc : ¬clockTriggered e.process Γ K e.clocks :=
    fun h => hp ⟨hs,Or.inr (Or.inl h)⟩
  have ht : newTags e.process Γ e.lineCredits ρ e.handled = ∅ := by
    apply Finset.not_nonempty_iff_eq_empty.mp
    exact fun h => hp ⟨hs,Or.inr (Or.inr h)⟩
  have hw (p : Grid n) (ha : (e.process.accounts p).status = .active) :
      ¬B ≤ (e.process.accounts p).weight :=
    fun h => hp ⟨hs,Or.inl ⟨p,ha,h⟩⟩
  have hr : e.process.retire (boundaryRetirement e.process Γ B ρ e.lineCredits e.handled) =
      e.process := by
    apply ProcessState.retire_eq_self_of_no_active
    intro p ha
    simp [boundaryRetirement,ht,hw p ha]
  simp only [ExtendedState.resolve,resolveBoundary,if_neg hc,hr,handledAfter,ht,Finset.union_empty]

theorem AugmentedState.resolve_eq_self_of_no_guards {n : ℕ} (a : AugmentedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ)
    (hs : a.physical.process.stopped = false)
    (hp : ¬pendingBoundary a.physical.process Γ B K ρ a.physical.clocks
      a.physical.lineCredits a.physical.handled)
    (ha : ¬a.auxBad Γ ε M) : a.resolve Γ B K ρ ε M = a := by
  simp only [AugmentedState.resolve,if_neg ha,
    ExtendedState.resolve_eq_self_of_no_pending a.physical Γ B K ρ hs hp]

theorem selectedAugmentedCurve_no_pending {n : ℕ} (cfg : FlowConfig n)
    (x : EtaFlowInput cfg) (he : x.1.val.Valid cfg.B) (t : ℝ)
    (ht : t ∈ Ico (0:ℝ) (selectedGuardTime cfg x.1)) :
    ¬pendingBoundary (selectedAugmentedCurve cfg x t).physical.process
      cfg.directions cfg.B cfg.K cfg.rho (selectedAugmentedCurve cfg x t).physical.clocks
      (selectedAugmentedCurve cfg x t).physical.lineCredits
      (selectedAugmentedCurve cfg x t).physical.handled := by
  have h := (selectedCurve_spec cfg x.1 he.2.1).2.2.2.1 t ht
  exact fun hp => h ((mem_pendingGuardSet_iff _ _ _ _ _ _ _).mpr hp)

theorem selectedAugmentedCurve_no_aux {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : EtaFlowInput cfg) (t : ℝ) (ht0 : 0≤t) (ht : t < selectedAuxTime cfg ε M x) :
    ¬(selectedAugmentedCurve cfg x t).auxBad cfg.directions ε M := by
  have hb := selectedAuxTime_before cfg ε M x t ht0 ht
  rintro (hη | hv)
  · obtain ⟨a,b,hab,hle⟩ := hη
    exact (not_le_of_gt (hb.1 a b hab)) hle
  · have hm : (selectedAugmentedCurve cfg x t).physical.coordinates ∉
        virtualGuard (selectedAugmentedCurve cfg x t).physical.process cfg.directions M := by
      apply (outside_virtualGuard _ _ _ _).mpr
      intro L q
      have heq : virtualMass (selectedAugmentedCurve cfg x t).physical.process cfg.directions
          (selectedAugmentedCurve cfg x t).physical.coordinates L q =
          virtualMass x.1.val.process cfg.directions (selectedCurve cfg (x.1,t)) L q := rfl
      rw [heq]
      exact hb.2 L q
    exact hm hv

theorem selectedAugmentedCurve_resolve_interior {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hs : x.1.1.val.process.stopped = false) (t : ℝ)
    (ht : t ∈ Ico (0:ℝ) (augGuardTime cfg ε M x)) :
    (selectedAugmentedCurve cfg x.1 t).resolve cfg.directions cfg.B cfg.K cfg.rho ε M =
      selectedAugmentedCurve cfg x.1 t := by
  apply AugmentedState.resolve_eq_self_of_no_guards
  · exact hs
  · exact selectedAugmentedCurve_no_pending cfg x.1 he t
      ⟨ht.1,ht.2.trans_le (augGuardTime_mem cfg ε M x he).2⟩
  · exact selectedAugmentedCurve_no_aux cfg ε M x.1 t ht.1
      (ht.2.trans_le (augGuardTime_le_aux cfg ε M x))

end NoThreeLine

#print axioms NoThreeLine.ExtendedState.resolve_eq_self_of_no_pending
#print axioms NoThreeLine.selectedAugmentedCurve_resolve_interior
