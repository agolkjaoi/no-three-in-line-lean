import NoThreeLine.FiniteSelection
import Mathlib.Tactic

/-! The local birth update is defined in the manuscript's order:
selection, geometric death, specified-line first-birth halving, positive
retirement. The compensation identity is derived from this update.
This module does not construct the continuous-time law or its compensator. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine

def specifiedPair {n : ℕ} (Γ : Finset (ℤ × ℤ)) (p q : Grid n) : Prop :=
  ∃ d ∈ Γ, d ≠ (0,0) ∧
    (((q.1.val : ℤ)-p.1.val)*d.2 - ((q.2.val : ℤ)-p.2.val)*d.1 = 0)

instance {n : ℕ} (Γ : Finset (ℤ × ℤ)) (p q : Grid n) :
    Decidable (specifiedPair Γ p q) := inferInstanceAs (Decidable
      (∃ d ∈ Γ, d ≠ (0,0) ∧
        (((q.1.val : ℤ)-p.1.val)*d.2 - ((q.2.val : ℤ)-p.2.val)*d.1 = 0)))

def selectedWitness {n : ℕ} (s : Finset (Grid n)) (p q : Grid n) : Prop :=
  ∃ r ∈ s, orientedArea p q r = 0

instance {n : ℕ} (s : Finset (Grid n)) (p q : Grid n) :
    Decidable (selectedWitness s p q) := inferInstanceAs
      (Decidable (∃ r ∈ s, orientedArea p q r = 0))

/-- For an active root, a new geometric death is exactly an old selected
witness on its line with the newborn. This is derived from determinants. -/
theorem geometric_death_after_birth_iff {n : ℕ} (s : Finset (Grid n)) (p q : Grid n)
    (hp : SafeCandidate s p) (hq : q ∉ s) (_hpq : p ≠ q) :
    GeometricallyDead (insert q s) p ↔ selectedWitness s p q := by
  constructor
  · rintro ⟨a,ha,b,hb,hab,hd⟩
    simp only [Finset.mem_insert] at ha hb
    rcases ha with ha | ha
    · subst a
      rcases hb with hb | hb
      · subst b
        exact (hab rfl).elim
      · refine ⟨b,hb,?_⟩
        rw [orientedArea_cycle p q b]
        exact hd
    · rcases hb with hb | hb
      · subst b
        refine ⟨a,ha,?_⟩
        have hz : orientedArea q a p = 0 := by
          rw [orientedArea_swap_first q a p, hd]
          ring
        rw [orientedArea_cycle p q a]
        exact hz
      · exact (hp.2 a ha b hb hab hd).elim
  · rintro ⟨r,hr,hd⟩
    refine ⟨q,Finset.mem_insert_self _ _,r,Finset.mem_insert_of_mem hr,?_,?_⟩
    · intro he
      exact hq (he ▸ hr)
    · rw [← orientedArea_cycle p q r]
      exact hd

inductive CreditStatus where
  | active | selected | dead | retired
  deriving DecidableEq, Repr

structure CreditAccount where
  status : CreditStatus
  weight : ℝ

def CreditAccount.credit (a : CreditAccount) : ℝ :=
  if a.status = .active ∨ a.status = .retired then a.weight else 0

/-- Positive retirement preserves the postgeometry credit, and only active
accounts may retire. A simultaneous geometric death cannot save a positive value. -/
def CreditAccount.retire (a : CreditAccount) (positive : Bool) : CreditAccount :=
  if a.status = .active ∧ positive = true then ⟨.retired,a.weight⟩ else a

theorem CreditAccount.retire_credit (a : CreditAccount) (positive : Bool) :
    (a.retire positive).credit = a.credit := by
  rcases a with ⟨status,w⟩
  cases status <;> cases positive <;> simp [CreditAccount.retire,CreditAccount.credit]

def birthMultiplier {n : ℕ} (Γ : Finset (ℤ × ℤ)) (s : Finset (Grid n))
    (p q : Grid n) : ℝ :=
  if p = q then 0
  else if GeometricallyDead (insert q s) p then 0
  else if specifiedPair Γ p q ∧ ¬selectedWitness s p q then 1/2
  else 1

def birthGeometry {n : ℕ} (Γ : Finset (ℤ × ℤ)) (s : Finset (Grid n))
    (p q : Grid n) (a : CreditAccount) : CreditAccount :=
  if a.status = .active then
    if p = q then ⟨.selected,0⟩
    else if GeometricallyDead (insert q s) p then ⟨.dead,0⟩
    else ⟨.active,birthMultiplier Γ s p q * a.weight⟩
  else a

def birthAccount {n : ℕ} (Γ : Finset (ℤ × ℤ)) (s : Finset (Grid n))
    (p q : Grid n) (a : CreditAccount) (positive : Bool) : CreditAccount :=
  (birthGeometry Γ s p q a).retire positive

theorem birthAccount_active_credit {n : ℕ} (Γ : Finset (ℤ × ℤ)) (s : Finset (Grid n))
    (p q : Grid n) (w : ℝ) (positive : Bool) :
    (birthAccount Γ s p q ⟨.active,w⟩ positive).credit = birthMultiplier Γ s p q * w := by
  unfold birthAccount
  rw [CreditAccount.retire_credit]
  unfold birthGeometry birthMultiplier
  split_ifs <;> simp_all [CreditAccount.credit]

theorem birthAccount_inactive_credit {n : ℕ} (Γ : Finset (ℤ × ℤ)) (s : Finset (Grid n))
    (p q : Grid n) (a : CreditAccount) (positive : Bool) (ha : a.status ≠ .active) :
    (birthAccount Γ s p q a positive).credit = a.credit := by
  unfold birthAccount
  rw [CreditAccount.retire_credit]
  simp only [birthGeometry, if_neg ha]

/-- The manuscript's local drift classification, before grouping by lines. -/
def localGrowthFactor {n : ℕ} (Γ : Finset (ℤ × ℤ)) (s : Finset (Grid n))
    (p q : Grid n) : ℝ :=
  if p = q then 1 else if selectedWitness s p q then 1
  else if specifiedPair Γ p q then 1/2 else 0

theorem growthFactor_eq_loss {n : ℕ} (Γ : Finset (ℤ × ℤ)) (s : Finset (Grid n))
    (p q : Grid n) (hp : SafeCandidate s p) (hq : q ∉ s) :
    localGrowthFactor Γ s p q = 1 - birthMultiplier Γ s p q := by
  by_cases hpq : p = q
  · simp [localGrowthFactor,birthMultiplier,hpq]
  · simp only [localGrowthFactor, if_neg hpq, birthMultiplier,
      geometric_death_after_birth_iff s p q hp hq hpq]
    by_cases hw : selectedWitness s p q
    · simp [hw]
    · by_cases hs : specifiedPair Γ p q <;> norm_num [hw,hs]

/-- Exact local cancellation, using the actual ordered birth/retirement update.
The existence of a stochastic law realizing these rates remains a separate task. -/
theorem birth_credit_compensation {n : ℕ} (Γ : Finset (ℤ × ℤ)) (s : Finset (Grid n))
    (p : Grid n) (events : Finset (Grid n)) (rate : Grid n → ℝ) (w : ℝ)
    (positive : Grid n → Bool) (hp : SafeCandidate s p) (hq : ∀ q ∈ events, q ∉ s) :
    w * (∑ q ∈ events, rate q * localGrowthFactor Γ s p q) +
      (∑ q ∈ events, rate q *
        ((birthAccount Γ s p q ⟨.active,w⟩ (positive q)).credit - w)) = 0 := by
  rw [Finset.mul_sum, ← Finset.sum_add_distrib]
  apply Finset.sum_eq_zero
  intro q hq'
  rw [birthAccount_active_credit, growthFactor_eq_loss Γ s p q hp (hq q hq')]
  ring

theorem birthMultiplier_bounds {n : ℕ} (Γ : Finset (ℤ × ℤ)) (s : Finset (Grid n))
    (p q : Grid n) : 0 ≤ birthMultiplier Γ s p q ∧ birthMultiplier Γ s p q ≤ 1 := by
  unfold birthMultiplier
  split_ifs <;> norm_num

/-- Height-four geometry: even a simultaneous positive-retirement flag saves zero. -/
theorem simultaneous_death_snapshot :
    (birthAccount ({(1,0)} : Finset (ℤ × ℤ)) ({(0,0)} : Finset (Grid 9))
      (8,2) (4,1) ⟨.active,1⟩ true).credit = 0 := by
  rw [birthAccount_active_credit]
  norm_num [birthMultiplier,GeometricallyDead,orientedArea]

/-- The first birth on a specified empty line halves the credit before it is saved. -/
theorem first_specified_birth_snapshot :
    (birthAccount ({(1,0)} : Finset (ℤ × ℤ)) (∅ : Finset (Grid 9))
      (2,0) (1,0) ⟨.active,1⟩ true).credit = 1/2 := by
  rw [birthAccount_active_credit]
  norm_num [birthMultiplier,GeometricallyDead,specifiedPair,selectedWitness,orientedArea] <;> decide

theorem previously_saved_credit_unchanged :
    (birthAccount ({(1,0)} : Finset (ℤ × ℤ)) ({(0,0)} : Finset (Grid 9))
      (8,2) (4,1) ⟨.retired,1⟩ true).credit = 1 := by
  rw [birthAccount_inactive_credit _ _ _ _ _ _ (by decide)]
  simp [CreditAccount.credit]

end NoThreeLine

#print axioms NoThreeLine.geometric_death_after_birth_iff
#print axioms NoThreeLine.birthAccount_active_credit
#print axioms NoThreeLine.birth_credit_compensation
#print axioms NoThreeLine.simultaneous_death_snapshot
#print axioms NoThreeLine.first_specified_birth_snapshot
