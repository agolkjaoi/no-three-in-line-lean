import NoThreeLine.ScheduledPairMoment

/-! The actual raw eta retirement cause is paid by a finite union of
pair-cost tails. There is no union over phase, candidate, or time indices. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness FiniteMomentIntegral

attribute [local irreducible] initialCutPairRate

theorem scheduledPairPath_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (a b : Grid n) (J : ℕ) : Measurable (scheduledPairPath cs ε M deadline start hn hB a b J) :=
  Finset.measurable_sum _ (fun N _=>variable_running_integral_measurable
    (fun _=>((cs N).horizon:ℝ)) measurable_const (fun _=>(cs N).horizon.coe_nonneg)
    _ (initialCutPairRate_joint_measurable cs ε M deadline start hn hB a b N))

theorem scheduledPairPath_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (a b : Grid n) (J : ℕ) (ω : BoardClockPath n) :
    0≤scheduledPairPath cs ε M deadline start hn hB a b J ω ∧
      scheduledPairPath cs ε M deadline start hn hB a b J ω≤
        ∑N∈Finset.range J,((cs N).horizon:ℝ)*pairRateCap n B := by
  have hb (N) := integral_initial_segment_bounds ((cs N).horizon:ℝ) (cs N).horizon
    (cs N).horizon.coe_nonneg le_rfl
    (fun t=>initialCutPairRate cs ε M deadline start hn hB N t a b ω)
    ((initialCutPairRate_joint_measurable cs ε M deadline start hn hB a b N).comp
      (measurable_const.prodMk measurable_id)) (pairRateCap n B)
    (pairRateCap_nonneg n B (zero_le_one.trans hB))
    (fun t _=>initialCutPairRate_bounds cs ε M deadline start hn hB a b N t ω)
  exact ⟨Finset.sum_nonneg (fun N _=>(hb N).1),Finset.sum_le_sum (fun N _=>(hb N).2)⟩

theorem scheduledPairPath_power_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (a b : Grid n) (J m : ℕ) : Integrable
      (fun ω=>(scheduledPairPath cs ε M deadline start hn hB a b J ω)^m)
      (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((scheduledPairPath_measurable cs ε M deadline start hn hB a b J).pow_const m)
    ((∑N∈Finset.range J,((cs N).horizon:ℝ)*pairRateCap n B)^m)
    (fun ω=>⟨pow_nonneg (scheduledPairPath_bounds cs ε M deadline start hn hB a b J ω).1 m,
      pow_le_pow_left₀ (scheduledPairPath_bounds cs ε M deadline start hn hB a b J ω).1
        (scheduledPairPath_bounds cs ε M deadline start hn hB a b J ω).2 m⟩)

theorem scheduledPairPath_tail_le_moment {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (a b : Grid n) (J m : ℕ) (r : ℝ) (hr : 0<r) :
    (boardClockMeasure n (B/n)).real {ω | r≤scheduledPairPath cs ε M deadline start hn hB a b J ω}≤
      (∫ω,(scheduledPairPath cs ε M deadline start hn hB a b J ω)^m ∂boardClockMeasure n (B/n))/r^m := by
  let μ := boardClockMeasure n (B/n)
  let Y := scheduledPairPath cs ε M deadline start hn hB a b J
  letI := boardClockMeasure_probability n (B/n) (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  have hi := scheduledPairPath_power_integrable cs ε M deadline start hn hB a b J m
  have hk := mul_meas_ge_le_integral_of_nonneg
    (Filter.Eventually.of_forall (fun ω=>pow_nonneg (scheduledPairPath_bounds cs ε M deadline start hn hB a b J ω).1 m)) hi (r^m)
  have hs : {ω | r≤Y ω}⊆{ω | r^m≤Y ω^m} := fun ω hω=>pow_le_pow_left₀ hr.le hω m
  apply (le_div_iff₀ (pow_pos hr m)).mpr
  simpa only [mul_comm] using
    (mul_le_mul_of_nonneg_left (measureReal_mono (μ:=μ) hs) (pow_nonneg hr.le m)).trans hk

def anyRawEtaCause {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃p : Grid n,ω∈scheduledBoundaryCauseBefore cs ε M deadline start hn
    (augInitialState B hB deadline start) p .eta J}

theorem anyRawEtaCause_measurableSet {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ) :
    MeasurableSet (anyRawEtaCause cs ε M deadline start hn hB J) := by
  simp only [anyRawEtaCause,Set.setOf_exists]
  exact MeasurableSet.iUnion (fun p=>scheduledBoundaryCauseBefore_measurableSet cs ε M deadline start hn
    (augInitialState B hB deadline start) p .eta J)

theorem anyRawEtaCause_pair_union {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ)
    (A : ℝ) (hA : 0≤A)
    (hpair : ∀a b : Grid n,a≠b→(boardClockMeasure n (B/n)).real
      {ω | ε≤scheduledPairPath cs ε M deadline start hn hB a b J ω}≤A) :
    (boardClockMeasure n (B/n)).real (anyRawEtaCause cs ε M deadline start hn hB J)≤(n:ℝ)^4*A := by
  classical
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  let E := fun a b : Grid n=>if a≠b then
    {ω | ε≤scheduledPairPath cs ε M deadline start hn hB a b J ω} else ∅
  have hsub : anyRawEtaCause cs ε M deadline start hn hB J≤ᵐ[μ] ⋃a,⋃b,E a b := by
    have ha := ae_all_iff.mpr (fun p=>initial_eta_cause_path_ae cs ε M deadline start hn hB p J)
    filter_upwards [ha] with ω hω
    rintro ⟨p,hp⟩
    obtain ⟨a,b,hab,hc⟩ := hω p hp
    exact Set.mem_iUnion.mpr ⟨a,Set.mem_iUnion.mpr ⟨b,by simpa [E,hab] using hc⟩⟩
  have hb (a b : Grid n) : μ.real (E a b)≤A := by
    by_cases hab : a≠b
    · simpa only [E,if_pos hab] using hpair a b hab
    · simpa only [E,if_neg hab,measureReal_empty] using hA
  calc
    _ ≤ μ.real (⋃a,⋃b,E a b) := ENNReal.toReal_mono (measure_ne_top μ _) (measure_mono_ae hsub)
    _ ≤ ∑a : Grid n,μ.real (⋃b,E a b) := measureReal_iUnion_fintype_le _
    _ ≤ ∑a : Grid n,∑b : Grid n,μ.real (E a b) := Finset.sum_le_sum (fun a _=>measureReal_iUnion_fintype_le _)
    _ ≤ ∑_a : Grid n,∑_b : Grid n,A := Finset.sum_le_sum (fun a _=>Finset.sum_le_sum (fun b _=>hb a b))
    _ = _ := by simp only [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,Grid,Fintype.card_prod,Fintype.card_fin,Nat.cast_mul]; ring

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.scheduledPairPath_tail_le_moment
#print axioms NoThreeLine.PairWitness.anyRawEtaCause_pair_union
