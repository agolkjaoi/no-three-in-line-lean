import NoThreeLine.WitnessSourceHierarchy

/-! Count actual shared specified lines as a set, and obtain the S7
general-configuration price max(1,A1)^g without duplicate direction lines. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct EtaMixedGenerator GridLines

def sharedSpecifiedLines {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) : Finset (LineIndex n) := Finset.univ.filter (fun L=>sharedLine C q L ∧ specified Γ L)

theorem sharedSpecifiedLines_card_le {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n))
    (q : Grid n) : (sharedSpecifiedLines Γ C q).card≤Γ.card := by
  classical
  have hsub : (sharedSpecifiedLines Γ C q).image Subtype.val⊆specifiedLines Γ q := by
    intro L hL
    obtain ⟨K,hK,rfl⟩ := Finset.mem_image.mp hL
    have hh := (Finset.mem_filter.mp hK).2
    exact (Finset.mem_inter.mp ((specified_iff_designated Γ q K hh.1.1).mp hh.2)).1
  have hc := Finset.card_le_card hsub
  rw [Finset.card_image_of_injective _ Subtype.val_injective] at hc
  exact hc.trans ((Finset.card_image_le).trans (Finset.card_filter_le _ _))

theorem sourcePrice_eq_filtered {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) :
    sourcePrice e Γ C q=∏L∈sharedSpecifiedLines Γ C q,protection 1 (e.clocks L) := by
  rw [sharedSpecifiedLines,Finset.prod_filter]
  rfl

theorem protection_one_le {k K : ℝ} (hk : k≤K) (hK : K<2) :
    protection 1 k≤protection 1 K := by
  norm_num [protection]
  simpa only [one_div] using one_div_le_one_div_of_le (sub_pos.mpr hK) (sub_le_sub_left hk 2)

theorem sourcePrice_le {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (K : ℝ) (hK : K<2)
    (hk : ∀L,sharedLine C q L→specified Γ L→e.clocks L≤K) :
    sourcePrice e Γ C q≤max 1 (protection 1 K)^Γ.card := by
  rw [sourcePrice_eq_filtered]
  calc
    _ ≤ ∏_L∈sharedSpecifiedLines Γ C q,max 1 (protection 1 K) := by
      apply Finset.prod_le_prod
      · intro L hL
        have hh := (Finset.mem_filter.mp hL).2
        exact div_nonneg (by norm_num) (sub_nonneg.mpr ((hk L hh.1 hh.2).trans hK.le))
      · intro L hL
        have hh := (Finset.mem_filter.mp hL).2
        exact (protection_one_le (hk L hh.1 hh.2) hK).trans (le_max_right _ _)
    _ = max 1 (protection 1 K)^(sharedSpecifiedLines Γ C q).card := Finset.prod_const _
    _ ≤ _ := pow_le_pow_right₀ (le_max_left _ _) (sharedSpecifiedLines_card_le Γ C q)

theorem sourcePrice_le_of_card_le {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (K : ℝ) (hK : K<2)
    (hk : ∀L,sharedLine C q L→specified Γ L→e.clocks L≤K) (g : ℕ) (hg : Γ.card≤g) :
    sourcePrice e Γ C q≤max 1 (protection 1 K)^g :=
  (sourcePrice_le e Γ C q K hK hk).trans (pow_le_pow_right₀ (le_max_left _ _) hg)

theorem mixed_nonneg {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (B : ℝ) (ha : a.Valid B) : 0≤mixed Γ C D L a :=
  mul_nonneg (witnessProduct_nonneg a D B ha) (correctedPhi_nonneg a.augmented Γ C L B ha.1)

theorem generator_le_bounded_source {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (ha : a.Valid B)
    (hstop : a.augmented.physical.process.stopped=false)
    (hC : C⊆a.augmented.physical.process.activeEvents) (hCL : C⊆L) (hCD : Disjoint C D)
    (hm : ∀p,0≤mask p) (hret : ∀q∈D,0≤retention q) (hE : EmptyLineCredit a.augmented.physical)
    (K : ℝ) (hK : K<2)
    (hk : ∀q∈D,∀J,sharedLine C q J→specified Γ J→a.augmented.physical.clocks J≤K)
    (g : ℕ) (hg : Γ.card≤g) :
    generator a Γ C D L mask retention≤
      ∑q∈D,(mask q*retention q/n)*max 1 (protection 1 K)^g*
        mixed Γ (insert q C) (D.erase q) L a := by
  apply (generator_le_s7 a Γ C D L mask retention B ha hstop hC hCL hCD hm hret hE
    (fun q hq J hJ hsp=>(hk q hq J hJ hsp).trans_lt hK)).trans
  apply Finset.sum_le_sum
  intro q hq
  exact mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_left (sourcePrice_le_of_card_le a.augmented.physical Γ C q K hK (hk q hq) g hg)
      (div_nonneg (mul_nonneg (hm q) (hret q hq)) (Nat.cast_nonneg n)))
    (mixed_nonneg a Γ (insert q C) (D.erase q) L B ha)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.sharedSpecifiedLines_card_le
#print axioms NoThreeLine.BirthWitness.generator_le_bounded_source
