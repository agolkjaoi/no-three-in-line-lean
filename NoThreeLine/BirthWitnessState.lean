import NoThreeLine.EtaMixedActualSegment

/-! Birth-witness observation data for the manuscript's fixed label set.
The recorded b_q is the deterministic retention e_q at its actual birth,
not the physical pre-birth weight w_q. The physical process is unchanged. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct EtaMixedGenerator

structure WitnessState (n : ℕ) where
  augmented : AugmentedState n
  retained : Grid n → ℝ

def WitnessState.Valid {n : ℕ} (a : WitnessState n) (B : ℝ) : Prop :=
  a.augmented.Valid B ∧ (∀p,0≤a.retained p ∧ a.retained p≤1) ∧
    ∀p,p∉a.augmented.physical.process.selected→a.retained p=0

def WitnessState.initial (n : ℕ) : WitnessState n := ⟨AugmentedState.initial n,fun _=>0⟩

theorem WitnessState.initial_valid (n : ℕ) (B : ℝ) (hB : 1≤B) : (WitnessState.initial n).Valid B :=
  ⟨AugmentedState.initial_valid n B hB,fun _=>⟨le_rfl,zero_le_one⟩,fun _ _=>rfl⟩

def WitnessState.birth {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint) (q : Grid n)
    (retention : Grid n → ℝ) : WitnessState n :=
  if a.augmented.physical.process.stopped=false ∧ q∈a.augmented.physical.process.activeEvents then
    ⟨augmentedBirthSnapshot a.augmented Γ q,Function.update a.retained q (retention q)⟩
  else a

theorem WitnessState.birth_augmented {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (q : Grid n) (retention : Grid n → ℝ) :
    (a.birth Γ q retention).augmented=augmentedBirthSnapshot a.augmented Γ q := by
  unfold WitnessState.birth
  split_ifs with h
  · rfl
  · have hf : ¬(a.augmented.physical.process.stopped=false ∧
        (a.augmented.physical.process.accounts q).status=.active) := by
      simpa only [ProcessState.mem_activeEvents] using h
    unfold augmentedBirthSnapshot birthSnapshot ExtendedState.birth ProcessState.birth
    rw [if_neg hf]

theorem WitnessState.birth_valid {n : ℕ} (a : WitnessState n) (B : ℝ) (ha : a.Valid B)
    (Γ : Finset ZPoint) (q : Grid n) (retention : Grid n → ℝ)
    (hret : 0≤retention q ∧ retention q≤1) : (a.birth Γ q retention).Valid B := by
  unfold WitnessState.birth
  split_ifs with h
  · refine ⟨⟨a.augmented.physical.birth_valid B ha.1.1 Γ q (fun _=>false),ha.1.2⟩,?_,?_⟩
    · intro p
      by_cases hpq : p=q
      · simpa [hpq] using hret
      · simpa only [Function.update_of_ne hpq] using ha.2.1 p
    · intro p hp
      change p∉(birthSnapshot a.augmented.physical Γ q).process.selected at hp
      rw [snapshot_selected a.augmented.physical Γ q h.1 h.2] at hp
      have hpq : p≠q := by
        intro he
        subst p
        exact hp (Finset.mem_insert_self q _)
      have hpS : p∉a.augmented.physical.process.selected := fun hm=>hp (Finset.mem_insert_of_mem hm)
      simp only [Function.update_of_ne hpq]
      exact ha.2.2 p hpS
  · exact ha

def witnessProduct {n : ℕ} (D : Finset (Grid n)) (a : WitnessState n) : ℝ := ∏p∈D,a.retained p

def mixed {n : ℕ} (Γ : Finset ZPoint) (C D L : Finset (Grid n)) (a : WitnessState n) : ℝ :=
  witnessProduct D a * correctedPhi Γ C L a.augmented

theorem mixed_empty {n : ℕ} (Γ : Finset ZPoint) (C L : Finset (Grid n)) (a : WitnessState n) :
    mixed Γ C ∅ L a=correctedPhi Γ C L a.augmented := by simp [mixed,witnessProduct]

theorem retained_active_zero {n : ℕ} (a : WitnessState n) (B : ℝ) (ha : a.Valid B)
    (q : Grid n) (hq : q∈a.augmented.physical.process.activeEvents) : a.retained q=0 :=
  ha.2.2 q (ha.1.1.1.2.1 q ((a.augmented.physical.process.mem_activeEvents q).mp hq)).1

theorem witnessProduct_active_zero {n : ℕ} (a : WitnessState n) (B : ℝ) (ha : a.Valid B)
    (D : Finset (Grid n)) (q : Grid n) (hq : q∈a.augmented.physical.process.activeEvents) (hqD : q∈D) :
    witnessProduct D a=0 := Finset.prod_eq_zero hqD (retained_active_zero a B ha q hq)

theorem witnessProduct_birth_outside {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (D : Finset (Grid n)) (q : Grid n) (retention : Grid n → ℝ) (hqD : q∉D) :
    witnessProduct D (a.birth Γ q retention)=witnessProduct D a := by
  unfold WitnessState.birth
  split_ifs
  · exact Finset.prod_update_of_notMem hqD a.retained (retention q)
  · rfl

theorem witnessProduct_birth_inside {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (D : Finset (Grid n)) (q : Grid n) (retention : Grid n → ℝ)
    (hstop : a.augmented.physical.process.stopped=false)
    (hq : q∈a.augmented.physical.process.activeEvents) (hqD : q∈D) :
    witnessProduct D (a.birth Γ q retention)=retention q*witnessProduct (D.erase q) a := by
  unfold WitnessState.birth
  rw [if_pos ⟨hstop,hq⟩]
  unfold witnessProduct
  simpa only [Finset.sdiff_singleton_eq_erase] using Finset.prod_update_of_mem hqD a.retained (retention q)

theorem mixed_birth_new_source {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (q : Grid n) (retention : Grid n → ℝ)
    (B : ℝ) (ha : a.Valid B) (hstop : a.augmented.physical.process.stopped=false)
    (hq : q∈a.augmented.physical.process.activeEvents) (hqD : q∈D) :
    mixed Γ C D L a=0 ∧ mixed Γ C D L (a.birth Γ q retention)=
      retention q*witnessProduct (D.erase q) a *
        correctedPhi Γ C L (augmentedBirthSnapshot a.augmented Γ q) := by
  constructor
  · rw [mixed,witnessProduct_active_zero a B ha D q hq hqD,zero_mul]
  · rw [mixed,witnessProduct_birth_inside a Γ D q retention hstop hq hqD,WitnessState.birth_augmented]

theorem mixed_birth_no_new_source {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (q : Grid n) (retention : Grid n → ℝ) (hqD : q∉D) :
    mixed Γ C D L (a.birth Γ q retention)=
      witnessProduct D a*correctedPhi Γ C L (augmentedBirthSnapshot a.augmented Γ q) := by
  rw [mixed,witnessProduct_birth_outside a Γ D q retention hqD,WitnessState.birth_augmented]

def continuousDrift {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask : Grid n → ℝ) : ℝ :=
  witnessProduct D a*correctedContinuousDrift a.augmented Γ C L mask

theorem mixed_flow_hasDerivAt {n : ℕ} (e : ExtendedState n) (b : Grid n → ℝ) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask : Grid n → ℝ) (z : ℝ → Coordinates n)
    (η : ℝ → EtaCoordinates n) (t : ℝ)
    (hd : HasDerivAt z (vectorField e.process Γ mask (z t)) t)
    (hη : HasDerivAt η (etaRHS e.process Γ mask (z t) (η t)) t) :
    HasDerivAt (fun u=>mixed Γ C D L ⟨⟨e.withCoordinates (z u),η u⟩,b⟩)
      (continuousDrift ⟨⟨e.withCoordinates (z t),η t⟩,b⟩ Γ C D L mask) t :=
  (correctedPhi_flow_hasDerivAt e Γ C L mask z η t hd hη).const_mul (∏p∈D,b p)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.WitnessState.birth_valid
#print axioms NoThreeLine.BirthWitness.mixed_birth_new_source
#print axioms NoThreeLine.BirthWitness.mixed_flow_hasDerivAt
