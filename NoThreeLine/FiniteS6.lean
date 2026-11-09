import NoThreeLine.FamilyParitySieve

/-! S6 for the actual masked finite board: G14 and the literal parity
reindexing feed the already verified twelve-family finite sieve estimate. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FiniteDirections
open PrimitiveLines GridChord

def typedAngularIntegralSum {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n) : ℝ :=
  ∑ z : Fin 4 × Fin 3, ∫ u in (0 : ℝ)..1,
    pairAngularSquare S R (w (parity (gridEmbed p))) (typedPartners w p z.2) z.1 V H
      (normX n (gridEmbed p)) (normY n (gridEmbed p)) u

theorem concreteSieve_Q_pos : 0 < ConcreteSieve.Q :=
  Finset.prod_pos (fun p hp => (Nat.zero_lt_one.trans (ConcreteSieve.P_gt_one p hp)))

/-- All geometric and finite-direction hypotheses are discharged internally.
The remaining hypotheses concern only the actual input cells and weights. -/
theorem masked_board_sieve_upper {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι → Rect) (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n)
    (M : ℝ) (hM : 0 ≤ M) (hsep : RectanglesSeparated S R)
    (hw : ∀ r i, i ∈ S → 0 ≤ w r i ∧ w r i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) (hN : ConcreteSieve.Q ≤ n) :
    normalizedPairSum p (maskedTypedBoardWeight S R w V H) ≤
      ((76/125 : ℝ)/24) * typedAngularIntegralSum S R w V H p * Real.log n +
        ((4*S.card+1)*M)^2 + 5*M*((4*S.card+1)*M) + 10*M^2 +
          6*25586*(4*(S.card : ℝ)+3)*M^2 := by
  have hn : 0 < n := concreteSieve_Q_pos.trans_le hN
  have hb := masked_four_family_pair_bound_safe S R w V H p M hn hM hsep hw hR
  rw [four_family_main_eq_primitiveParityK] at hb
  have hs := twelve_pair_angular_sieve_upper S R (w (parity (gridEmbed p)))
    (typedPartners w p) V H M (normX n (gridEmbed p)) (normY n (gridEmbed p)) n
    (fun z => familyEpsilon z.1 z.2) (fun z => familyEta z.1 z.2) hM hsep (hw _)
    (fun j => hw (parity (gridEmbed p+nonzeroParity j))) hR hN
    (fun z => familyEpsilon_le z.1 z.2) (fun z => familyEta_le z.1 z.2)
  change _ ≤ ((76/125 : ℝ)/24)*typedAngularIntegralSum S R w V H p*Real.log n +
    6*25586*(4*(S.card : ℝ)+3)*M^2 at hs
  linarith

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.four_family_main_eq_primitiveParityK
#print axioms NoThreeLine.FiniteDirections.masked_board_sieve_upper
