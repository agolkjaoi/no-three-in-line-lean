import NoThreeLine.SectionTagExclusion
import NoThreeLine.SectionInputBudget

/-! C22 newTag smallness under a fixed strict deterministic input margin.
The probability concerns the real raw cause in the original finite schedule
and the same full-J root point measure. The phase count is fixed before n. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

theorem exists_uniform_tagCause_threshold (J : ℕ) (T lam ρ d ζ κ : ℝ)
    (hT : 0≤T) (hgap : lam<1-ρ) (hd : d<1) (hζ : 0<ζ) (hκ : 0<κ) :
    ∃ N : ℕ, 2≤N ∧ ∀n≥N,
      ∀ (B : ℝ) (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
        (Γ : Finset ZPoint) (p : Grid n) (hn : 0<n) (hB : 1≤B),
        ((augInitialState B hB deadline start).val.physical.process.accounts p).status=.active →
        (∀j,(cs j).directions=Γ) → (∀j,(cs j).K<2) → (∀j<J,(cs j).rho≤ρ) →
        (∀j<J,∀q,(cs j).mask q=0 ∨ (cs j).mask q=1) →
        B≤(n:ℝ)^d → phaseEndpoint cs 0 J≤T →
        (∀L:RootBoardLineIndex p,¬specified Γ L.val → sectionScheduleInput cs L.val p J≤lam) →
        (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J).real
          (scheduledBoundaryCauseBefore cs ((n:ℝ)^(-ζ)) M deadline start hn
            (augInitialState B hB deadline start) p .tag J)<κ := by
  obtain ⟨δ,hδ,N0,hN0,hbudget⟩ := exists_sectionScheduleBudget_gap T lam ρ d hT hgap hd
  obtain ⟨N1,hN1,hmax⟩ := exists_uniform_finiteCellMaximum_threshold J δ d ζ κ hδ hd hζ hκ
  refine ⟨max N0 N1,hN1.trans (le_max_right _ _),?_⟩
  intro n hnN B cs M deadline start Γ p hn hB hp hΓ hK hρ hmask hBn htime hinput
  have hbudget' (L : RootBoardLineIndex p) (hL : ¬specified Γ L.val) :
      sectionScheduleBudget cs L.val p δ J<1-ρ :=
    hbudget n ((le_max_left _ _).trans hnN) B cs L.val p J (zero_le_one.trans hB) hBn htime (hinput L hL)
  have hsub := initial_tagCauseBefore_subset_cellMaximum cs ((n:ℝ)^(-ζ)) M deadline start hn hB Γ p δ ρ
    hδ.le hΓ hρ hmask hbudget'
  letI := phasePointMeasure_probability cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J
  have hreal := ENNReal.toReal_mono (measure_ne_top
    (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start hn hB p J)
    (scheduledFiniteCellMaximumBefore cs ((n:ℝ)^(-ζ)) M deadline start Γ p
      (fun j:Fin J=>binaryMaskSupport (cs j.val).mask) δ hn hB J)) (measure_mono hsub)
  exact hreal.trans_lt (hmax n ((le_max_right _ _).trans hnN) B cs M deadline start Γ p
    (fun j:Fin J=>binaryMaskSupport (cs j.val).mask) hn hB J hp hΓ hK hBn)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.exists_uniform_tagCause_threshold
