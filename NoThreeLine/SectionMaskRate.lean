import NoThreeLine.LineSectionJump
import NoThreeLine.LineCreditWitnessCover

/-! Finite deterministic mask decomposition at the actual physical state.
The self rate B/n and all physical line-credit gates are retained. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def sectionCellMask {n : ℕ} {ι : Type*} [Fintype ι]
    (cells : ι → Finset (Grid n)) (c : ι → ℝ) (q : Grid n) : ℝ :=
  ∑i, c i * (if q∈cells i then 1 else 0)

theorem boardLineMass_indicator {n : ℕ} (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (a : WitnessState n) :
    boardLineMass (fun q => if q∈E then 1 else 0) L p a =
      actualLineSectionMass L p E a.augmented := by
  classical
  have hs : (L.val.erase p).filter (fun q => q∈E)=(L.val∩E).erase p := by
    ext q
    simp only [Finset.mem_filter,Finset.mem_erase,Finset.mem_inter]
    tauto
  unfold boardLineMass
  simp_rw [ite_mul,one_mul,zero_mul]
  rw [←Finset.sum_filter,hs]
  simp only [actualLineSectionMass,lineSectionMass,activeLeafWeight,ProcessState.mem_activeEvents]
  rfl

theorem boardLineMass_cell_decomposition {n : ℕ} {ι : Type*} [Fintype ι]
    (cells : ι → Finset (Grid n)) (c : ι → ℝ) (L : LineIndex n) (p : Grid n)
    (a : WitnessState n) :
    boardLineMass (sectionCellMask cells c) L p a =
      ∑i, c i*actualLineSectionMass L p (cells i) a.augmented := by
  classical
  simp_rw [←boardLineMass_indicator L p _ a]
  unfold boardLineMass sectionCellMask
  simp_rw [Finset.sum_mul]
  rw [Finset.sum_comm,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  simp_rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q _
  ring

theorem physicalLineCreditRate_le_cell_sections {n : ℕ} {ι : Type*} [Fintype ι]
    (Γ : Finset ZPoint) (cells : ι → Finset (Grid n)) (c : ι → ℝ)
    (hm : ∀q,0≤sectionCellMask cells c q ∧ sectionCellMask cells c q≤1)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val)
    (a : AugmentedState n) (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    physicalLineCreditRate Γ (sectionCellMask cells c) L a.physical ≤
      (∑i,c i*actualLineSectionMass L p (cells i) a)/n+B/n := by
  let b : WitnessState n := ⟨a,fun _=>0⟩
  have hb : b.Valid B := ⟨ha,fun _=>⟨le_rfl,zero_le_one⟩,fun _ _=>rfl⟩
  have hr0 : 0≤a.physical.lineCredits L := (ha.1.2.1.2.2 L).1
  have hsum0 : 0≤lineIntensity a.physical.process (sectionCellMask cells c) a.physical.coordinates L := by
    apply Finset.sum_nonneg
    intro q _
    exact a.physical.process.birthRate_nonneg _ (fun q=>(hm q).1) ha.1.1 q
  have hh : physicalLineCreditRate Γ (sectionCellMask cells c) L a.physical ≤
      a.physical.lineCredits L*lineIntensity a.physical.process (sectionCellMask cells c) a.physical.coordinates L := by
    unfold physicalLineCreditRate creditDamping
    split_ifs
    · exact le_rfl
    · simpa only [mul_zero] using mul_nonneg hr0 hsum0
  have hx := lineIntensity_root_self_bound (sectionCellMask cells c) hm L p hpL b B hB hb
  rw [boardLineMass_cell_decomposition] at hx
  exact hh.trans hx

theorem physicalLineCreditRate_cell_card_bound {n : ℕ} {ι : Type*} [Fintype ι]
    (Γ : Finset ZPoint) (cells : ι → Finset (Grid n)) (c : ι → ℝ) (hc : ∀i,0≤c i)
    (hm : ∀q,0≤sectionCellMask cells c q ∧ sectionCellMask cells c q≤1)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val)
    (a : AugmentedState n) (B δ : ℝ) (hB : 0≤B) (ha : a.Valid B)
    (hsec : ∀i,actualLineSectionMass L p (cells i) a≤(((L.val∩cells i).erase p).card:ℝ)+δ*(n:ℝ)) :
    physicalLineCreditRate Γ (sectionCellMask cells c) L a.physical ≤
      (∑i,c i*((((L.val∩cells i).erase p).card:ℝ)+δ*(n:ℝ)))/n+B/n := by
  apply (physicalLineCreditRate_le_cell_sections Γ cells c hm L p hpL a B hB ha).trans
  exact add_le_add (div_le_div_of_nonneg_right
    (Finset.sum_le_sum (fun i _=>mul_le_mul_of_nonneg_left (hsec i) (hc i))) (Nat.cast_nonneg n)) le_rfl

theorem physicalLineCreditRate_cell_budget {n : ℕ} {ι : Type*} [Fintype ι]
    (hn : 0<n) (Γ : Finset ZPoint) (cells : ι → Finset (Grid n)) (c : ι → ℝ) (hc : ∀i,0≤c i)
    (hm : ∀q,0≤sectionCellMask cells c q ∧ sectionCellMask cells c q≤1)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val)
    (a : AugmentedState n) (B δ : ℝ) (hB : 0≤B) (ha : a.Valid B)
    (hsec : ∀i,actualLineSectionMass L p (cells i) a≤(((L.val∩cells i).erase p).card:ℝ)+δ*(n:ℝ)) :
    physicalLineCreditRate Γ (sectionCellMask cells c) L a.physical ≤
      (∑i,c i*(((L.val∩cells i).erase p).card:ℝ))/n+δ*(∑i,c i)+B/n := by
  apply (physicalLineCreditRate_cell_card_bound Γ cells c hc hm L p hpL a B δ hB ha hsec).trans_eq
  have hn0 : (n:ℝ)≠0 := ne_of_gt (by exact_mod_cast hn)
  simp_rw [mul_add,Finset.sum_add_distrib,add_div]
  rw [←Finset.sum_mul]
  field_simp

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.boardLineMass_cell_decomposition
#print axioms NoThreeLine.BirthWitness.physicalLineCreditRate_cell_budget
