import NoThreeLine.PrimitiveLines
import NoThreeLine.BirthCredit

/-! Actual finite sets of collinear board points. Directions are converted
to sets before summation, so repeated or opposite specified directions cannot
create repeated line charges. -/
set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine.GridLines
open PrimitiveLines

def lineThrough {n : ℕ} (p q : Grid n) : Finset (Grid n) := by
  classical
  exact Finset.univ.filter (fun r => orientedArea p q r=0)

theorem mem_lineThrough {n : ℕ} (p q r : Grid n) :
    r ∈ lineThrough p q ↔ orientedArea p q r=0 := by simp [lineThrough]

theorem left_mem_lineThrough {n : ℕ} (p q : Grid n) : p ∈ lineThrough p q := by
  simp [mem_lineThrough, orientedArea]

theorem right_mem_lineThrough {n : ℕ} (p q : Grid n) : q ∈ lineThrough p q := by
  simp [mem_lineThrough, orientedArea]
  ring

theorem det_swap (d v : ZPoint) : det d v = -det v d := by
  dsimp [det]
  ring

theorem det_parallel_trans (d v w : ZPoint) (hd : d≠(0,0))
    (hv : det d v=0) (hw : det d w=0) : det v w=0 := by
  by_cases hx : d.1=0
  · have hy : d.2≠0 := by
      intro he
      apply hd
      exact Prod.ext hx he
    have he : d.2*det v w=0 := by
      dsimp [det] at *
      linear_combination v.2*hw-w.2*hv
    exact (mul_eq_zero.mp he).resolve_left hy
  · have he : d.1*det v w=0 := by
      dsimp [det] at *
      linear_combination v.1*hw-w.1*hv
    exact (mul_eq_zero.mp he).resolve_left hx

theorem det_parallel_iff (d v w : ZPoint) (hd : d≠(0,0)) (hv : v≠(0,0))
    (h : det d v=0) : det d w=0 ↔ det v w=0 := by
  constructor
  · exact det_parallel_trans d v w hd h
  · intro hw
    apply det_parallel_trans v d w hv _ hw
    rw [det_swap, h, neg_zero]

theorem grid_difference_ne_zero {n : ℕ} (p q : Grid n) (hpq : p≠q) :
    gridEmbed q-gridEmbed p ≠ (0,0) := by
  intro he
  have he' : gridEmbed q-gridEmbed p=0 := he
  have heq := gridEmbed_injective n (sub_eq_zero.mp he')
  exact hpq heq.symm

/-- Replacing the second point by any other non-root point on the line does
not change the actual finite line set. -/
theorem lineThrough_eq_of_mem {n : ℕ} (p q r : Grid n)
    (hpq : p≠q) (hpr : p≠r) (hr : r ∈ lineThrough p q) :
    lineThrough p q=lineThrough p r := by
  apply Finset.ext
  intro z
  simp only [mem_lineThrough, orientedArea_eq_det]
  apply det_parallel_iff _ _ _ (grid_difference_ne_zero p q hpq)
    (grid_difference_ne_zero p r hpr)
  exact (orientedArea_eq_det p q r) ▸ ((mem_lineThrough p q r).mp hr)

def linesThrough {n : ℕ} (p : Grid n) : Finset (Finset (Grid n)) := by
  classical
  exact (Finset.univ.erase p).image (fun q => lineThrough p q)

theorem lineThrough_mem_linesThrough {n : ℕ} (p q : Grid n) (hpq : p≠q) :
    lineThrough p q ∈ linesThrough p := by
  classical
  exact Finset.mem_image.mpr ⟨q, by simp [hpq.symm], rfl⟩

theorem line_unique {n : ℕ} (p q : Grid n) (hpq : p≠q) (L : Finset (Grid n))
    (hL : L ∈ linesThrough p) (hq : q ∈ L) : L=lineThrough p q := by
  classical
  obtain ⟨r,hr,rfl⟩ := Finset.mem_image.mp hL
  have hpr : p≠r := fun he => (Finset.mem_erase.mp hr).1 he.symm
  exact lineThrough_eq_of_mem p r q hpr hpq hq

theorem distinct_lines_intersect_only_root {n : ℕ} (p : Grid n) (L K : Finset (Grid n))
    (hL : L∈linesThrough p) (hK : K∈linesThrough p) (hLK : L≠K)
    (q : Grid n) (hqL : q∈L) (hqK : q∈K) : q=p := by
  by_contra hpq
  have heL := line_unique p q (fun he => hpq he.symm) L hL hqL
  have heK := line_unique p q (fun he => hpq he.symm) K hK hqK
  exact hLK (heL.trans heK.symm)

def directionLine {n : ℕ} (p : Grid n) (d : ZPoint) : Finset (Grid n) :=
  gridLinePoints n (gridEmbed p) d

theorem directionLine_eq_lineThrough {n : ℕ} (p q : Grid n) (d : ZPoint)
    (hd : d≠(0,0)) (hpq : p≠q) (hq : q∈directionLine p d) :
    directionLine p d=lineThrough p q := by
  apply Finset.ext
  intro z
  simp only [directionLine, mem_gridLinePoints, mem_lineThrough, orientedArea_eq_det]
  exact det_parallel_iff d (gridEmbed q-gridEmbed p) _ hd
    (grid_difference_ne_zero p q hpq) ((mem_gridLinePoints _ _ _).mp hq)

def specifiedLines {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) : Finset (Finset (Grid n)) := by
  classical
  exact (Γ.filter (fun d => d≠(0,0))).image (directionLine p)

theorem specifiedPair_iff_directionLine {n : ℕ} (Γ : Finset ZPoint) (p q : Grid n) :
    specifiedPair Γ p q ↔ ∃ d∈Γ, d≠(0,0) ∧ q∈directionLine p d := by
  change (∃ d∈Γ, d≠(0,0) ∧ det (gridEmbed q-gridEmbed p) d=0) ↔ _
  simp only [directionLine, mem_gridLinePoints,
    det_swap (gridEmbed q-gridEmbed p), neg_eq_zero]

theorem specifiedPair_iff_line_mem {n : ℕ} (Γ : Finset ZPoint) (p q : Grid n)
    (hpq : p≠q) : specifiedPair Γ p q ↔ lineThrough p q ∈ specifiedLines Γ p := by
  classical
  rw [specifiedPair_iff_directionLine]
  constructor
  · rintro ⟨d,hd,hne,hq⟩
    apply Finset.mem_image.mpr
    exact ⟨d, Finset.mem_filter.mpr ⟨hd,hne⟩,
      directionLine_eq_lineThrough p q d hne hpq hq⟩
  · intro hL
    obtain ⟨d,hd,he⟩ := Finset.mem_image.mp hL
    refine ⟨d,(Finset.mem_filter.mp hd).1,(Finset.mem_filter.mp hd).2,?_⟩
    rw [he]
    exact right_mem_lineThrough p q

theorem specifiedLine_unique {n : ℕ} (Γ : Finset ZPoint) (p q : Grid n)
    (hpq : p≠q) (L : Finset (Grid n)) (hL : L∈specifiedLines Γ p) (hq : q∈L) :
    L=lineThrough p q := by
  obtain ⟨d,hd,rfl⟩ := Finset.mem_image.mp hL
  exact directionLine_eq_lineThrough p q d (Finset.mem_filter.mp hd).2 hpq hq

theorem root_mem_specifiedLine {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (L : Finset (Grid n)) (hL : L∈specifiedLines Γ p) : p∈L := by
  obtain ⟨d,_,rfl⟩ := Finset.mem_image.mp hL
  exact root_mem_gridLine p d

theorem selected_directionLine_unique {n : ℕ} (s : Finset (Grid n)) (p : Grid n)
    (hp : SafeCandidate s p) (d : ZPoint) (hd : d≠(0,0))
    (q r : Grid n) (hq : q∈s) (hr : r∈s)
    (hqL : q∈directionLine p d) (hrL : r∈directionLine p d) : q=r := by
  by_contra hqr
  have he := det_parallel_trans d (gridEmbed q-gridEmbed p) (gridEmbed r-gridEmbed p)
    hd ((mem_gridLinePoints _ _ _).mp hqL) ((mem_gridLinePoints _ _ _).mp hrL)
  have ha : orientedArea q r p=0 := by
    rw [← orientedArea_cycle p q r, orientedArea_eq_det]
    exact he
  exact hp.2 q hq r hr hqr ha

theorem selected_specifiedLine_card_le_one {n : ℕ} (Γ : Finset ZPoint)
    (s : Finset (Grid n)) (p : Grid n) (hp : SafeCandidate s p)
    (L : Finset (Grid n)) (hL : L∈specifiedLines Γ p) : (s∩L).card ≤ 1 := by
  obtain ⟨d,hd,rfl⟩ := Finset.mem_image.mp hL
  apply Finset.card_le_one.mpr
  intro q hq r hr
  exact selected_directionLine_unique s p hp d (Finset.mem_filter.mp hd).2 q r
    (Finset.mem_inter.mp hq).1 (Finset.mem_inter.mp hr).1
    (Finset.mem_inter.mp hq).2 (Finset.mem_inter.mp hr).2

end NoThreeLine.GridLines

#print axioms NoThreeLine.GridLines.lineThrough_eq_of_mem
#print axioms NoThreeLine.GridLines.line_unique
#print axioms NoThreeLine.GridLines.specifiedPair_iff_line_mem
#print axioms NoThreeLine.GridLines.selected_specifiedLine_card_le_one
