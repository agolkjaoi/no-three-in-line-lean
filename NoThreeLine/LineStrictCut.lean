import NoThreeLine.LineStageHistoryCut
import NoThreeLine.LineSectionContinuousEvent

/-! A measurable earliest possible cut for a strict positive-time
exceedance. The infimum is over rational witness times on the selected
flow and the physical guard, so an unreached guard adds no event. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

def strictCutTimes {X : Type*} (G : X→ℝ) (f : X×ℝ→ℝ) (b : ℝ) (a : X) : Set ℝ :=
  {G a} ∪ {t | ∃ q : ℚ, t=(q:ℝ) ∧ 0<t ∧ t<G a ∧ b<f (a,t)}

def strictCutTime {X : Type*} (G : X→ℝ) (f : X×ℝ→ℝ) (b : ℝ) (a : X) : ℝ :=
  sInf (strictCutTimes G f b a)

theorem strictCutTimes_bddBelow {X : Type*} (G : X→ℝ) (f : X×ℝ→ℝ) (b : ℝ) (a : X) :
    BddBelow (strictCutTimes G f b a) := by
  refine ⟨min 0 (G a),?_⟩
  intro t ht
  rcases ht with hG | ⟨q,_,ht0,_,_⟩
  · rw [mem_singleton_iff.mp hG]
    exact min_le_right _ _
  · exact (min_le_left _ _).trans ht0.le

theorem strictCutTime_lt_iff {X : Type*} (G : X→ℝ) (f : X×ℝ→ℝ) (b : ℝ) (a : X) (d : ℝ) :
    strictCutTime G f b a<d ↔ G a<d ∨ ∃ q : ℚ, 0<(q:ℝ) ∧ (q:ℝ)<G a ∧ b<f (a,q) ∧ (q:ℝ)<d := by
  unfold strictCutTime
  rw [csInf_lt_iff (strictCutTimes_bddBelow G f b a) ⟨G a,Or.inl rfl⟩]
  constructor
  · rintro ⟨t,ht,htd⟩
    rcases ht with htG | ⟨q,rfl,hq0,hqG,hqf⟩
    · exact Or.inl ((mem_singleton_iff.mp htG) ▸ htd)
    · exact Or.inr ⟨q,hq0,hqG,hqf,htd⟩
  · rintro (hd | ⟨q,hq0,hqG,hqf,hqd⟩)
    · exact ⟨G a,Or.inl rfl,hd⟩
    · exact ⟨q,Or.inr ⟨q,rfl,hq0,hqG,hqf⟩,hqd⟩

theorem strictCutTime_bounds {X : Type*} (G : X→ℝ) (f : X×ℝ→ℝ) (b : ℝ) (a : X)
    (hG : 0≤G a) : strictCutTime G f b a ∈ Icc (0:ℝ) (G a) := by
  constructor
  · apply le_csInf ⟨G a,Or.inl rfl⟩
    intro t ht
    rcases ht with he | ⟨q,_,ht,_,_⟩
    · rwa [mem_singleton_iff.mp he]
    · exact ht.le
  · exact csInf_le (strictCutTimes_bddBelow G f b a) (Or.inl rfl)

theorem strictCutTime_measurable {X : Type*} [MeasurableSpace X]
    (G : X→ℝ) (hG : Measurable G) (f : X×ℝ→ℝ) (hf : Measurable f) (b : ℝ) :
    Measurable (strictCutTime G f b) := by
  apply measurable_of_Iio
  intro d
  have hm (q : ℚ) : Measurable (fun a : X => f (a,(q:ℝ))) :=
    hf.comp (measurable_id.prodMk measurable_const)
  have he : strictCutTime G f b ⁻¹' Iio d =
      {a | G a<d ∨ ∃ q : ℚ, 0<(q:ℝ) ∧ (q:ℝ)<G a ∧ b<f (a,q) ∧ (q:ℝ)<d} := by
    ext a
    exact strictCutTime_lt_iff G f b a d
  rw [he]
  exact ((hG.lt measurable_const).or (Measurable.exists (fun q=>
    measurable_const.and ((measurable_const.lt hG).and
      ((measurable_const.lt (hm q)).and measurable_const))))).setOf

theorem strictCutTime_lt_iff_exceedance {X : Type*} (G : X→ℝ) (f : X×ℝ→ℝ)
    (b : ℝ) (a : X) (d : ℝ) (hd : d≤G a) (hf : Continuous (fun t=>f (a,t))) :
    strictCutTime G f b a<d ↔ ∃ t : ℝ, 0<t ∧ t≤d ∧ b<f (a,t) := by
  rw [strictCutTime_lt_iff,or_iff_right (not_lt_of_ge hd),
    continuous_positive_exceedance_rat hf b d]
  exact ⟨fun ⟨q,hq0,_,hqf,hqd⟩=>⟨q,hq0,hqd,hqf⟩,
    fun ⟨q,hq0,hqd,hqf⟩=>⟨q,hq0,hqd.trans_le hd,hqf,hqd⟩⟩

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.strictCutTime_measurable
#print axioms NoThreeLine.BirthWitness.strictCutTime_lt_iff_exceedance

