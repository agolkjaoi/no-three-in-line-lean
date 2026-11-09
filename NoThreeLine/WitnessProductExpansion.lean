import NoThreeLine.SingletonWitnessCredit
import Mathlib.Algebra.BigOperators.Ring.Finset

/-! Expand any fixed moment of a weighted retained-witness sum. Repeated
labels are retained explicitly through their image set; their [0,1] factors
can be removed only in the upper-bound direction. No independence is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness

theorem prod_comp_le_prod_image {ι κ : Type*} [DecidableEq ι] [DecidableEq κ]
    (I : Finset ι) (f : ι→κ) (g : κ→ℝ) (hg : ∀q,0≤g q ∧ g q≤1) :
    (∏i∈I,g (f i))≤∏q∈I.image f,g q := by
  induction I using Finset.induction_on with
  | empty => simp
  | @insert i I hi ih =>
    rw [Finset.prod_insert hi,Finset.image_insert]
    by_cases hfi : f i∈I.image f
    · rw [Finset.insert_eq_of_mem hfi]
      exact (mul_le_of_le_one_left (Finset.prod_nonneg (fun j _=>(hg (f j)).1)) (hg (f i)).2).trans ih
    · rw [Finset.prod_insert hfi]
      exact mul_le_mul_of_nonneg_left ih (hg (f i)).1

def witnessSum {n : ℕ} (w : Grid n→ℝ) (a : WitnessState n) : ℝ :=
  ∑q : Grid n,w q*a.retained q

def activeWitnessPower {n : ℕ} (w : Grid n→ℝ) (m : ℕ) (p : Grid n) (a : WitnessState n) : ℝ :=
  if (a.augmented.physical.process.accounts p).status=.active then witnessSum w a^m else 0

theorem activeWitnessPower_measurable {n : ℕ} (w : Grid n→ℝ) (m : ℕ) (p : Grid n) :
    Measurable (activeWitnessPower w m p) := by
  apply Measurable.ite
  · exact ((CreditAccount.measurable_status.comp ((ProcessState.measurable_account n p).comp
      ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
        (WitnessState.measurable_augmented n))))).eq measurable_const).setOf
  · exact (Finset.measurable_sum _ (fun q _=>
      ((measurable_pi_apply q).comp (WitnessState.measurable_retained n)).const_mul (w q))).pow_const m
  · exact measurable_const

theorem activeWitnessPower_bounds {n : ℕ} (w : Grid n→ℝ) (m : ℕ) (p : Grid n)
    (a : WitnessState n) (B : ℝ) (ha : a.Valid B) (hw : ∀q,0≤w q) :
    0≤activeWitnessPower w m p a ∧ activeWitnessPower w m p a≤(∑q,w q)^m := by
  have hsum0 : 0≤witnessSum w a := Finset.sum_nonneg (fun q _=>mul_nonneg (hw q) (ha.2.1 q).1)
  have hsum1 : witnessSum w a≤∑q,w q :=
    Finset.sum_le_sum (fun q _=>mul_le_of_le_one_right (hw q) (ha.2.1 q).2)
  unfold activeWitnessPower
  split_ifs
  · exact ⟨pow_nonneg hsum0 m,pow_le_pow_left₀ hsum0 hsum1 m⟩
  · exact ⟨le_rfl,pow_nonneg (Finset.sum_nonneg (fun q _=>hw q)) m⟩

theorem activeWitnessPower_expansion_bound {n : ℕ} (w : Grid n→ℝ) (m : ℕ) (p : Grid n)
    (a : WitnessState n) (B : ℝ) (ha : a.Valid B) (hw : ∀q,0≤w q) :
    activeWitnessPower w m p a≤
      ∑f : Fin m→Grid n,(∏i : Fin m,w (f i))*activeWitness (Finset.univ.image f) p a := by
  classical
  by_cases hp : (a.augmented.physical.process.accounts p).status=.active
  · simp only [activeWitnessPower,activeWitness,hp,ite_true,witnessSum]
    rw [Fintype.sum_pow]
    apply Finset.sum_le_sum
    intro f _
    rw [Finset.prod_mul_distrib]
    exact mul_le_mul_of_nonneg_left
      (prod_comp_le_prod_image Finset.univ f a.retained ha.2.1)
      (Finset.prod_nonneg (fun i _=>hw (f i)))
  · simp only [activeWitnessPower,activeWitness,hp,ite_false,mul_zero,Finset.sum_const_zero,le_refl]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.prod_comp_le_prod_image
#print axioms NoThreeLine.BirthWitness.activeWitnessPower_expansion_bound
