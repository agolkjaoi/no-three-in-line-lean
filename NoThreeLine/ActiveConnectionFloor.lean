import NoThreeLine.ScheduledCutLineGuards

/-! A coarse positive connection floor with a label-count exponent.
Only lines determined by two distinct labels can contribute. The cubic
exponent is deliberately coarse, but is independent of the board size. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.MixedConnection
open AuxiliaryODE GridLines

def contributingLines {n : ℕ} (C : Finset (Grid n)) : Finset (LineIndex n) :=
  Finset.univ.filter (fun L => 2 ≤ multiplicity C L)

theorem contributingLines_card_le {n : ℕ} (C : Finset (Grid n)) :
    (contributingLines C).card ≤ C.card^2 := by
  classical
  have hsub : (contributingLines C).image Subtype.val ⊆
      (C ×ˢ C).image (fun v => lineThrough v.1 v.2) := by
    intro T hT
    obtain ⟨L,hL,rfl⟩ := Finset.mem_image.mp hT
    have hm : 1 < (C ∩ L.val).card := by
      have hh := (Finset.mem_filter.mp hL).2
      change 2 ≤ (C ∩ L.val).card at hh
      omega
    obtain ⟨p,hp,q,hq,hpq⟩ := Finset.one_lt_card.mp hm
    have hp' := Finset.mem_inter.mp hp
    have hq' := Finset.mem_inter.mp hq
    exact Finset.mem_image.mpr ⟨(p,q),Finset.mem_product.mpr ⟨hp'.1,hq'.1⟩,
      (boardLine_eq L p q hp'.2 hq'.2 hpq).symm⟩
  calc
    (contributingLines C).card = ((contributingLines C).image Subtype.val).card :=
      (Finset.card_image_of_injective _ Subtype.val_injective).symm
    _ ≤ ((C ×ˢ C).image (fun v => lineThrough v.1 v.2)).card := Finset.card_le_card hsub
    _ ≤ (C ×ˢ C).card := Finset.card_image_le
    _ = C.card^2 := by rw [Finset.card_product,pow_two]

theorem connection_exponent_le_cube {n : ℕ} (C : Finset (Grid n)) :
    (∑L : LineIndex n,(multiplicity C L-1)) ≤ C.card^3 := by
  classical
  have hs : (∑L : LineIndex n,(multiplicity C L-1)) =
      ∑L∈contributingLines C,(multiplicity C L-1) := by
    symm
    apply Finset.sum_subset (Finset.subset_univ _)
    intro L _ hL
    have hh : ¬2 ≤ multiplicity C L := by simpa [contributingLines] using hL
    omega
  rw [hs]
  calc
    _ ≤ ∑L∈contributingLines C,C.card := by
      apply Finset.sum_le_sum
      intro L _
      exact (Nat.sub_le _ _).trans (Finset.card_le_card Finset.inter_subset_left)
    _ = (contributingLines C).card*C.card := by simp
    _ ≤ C.card^2*C.card := Nat.mul_le_mul_right _ (contributingLines_card_le C)
    _ = C.card^3 := by ring

theorem active_connectionProduct_lower {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (C : Finset (Grid n)) (e : ExtendedState n) (B K ρ δ : ℝ)
    (he : e.Valid B) (hE : EmptyLineCredit e) (hg : ActiveLineGuardBounds Γ K ρ e)
    (hC : C ⊆ e.process.activeEvents) (hK : K < 2) (hρ : ρ ≤ 1)
    (hδ0 : 0 ≤ δ) (hδ1 : δ ≤ 1) (hδρ : δ ≤ ρ) (hδK : δ ≤ (2-K)/2) :
    δ^(C.card^3) ≤ connectionProduct Γ C e := by
  classical
  apply le_trans (pow_le_pow_of_le_one hδ0 hδ1 (connection_exponent_le_cube C))
  rw [←Finset.prod_pow_eq_pow_sum]
  apply Finset.prod_le_prod (fun L _ => pow_nonneg hδ0 _)
  intro L _
  by_cases hm : multiplicity C L ≤ 1
  · simp only [lineConnection,Nat.sub_eq_zero_of_le hm,pow_zero,ite_self,le_refl]
  · have hpos : 0 < multiplicity C L := by omega
    obtain ⟨p,hp⟩ := Finset.card_pos.mp hpos
    obtain ⟨hpC,hpL⟩ := Finset.mem_inter.mp hp
    unfold lineConnection
    split_ifs with hsp
    · exact pow_le_pow_left₀ hδ0 (hδK.trans
        (active_inverse_protection_lower he hg hK p (hC hpC) L hpL hsp)) _
    · exact pow_le_pow_left₀ hδ0 (hδρ.trans
        (active_lineCredit_lower he hE hg hρ p (hC hpC) L hpL hsp)) _

end NoThreeLine.MixedConnection

namespace NoThreeLine.BirthWitness
open AuxiliaryODE MixedConnection

theorem initial_scheduledCutWitness_connection_lower {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ : ℝ)
    (e : Retention n) (hn : 0<n) (hB : 1≤B) (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (Γ : Finset PrimitiveLines.ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K ≤ K) (hρ : ∀j,ρ ≤ (cs j).rho)
    (hδ0 : 0≤δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (k : ℕ) (x : BoardClockPath n × ℝ) (C : Finset (Grid n))
    (hC : C ⊆ (scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k x).augmented.physical.process.activeEvents) :
    δ^(C.card^3) ≤ connectionProduct Γ C
      (scheduledCutWitness cs ε M deadline start e hn
        (initialGoodPhaseObservation B hB deadline start) k x).augmented.physical := by
  exact active_connectionProduct_lower Γ C _ B K ρ δ
    (scheduledCutWitness_valid cs ε M deadline start e hn _ k x).1.1
    (scheduledCutWitness_emptyLineCredit cs ε M deadline start e hn _ k x)
    (initial_scheduledCutWitness_activeLineGuardBounds cs ε M deadline start K ρ e hn hB hK0 Γ hΓ hK hρ k x)
    hC hK2 hρ1 hδ0 hδ1 hδρ hδK

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.MixedConnection.connection_exponent_le_cube
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutWitness_connection_lower
