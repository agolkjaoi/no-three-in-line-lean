import NoThreeLine.WitnessSourceHierarchy
import NoThreeLine.BirthObservationSnapshot

/-! Actual uniform-mark and uniform-board mean of the S7 witness birth.
The total candidate rate n*B times its mean increment is exactly the actual
finite jumpGenerator; this is derived from acceptance, not postulated. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def thinnedWitness {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (B : ℝ) (q : Grid n) (retention : Grid n → ℝ) (mark : ℝ) : WitnessState n :=
  if mark≤a.augmented.physical.process.acceptance mask B q then a.birth Γ q retention else a

def candidateMixedMean {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) : ℝ :=
  (∑q : Grid n,∫mark,mixed Γ C D L (thinnedWitness a Γ mask B q retention mark) ∂markMeasure)/(n:ℝ)^2

theorem witness_mark_mean {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (hB : 0<B)
    (ha : a.Valid B) (hm : ∀q,0≤mask q ∧ mask q≤1) (q : Grid n) :
    (∫mark,mixed Γ C D L (thinnedWitness a Γ mask B q retention mark) ∂markMeasure)=
      a.augmented.physical.process.acceptance mask B q*mixed Γ C D L (a.birth Γ q retention)+
        (1-a.augmented.physical.process.acceptance mask B q)*mixed Γ C D L a := by
  have hα := a.augmented.physical.process.acceptance_bounds mask B hB hm
    (fun q _=>ha.1.1.2.1.1 q) q
  simpa only [thinnedWitness,apply_ite] using mark_integral_ite
    (a.augmented.physical.process.acceptance mask B q)
    (mixed Γ C D L (a.birth Γ q retention)) (mixed Γ C D L a) hα.1 hα.2

theorem candidateMixedMean_jump {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (hn : 0<n) (hB : 0<B)
    (ha : a.Valid B) (hm : ∀q,0≤mask q ∧ mask q≤1) :
    ((n:ℝ)*B)*(candidateMixedMean a Γ C D L mask retention B-mixed Γ C D L a)=
      jumpGenerator a Γ C D L mask retention := by
  have hsum : (∑q : Grid n,∫mark,mixed Γ C D L (thinnedWitness a Γ mask B q retention mark) ∂markMeasure)=
      (∑q : Grid n,a.augmented.physical.process.acceptance mask B q*
        (mixed Γ C D L (a.birth Γ q retention)-mixed Γ C D L a))+(n:ℝ)^2*mixed Γ C D L a := by
    simp_rw [witness_mark_mean a Γ C D L mask retention B hB ha hm]
    have hterm (q : Grid n) :
        a.augmented.physical.process.acceptance mask B q*mixed Γ C D L (a.birth Γ q retention)+
          (1-a.augmented.physical.process.acceptance mask B q)*mixed Γ C D L a=
        a.augmented.physical.process.acceptance mask B q*
          (mixed Γ C D L (a.birth Γ q retention)-mixed Γ C D L a)+mixed Γ C D L a := by ring
    simp_rw [hterm]
    rw [Finset.sum_add_distrib]
    simp only [Finset.sum_const,Finset.card_univ,Fintype.card_prod,Fintype.card_fin,nsmul_eq_mul,Nat.cast_mul,pow_two]
  have hrate (q : Grid n) :
      (B/n)*a.augmented.physical.process.acceptance mask B q=
        phaseRate a.augmented.physical.process mask a.augmented.physical.coordinates.1 q :=
    a.augmented.physical.process.candidate_rate_times_acceptance mask B hB.ne' q
  have hnr : (n:ℝ)≠0 := by exact_mod_cast Nat.ne_of_gt hn
  rw [candidateMixedMean,hsum]
  calc
    _ = (B/n)*∑q : Grid n,a.augmented.physical.process.acceptance mask B q*
        (mixed Γ C D L (a.birth Γ q retention)-mixed Γ C D L a) := by field_simp; ring
    _ = _ := by
      rw [Finset.mul_sum]
      unfold jumpGenerator
      apply Finset.sum_congr rfl
      intro q _
      rw [←mul_assoc,hrate]

theorem candidateMixedMean_generator {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (hn : 0<n) (hB : 0<B)
    (ha : a.Valid B) (hm : ∀q,0≤mask q ∧ mask q≤1) :
    continuousDrift a Γ C D L mask+((n:ℝ)*B)*
      (candidateMixedMean a Γ C D L mask retention B-mixed Γ C D L a)=
        generator a Γ C D L mask retention := by
  rw [candidateMixedMean_jump a Γ C D L mask retention B hn hB ha hm]
  rfl

theorem candidateMixedMean_s7 {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n → ℝ) (B : ℝ) (hn : 0<n) (hB : 0<B)
    (ha : a.Valid B) (hm : ∀q,0≤mask q ∧ mask q≤1)
    (hstop : a.augmented.physical.process.stopped=false)
    (hC : C⊆a.augmented.physical.process.activeEvents) (hCL : C⊆L) (hCD : Disjoint C D)
    (hret : ∀q∈D,0≤retention q) (hE : EmptyLineCredit a.augmented.physical)
    (hk : ∀q∈D,∀K,sharedLine C q K→specified Γ K→a.augmented.physical.clocks K<2) :
    continuousDrift a Γ C D L mask+((n:ℝ)*B)*
      (candidateMixedMean a Γ C D L mask retention B-mixed Γ C D L a)≤
        ∑q∈D,(mask q*retention q/n)*sourcePrice a.augmented.physical Γ C q*
          mixed Γ (insert q C) (D.erase q) L a := by
  rw [candidateMixedMean_generator a Γ C D L mask retention B hn hB ha hm]
  exact generator_le_s7 a Γ C D L mask retention B ha hstop hC hCL hCD (fun q=>(hm q).1) hret hE hk

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.candidateMixedMean_jump
#print axioms NoThreeLine.BirthWitness.candidateMixedMean_s7
