import NoThreeLine.ProtectedLineBirth
import NoThreeLine.AugmentedTimedState
import NoThreeLine.ExtendedRetirement

/-! A passive protected-credit ledger. Newly retired roots save their
postgeometry credit divided by protection at that instant. Previously
saved entries are carried literally, never divided by a later protection. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

def protectedLineCredit {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (p : Grid n) : ℝ :=
  if (e.process.accounts p).status=.retired then saved p else
    (e.process.accounts p).credit/protection (occupancy e.process L) (e.clocks L)

def protectedLineSave {n : ℕ} (L : LineIndex n) (before after : ExtendedState n)
    (saved : Grid n→ℝ) (p : Grid n) : ℝ :=
  if (before.process.accounts p).status=.active ∧ (after.process.accounts p).status=.retired then
    (after.process.accounts p).credit/protection (occupancy after.process L) (after.clocks L)
  else saved p

theorem protectedLineCredit_active {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (p : Grid n) (hp : (e.process.accounts p).status=.active) :
    protectedLineCredit L e saved p=specifiedLineWeight e L p := by
  simp only [protectedLineCredit,CreditAccount.credit,hp,reduceCtorEq,if_false,
    true_or,if_true,specifiedLineWeight]

theorem protectedLineCredit_retired {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (p : Grid n) (hp : (e.process.accounts p).status=.retired) :
    protectedLineCredit L e saved p=saved p := by simp only [protectedLineCredit,hp,if_true]

theorem protectedLineSave_inactive {n : ℕ} (L : LineIndex n) (before after : ExtendedState n)
    (saved : Grid n→ℝ) (p : Grid n) (hp : (before.process.accounts p).status≠.active) :
    protectedLineSave L before after saved p=saved p := by
  simp only [protectedLineSave,hp,false_and,if_false]

theorem protectedLineSave_self {n : ℕ} (L : LineIndex n) (e : ExtendedState n) (saved : Grid n→ℝ) :
    protectedLineSave L e e saved=saved := by
  funext p
  have h : ¬((e.process.accounts p).status=.active ∧ (e.process.accounts p).status=.retired) := by
    rintro ⟨ha,hr⟩
    cases ha.symm.trans hr
  exact if_neg h

theorem protectedLineCredit_after_active {n : ℕ} (L : LineIndex n) (before after : ExtendedState n)
    (saved : Grid n→ℝ) (p : Grid n) (hp : (before.process.accounts p).status=.active) :
    protectedLineCredit L after (protectedLineSave L before after saved) p=
      (after.process.accounts p).credit/protection (occupancy after.process L) (after.clocks L) := by
  by_cases hr : (after.process.accounts p).status=.retired
  · simp only [protectedLineCredit,protectedLineSave,hp,hr,and_self,if_true]
  · simp only [protectedLineCredit,hr,if_false]

theorem protectedLineCredit_measurable {n : ℕ} (L : LineIndex n) (p : Grid n) :
    Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>protectedLineCredit L x.1 x.2 p) := by
  have ha : Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>(x.1.process.accounts p)) :=
    ((ProcessState.measurable_account n p).comp (ExtendedState.measurable_process n)).comp measurable_fst
  have hs := CreditAccount.measurable_status.comp ha
  have hc := CreditAccount.measurable_credit.comp ha
  have ho : Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>occupancy x.1.process L) :=
    (ExtendedState.measurable_occupancy n L).comp measurable_fst
  have hk : Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>x.1.clocks L) :=
    ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp measurable_fst
  unfold protectedLineCredit protection
  apply Measurable.ite (hs.eq_const CreditStatus.retired).setOf ((measurable_pi_apply p).comp measurable_snd)
  exact hc.div ((measurable_const.sub ((measurable_of_countable (fun j : ℕ=>(j:ℝ))).comp ho)).div (measurable_const.sub hk))

theorem protectedLineSave_measurable {n : ℕ} (L : LineIndex n) :
    Measurable (fun x : (ExtendedState n×ExtendedState n)×(Grid n→ℝ)=>protectedLineSave L x.1.1 x.1.2 x.2) := by
  apply measurable_pi_lambda
  intro p
  have hb : Measurable (fun x : (ExtendedState n×ExtendedState n)×(Grid n→ℝ)=>(x.1.1.process.accounts p)) :=
    ((ProcessState.measurable_account n p).comp (ExtendedState.measurable_process n)).comp measurable_fst.fst
  have ha : Measurable (fun x : (ExtendedState n×ExtendedState n)×(Grid n→ℝ)=>(x.1.2.process.accounts p)) :=
    ((ProcessState.measurable_account n p).comp (ExtendedState.measurable_process n)).comp measurable_fst.snd
  have ho : Measurable (fun x : (ExtendedState n×ExtendedState n)×(Grid n→ℝ)=>occupancy x.1.2.process L) :=
    (ExtendedState.measurable_occupancy n L).comp measurable_fst.snd
  have hk : Measurable (fun x : (ExtendedState n×ExtendedState n)×(Grid n→ℝ)=>x.1.2.clocks L) :=
    ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp measurable_fst.snd
  unfold protectedLineSave protection
  apply Measurable.ite (((CreditAccount.measurable_status.comp hb).eq_const CreditStatus.active).and
    ((CreditAccount.measurable_status.comp ha).eq_const CreditStatus.retired)).setOf _
      ((measurable_pi_apply p).comp measurable_snd)
  exact (CreditAccount.measurable_credit.comp ha).div
    ((measurable_const.sub ((measurable_of_countable (fun j : ℕ=>(j:ℝ))).comp ho)).div (measurable_const.sub hk))

theorem protectedLineCredit_bounds {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (p : Grid n) (B K : ℝ) (he : e.Valid B)
    (hN : occupancy e.process L≤1) (hk : e.clocks L≤K) (hK : K<2)
    (hsv : 0≤saved p ∧ saved p≤2*B) :
    0≤protectedLineCredit L e saved p ∧ protectedLineCredit L e saved p≤2*B := by
  cases hp : (e.process.accounts p).status with
  | active => rw [protectedLineCredit_active L e saved p hp]; exact specifiedLineWeight_bounds e L p B K he hN hk hK
  | retired => rw [protectedLineCredit_retired L e saved p hp]; exact hsv
  | selected => simpa only [protectedLineCredit,CreditAccount.credit,hp,reduceCtorEq,or_self,if_false,zero_div] using
      (show 0≤(0:ℝ) ∧ 0≤2*B from ⟨le_rfl,hsv.1.trans hsv.2⟩)
  | dead => simpa only [protectedLineCredit,CreditAccount.credit,hp,reduceCtorEq,or_self,if_false,zero_div] using
      (show 0≤(0:ℝ) ∧ 0≤2*B from ⟨le_rfl,hsv.1.trans hsv.2⟩)

theorem protectedLineSave_bounds {n : ℕ} (L : LineIndex n) (before after : ExtendedState n)
    (saved : Grid n→ℝ) (p : Grid n) (B K : ℝ) (he : after.Valid B)
    (hN : occupancy after.process L≤1) (hk : after.clocks L≤K) (hK : K<2)
    (hsv : 0≤saved p ∧ saved p≤2*B) :
    0≤protectedLineSave L before after saved p ∧ protectedLineSave L before after saved p≤2*B := by
  unfold protectedLineSave
  split_ifs with h
  · simpa only [CreditAccount.credit,h.2,or_true,if_true,specifiedLineWeight] using
      specifiedLineWeight_bounds after L p B K he hN hk hK
  · exact hsv

theorem protectedLineCredit_retire {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (positive : Grid n→Bool) (p : Grid n) :
    protectedLineCredit L (e.retire positive) (protectedLineSave L e (e.retire positive) saved) p=
      protectedLineCredit L e saved p := by
  cases hp : (e.process.accounts p).status <;> cases hb : positive p <;>
    simp [protectedLineCredit,protectedLineSave,ExtendedState.retire,ProcessState.retire,
      CreditAccount.retire,CreditAccount.credit,occupancy,hp,hb]

theorem protectedLineCredit_stop {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (p : Grid n) :
    protectedLineCredit L e.stop (protectedLineSave L e e.stop saved) p=protectedLineCredit L e saved p :=
  protectedLineCredit_retire L e saved (fun _=>true) p

theorem protectedLineCredit_resolve {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (p : Grid n) :
    protectedLineCredit L (e.resolve Γ B K ρ) (protectedLineSave L e (e.resolve Γ B K ρ) saved) p=
      protectedLineCredit L e saved p := by
  unfold ExtendedState.resolve resolveBoundary
  split_ifs
  · exact protectedLineCredit_stop L e saved p
  · exact protectedLineCredit_retire L e saved _ p

theorem protectedLineCredit_augResolve {n : ℕ} (L : LineIndex n) (e : AugmentedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ) (p : Grid n) :
    protectedLineCredit L (e.resolve Γ B K ρ ε M).physical
        (protectedLineSave L e.physical (e.resolve Γ B K ρ ε M).physical saved) p=
      protectedLineCredit L e.physical saved p := by
  unfold AugmentedState.resolve
  split_ifs
  · exact protectedLineCredit_stop L e.physical saved p
  · exact protectedLineCredit_resolve L e.physical saved Γ B K ρ p

end NoThreeLine

#print axioms NoThreeLine.protectedLineCredit_retire
#print axioms NoThreeLine.protectedLineCredit_augResolve
#print axioms NoThreeLine.protectedLineSave_bounds
