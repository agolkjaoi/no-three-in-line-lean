import NoThreeLine.WitnessSourcePrice

/-! The manuscript S7 local hierarchy, with the actual birth rate, physical
connection price, fixed-label eta product and deterministic retention value.
This is a generator theorem, not an integrated compensation theorem. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct EtaMixedGenerator

theorem sourcePrice_eq_one {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n)
    (hsep : ∀L,sharedLine C q L→¬specified Γ L) : sourcePrice e Γ C q=1 := by
  apply Finset.prod_eq_one
  intro L _
  unfold sourcePriceLine
  rw [if_neg (fun h=>(hsep L h.1) h.2)]

theorem sourcePrice_eq_one_of_pairs {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (q : Grid n) (hqC : q∉C)
    (hsep : ∀p∈C,¬specifiedPair Γ p q) : sourcePrice e Γ C q=1 := by
  apply sourcePrice_eq_one
  intro L hL hsp
  obtain ⟨p,hp⟩ := Finset.card_pos.mp hL.2
  obtain ⟨hpC,hpL⟩ := Finset.mem_inter.mp hp
  have hpq : p≠q := fun he=>hqC (he ▸ hpC)
  have hd := (specified_iff_designated Γ p L hpL).mp hsp
  rw [boardLine_eq L p q hpL hL.1 hpq] at hd
  exact hsep p hpC ((LineDrift.designated_iff Γ p q hpq).mp hd)

theorem source_term_le {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (q : Grid n) (mask retention : Grid n → ℝ) (B : ℝ) (ha : a.Valid B)
    (hstop : a.augmented.physical.process.stopped=false)
    (hC : C⊆a.augmented.physical.process.activeEvents) (hqC : q∉C)
    (hm : 0≤mask q) (hret : 0≤retention q) (hE : EmptyLineCredit a.augmented.physical)
    (hk : ∀K,sharedLine C q K→specified Γ K→a.augmented.physical.clocks K<2) :
    phaseRate a.augmented.physical.process mask a.augmented.physical.coordinates.1 q *
      (retention q*witnessProduct (D.erase q) a *
        correctedPhi Γ C L (augmentedBirthSnapshot a.augmented Γ q)) ≤
      (mask q*retention q/n)*sourcePrice a.augmented.physical Γ C q*
        mixed Γ (insert q C) (D.erase q) L a := by
  by_cases hq : q∈a.augmented.physical.process.activeEvents
  · let c := (mask q*retention q/n)*(witnessProduct (D.erase q) a*etaProduct L a.augmented.eta)
    have hc : 0≤c := mul_nonneg (div_nonneg (mul_nonneg hm hret) (Nat.cast_nonneg n))
      (mul_nonneg (witnessProduct_nonneg a (D.erase q) B ha)
        (etaProduct_nonneg L a.augmented.eta (fun p q=>(ha.1.2 p q).1)))
    have hh := mul_le_mul_of_nonneg_left
      (phi_source_le a.augmented.physical Γ C q B ha.1.1 hstop hq hC hqC hE hk) hc
    have hqa := (a.augmented.physical.process.mem_activeEvents q).mp hq
    unfold phaseRate
    rw [if_pos ⟨hstop,hqa⟩]
    calc
      _ = c*((a.augmented.physical.process.accounts q).weight*
          phi Γ C (birthSnapshot a.augmented.physical Γ q)) := by
        dsimp [c,correctedPhi,augmentedBirthSnapshot,ExtendedState.coordinates]
        ring
      _ ≤ c*(sourcePrice a.augmented.physical Γ C q*phi Γ (insert q C) a.augmented.physical) := hh
      _ = _ := by
        dsimp [c,mixed,correctedPhi]
        ring
  · have hqa := (a.augmented.physical.process.mem_activeEvents q).not.mp hq
    have hins : ¬insert q C⊆a.augmented.physical.process.activeEvents :=
      fun h=>hq (h (Finset.mem_insert_self q C))
    simp [phaseRate,hqa,mixed,correctedPhi,phi,hins]

theorem generator_le_s7 {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (ha : a.Valid B)
    (hstop : a.augmented.physical.process.stopped=false)
    (hC : C⊆a.augmented.physical.process.activeEvents) (hCL : C⊆L) (hCD : Disjoint C D)
    (hm : ∀p,0≤mask p) (hret : ∀q∈D,0≤retention q) (hE : EmptyLineCredit a.augmented.physical)
    (hk : ∀q∈D,∀K,sharedLine C q K→specified Γ K→a.augmented.physical.clocks K<2) :
    generator a Γ C D L mask retention≤
      ∑q∈D,(mask q*retention q/n)*sourcePrice a.augmented.physical Γ C q*
        mixed Γ (insert q C) (D.erase q) L a := by
  apply (generator_le_source a Γ C D L mask retention B ha hstop hC hCL hm).trans
  rw [sourceGenerator_eq_sum]
  apply Finset.sum_le_sum
  intro q hqD
  exact source_term_le a Γ C D L q mask retention B ha hstop hC
    (fun hqC=>Finset.disjoint_left.mp hCD hqC hqD) (hm q) (hret q hqD) hE (hk q hqD)

theorem generator_le_unit_source {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (ha : a.Valid B)
    (hstop : a.augmented.physical.process.stopped=false)
    (hC : C⊆a.augmented.physical.process.activeEvents) (hCL : C⊆L) (hCD : Disjoint C D)
    (hm : ∀p,0≤mask p) (hret : ∀q∈D,0≤retention q) (hE : EmptyLineCredit a.augmented.physical)
    (hsep : ∀q∈D,∀p∈C,¬specifiedPair Γ p q) :
    generator a Γ C D L mask retention≤
      ∑q∈D,(mask q*retention q/n)*mixed Γ (insert q C) (D.erase q) L a := by
  have hnone : ∀q∈D,∀K,sharedLine C q K→¬specified Γ K := by
    intro q hqD K hK hsp
    obtain ⟨p,hp⟩ := Finset.card_pos.mp hK.2
    obtain ⟨hpC,hpK⟩ := Finset.mem_inter.mp hp
    have hpq : p≠q := fun he=>Finset.disjoint_left.mp hCD hpC (he.symm ▸ hqD)
    have hd := (specified_iff_designated Γ p K hpK).mp hsp
    rw [boardLine_eq K p q hpK hK.1 hpq] at hd
    exact hsep q hqD p hpC ((LineDrift.designated_iff Γ p q hpq).mp hd)
  have hh := generator_le_s7 a Γ C D L mask retention B ha hstop hC hCL hCD hm hret hE
    (fun q hqD K hK hsp=>False.elim (hnone q hqD K hK hsp))
  convert hh using 1
  apply Finset.sum_congr rfl
  intro q hqD
  rw [sourcePrice_eq_one _ Γ C q (hnone q hqD),mul_one]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.generator_le_s7
#print axioms NoThreeLine.BirthWitness.generator_le_unit_source
