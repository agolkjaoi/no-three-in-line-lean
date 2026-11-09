import NoThreeLine.ActiveLineGuardBounds

/-! Physical guard bounds survive to the raw pre-resolution endpoint.
The endpoint inequalities follow by continuity from guard avoidance; an
empty line which becomes occupied at a birth uses its actual credit one. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open Set
namespace NoThreeLine
open AuxiliaryODE MixedConnection

theorem activeLineGuardBounds_birth {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (K ρ : ℝ) (hρ : ρ≤1)
    (hg : ActiveLineGuardBounds Γ K ρ e) (hE : EmptyLineCredit e)
    (q : Grid n) (positive : Grid n→Bool) :
    ActiveLineGuardBounds Γ K ρ (e.birth Γ q positive) := by
  have hsub : e.process.selected⊆(e.birth Γ q positive).process.selected := by
    unfold ExtendedState.birth ProcessState.birth
    split_ifs
    · exact Finset.subset_insert _ _
    · exact Finset.Subset.refl _
  intro p hp L hpL
  have hpre := e.process.birth_activeEvents_subset Γ q positive hp
  refine ⟨(hg p hpre L hpL).1,?_⟩
  intro hsp hN
  change ρ≤e.lineCredits L
  have hle : occupancy e.process L≤occupancy (e.birth Γ q positive).process L :=
    Finset.card_le_card (by
      intro v hv
      exact Finset.mem_inter.mpr ⟨hsub (Finset.mem_inter.mp hv).1,(Finset.mem_inter.mp hv).2⟩)
  by_cases h0 : occupancy e.process L=0
  · rw [hE L h0]
    exact hρ
  · exact (hg p hpre L hpL).2 hsp (by omega)

theorem activeLineGuardBounds_candidateUpdate {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (K ρ : ℝ) (hρ : ρ≤1)
    (hg : ActiveLineGuardBounds Γ K ρ e) (hE : EmptyLineCredit e)
    (mask : Grid n→ℝ) (B : ℝ) (q : Grid n) (positive : Grid n→Bool) (mark : ℝ) :
    ActiveLineGuardBounds Γ K ρ (e.candidateUpdate Γ mask B q positive mark) := by
  rw [ExtendedState.candidateUpdate_eq]
  split_ifs
  · exact activeLineGuardBounds_birth e Γ K ρ hρ hg hE q positive
  · exact hg

theorem selectedTrajectory_activeLineGuardBounds {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K ρ : ℝ)
    (hK : cfg.K≤K) (hρ : ρ≤cfg.rho) (hg : ActiveLineGuardBounds cfg.directions K ρ x.val)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    ActiveLineGuardBounds cfg.directions K ρ (selectedTrajectory cfg (x,t)) := by
  have hs := selectedCurve_spec cfg x he.2.1
  have hc : Continuous (fun u=>selectedCurve cfg (x,u)) := by
    change Continuous (fun u:ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,u))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hd : ∀u∈Ioo (0:ℝ) (selectedGuardTime cfg x),
      HasDerivAt (fun v=>selectedCurve cfg (x,v))
        (vectorField x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,u))) u := by
    intro u hu
    exact (hs.2.2.1 u ⟨hu.1.le,hu.2.le⟩).2.2.hasDerivAt (Icc_mem_nhds hu.1 hu.2)
  intro p hp L hpL
  change p∈x.val.process.activeEvents at hp
  have hi := hg p hp L hpL
  change (specified cfg.directions L→(selectedCurve cfg (x,t)).2.1 L≤K) ∧
    (¬specified cfg.directions L → occupancy x.val.process L=1 → ρ≤(selectedCurve cfg (x,t)).2.2 L)
  by_cases hstop : x.val.process.stopped=false
  · by_cases hT : selectedGuardTime cfg x=0
    · have ht0 : t=0 := by rw [hT] at ht; exact le_antisymm ht.2 ht.1
      simpa only [ht0,hs.1,ExtendedState.coordinates] using hi
    have hcl : closure (Ico (0:ℝ) (selectedGuardTime cfg x))=Icc 0 (selectedGuardTime cfg x) :=
      closure_Ico (Ne.symm hT)
    refine ⟨?_,?_⟩
    · intro hsp
      have hbefore : ∀u∈Ico (0:ℝ) (selectedGuardTime cfg x), (selectedCurve cfg (x,u)).2.1 L≤K := by
        intro u hu
        have hlt : (selectedCurve cfg (x,u)).2.1 L<cfg.K := by
          by_contra hn
          apply hs.2.2.2.1 u hu
          simp only [pendingGuardSet,if_pos hstop,mem_union]
          exact Or.inl (Or.inr (mem_iUnion.mpr ⟨L,hsp,
            active_line_occupancy_le_one x.val.process p he.1 hp L hpL,le_of_not_gt hn⟩))
        exact hlt.le.trans hK
      exact le_on_closure hbefore ((continuous_apply L).comp hc.snd.fst).continuousOn
        continuous_const.continuousOn (by simpa only [hcl] using ht)
    · intro hsp hN
      have hbefore : ∀u∈Ico (0:ℝ) (selectedGuardTime cfg x), ρ≤(selectedCurve cfg (x,u)).2.2 L := by
        intro u hu
        have hlt : cfg.rho<(selectedCurve cfg (x,u)).2.2 L := by
          by_contra hn
          have hhand : L∉x.val.handled := by
            intro hh
            exact he.2.2 L hh p hpL ((ProcessState.mem_activeEvents _ _).mp hp)
          apply hs.2.2.2.1 u hu
          simp only [pendingGuardSet,if_pos hstop,mem_union]
          exact Or.inr (mem_iUnion.mpr ⟨L,hhand,hsp,hN,le_of_not_gt hn⟩)
        exact hρ.trans hlt.le
      exact le_on_closure hbefore continuous_const.continuousOn
        ((continuous_apply L).comp hc.snd.snd).continuousOn (by simpa only [hcl] using ht)
  · refine ⟨?_,?_⟩
    · intro hsp
      rw [flow_clock_inactive_constant x.val.process cfg.directions cfg.mask _ hs.2.1.1 _
        hc.continuousOn hd L (fun h=>hstop h.1) t ht,hs.1]
      exact hi.1 hsp
    · intro hsp hN
      rw [flow_lineCredit_inactive_constant x.val.process cfg.directions cfg.mask _ hs.2.1.1 _
        hc.continuousOn hd L (fun h=>hstop h.1) t ht,hs.1]
      exact hi.2 hsp hN

theorem augPreState_activeLineGuardBounds {n : ℕ} (cfg : FlowConfig n) (ε M K ρ : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hK : cfg.K≤K) (hρ : ρ≤cfg.rho) (hg : ActiveLineGuardBounds cfg.directions K ρ x.1.1.val)
    (z : (ℝ×Grid n)×ℝ) : ActiveLineGuardBounds cfg.directions K ρ (augPreState cfg ε M (x,z)).physical := by
  have ht := augAdvance_mem cfg ε M x he z.1.1
  exact selectedTrajectory_activeLineGuardBounds cfg x.1.1 he K ρ hK hρ hg _
    ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M x he).2⟩

theorem augRawOutcome_activeLineGuardBounds {n : ℕ} (cfg : FlowConfig n) (ε M K ρ : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hK : cfg.K≤K) (hρ : ρ≤cfg.rho) (hρ1 : ρ≤1)
    (hg : ActiveLineGuardBounds cfg.directions K ρ x.1.1.val) (hE : EmptyLineCredit x.1.1.val)
    (z : (ℝ×Grid n)×ℝ) : ActiveLineGuardBounds cfg.directions K ρ (augRawOutcome cfg ε M (x,z)).physical := by
  have hg' := augPreState_activeLineGuardBounds cfg ε M K ρ x he hK hρ hg z
  have hE' := emptyLineCredit_augPreState cfg ε M x he hE z
  unfold augRawOutcome
  split_ifs
  · exact activeLineGuardBounds_candidateUpdate _ _ _ _ hρ1 hg' hE' _ _ _ _ _
  · exact hg'

theorem emptyLineCredit_augRawOutcome {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (hE : EmptyLineCredit x.1.1.val)
    (z : (ℝ×Grid n)×ℝ) : EmptyLineCredit (augRawOutcome cfg ε M (x,z)).physical := by
  have hE' := emptyLineCredit_augPreState cfg ε M x he hE z
  unfold augRawOutcome
  split_ifs
  · exact emptyLineCredit_candidateUpdate _ hE' _ _ _ _ _ _
  · exact hE'

end NoThreeLine
#print axioms NoThreeLine.selectedTrajectory_activeLineGuardBounds
#print axioms NoThreeLine.augRawOutcome_activeLineGuardBounds
#print axioms NoThreeLine.emptyLineCredit_augRawOutcome
