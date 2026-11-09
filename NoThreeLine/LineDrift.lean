import NoThreeLine.GridLines
import NoThreeLine.ProcessGenerator

/-! The manuscript's S1 line grouping, derived from the actual local birth
factor and actual process state. Specified lines are sets, not direction
labels or a repeated sum over selected witnesses. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section

namespace NoThreeLine.LineDrift
open PrimitiveLines GridLines

/-- Only actual lines containing two board points are retained. -/
def designatedLines {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) : Finset (Finset (Grid n)) :=
  specifiedLines Γ p ∩ linesThrough p

def b (N : ℕ) : ℝ := 1/(2-(N:ℝ))

def lineRate {n : ℕ} (events : Finset (Grid n)) (rate : Grid n → ℝ)
    (L : Finset (Grid n)) : ℝ := ∑ q ∈ events, if q∈L then rate q else 0

def outsideHazard {n : ℕ} (Γ : Finset ZPoint) (s : Finset (Grid n)) (p : Grid n)
    (events : Finset (Grid n)) (rate : Grid n → ℝ) : ℝ :=
  ∑ q ∈ events.erase p, rate q *
    (if ¬specifiedPair Γ p q ∧ selectedWitness s p q then 1 else 0)

theorem designated_iff {n : ℕ} (Γ : Finset ZPoint) (p q : Grid n) (hpq : p≠q) :
    lineThrough p q∈designatedLines Γ p ↔ specifiedPair Γ p q := by
  simp only [designatedLines, Finset.mem_inter, lineThrough_mem_linesThrough p q hpq,
    and_true, ← specifiedPair_iff_line_mem Γ p q hpq]

theorem root_mem_designated {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (L : Finset (Grid n)) (hL : L∈designatedLines Γ p) : p∈L :=
  root_mem_specifiedLine Γ p L (Finset.mem_inter.mp hL).1

theorem designated_unique {n : ℕ} (Γ : Finset ZPoint) (p q : Grid n) (hpq : p≠q)
    (L : Finset (Grid n)) (hL : L∈designatedLines Γ p) (hq : q∈L) : L=lineThrough p q :=
  specifiedLine_unique Γ p q hpq L (Finset.mem_inter.mp hL).1 hq

theorem witness_iff_count_pos {n : ℕ} (s : Finset (Grid n)) (p q : Grid n) :
    selectedWitness s p q ↔ 0 < (s∩lineThrough p q).card := by
  rw [Finset.card_pos]
  simp only [selectedWitness, Finset.Nonempty, Finset.mem_inter, mem_lineThrough]

theorem specified_b_eq {n : ℕ} (Γ : Finset ZPoint) (s : Finset (Grid n)) (p q : Grid n)
    (hp : SafeCandidate s p) (hpq : p≠q) (hsp : specifiedPair Γ p q) :
    b (s∩lineThrough p q).card = if selectedWitness s p q then 1 else 1/2 := by
  have hc := selected_specifiedLine_card_le_one Γ s p hp (lineThrough p q)
    ((specifiedPair_iff_line_mem Γ p q hpq).mp hsp)
  by_cases hw : selectedWitness s p q
  · have hpos := (witness_iff_count_pos s p q).mp hw
    have he : (s∩lineThrough p q).card=1 := by omega
    norm_num [hw,he,b]
  · have hz : (s∩lineThrough p q).card=0 := by
      have hn := (witness_iff_count_pos s p q).not.mp hw
      omega
    norm_num [hw,hz,b]

theorem specified_factor_sum {n : ℕ} (Γ : Finset ZPoint) (s : Finset (Grid n))
    (p q : Grid n) (hpq : p≠q) :
    (∑ L ∈ designatedLines Γ p, if q∈L then b (s∩L).card else 0) =
      if specifiedPair Γ p q then b (s∩lineThrough p q).card else 0 := by
  classical
  by_cases hsp : specifiedPair Γ p q
  · rw [if_pos hsp, Finset.sum_eq_single (lineThrough p q)]
    · simp [right_mem_lineThrough]
    · intro L hL hne
      have hn : q∉L := fun hq => hne (designated_unique Γ p q hpq L hL hq)
      simp [hn]
    · intro hn
      exact False.elim (hn ((designated_iff Γ p q hpq).mpr hsp))
  · rw [if_neg hsp]
    apply Finset.sum_eq_zero
    intro L hL
    have hn : q∉L := by
      intro hq
      have he := designated_unique Γ p q hpq L hL hq
      rw [he] at hL
      exact hsp ((designated_iff Γ p q hpq).mp hL)
    simp [hn]

theorem localGrowthFactor_lines {n : ℕ} (Γ : Finset ZPoint) (s : Finset (Grid n))
    (p q : Grid n) (hp : SafeCandidate s p) (hpq : p≠q) :
    localGrowthFactor Γ s p q =
      (if ¬specifiedPair Γ p q ∧ selectedWitness s p q then 1 else 0) +
      ∑ L ∈ designatedLines Γ p, if q∈L then b (s∩L).card else 0 := by
  rw [specified_factor_sum Γ s p q hpq]
  by_cases hsp : specifiedPair Γ p q
  · rw [if_pos hsp, specified_b_eq Γ s p q hp hpq hsp]
    by_cases hw : selectedWitness s p q <;>
      norm_num [localGrowthFactor,hpq,hsp,hw]
  · by_cases hw : selectedWitness s p q <;>
      norm_num [localGrowthFactor,hpq,hsp,hw]

theorem lineRate_erase_root {n : ℕ} (events : Finset (Grid n)) (rate : Grid n → ℝ)
    (p : Grid n) (hp : p∈events) (L : Finset (Grid n)) (hpL : p∈L) :
    (∑ q ∈ events.erase p, if q∈L then rate q else 0) = lineRate events rate L-rate p := by
  have he := Finset.sum_erase_add events (fun q => if q∈L then rate q else 0) hp
  simp only [if_pos hpL] at he
  unfold lineRate
  linarith

/-- Frozen S1, before specializing the finite rates to the actual state. -/
theorem localGrowth_sum_S1 {n : ℕ} (Γ : Finset ZPoint) (s : Finset (Grid n))
    (p : Grid n) (events : Finset (Grid n)) (rate : Grid n → ℝ)
    (hp : SafeCandidate s p) (hpe : p∈events) :
    (∑ q ∈ events, rate q*localGrowthFactor Γ s p q) =
      rate p + outsideHazard Γ s p events rate +
      ∑ L ∈ designatedLines Γ p, (lineRate events rate L-rate p)*b (s∩L).card := by
  classical
  have hself := Finset.sum_erase_add events (fun q => rate q*localGrowthFactor Γ s p q) hpe
  have hl : localGrowthFactor Γ s p p=1 := by simp [localGrowthFactor]
  rw [hl,mul_one] at hself
  have hsplit : (∑ q ∈ events.erase p, rate q*localGrowthFactor Γ s p q) =
      outsideHazard Γ s p events rate +
      ∑ q ∈ events.erase p, rate q *
        ∑ L ∈ designatedLines Γ p, if q∈L then b (s∩L).card else 0 := by
    unfold outsideHazard
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro q hq
    have hpq : p≠q := fun he => (Finset.mem_erase.mp hq).1 he.symm
    rw [localGrowthFactor_lines Γ s p q hp hpq]
    ring
  have hgroup : (∑ q ∈ events.erase p, rate q *
        ∑ L ∈ designatedLines Γ p, if q∈L then b (s∩L).card else 0) =
      ∑ L ∈ designatedLines Γ p, (lineRate events rate L-rate p)*b (s∩L).card := by
    simp_rw [Finset.mul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro L hL
    rw [← lineRate_erase_root events rate p hpe L (root_mem_designated Γ p L hL),
      Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro q _
    by_cases hq : q∈L <;> simp [hq]
  rw [hgroup] at hsplit
  linarith

theorem lineRate_eq_inter {n : ℕ} (events : Finset (Grid n)) (rate : Grid n → ℝ)
    (L : Finset (Grid n)) : lineRate events rate L = ∑ q ∈ events∩L, rate q := by
  simp only [lineRate, ← Finset.sum_filter]
  congr 1

theorem state_lineRate {n : ℕ} (s : ProcessState n) (mask : Grid n → ℝ)
    (L : Finset (Grid n)) : lineRate s.activeEvents (s.birthRate mask) L =
      ∑ q ∈ L, s.birthRate mask q := by
  rw [lineRate_eq_inter]
  apply Finset.sum_subset Finset.inter_subset_right
  intro q hq hnot
  have ha : (s.accounts q).status ≠ .active := by
    intro he
    exact hnot (Finset.mem_inter.mpr ⟨(s.mem_activeEvents q).mpr he,hq⟩)
  simp [ProcessState.birthRate,ha]

/-- The self rate, H_p and every Lambda_line are the actual state's rates.
The state's validity supplies root safety and NoThree; the event set is not
an externally supplied collection of witnesses. -/
theorem state_localGrowth_S1 {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (p : Grid n) (hs : s.Valid)
    (hp : (s.accounts p).status=.active) :
    (∑ q ∈ s.activeEvents, s.birthRate mask q*localGrowthFactor Γ s.selected p q) =
      s.birthRate mask p + outsideHazard Γ s.selected p s.activeEvents (s.birthRate mask) +
      ∑ L ∈ designatedLines Γ p,
        ((∑ q ∈ L, s.birthRate mask q)-s.birthRate mask p)*b (s.selected∩L).card := by
  rw [localGrowth_sum_S1 Γ s.selected p s.activeEvents (s.birthRate mask)
    (hs.2.1 p hp) ((s.mem_activeEvents p).mpr hp)]
  simp_rw [state_lineRate]

theorem state_designated_count_le_one {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (p : Grid n) (hs : s.Valid) (hp : (s.accounts p).status=.active)
    (L : Finset (Grid n)) (hL : L∈designatedLines Γ p) : (s.selected∩L).card ≤ 1 :=
  selected_specifiedLine_card_le_one Γ s.selected p (hs.2.1 p hp) L
    (Finset.mem_inter.mp hL).1

theorem state_continuousDrift_S1 {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (p : Grid n) (hs : s.Valid) (hstop : s.stopped=false)
    (hp : (s.accounts p).status=.active) :
    s.continuousCreditDrift Γ (s.birthRate mask) p = (s.accounts p).weight *
      (s.birthRate mask p + outsideHazard Γ s.selected p s.activeEvents (s.birthRate mask) +
      ∑ L ∈ designatedLines Γ p,
        ((∑ q ∈ L, s.birthRate mask q)-s.birthRate mask p)*b (s.selected∩L).card) := by
  simp only [ProcessState.continuousCreditDrift,hstop,hp,and_self,if_true]
  rw [state_localGrowth_S1 s Γ mask p hs hp]

/-- S1 cancels the generator of the actual ordered birth operation. This is
still a finite-state algebraic identity, not a continuous-time martingale claim. -/
theorem state_S1_birth_generator {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (positive : Grid n → Grid n → Bool) (p : Grid n)
    (hs : s.Valid) (hstop : s.stopped=false) (hp : (s.accounts p).status=.active) :
    (s.accounts p).weight *
      (s.birthRate mask p + outsideHazard Γ s.selected p s.activeEvents (s.birthRate mask) +
      ∑ L ∈ designatedLines Γ p,
        ((∑ q ∈ L, s.birthRate mask q)-s.birthRate mask p)*b (s.selected∩L).card) +
      s.creditJumpGenerator Γ (s.birthRate mask) positive p = 0 := by
  rw [← state_continuousDrift_S1 s Γ mask p hs hstop hp]
  exact s.active_credit_generator Γ (s.birthRate mask) positive p hs hstop hp

end NoThreeLine.LineDrift

#print axioms NoThreeLine.LineDrift.localGrowth_sum_S1
#print axioms NoThreeLine.LineDrift.state_localGrowth_S1
#print axioms NoThreeLine.LineDrift.state_continuousDrift_S1
#print axioms NoThreeLine.LineDrift.state_S1_birth_generator
