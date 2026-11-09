import NoThreeLine.MarkedClocks

/-! Candidate event k uses wait 0 + ... + wait k and mark k.
The initial partial sum T_0=0 is not counted as a candidate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology

namespace NoThreeLine

def candidateTime (wait : ClockPath) (k : ℕ) : ℝ := arrivalTime wait (k+1)

def candidateMark {n : ℕ} (ω : BoardClockPath n) (z : Grid n × ℕ) : ℝ :=
  (ω z.1).2 z.2

@[simp] theorem candidateTime_zero (wait : ClockPath) : candidateTime wait 0 = wait 0 := by
  simp [candidateTime,arrivalTime]

theorem candidateTime_measurable (k : ℕ) : Measurable (fun wait => candidateTime wait k) := by
  unfold candidateTime arrivalTime
  fun_prop

theorem candidateMark_measurable {n : ℕ} (z : Grid n × ℕ) :
    Measurable (fun ω : BoardClockPath n => candidateMark ω z) := by
  exact (measurable_pi_apply z.2).comp
    (measurable_snd.comp (measurable_pi_apply z.1))

theorem candidateTime_pos (wait : ClockPath) (hw : ∀ k, 0 < wait k) (k : ℕ) :
    0 < candidateTime wait k := by
  have hh := arrivalTime_strictMono wait hw (Nat.zero_lt_succ k)
  simpa [candidateTime,arrivalTime] using hh

theorem candidateTime_strictMono (wait : ClockPath) (hw : ∀ k, 0 < wait k) :
    StrictMono (candidateTime wait) := by
  intro i j hij
  exact arrivalTime_strictMono wait hw (Nat.succ_lt_succ hij)

theorem candidateTime_tendsto (wait : ClockPath)
    (hw : Tendsto (arrivalTime wait) atTop atTop) :
    Tendsto (candidateTime wait) atTop atTop :=
  hw.comp (tendsto_add_atTop_nat 1)

theorem boardCandidateTime_nonexplosive (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂boardClockMeasure n rate,
      ∀ T : ℝ, Set.Finite {z : Grid n × ℕ | candidateTime (ω z.1).1 z.2 ≤ T} := by
  filter_upwards [boardClockMeasure_nonexplosive n rate hr] with ω hω
  intro T
  let shift : Grid n × ℕ → Grid n × ℕ := fun z => (z.1,z.2+1)
  have hinj : Function.Injective shift := by
    intro a b hab
    have h₁ := congrArg Prod.fst hab
    have h₂ := congrArg Prod.snd hab
    change a.1 = b.1 at h₁
    change a.2+1 = b.2+1 at h₂
    exact Prod.ext h₁ (Nat.add_right_cancel h₂)
  exact Set.Finite.preimage hinj.injOn (hω T)

theorem markedClockMeasure_positive_candidates (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂markedClockMeasure rate,
      (∀ k, 0 < candidateTime ω.1 k) ∧ StrictMono (candidateTime ω.1) ∧
        Tendsto (candidateTime ω.1) atTop atTop := by
  have hp := (markedClockMeasure_fst rate hr).quasiMeasurePreserving.ae
    (clockMeasure_ae_positive rate hr)
  filter_upwards [hp,markedClockMeasure_nonexplosive rate hr] with ω hpos hdiv
  exact ⟨candidateTime_pos ω.1 hpos,candidateTime_strictMono ω.1 hpos,
    candidateTime_tendsto ω.1 hdiv.2.1⟩

theorem boardCandidateTime_positive (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂boardClockMeasure n rate, ∀ p : Grid n,
      (∀ k, 0 < candidateTime (ω p).1 k) ∧ StrictMono (candidateTime (ω p).1) ∧
        Tendsto (candidateTime (ω p).1) atTop atTop := by
  letI := markedClockMeasure_probability rate hr
  apply ae_all_iff.mpr
  intro p
  have hpres : MeasurePreserving (fun ω : BoardClockPath n => ω p)
      (boardClockMeasure n rate) (markedClockMeasure rate) :=
    ⟨measurable_pi_apply p,Measure.infinitePi_map_eval _ p⟩
  exact hpres.quasiMeasurePreserving.ae (markedClockMeasure_positive_candidates rate hr)

theorem markSequenceMeasure_in_unit :
    ∀ᵐ ω ∂markSequenceMeasure, ∀ k, ω k ∈ Ioc (0 : ℝ) 1 := by
  apply ae_all_iff.mpr
  intro k
  have hpres : MeasurePreserving (fun ω : ClockPath => ω k) markSequenceMeasure markMeasure :=
    ⟨measurable_pi_apply k,markSequenceMeasure_map k⟩
  exact hpres.quasiMeasurePreserving.ae (ae_restrict_mem measurableSet_Ioc)

theorem boardCandidateMark_in_unit (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂boardClockMeasure n rate, ∀ z : Grid n × ℕ,
      candidateMark ω z ∈ Ioc (0 : ℝ) 1 := by
  letI := clockMeasure_probability rate hr
  letI := markedClockMeasure_probability rate hr
  have hsnd : MeasurePreserving Prod.snd (markedClockMeasure rate) markSequenceMeasure := by
    refine ⟨measurable_snd,?_⟩
    simp [markedClockMeasure,Measure.map_snd_prod]
  have hs : ∀ᵐ ω ∂markedClockMeasure rate, ∀ k, ω.2 k ∈ Ioc (0 : ℝ) 1 :=
    hsnd.quasiMeasurePreserving.ae markSequenceMeasure_in_unit
  apply ae_all_iff.mpr
  intro z
  have heval : MeasurePreserving (fun ω : BoardClockPath n => ω z.1)
      (boardClockMeasure n rate) (markedClockMeasure rate) :=
    ⟨measurable_pi_apply z.1,Measure.infinitePi_map_eval _ z.1⟩
  filter_upwards [heval.quasiMeasurePreserving.ae hs] with ω hω
  exact hω z.2

end NoThreeLine

#print axioms NoThreeLine.boardCandidateTime_nonexplosive
#print axioms NoThreeLine.boardCandidateTime_positive
#print axioms NoThreeLine.boardCandidateMark_in_unit
