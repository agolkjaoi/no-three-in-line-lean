import Mathlib.Topology.EMetricSpace.BoundedVariation
import Mathlib.Tactic

/-! Quantitative variation from finitely many monotonicity intervals.
The later geometric application must construct the cuts and prove monotonicity. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped ENNReal

namespace NoThreeLine

theorem eVariation_le_of_monotone_or_antitone (f : ℝ → ℝ) (a b C : ℝ)
    (hab : a ≤ b) (hb : ∀ x ∈ Icc a b, 0 ≤ f x ∧ f x ≤ C)
    (hm : MonotoneOn f (Icc a b) ∨ AntitoneOn f (Icc a b)) :
    eVariationOn f (Icc a b) ≤ ENNReal.ofReal C := by
  have ha : a ∈ Icc a b := ⟨le_rfl,hab⟩
  have hb' : b ∈ Icc a b := ⟨hab,le_rfl⟩
  rcases hm with hm | hm
  · have hv := hm.eVariationOn_le ha hb'
    simp only [inter_self] at hv
    exact hv.trans (ENNReal.ofReal_le_ofReal (by linarith [(hb a ha).1,(hb b hb').2]))
  · have hn : MonotoneOn (fun x => -f x) (Icc a b) :=
      fun x hx y hy hxy => neg_le_neg (hm hx hy hxy)
    have hv := hn.eVariationOn_le ha hb'
    have he : eVariationOn (fun x => -f x) (Icc a b) = eVariationOn f (Icc a b) := by
      simp only [eVariationOn, edist_neg_neg]
    rw [inter_self,he] at hv
    exact hv.trans (ENNReal.ofReal_le_ofReal (by linarith [(hb a ha).2,(hb b hb').1]))

/-- Each internal cut adds at most one interval's amplitude.
The proof removes the least cut, so the count is linear rather than exponential. -/
theorem eVariation_le_of_internal_cuts (T : Finset ℝ) (f : ℝ → ℝ) (a b C : ℝ)
    (hab : a ≤ b) (hC : 0 ≤ C) (hT : ∀ t ∈ T, t ∈ Ioo a b)
    (hb : ∀ x ∈ Icc a b, 0 ≤ f x ∧ f x ≤ C)
    (hm : ∀ l h, a ≤ l → l ≤ h → h ≤ b →
      (∀ t ∈ T, t ∉ Ioo l h) →
      MonotoneOn f (Icc l h) ∨ AntitoneOn f (Icc l h)) :
    eVariationOn f (Icc a b) ≤ ENNReal.ofReal (((T.card : ℝ) + 1) * C) := by
  classical
  induction T using Finset.strongInductionOn generalizing a b with
  | _ T ih =>
    rcases T.eq_empty_or_nonempty with rfl | hne
    · simpa using eVariation_le_of_monotone_or_antitone f a b C hab hb
        (hm a b le_rfl hab le_rfl (by simp))
    · let c := T.min' hne
      have hcT : c ∈ T := T.min'_mem hne
      have hc : c ∈ Ioo a b := hT c hcT
      have hleft : eVariationOn f (Icc a c) ≤ ENNReal.ofReal C := by
        apply eVariation_le_of_monotone_or_antitone f a c C hc.1.le
          (fun x hx => hb x ⟨hx.1,hx.2.trans hc.2.le⟩)
        apply hm a c le_rfl hc.1.le hc.2.le
        intro t ht htc
        exact (not_lt_of_ge (T.min'_le t ht)) htc.2
      have hright : eVariationOn f (Icc c b) ≤
          ENNReal.ofReal ((((T.erase c).card : ℝ) + 1) * C) := by
        apply ih (T.erase c) (Finset.erase_ssubset hcT) c b hc.2.le
        · intro t ht
          have hmem := Finset.mem_erase.mp ht
          exact ⟨lt_of_le_of_ne (T.min'_le t hmem.2) (Ne.symm hmem.1), (hT t hmem.2).2⟩
        · intro x hx
          exact hb x ⟨hc.1.le.trans hx.1,hx.2⟩
        · intro l h hcl hlh hhb hno
          apply hm l h (hc.1.le.trans hcl) hlh hhb
          intro t ht hti
          by_cases htc : t = c
          · subst t
            exact (not_lt_of_ge hcl) hti.1
          · exact hno t (Finset.mem_erase.mpr ⟨htc,ht⟩) hti
      have he : eVariationOn f (Icc a b) =
          eVariationOn f (Icc a c) + eVariationOn f (Icc c b) := by
        simpa only [univ_inter] using
          (eVariationOn.Icc_add_Icc f hc.1.le hc.2.le (s := univ) (mem_univ c)).symm
      rw [he]
      apply (add_le_add hleft hright).trans
      rw [← ENNReal.ofReal_add hC (mul_nonneg (by positivity) hC)]
      apply ENNReal.ofReal_le_ofReal
      have hcard := Finset.card_erase_add_one hcT
      have hcast : ((T.erase c).card : ℝ) + 1 = T.card := by exact_mod_cast hcard
      rw [hcast]
      ring_nf
      exact le_rfl

/-- Cuts outside the interval and cuts at its endpoints need not be counted. -/
theorem eVariation_le_of_finite_cuts (T : Finset ℝ) (f : ℝ → ℝ) (a b C : ℝ)
    (hab : a ≤ b) (hC : 0 ≤ C)
    (hb : ∀ x ∈ Icc a b, 0 ≤ f x ∧ f x ≤ C)
    (hm : ∀ l h, a ≤ l → l ≤ h → h ≤ b →
      (∀ t ∈ T, t ∉ Ioo l h) →
      MonotoneOn f (Icc l h) ∨ AntitoneOn f (Icc l h)) :
    eVariationOn f (Icc a b) ≤ ENNReal.ofReal (((T.card : ℝ) + 1) * C) := by
  classical
  let U := T.filter (fun t => t ∈ Ioo a b)
  have hv : eVariationOn f (Icc a b) ≤ ENNReal.ofReal (((U.card : ℝ) + 1) * C) := by
    apply eVariation_le_of_internal_cuts U f a b C hab hC
    · intro t ht
      exact (Finset.mem_filter.mp ht).2
    · exact hb
    · intro l h hal hlh hhb hno
      apply hm l h hal hlh hhb
      intro t ht hti
      exact hno t (Finset.mem_filter.mpr ⟨ht,lt_of_le_of_lt hal hti.1,
        lt_of_lt_of_le hti.2 hhb⟩) hti
  apply hv.trans
  apply ENNReal.ofReal_le_ofReal
  gcongr
  exact Finset.filter_subset _ _

end NoThreeLine

#print axioms NoThreeLine.eVariation_le_of_finite_cuts
