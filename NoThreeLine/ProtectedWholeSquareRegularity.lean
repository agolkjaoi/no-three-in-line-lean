import NoThreeLine.ProtectedWholeSquareCandidate

/-! Continuous square sources and exact external-rate shapes for the
whole ledger, without regularity assumptions on retirement flags. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem specifiedLineWeight_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (L : LineIndex n) (p : Grid n) :
    Continuous (fun z : Coordinates n=>specifiedLineWeight (e.withCoordinates z) L p) := by
  simp only [specifiedLineWeight_withCoordinates]
  fun_prop

theorem protectedCreditTotal_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) :
    Continuous (fun z : Coordinates n=>protectedCreditTotal L E (e.withCoordinates z) saved) :=
  continuous_finsetSum _ (fun p _=>protectedLineCredit_withCoordinates_continuous e L saved p)

theorem protectedEntropyTotal_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (B : ℝ) :
    Continuous (fun z : Coordinates n=>protectedEntropyTotal L E B (e.withCoordinates z) saved) :=
  continuous_finsetSum _ (fun p _=>(protectedEntropy_continuous B).comp
    (protectedLineCredit_withCoordinates_continuous e L saved p))

theorem protectedExternalDeletion_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) :
    Continuous (fun z : Coordinates n=>protectedExternalDeletion (e.withCoordinates z) Γ L E q) := by
  change Continuous (fun z : Coordinates n=>∑p∈E.filter (fun p=>(e.process.accounts p).status=.active),
    (1-birthMultiplier Γ e.process.selected p q)*specifiedLineWeight (e.withCoordinates z) L p)
  exact continuous_finsetSum _ (fun p _=>(specifiedLineWeight_withCoordinates_continuous e L p).const_mul _)

theorem protectedEntropyDeletion_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B : ℝ) :
    Continuous (fun z : Coordinates n=>protectedEntropyDeletion (e.withCoordinates z) Γ L E q B) := by
  change Continuous (fun z : Coordinates n=>∑p∈E.filter (fun p=>(e.process.accounts p).status=.active),
    (protectedEntropy B (specifiedLineWeight (e.withCoordinates z) L p)-
      protectedEntropy B (birthMultiplier Γ e.process.selected p q*specifiedLineWeight (e.withCoordinates z) L p)))
  apply continuous_finsetSum
  intro p _
  exact ((protectedEntropy_continuous B).comp (specifiedLineWeight_withCoordinates_continuous e L p)).sub
    ((protectedEntropy_continuous B).comp ((specifiedLineWeight_withCoordinates_continuous e L p).const_mul _))

theorem protectedEventRate_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (mask : Grid n→ℝ) (L : LineIndex n) (G : ExtendedState n→Grid n→ℝ)
    (hG : ∀q,Continuous (fun z : Coordinates n=>G (e.withCoordinates z) q)) :
    Continuous (fun z : Coordinates n=>protectedExternalEventRate (e.withCoordinates z) mask L (G (e.withCoordinates z))) := by
  change Continuous (fun z : Coordinates n=>∑q∈e.process.activeEvents,
    if q∈L.val then 0 else phaseRate e.process mask z.1 q*G (e.withCoordinates z) q)
  apply continuous_finsetSum
  intro q _
  split_ifs
  · exact continuous_const
  · exact (phaseRate_contDiff e.process mask q).continuous.mul (hG q)

theorem protectedCreditSquareSource_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) :
    Continuous (fun z : Coordinates n=>protectedCreditSquareSource (e.withCoordinates z) saved Γ mask L E) := by
  have hc := protectedCreditTotal_withCoordinates_continuous e L E saved
  have hg : Continuous (fun z : Coordinates n=>protectedCreditTotalSource (e.withCoordinates z) mask L E) :=
    continuous_finsetSum _ (fun p _=>protectedLinePositiveDrift_withCoordinates_continuous e mask L p)
  have hq := protectedEventRate_withCoordinates_continuous e mask L
    (fun v q=>(protectedExternalDeletion v Γ L E q)^2)
    (fun q=>(protectedExternalDeletion_withCoordinates_continuous e Γ L E q).pow 2)
  exact ((hc.const_mul 2).mul hg).add hq

theorem protectedEntropySquareSource_withCoordinates_continuous {n : ℕ} (e : ExtendedState n)
    (saved : Grid n→ℝ) (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n))
    (B : ℝ) (hB : 0<B) :
    Continuous (fun z : Coordinates n=>protectedEntropySquareSource (e.withCoordinates z) saved Γ mask L E B) := by
  have hc := protectedEntropyTotal_withCoordinates_continuous e L E saved B
  have hg : Continuous (fun z : Coordinates n=>protectedEntropyTotalSource (e.withCoordinates z) saved Γ mask L E B) :=
    continuous_finsetSum _ (fun p _=>protectedEntropySource_withCoordinates_continuous e saved Γ mask L p B hB)
  have hq := protectedEventRate_withCoordinates_continuous e mask L
    (fun v q=>(protectedEntropyDeletion v Γ L E q B)^2)
    (fun q=>(protectedEntropyDeletion_withCoordinates_continuous e Γ L E q B).pow 2)
  exact ((hc.const_mul 2).mul hg).add hq

theorem protectedObservableSquareExternal_shape {n : ℕ} (e : ExtendedState n) (saved : Grid n→ℝ)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (positive : Grid n→Grid n→Bool) (L : LineIndex n)
    (F : ExtendedState n→(Grid n→ℝ)→ℝ) (loss : Grid n→ℝ)
    (hloss : ∀q∈e.process.activeEvents,q∉L.val→F e saved-
      F (e.birth Γ q (positive q)) (protectedLineSave L e (e.birth Γ q (positive q)) saved)=loss q) :
    protectedObservableExternalRate e saved Γ mask positive L (fun v a=>(F v a)^2)=
      protectedExternalEventRate e mask L (fun q=>(F e saved-loss q)^2-(F e saved)^2) := by
  unfold protectedObservableExternalRate protectedExternalEventRate
  apply Finset.sum_congr rfl
  intro q hq
  by_cases hqL : q∈L.val
  · simp only [if_pos hqL]
  · simp only [if_neg hqL]
    rw [show F (e.birth Γ q (positive q)) (protectedLineSave L e (e.birth Γ q (positive q)) saved)=
      F e saved-loss q from by linarith only [hloss q hq hqL]]

end NoThreeLine
#print axioms NoThreeLine.protectedCreditSquareSource_withCoordinates_continuous
#print axioms NoThreeLine.protectedEntropySquareSource_withCoordinates_continuous
#print axioms NoThreeLine.protectedObservableSquareExternal_shape
