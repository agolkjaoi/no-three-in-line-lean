import NoThreeLine.StoppedFirstCredit

/-! Construct a true-guard flow and its actual first-event credit identity
together. Neither a path bound nor a first-event law is an extra assumption. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped NNReal

namespace NoThreeLine.AuxiliaryODE

theorem exists_guard_flow_first_credit {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ)
    (B K ρ : ℝ) (C T : ℝ≥0) (hn : 0 < n) (hB : 0 < B)
    (hC : max B 2 < (C : ℝ)) (hs : s.Valid)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) :
    ∃ ψ : InitialBall n C × ℝ → Coordinates n, ∃ τ : InitialBall n C → ℝ,
      Continuous ψ ∧ Measurable τ ∧
      ∀ z : InitialBall n C, CoordinateBounds B z.val →
        z.val.1 = (fun p => (s.accounts p).weight) →
        ψ (z,0) = z.val ∧ τ z ∈ Icc (0 : ℝ) T ∧
        (∀ t ∈ Icc (0 : ℝ) (τ z), CoordinateBounds B (ψ (z,t)) ∧
          ‖ψ (z,t)‖ < C ∧
          HasDerivWithinAt (fun t => ψ (z,t)) (vectorField s Γ mask (ψ (z,t)))
            (Icc (0 : ℝ) (τ z)) t) ∧
        (∀ t ∈ Ico (0 : ℝ) (τ z), ψ (z,t) ∉ processGuard s Γ B K ρ) ∧
        (τ z < T → ψ (z,τ z) ∈ processGuard s Γ B K ρ) ∧
        (∀ p : Grid n,
          (∫ ω, s.firstCreditObservable Γ mask B (τ z) (fun t => (ψ (z,t)).1) p
            (WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (B/n)) =
            (s.accounts p).credit) := by
  obtain ⟨ψ,τ,hψ,hτ,hflow⟩ := exists_guard_stopped_flow s Γ mask (fun p => (hm p).1)
    B K ρ C T hC
  refine ⟨ψ,τ,hψ,hτ,?_⟩
  intro z hz hzw
  obtain ⟨hinit,htime,hder,hbefore,hcontact⟩ := hflow z hz
  refine ⟨hinit,htime,hder,hbefore,hcontact,?_⟩
  intro p
  have hc : Continuous (fun t : ℝ => ψ (z,t)) :=
    hψ.comp (continuous_const.prodMk continuous_id)
  have hd : ∀ t ∈ Ioo (0 : ℝ) (τ z), HasDerivAt (fun t => ψ (z,t))
      (vectorField s Γ mask (ψ (z,t))) t := by
    intro t ht
    exact (hder t ⟨ht.1.le,ht.2.le⟩).2.2.hasDerivAt (Icc_mem_nhds ht.1 ht.2)
  have hwinit : (ψ (z,0)).1 = (fun p => (s.accounts p).weight) := by
    rw [hinit,hzw]
  exact coordinate_flow_first_candidate_credit s Γ mask B ⟨τ z,htime.1⟩ hn hB hs hm
    (fun t => ψ (z,t)) hc.continuousOn (fun t ht => (hder t ht).1) hwinit hd p

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.exists_guard_flow_first_credit
