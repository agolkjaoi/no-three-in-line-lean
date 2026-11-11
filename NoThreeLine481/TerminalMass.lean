import NoThreeLine.FrozenCapacityClockInput
import NoThreeLine.MaskedAreaRiemann
import NoThreeLine.ScaledPacketRiemann
import NoThreeLine481.NumericalMargin

/-! Mass of the checked coarse table and a lower bound on the finite board
that tolerates erasing the fine-grid boundary points. -/
set_option autoImplicit false
set_option maxRecDepth 30000
set_option maxHeartbeats 2000000
noncomputable section
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine PrimitiveLines FiniteDirections FrozenCapacity GridArea GridChord

private theorem coarseCell_area (i : Fin 256) : (cellRect i).real.area = (1/256:ℝ) := by
  have hR := cellRect_inUnit i
  rw [Rect.area_of_ordered _ hR.2.1 hR.2.2.2.2.1]
  simp only [cellRect, QRect.real, Rat.cast_div, Rat.cast_natCast, Nat.cast_add, Nat.cast_one]
  push_cast
  ring

theorem coarseCellUnits_sum : (∑ r : Fin 4, ∑ i : Fin 256, cellUnits r i) = 154331451230 := by
  simp only [← Fin.sum_ofFn]
  decide +kernel

theorem coarseField_mass :
    (249/250:ℝ)/4 *
      typedAreaIntegralSum Finset.univ (fun i => (cellRect i).real) capacityTypedWeight =
    (inputMass:ℝ) := by
  unfold typedAreaIntegralSum
  simp_rw [rectangleField_plane_integral, coarseCell_area, capacityTypedWeight, codeZ_gridTypeZ]
  rw [sum_typeCode (fun r => ∑ i : Fin 256, (cellUnits r i:ℝ) / 100000000 * (1/256))]
  simp_rw [div_eq_mul_inv, mul_assoc, ← Finset.sum_mul]
  have hu : (∑ r : Fin 4, ∑ i : Fin 256, (cellUnits r i:ℝ)) = (154331451230:ℝ) := by
    exact_mod_cast coarseCellUnits_sum
  rw [hu]
  norm_num [inputMass]



/-- The terminal field uses coarse weights and erases every fine-grid line. -/
def fineGridTerminal {n : ℕ} (q : Grid n) : ℝ :=
  (249/250:ℝ) * maskedTypedBoardWeight Finset.univ (fun i => (cellRect i).real)
    capacityTypedWeight (commonGridLines 256) (commonGridLines 256) q

private theorem capacityTypedWeight_bounds (z : ZPoint) (i : Fin 256) :
    0 ≤ capacityTypedWeight z i ∧ capacityTypedWeight z i ≤ 12 := by
  refine ⟨?_, (abs_le.mp (capacityTypedWeight_abs_le z i)).2⟩
  unfold capacityTypedWeight
  exact div_nonneg (by exact_mod_cast cellUnits_nonneg (codeZ z) i) (by norm_num)

theorem fineGridTerminal_bounds {n : ℕ} (q : Grid n) :
    0 ≤ fineGridTerminal q ∧ fineGridTerminal q ≤ (249/250:ℝ) *
      typedBoardWeight Finset.univ (fun i => (cellRect i).real) capacityTypedWeight q := by
  have hfield := rectangleField_point_bounds Finset.univ (fun i => (cellRect i).real)
    (capacityTypedWeight (parity (gridEmbed q))) 12 (normX n (gridEmbed q))
    (normY n (gridEmbed q)) (by norm_num) cellRect_separated
    (fun i _ => capacityTypedWeight_bounds _ i)
  have hm := maskedTypedBoardWeight_bounds Finset.univ (fun i => (cellRect i).real)
    capacityTypedWeight (commonGridLines 256) (commonGridLines 256) q hfield.1
  exact ⟨mul_nonneg (by norm_num) hm.1, mul_le_mul_of_nonneg_left hm.2 (by norm_num)⟩

/-- The board threshold pays for the rectangle counting error and the omitted
fine-grid boundary points. -/
theorem boardMassFloor_le_fineGridTerminal {n : ℕ} (hn : 2^30 ≤ n) :
    (boardMassFloor:ℝ) ≤ (∑ q : Grid n, fineGridTerminal q)/(n:ℝ)^2 := by
  let S : Finset (Fin 256) := Finset.univ
  let R := fun i => (cellRect i).real
  let V := commonGridLines 256
  have hn' : (1073741824:ℝ) ≤ n := by exact_mod_cast hn
  have hnR : (0:ℝ) < n := by linarith
  have hV : V.card = 257 := commonGridLines_card 256 (by decide)
  have h := masked_board_normalized_area_error n S R capacityTypedWeight V V 12
    (by omega) (by norm_num) cellRect_separated (fun i _ => cellRect_inUnit i)
    (fun z i _ => capacityTypedWeight_bounds z i)
  rw [maskedTypedAreaIntegralSum_eq, hV] at h
  have hS : S.card = 256 := by simp [S]
  rw [hS] at h
  have herr := mul_le_mul_of_nonneg_left (abs_le.mp h).1 (by norm_num : (0:ℝ) ≤ 249/250)
  have hid : (249/250:ℝ)*((1/4:ℝ)*typedAreaIntegralSum S R capacityTypedWeight) =
      (inputMass:ℝ) := by
    simpa only [← mul_assoc, div_eq_mul_inv, one_mul] using coarseField_mass
  rw [mul_sub, hid] at herr
  change (boardMassFloor:ℝ) ≤
    (∑ q : Grid n, (249/250:ℝ)*maskedTypedBoardWeight S R capacityTypedWeight V V q)/(n:ℝ)^2
  rw [← Finset.mul_sum, mul_div_assoc]
  have hslack : (43032:ℝ)/(n:ℝ) ≤ (inputMass:ℝ)-(boardMassFloor:ℝ) := by
    apply (div_le_iff₀ hnR).mpr
    norm_num [inputMass, boardMassFloor]
    linarith only [hn']
  norm_num at herr
  have hterm : -((43032:ℝ)/(n:ℝ)) ≤ -(249/250*(43032/(n:ℝ))) := by
    have h := div_nonneg (by norm_num : (0:ℝ) ≤ 43032) hnR.le
    linarith only [h]
  linarith only [herr, hterm, hslack]

#print axioms coarseCellUnits_sum
#print axioms coarseField_mass
#print axioms fineGridTerminal_bounds
#print axioms boardMassFloor_le_fineGridTerminal

end NoThreeLine481
