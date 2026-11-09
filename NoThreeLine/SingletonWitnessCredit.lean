import NoThreeLine.WitnessObservableBounds
import NoThreeLine.CreditLossRate

/-! A singleton active root has no line-connection factors. Its mixed
observable is saved credit times the active-root witness observable. The
active indicator is essential: retired credit need not vanish. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct EtaMixedGenerator

theorem singleton_lineConnection {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (a : ExtendedState n) (K : LineIndex n) : lineConnection Γ {p} a K=1 := by
  have hm : multiplicity {p} K≤1 := by
    exact (Finset.card_le_card (Finset.inter_subset_left)).trans (by simp)
  simp only [lineConnection,Nat.sub_eq_zero_of_le hm,pow_zero,ite_self]

theorem singleton_phi {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (a : ExtendedState n) :
    phi Γ {p} a=(a.process.accounts p).activeCredit := by
  simp only [phi,Finset.singleton_subset_iff,ProcessState.mem_activeEvents,rootWeightProduct,
    Finset.prod_singleton,connectionProduct,singleton_lineConnection,Finset.prod_const_one,mul_one,
    CreditAccount.activeCredit]

def activeWitness {n : ℕ} (D : Finset (Grid n)) (p : Grid n) (a : WitnessState n) : ℝ :=
  if (a.augmented.physical.process.accounts p).status=.active then witnessProduct D a else 0

def correctedActiveWitness {n : ℕ} (D L : Finset (Grid n)) (p : Grid n) (a : WitnessState n) : ℝ :=
  etaProduct L a.augmented.eta*activeWitness D p a

theorem singleton_mixed_credit {n : ℕ} (Γ : Finset ZPoint) (D L : Finset (Grid n))
    (p : Grid n) (a : WitnessState n) :
    mixed Γ {p} D L a=(a.augmented.physical.process.accounts p).credit*correctedActiveWitness D L p a := by
  rw [mixed,correctedPhi,singleton_phi]
  unfold correctedActiveWitness activeWitness CreditAccount.activeCredit CreditAccount.credit
  split_ifs <;> simp_all <;> ring

theorem activeWitness_measurable {n : ℕ} (D : Finset (Grid n)) (p : Grid n) :
    Measurable (activeWitness D p) := by
  apply Measurable.ite
  · exact ((CreditAccount.measurable_status.comp ((ProcessState.measurable_account n p).comp
      ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
        (WitnessState.measurable_augmented n))))).eq measurable_const).setOf
  · exact Finset.measurable_prod _ (fun q _=>(measurable_pi_apply q).comp (WitnessState.measurable_retained n))
  · exact measurable_const

theorem correctedActiveWitness_measurable {n : ℕ} (D L : Finset (Grid n)) (p : Grid n) :
    Measurable (correctedActiveWitness D L p) :=
  ((etaProduct_measurable L).comp ((AugmentedState.measurable_eta n).comp
    (WitnessState.measurable_augmented n))).mul (activeWitness_measurable D p)

theorem activeWitness_bounds {n : ℕ} (D : Finset (Grid n)) (p : Grid n)
    (a : WitnessState n) (B : ℝ) (ha : a.Valid B) :
    0≤activeWitness D p a ∧ activeWitness D p a≤1 := by
  unfold activeWitness
  split_ifs
  · exact ⟨witnessProduct_nonneg a D B ha,
      Finset.prod_le_one (fun q _=>(ha.2.1 q).1) (fun q _=>(ha.2.1 q).2)⟩
  · exact ⟨le_rfl,zero_le_one⟩

theorem correctedActiveWitness_bounds {n : ℕ} (D L : Finset (Grid n)) (p : Grid n)
    (a : WitnessState n) (B : ℝ) (ha : a.Valid B) :
    0≤correctedActiveWitness D L p a ∧ correctedActiveWitness D L p a≤1 := by
  have hη0 := etaProduct_nonneg L a.augmented.eta (fun q r=>(ha.1.2 q r).1)
  have hη1 : etaProduct L a.augmented.eta≤1 := Finset.prod_le_one
    (fun q _=>(ha.1.2 q.1 q.2).1) (fun q _=>(ha.1.2 q.1 q.2).2)
  have hw := activeWitness_bounds D p a B ha
  exact ⟨mul_nonneg hη0 hw.1,mul_le_one₀ hη1 hw.1 hw.2⟩

theorem activeWitness_eta_floor {n : ℕ} (D L : Finset (Grid n)) (p : Grid n)
    (a : WitnessState n) (B ε : ℝ) (ha : a.Valid B) (hε : ε≤1)
    (hη : ∀q∈L,∀r∈L,q≠r→1-ε≤a.augmented.eta q r) :
    (1-ε)^L.card.choose 2*activeWitness D p a≤correctedActiveWitness D L p a :=
  mul_le_mul_of_nonneg_right (etaProduct_floor L a.augmented.eta ε hε hη)
    (activeWitness_bounds D p a B ha).1

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.singleton_mixed_credit
#print axioms NoThreeLine.BirthWitness.correctedActiveWitness_bounds
#print axioms NoThreeLine.BirthWitness.activeWitness_eta_floor
