import NoThreeLine.ScheduledTerminalRootMoment
import NoThreeLine.ActiveLineGuardBounds
import NoThreeLine.LineMassSelfRate
import NoThreeLine.ActiveRootLineMass

/-! Actual non-specified, activated-line hazard and its r-weighted proxy.
The root-active and occupancy-one gates are retained. The line sum is
identified with the existing S1 outsideHazard, without counting witnesses
with multiplicity. Its credit-removal error retains the factor 1/rho. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines GridLines LineDrift MixedConnection FiniteDirections

def pairRootBoardLine {n : ℕ} (p q : Grid n) (hpq : p ≠ q) : RootBoardLineIndex p :=
  ⟨⟨lineThrough p q, Finset.mem_biUnion.mpr
    ⟨p,Finset.mem_univ p,lineThrough_mem_linesThrough p q hpq⟩⟩,left_mem_lineThrough p q⟩

theorem rootBoardLine_unique {n : ℕ} (p q : Grid n) (hpq : p ≠ q)
    (L : RootBoardLineIndex p) (hq : q ∈ L.val.val) : L = pairRootBoardLine p q hpq := by
  apply Subtype.ext
  apply Subtype.ext
  exact boardLine_eq L.val p q L.property hq hpq

theorem pairRootBoardLine_specified {n : ℕ} (Γ : Finset ZPoint)
    (p q : Grid n) (hpq : p ≠ q) :
    specified Γ (pairRootBoardLine p q hpq).val ↔ specifiedPair Γ p q :=
  (specified_iff_designated Γ p _ (left_mem_lineThrough p q)).trans (designated_iff Γ p q hpq)

theorem pairRootBoardLine_activated {n : ℕ} (s : ProcessState n) (hs : s.Valid)
    (p q : Grid n) (hp : p ∈ s.activeEvents) (hpq : p ≠ q) :
    occupancy s (pairRootBoardLine p q hpq).val = 1 ↔ selectedWitness s.selected p q := by
  have hc := active_line_occupancy_le_one s p hs hp (pairRootBoardLine p q hpq).val
    (left_mem_lineThrough p q)
  change (s.selected ∩ lineThrough p q).card = 1 ↔ _
  change (s.selected ∩ lineThrough p q).card ≤ 1 at hc
  rw [witness_iff_count_pos]
  omega

def physicalOutsideLineRisk {n : ℕ} (mask : Grid n → ℝ) (p : Grid n)
    (L : LineIndex n) (e : ExtendedState n) : ℝ :=
  if p ∈ e.process.activeEvents ∧ occupancy e.process L = 1 then
    ∑ q ∈ L.val.erase p, e.process.birthRate mask q else 0

def physicalOutsideLineProxy {n : ℕ} (mask : Grid n → ℝ) (p : Grid n)
    (L : LineIndex n) (e : ExtendedState n) : ℝ :=
  e.lineCredits L * physicalOutsideLineRisk mask p L e

def physicalOutsideRisk {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (p : Grid n) (e : ExtendedState n) : ℝ :=
  ∑ L ∈ nonSpecifiedRootBoardLines Γ p, physicalOutsideLineRisk mask p L.val e

def physicalOutsideProxy {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (p : Grid n) (e : ExtendedState n) : ℝ :=
  ∑ L ∈ nonSpecifiedRootBoardLines Γ p, physicalOutsideLineProxy mask p L.val e

private theorem erase_line_sum {n : ℕ} (p : Grid n) (L : Finset (Grid n)) (f : Grid n → ℝ) :
    (∑ q ∈ L.erase p, f q) = ∑ q ∈ Finset.univ.erase p, if q ∈ L then f q else 0 := by
  classical
  calc
    _ = ∑ q ∈ L.erase p, if q ∈ L then f q else 0 := by
      apply Finset.sum_congr rfl
      intro q hq
      rw [if_pos (Finset.mem_of_mem_erase hq)]
    _ = _ := Finset.sum_subset (Finset.erase_subset_erase p (Finset.subset_univ L)) (by
      intro q hq hnot
      have hn : q ∉ L := fun h => hnot (Finset.mem_erase.mpr ⟨(Finset.mem_erase.mp hq).1,h⟩)
      simp only [if_neg hn])

theorem physicalOutsideRisk_eq_S1 {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (p : Grid n) (e : ExtendedState n) (he : e.process.Valid) :
    physicalOutsideRisk Γ mask p e =
      if p ∈ e.process.activeEvents then outsideHazard Γ e.process.selected p
        e.process.activeEvents (e.process.birthRate mask) else 0 := by
  classical
  by_cases hp : p ∈ e.process.activeEvents
  · rw [if_pos hp]
    have hline (L : RootBoardLineIndex p) : physicalOutsideLineRisk mask p L.val e =
        ∑ q ∈ Finset.univ.erase p, if q ∈ L.val.val ∧ occupancy e.process L.val = 1 then
          e.process.birthRate mask q else 0 := by
      unfold physicalOutsideLineRisk
      by_cases hN : occupancy e.process L.val = 1
      · simp only [hp,hN,and_self,if_true,and_true]
        exact erase_line_sum p L.val.val _
      · simp [hN]
    have hinner (q : Grid n) (hq : q ∈ Finset.univ.erase p) :
        (∑ L ∈ nonSpecifiedRootBoardLines Γ p,
          if q ∈ L.val.val ∧ occupancy e.process L.val = 1 then e.process.birthRate mask q else 0) =
        if ¬specifiedPair Γ p q ∧ selectedWitness e.process.selected p q then
          e.process.birthRate mask q else 0 := by
      have hpq : p ≠ q := (Finset.ne_of_mem_erase hq).symm
      let L := pairRootBoardLine p q hpq
      have hspec : specified Γ L.val ↔ specifiedPair Γ p q := pairRootBoardLine_specified Γ p q hpq
      have hact : occupancy e.process L.val = 1 ↔ selectedWitness e.process.selected p q :=
        pairRootBoardLine_activated e.process he p q hp hpq
      by_cases hsp : specifiedPair Γ p q
      · rw [if_neg (by simp [hsp])]
        apply Finset.sum_eq_zero
        intro K hK
        have hn : q ∉ K.val.val := by
          intro hqK
          have hKL : K = L := rootBoardLine_unique p q hpq K hqK
          exact (Finset.mem_filter.mp hK).2 (hKL ▸ hspec.mpr hsp)
        simp [hn]
      · have hL : L ∈ nonSpecifiedRootBoardLines Γ p := by
          exact Finset.mem_filter.mpr ⟨Finset.mem_univ _,fun hs => hsp (hspec.mp hs)⟩
        rw [Finset.sum_eq_single L]
        · have hqL : q ∈ L.val.val := right_mem_lineThrough p q
          simp only [hqL,true_and,hact,hsp,not_false_eq_true,true_and]
        · intro K _ hKL
          have hn : q ∉ K.val.val := fun hqK => hKL (rootBoardLine_unique p q hpq K hqK)
          simp [hn]
        · exact fun hn => False.elim (hn hL)
    calc
      _ = ∑ q ∈ Finset.univ.erase p, if ¬specifiedPair Γ p q ∧ selectedWitness e.process.selected p q then
          e.process.birthRate mask q else 0 := by
        simp only [physicalOutsideRisk,hline]
        rw [Finset.sum_comm]
        exact Finset.sum_congr rfl hinner
      _ = ∑ q ∈ e.process.activeEvents.erase p, if ¬specifiedPair Γ p q ∧ selectedWitness e.process.selected p q then
          e.process.birthRate mask q else 0 := by
        symm
        apply Finset.sum_subset (Finset.erase_subset_erase p (Finset.subset_univ _))
        intro q hq hnot
        have hqa : q ∉ e.process.activeEvents := fun h => hnot (Finset.mem_erase.mpr ⟨(Finset.mem_erase.mp hq).1,h⟩)
        have hstatus := (e.process.mem_activeEvents q).not.mp hqa
        simp [ProcessState.birthRate,hstatus]
      _ = _ := by
        unfold outsideHazard
        apply Finset.sum_congr rfl
        intro q _
        split_ifs <;> simp
  · simp [physicalOutsideRisk,physicalOutsideLineRisk,hp]

theorem physicalOutsideLineRisk_nonneg {n : ℕ} (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q)
    (p : Grid n) (L : LineIndex n) (e : ExtendedState n) (he : e.process.Valid) :
    0 ≤ physicalOutsideLineRisk mask p L e := by
  unfold physicalOutsideLineRisk
  split_ifs
  · exact Finset.sum_nonneg (fun q _ => e.process.birthRate_nonneg mask hm he q)
  · exact le_rfl

theorem physicalOutsideLineRisk_proxy_error {n : ℕ} (mask : Grid n → ℝ)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (p : Grid n) (L : LineIndex n)
    (a : WitnessState n) (B ρ : ℝ) (hB : 0 ≤ B) (hρ : 0 < ρ) (ha : a.Valid B)
    (hfloor : p ∈ a.augmented.physical.process.activeEvents → occupancy a.augmented.physical.process L = 1 →
      ρ ≤ a.augmented.physical.lineCredits L) :
    0 ≤ physicalOutsideLineRisk mask p L a.augmented.physical - physicalOutsideLineProxy mask p L a.augmented.physical ∧
    physicalOutsideLineRisk mask p L a.augmented.physical - physicalOutsideLineProxy mask p L a.augmented.physical ≤
      (1-a.augmented.physical.lineCredits L)*activeRootLineMass L p a/(ρ*n) := by
  have hr : 0 ≤ a.augmented.physical.lineCredits L ∧ a.augmented.physical.lineCredits L ≤ 1 := ha.1.1.2.1.2.2 L
  have hw (q : Grid n) := activeLeafWeight_bounds q a B hB ha
  have hx : 0 ≤ physicalOutsideLineRisk mask p L a.augmented.physical :=
    physicalOutsideLineRisk_nonneg mask (fun q => (hm q).1) p L _ ha.1.1.1
  have he : physicalOutsideLineRisk mask p L a.augmented.physical - physicalOutsideLineProxy mask p L a.augmented.physical =
      (1-a.augmented.physical.lineCredits L)*physicalOutsideLineRisk mask p L a.augmented.physical := by
    unfold physicalOutsideLineProxy
    ring
  rw [he]
  refine ⟨mul_nonneg (sub_nonneg.mpr hr.2) hx,?_⟩
  by_cases hp : p ∈ a.augmented.physical.process.activeEvents
  · by_cases hN : occupancy a.augmented.physical.process L = 1
    · have hn : 0 < (n : ℝ) := by exact_mod_cast ((Nat.zero_le p.1.val).trans_lt p.1.isLt)
      have hsum0 : 0 ≤ ∑ q ∈ L.val.erase p, activeLeafWeight q a :=
        Finset.sum_nonneg (fun q _ => (hw q).1)
      have hrate : physicalOutsideLineRisk mask p L a.augmented.physical ≤
          (∑ q ∈ L.val.erase p, activeLeafWeight q a)/n := by
        rw [physicalOutsideLineRisk,if_pos ⟨hp,hN⟩,Finset.sum_div]
        apply Finset.sum_le_sum
        intro q _
        exact (physical_phaseRate_le_activeLeaf mask hm a B hB ha q).trans
          (div_le_div_of_nonneg_right (mul_le_of_le_one_left (hw q).1 (hm q).2) hn.le)
      have hfactor : physicalOutsideLineRisk mask p L a.augmented.physical ≤ activeRootLineMass L p a/(ρ*n) := by
        rw [activeRootLineMass,if_pos hp,boardLineMass]
        simp only [one_mul]
        apply hrate.trans
        apply (div_le_div_iff₀ hn (mul_pos hρ hn)).mpr
        nlinarith [mul_nonneg (sub_nonneg.mpr (hfloor hp hN)) hsum0]
      simpa only [mul_div_assoc] using mul_le_mul_of_nonneg_left hfactor (sub_nonneg.mpr hr.2)
    · rw [physicalOutsideLineRisk,if_neg (by simp [hN]),mul_zero]
      exact div_nonneg (mul_nonneg (sub_nonneg.mpr hr.2) (by
        rw [activeRootLineMass,if_pos hp,boardLineMass]
        exact mul_nonneg hr.1 (Finset.sum_nonneg (fun q _ => mul_nonneg (by norm_num) (hw q).1)))) (by positivity)
  · simp [physicalOutsideLineRisk,activeRootLineMass,hp]

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.physicalOutsideRisk_eq_S1
#print axioms NoThreeLine.BirthWitness.physicalOutsideLineRisk_proxy_error
