import NoThreeLine.ScheduledOutsideRiskMax

/-! Crossings of actual cumulative outside risk at any physical phase cut.
Nonnegative actual rates identify this event with its terminal event,
without a union bound over times or any change of physical clocks. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines AuxiliaryODE

theorem scheduledOutsideLineRiskPrefix_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (cs N).horizon) (ω : BoardClockPath n) :
    0≤scheduledOutsideLineRiskPrefix cs ε M deadline start hn hB L p N t ω ∧
      scheduledOutsideLineRiskPrefix cs ε M deadline start hn hB L p N t ω≤
        scheduledOutsideLineRiskPath cs ε M deadline start hn hB L p N ω := by
  have hm : Measurable (fun u=>scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N (ω,u)) :=
    (scheduledOutsideLineRiskRate_measurable cs ε M deadline start hn hB L p N).comp
      (measurable_const.prodMk measurable_id)
  have hb (u : ℝ) := scheduledOutsideLineRiskRate_bounds cs ε M deadline start hn hB L p N (ω,u)
  have hi : IntervalIntegrable
      (fun u=>scheduledOutsideLineRiskRate cs ε M deadline start hn hB L p N (ω,u))
      volume 0 (cs N).horizon :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le (cs N).horizon.coe_nonneg).mpr
      (integrableOn_of_nonneg_bound volume _ measurableSet_Ioo _ hm _ (fun u _=>hb u))
  exact ⟨intervalIntegral.integral_nonneg ht.1 (fun u _=>(hb u).1),
    intervalIntegral.integral_mono_interval le_rfl ht.1 ht.2
      (Filter.Eventually.of_forall (fun u=>(hb u).1)) hi⟩

theorem scheduledOutsideRiskPrefix_le_full {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (N J : ℕ) (hNJ : N<J)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (cs N).horizon) (ω : BoardClockPath n) :
    scheduledOutsideRiskPrefix cs ε M deadline start hn hB Γ p N t ω≤
      scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω := by
  apply Finset.sum_le_sum
  intro L _
  calc
    _ ≤ (∑j∈Finset.range N,scheduledOutsideLineRiskPath cs ε M deadline start hn hB L.val p j ω)+
        scheduledOutsideLineRiskPath cs ε M deadline start hn hB L.val p N ω :=
      add_le_add le_rfl (scheduledOutsideLineRiskPrefix_bounds cs ε M deadline start hn hB L.val p N t ht ω).2
    _ = ∑j∈Finset.range (N+1),scheduledOutsideLineRiskPath cs ε M deadline start hn hB L.val p j ω :=
      (Finset.sum_range_succ _ N).symm
    _ ≤ _ := Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono (Nat.succ_le_of_lt hNJ))
      (fun j _ _=>(scheduledOutsideLineRiskPrefix_bounds cs ε M deadline start hn hB L.val p j
        (cs j).horizon ⟨(cs j).horizon.coe_nonneg,le_rfl⟩ ω).1)

def scheduledActualRiskCrossing {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (a : ℝ) :
    Set (BoardClockPath n) :=
  {ω | ∃N<J,∃t∈Icc (0:ℝ) (cs N).horizon,
    a≤scheduledOutsideRiskPrefix cs ε M deadline start hn hB Γ p N t ω}

theorem scheduledActualRiskCrossing_subset_terminal {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (a : ℝ) :
    scheduledActualRiskCrossing cs ε M deadline start hn hB Γ p J a⊆
      {ω | a≤scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω} := by
  rintro ω ⟨N,hN,t,ht,hω⟩
  exact hω.trans (scheduledOutsideRiskPrefix_le_full cs ε M deadline start hn hB Γ p N J hN t ht ω)

theorem scheduledActualRiskCrossing_eq_terminal {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (hJ : 0<J) (a : ℝ) :
    scheduledActualRiskCrossing cs ε M deadline start hn hB Γ p J a=
      {ω | a≤scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω} := by
  apply Set.Subset.antisymm (scheduledActualRiskCrossing_subset_terminal cs ε M deadline start hn hB Γ p J a)
  intro ω hω
  have hNJ : J-1+1=J := by omega
  refine ⟨J-1,by omega,(cs (J-1)).horizon,⟨(cs (J-1)).horizon.coe_nonneg,le_rfl⟩,?_⟩
  rw [(scheduledOutsidePrefixes_horizon cs ε M deadline start hn hB Γ p (J-1) ω).1,hNJ]
  exact hω

theorem scheduledActualRiskCrossing_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (a : ℝ) :
    MeasurableSet (scheduledActualRiskCrossing cs ε M deadline start hn hB Γ p J a) := by
  by_cases hJ : J=0
  · subst J
    have he : scheduledActualRiskCrossing cs ε M deadline start hn hB Γ p 0 a=∅ := by
      ext ω
      simp [scheduledActualRiskCrossing]
    rw [he]
    exact MeasurableSet.empty
  · rw [scheduledActualRiskCrossing_eq_terminal cs ε M deadline start hn hB Γ p J (Nat.pos_of_ne_zero hJ) a]
    exact measurableSet_le measurable_const (scheduledOutsideRiskPath_measurable cs ε M deadline start hn hB Γ p J)

theorem scheduledActualRiskCrossing_measure_le {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (a : ℝ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    μ.real (scheduledActualRiskCrossing cs ε M deadline start hn hB Γ p J a)≤
      μ.real {ω | a≤scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω} :=
  measureReal_mono (μ:=μ) (scheduledActualRiskCrossing_subset_terminal cs ε M deadline start hn hB Γ p J a)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPrefix_le_full
#print axioms NoThreeLine.BirthWitness.scheduledActualRiskCrossing_eq_terminal
#print axioms NoThreeLine.BirthWitness.scheduledActualRiskCrossing_measurableSet
