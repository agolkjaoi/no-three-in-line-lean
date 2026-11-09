import NoThreeLine.CalendarTriangleComparison
import NoThreeLine.CalendarRectangleComparison

/-! Measurability, pathwise nonnegative caps and finite-measure
integrability of actual weighted time triangles and rectangles. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.CalendarIntegral

def boundedRunningPrefix {Ω : Type*} (H : ℝ) (r : Ω×ℝ→ℝ) (x : Ω×ℝ) : ℝ :=
  ∫u in (0:ℝ)..min H (max 0 x.2),r (x.1,u)

theorem boundedRunningPrefix_measurable {Ω : Type*} [MeasurableSpace Ω]
    (H : ℝ) (hH : 0≤H) (r : Ω×ℝ→ℝ) (hr : Measurable r) :
    Measurable (boundedRunningPrefix H r) :=
  variable_running_integral_measurable (fun x : Ω×ℝ=>min H (max 0 x.2))
    (measurable_const.min (measurable_const.max measurable_snd))
    (fun _=>le_min hH (le_max_left _ _)) (fun x : (Ω×ℝ)×ℝ=>r (x.1.1,x.2))
    (hr.comp (measurable_fst.fst.prodMk measurable_snd))

theorem boundedRunningPrefix_bounds {Ω : Type*} [MeasurableSpace Ω]
    (H : ℝ) (hH : 0≤H) (r : Ω×ℝ→ℝ) (hr : Measurable r) (R : ℝ)
    (hrb : ∀x,0≤r x ∧ r x≤R) (x : Ω×ℝ) :
    0≤boundedRunningPrefix H r x ∧ boundedRunningPrefix H r x≤H*R :=
  integral_initial_segment_bounds _ H (le_min hH (le_max_left _ _)) (min_le_left _ _)
    _ (hr.comp (measurable_const.prodMk measurable_id)) R ((hrb x).1.trans (hrb x).2)
    (fun u _=>hrb (x.1,u))

theorem boundedRunningPrefix_eq {Ω : Type*} (H : ℝ) (r : Ω×ℝ→ℝ)
    (ω : Ω) (t : ℝ) (ht : t∈Icc 0 H) :
    boundedRunningPrefix H r (ω,t)=(∫u in (0:ℝ)..t,r (ω,u)) := by
  simp only [boundedRunningPrefix,max_eq_right ht.1,min_eq_right ht.2]

def weightedTrianglePath {Ω : Type*} (H : ℝ) (w r : Ω×ℝ→ℝ) (ω : Ω) : ℝ :=
  ∫v in (0:ℝ)..H,w (ω,v)*(∫u in (0:ℝ)..v,r (ω,u))

def weightedRectanglePath {Ω : Type*} (H U : ℝ) (w r : Ω×ℝ→ℝ) (ω : Ω) : ℝ :=
  ∫v in (0:ℝ)..H,w (ω,v)*(∫u in (0:ℝ)..U,r (ω,u))

theorem weightedTrianglePath_eq_bounded {Ω : Type*} (H : ℝ) (hH : 0≤H)
    (w r : Ω×ℝ→ℝ) (ω : Ω) :
    weightedTrianglePath H w r ω=(∫v in (0:ℝ)..H,w (ω,v)*boundedRunningPrefix H r (ω,v)) := by
  apply intervalIntegral.integral_congr_Ioo_of_le hH
  intro v hv
  change w (ω,v)*(∫u in (0:ℝ)..v,r (ω,u))=w (ω,v)*boundedRunningPrefix H r (ω,v)
  rw [boundedRunningPrefix_eq H r ω v ⟨hv.1.le,hv.2.le⟩]

theorem weightedTrianglePath_measurable {Ω : Type*} [MeasurableSpace Ω]
    (H : ℝ) (hH : 0≤H) (w r : Ω×ℝ→ℝ) (hw : Measurable w) (hr : Measurable r) :
    Measurable (weightedTrianglePath H w r) := by
  have hm := variable_running_integral_measurable (fun _ : Ω=>H) measurable_const (fun _=>hH)
    (fun x : Ω×ℝ=>w x*boundedRunningPrefix H r x) (hw.mul (boundedRunningPrefix_measurable H hH r hr))
  have he : weightedTrianglePath H w r=(fun ω=>∫v in (0:ℝ)..H,w (ω,v)*boundedRunningPrefix H r (ω,v)) :=
    funext (weightedTrianglePath_eq_bounded H hH w r)
  rw [he]
  exact hm

theorem weightedTrianglePath_bounds {Ω : Type*} [MeasurableSpace Ω]
    (H : ℝ) (hH : 0≤H) (w r : Ω×ℝ→ℝ) (hw : Measurable w) (hr : Measurable r)
    (A R : ℝ) (hwb : ∀x,0≤w x ∧ w x≤A) (hrb : ∀x,0≤r x ∧ r x≤R) (ω : Ω) :
    0≤weightedTrianglePath H w r ω ∧ weightedTrianglePath H w r ω≤H*A*H*R := by
  have hA : 0≤A := (hwb (ω,0)).1.trans (hwb (ω,0)).2
  have hR : 0≤R := (hrb (ω,0)).1.trans (hrb (ω,0)).2
  rw [weightedTrianglePath_eq_bounded H hH w r ω]
  have hh := integral_initial_segment_bounds H H hH le_rfl
    (fun v=>w (ω,v)*boundedRunningPrefix H r (ω,v))
    ((hw.mul (boundedRunningPrefix_measurable H hH r hr)).comp (measurable_const.prodMk measurable_id))
    (A*(H*R)) (mul_nonneg hA (mul_nonneg hH hR)) (fun v _=>by
      have hb := boundedRunningPrefix_bounds H hH r hr R hrb (ω,v)
      exact ⟨mul_nonneg (hwb (ω,v)).1 hb.1,mul_le_mul (hwb (ω,v)).2 hb.2 hb.1 hA⟩)
  exact ⟨hh.1,hh.2.trans_eq (by ring)⟩

theorem weightedTrianglePath_integrable {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (H : ℝ) (hH : 0≤H)
    (w r : Ω×ℝ→ℝ) (hw : Measurable w) (hr : Measurable r)
    (A R : ℝ) (hwb : ∀x,0≤w x ∧ w x≤A) (hrb : ∀x,0≤r x ∧ r x≤R) :
    Integrable (weightedTrianglePath H w r) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _ (weightedTrianglePath_measurable H hH w r hw hr)
    (H*A*H*R) (weightedTrianglePath_bounds H hH w r hw hr A R hwb hrb)

theorem weightedRectanglePath_measurable {Ω : Type*} [MeasurableSpace Ω]
    (H U : ℝ) (hH : 0≤H) (hU : 0≤U) (w r : Ω×ℝ→ℝ) (hw : Measurable w) (hr : Measurable r) :
    Measurable (weightedRectanglePath H U w r) := by
  have hi : Measurable (fun ω=>∫u in (0:ℝ)..U,r (ω,u)) :=
    variable_running_integral_measurable (fun _ : Ω=>U) measurable_const (fun _=>hU) r hr
  exact variable_running_integral_measurable (fun _ : Ω=>H) measurable_const (fun _=>hH)
    (fun x : Ω×ℝ=>w x*(∫u in (0:ℝ)..U,r (x.1,u))) (hw.mul (hi.comp measurable_fst))

theorem weightedRectanglePath_bounds {Ω : Type*} [MeasurableSpace Ω]
    (H U : ℝ) (hH : 0≤H) (hU : 0≤U) (w r : Ω×ℝ→ℝ) (hw : Measurable w) (hr : Measurable r)
    (A R : ℝ) (hwb : ∀x,0≤w x ∧ w x≤A) (hrb : ∀x,0≤r x ∧ r x≤R) (ω : Ω) :
    0≤weightedRectanglePath H U w r ω ∧ weightedRectanglePath H U w r ω≤H*A*U*R := by
  have hA : 0≤A := (hwb (ω,0)).1.trans (hwb (ω,0)).2
  have hR : 0≤R := (hrb (ω,0)).1.trans (hrb (ω,0)).2
  have hi := integral_initial_segment_bounds U U hU le_rfl (fun u=>r (ω,u))
    (hr.comp (measurable_const.prodMk measurable_id)) R hR (fun u _=>hrb (ω,u))
  have hh := integral_initial_segment_bounds H H hH le_rfl
    (fun v=>w (ω,v)*(∫u in (0:ℝ)..U,r (ω,u)))
    ((hw.comp (measurable_const.prodMk measurable_id)).mul_const _) (A*(U*R))
    (mul_nonneg hA (mul_nonneg hU hR)) (fun v _=>
      ⟨mul_nonneg (hwb (ω,v)).1 hi.1,mul_le_mul (hwb (ω,v)).2 hi.2 hi.1 hA⟩)
  exact ⟨hh.1,hh.2.trans_eq (by ring)⟩

theorem weightedRectanglePath_integrable {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (H U : ℝ) (hH : 0≤H) (hU : 0≤U)
    (w r : Ω×ℝ→ℝ) (hw : Measurable w) (hr : Measurable r)
    (A R : ℝ) (hwb : ∀x,0≤w x ∧ w x≤A) (hrb : ∀x,0≤r x ∧ r x≤R) :
    Integrable (weightedRectanglePath H U w r) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _ (weightedRectanglePath_measurable H U hH hU w r hw hr)
    (H*A*U*R) (weightedRectanglePath_bounds H U hH hU w r hw hr A R hwb hrb)

end NoThreeLine.CalendarIntegral
#print axioms NoThreeLine.CalendarIntegral.weightedTrianglePath_measurable
#print axioms NoThreeLine.CalendarIntegral.weightedTrianglePath_bounds
#print axioms NoThreeLine.CalendarIntegral.weightedTrianglePath_integrable
#print axioms NoThreeLine.CalendarIntegral.weightedRectanglePath_measurable
#print axioms NoThreeLine.CalendarIntegral.weightedRectanglePath_bounds
#print axioms NoThreeLine.CalendarIntegral.weightedRectanglePath_integrable
