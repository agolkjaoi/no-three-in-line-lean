import NoThreeLine.BirthWitnessState

/-! Exact local generator decomposition for nonempty birth-witness labels.
Only births at q in D create a source. The retention value is e_q(t),
distinct from the physical weight in the actual phaseRate. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct EtaMixedGenerator

def jumpGenerator {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) : ℝ :=
  ∑q : Grid n,phaseRate a.augmented.physical.process mask a.augmented.physical.coordinates.1 q *
    (mixed Γ C D L (a.birth Γ q retention)-mixed Γ C D L a)

def generator {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) : ℝ :=
  continuousDrift a Γ C D L mask+jumpGenerator a Γ C D L mask retention

def sourceGenerator {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) : ℝ :=
  ∑q : Grid n,if q∈D then
    phaseRate a.augmented.physical.process mask a.augmented.physical.coordinates.1 q *
      (retention q*witnessProduct (D.erase q) a *
        correctedPhi Γ C L (augmentedBirthSnapshot a.augmented Γ q)) else 0

theorem sourceGenerator_eq_sum {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) :
    sourceGenerator a Γ C D L mask retention=
      ∑q∈D,phaseRate a.augmented.physical.process mask a.augmented.physical.coordinates.1 q *
        (retention q*witnessProduct (D.erase q) a *
          correctedPhi Γ C L (augmentedBirthSnapshot a.augmented Γ q)) := by
  simp [sourceGenerator]

theorem jumpGenerator_eq {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (ha : a.Valid B)
    (hstop : a.augmented.physical.process.stopped=false) :
    jumpGenerator a Γ C D L mask retention=
      witnessProduct D a*correctedJumpGenerator a.augmented Γ C L mask+
        sourceGenerator a Γ C D L mask retention := by
  unfold jumpGenerator correctedJumpGenerator sourceGenerator
  rw [Finset.mul_sum,←Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro q _
  by_cases hq : q∈a.augmented.physical.process.activeEvents
  · by_cases hqD : q∈D
    · have hzero := witnessProduct_active_zero a B ha D q hq hqD
      have hnew := mixed_birth_new_source a Γ C D L q retention B ha hstop hq hqD
      rw [hnew.1,hnew.2,hzero,if_pos hqD]
      ring
    · rw [mixed_birth_no_new_source a Γ C D L q retention hqD,if_neg hqD]
      unfold mixed
      ring
  · have hqa : (a.augmented.physical.process.accounts q).status≠.active :=
      (a.augmented.physical.process.mem_activeEvents q).not.mp hq
    simp [phaseRate,hqa]

theorem generator_eq {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (ha : a.Valid B)
    (hstop : a.augmented.physical.process.stopped=false) :
    generator a Γ C D L mask retention=
      witnessProduct D a*correctedGenerator a.augmented Γ C L mask+
        sourceGenerator a Γ C D L mask retention := by
  rw [generator,jumpGenerator_eq a Γ C D L mask retention B ha hstop]
  unfold continuousDrift correctedGenerator
  ring

theorem witnessProduct_nonneg {n : ℕ} (a : WitnessState n) (D : Finset (Grid n))
    (B : ℝ) (ha : a.Valid B) : 0≤witnessProduct D a :=
  Finset.prod_nonneg (fun p _=>(ha.2.1 p).1)

theorem generator_le_source {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (ha : a.Valid B)
    (hstop : a.augmented.physical.process.stopped=false)
    (hC : C⊆a.augmented.physical.process.activeEvents) (hCL : C⊆L) (hm : ∀p,0≤mask p) :
    generator a Γ C D L mask retention≤sourceGenerator a Γ C D L mask retention := by
  rw [generator_eq a Γ C D L mask retention B ha hstop]
  exact add_le_of_nonpos_left (mul_nonpos_of_nonneg_of_nonpos (witnessProduct_nonneg a D B ha)
    (correctedGenerator_nonpos a.augmented Γ C L mask B ha.1 hstop hC hCL hm))

theorem sourceGenerator_empty {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask retention : Grid n → ℝ) :
    sourceGenerator a Γ C ∅ L mask retention=0 := by simp [sourceGenerator]

theorem generator_empty {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (ha : a.Valid B)
    (hstop : a.augmented.physical.process.stopped=false) :
    generator a Γ C ∅ L mask retention=correctedGenerator a.augmented Γ C L mask := by
  rw [generator_eq a Γ C ∅ L mask retention B ha hstop,sourceGenerator_empty]
  simp [witnessProduct]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.generator_eq
#print axioms NoThreeLine.BirthWitness.generator_le_source
