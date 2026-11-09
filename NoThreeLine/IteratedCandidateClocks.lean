import NoThreeLine.FirstEventRestartLaw

/-! Finite prefixes obtained by repeatedly consuming the actual earliest
candidate from the original board clocks. All prefix events are iid and
independent of the remaining complete board paths. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine.IteratedCandidateClocks
open ActualClockRestart FirstEventRestartLaw BoardWinnerLaw WinnerMarkLaw

def splitPrefix {X Y : Type*} (event : X → Y) (rest : X → X) :
    (k : ℕ) → X → (Fin k → Y) × X
  | 0, x => (Fin.elim0,x)
  | k+1, x => let z := splitPrefix event rest k (rest x)
              (Fin.cons (event x) z.1,z.2)

theorem splitPrefix_residual {X Y : Type*} (event : X → Y) (rest : X → X)
    (k : ℕ) (x : X) : (splitPrefix event rest k x).2 = rest^[k] x := by
  induction k generalizing x with
  | zero => rfl
  | succ k ih => simp [splitPrefix, ih, Function.iterate_succ_apply]

theorem splitPrefix_event {X Y : Type*} (event : X → Y) (rest : X → X)
    (k : ℕ) (x : X) (i : Fin k) :
    (splitPrefix event rest k x).1 i = event (rest^[i.val] x) := by
  induction k generalizing x with
  | zero => exact Fin.elim0 i
  | succ k ih =>
    refine Fin.cases ?_ (fun j => ?_) i
    · rfl
    · simp [splitPrefix, ih, Function.iterate_succ_apply]

theorem fin_cons_preserving {Y : Type*} [MeasurableSpace Y]
    (ν : Measure Y) [IsProbabilityMeasure ν] (k : ℕ) :
    MeasurePreserving (fun z : Y × (Fin k → Y) => Fin.cons z.1 z.2)
      (ν.prod (Measure.pi (fun _ : Fin k => ν)))
      (Measure.pi (fun _ : Fin (k+1) => ν)) := by
  have h := MeasurePreserving.symm (MeasurableEquiv.piFinSuccAbove (fun _ : Fin (k+1) => Y) 0)
    (measurePreserving_piFinSuccAbove (fun _ : Fin (k+1) => ν) 0)
  simpa [MeasurableEquiv.piFinSuccAbove, Fin.consEquiv] using h

theorem splitPrefix_preserving {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    (μ : Measure X) (ν : Measure Y) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (event : X → Y) (rest : X → X)
    (h : MeasurePreserving (fun x => (event x,rest x)) μ (ν.prod μ)) (k : ℕ) :
    MeasurePreserving (splitPrefix event rest k) μ
      ((Measure.pi (fun _ : Fin k => ν)).prod μ) := by
  induction k with
  | zero =>
    refine ⟨measurable_const.prodMk measurable_id, ?_⟩
    rw [Measure.pi_of_empty (fun _ : Fin 0 => ν) Fin.elim0, Measure.dirac_prod]
    rfl
  | succ k ih =>
    have h₁ := (MeasurePreserving.id ν).prod ih
    have h₂ := MeasurePreserving.symm MeasurableEquiv.prodAssoc
      (measurePreserving_prodAssoc ν (Measure.pi (fun _ : Fin k => ν)) μ)
    have h₃ := (fin_cons_preserving ν k).prod (MeasurePreserving.id μ)
    exact h₃.comp (h₂.comp (h₁.comp h))

abbrev Event (n : ℕ) := (ℝ × Grid n) × ℝ

def eventLaw {n : ℕ} (hn : 0 < n) (rate : ℝ) : Measure (Event n) :=
  ((expMeasure ((n : ℝ)^2*rate)).prod (uniformGrid hn)).prod markMeasure

theorem eventLaw_probability {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    IsProbabilityMeasure (eventLaw hn rate) := by
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  letI := isProbabilityMeasure_expMeasure (mul_pos (sq_pos_of_pos hnR) hr)
  unfold eventLaw
  infer_instance

def candidatePrefix {n : ℕ} (hn : 0 < n) (k : ℕ) :
    BoardClockPath n → (Fin k → Event n) × BoardClockPath n :=
  splitPrefix (firstMarkedRace hn) (restartedBoard hn) k

theorem candidatePrefix_residual {n : ℕ} (hn : 0 < n) (k : ℕ) (ω : BoardClockPath n) :
    (candidatePrefix hn k ω).2 = (restartedBoard hn)^[k] ω :=
  splitPrefix_residual _ _ _ _

theorem candidatePrefix_event {n : ℕ} (hn : 0 < n) (k : ℕ) (ω : BoardClockPath n) (i : Fin k) :
    (candidatePrefix hn k ω).1 i = firstMarkedRace hn ((restartedBoard hn)^[i.val] ω) :=
  splitPrefix_event _ _ _ _ _

theorem candidatePrefix_preserving {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) (k : ℕ) :
    MeasurePreserving (candidatePrefix hn k) (boardClockMeasure n rate)
      ((Measure.pi (fun _ : Fin k => eventLaw hn rate)).prod (boardClockMeasure n rate)) := by
  letI := boardClockMeasure_probability n rate hr
  letI := eventLaw_probability hn rate hr
  exact splitPrefix_preserving (boardClockMeasure n rate) (eventLaw hn rate) _ _
    ⟨firstRestart_measurable hn, first_event_restart_map hn rate hr⟩ k

theorem candidatePrefix_map {n : ℕ} (hn : 0 < n) (B : ℝ) (hB : 0 < B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (candidatePrefix hn k) =
      (Measure.pi (fun _ : Fin k => ((expMeasure (n*B)).prod (uniformGrid hn)).prod markMeasure)).prod
        (boardClockMeasure n (B/n)) := by
  rw [(candidatePrefix_preserving hn (B/n) (div_pos hB (by exact_mod_cast hn)) k).map_eq]
  have hn0 : (n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hn)
  have he : (n : ℝ)^2*(B/n) = n*B := by field_simp
  simp only [eventLaw, he]

theorem eventPrefix_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) (k : ℕ) :
    (boardClockMeasure n rate).map (fun ω => (candidatePrefix hn k ω).1) =
      Measure.pi (fun _ : Fin k => eventLaw hn rate) := by
  letI := boardClockMeasure_probability n rate hr
  letI := eventLaw_probability hn rate hr
  have h := (measurePreserving_fst (μ := Measure.pi (fun _ : Fin k => eventLaw hn rate))
    (ν := boardClockMeasure n rate)).comp (candidatePrefix_preserving hn rate hr k)
  exact h.map_eq

theorem residualPrefix_map {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) (k : ℕ) :
    (boardClockMeasure n rate).map ((restartedBoard hn)^[k]) = boardClockMeasure n rate := by
  letI := boardClockMeasure_probability n rate hr
  letI := eventLaw_probability hn rate hr
  have h := (measurePreserving_snd (μ := Measure.pi (fun _ : Fin k => eventLaw hn rate))
    (ν := boardClockMeasure n rate)).comp (candidatePrefix_preserving hn rate hr k)
  have he : Prod.snd ∘ candidatePrefix hn k = (restartedBoard hn)^[k] :=
    funext (candidatePrefix_residual hn k)
  rw [he] at h
  exact h.map_eq

end NoThreeLine.IteratedCandidateClocks

#print axioms NoThreeLine.IteratedCandidateClocks.candidatePrefix_map
#print axioms NoThreeLine.IteratedCandidateClocks.eventPrefix_map
