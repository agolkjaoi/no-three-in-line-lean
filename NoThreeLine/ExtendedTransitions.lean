import NoThreeLine.BoundaryMeasurable

/-! Measurable coordinate and candidate updates of the full extended state.
Clocks and line credits are retained at a birth, as in the manuscript. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

theorem ProcessState.measurable_withWeights_joint (n : ℕ) :
    Measurable (fun x : ProcessState n × (Grid n → ℝ) => x.1.withWeights x.2) := by
  apply measurable_mk _ _ _ ((measurable_selected n).comp measurable_fst) _
    ((measurable_stopped n).comp measurable_fst)
  apply measurable_pi_lambda
  intro p
  exact CreditAccount.measurable_mk _ _
    (CreditAccount.measurable_status.comp ((measurable_account n p).comp measurable_fst))
    ((measurable_pi_apply p).comp measurable_snd)

theorem ExtendedState.measurable_withCoordinates (n : ℕ) :
    Measurable (fun x : ExtendedState n × Coordinates n => x.1.withCoordinates x.2) := by
  apply measurable_mk _ _ _ _ _ measurable_snd.snd.fst measurable_snd.snd.snd
    ((measurable_handled n).comp measurable_fst)
  exact (ProcessState.measurable_withWeights_joint n).comp
    (((measurable_process n).comp measurable_fst).prodMk measurable_snd.fst)

theorem ExtendedState.measurable_birth_fixed {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (q : Grid n) :
    Measurable (fun x : ExtendedState n × (Grid n → Bool) => x.1.birth Γ q x.2) := by
  apply measurable_mk _ _ _ _ _ ((measurable_clocks n).comp measurable_fst)
    ((measurable_lineCredits n).comp measurable_fst) ((measurable_handled n).comp measurable_fst)
  exact (ProcessState.measurable_birth_fixed Γ q).comp
    (((measurable_process n).comp measurable_fst).prodMk measurable_snd)

def ExtendedState.candidateUpdate {n : ℕ} (e : ExtendedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (B : ℝ) (q : Grid n) (positive : Grid n → Bool) (mark : ℝ) : ExtendedState n :=
  ⟨e.process.thinnedBirth Γ q positive (e.process.acceptance mask B q) mark,
    e.clocks,e.lineCredits,e.handled⟩

theorem ExtendedState.candidateUpdate_eq {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (B : ℝ) (q : Grid n)
    (positive : Grid n → Bool) (mark : ℝ) :
    e.candidateUpdate Γ mask B q positive mark =
      if mark ≤ e.process.acceptance mask B q then e.birth Γ q positive else e := by
  unfold candidateUpdate ProcessState.thinnedBirth
  split_ifs
  · rfl
  · cases e
    rfl

theorem ExtendedState.candidateUpdate_valid {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (B : ℝ) (q : Grid n)
    (positive : Grid n → Bool) (mark : ℝ) (he : e.Valid B) :
    (e.candidateUpdate Γ mask B q positive mark).Valid B := by
  rw [candidateUpdate_eq]
  split_ifs
  · exact e.birth_valid B he Γ q positive
  · exact he

theorem ExtendedState.measurable_candidateUpdate_fixed {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (B : ℝ) (q : Grid n) :
    Measurable (fun x : (ExtendedState n × (Grid n → Bool)) × ℝ =>
      x.1.1.candidateUpdate Γ mask B q x.1.2 x.2) := by
  apply measurable_mk _ _ _ _ _ ((measurable_clocks n).comp measurable_fst.fst)
    ((measurable_lineCredits n).comp measurable_fst.fst)
    ((measurable_handled n).comp measurable_fst.fst)
  exact (ProcessState.measurable_thinnedBirth_fixed Γ mask B q).comp
    ((((measurable_process n).comp measurable_fst.fst).prodMk measurable_fst.snd).prodMk measurable_snd)

theorem ExtendedState.measurable_candidateUpdate {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (mask : Grid n → ℝ) (B : ℝ) :
    Measurable (fun x : ((ExtendedState n × (Grid n → Bool)) × ℝ) × Grid n =>
      x.1.1.1.candidateUpdate Γ mask B x.2 x.1.1.2 x.1.2) :=
  measurable_from_prod_countable_left (fun q => measurable_candidateUpdate_fixed Γ mask B q)

end NoThreeLine

#print axioms NoThreeLine.ExtendedState.measurable_withCoordinates
#print axioms NoThreeLine.ExtendedState.candidateUpdate_valid
#print axioms NoThreeLine.ExtendedState.measurable_candidateUpdate
