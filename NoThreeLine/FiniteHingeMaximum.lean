import NoThreeLine.VertexChord

/-! A compactly supported finite signed hinge sum is bounded by its values
at its actual breakpoints. Both zero-tail cancellations are proved inputs
for rectangle chords; no global maximum assertion is a hypothesis here. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open scoped BigOperators

namespace NoThreeLine

theorem finite_knot_bracket (S : Finset ℝ) (v : ℝ)
    (hl : ∃a∈S,a≤v) (hr : ∃b∈S,v≤b) :
    ∃a∈S,∃b∈S,a≤v ∧ v≤b ∧ ∀t∈S,t≤a ∨ b≤t := by
  classical
  let A := S.filter (fun x=>x≤v)
  let B := S.filter (fun x=>v≤x)
  have hA : A.Nonempty := by obtain ⟨a,ha,hav⟩:=hl; exact ⟨a,Finset.mem_filter.mpr ⟨ha,hav⟩⟩
  have hB : B.Nonempty := by obtain ⟨b,hb,hvb⟩:=hr; exact ⟨b,Finset.mem_filter.mpr ⟨hb,hvb⟩⟩
  have ha := Finset.mem_filter.mp (A.max'_mem hA)
  have hb := Finset.mem_filter.mp (B.min'_mem hB)
  refine ⟨A.max' hA,ha.1,B.min' hB,hb.1,ha.2,hb.2,?_⟩
  intro t ht
  by_cases htv : t≤v
  · exact Or.inl (Finset.le_max' A t (Finset.mem_filter.mpr ⟨ht,htv⟩))
  · exact Or.inr (Finset.min'_le B t (Finset.mem_filter.mpr ⟨ht,(not_le.mp htv).le⟩))

def finiteHingeSum {ι : Type*} (S : Finset ι) (c k : ι→ℝ) (v : ℝ) : ℝ :=
  ∑i∈S,c i*max 0 (v-k i)

theorem finiteHingeSum_interpolate {ι : Type*} (S : Finset ι) (c k : ι→ℝ)
    (a b v : ℝ) (hav : a≤v) (hvb : v≤b) (hknots : ∀i∈S,k i≤a ∨ b≤k i) :
    (b-a)*finiteHingeSum S c k v =
      (b-v)*finiteHingeSum S c k a+(v-a)*finiteHingeSum S c k b := by
  unfold finiteHingeSum
  rw [Finset.mul_sum,Finset.mul_sum,Finset.mul_sum,←Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  rcases hknots i hi with hl | hr
  · rw [max_eq_right (sub_nonneg.mpr (hl.trans hav)),max_eq_right (sub_nonneg.mpr hl),
      max_eq_right (sub_nonneg.mpr (hl.trans (hav.trans hvb)))]
    ring
  · rw [max_eq_left (sub_nonpos.mpr (hvb.trans hr)),max_eq_left (sub_nonpos.mpr ((hav.trans hvb).trans hr)),
      max_eq_left (sub_nonpos.mpr hr)]
    ring

theorem finiteHingeSum_le_knots {ι : Type*} (S : Finset ι) (c k : ι→ℝ) (U : ℝ)
    (hU : 0≤U) (hc : (∑i∈S,c i)=0) (hck : (∑i∈S,c i*k i)=0)
    (hbound : ∀i∈S,finiteHingeSum S c k (k i)≤U) (v : ℝ) :
    finiteHingeSum S c k v≤U := by
  classical
  by_cases hl : ∃a∈S.image k,a≤v
  · by_cases hr : ∃b∈S.image k,v≤b
    · obtain ⟨a,ha,b,hb,hav,hvb,hsep⟩ := finite_knot_bracket (S.image k) v hl hr
      have hfa : finiteHingeSum S c k a≤U := by
        obtain ⟨i,hi,rfl⟩:=Finset.mem_image.mp ha
        exact hbound i hi
      have hfb : finiteHingeSum S c k b≤U := by
        obtain ⟨i,hi,rfl⟩:=Finset.mem_image.mp hb
        exact hbound i hi
      by_cases hab : a=b
      · have hv : v=a := by linarith
        simpa only [hv] using hfa
      · have hab' : 0<b-a := sub_pos.mpr (lt_of_le_of_ne (hav.trans hvb) hab)
        have he := finiteHingeSum_interpolate S c k a b v hav hvb
          (fun i hi=>hsep (k i) (Finset.mem_image_of_mem k hi))
        have h1 := mul_le_mul_of_nonneg_left hfa (sub_nonneg.mpr hvb)
        have h2 := mul_le_mul_of_nonneg_left hfb (sub_nonneg.mpr hav)
        nlinarith
    · have hzero : finiteHingeSum S c k v=0 := by
        unfold finiteHingeSum
        have hki (i : ι) (hi : i∈S) : k i≤v := by
          by_contra h
          exact hr ⟨k i,Finset.mem_image_of_mem k hi,(not_le.mp h).le⟩
        rw [Finset.sum_congr rfl (show ∀ i∈S,c i*max 0 (v-k i)=c i*(v-k i) from
          fun i hi=>by rw [max_eq_right (sub_nonneg.mpr (hki i hi))])]
        simp only [mul_sub,Finset.sum_sub_distrib,←Finset.sum_mul,hc,hck,zero_mul,sub_zero]
      rw [hzero]
      exact hU
  · have hzero : finiteHingeSum S c k v=0 := by
      apply Finset.sum_eq_zero
      intro i hi
      have hv : v≤k i := by
        by_contra h
        exact hl ⟨k i,Finset.mem_image_of_mem k hi,(not_le.mp h).le⟩
      rw [max_eq_left (sub_nonpos.mpr hv),mul_zero]
    rw [hzero]
    exact hU

end NoThreeLine
#print axioms NoThreeLine.finiteHingeSum_le_knots
