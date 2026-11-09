import NoThreeLine.ProtectedLedgerGlobalBounds
import NoThreeLine.ValidLineStageValue

/-! Absolute deadline retirement carries existing saved protection
values and saves the new retirees at the unchanged boundary clock. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine
open AuxiliaryODE BirthWitness

abbrev ProtectedPhaseState (n : ℕ) (B : ℝ) :=
  ValidAugmentedState n B × ((Grid n → ℝ) × ℝ)

theorem validAugPhysical_measurable {n : ℕ} {B : ℝ} :
    Measurable (fun e : ValidAugmentedState n B=>e.val.physical) :=
  (AugmentedState.measurable_physical n).comp measurable_subtype_coe

def protectedPhaseCredit {n : ℕ} {B : ℝ} (L : LineIndex n) (p : Grid n)
    (s : ProtectedPhaseState n B) : ℝ :=
  protectedLineCredit L s.1.val.physical s.2.1 p

theorem protectedPhaseCredit_measurable {n : ℕ} {B : ℝ} (L : LineIndex n) (p : Grid n) :
    Measurable (protectedPhaseCredit (B:=B) L p) :=
  (protectedLineCredit_measurable L p).comp
    ((validAugPhysical_measurable.comp measurable_fst).prodMk measurable_snd.fst)

def protectedDeadlineBook {n : ℕ} {B : ℝ} (L : LineIndex n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : ProtectedPhaseState n B) : ProtectedPhaseState n B :=
  let e := augValidDeadlineRetirement deadline t s.1
  (e,(protectedLineSave L s.1.val.physical e.val.physical s.2.1,s.2.2))

theorem protectedDeadlineBook_measurable {n : ℕ} {B : ℝ} (L : LineIndex n)
    (deadline : Grid n→ℝ) (t : ℝ) : Measurable (protectedDeadlineBook (B:=B) L deadline t) := by
  have he : Measurable (fun s : ProtectedPhaseState n B=>augValidDeadlineRetirement deadline t s.1) :=
    (augValidDeadlineRetirement_measurable deadline t).comp measurable_fst
  exact he.prodMk (((protectedLineSave_measurable L).comp
    (((validAugPhysical_measurable.comp measurable_fst).prodMk (validAugPhysical_measurable.comp he)).prodMk
      measurable_snd.fst)).prodMk measurable_snd.snd)

theorem protectedDeadlineBook_credit {n : ℕ} {B : ℝ} (L : LineIndex n) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : ProtectedPhaseState n B) :
    protectedPhaseCredit L p (protectedDeadlineBook L deadline t s)=protectedPhaseCredit L p s := by
  unfold protectedPhaseCredit protectedDeadlineBook augValidDeadlineRetirement
  split
  · dsimp only
    rw [protectedLineSave_self]
  · exact protectedLineCredit_retire L _ _ (fun q=>decide (deadline q≤t)) p

theorem protectedDeadlineBook_saved_bounds {n : ℕ} {B : ℝ} (L : LineIndex n)
    (Γ : Finset PrimitiveLines.ZPoint) (hsp : specified Γ L) (p : Grid n) (hpL : p∈L.val)
    (deadline : Grid n→ℝ) (t : ℝ) (s : ProtectedPhaseState n B)
    (hs : 0≤s.2.1 p ∧ s.2.1 p≤2*B) :
    0≤(protectedDeadlineBook L deadline t s).2.1 p ∧
      (protectedDeadlineBook L deadline t s).2.1 p≤2*B := by
  let v := protectedDeadlineBook L deadline t s
  by_cases hr : (v.1.val.physical.process.accounts p).status=.retired
  · have h := protectedDeadlineBook_credit L p deadline t s
    change protectedLineCredit L v.1.val.physical v.2.1 p=protectedPhaseCredit L p s at h
    rw [protectedLineCredit_retired L _ _ p hr] at h
    change 0≤v.2.1 p ∧ v.2.1 p≤2*B
    rw [h]
    exact protectedLineCredit_bounds_all L _ _ Γ hsp p hpL B s.1.property.1 hs
  · change 0≤protectedLineSave L s.1.val.physical v.1.val.physical s.2.1 p ∧
      protectedLineSave L s.1.val.physical v.1.val.physical s.2.1 p≤2*B
    simpa only [protectedLineSave,hr,and_false,if_false] using hs

end NoThreeLine

#print axioms NoThreeLine.protectedDeadlineBook_credit
#print axioms NoThreeLine.protectedDeadlineBook_saved_bounds
