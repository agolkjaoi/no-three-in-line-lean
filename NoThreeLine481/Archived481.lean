import NoThreeLine481.FineRankOutput
import NoThreeLine481.RankTable

/-! The archived instance reduces to the same continuum inequalities
that the external checker evaluates for each positive typed cell. -/
set_option autoImplicit false
set_option maxRecDepth 2000
set_option maxHeartbeats 1800000
noncomputable section
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine PrimitiveLines GridChord FiniteDirections FrozenCapacity GridArea

def fineCellAngularRisk {J : ℕ} (rank : Fin 4 → Grid 256 → Fin J)
    (t : GridType) (i : Grid 256) (x y : ℝ) : ℝ :=
  let z := gridTypeZ t
  let w := finePrefixWeights rank (rank (typeCode t) i)
  ((76/125:ℝ)/24)*∑ j : Fin 4 × Fin 3, ∫ u in (0:ℝ)..1,
    pairAngularSquare fineCells fineRect (w z) (w (parity (z + nonzeroParity j.2))) j.1
      (commonGridLines 256) (commonGridLines 256) x y u

def FineCellAngularCertificate {J : ℕ} (rank : Fin 4 → Grid 256 → Fin J) : Prop :=
  ∀ (t : GridType) (i : Grid 256) (x y : ℝ), (fineRect i).contains x y →
    0 < fineWeight (gridTypeZ t) i → fineCellAngularRisk rank t i x y ≤ (9999/10000:ℝ)

private theorem parity_add_left (z a : ZPoint) : parity (parity z + a) = parity (z+a) := by
  apply Prod.ext <;> simp only [parity, Prod.fst_add, Prod.snd_add] <;> omega

theorem fineAngularCertificate_of_cell_certificate {J : ℕ}
    (rank : Fin 4 → Grid 256 → Fin J) (h : FineCellAngularCertificate rank) :
    FineAngularCertificate rank := by
  intro n p hp
  have hn : ¬ onFineGrid p := fun he => (ne_of_gt hp) (fineGridTerminal_zero_of_onFineGrid p he)
  have hcell := fineCell_contains p hn
  have ht := gridTypeZ_pointType p
  have hw : 0 < fineWeight (gridTypeZ (pointType p)) (fineCell p) := by
    rw [ht, ← fineGridTerminal_eq_fineWeight p hn]
    exact hp
  have hbound := h (pointType p) (fineCell p) _ _ hcell hw
  have hidx : rank (typeCode (pointType p)) (fineCell p) = boardRank rank p := by
    rw [boardRank, codeZ_grid_parity]
  unfold fineCellAngularRisk at hbound
  dsimp only at hbound
  rw [ht, hidx] at hbound
  unfold typedAngularIntegralSum typedPartners
  simpa only [parity_add_left] using hbound

theorem target_of_archived481_cell_certificate
    (h : FineCellAngularCertificate archivedRanks481) : NoThreeLine.Target :=
  target_of_fine_angular_certificate (by decide) archivedRanks481
    (fineAngularCertificate_of_cell_certificate archivedRanks481 h)

#print axioms fineAngularCertificate_of_cell_certificate
#print axioms target_of_archived481_cell_certificate

end NoThreeLine481
