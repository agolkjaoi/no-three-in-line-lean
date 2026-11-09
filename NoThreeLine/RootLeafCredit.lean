import NoThreeLine.SingletonWitnessCredit

/-! Removing exactly the distinguished root weight from a mixed observable.
Physical leaf weights and every connection factor remain in the point-law
observable. No division by a possibly zero credit is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct EtaMixedGenerator

def rootLeafPhi {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n)) (p : Grid n)
    (a : ExtendedState n) : ℝ :=
  if C⊆a.process.activeEvents then rootWeightProduct (C.erase p) a*connectionProduct Γ C a else 0

def rootLeafWitness {n : ℕ} (Γ : Finset ZPoint) (C D : Finset (Grid n)) (p : Grid n)
    (a : WitnessState n) : ℝ := witnessProduct D a*rootLeafPhi Γ C p a.augmented.physical

def correctedRootLeafWitness {n : ℕ} (Γ : Finset ZPoint) (C D L : Finset (Grid n))
    (p : Grid n) (a : WitnessState n) : ℝ := etaProduct L a.augmented.eta*rootLeafWitness Γ C D p a

theorem mixed_rootLeaf_credit {n : ℕ} (Γ : Finset ZPoint) (C D L : Finset (Grid n))
    (p : Grid n) (hp : p∈C) (a : WitnessState n) :
    mixed Γ C D L a=(a.augmented.physical.process.accounts p).credit*correctedRootLeafWitness Γ C D L p a := by
  classical
  unfold mixed correctedPhi phi correctedRootLeafWitness rootLeafWitness rootLeafPhi
  by_cases hC : C⊆a.augmented.physical.process.activeEvents
  · have hpa := (ProcessState.mem_activeEvents _ p).mp (hC hp)
    have hw := Finset.mul_prod_erase C (fun q=>(a.augmented.physical.process.accounts q).weight) hp
    rw [if_pos hC,if_pos hC,CreditAccount.credit,if_pos (Or.inl hpa)]
    unfold rootWeightProduct
    rw [←hw]
    ring
  · simp only [if_neg hC,mul_zero]

def rootLeafCap {n : ℕ} (C : Finset (Grid n)) (p : Grid n) (B : ℝ) : ℝ :=
  (max 1 B)^(C.erase p).card*∏K : LineIndex n,(2:ℝ)^(multiplicity C K-1)

theorem rootLeafCap_nonneg {n : ℕ} (C : Finset (Grid n)) (p : Grid n) (B : ℝ) :
    0≤rootLeafCap C p B := by unfold rootLeafCap; positivity

theorem rootLeafPhi_measurable {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n)) (p : Grid n) :
    Measurable (rootLeafPhi Γ C p) := by
  unfold rootLeafPhi rootWeightProduct connectionProduct
  apply Measurable.ite
  · exact ((measurable_of_countable (fun S : Finset (Grid n)=>C⊆S)).comp
      ((activeEvents_measurable n).comp (ExtendedState.measurable_process n))).setOf
  · exact (Finset.measurable_prod (C.erase p) (fun q _=>CreditAccount.measurable_weight.comp
      ((ProcessState.measurable_account n q).comp (ExtendedState.measurable_process n)))).mul
        (Finset.measurable_prod Finset.univ (fun K _=>lineConnection_measurable Γ C K))
  · exact measurable_const

theorem rootLeafWitness_measurable {n : ℕ} (Γ : Finset ZPoint) (C D : Finset (Grid n)) (p : Grid n) :
    Measurable (rootLeafWitness Γ C D p) :=
  (Finset.measurable_prod D (fun q _=>(measurable_pi_apply q).comp (WitnessState.measurable_retained n))).mul
    ((rootLeafPhi_measurable Γ C p).comp ((AugmentedState.measurable_physical n).comp
      (WitnessState.measurable_augmented n)))

theorem correctedRootLeafWitness_measurable {n : ℕ} (Γ : Finset ZPoint) (C D L : Finset (Grid n)) (p : Grid n) :
    Measurable (correctedRootLeafWitness Γ C D L p) :=
  ((etaProduct_measurable L).comp ((AugmentedState.measurable_eta n).comp
    (WitnessState.measurable_augmented n))).mul (rootLeafWitness_measurable Γ C D p)

theorem rootLeafPhi_bounds {n : ℕ} (Γ : Finset ZPoint) (C : Finset (Grid n)) (p : Grid n)
    (a : ExtendedState n) (B : ℝ) (ha : a.Valid B) :
    0≤rootLeafPhi Γ C p a ∧ rootLeafPhi Γ C p a≤rootLeafCap C p B := by
  classical
  unfold rootLeafPhi
  split_ifs with hC
  · have hc : 0≤connectionProduct Γ C a := Finset.prod_nonneg (fun K _=>lineConnection_nonneg a Γ C B ha hC K)
    have hw : 0≤rootWeightProduct (C.erase p) a := Finset.prod_nonneg (fun q _=>(ha.2.1.1 q).1)
    refine ⟨mul_nonneg hw hc,?_⟩
    apply mul_le_mul _ _ hc (pow_nonneg (le_trans (by norm_num) (le_max_left (1:ℝ) B)) _)
    · unfold rootWeightProduct
      calc _≤∏_q∈C.erase p,max 1 B := Finset.prod_le_prod
             (fun q _=>(ha.2.1.1 q).1) (fun q _=>(ha.2.1.1 q).2.trans (le_max_right _ _))
           _=(max 1 B)^(C.erase p).card := by simp
    · exact Finset.prod_le_prod (fun K _=>lineConnection_nonneg a Γ C B ha hC K)
        (fun K _=>lineConnection_le a Γ C B ha hC K)
  · exact ⟨le_rfl,rootLeafCap_nonneg C p B⟩

theorem rootLeafWitness_bounds {n : ℕ} (Γ : Finset ZPoint) (C D : Finset (Grid n)) (p : Grid n)
    (a : WitnessState n) (B : ℝ) (ha : a.Valid B) :
    0≤rootLeafWitness Γ C D p a ∧ rootLeafWitness Γ C D p a≤rootLeafCap C p B := by
  have hw0 := witnessProduct_nonneg a D B ha
  have hw1 : witnessProduct D a≤1 := Finset.prod_le_one (fun q _=>(ha.2.1 q).1) (fun q _=>(ha.2.1 q).2)
  have hh := rootLeafPhi_bounds Γ C p a.augmented.physical B ha.1.1
  exact ⟨mul_nonneg hw0 hh.1,(mul_le_mul_of_nonneg_right hw1 hh.1).trans (by simpa using hh.2)⟩

theorem correctedRootLeafWitness_bounds {n : ℕ} (Γ : Finset ZPoint) (C D L : Finset (Grid n))
    (p : Grid n) (a : WitnessState n) (B : ℝ) (ha : a.Valid B) :
    0≤correctedRootLeafWitness Γ C D L p a ∧ correctedRootLeafWitness Γ C D L p a≤rootLeafCap C p B := by
  have hη0 := etaProduct_nonneg L a.augmented.eta (fun q r=>(ha.1.2 q r).1)
  have hη1 : etaProduct L a.augmented.eta≤1 := Finset.prod_le_one
    (fun q _=>(ha.1.2 q.1 q.2).1) (fun q _=>(ha.1.2 q.1 q.2).2)
  have hh := rootLeafWitness_bounds Γ C D p a B ha
  exact ⟨mul_nonneg hη0 hh.1,(mul_le_mul_of_nonneg_right hη1 hh.1).trans (by simpa using hh.2)⟩

theorem rootLeafWitness_eta_floor {n : ℕ} (Γ : Finset ZPoint) (C D L : Finset (Grid n))
    (p : Grid n) (a : WitnessState n) (B ε : ℝ) (ha : a.Valid B) (hε : ε≤1)
    (hη : ∀q∈L,∀r∈L,q≠r→1-ε≤a.augmented.eta q r) :
    (1-ε)^L.card.choose 2*rootLeafWitness Γ C D p a≤correctedRootLeafWitness Γ C D L p a :=
  mul_le_mul_of_nonneg_right (etaProduct_floor L a.augmented.eta ε hε hη)
    (rootLeafWitness_bounds Γ C D p a B ha).1

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.mixed_rootLeaf_credit
#print axioms NoThreeLine.BirthWitness.rootLeafWitness_eta_floor
