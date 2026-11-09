import NoThreeLine.ActualOutsideRisk
import NoThreeLine.LongLineRetention
import NoThreeLine.LongLineExcessBudget

/-! Long non-specified root lines count every eligible witness exactly
once. This is the real finite board-line partition, not a multiplicity
bound or an arbitrary list of selected witnesses. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines GridLines FiniteDirections

theorem longRootBoardLine_witness_eligible {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (L : RootBoardLineIndex p) (hL : L∈longRootBoardLines Γ p H)
    (z : Grid n) (hz : z∈L.val.val.erase p) : longWitnessEligible Γ p H z := by
  have hzp := (Finset.mem_erase.mp hz).1
  have he := rootBoardLine_unique p z hzp.symm L (Finset.mem_of_mem_erase hz)
  have hlong := (mem_longRootBoardLines Γ p H L).mp hL
  rw [he] at hlong
  exact ⟨hzp,fun h=>hlong.1 ((pairRootBoardLine_specified Γ p z hzp.symm).mpr h),hlong.2⟩

theorem pairRootBoardLine_long_mem {n : ℕ} (Γ : Finset ZPoint) (p z : Grid n)
    (H : ℝ) (hz : longWitnessEligible Γ p H z) :
    pairRootBoardLine p z hz.1.symm∈longRootBoardLines Γ p H :=
  (mem_longRootBoardLines Γ p H _).mpr
    ⟨fun h=>hz.2.1 ((pairRootBoardLine_specified Γ p z hz.1.symm).mp h),hz.2.2⟩

theorem longRootBoardLine_witness_sum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (f : Grid n→ℝ) :
    (∑L∈longRootBoardLines Γ p H,∑z∈L.val.val.erase p,f z)=
      ∑z : Grid n,if longWitnessEligible Γ p H z then f z else 0 := by
  classical
  have he (L : RootBoardLineIndex p) : (∑z∈L.val.val.erase p,f z)=
      ∑z : Grid n,if z∈L.val.val.erase p then f z else 0 := by
    rw [←Finset.sum_filter]
    congr 1
    ext z
    simp only [Finset.mem_filter,Finset.mem_univ,true_and]
  simp_rw [he]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro z _
  by_cases hz : longWitnessEligible Γ p H z
  · let L := pairRootBoardLine p z hz.1.symm
    have hL : L∈longRootBoardLines Γ p H := pairRootBoardLine_long_mem Γ p z H hz
    rw [if_pos hz,Finset.sum_eq_single L]
    · have hzin : z∈L.val.val.erase p := Finset.mem_erase.mpr ⟨hz.1,right_mem_lineThrough p z⟩
      exact if_pos hzin
    · intro K _ hKL
      apply if_neg
      intro hzin
      exact hKL (rootBoardLine_unique p z hz.1.symm K (Finset.mem_of_mem_erase hzin))
    · exact fun hn=>False.elim (hn hL)
  · rw [if_neg hz]
    apply Finset.sum_eq_zero
    intro L hL
    exact if_neg (fun hzin=>hz (longRootBoardLine_witness_eligible Γ p H L hL z hzin))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.longRootBoardLine_witness_sum
