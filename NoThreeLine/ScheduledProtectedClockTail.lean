import NoThreeLine.ScheduledProtectedClockBudget

/-! With a strict clock budget, reaching the specified threshold
requires a two-stage credit exceedance in some cell. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem scheduledProtectedClock_threshold_le {n : ℕ} {B : ℝ} {ι : Type*} [Fintype ι]
    (cs : ℕ→SharedPhase n B) (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n)
    (p : Grid n) (hn : 0<n) (hB : 0<B) (J : ℕ) (s : ProtectedPhaseState n B)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (hsp : ∀j,specified (cs j).directions L)
    (ho : occupancy s.1.val.physical.process L=0)
    (hsv : ∀q∈L.val,0≤s.2.1 q ∧ s.2.1 q≤2*B)
    (cells : ι→Finset (Grid n)) (c : ℕ→ι→ℝ) (cap : ι→ℝ)
    (hc : ∀j i,0≤c j i) (hcap : ∀i,0≤cap i)
    (hm : ∀ j < J,(cs j).config.mask=sectionCellMask cells (c j))
    (hbudget : s.1.val.physical.clocks L+
      (∑j∈Finset.range J,(cs j).horizon*((∑i,c j i*cap i)/n))<K) :
    let μ := boardClockMeasure n (B/n)
    let E₀ := fun i=>scheduledProtectedExceedance cs ε M deadline start L 0 (L.val∩cells i) id hn (cap i) J s
    let E₁ := fun i=>scheduledProtectedExceedance cs ε M deadline start L 1 (L.val∩cells i) id hn (cap i) J s
    μ.real {ω | K≤(recycledPhaseState cs ε M deadline start hn s.1 J ω).val.physical.clocks L}≤
      ∑i,((scheduledLineForbiddenLaw cs ε M K deadline start hn L 0 s.1 J).real (E₀ i)+
        (scheduledLineRestartLaw cs ε M K deadline start L hn J s).real (E₁ i)) := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let E₀ := fun i=>scheduledProtectedExceedance cs ε M deadline start L 0 (L.val∩cells i) id hn (cap i) J s
  let E₁ := fun i=>scheduledProtectedExceedance cs ε M deadline start L 1 (L.val∩cells i) id hn (cap i) J s
  let T := {ω | K≤(recycledPhaseState cs ε M deadline start hn s.1 J ω).val.physical.clocks L}
  have hpos : 0≤∑j∈Finset.range J,(cs j).horizon*((∑i,c j i*cap i)/n) :=
    Finset.sum_nonneg (fun j _=>mul_nonneg (cs j).horizon.coe_nonneg
      (div_nonneg (Finset.sum_nonneg (fun i _=>mul_nonneg (hc j i) (hcap i))) (Nat.cast_nonneg n)))
  have hk : s.1.val.physical.clocks L≤K := by linarith
  have hsubset : T⊆⋃i,E₀ i∪E₁ i := by
    intro ω hω
    by_contra hbad
    have hno (i : ι) : ω∉E₀ i∪E₁ i := fun hi=>hbad (mem_iUnion.mpr ⟨i,hi⟩)
    have he := scheduledProtectedClock_budget_le cs ε M deadline start L p hn J s hsp hsv ω
      cells c cap hc hcap hm hno J le_rfl
    change K≤(recycledPhaseState cs ε M deadline start hn s.1 J ω).val.physical.clocks L at hω
    linarith
  calc
    _ ≤ μ.real (⋃i,E₀ i∪E₁ i) := measureReal_mono hsubset
    _ ≤ ∑i,μ.real (E₀ i∪E₁ i) := measureReal_iUnion_fintype_le _
    _ ≤ _ := Finset.sum_le_sum (fun i _=>
      scheduledProtected_twoStage_crossing_le cs ε M K deadline start L (L.val∩cells i) id continuous_id
        p hn hB (cap i) J hKcfg hK hsp s ho hk)

end NoThreeLine

#print axioms NoThreeLine.scheduledProtectedClock_threshold_le

