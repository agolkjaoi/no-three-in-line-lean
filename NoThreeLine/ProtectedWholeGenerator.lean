import NoThreeLine.ProtectedWholeFlow
import NoThreeLine.ProtectedObservableMarkMean
import NoThreeLine.ProtectedEntropySquareRate

/-! Actual whole-ledger square generators. The square increment is the
square of the simultaneous event's total change, not a sum of point squares. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def protectedObservableJumpSquareRate {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (F : ExtendedState n→(Grid n→ℝ)→ℝ) : ℝ :=
  protectedExternalEventRate e mask L (fun q=>
    (F (e.birth Γ q (positive q)) (protectedLineSave L e (e.birth Γ q (positive q)) saved)-F e saved)^2)

theorem protectedObservableExternalRate_sum {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (E : Finset (Grid n)) (F : Grid n→ExtendedState n→(Grid n→ℝ)→ℝ) :
    protectedObservableExternalRate e saved Γ mask positive L (fun v a=>∑p∈E,F p v a)=
      ∑p∈E,protectedObservableExternalRate e saved Γ mask positive L (F p) := by
  unfold protectedObservableExternalRate
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro q _
  by_cases hq : q∈L.val
  · simp only [if_pos hq,Finset.sum_const_zero]
  · simp only [if_neg hq]
    rw [←Finset.sum_sub_distrib,Finset.mul_sum]

theorem protectedObservableExternalRate_square {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (F : ExtendedState n→(Grid n→ℝ)→ℝ) :
    protectedObservableExternalRate e saved Γ mask positive L (fun v a=>(F v a)^2)=
      2*F e saved*protectedObservableExternalRate e saved Γ mask positive L F+
        protectedObservableJumpSquareRate e saved Γ mask positive L F := by
  unfold protectedObservableExternalRate protectedObservableJumpSquareRate protectedExternalEventRate
  rw [Finset.mul_sum,←Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro q _
  split_ifs <;> ring

theorem protectedCreditTotal_generator {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (E : Finset (Grid n)) (he : e.process.Valid) (hs : e.process.stopped=false)
    (hE : E⊆L.val) (hsp : specified Γ L) :
    protectedCreditTotalDrift e Γ mask L E+
      protectedObservableExternalRate e saved Γ mask positive L (protectedCreditTotal L E)=
        protectedCreditTotalSource e mask L E := by
  unfold protectedCreditTotal
  rw [protectedObservableExternalRate_sum]
  unfold protectedCreditTotalDrift protectedCreditTotalSource
  rw [←Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro p hp
  exact protectedLedger_generator_all e saved Γ mask positive L p he hs (hE hp) hsp

theorem protectedEntropyTotal_generator {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) (hB : 0<B)
    (he : e.process.Valid) (hs : e.process.stopped=false) (hE : E⊆L.val) (hsp : specified Γ L) :
    protectedEntropyTotalDrift e saved Γ mask L E B+
      protectedObservableExternalRate e saved Γ mask positive L (protectedEntropyTotal L E B)=
        protectedEntropyTotalSource e saved Γ mask L E B := by
  unfold protectedEntropyTotal
  rw [protectedObservableExternalRate_sum]
  unfold protectedEntropyTotalDrift protectedEntropyTotalSource
  rw [←Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro p hp
  exact protectedEntropy_generator_all e saved Γ mask positive L p B hB he hs (hE hp) hsp

theorem protectedCreditTotal_square_generator {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (E : Finset (Grid n)) (he : e.process.Valid) (hs : e.process.stopped=false)
    (hE : E⊆L.val) (hsp : specified Γ L) :
    2*protectedCreditTotal L E e saved*protectedCreditTotalDrift e Γ mask L E+
      protectedObservableExternalRate e saved Γ mask positive L (fun v a=>(protectedCreditTotal L E v a)^2)=
        2*protectedCreditTotal L E e saved*protectedCreditTotalSource e mask L E+
          protectedObservableJumpSquareRate e saved Γ mask positive L (protectedCreditTotal L E) := by
  rw [protectedObservableExternalRate_square]
  calc
    _ = 2*protectedCreditTotal L E e saved*(protectedCreditTotalDrift e Γ mask L E+
        protectedObservableExternalRate e saved Γ mask positive L (protectedCreditTotal L E))+
          protectedObservableJumpSquareRate e saved Γ mask positive L (protectedCreditTotal L E) := by ring
    _ = _ := by rw [protectedCreditTotal_generator e saved Γ mask positive L E he hs hE hsp]

theorem protectedEntropyTotal_square_generator {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) (hB : 0<B)
    (he : e.process.Valid) (hs : e.process.stopped=false) (hE : E⊆L.val) (hsp : specified Γ L) :
    2*protectedEntropyTotal L E B e saved*protectedEntropyTotalDrift e saved Γ mask L E B+
      protectedObservableExternalRate e saved Γ mask positive L (fun v a=>(protectedEntropyTotal L E B v a)^2)=
        2*protectedEntropyTotal L E B e saved*protectedEntropyTotalSource e saved Γ mask L E B+
          protectedObservableJumpSquareRate e saved Γ mask positive L (protectedEntropyTotal L E B) := by
  rw [protectedObservableExternalRate_square]
  calc
    _ = 2*protectedEntropyTotal L E B e saved*(protectedEntropyTotalDrift e saved Γ mask L E B+
        protectedObservableExternalRate e saved Γ mask positive L (protectedEntropyTotal L E B))+
          protectedObservableJumpSquareRate e saved Γ mask positive L (protectedEntropyTotal L E B) := by ring
    _ = _ := by rw [protectedEntropyTotal_generator e saved Γ mask positive L E B hB he hs hE hsp]

theorem protectedCreditTotal_jumpSquare_eq_deletion {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (E : Finset (Grid n)) (he : e.process.Valid) (hs : e.process.stopped=false) :
    protectedObservableJumpSquareRate e saved Γ mask positive L (protectedCreditTotal L E)=
      protectedExternalEventRate e mask L (fun q=>(protectedExternalDeletion e Γ L E q)^2) := by
  unfold protectedObservableJumpSquareRate protectedExternalEventRate
  apply Finset.sum_congr rfl
  intro q hq
  by_cases hqL : q∈L.val
  · simp only [if_pos hqL]
  · simp only [if_neg hqL]
    have h := protectedLedger_external_total_loss e Γ L E saved q (positive q) he hs hq hqL
    change protectedCreditTotal L E e saved-protectedCreditTotal L E (e.birth Γ q (positive q))
      (protectedLineSave L e (e.birth Γ q (positive q)) saved)=_ at h
    have hh : protectedCreditTotal L E (e.birth Γ q (positive q))
        (protectedLineSave L e (e.birth Γ q (positive q)) saved)-protectedCreditTotal L E e saved=
          -protectedExternalDeletion e Γ L E q := by linarith only [h]
    rw [hh,neg_sq]

theorem protectedEntropyTotal_jumpSquare_eq_deletion {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) (he : e.process.Valid) (hs : e.process.stopped=false) :
    protectedObservableJumpSquareRate e saved Γ mask positive L (protectedEntropyTotal L E B)=
      protectedExternalEventRate e mask L (fun q=>(protectedEntropyDeletion e Γ L E q B)^2) := by
  unfold protectedObservableJumpSquareRate protectedExternalEventRate
  apply Finset.sum_congr rfl
  intro q hq
  by_cases hqL : q∈L.val
  · simp only [if_pos hqL]
  · simp only [if_neg hqL]
    have h := protectedLedger_external_entropy_loss e Γ L E saved q B (positive q) he hs hq hqL
    change protectedEntropyTotal L E B e saved-protectedEntropyTotal L E B (e.birth Γ q (positive q))
      (protectedLineSave L e (e.birth Γ q (positive q)) saved)=_ at h
    have hh : protectedEntropyTotal L E B (e.birth Γ q (positive q))
        (protectedLineSave L e (e.birth Γ q (positive q)) saved)-protectedEntropyTotal L E B e saved=
          -protectedEntropyDeletion e Γ L E q B := by linarith only [h]
    rw [hh,neg_sq]

end NoThreeLine
#print axioms NoThreeLine.protectedCreditTotal_square_generator
#print axioms NoThreeLine.protectedEntropyTotal_square_generator
#print axioms NoThreeLine.protectedCreditTotal_jumpSquare_eq_deletion
#print axioms NoThreeLine.protectedEntropyTotal_jumpSquare_eq_deletion
