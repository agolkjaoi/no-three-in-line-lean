import NoThreeLine.ScheduledRootRecordTransport
import NoThreeLine.ScheduledBirthChronology
import NoThreeLine.ScheduledLineMainPath

/-! The real active-root/selected-witness gate is dominated by the birth
indicator in the full-J saved snapshot, with its actual recorded timestamp.
This keeps the original phase process and all physical deadlines. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def recordedBirthGate {n : ℕ} (b : BirthRecords n) (z : Grid n) (t : ℝ) : ℝ :=
  if (b z).1=true ∧ (b z).2≤t then 1 else 0

theorem recordedBirthGate_bounds {n : ℕ} (b : BirthRecords n) (z : Grid n) (t : ℝ) :
    0≤recordedBirthGate b z t ∧ recordedBirthGate b z t≤1 := by
  unfold recordedBirthGate
  split_ifs <;> norm_num

theorem recordedBirthGate_measurable {n : ℕ} (z : Grid n) :
    Measurable (fun x : BirthRecords n×ℝ=>recordedBirthGate x.1 z x.2) := by
  have hm := (measurable_pi_apply z).comp (measurable_fst : Measurable (Prod.fst : BirthRecords n×ℝ→_))
  exact Measurable.ite ((hm.fst.eq_const true).setOf.inter (measurableSet_le hm.snd measurable_snd))
    measurable_const measurable_const

theorem selectedLineGate_le_recordedBirthGate {n : ℕ} (cfg : FlowConfig n)
    (e : Retention n) (p z : Grid n) (s : TimedObservation cfg) (b : BirthRecords n) (t : ℝ)
    (hc : RecordsConsistent cfg s) (ht : RecordsBefore t s.2)
    (hr : (s.1.val.1.physical.process.accounts p).status=.active→RecordsExtend s.2 b) :
    selectedLineGate p z (observedWitness cfg e s)≤recordedBirthGate b z t := by
  by_cases h : p∈s.1.val.1.physical.process.activeEvents ∧ z∈s.1.val.1.physical.process.selected
  · have hz := (hc z).mpr h.2
    have he := hr ((ProcessState.mem_activeEvents _ _).mp h.1) z hz
    have hb : (b z).1=true ∧ (b z).2≤t := by rw [he]; exact ⟨hz,ht z hz⟩
    simp only [selectedLineGate,observedWitness,h,recordedBirthGate,hb,le_refl]
  · simpa only [selectedLineGate,observedWitness,h,if_false] using (recordedBirthGate_bounds b z t).1

theorem scheduledCut_gate_le_savedBirthGate_point_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N J : ℕ) (hNJ : N<J) :
    ∀ᵐω∂phasePointMeasure cs ε M deadline start hn hB p J,∀ᵐt : ℝ∂volume,
    t∈Ioo (0:ℝ) (cs N).horizon → ∀z : Grid n,
    selectedLineGate p z (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t))≤
      recordedBirthGate (initialRootPhaseRecords cs ε M deadline start p hn hB J ω) z
        (phaseEndpoint cs start N+t) := by
  filter_upwards [scheduledCut_recordsExtend_full_point_ae cs ε M deadline start p hn hB N J hNJ] with ω hω
  filter_upwards [hω] with t ht
  intro htI z
  apply selectedLineGate_le_recordedBirthGate
  · exact sourceCutTerminal_consistent (cs N).config ε M _ _ _ hn _ _
  · exact initial_scheduledCutObservation_recordsBefore cs ε M deadline start hn hB N ω t
      ⟨htI.1.le,htI.2.le⟩
  · exact ht htI

theorem scheduledLineMainPath_le_savedBirthGate_point_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N J : ℕ) (hNJ : N<J)
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q) (L : LineIndex n) (z : Grid n) :
    ∀ᵐω∂phasePointMeasure cs ε M deadline start hn hB p J,
    scheduledLineMainPath cs ε M deadline start hn hB mask L p z N ω≤
      ∫t in (0:ℝ)..(cs N).horizon,
        recordedBirthGate (initialRootPhaseRecords cs ε M deadline start p hn hB J ω) z
          (phaseEndpoint cs start N+t) * ∑q∈lineLeafSites L p z,mask q := by
  filter_upwards [scheduledCut_gate_le_savedBirthGate_point_ae cs ε M deadline start p hn hB N J hNJ] with ω hω
  let D := ∑q∈lineLeafSites L p z,mask q
  have hD : 0≤D := Finset.sum_nonneg (fun q _=>hm q)
  have hm1 : Measurable (fun t : ℝ=>selectedLineMain mask L p z
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))) :=
    ((selectedLineMain_measurable mask L p z).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)).comp
      (measurable_const.prodMk measurable_id)
  have hm2 : Measurable (fun t : ℝ=>recordedBirthGate
      (initialRootPhaseRecords cs ε M deadline start p hn hB J ω) z (phaseEndpoint cs start N+t)*D) :=
    ((recordedBirthGate_measurable z).comp
      (measurable_const.prodMk (measurable_const.add measurable_id))).mul_const D
  have hi1 := integrableOn_of_nonneg_bound volume (Ioo (0:ℝ) (cs N).horizon) measurableSet_Ioo _ hm1 D
    (fun t _=>selectedLineMain_bounds mask hm L p z _)
  have hi2 := integrableOn_of_nonneg_bound volume (Ioo (0:ℝ) (cs N).horizon) measurableSet_Ioo _ hm2 D
    (fun t _=>⟨mul_nonneg (recordedBirthGate_bounds _ z _).1 hD,
      mul_le_of_le_one_left hD (recordedBirthGate_bounds _ z _).2⟩)
  rw [scheduledLineMainPath,intervalIntegral.integral_of_le (cs N).horizon.coe_nonneg,
    intervalIntegral.integral_of_le (cs N).horizon.coe_nonneg,integral_Ioc_eq_integral_Ioo,
    integral_Ioc_eq_integral_Ioo]
  apply integral_mono_ae hi1 hi2
  filter_upwards [ae_restrict_of_ae hω,ae_restrict_mem measurableSet_Ioo] with t ht htI
  exact mul_le_mul_of_nonneg_right (ht htI z) hD

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledCut_gate_le_savedBirthGate_point_ae
#print axioms NoThreeLine.BirthWitness.scheduledLineMainPath_le_savedBirthGate_point_ae
