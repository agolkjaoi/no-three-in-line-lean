import NoThreeLine.ProtectedEntropyModulus

/-! Entropy and cost of one actual external birth in the saved ledger. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def protectedLineEntropy {n : ℕ} (L : LineIndex n) (e : ExtendedState n)
    (saved : Grid n→ℝ) (B : ℝ) (p : Grid n) : ℝ :=
  protectedEntropy B (protectedLineCredit L e saved p)

def protectedEntropyDeletion {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B : ℝ) : ℝ :=
  ∑p∈E.filter (fun p=>(e.process.accounts p).status=.active),
    (protectedEntropy B (specifiedLineWeight e L p)-
      protectedEntropy B (birthMultiplier Γ e.process.selected p q*specifiedLineWeight e L p))

def protectedEventCost {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) : ℝ :=
  ∑p∈E.filter (fun p=>(e.process.accounts p).status=.active),
    specifiedLineWeight e L p*protectedEntropyCost (birthMultiplier Γ e.process.selected p q)

def protectedEntropyLinearLoss {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B : ℝ) : ℝ :=
  ∑p∈E.filter (fun p=>(e.process.accounts p).status=.active),
    protectedEntropySlope B (specifiedLineWeight e L p)*specifiedLineWeight e L p*
      (1-birthMultiplier Γ e.process.selected p q)

theorem protectedLineEntropy_measurable {n : ℕ} (L : LineIndex n) (B : ℝ) (p : Grid n) :
    Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>protectedLineEntropy L x.1 x.2 B p) :=
  (protectedEntropy_measurable B).comp (protectedLineCredit_measurable L p)

theorem protectedLedger_external_entropy_loss {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (q : Grid n) (B : ℝ)
    (positive : Grid n→Bool) (he : e.process.Valid) (hs : e.process.stopped=false)
    (hq : q∈e.process.activeEvents) (hqL : q∉L.val) :
    (∑p∈E,protectedLineEntropy L e saved B p)-
      (∑p∈E,protectedLineEntropy L (e.birth Γ q positive)
        (protectedLineSave L e (e.birth Γ q positive) saved) B p)=protectedEntropyDeletion e Γ L E q B := by
  classical
  rw [←Finset.sum_sub_distrib,protectedEntropyDeletion,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro p _
  unfold protectedLineEntropy
  by_cases hp : (e.process.accounts p).status=.active
  · rw [if_pos hp,protectedLineCredit_external_birth L e saved Γ q p positive he hs hq
      ((e.process.mem_activeEvents p).mpr hp) hqL,protectedLineCredit_active L e saved p hp]
  · rw [if_neg hp,protectedLineCredit_birth_inactive L e saved Γ q p positive hp,sub_self]

theorem protectedEntropy_event_identity {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B : ℝ) (hB : 0<B) :
    protectedEntropyLinearLoss e Γ L E q B-protectedEntropyDeletion e Γ L E q B=
      -protectedEventCost e Γ L E q := by
  unfold protectedEntropyLinearLoss protectedEntropyDeletion protectedEventCost
  rw [←Finset.sum_sub_distrib,←Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro p _
  have h := protectedEntropy_birth_identity B (specifiedLineWeight e L p)
    (birthMultiplier Γ e.process.selected p q) hB
  linarith

theorem protectedEventCost_compare {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K : ℝ) (he : e.Valid B)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2) :
    (1-Real.log 2)*protectedExternalDeletion e Γ L E q≤protectedEventCost e Γ L E q ∧
      protectedEventCost e Γ L E q≤protectedExternalDeletion e Γ L E q := by
  unfold protectedExternalDeletion protectedEventCost
  rw [Finset.mul_sum]
  constructor
  · apply Finset.sum_le_sum
    intro p _
    have h := mul_le_mul_of_nonneg_left
      (protectedEntropyCost_actual_bounds _ (birthMultiplier_trichotomy Γ e.process.selected p q)).1
      (specifiedLineWeight_bounds e L p B K he hN hclock hK).1
    convert h using 1 <;> ring
  · apply Finset.sum_le_sum
    intro p _
    have h := mul_le_mul_of_nonneg_left
      (protectedEntropyCost_actual_bounds _ (birthMultiplier_trichotomy Γ e.process.selected p q)).2
      (specifiedLineWeight_bounds e L p B K he hN hclock hK).1
    convert h using 1 <;> ring

theorem protectedEntropyDeletion_bounds {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B K : ℝ) (he : e.Valid B) (hB : 0<B)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2) :
    0≤protectedEntropyDeletion e Γ L E q B ∧
    protectedEntropyDeletion e Γ L E q B≤
      ∑p∈E.filter (fun p=>(e.process.accounts p).status=.active),
        protectedEntropy B ((1-birthMultiplier Γ e.process.selected p q)*specifiedLineWeight e L p) := by
  have hp (p) := protectedEntropy_loss_bounds B (specifiedLineWeight e L p)
    (birthMultiplier Γ e.process.selected p q) hB
    (specifiedLineWeight_bounds e L p B K he hN hclock hK).1
    (specifiedLineWeight_bounds e L p B K he hN hclock hK).2
    (birthMultiplier_trichotomy Γ e.process.selected p q)
  exact ⟨Finset.sum_nonneg (fun p _=>(hp p).1),Finset.sum_le_sum (fun p _=>(hp p).2)⟩

end NoThreeLine
#print axioms NoThreeLine.protectedLedger_external_entropy_loss
#print axioms NoThreeLine.protectedEntropy_event_identity
#print axioms NoThreeLine.protectedEventCost_compare
