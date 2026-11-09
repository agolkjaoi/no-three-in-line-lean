import NoThreeLine.RectangleCapacityKnots
import NoThreeLine.BenchmarkChartReindex

/-! Executable exact-rational nonaxis capacity checking. Acceptance checks
the actual rectangle chord at every corner breakpoint, and implies the
real integral bound for every real intercept. No saved maximum is trusted. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine

def QRect.qVertex (R : QRect) (k : Fin 4) : ℚ×ℚ :=
  ![(R.x0,R.y0),(R.x1,R.y0),(R.x0,R.y1),(R.x1,R.y1)] k

def QRect.qIntercept (R : QRect) (u : ℚ) (k : Fin 4) : ℚ :=
  (R.qVertex k).2-u*(R.qVertex k).1

def qChordValue {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ) (v u : ℚ) : ℚ :=
  ∑i,w i*max 0 (min (R i).x1 (((R i).y1-v)/u)-max (R i).x0 (((R i).y0-v)/u))

def capacityCornerCheck {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ) (u U : ℚ) : Bool :=
  decide (0<u ∧ 0≤U ∧ ∀i,(R i).x0≤(R i).x1 ∧ (R i).y0≤(R i).y1 ∧
    ∀k:Fin 4,qChordValue R w ((R i).qIntercept u k) u≤U)

theorem QRect.qIntercept_cast (R : QRect) (u : ℚ) (k : Fin 4) :
    (R.qIntercept u k:ℝ)=(R.real.vertex k).2-(u:ℝ)*(R.real.vertex k).1 := by
  fin_cases k <;> simp [qIntercept,qVertex,Rect.vertex,QRect.real]

theorem qChordValue_cast {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ) (v u : ℚ) (hu : 0<u) :
    (qChordValue R w v u:ℝ)=
      ∫t:ℝ,rectangleField Finset.univ (fun i=>(R i).real) (fun i=>(w i:ℝ)) t ((v:ℝ)+(u:ℝ)*t) := by
  rw [rectangleField_chord _ _ _ _ _ (by exact_mod_cast hu)]
  simp [qChordValue,Rect.chordLength,Rect.upper,Rect.lower,QRect.real,Rat.cast_max,Rat.cast_min]

theorem capacityCornerCheck_sound {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ) (u U : ℚ)
    (hcheck : capacityCornerCheck R w u U=true) (v : ℝ) :
    (∫t:ℝ,rectangleField Finset.univ (fun i=>(R i).real) (fun i=>(w i:ℝ)) t (v+(u:ℝ)*t))≤(U:ℝ) := by
  have hc : 0<u ∧ 0≤U ∧ ∀i,(R i).x0≤(R i).x1 ∧ (R i).y0≤(R i).y1 ∧
      ∀k:Fin 4,qChordValue R w ((R i).qIntercept u k) u≤U := by
    simpa only [capacityCornerCheck,decide_eq_true_eq] using hcheck
  apply rectangleField_chord_le_corner_values Finset.univ (fun i=>(R i).real) (fun i=>(w i:ℝ))
    (u:ℝ) (U:ℝ) (fun i _=>⟨by change ((R i).x0:ℝ)≤((R i).x1:ℝ); exact_mod_cast (hc.2.2 i).1,
      by change ((R i).y0:ℝ)≤((R i).y1:ℝ); exact_mod_cast (hc.2.2 i).2.1⟩)
    (by exact_mod_cast hc.1) (by exact_mod_cast hc.2.1)
  intro i _ k
  rw [←QRect.qIntercept_cast,←qChordValue_cast R w _ u hc.1]
  exact_mod_cast (hc.2.2 i).2.2 k

theorem capacityCornerCheck_chart_sound {N : ℕ} (R : Fin N→QRect) (w : Fin N→ℚ)
    (f : Fin 4) (u U : ℚ) (hcheck : capacityCornerCheck (fun i=>(R i).qChart f) w u U=true)
    (x y : ℝ) :
    directionalChord f (rectangleField Finset.univ (fun i=>(R i).real) (fun i=>(w i:ℝ))) x y u≤(U:ℝ) := by
  rw [←rectangleField_chartChord_eq]
  have h := capacityCornerCheck_sound (fun i=>(R i).qChart f) w u U hcheck
    (chartRootY f x y-(u:ℝ)*chartRootX f x y)
  simpa only [QRect.qChart_real,fieldChord] using h

end NoThreeLine
#print axioms NoThreeLine.qChordValue_cast
#print axioms NoThreeLine.capacityCornerCheck_sound
#print axioms NoThreeLine.capacityCornerCheck_chart_sound
