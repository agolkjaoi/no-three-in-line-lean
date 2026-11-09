import NoThreeLine.ClosedGuardHit
import NoThreeLine.LineSectionContinuousEvent

/-! Closed upper contact is measurable for a jointly measurable curve
whose time sections are continuous. Only countably many strict tests
are used in the incoming parameter. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine

theorem continuous_closed_upper_hit_iff_countable {f : ℝ→ℝ} (hf : Continuous f)
    (a b : ℝ) (ha : 0≤a) :
    (∃t∈Icc (0:ℝ) a,b≤f t) ↔
    ∀m : ℕ,b-1/(m+1)<f 0 ∨ ∃q : ℚ,0<(q:ℝ) ∧ (q:ℝ)<a ∧ b-1/(m+1)<f q := by
  constructor
  · rintro ⟨t,ht,hb⟩ m
    have hm : 0<(1:ℝ)/(m+1) := by positivity
    have hf' : b-1/(m+1)<f t := by linarith
    by_cases hz : t=0
    · exact Or.inl (hz ▸ hf')
    · exact Or.inr ((continuous_positive_exceedance_rat hf (b-1/(m+1)) a).mp
        ⟨t,lt_of_le_of_ne ht.1 (Ne.symm hz),ht.2,hf'⟩)
  · intro h
    obtain ⟨t,ht,hmax⟩ := (isCompact_Icc (a:= (0:ℝ)) (b:=a)).exists_isMaxOn
      ⟨0,le_rfl,ha⟩ hf.continuousOn
    refine ⟨t,ht,le_of_not_gt ?_⟩
    intro hn
    obtain ⟨m,hm⟩ := exists_nat_one_div_lt (sub_pos.mpr hn)
    have hb : f t<b-1/(m+1) := by linarith
    rcases h m with h0 | ⟨q,hq,hqa,hqf⟩
    · exact (not_lt_of_ge (hmax ⟨le_rfl,ha⟩)) (hb.trans h0)
    · exact (not_lt_of_ge (hmax ⟨hq.le,hqa.le⟩)) (hb.trans hqf)

theorem firstUpperHit_measurable {X : Type*} [MeasurableSpace X] (T b : ℝ) (hT : 0≤T)
    (f : X×ℝ→ℝ) (hf : Measurable f) (hc : ∀x,Continuous (fun t=>f (x,t))) :
    Measurable (fun x=>firstClosedHit T (fun t=>f (x,t)) (Ici b)) := by
  apply measurable_of_Iic
  intro a
  by_cases hneg : a<0
  · have he : (fun x=>firstClosedHit T (fun t=>f (x,t)) (Ici b)) ⁻¹' Iic a=∅ := by
      ext x
      exact ⟨fun hx=>((firstClosedHit_bounds T hT (fun t=>f (x,t)) (Ici b) (hc x)
        isClosed_Ici).1.trans hx).not_gt hneg |>.elim,fun hx=>hx.elim⟩
    rw [he]
    exact MeasurableSet.empty
  · by_cases hta : T≤a
    · have he : (fun x=>firstClosedHit T (fun t=>f (x,t)) (Ici b)) ⁻¹' Iic a=univ :=
        eq_univ_of_forall (fun x=>(firstClosedHit_bounds T hT (fun t=>f (x,t)) (Ici b) (hc x)
          isClosed_Ici).2.trans hta)
      rw [he]
      exact MeasurableSet.univ
    · have hdesc (x : X) :
          firstClosedHit T (fun t=>f (x,t)) (Ici b)≤a ↔ ∃t∈Icc (0:ℝ) a,b≤f (x,t) := by
        rw [firstClosedHit_le_iff T hT _ _ (hc x) isClosed_Ici]
        constructor
        · rintro ⟨t,ht,ht',h | h⟩
          · exact (hta (h ▸ ht')).elim
          · exact ⟨t,⟨ht.1,ht'⟩,h⟩
        · rintro ⟨t,ht,h⟩
          exact ⟨t,⟨ht.1,ht.2.trans (lt_of_not_ge hta).le⟩,ht.2,Or.inr h⟩
      let P := fun (x : X) (m : ℕ)=>b-1/(m+1)<f (x,0) ∨
        ∃q : ℚ,0<(q:ℝ) ∧ (q:ℝ)<a ∧ b-1/(m+1)<f (x,q)
      have hp (m : ℕ) : Measurable (fun x=>P x m) :=
        (measurable_const.lt (hf.comp (measurable_id.prodMk measurable_const))).or
          (Measurable.exists (fun q : ℚ=>measurable_const.and
            (measurable_const.and (measurable_const.lt (hf.comp (measurable_id.prodMk measurable_const))))))
      have he : (fun x=>firstClosedHit T (fun t=>f (x,t)) (Ici b)) ⁻¹' Iic a={x | ∀m,P x m} := by
        ext x
        exact (hdesc x).trans (continuous_closed_upper_hit_iff_countable (hc x) a b (le_of_not_gt hneg))
      rw [he]
      exact (Measurable.forall hp).setOf

end NoThreeLine

#print axioms NoThreeLine.firstUpperHit_measurable

