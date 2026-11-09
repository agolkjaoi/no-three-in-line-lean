import NoThreeLine.ClippedFlow
import Mathlib.Topology.Maps.Proper.Basic
import Mathlib.MeasureTheory.Constructions.BorelSpace.Order

/-! The first contact with a closed guard, capped by a finite deadline.
The infimum is attained, no earlier contact occurs, and the hitting time is
measurable for a jointly continuous family of curves. -/
set_option autoImplicit false
noncomputable section
open Set MeasureTheory

namespace NoThreeLine

def deadlineHitSet {E : Type*} (T : ℝ) (φ : ℝ → E) (bad : Set E) : Set ℝ :=
  Icc 0 T ∩ ({T} ∪ φ ⁻¹' bad)

def firstClosedHit {E : Type*} (T : ℝ) (φ : ℝ → E) (bad : Set E) : ℝ :=
  sInf (deadlineHitSet T φ bad)

theorem deadlineHitSet_nonempty {E : Type*} (T : ℝ) (hT : 0 ≤ T)
    (φ : ℝ → E) (bad : Set E) : (deadlineHitSet T φ bad).Nonempty :=
  ⟨T,⟨⟨hT,le_rfl⟩,Or.inl rfl⟩⟩

theorem deadlineHitSet_bddBelow {E : Type*} (T : ℝ) (φ : ℝ → E) (bad : Set E) :
    BddBelow (deadlineHitSet T φ bad) := bddBelow_Icc.mono inter_subset_left

theorem deadlineHitSet_closed {E : Type*} [TopologicalSpace E]
    (T : ℝ) (φ : ℝ → E) (bad : Set E) (hφ : Continuous φ) (hb : IsClosed bad) :
    IsClosed (deadlineHitSet T φ bad) :=
  isClosed_Icc.inter (isClosed_singleton.union (hb.preimage hφ))

theorem firstClosedHit_mem {E : Type*} [TopologicalSpace E]
    (T : ℝ) (hT : 0 ≤ T) (φ : ℝ → E) (bad : Set E)
    (hφ : Continuous φ) (hb : IsClosed bad) :
    firstClosedHit T φ bad ∈ deadlineHitSet T φ bad :=
  (deadlineHitSet_closed T φ bad hφ hb).csInf_mem
    (deadlineHitSet_nonempty T hT φ bad) (deadlineHitSet_bddBelow T φ bad)

theorem firstClosedHit_bounds {E : Type*} [TopologicalSpace E]
    (T : ℝ) (hT : 0 ≤ T) (φ : ℝ → E) (bad : Set E)
    (hφ : Continuous φ) (hb : IsClosed bad) : firstClosedHit T φ bad ∈ Icc 0 T :=
  (firstClosedHit_mem T hT φ bad hφ hb).1

theorem firstClosedHit_before {E : Type*} [TopologicalSpace E]
    (T : ℝ) (hT : 0 ≤ T) (φ : ℝ → E) (bad : Set E)
    (hφ : Continuous φ) (hb : IsClosed bad) (t : ℝ)
    (ht0 : 0 ≤ t) (ht : t < firstClosedHit T φ bad) : φ t ∉ bad := by
  intro hbad
  have htT : t ≤ T := ht.le.trans (firstClosedHit_bounds T hT φ bad hφ hb).2
  have hle : firstClosedHit T φ bad ≤ t :=
    csInf_le (deadlineHitSet_bddBelow T φ bad) ⟨⟨ht0,htT⟩,Or.inr hbad⟩
  exact (not_lt_of_ge hle) ht

theorem firstClosedHit_contact {E : Type*} [TopologicalSpace E]
    (T : ℝ) (hT : 0 ≤ T) (φ : ℝ → E) (bad : Set E)
    (hφ : Continuous φ) (hb : IsClosed bad) (ht : firstClosedHit T φ bad < T) :
    φ (firstClosedHit T φ bad) ∈ bad := by
  rcases (firstClosedHit_mem T hT φ bad hφ hb).2 with he | he
  · exact (ht.ne he).elim
  · exact he

theorem firstClosedHit_le_iff {E : Type*} [TopologicalSpace E]
    (T : ℝ) (hT : 0 ≤ T) (φ : ℝ → E) (bad : Set E)
    (hφ : Continuous φ) (hb : IsClosed bad) (a : ℝ) :
    firstClosedHit T φ bad ≤ a ↔ ∃ t ∈ Icc (0 : ℝ) T, t ≤ a ∧ (t=T ∨ φ t ∈ bad) := by
  constructor
  · intro h
    have hm := firstClosedHit_mem T hT φ bad hφ hb
    exact ⟨firstClosedHit T φ bad,hm.1,h,hm.2⟩
  · rintro ⟨t,ht,hta,hb'⟩
    exact (csInf_le (deadlineHitSet_bddBelow T φ bad) ⟨ht,hb'⟩).trans hta

theorem firstClosedHit_measurable {X E : Type*} [TopologicalSpace X]
    [MeasurableSpace X] [OpensMeasurableSpace X] [TopologicalSpace E]
    (T : ℝ) (hT : 0 ≤ T) (φ : X × ℝ → E) (bad : Set E)
    (hφ : Continuous φ) (hb : IsClosed bad) :
    Measurable (fun x => firstClosedHit T (fun t => φ (x,t)) bad) := by
  apply measurable_of_Iic
  intro a
  let D : Set (X × Icc (0 : ℝ) T) :=
    {z | (z.2 : ℝ) ≤ a ∧ ((z.2 : ℝ)=T ∨ φ (z.1,z.2) ∈ bad)}
  have hcont : Continuous (fun z : X × Icc (0 : ℝ) T => φ (z.1,z.2)) :=
    hφ.comp (continuous_fst.prodMk (continuous_subtype_val.comp continuous_snd))
  have hD : IsClosed D :=
    (isClosed_le (continuous_subtype_val.comp continuous_snd) continuous_const).inter
      ((isClosed_eq (continuous_subtype_val.comp continuous_snd) continuous_const).union
        (hb.preimage hcont))
  have him : IsClosed (Prod.fst '' D) := isClosedMap_fst_of_compactSpace D hD
  have he : (fun x => firstClosedHit T (fun t => φ (x,t)) bad) ⁻¹' Iic a = Prod.fst '' D := by
    ext x
    have hxcont : Continuous (fun t : ℝ => φ (x,t)) :=
      hφ.comp (continuous_const.prodMk continuous_id)
    rw [mem_preimage,mem_Iic,firstClosedHit_le_iff T hT (fun t => φ (x,t)) bad hxcont hb]
    constructor
    · rintro ⟨t,ht,hta,hbad⟩
      exact ⟨(x,⟨t,ht⟩),⟨hta,hbad⟩,rfl⟩
    · rintro ⟨⟨y,t⟩,hy,heq⟩
      change y = x at heq
      subst y
      exact ⟨t,t.property,hy⟩
  rw [he]
  exact him.measurableSet

theorem firstClosedHit_norm_bound {E : Type*} [NormedAddCommGroup E]
    (T C : ℝ) (hT : 0 ≤ T) (φ : ℝ → E) (bad : Set E)
    (hφ : Continuous φ) (hb : IsClosed bad) (h0 : ‖φ 0‖ ≤ C)
    (hbox : {z : E | C ≤ ‖z‖} ⊆ bad) (t : ℝ)
    (ht : t ∈ Icc (0 : ℝ) (firstClosedHit T φ bad)) : ‖φ t‖ ≤ C := by
  let τ := firstClosedHit T φ bad
  have hτ0 : 0 ≤ τ := (firstClosedHit_bounds T hT φ bad hφ hb).1
  by_cases hz : τ = 0
  · have ht' : t ∈ Icc (0 : ℝ) τ := ht
    rw [hz] at ht'
    have ht0 : t = 0 := le_antisymm ht'.2 ht'.1
    simpa only [ht0] using h0
  · have hp : 0 < τ := lt_of_le_of_ne hτ0 (Ne.symm hz)
    have hpre : Ico (0 : ℝ) τ ⊆ {u : ℝ | ‖φ u‖ ≤ C} := by
      intro u hu
      have hh := firstClosedHit_before T hT φ bad hφ hb u hu.1 hu.2
      have hn : ¬ C ≤ ‖φ u‖ := fun h => hh (hbox h)
      exact (lt_of_not_ge hn).le
    have hclosed : IsClosed {u : ℝ | ‖φ u‖ ≤ C} := isClosed_le hφ.norm continuous_const
    have hc := closure_minimal hpre hclosed
    rw [closure_Ico hp.ne] at hc
    exact hc ht

end NoThreeLine

#print axioms NoThreeLine.firstClosedHit_contact
#print axioms NoThreeLine.firstClosedHit_measurable
#print axioms NoThreeLine.firstClosedHit_norm_bound
