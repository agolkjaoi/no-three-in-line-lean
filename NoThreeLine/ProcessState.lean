import NoThreeLine.BirthCredit

/-! Common finite state and actual ordered updates for the stopped process.
This is the deterministic state kernel; a continuous-time law is not asserted. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine

structure ProcessState (n : ℕ) where
  selected : Finset (Grid n)
  accounts : Grid n → CreditAccount
  stopped : Bool

def ProcessState.Valid {n : ℕ} (s : ProcessState n) : Prop :=
  NoThree s.selected ∧
  (∀ p, (s.accounts p).status = .active → SafeCandidate s.selected p) ∧
  (∀ p, 0 ≤ (s.accounts p).weight)

def ProcessState.initial (n : ℕ) : ProcessState n :=
  ⟨∅, fun _ => ⟨.active,1⟩, false⟩

theorem ProcessState.initial_valid (n : ℕ) : (ProcessState.initial n).Valid := by
  refine ⟨noThree_empty n, ?_, ?_⟩
  · intro p _
    simp [initial,SafeCandidate]
  · intro p
    norm_num [initial]

def ProcessState.birth {n : ℕ} (s : ProcessState n) (Γ : Finset (ℤ × ℤ))
    (q : Grid n) (positive : Grid n → Bool) : ProcessState n :=
  if s.stopped = false ∧ (s.accounts q).status = .active then
    ⟨insert q s.selected,
      fun p => birthAccount Γ s.selected p q (s.accounts p) (positive p), false⟩
  else s

def ProcessState.retire {n : ℕ} (s : ProcessState n) (positive : Grid n → Bool) :
    ProcessState n :=
  ⟨s.selected, fun p => (s.accounts p).retire (positive p), s.stopped⟩

def ProcessState.stop {n : ℕ} (s : ProcessState n) : ProcessState n :=
  ⟨s.selected, fun p => (s.accounts p).retire true, true⟩

/-- A deterministic flow segment supplies multiplicative growth. Its ODE
construction and stopping times are separate from this state operation. -/
def ProcessState.grow {n : ℕ} (s : ProcessState n) (factor : Grid n → ℝ) :
    ProcessState n :=
  if s.stopped = false then
    ⟨s.selected, fun p => if (s.accounts p).status = .active then
      ⟨.active,factor p * (s.accounts p).weight⟩ else s.accounts p, false⟩
  else s

theorem CreditAccount.retire_active (a : CreditAccount) (positive : Bool)
    (h : (a.retire positive).status = .active) : a.status = .active := by
  unfold CreditAccount.retire at h
  split_ifs at h <;> simp_all

theorem CreditAccount.retire_weight (a : CreditAccount) (positive : Bool) :
    (a.retire positive).weight = a.weight := by
  unfold CreditAccount.retire
  split_ifs <;> rfl

theorem birthGeometry_active {n : ℕ} (Γ : Finset (ℤ × ℤ)) (s : Finset (Grid n))
    (p q : Grid n) (a : CreditAccount)
    (h : (birthGeometry Γ s p q a).status = .active) :
    a.status = .active ∧ p ≠ q ∧ ¬GeometricallyDead (insert q s) p := by
  unfold birthGeometry at h
  split_ifs at h <;> simp_all

theorem birthAccount_weight_nonneg {n : ℕ} (Γ : Finset (ℤ × ℤ))
    (s : Finset (Grid n)) (p q : Grid n) (a : CreditAccount) (positive : Bool)
    (ha : 0 ≤ a.weight) : 0 ≤ (birthAccount Γ s p q a positive).weight := by
  unfold birthAccount
  rw [CreditAccount.retire_weight]
  unfold birthGeometry
  split_ifs
  · exact le_rfl
  · exact le_rfl
  · exact mul_nonneg (birthMultiplier_bounds Γ s p q).1 ha
  · exact ha

theorem ProcessState.birth_valid {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q : Grid n) (positive : Grid n → Bool)
    (hs : s.Valid) : (s.birth Γ q positive).Valid := by
  unfold birth
  split_ifs with h
  · have hq := hs.2.1 q h.2
    refine ⟨noThree_insert_of_pair_test s.selected q hs.1 hq.2, ?_, ?_⟩
    · intro p hp
      have hg := CreditAccount.retire_active _ _ hp
      have hb := birthGeometry_active Γ s.selected p q (s.accounts p) hg
      have hpold := hs.2.1 p hb.1
      rw [safeCandidate_iff_not_dead]
      exact ⟨by simp [Finset.mem_insert,hb.2.1,hpold.1],hb.2.2⟩
    · intro p
      exact birthAccount_weight_nonneg Γ s.selected p q (s.accounts p) (positive p) (hs.2.2 p)
  · exact hs

theorem ProcessState.retire_valid {n : ℕ} (s : ProcessState n)
    (positive : Grid n → Bool) (hs : s.Valid) : (s.retire positive).Valid := by
  refine ⟨hs.1, ?_, ?_⟩
  · intro p hp
    exact hs.2.1 p (CreditAccount.retire_active _ _ hp)
  · intro p
    simpa [retire,CreditAccount.retire_weight] using hs.2.2 p

theorem ProcessState.stop_valid {n : ℕ} (s : ProcessState n) (hs : s.Valid) :
    s.stop.Valid := by
  exact s.retire_valid (fun _ => true) hs

theorem ProcessState.grow_valid {n : ℕ} (s : ProcessState n)
    (factor : Grid n → ℝ) (hf : ∀ p, 0 ≤ factor p) (hs : s.Valid) :
    (s.grow factor).Valid := by
  unfold grow
  split_ifs with hstop
  · refine ⟨hs.1, ?_, ?_⟩
    · intro p hp
      dsimp only at hp
      split_ifs at hp with ha
      · exact hs.2.1 p ha
      · exact hs.2.1 p hp
    · intro p
      dsimp only
      split_ifs
      · exact mul_nonneg (hf p) (hs.2.2 p)
      · exact hs.2.2 p
  · exact hs

theorem ProcessState.stop_credit {n : ℕ} (s : ProcessState n) (p : Grid n) :
    (s.stop.accounts p).credit = (s.accounts p).credit :=
  CreditAccount.retire_credit _ _

theorem ProcessState.birth_after_stop {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (q : Grid n) (positive : Grid n → Bool) :
    s.stop.birth Γ q positive = s.stop := by
  simp [birth,stop]

theorem ProcessState.grow_after_stop {n : ℕ} (s : ProcessState n)
    (factor : Grid n → ℝ) : s.stop.grow factor = s.stop := by
  simp [grow,stop]

end NoThreeLine

#print axioms NoThreeLine.ProcessState.birth_valid
#print axioms NoThreeLine.ProcessState.grow_valid
#print axioms NoThreeLine.ProcessState.stop_credit
