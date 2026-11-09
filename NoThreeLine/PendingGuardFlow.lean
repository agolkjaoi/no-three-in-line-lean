import NoThreeLine.PendingGuardSet
import NoThreeLine.ClosedGuardFlow

/-! Actual bounded flow to the next unhandled boundary. Previously handled
tag contacts and stopped modes do not force zero-time restarts. -/
set_option autoImplicit false
noncomputable section
open Set Metric MeasureTheory
open scoped NNReal

namespace NoThreeLine.AuxiliaryODE

theorem flow_stopped_weight_constant {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ)
    (T : ℝ) (hT : 0 ≤ T) (z : ℝ → Coordinates n)
    (hz : ContinuousOn z (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt z (vectorField s Γ mask (z t)) t)
    (hs : s.stopped = true) (p : Grid n) (t : ℝ) (ht : t ∈ Icc 0 T) :
    (z t).1 p = (z 0).1 p := by
  apply scalar_flow_constant T hT (fun u => (z u).1 p)
    ((continuous_apply p).comp_continuousOn hz.fst) _ t ht
  intro u hu
  have hh := hasDerivAt_pi.mp (hd u hu).fst p
  simpa only [vectorField_stopped s Γ mask (z u) hs,Prod.fst_zero,Pi.zero_apply] using hh

theorem pending_flow_coordinateBounds {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (hm : ∀ p, 0 ≤ mask p)
    (B K ρ T : ℝ) (handled : Finset (LineIndex n)) (hT : 0 ≤ T)
    (z : ℝ → Coordinates n) (hz : ContinuousOn z (Icc 0 T))
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt z (vectorField s Γ mask (z t)) t)
    (h0 : CoordinateBounds B (z 0))
    (hbefore : ∀ t ∈ Ico 0 T, z t ∉ pendingGuardSet s Γ B K ρ handled)
    (t : ℝ) (ht : t ∈ Icc 0 T) : CoordinateBounds B (z t) := by
  have hw0 : ∀ p, 0 ≤ (z 0).1 p := fun p => (h0.1 p).1
  refine ⟨?_,?_,?_⟩
  · intro p
    refine ⟨flow_weights_nonneg s Γ mask T hT z hz hd hw0 t ht p,?_⟩
    by_cases hstop : s.stopped = true
    · rw [flow_stopped_weight_constant s Γ mask T hT z hz hd hstop p t ht]
      exact (h0.1 p).2
    have hs : s.stopped = false := by cases h : s.stopped <;> simp_all
    by_cases hp : (s.accounts p).status = .active
    · by_cases hT0 : T = 0
      · have ht0 : t = 0 := by rw [hT0] at ht; exact le_antisymm ht.2 ht.1
        simpa only [ht0] using (h0.1 p).2
      · have hcl : closure (Ico (0 : ℝ) T) = Icc 0 T := closure_Ico (Ne.symm hT0)
        apply le_on_closure (s := Ico (0 : ℝ) T)
          (fun u hu => (pendingGuardSet_avoids_weight s Γ B K ρ handled (z u)
            hs (hbefore u hu) p hp).le)
          (by rw [hcl]; exact (continuous_apply p).comp_continuousOn hz.fst)
          continuous_const.continuousOn
        simpa only [hcl] using ht
    · rw [flow_weight_inactive_constant s Γ mask T hT z hz hd p hp t ht]
      exact (h0.1 p).2
  · intro L
    exact ⟨flow_clock_lower s Γ mask T hT z hz hd hm hw0 L (h0.2.1 L).1 (h0.2.1 L).2 t ht,
      flow_clock_upper s Γ mask T hT z hz hd L (h0.2.1 L).2 t ht⟩
  · intro L
    exact ⟨flow_lineCredit_nonneg s Γ mask T hT z hz hd L (h0.2.2 L).1 t ht,
      flow_lineCredit_upper s Γ mask T hT z hz hd hm hw0 L (h0.2.2 L).1 (h0.2.2 L).2 t ht⟩

theorem exists_pending_guard_flow {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (hm : ∀ p, 0 ≤ mask p)
    (B K ρ : ℝ) (handled : Finset (LineIndex n)) (C T : ℝ≥0)
    (hC : max B 2 < (C : ℝ)) :
    ∃ ψ : InitialBall n C × ℝ → Coordinates n, ∃ τ : InitialBall n C → ℝ,
      Continuous ψ ∧ Measurable τ ∧
      ∀ z : InitialBall n C, CoordinateBounds B z.val →
        ψ (z,0) = z.val ∧ τ z ∈ Icc (0 : ℝ) T ∧
        (∀ t ∈ Icc (0 : ℝ) (τ z), CoordinateBounds B (ψ (z,t)) ∧
          ‖ψ (z,t)‖ < C ∧
          HasDerivWithinAt (fun t => ψ (z,t)) (vectorField s Γ mask (ψ (z,t)))
            (Icc (0 : ℝ) (τ z)) t) ∧
        (∀ t ∈ Ico (0 : ℝ) (τ z), ψ (z,t) ∉ pendingGuardSet s Γ B K ρ handled) ∧
        (τ z < T → ψ (z,τ z) ∈ pendingGuardSet s Γ B K ρ handled) := by
  obtain ⟨ψ,τ,hψ,hτ,hf⟩ := exists_closed_guard_box_flow s Γ mask
    (pendingGuardSet s Γ B K ρ handled) (pendingGuardSet_closed s Γ B K ρ handled) C T
  refine ⟨ψ,τ,hψ,hτ,?_⟩
  intro z hz0
  obtain ⟨hinit,htime,hder,hbefore,hcontact⟩ := hf z
  have hc : Continuous (fun t : ℝ => ψ (z,t)) := hψ.comp (continuous_const.prodMk continuous_id)
  have hd : ∀ t ∈ Ioo (0 : ℝ) (τ z), HasDerivAt (fun t => ψ (z,t))
      (vectorField s Γ mask (ψ (z,t))) t := by
    intro t ht
    exact (hder t ⟨ht.1.le,ht.2.le⟩).2.hasDerivAt (Icc_mem_nhds ht.1 ht.2)
  have h0 : CoordinateBounds B (ψ (z,0)) := by simpa only [hinit] using hz0
  have hb (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (τ z)) : CoordinateBounds B (ψ (z,t)) :=
    pending_flow_coordinateBounds s Γ mask hm B K ρ (τ z) handled htime.1
      (fun t => ψ (z,t)) hc.continuousOn hd h0 hbefore t ht
  have hn (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (τ z)) : ‖ψ (z,t)‖ < C :=
    (coordinateBounds_norm_le B _ (hb t ht)).trans_lt hC
  refine ⟨hinit,htime,(fun t ht => ⟨hb t ht,hn t ht,(hder t ht).2⟩),hbefore,?_⟩
  intro hlt
  rcases hcontact hlt with hg | hbox
  · exact hg
  · exact False.elim ((not_le_of_gt (hn (τ z) ⟨htime.1,le_rfl⟩)) hbox)

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.pending_flow_coordinateBounds
#print axioms NoThreeLine.AuxiliaryODE.exists_pending_guard_flow
