import NoThreeLine.WinnerSectionDensity

/-! Exact product sections of the original marked board clocks. These
separate a fixed site's first wait/mark/tail and its competitor paths. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine.FirstEventSections
open ClockRestartBase FiniteClockRestart

theorem triple_swap_preserving {α β γ : Type*}
    [MeasurableSpace α] [MeasurableSpace β] [MeasurableSpace γ]
    (μ : Measure α) (ν : Measure β) (ρ : Measure γ) [SFinite μ] [SFinite ν] [SFinite ρ] :
    MeasurePreserving (fun z : α × (β × γ) => (z.2.1, (z.1,z.2.2)))
      (μ.prod (ν.prod ρ)) (ν.prod (μ.prod ρ)) := by
  have h₁ := MeasurePreserving.symm MeasurableEquiv.prodAssoc (measurePreserving_prodAssoc μ ν ρ)
  have h₂ := (Measure.measurePreserving_swap (μ := μ) (ν := ν)).prod (MeasurePreserving.id ρ)
  have h₃ := measurePreserving_prodAssoc ν μ ρ
  exact h₃.comp (h₂.comp h₁)

def markedHeadTail (ω : MarkedClockPath) : ℝ × (ℝ × MarkedClockPath) :=
  (ω.1 0, (ω.2 0, (tail ω.1, tail ω.2)))

theorem markedHeadTail_measurable : Measurable markedHeadTail := by
  unfold markedHeadTail
  exact ((measurable_pi_apply 0).comp measurable_fst).prodMk
    (((measurable_pi_apply 0).comp measurable_snd).prodMk
      ((tail_measurable.comp measurable_fst).prodMk (tail_measurable.comp measurable_snd)))

theorem markedHeadTail_preserving (rate : ℝ) (hr : 0 < rate) :
    MeasurePreserving markedHeadTail (markedClockMeasure rate)
      ((expMeasure rate).prod (markMeasure.prod (markedClockMeasure rate))) := by
  letI := clockMeasure_probability rate hr
  letI := isProbabilityMeasure_expMeasure hr
  have hw : MeasurePreserving headTail (clockMeasure rate)
      ((expMeasure rate).prod (clockMeasure rate)) :=
    ⟨headTail_measurable, clock_headTail_map rate hr⟩
  have hm : MeasurePreserving headTail markSequenceMeasure (markMeasure.prod markSequenceMeasure) :=
    ⟨headTail_measurable, marks_headTail_map⟩
  have h₁ := hw.prod hm
  have h₂ := measurePreserving_prodAssoc (expMeasure rate) (clockMeasure rate)
    (markMeasure.prod markSequenceMeasure)
  have h₃ := (MeasurePreserving.id (expMeasure rate)).prod
    (triple_swap_preserving (clockMeasure rate) markMeasure markSequenceMeasure)
  exact h₃.comp (h₂.comp h₁)

def splitSite {n : ℕ} (p : Grid n) (ω : BoardClockPath n) :
    MarkedClockPath × (OtherSites p → MarkedClockPath) :=
  (ω p, fun q => ω q.val)

theorem splitSite_measurable {n : ℕ} (p : Grid n) : Measurable (splitSite p) := by
  unfold splitSite
  fun_prop

theorem site_others_independent {n : ℕ} (rate : ℝ) (hr : 0 < rate) (p : Grid n) :
    IndepFun (fun ω : BoardClockPath n => ω p)
      (fun ω : BoardClockPath n => fun q : OtherSites p => ω q.val) (boardClockMeasure n rate) := by
  let m : Grid n → MeasurableSpace (BoardClockPath n) := fun q =>
    MeasurableSpace.comap (fun ω : BoardClockPath n => ω q) inferInstance
  have hm (q : Grid n) : m q ≤ (inferInstance : MeasurableSpace (BoardClockPath n)) :=
    (measurable_pi_apply q).comap_le
  have hd : Disjoint ({p} : Set (Grid n)) {q | q ≠ p} := by
    apply Set.disjoint_left.mpr
    intro q hq hne
    exact hne (mem_singleton_iff.mp hq)
  have hi := indep_iSup_of_disjoint hm (boardClockMeasure_independent n rate hr).iIndep hd
  have hs : (⨆ q ∈ {q : Grid n | q ≠ p}, m q) = ⨆ q : OtherSites p, m q.val := by
    simp only [iSup_subtype, mem_setOf_eq]
  rw [hs] at hi
  simp only [iSup_singleton] at hi
  rw [IndepFun_iff_Indep, MeasurableSpace.comap_process_pi]
  exact hi

theorem splitSite_preserving {n : ℕ} (rate : ℝ) (hr : 0 < rate) (p : Grid n) :
    MeasurePreserving (splitSite p) (boardClockMeasure n rate)
      ((markedClockMeasure rate).prod (markedFamilyMeasure (OtherSites p) rate)) := by
  letI := markedClockMeasure_probability rate hr
  letI := boardClockMeasure_probability n rate hr
  refine ⟨splitSite_measurable p, ?_⟩
  have hm := (site_others_independent rate hr p).map_prod_eq_prod_map_map
    (measurable_pi_apply p).aemeasurable
    (measurable_pi_lambda _ (fun q : OtherSites p => measurable_pi_apply q.val)).aemeasurable
  have heval : (boardClockMeasure n rate).map (fun ω => ω p) = markedClockMeasure rate :=
    Measure.infinitePi_map_eval _ p
  have hothers : (boardClockMeasure n rate).map
      (fun ω => fun q : OtherSites p => ω q.val) = markedFamilyMeasure (OtherSites p) rate := by
    rw [boardClockMeasure, Measure.map_infinitePi_infinitePi_of_inj Subtype.val_injective,
      Measure.infinitePi_eq_pi]
    rfl
  rw [heval, hothers] at hm
  exact hm

def firstSiteSection {n : ℕ} (p : Grid n) (ω : BoardClockPath n) :
    (ℝ × (ℝ × MarkedClockPath)) × (OtherSites p → MarkedClockPath) :=
  (markedHeadTail (ω p), fun q => ω q.val)

theorem family_probability (ι : Type*) [Fintype ι] (rate : ℝ) (hr : 0 < rate) :
    IsProbabilityMeasure (markedFamilyMeasure ι rate) := by
  letI := markedClockMeasure_probability rate hr
  unfold markedFamilyMeasure
  infer_instance

theorem firstSiteSection_preserving {n : ℕ} (rate : ℝ) (hr : 0 < rate) (p : Grid n) :
    MeasurePreserving (firstSiteSection p) (boardClockMeasure n rate)
      (((expMeasure rate).prod (markMeasure.prod (markedClockMeasure rate))).prod
        (markedFamilyMeasure (OtherSites p) rate)) := by
  letI := markedClockMeasure_probability rate hr
  letI := family_probability (OtherSites p) rate hr
  exact ((markedHeadTail_preserving rate hr).prod
    (MeasurePreserving.id (markedFamilyMeasure (OtherSites p) rate))).comp (splitSite_preserving rate hr p)

end NoThreeLine.FirstEventSections

#print axioms NoThreeLine.FirstEventSections.markedHeadTail_preserving
#print axioms NoThreeLine.FirstEventSections.firstSiteSection_preserving
