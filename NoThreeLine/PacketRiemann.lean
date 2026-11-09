import NoThreeLine.AcceptedPhasePacket
import NoThreeLine.ScheduleTypeCode
import NoThreeLine.MaskedAreaRiemann

/-! Actual accepted-union input on the board, compared with its own plane
area.  The normalized output of the union checker has weight one; the coarse
reference field is not substituted for the actual mass. -/
set_option autoImplicit false
open MeasureTheory
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FinitePhase
open PrimitiveLines GridArea

def PhasePacket.boardInput {n : ℕ} (p : PhasePacket) (q : Grid n) : ℝ :=
  p.typedField (typeCode (pointType q)) ((q.1.val : ℝ)/n) ((q.2.val : ℝ)/n)

theorem typeCode_point_iff {n : ℕ} (q : Grid n) (r : Fin 4) :
    typeCode (pointType q) = r ↔ parity (gridEmbed q) = gridTypeZ (codeType r) := by
  rw [← gridTypeZ_pointType]
  constructor
  · intro h
    have he : pointType q = codeType r := by
      rw [← codeType_typeCode (pointType q), h]
    rw [he]
  · intro h
    rw [gridTypeZ_injective h, typeCode_codeType]

theorem PhasePacket.sum_boardInput {n : ℕ} (p : PhasePacket) :
    (∑ q : Grid n, p.boardInput q) =
      ∑ q ∈ typePoints n (gridTypeZ (codeType p.rootType)),
        p.field (((q.1.val : ℝ)/n), ((q.2.val : ℝ)/n)) := by
  classical
  unfold typePoints
  rw [Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro q _
  unfold PhasePacket.boardInput PhasePacket.typedField
  simp only [typeCode_point_iff]

theorem gridPhasePacket_field_eq {rawN m : ℕ} (G : ℕ) (hG : 0 < G)
    (R : Fin rawN → GridBox) (A : Fin m → GridBox)
    (cover : Fin rawN → Fin m) (source : Fin m → Fin rawN)
    (hc : gridUnionCheck G R A cover source = true)
    (units scale : ℕ) (hu : 0 < units) (hs : 0 < scale) (r : Fin 4) :
    (gridPhasePacket G hG R A cover source hc units scale hu hs r).field =
      (fun z => eraseGrid (commonGridLines G) (commonGridLines G)
        (rectangleField Finset.univ (fun i => ((A i).qrect G).real) (fun _ => 1)) z.1 z.2) := by
  have he := qUnionNormalizationCheck_mask (fun i => (R i).qrect G)
    (fun i => (A i).qrect G) cover source (gridUnionCheck_sound G hG R A cover source hc)
    (commonGridLines G) (commonGridLines G)
    (fun j => (A j).endpoints_commonGrid G (gridUnionCheck_valid G R A cover source hc j))
  funext z
  exact congrFun (congrFun he z.1) z.2

theorem gridPhasePacket_board_area_error {rawN m : ℕ} (G : ℕ) (hG : 0 < G)
    (R : Fin rawN → GridBox) (A : Fin m → GridBox)
    (cover : Fin rawN → Fin m) (source : Fin m → Fin rawN)
    (hc : gridUnionCheck G R A cover source = true)
    (units scale : ℕ) (hu : 0 < units) (hs : 0 < scale) (r : Fin 4)
    (n : ℕ) (hn : 0 < n) :
    |(∑ q : Grid n, (gridPhasePacket G hG R A cover source hc units scale hu hs r).boardInput q)/
        (n : ℝ)^2 - (1/4 : ℝ)*
        (∫ z : ℝ × ℝ, (gridPhasePacket G hG R A cover source hc units scale hu hs r).field z)| ≤
      (3*(m : ℝ)+(commonGridLines G).card+(commonGridLines G).card)/(n : ℝ) := by
  have hnorm := qUnionNormalizationCheck_sound (fun i => (R i).qrect G)
    (fun i => (A i).qrect G) cover source (gridUnionCheck_sound G hG R A cover source hc)
  have he := masked_type_normalized_area_error n (gridTypeZ (codeType r)) Finset.univ
    (fun i => ((A i).qrect G).real) (fun _ => 1)
    (commonGridLines G) (commonGridLines G) 1 hn zero_le_one
    (gridTypeZ_legal (codeType r)) hnorm.2.1 (fun i _ => hnorm.2.2 i)
    (fun _ _ => ⟨zero_le_one,le_rfl⟩)
  rw [PhasePacket.sum_boardInput, gridPhasePacket_field_eq]
  simpa only [gridPhasePacket, maskedTypeFieldSum, Finset.card_univ,
    Fintype.card_fin, one_mul] using he

theorem PhasePacket.mass_eq_plane (p : PhasePacket) :
    p.mass = p.duration/4*(∫ z : ℝ × ℝ, p.field z) :=
  singlePhaseMass_eq p.duration p.positive.le p.rootType p.field

end NoThreeLine.FinitePhase
namespace NoThreeLine
open FinitePhase

theorem CheckedAcceptedPhase.board_mass_error {G L : ℕ}
    (a : CheckedAcceptedPhase G L) (hG : 0 < G) (n : ℕ) (hn : 0 < n) :
    |(a.toPacket hG).duration*((∑ q : Grid n, (a.toPacket hG).boardInput q)/(n : ℝ)^2) -
        (a.toPacket hG).mass| ≤
      (a.toPacket hG).duration*
        ((3*(a.outCount : ℝ)+(commonGridLines G).card+(commonGridLines G).card)/(n : ℝ)) := by
  have he := gridPhasePacket_board_area_error G hG
    (phaseImageBoxes G L a.phase.sx a.phase.sy a.phase.leaves)
    a.output a.cover a.source a.checked a.units a.scale a.units_pos a.scale_pos a.phase.rootType n hn
  change |(∑ q : Grid n, (a.toPacket hG).boardInput q)/(n : ℝ)^2 - (1/4 : ℝ)*
      (∫ z : ℝ × ℝ, (a.toPacket hG).field z)| ≤ _ at he
  rw [PhasePacket.mass_eq_plane]
  have hid : (a.toPacket hG).duration*((∑ q : Grid n, (a.toPacket hG).boardInput q)/(n : ℝ)^2) -
      (a.toPacket hG).duration/4*(∫ z : ℝ × ℝ, (a.toPacket hG).field z) =
      (a.toPacket hG).duration*((∑ q : Grid n, (a.toPacket hG).boardInput q)/(n : ℝ)^2 -
        (1/4 : ℝ)*(∫ z : ℝ × ℝ, (a.toPacket hG).field z)) := by ring
  rw [hid, abs_mul, abs_of_pos (a.toPacket hG).positive]
  exact mul_le_mul_of_nonneg_left he (a.toPacket hG).positive.le

end NoThreeLine

#print axioms NoThreeLine.FinitePhase.gridPhasePacket_board_area_error
#print axioms NoThreeLine.CheckedAcceptedPhase.board_mass_error
