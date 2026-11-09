import NoThreeLine.ExponentialClocks
import Mathlib.Data.Set.Finite.Lattice

/-! Actual independent marked clocks at every board point. The finite union
of their arrivals is non-explosive. State-dependent flow/acceptance remains
a subsequent construction, rather than an assumption about these inputs. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology

namespace NoThreeLine

def markSequenceMeasure : Measure ClockPath := Measure.infinitePi (fun _ : ℕ => markMeasure)

instance markSequenceMeasure_probability : IsProbabilityMeasure markSequenceMeasure := by
  unfold markSequenceMeasure
  infer_instance

theorem markSequenceMeasure_independent :
    iIndepFun (fun k : ℕ => fun ω : ClockPath => ω k) markSequenceMeasure :=
  iIndepFun_infinitePi (X := fun (_ : ℕ) (x : ℝ) => x) (fun _ => measurable_id)

theorem markSequenceMeasure_map (k : ℕ) :
    markSequenceMeasure.map (fun ω => ω k) = markMeasure :=
  Measure.infinitePi_map_eval (fun _ : ℕ => markMeasure) k

abbrev MarkedClockPath := ClockPath × ClockPath

def markedClockMeasure (rate : ℝ) : Measure MarkedClockPath :=
  (clockMeasure rate).prod markSequenceMeasure

theorem markedClockMeasure_probability (rate : ℝ) (hr : 0 < rate) :
    IsProbabilityMeasure (markedClockMeasure rate) := by
  letI := clockMeasure_probability rate hr
  unfold markedClockMeasure
  infer_instance

theorem markedClockMeasure_waits_marks_independent (rate : ℝ) (hr : 0 < rate) :
    IndepFun Prod.fst Prod.snd (markedClockMeasure rate) := by
  letI := clockMeasure_probability rate hr
  exact indepFun_prod measurable_id measurable_id

theorem markedClockMeasure_fst (rate : ℝ) (hr : 0 < rate) :
    MeasurePreserving Prod.fst (markedClockMeasure rate) (clockMeasure rate) := by
  letI := clockMeasure_probability rate hr
  refine ⟨measurable_fst, ?_⟩
  simp [markedClockMeasure,Measure.map_fst_prod]

theorem markedClockMeasure_nonexplosive (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂markedClockMeasure rate,
      StrictMono (arrivalTime ω.1) ∧ Tendsto (arrivalTime ω.1) atTop atTop ∧
        ∀ T : ℝ, Set.Finite {k | arrivalTime ω.1 k ≤ T} :=
  (markedClockMeasure_fst rate hr).quasiMeasurePreserving.ae (clockMeasure_nonexplosive rate hr)

abbrev BoardClockPath (n : ℕ) := Grid n → MarkedClockPath

def boardClockMeasure (n : ℕ) (rate : ℝ) : Measure (BoardClockPath n) :=
  Measure.infinitePi (fun _ : Grid n => markedClockMeasure rate)

theorem boardClockMeasure_probability (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    IsProbabilityMeasure (boardClockMeasure n rate) := by
  letI := markedClockMeasure_probability rate hr
  unfold boardClockMeasure
  infer_instance

theorem boardClockMeasure_independent (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    iIndepFun (fun p : Grid n => fun ω : BoardClockPath n => ω p) (boardClockMeasure n rate) := by
  letI := markedClockMeasure_probability rate hr
  exact iIndepFun_infinitePi (X := fun (_ : Grid n) (x : MarkedClockPath) => x)
    (fun _ => measurable_id)

theorem boardClockMeasure_nonexplosive (n : ℕ) (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂boardClockMeasure n rate,
      ∀ T : ℝ, Set.Finite {z : Grid n × ℕ | arrivalTime (ω z.1).1 z.2 ≤ T} := by
  letI := markedClockMeasure_probability rate hr
  have hsites : ∀ᵐ ω ∂boardClockMeasure n rate, ∀ p : Grid n,
      ∀ T : ℝ, Set.Finite {k | arrivalTime (ω p).1 k ≤ T} := by
    apply ae_all_iff.mpr
    intro p
    have hpres : MeasurePreserving (fun ω : BoardClockPath n => ω p)
        (boardClockMeasure n rate) (markedClockMeasure rate) :=
      ⟨measurable_pi_apply p, Measure.infinitePi_map_eval _ p⟩
    have hh := hpres.quasiMeasurePreserving.ae (markedClockMeasure_nonexplosive rate hr)
    filter_upwards [hh] with ω hω
    exact hω.2.2
  filter_upwards [hsites] with ω hω
  intro T
  have hfinite : Set.Finite (⋃ p : Grid n,
      (fun k : ℕ => (p,k)) '' {k | arrivalTime (ω p).1 k ≤ T}) :=
    Set.finite_iUnion (fun p => (hω p T).image _)
  convert hfinite using 1
  ext z
  rcases z with ⟨⟨x,y⟩,k⟩
  simp

/-- The manuscript's per-point candidate rate B/n has a genuine law for n>0. -/
theorem boardCandidateClock_nonexplosive (n : ℕ) (B : ℝ) (hn : 0 < n) (hB : 0 < B) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      ∀ T : ℝ, Set.Finite {z : Grid n × ℕ | arrivalTime (ω z.1).1 z.2 ≤ T} :=
  boardClockMeasure_nonexplosive n (B/n) (div_pos hB (by exact_mod_cast hn))

end NoThreeLine

#print axioms NoThreeLine.markedClockMeasure_waits_marks_independent
#print axioms NoThreeLine.boardClockMeasure_independent
#print axioms NoThreeLine.boardCandidateClock_nonexplosive
