import NoThreeLine.ProtectedLedgerBirth
import NoThreeLine.BirthCountingEvent

/-! The actual uniform-mark/label average for protected ledger credit,
annihilated at an accepted birth on L. This supplies the killed-candidate
generator before adjoining its continuous hazard likelihood. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness LineDrift

def protectedForbiddenMarkCredit {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (q p : Grid n) (positive : Grid n→Bool) (z : ℝ) : ℝ :=
  if z≤e.process.acceptance mask B q ∧ eligibleBirth e.process q then
    if q∈L.val then 0 else
      protectedLineCredit L (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved) p
  else protectedLineCredit L e saved p

theorem protectedForbiddenMarkCredit_actual {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (q p : Grid n) (positive : Grid n→Bool) (z : ℝ) :
    protectedForbiddenMarkCredit L e saved Γ mask B q p positive z=
      (if z≤e.process.acceptance mask B q ∧ eligibleBirth e.process q ∧ q∈L.val then (0:ℝ) else 1)*
        protectedLineCredit L (e.candidateUpdate Γ mask B q positive z)
          (protectedLineSave L e (e.candidateUpdate Γ mask B q positive z) saved) p := by
  by_cases he : eligibleBirth e.process q
  · rw [ExtendedState.candidateUpdate_eq]
    by_cases hz : z≤e.process.acceptance mask B q <;> by_cases hq : q∈L.val <;>
      simp only [protectedForbiddenMarkCredit,he,hz,hq,and_self,and_true,and_false,false_and,true_and,
        if_true,if_false,zero_mul,one_mul,protectedLineSave_self]
  · have hb : e.birth Γ q positive=e := by
      unfold ExtendedState.birth ProcessState.birth
      change ¬(e.process.stopped=false ∧ (e.process.accounts q).status=.active) at he
      rw [if_neg he]
    rw [ExtendedState.candidateUpdate_eq,hb]
    simp only [ite_self,protectedForbiddenMarkCredit,he,and_false,false_and,if_false,one_mul,protectedLineSave_self]

theorem protectedForbiddenMarkCredit_mean {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (hB : 0<B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hw : e.Valid B)
    (q p : Grid n) (positive : Grid n→Bool) :
    (∫z,protectedForbiddenMarkCredit L e saved Γ mask B q p positive z ∂markMeasure)=
      protectedLineCredit L e saved p+e.process.acceptance mask B q*
        ((if q∈L.val then 0 else
          protectedLineCredit L (e.birth Γ q positive) (protectedLineSave L e (e.birth Γ q positive) saved) p)-
        protectedLineCredit L e saved p) := by
  by_cases he : eligibleBirth e.process q
  · have hα := e.process.acceptance_bounds mask B hB hm (fun q _=>hw.2.1.1 q) q
    simp only [protectedForbiddenMarkCredit,he,and_true]
    rw [mark_integral_ite _ _ _ hα.1 hα.2]
    ring
  · have hα : e.process.acceptance mask B q=0 := by
      change ¬(e.process.stopped=false ∧ (e.process.accounts q).status=.active) at he
      exact if_neg he
    simp only [protectedForbiddenMarkCredit,he,and_false,if_false,hα,zero_mul,add_zero]
    simp

def protectedLedgerCandidateMean {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (positive : Grid n→Grid n→Bool) (p : Grid n) : ℝ :=
  (∑q : Grid n,∫z,protectedForbiddenMarkCredit L e saved Γ mask B q p (positive q) z ∂markMeasure)/(n:ℝ)^2

theorem protectedLedgerCandidateMean_generator {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (hn : 0<n) (hB : 0<B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hw : e.Valid B)
    (positive : Grid n→Grid n→Bool) (p : Grid n) :
    ((n:ℝ)*B)*(protectedLedgerCandidateMean L e saved Γ mask B positive p-protectedLineCredit L e saved p)=
      protectedLedgerExternalJumpRate e saved Γ mask positive L p-
        lineIntensity e.process mask e.coordinates L*protectedLineCredit L e saved p := by
  classical
  let C := protectedLineCredit L e saved p
  let D := fun q=> (if q∈L.val then 0 else
    protectedLineCredit L (e.birth Γ q (positive q)) (protectedLineSave L e (e.birth Γ q (positive q)) saved) p)-C
  have hn0 : (n:ℝ)≠0 := by exact_mod_cast Nat.ne_of_gt hn
  have hmean : ((n:ℝ)*B)*(protectedLedgerCandidateMean L e saved Γ mask B positive p-C)=
      ∑q : Grid n,e.process.birthRate mask q*D q := by
    unfold protectedLedgerCandidateMean
    simp_rw [protectedForbiddenMarkCredit_mean L e saved Γ mask B hB hm hw]
    change ((n:ℝ)*B)*((∑q : Grid n,(C+e.process.acceptance mask B q*D q))/(n:ℝ)^2-C)=_
    calc
      _ = (B/n)*(∑q : Grid n,e.process.acceptance mask B q*D q) := by
        rw [Finset.sum_add_distrib]
        simp only [Finset.sum_const,Finset.card_univ,Fintype.card_prod,Fintype.card_fin,nsmul_eq_mul,Nat.cast_mul]
        field_simp
        <;> ring
      _ = _ := by
        rw [Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro q _
        rw [←mul_assoc,e.process.candidate_rate_times_acceptance mask B hB.ne' q]
  have hext : (∑q : Grid n,if q∈L.val then 0 else e.process.birthRate mask q*
      (protectedLineCredit L (e.birth Γ q (positive q)) (protectedLineSave L e (e.birth Γ q (positive q)) saved) p-C))=
      protectedLedgerExternalJumpRate e saved Γ mask positive L p := by
    symm
    apply Finset.sum_subset (Finset.subset_univ _)
    intro q _ hq
    have ha : (e.process.accounts q).status≠.active := fun h=>hq ((e.process.mem_activeEvents q).mpr h)
    simp [ProcessState.birthRate,ha]
  have hline : (∑q : Grid n,if q∈L.val then e.process.birthRate mask q else 0)=
      lineIntensity e.process mask e.coordinates L := by
    simp only [←Finset.sum_filter,Finset.filter_mem_eq_inter,Finset.univ_inter]
    rfl
  rw [hmean]
  calc
    _ = (∑q : Grid n,if q∈L.val then 0 else e.process.birthRate mask q*
        (protectedLineCredit L (e.birth Γ q (positive q)) (protectedLineSave L e (e.birth Γ q (positive q)) saved) p-C))-
        (∑q : Grid n,if q∈L.val then e.process.birthRate mask q else 0)*C := by
      rw [Finset.sum_mul,←Finset.sum_sub_distrib]
      apply Finset.sum_congr rfl
      intro q _
      by_cases hq : q∈L.val <;> simp only [D,hq,if_true,if_false,zero_sub,zero_mul,sub_zero] <;> ring
    _ = _ := by rw [hext,hline]

theorem protectedLedgerCandidateMean_compensation {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n→ℝ) (B : ℝ)
    (hn : 0<n) (hB : 0<B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hw : e.Valid B)
    (positive : Grid n→Grid n→Bool) (p : Grid n) (hs : e.process.stopped=false)
    (hp : (e.process.accounts p).status=.active) (hpL : p∈L.val) (hsp : specified Γ L) :
    protectedLineContinuousDrift e Γ mask L p+
      lineIntensity e.process mask e.coordinates L*protectedLineCredit L e saved p+
      ((n:ℝ)*B)*(protectedLedgerCandidateMean L e saved Γ mask B positive p-protectedLineCredit L e saved p)=
        protectedLinePositiveDrift e mask L p := by
  rw [protectedLedgerCandidateMean_generator L e saved Γ mask B hn hB hm hw positive p]
  have h := protectedLedger_generator e saved Γ mask positive L p hw.1 hs hp hpL hsp
  linarith

end NoThreeLine

#print axioms NoThreeLine.protectedForbiddenMarkCredit_actual
#print axioms NoThreeLine.protectedLedgerCandidateMean_generator
#print axioms NoThreeLine.protectedLedgerCandidateMean_compensation
