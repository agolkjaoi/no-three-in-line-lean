import NoThreeLine.FrozenCapacityData
import NoThreeLine.CoarseReferenceGrid
import NoThreeLine.AngularChartsBV

/-! Geometry of the actual 16-grid literal capacity rectangles. -/
set_option autoImplicit false
namespace NoThreeLine.FrozenCapacity

def cellBox (p : Fin 256) : GridBox :=
  ⟨p.val/16,p.val/16+1,p.val%16,p.val%16+1⟩

theorem cellRect_eq (p : Fin 256) : cellRect p = (cellBox p).qrect 16 := rfl

theorem cellBox_valid (p : Fin 256) : (cellBox p).Valid 16 := by
  have := p.isLt
  dsimp [cellBox,GridBox.Valid]
  omega

theorem cellBox_separated (p q : Fin 256) (hpq : p≠q) :
    (cellBox p).Separated (cellBox q) := by
  have hn : p.val≠q.val := fun h=>hpq (Fin.ext h)
  dsimp [cellBox,GridBox.Separated]
  omega

theorem cellRect_separated :
    RectanglesSeparated Finset.univ (fun p=>(cellRect p).real) := by
  intro p _ q _ hpq
  dsimp only
  rw [cellRect_eq,cellRect_eq]
  exact ((cellBox p).qrect 16).qSeparated_real _
    ((cellBox p).separated_qrect 16 (by decide) _ (cellBox_separated p q hpq))

theorem cellRect_inUnit (p : Fin 256) : (cellRect p).real.InUnitSquare := by
  rw [cellRect_eq]
  exact ((cellBox p).qrect 16).qUnit_real
    ((cellBox p).valid_qrect 16 (by decide) (cellBox_valid p))

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.cellRect_separated
#print axioms NoThreeLine.FrozenCapacity.cellRect_inUnit
