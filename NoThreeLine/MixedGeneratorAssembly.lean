import NoThreeLine.MixedDriftDecomposition
import NoThreeLine.MixedInternalCause

/-! The actual D-empty mixed finite generator: its continuous derivative
and actual pre-retirement birth jumps reduce to the S6 external generator.
The actual fixed-label pairRate pays its positive part. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.MixedConnection
open AuxiliaryODE PrimitiveLines BirthLineGroups GroupPairGenerator

def phiJumpGenerator {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (mask : Grid n → ℝ) : ℝ :=
  ∑ q : Grid n,phaseRate e.process mask e.coordinates.1 q *
    (phi Γ C (birthSnapshot e Γ q)-phi Γ C e)

def phiGenerator {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (mask : Grid n → ℝ) : ℝ :=
  phi Γ C e*phiGrowth e.process Γ C mask e.coordinates + phiJumpGenerator e Γ C mask

theorem phiGenerator_eq_external {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (mask : Grid n → ℝ) (hs : e.process.Valid)
    (hstop : e.process.stopped=false) (hC : C⊆e.process.activeEvents) :
    phiGenerator e Γ C mask=phi Γ C e * externalGroupGenerator e.process Γ mask e.coordinates C := by
  classical
  rw [phiGenerator,phiGrowth_sum_causes e.process Γ C mask e.coordinates hstop hC]
  unfold phiJumpGenerator externalGroupGenerator
  rw [Finset.mul_sum,← Finset.sum_add_distrib,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q _
  by_cases hq : q∈e.process.activeEvents
  · by_cases hqC : q∈C
    · rw [causeGrowth_internal e.process Γ C q hs hC hqC,phi_internal_birth e Γ C q hstop hq hqC,
        if_neg (by simp [hqC])]
      ring
    · rw [phi_external_birth e Γ C q hs hstop hq hC hqC,
        causeGrowth_external e.process Γ C q hs hC hq hqC,if_pos ⟨hq,hqC⟩]
      unfold groupCoefficient
      ring
  · have hqa : (e.process.accounts q).status≠.active := (e.process.mem_activeEvents q).not.mp hq
    simp [phaseRate,hqa,hq]

theorem lineConnection_nonneg {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (B : ℝ) (he : e.Valid B) (hC : C⊆e.process.activeEvents)
    (L : LineIndex n) : 0≤lineConnection Γ C e L := by
  unfold lineConnection
  split_ifs with hsp
  · by_cases hm : multiplicity C L≤1
    · simp [Nat.sub_eq_zero_of_le hm]
    · have hpos : 0<multiplicity C L := by omega
      obtain ⟨p,hp⟩ := Finset.card_pos.mp hpos
      obtain ⟨hpC,hpL⟩ := Finset.mem_inter.mp hp
      have hN := active_line_occupancy_le_one e.process p he.1 (hC hpC) L hpL
      have hNr : (occupancy e.process L:ℝ)≤1 := by exact_mod_cast hN
      apply pow_nonneg
      rw [protection,inv_div]
      exact div_nonneg (sub_nonneg.mpr (he.2.1.2.1 L).2) (by linarith)
  · exact pow_nonneg (he.2.1.2.2 L).1 _

theorem phi_nonneg {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (B : ℝ) (he : e.Valid B) : 0≤phi Γ C e := by
  unfold phi
  split_ifs with hC
  · apply mul_nonneg
    · exact Finset.prod_nonneg (fun p _=>he.1.2.2 p)
    · exact Finset.prod_nonneg (fun L _=>lineConnection_nonneg e Γ C B he hC L)
  · exact le_rfl

theorem phiGenerator_le_fixed_pairRate {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask : Grid n → ℝ) (B : ℝ) (he : e.Valid B)
    (hstop : e.process.stopped=false) (hC : C⊆e.process.activeEvents) (hCL : C⊆L)
    (hm : ∀ p,0≤mask p) :
    phiGenerator e Γ C mask ≤ phi Γ C e *
      ((∑ a∈L,∑ b∈L,pairRate e.process Γ mask e.coordinates a b)/2) := by
  rw [phiGenerator_eq_external e Γ C mask he.1 hstop hC]
  exact mul_le_mul_of_nonneg_left
    (externalGroupGenerator_le_fixed_label_pairRate e.process Γ mask e.coordinates C L hC hCL hm
      (fun p=>(he.2.1.1 p).1)) (phi_nonneg e Γ C B he)

theorem eta_corrected_phiGenerator_nonpos {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C L : Finset (Grid n)) (mask : Grid n → ℝ) (B : ℝ) (he : e.Valid B)
    (hstop : e.process.stopped=false) (hC : C⊆e.process.activeEvents) (hCL : C⊆L)
    (hm : ∀ p,0≤mask p) :
    phiGenerator e Γ C mask - phi Γ C e *
      ((∑ a∈L,∑ b∈L,pairRate e.process Γ mask e.coordinates a b)/2) ≤ 0 :=
  sub_nonpos.mpr (phiGenerator_le_fixed_pairRate e Γ C L mask B he hstop hC hCL hm)

end NoThreeLine.MixedConnection

#print axioms NoThreeLine.MixedConnection.phiGenerator_eq_external
#print axioms NoThreeLine.MixedConnection.phi_nonneg
#print axioms NoThreeLine.MixedConnection.eta_corrected_phiGenerator_nonpos
