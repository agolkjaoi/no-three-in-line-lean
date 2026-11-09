import NoThreeLine.Rectangle

/-! Horizontal jumps as actual step fields. The band estimate is derived
pointwise and integrated; it is not an assumed chord bound. -/
set_option autoImplicit false
open Set MeasureTheory
noncomputable section

namespace NoThreeLine

structure HEdge where
  left : ℝ
  right : ℝ
  height : ℝ
  jump : ℝ

namespace HEdge

def field (e : HEdge) (x y : ℝ) : ℝ := by
  classical
  exact if e.left < x ∧ x < e.right ∧ e.height < y then e.jump else 0

def chord (e : HEdge) (v u : ℝ) : ℝ := ∫ t : ℝ, e.field t (v+u*t)

def bandLeft (e : HEdge) (h u : ℝ) : ℝ := max e.left ((e.height-h)/u)
def bandRight (e : HEdge) (l u : ℝ) : ℝ := min e.right ((e.height-l)/u)
def bandLength (e : HEdge) (l h u : ℝ) : ℝ :=
  max 0 (e.bandRight l u - e.bandLeft h u)

theorem on_line (e : HEdge) (v u : ℝ) (hu : 0 < u) :
    (fun t => e.field t (v+u*t)) =
      (Ioo (max e.left ((e.height-v)/u)) e.right).indicator (fun _ => e.jump) := by
  classical
  funext t
  have hm : (e.left < t ∧ t < e.right ∧ e.height < v+u*t) ↔
      t ∈ Ioo (max e.left ((e.height-v)/u)) e.right := by
    simp only [mem_Ioo, max_lt_iff, div_lt_iff₀ hu]
    constructor
    · rintro ⟨hl,hr,hh⟩
      exact ⟨⟨hl,by nlinarith⟩,hr⟩
    · rintro ⟨⟨hl,hh⟩,hr⟩
      exact ⟨hl,hr,by nlinarith⟩
  simp only [field, Set.indicator_apply, hm]

theorem line_integrable (e : HEdge) (v u : ℝ) (hu : 0 < u) :
    Integrable (fun t => e.field t (v+u*t)) := by
  rw [e.on_line v u hu, integrable_indicator_iff measurableSet_Ioo]
  exact integrableOn_const (by simp [Real.volume_Ioo])

theorem pointwise_band (e : HEdge) (l h v u t : ℝ) (hu : 0 < u)
    (hlv : l ≤ v) (hvh : v ≤ h) :
    e.field t (v+u*t) - e.field t (l+u*t) ≤
      (Icc (e.bandLeft h u) (e.bandRight l u)).indicator
        (fun _ => max 0 e.jump) t := by
  classical
  have hn : 0 ≤ (Icc (e.bandLeft h u) (e.bandRight l u)).indicator
      (fun _ => max 0 e.jump) t := by
    by_cases ht : t ∈ Icc (e.bandLeft h u) (e.bandRight l u)
    · simp [ht]
    · simp [ht]
  by_cases hx : e.left < t ∧ t < e.right
  · by_cases hv : e.height < v+u*t
    · by_cases hl : e.height < l+u*t
      · simpa [field, hx.1, hx.2, hv, hl] using hn
      · have hband : t ∈ Icc (e.bandLeft h u) (e.bandRight l u) := by
          simp only [mem_Icc, bandLeft, bandRight, max_le_iff, le_min_iff,
            div_le_iff₀ hu, le_div_iff₀ hu]
          exact ⟨⟨hx.1.le, by nlinarith⟩, hx.2.le, by linarith⟩
        simp only [field, hx.1, hx.2, true_and, if_pos hv, if_neg hl,
          sub_zero, Set.indicator_of_mem hband]
        exact le_max_right _ _
    · have hl : ¬ e.height < l+u*t := by intro hh; apply hv; linarith
      simpa [field, hx.1, hx.2, hv, hl] using hn
  · have hfalse (z : ℝ) : ¬(e.left < t ∧ t < e.right ∧ e.height < z) := by
      rintro ⟨ha,hb,_⟩
      exact hx ⟨ha,hb⟩
    simpa [field, hfalse] using hn

theorem chord_band_upper (e : HEdge) (l h v u : ℝ) (hu : 0 < u)
    (hlv : l ≤ v) (hvh : v ≤ h) :
    e.chord v u ≤ e.chord l u + max 0 e.jump * e.bandLength l h u := by
  have hb : Integrable ((Icc (e.bandLeft h u) (e.bandRight l u)).indicator
      (fun _ => max 0 e.jump)) := by
    rw [integrable_indicator_iff measurableSet_Icc]
    exact integrableOn_const (by simp [Real.volume_Icc])
  have hi := integral_mono ((e.line_integrable v u hu).sub (e.line_integrable l u hu)) hb
    (fun t => e.pointwise_band l h v u t hu hlv hvh)
  simp only [Pi.sub_apply] at hi
  rw [integral_sub (e.line_integrable v u hu) (e.line_integrable l u hu),
    integral_indicator_const _ measurableSet_Icc, Real.volume_real_Icc, smul_eq_mul] at hi
  change e.chord v u - e.chord l u ≤
    max (e.bandRight l u - e.bandLeft h u) 0 * max 0 e.jump at hi
  unfold bandLength
  rw [max_comm (e.bandRight l u - e.bandLeft h u) 0] at hi
  nlinarith

end HEdge

def jumpField {ι : Type*} (S : Finset ι) (E : ι → HEdge) (x y : ℝ) : ℝ :=
  ∑ i ∈ S, (E i).field x y

theorem jumpField_chord {ι : Type*} (S : Finset ι) (E : ι → HEdge)
    (v u : ℝ) (hu : 0 < u) :
    (∫ t : ℝ, jumpField S E t (v+u*t)) = ∑ i ∈ S, (E i).chord v u := by
  unfold jumpField
  rw [integral_finsetSum S (fun i _ => (E i).line_integrable v u hu)]
  rfl

/-- Positive horizontal jumps give the frozen C03 band bound for the actual
finite step field, including signed jumps and arbitrary real coordinates. -/
theorem jumpField_chord_band_upper {ι : Type*} (S : Finset ι) (E : ι → HEdge)
    (l h v u : ℝ) (hu : 0 < u) (hlv : l ≤ v) (hvh : v ≤ h) :
    (∫ t : ℝ, jumpField S E t (v+u*t)) ≤
      (∫ t : ℝ, jumpField S E t (l+u*t)) +
        ∑ i ∈ S, max 0 (E i).jump * (E i).bandLength l h u := by
  rw [jumpField_chord S E v u hu, jumpField_chord S E l u hu, ← Finset.sum_add_distrib]
  exact Finset.sum_le_sum fun i _ => (E i).chord_band_upper l h v u hu hlv hvh

end NoThreeLine

#print axioms NoThreeLine.HEdge.chord_band_upper
#print axioms NoThreeLine.jumpField_chord_band_upper
