import NoThreeLine.VariableResidualSection

/-! A fixed site's strict-winning section of the original board law. The
winning wait and mark are consumed; all losing first waits are reduced by
the winning time. No restart law is an assumption. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine.FixedWinnerRestart
open ClockRestartBase DeterministicClockRestart FiniteClockRestart
open FirstEventSections WinnerSectionDensity VariableResidualSection

theorem head_section_map (ι : Type*) [Fintype ι] (rate : ℝ) (hr : 0 < rate) :
    ((((expMeasure rate).prod (markMeasure.prod (markedClockMeasure rate))).prod
      (markedFamilyMeasure ι rate)).restrict
        {z : (ℝ × (ℝ × MarkedClockPath)) × (ι → MarkedClockPath) |
          z.2 ∈ allSurvive z.1.1}).map
            (fun z => (z.1, residualFamily z.1.1 z.2)) =
      (Fintype.card ι + 1 : ℝ≥0∞)⁻¹ •
        (((expMeasure (((Fintype.card ι : ℝ)+1)*rate)).prod
          (markMeasure.prod (markedClockMeasure rate))).prod (markedFamilyMeasure ι rate)) := by
  letI := isProbabilityMeasure_expMeasure hr
  letI := markedClockMeasure_probability rate hr
  letI := family_probability ι rate hr
  have hp : ∀ᵐ z : ℝ × (ℝ × MarkedClockPath)
      ∂(expMeasure rate).prod (markMeasure.prod (markedClockMeasure rate)), 0 ≤ z.1 :=
    Measure.quasiMeasurePreserving_fst.ae ((expMeasure_ae_positive rate hr).mono (fun _ h => h.le))
  rw [residual_section_map _ Prod.fst measurable_fst hp rate hr,
    ← prod_withDensity_left (survivorWeight_measurable (Fintype.card ι) rate),
    fixed_winner_time_measure _ rate hr, Measure.prod_smul_left, Measure.prod_smul_left]

def joinSite {n : ℕ} (p : Grid n)
    (z : MarkedClockPath × (OtherSites p → MarkedClockPath)) : BoardClockPath n := by
  classical
  exact fun q => if h : q = p then z.1 else z.2 ⟨q,h⟩

theorem joinSite_measurable {n : ℕ} (p : Grid n) : Measurable (joinSite p) := by
  classical
  apply measurable_pi_lambda
  intro q
  by_cases h : q = p
  · simpa [joinSite, h] using (measurable_fst : Measurable (Prod.fst :
      MarkedClockPath × (OtherSites p → MarkedClockPath) → MarkedClockPath))
  · simp only [joinSite, dif_neg h]
    exact (measurable_pi_apply (⟨q,h⟩ : OtherSites p)).comp
      (measurable_snd : Measurable (Prod.snd :
        MarkedClockPath × (OtherSites p → MarkedClockPath) → (OtherSites p → MarkedClockPath)))

theorem joinSite_splitSite {n : ℕ} (p : Grid n) (ω : BoardClockPath n) :
    joinSite p (splitSite p ω) = ω := by
  classical
  funext q
  by_cases h : q = p <;> simp [joinSite, splitSite, h]

theorem joinSite_preserving {n : ℕ} (p : Grid n) (rate : ℝ) (hr : 0 < rate) :
    MeasurePreserving (joinSite p)
      ((markedClockMeasure rate).prod (markedFamilyMeasure (OtherSites p) rate))
      (boardClockMeasure n rate) := by
  refine ⟨joinSite_measurable p, ?_⟩
  rw [← (splitSite_preserving rate hr p).map_eq,
    Measure.map_map (joinSite_measurable p) (splitSite_measurable p)]
  have he : joinSite p ∘ splitSite p = id := funext (joinSite_splitSite p)
  rw [he, Measure.map_id]

def stitchSection {n : ℕ} (p : Grid n)
    (z : (ℝ × (ℝ × MarkedClockPath)) × (OtherSites p → MarkedClockPath)) :
    ℝ × (ℝ × BoardClockPath n) :=
  (z.1.1, (z.1.2.1, joinSite p (z.1.2.2,z.2)))

theorem stitchSection_preserving {n : ℕ} (p : Grid n) (rate r : ℝ)
    (hr : 0 < rate) (hr' : 0 < r) :
    MeasurePreserving (stitchSection p)
      (((expMeasure r).prod (markMeasure.prod (markedClockMeasure rate))).prod
        (markedFamilyMeasure (OtherSites p) rate))
      ((expMeasure r).prod (markMeasure.prod (boardClockMeasure n rate))) := by
  letI := isProbabilityMeasure_expMeasure hr'
  letI := markedClockMeasure_probability rate hr
  letI := family_probability (OtherSites p) rate hr
  have h₁ := measurePreserving_prodAssoc (expMeasure r)
    (markMeasure.prod (markedClockMeasure rate)) (markedFamilyMeasure (OtherSites p) rate)
  have h₂ := (MeasurePreserving.id (expMeasure r)).prod
    (measurePreserving_prodAssoc markMeasure (markedClockMeasure rate)
      (markedFamilyMeasure (OtherSites p) rate))
  have h₃ := (MeasurePreserving.id (expMeasure r)).prod
    ((MeasurePreserving.id markMeasure).prod (joinSite_preserving p rate hr))
  exact h₃.comp (h₂.comp h₁)

def strictWinner {n : ℕ} (p : Grid n) : Set (BoardClockPath n) :=
  {ω | ∀ q : OtherSites p, (ω p).1 0 < (ω q.val).1 0}

def restartAt {n : ℕ} (p : Grid n) (t : ℝ) (ω : BoardClockPath n) : BoardClockPath n :=
  joinSite p ((tail (ω p).1,tail (ω p).2), fun q => residualMarked t (ω q.val))

def sectionOutput {n : ℕ} (p : Grid n) (ω : BoardClockPath n) :
    ℝ × (ℝ × BoardClockPath n) :=
  ((ω p).1 0, ((ω p).2 0, restartAt p ((ω p).1 0) ω))

theorem strictWinner_measurable {n : ℕ} (p : Grid n) : MeasurableSet (strictWinner p) := by
  have he : strictWinner p = firstSiteSection p ⁻¹'
      {z : (ℝ × (ℝ × MarkedClockPath)) × (OtherSites p → MarkedClockPath) |
        z.2 ∈ allSurvive z.1.1} := rfl
  rw [he]
  exact ((allSurvive_joint_measurable (OtherSites p)).preimage
    ((measurable_fst.comp measurable_fst).prodMk measurable_snd)).preimage
      ((markedHeadTail_measurable.comp (measurable_pi_apply p)).prodMk
        (measurable_pi_lambda _ (fun q => measurable_pi_apply q.val)))

theorem fixed_winner_restart_map {n : ℕ} (p : Grid n) (rate : ℝ) (hr : 0 < rate) :
    ((boardClockMeasure n rate).restrict (strictWinner p)).map (sectionOutput p) =
      (Fintype.card (OtherSites p) + 1 : ℝ≥0∞)⁻¹ •
        ((expMeasure (((Fintype.card (OtherSites p) : ℝ)+1)*rate)).prod
          (markMeasure.prod (boardClockMeasure n rate))) := by
  let ι := OtherSites p
  let S : Set ((ℝ × (ℝ × MarkedClockPath)) × (ι → MarkedClockPath)) :=
    {z | z.2 ∈ allSurvive z.1.1}
  let F : (ℝ × (ℝ × MarkedClockPath)) × (ι → MarkedClockPath) →
      (ℝ × (ℝ × MarkedClockPath)) × (ι → MarkedClockPath) :=
    fun z => (z.1, residualFamily z.1.1 z.2)
  have hS : MeasurableSet S := (allSurvive_joint_measurable ι).preimage
    ((measurable_fst.comp measurable_fst).prodMk measurable_snd)
  have hF : Measurable F := measurable_fst.prodMk
    ((residualFamily_joint_measurable ι).comp
      ((measurable_fst.comp measurable_fst).prodMk measurable_snd))
  have hr' : 0 < ((Fintype.card ι : ℝ)+1)*rate := mul_pos (by positivity) hr
  have hs := stitchSection_preserving p rate _ hr hr'
  have hm := congrArg (fun μ => μ.map (stitchSection p)) (head_section_map ι rate hr)
  rw [Measure.map_smul, hs.map_eq] at hm
  have hsplit := (firstSiteSection_preserving rate hr p).map_eq
  have hrestrict := Measure.restrict_map (μ := boardClockMeasure n rate)
    (firstSiteSection_preserving rate hr p).measurable hS
  rw [hsplit] at hrestrict
  change (((expMeasure rate).prod (markMeasure.prod (markedClockMeasure rate))).prod
    (markedFamilyMeasure ι rate)).restrict S =
    ((boardClockMeasure n rate).restrict (strictWinner p)).map (firstSiteSection p) at hrestrict
  rw [hrestrict, Measure.map_map hF (firstSiteSection_preserving rate hr p).measurable,
    Measure.map_map hs.measurable (hF.comp (firstSiteSection_preserving rate hr p).measurable)] at hm
  exact hm

end NoThreeLine.FixedWinnerRestart

#print axioms NoThreeLine.FixedWinnerRestart.fixed_winner_restart_map
