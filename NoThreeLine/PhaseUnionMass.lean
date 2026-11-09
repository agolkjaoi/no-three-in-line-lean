import NoThreeLine.GridUnionCertificate
import NoThreeLine.FinitePhaseIntegrals

/-! A single phase's actual typed space-time mass is its duration times the
true normalized union area, divided by four. Kernel area checks can be batched
without treating their numerical sum as a premise about actual Lebesgue area. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.FinitePhase

theorem pulse_spatial_integral (a b t : ℝ) (F : ℝ × ℝ → ℝ) :
    (∫ z : ℝ × ℝ, pulse a b (F z) t) = pulse a b (∫ z : ℝ × ℝ, F z) t := by
  classical
  by_cases ht : t ∈ Ico a b <;> simp [pulse,ht]

def singlePhaseMass (duration : ℝ) (rootType : Fin 4) (F : ℝ × ℝ → ℝ) : ℝ :=
  (1/4 : ℝ)*∑ r : Fin 4, ∫ t in (0 : ℝ)..duration,
    ∫ z : ℝ × ℝ, pulse 0 duration (if r=rootType then F z else 0) t

theorem singlePhaseMass_eq (duration : ℝ) (hd : 0 ≤ duration) (rootType : Fin 4)
    (F : ℝ × ℝ → ℝ) :
    singlePhaseMass duration rootType F = duration/4*(∫ z : ℝ × ℝ, F z) := by
  have hp (a : ℝ) : (∫ t in (0 : ℝ)..duration, pulse 0 duration a t) = duration*a := by
    rw [pulse_integral 0 duration a duration hd]
    simp [elapsed,hd]
  have htype (r : Fin 4) : (∫ z : ℝ × ℝ, if r=rootType then F z else 0) =
      if r=rootType then ∫ z : ℝ × ℝ, F z else 0 := by
    by_cases hr : r=rootType <;> simp [hr]
  unfold singlePhaseMass
  simp_rw [pulse_spatial_integral,hp,htype,mul_ite,mul_zero]
  simp
  ring

theorem gridUnionCheck_phaseMass {n m : ℕ} (G : ℕ) (hG : 0 < G)
    (R : Fin n → GridBox) (A : Fin m → GridBox)
    (cover : Fin n → Fin m) (source : Fin m → Fin n)
    (hc : gridUnionCheck G R A cover source = true)
    (duration : ℝ) (hd : 0 ≤ duration) (rootType : Fin 4) :
    singlePhaseMass duration rootType (fun z => rectangleUnionMask Finset.univ
      (fun i => ((R i).qrect G).real) (commonGridLines G) (commonGridLines G) z.1 z.2) =
      duration*(gridUnionAreaUnits A : ℝ)/(4*(G : ℝ)^2) := by
  rw [singlePhaseMass_eq duration hd,gridUnionCheck_area G hG R A cover source hc]
  ring

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.gridUnionCheck_phaseMass
