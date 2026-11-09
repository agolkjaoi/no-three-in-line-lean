import NoThreeLine.SectionMaskRate
import NoThreeLine.ProtectedCrossingObserver
import NoThreeLine.ProtectedLedgerGlobalBounds

/-! The specified-clock derivative is the moving protected mass weighted
by the actual phase mask. The saved ledger bounds that mass cell by cell. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines BirthWitness LineDrift

def protectedMovingCellMass {n : ℕ} (e : ExtendedState n) (L : LineIndex n)
    (E : Finset (Grid n)) : ℝ :=
  ∑p∈L.val∩E,if (e.process.accounts p).status=.active then specifiedLineWeight e L p else 0

theorem clockRHS_eq_protected_cell_mass {n : ℕ} {ι : Type*} [Fintype ι]
    (e : ExtendedState n) (Γ : Finset ZPoint) (L : LineIndex n) (cells : ι→Finset (Grid n))
    (c : ι→ℝ) (z : Coordinates n) (hs : e.process.stopped=false) (hL : specified Γ L)
    (ho : occupancy e.process L≤1) :
    clockRHS e.process Γ (sectionCellMask cells c) z L =
      (∑i,c i*protectedMovingCellMass (e.withCoordinates z) L (cells i))/n := by
  classical
  let w := fun p=>if (e.process.accounts p).status=.active
    then specifiedLineWeight (e.withCoordinates z) L p else 0
  calc
    _ = (∑p∈L.val,sectionCellMask cells c p*w p)/n := by
      simp only [clockRHS,hs,hL,ho,and_self,if_true,lineIntensity]
      rw [Finset.sum_mul,Finset.sum_div,Finset.sum_div]
      apply Finset.sum_congr rfl
      intro p _
      by_cases hp : (e.process.accounts p).status=.active
      · simp only [w,hp,if_true,phaseRate,hs,and_self,specifiedLineWeight_withCoordinates]
        ring
      · simp only [w,hp,if_false,phaseRate,hs,and_false,mul_zero,zero_mul,zero_div]
    _ = _ := by
      congr 1
      unfold sectionCellMask protectedMovingCellMass
      simp_rw [Finset.sum_mul]
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro i _
      rw [Finset.mul_sum]
      have hfilter : L.val.filter (fun p=>p∈cells i)=L.val∩cells i := by
        ext p
        simp
      rw [←hfilter,Finset.sum_filter]
      apply Finset.sum_congr rfl
      intro p _
      by_cases hp : p∈cells i <;> simp [hp,w,ExtendedState.withCoordinates,ProcessState.withWeights]

theorem protectedMovingCellMass_le_saved {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (hL : specified Γ L) (E : Finset (Grid n)) (saved : Grid n→ℝ)
    (B : ℝ) (he : e.Valid B) (hs : ∀p∈L.val,0≤saved p ∧ saved p≤2*B) :
    protectedMovingCellMass e L E≤protectedScalarTotal L (L.val∩E) id e saved := by
  classical
  unfold protectedMovingCellMass protectedScalarTotal
  apply Finset.sum_le_sum
  intro p hp
  by_cases ha : (e.process.accounts p).status=.active
  · rw [if_pos ha]
    exact le_of_eq (protectedLineCredit_active L e saved p ha).symm
  · rw [if_neg ha]
    have hpL : p∈L.val := (Finset.mem_inter.mp hp).1
    exact (protectedLineCredit_bounds_all L e saved Γ hL p hpL B he (hs p hpL)).1

theorem clockRHS_le_protected_cell_budget {n : ℕ} {ι : Type*} [Fintype ι]
    (e : ExtendedState n) (Γ : Finset ZPoint) (L : LineIndex n) (hL : specified Γ L)
    (cells : ι→Finset (Grid n)) (c cap : ι→ℝ) (hc : ∀i,0≤c i) (hcap : ∀i,0≤cap i)
    (z : Coordinates n) (saved : Grid n→ℝ) (B : ℝ) (he : (e.withCoordinates z).Valid B)
    (hs : ∀p∈L.val,0≤saved p ∧ saved p≤2*B)
    (hbound : occupancy e.process L≤1 →
      ∀i,protectedScalarTotal L (L.val∩cells i) id (e.withCoordinates z) saved≤cap i) :
    clockRHS e.process Γ (sectionCellMask cells c) z L ≤ (∑i,c i*cap i)/n := by
  by_cases h : e.process.stopped=false ∧ occupancy e.process L≤1
  · rw [clockRHS_eq_protected_cell_mass e Γ L cells c z h.1 hL h.2]
    apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
    exact Finset.sum_le_sum (fun i _=>mul_le_mul_of_nonneg_left
      ((protectedMovingCellMass_le_saved (e.withCoordinates z) Γ L hL (cells i) saved B he hs).trans
        (hbound h.2 i)) (hc i))
  · have hz : ¬(e.process.stopped=false ∧ specified Γ L ∧ occupancy e.process L≤1) :=
      fun hp=>h ⟨hp.1,hp.2.2⟩
    rw [clockRHS,if_neg hz]
    exact div_nonneg (Finset.sum_nonneg (fun i _=>mul_nonneg (hc i) (hcap i))) (Nat.cast_nonneg n)

end NoThreeLine

#print axioms NoThreeLine.clockRHS_eq_protected_cell_mass
#print axioms NoThreeLine.clockRHS_le_protected_cell_budget

