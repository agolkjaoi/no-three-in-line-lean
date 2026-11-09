import NoThreeLine.LongLineDeadlineMoments
import NoThreeLine.InitialWitnessTail

/-! Markov bounds for the actual full-schedule saved-root witness sum, using
root-deadline-truncated retention. Nonnegativity, measurability and power
integrability are supplied by the actual valid snapshot and finite weights.
No activity indicator, abstract moment premise or asymptotic claim is added. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments

theorem initial_rootPhasePoint_witnessSum_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (w : Grid n→ℝ)
    (hw : ∀q,0≤w q) (N : ℕ) (ω : BoardClockPath n) :
    0≤witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω) ∧
      witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)≤∑q,w q := by
  have hv := initialRootPhaseWitness_valid cs ε M deadline start p hn hB e N ω
  exact ⟨Finset.sum_nonneg (fun q _=>mul_nonneg (hw q) (hv.2.1 q).1),
    Finset.sum_le_sum (fun q _=>mul_le_of_le_one_right (hw q) (hv.2.1 q).2)⟩

theorem initial_rootPhasePoint_witnessPower_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (w : Grid n→ℝ)
    (hw : ∀q,0≤w q) (m N : ℕ) :
    Integrable (fun ω=>witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)^m)
      (phasePointMeasure cs ε M deadline start hn hB p N) := by
  let ν := phasePointMeasure cs ε M deadline start hn hB p N
  let Z := initialRootPhaseWitness cs ε M deadline start p hn hB e N
  letI : IsProbabilityMeasure ν := phasePointMeasure_probability cs ε M deadline start hn hB p N
  have hZ : Measurable Z := initialRootPhaseWitness_measurable cs ε M deadline start p hn hB e N
  have hsum : Measurable (fun ω=>witnessSum w (Z ω)) :=
    Finset.measurable_sum _ (fun q _=>
      (((measurable_pi_apply q).comp (WitnessState.measurable_retained n)).comp hZ).const_mul (w q))
  apply GenericCreditIteration.bounded_nonnegative_integrable _ _ (hsum.pow_const m) ((∑q,w q)^m)
  intro ω
  have hh := initial_rootPhasePoint_witnessSum_bounds cs ε M deadline start p hn hB e w hw N ω
  exact ⟨pow_nonneg hh.1 m,pow_le_pow_left₀ hh.1 hh.2 m⟩

theorem initial_rootPhasePoint_witness_tail_le_moment {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (w : Grid n→ℝ)
    (hw : ∀q,0≤w q) (m N : ℕ) (r : ℝ) (hr : 0<r) :
    (phasePointMeasure cs ε M deadline start hn hB p N).real
      {ω | r≤witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)}≤
      (∫ω,witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e N ω)^m
        ∂phasePointMeasure cs ε M deadline start hn hB p N)/r^m := by
  let ν := phasePointMeasure cs ε M deadline start hn hB p N
  let Z := initialRootPhaseWitness cs ε M deadline start p hn hB e N
  letI : IsProbabilityMeasure ν := phasePointMeasure_probability cs ε M deadline start hn hB p N
  have hi := initial_rootPhasePoint_witnessPower_integrable cs ε M deadline start p hn hB e w hw m N
  have hMarkov := mul_meas_ge_le_integral_of_nonneg
    (Filter.Eventually.of_forall (fun ω=>pow_nonneg
      (initial_rootPhasePoint_witnessSum_bounds cs ε M deadline start p hn hB e w hw N ω).1 m)) hi (r^m)
  have hset : {ω : BoardClockPath n | r≤witnessSum w (Z ω)}⊆{ω | r^m≤witnessSum w (Z ω)^m} :=
    fun ω hω=>pow_le_pow_left₀ hr.le hω m
  have hmeasure := measureReal_mono (μ:=ν) hset
  have hbound := (mul_le_mul_of_nonneg_left hmeasure (pow_nonneg hr.le m)).trans hMarkov
  apply (le_div_iff₀ (pow_pos hr m)).mpr
  simpa only [mul_comm] using hbound

theorem long_deadline_full_witness_tail_coarse {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ ε M : ℝ) (p : Grid n) (threshold : ℝ) (hn : 0<n) (hB : 1≤B) (hK : K<2)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (hk : k≤J)
    (hT : (s.prefix k hk).total=scheduleProcessDeadline s mask p) (m : ℕ) (r : ℝ) (hr : 0<r) :
    let s0 := s.prefix k hk
    let m0 := FinitePhase.prefixMask hk mask
    let h0 := FinitePhase.prefixMask_bounds hk mask hm
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let e := longWitnessRetention s0 m0 h0 Γ p threshold
    let w := longWitnessWeight s0 Γ p threshold
    let C := max 1 (AuxiliaryODE.protection 1 K)^Γ.card*(∑z : Grid n,longBirthPrice s0 m0 Γ p threshold z)
    let W := 2*scheduleProcessDeadline s mask p
    (phasePointMeasure cs ε M (scheduleProcessDeadline s mask) 0 hn hB p J).real
      {ω | r≤witnessSum w (initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e J ω)}≤
      (C^m+(m:ℝ)^2*W*(C+(m:ℝ)*W)^(m-1))/((1-ε)^(m+1).choose 2*r^m) := by
  let cs := scheduleSharedPhases s mask hm Γ B K ρ
  let e := longWitnessRetention (s.prefix k hk) (FinitePhase.prefixMask hk mask) (FinitePhase.prefixMask_bounds hk mask hm) Γ p threshold
  let w := longWitnessWeight (s.prefix k hk) Γ p threshold
  have ht := initial_rootPhasePoint_witness_tail_le_moment cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e w
    (fun q=>(longWitnessWeight_bounds (s.prefix k hk) Γ p threshold q).1) m J r hr
  have hh := long_deadline_full_witnessPower_coarse s mask hm Γ B K ρ ε M p threshold hn hB hK hp hε0 hε k hk hT m
  dsimp only at ht hh ⊢
  apply ht.trans
  simpa only [div_div] using div_le_div_of_nonneg_right hh (pow_nonneg hr.le m)

theorem long_deadline_full_witness_tail_separated {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ ε M : ℝ) (p : Grid n) (threshold : ℝ) (hn : 0<n) (hB : 1≤B) (hK : K<2)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (hk : k≤J)
    (hT : (s.prefix k hk).total=scheduleProcessDeadline s mask p) (m : ℕ) (r : ℝ) (hr : 0<r) :
    let s0 := s.prefix k hk
    let m0 := FinitePhase.prefixMask hk mask
    let h0 := FinitePhase.prefixMask_bounds hk mask hm
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let e := longWitnessRetention s0 m0 h0 Γ p threshold
    let w := longWitnessWeight s0 Γ p threshold
    let A := ∑z : Grid n,longBirthPrice s0 m0 Γ p threshold z
    let C := max 1 (AuxiliaryODE.protection 1 K)^Γ.card*A
    let P := pairWeight (specifiedDistinctPair Γ) w
      (accumulatedPhaseCoarsePrice (scheduleSharedPhases s0 m0 h0 Γ B K ρ) 0 e k)
    let W := 2*scheduleProcessDeadline s mask p
    (phasePointMeasure cs ε M (scheduleProcessDeadline s mask) 0 hn hB p J).real
      {ω | r≤witnessSum w (initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e J ω)}≤
      (A^(m+2)+((m+2:ℕ):ℝ)^2*W*(A+((m+2:ℕ):ℝ)*W)^(m+1)+
        ((m+2:ℕ):ℝ)^2*P*(C+((m+2:ℕ):ℝ)*W)^m)/((1-ε)^(m+3).choose 2*r^(m+2)) := by
  let cs := scheduleSharedPhases s mask hm Γ B K ρ
  let e := longWitnessRetention (s.prefix k hk) (FinitePhase.prefixMask hk mask) (FinitePhase.prefixMask_bounds hk mask hm) Γ p threshold
  let w := longWitnessWeight (s.prefix k hk) Γ p threshold
  have ht := initial_rootPhasePoint_witness_tail_le_moment cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e w
    (fun q=>(longWitnessWeight_bounds (s.prefix k hk) Γ p threshold q).1) (m+2) J r hr
  have hh := long_deadline_full_witnessPower_separated s mask hm Γ B K ρ ε M p threshold hn hB hK hp hε0 hε k hk hT m
  dsimp only at ht hh ⊢
  apply ht.trans
  simpa only [div_div] using div_le_div_of_nonneg_right hh (pow_nonneg hr.le (m+2))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_witnessPower_integrable
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_witness_tail_le_moment
#print axioms NoThreeLine.BirthWitness.long_deadline_full_witness_tail_coarse
#print axioms NoThreeLine.BirthWitness.long_deadline_full_witness_tail_separated
