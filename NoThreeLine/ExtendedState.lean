import NoThreeLine.BirthMeasurable
import NoThreeLine.HandledLineInvariant

/-! State for repeated segments, with actual accounts, physical line clocks,
line credits, and the finite record of processed tag lines. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

structure ExtendedState (n : ℕ) where
  process : ProcessState n
  clocks : LineIndex n → ℝ
  lineCredits : LineIndex n → ℝ
  handled : Finset (LineIndex n)

def ExtendedState.coordinates {n : ℕ} (e : ExtendedState n) : Coordinates n :=
  (fun p => (e.process.accounts p).weight, (e.clocks,e.lineCredits))

def ExtendedState.initial (n : ℕ) : ExtendedState n :=
  ⟨ProcessState.initial n,fun _ => 0,fun _ => 1,∅⟩

def ExtendedState.Valid {n : ℕ} (e : ExtendedState n) (B : ℝ) : Prop :=
  e.process.Valid ∧ CoordinateBounds B e.coordinates ∧ HandledInactive e.process e.handled

def ExtendedState.withCoordinates {n : ℕ} (e : ExtendedState n) (z : Coordinates n) : ExtendedState n :=
  ⟨e.process.withWeights z.1,z.2.1,z.2.2,e.handled⟩

def ExtendedState.birth {n : ℕ} (e : ExtendedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (q : Grid n) (positive : Grid n → Bool) : ExtendedState n :=
  ⟨e.process.birth Γ q positive,e.clocks,e.lineCredits,e.handled⟩

def ExtendedState.resolve {n : ℕ} (e : ExtendedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ : ℝ) : ExtendedState n :=
  ⟨resolveBoundary e.process Γ B K ρ e.clocks e.lineCredits e.handled,
    e.clocks,e.lineCredits,handledAfter e.process Γ e.lineCredits ρ e.handled⟩

theorem ExtendedState.initial_valid (n : ℕ) (B : ℝ) (hB : 1 ≤ B) :
    (ExtendedState.initial n).Valid B := by
  refine ⟨ProcessState.initial_valid n,?_,handledInactive_empty _⟩
  refine ⟨?_,?_,?_⟩
  · intro p
    exact ⟨by norm_num [initial,coordinates,ProcessState.initial],hB⟩
  · intro L
    norm_num [initial,coordinates]
  · intro L
    norm_num [initial,coordinates]

theorem ExtendedState.withCoordinates_coordinates {n : ℕ} (e : ExtendedState n)
    (z : Coordinates n) : (e.withCoordinates z).coordinates = z := by
  cases z
  rfl

theorem ExtendedState.withCoordinates_valid {n : ℕ} (e : ExtendedState n) (B : ℝ)
    (he : e.Valid B) (z : Coordinates n) (hz : CoordinateBounds B z) :
    (e.withCoordinates z).Valid B := by
  refine ⟨e.process.withWeights_valid z.1 he.1 (fun p => (hz.1 p).1),?_,?_⟩
  · rw [withCoordinates_coordinates]
    exact hz
  · exact handledInactive_withWeights e.process e.handled he.2.2 z.1

theorem birthAccount_weight_bounds {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (S : Finset (Grid n)) (p q : Grid n) (a : CreditAccount) (positive : Bool) (B : ℝ)
    (hw : 0 ≤ a.weight ∧ a.weight ≤ B) :
    0 ≤ (birthAccount Γ S p q a positive).weight ∧
      (birthAccount Γ S p q a positive).weight ≤ B := by
  refine ⟨birthAccount_weight_nonneg Γ S p q a positive hw.1,?_⟩
  have hB : 0 ≤ B := hw.1.trans hw.2
  unfold birthAccount
  rw [CreditAccount.retire_weight]
  unfold birthGeometry
  split_ifs
  · exact hB
  · exact hB
  · exact (mul_le_of_le_one_left hw.1 (birthMultiplier_bounds Γ S p q).2).trans hw.2
  · exact hw.2

theorem ExtendedState.birth_valid {n : ℕ} (e : ExtendedState n) (B : ℝ)
    (he : e.Valid B) (Γ : Finset PrimitiveLines.ZPoint) (q : Grid n)
    (positive : Grid n → Bool) : (e.birth Γ q positive).Valid B := by
  refine ⟨e.process.birth_valid Γ q positive he.1,?_,
    handledInactive_birth e.process e.handled he.2.2 Γ q positive⟩
  refine ⟨?_,he.2.1.2.1,he.2.1.2.2⟩
  intro p
  change 0 ≤ ((e.process.birth Γ q positive).accounts p).weight ∧
    ((e.process.birth Γ q positive).accounts p).weight ≤ B
  unfold ProcessState.birth
  split_ifs
  · exact birthAccount_weight_bounds Γ e.process.selected p q (e.process.accounts p) (positive p) B
      (he.2.1.1 p)
  · exact he.2.1.1 p

theorem ExtendedState.resolve_coordinates {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) :
    (e.resolve Γ B K ρ).coordinates = e.coordinates := by
  unfold resolve coordinates resolveBoundary
  split_ifs
  · congr 2
    funext p
    exact CreditAccount.retire_weight _ _
  · congr 2
    funext p
    exact CreditAccount.retire_weight _ _

theorem ExtendedState.resolve_valid {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (he : e.Valid B) :
    (e.resolve Γ B K ρ).Valid B := by
  refine ⟨resolveBoundary_valid e.process Γ B K ρ e.clocks e.lineCredits e.handled he.1,?_,
    handledInactive_resolve e.process Γ B K ρ e.clocks e.lineCredits e.handled he.2.2⟩
  rw [resolve_coordinates]
  exact he.2.1

theorem ExtendedState.resolve_credit {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (p : Grid n) :
    (((e.resolve Γ B K ρ).process).accounts p).credit = (e.process.accounts p).credit :=
  resolveBoundary_credit e.process Γ B K ρ e.clocks e.lineCredits e.handled p

instance (n : ℕ) : MeasurableSpace (ExtendedState n) :=
  MeasurableSpace.comap (fun e : ExtendedState n =>
    (e.process,((e.clocks,e.lineCredits),e.handled))) inferInstance

theorem ExtendedState.measurable_fields (n : ℕ) :
    Measurable (fun e : ExtendedState n => (e.process,((e.clocks,e.lineCredits),e.handled))) :=
  comap_measurable _

theorem ExtendedState.measurable_process (n : ℕ) : Measurable (@ExtendedState.process n) :=
  (measurable_fields n).fst
theorem ExtendedState.measurable_clocks (n : ℕ) : Measurable (@ExtendedState.clocks n) :=
  (measurable_fields n).snd.fst.fst
theorem ExtendedState.measurable_lineCredits (n : ℕ) : Measurable (@ExtendedState.lineCredits n) :=
  (measurable_fields n).snd.fst.snd
theorem ExtendedState.measurable_handled (n : ℕ) : Measurable (@ExtendedState.handled n) :=
  (measurable_fields n).snd.snd

theorem ExtendedState.measurable_mk {n : ℕ} {X : Type*} [MeasurableSpace X]
    (s : X → ProcessState n) (k r : X → LineIndex n → ℝ) (h : X → Finset (LineIndex n))
    (hs : Measurable s) (hk : Measurable k) (hr : Measurable r) (hh : Measurable h) :
    Measurable (fun x => ExtendedState.mk (s x) (k x) (r x) (h x)) :=
  measurable_comap_iff.mpr (hs.prodMk ((hk.prodMk hr).prodMk hh))

theorem ExtendedState.measurable_coordinates (n : ℕ) : Measurable (@ExtendedState.coordinates n) := by
  apply Measurable.prodMk
  · apply measurable_pi_lambda
    intro p
    exact CreditAccount.measurable_weight.comp
      ((ProcessState.measurable_account n p).comp (measurable_process n))
  · exact (measurable_clocks n).prodMk (measurable_lineCredits n)

end NoThreeLine

#print axioms NoThreeLine.ExtendedState.initial_valid
#print axioms NoThreeLine.ExtendedState.birth_valid
#print axioms NoThreeLine.ExtendedState.resolve_valid
#print axioms NoThreeLine.ExtendedState.measurable_coordinates
