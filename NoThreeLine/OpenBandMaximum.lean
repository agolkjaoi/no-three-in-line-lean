import Mathlib.Tactic

/-! A finite open-band maximum covers every real transverse coordinate.
Band endpoints and points outside the band family contribute zero. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators Classical
namespace NoThreeLine.CapacityAxis

def openBand16 (j : Fin 16) (y : ℝ) : Prop :=
  (j.val:ℝ)/16<y ∧ y<((j.val:ℝ)+1)/16

theorem openBand16_unique (i j : Fin 16) (y : ℝ)
    (hi : openBand16 i y) (hj : openBand16 j y) : i=j := by
  have hi0 := (div_lt_iff₀ (by norm_num : (0:ℝ)<16)).mp hi.1
  have hi1 := (lt_div_iff₀ (by norm_num : (0:ℝ)<16)).mp hi.2
  have hj0 := (div_lt_iff₀ (by norm_num : (0:ℝ)<16)).mp hj.1
  have hj1 := (lt_div_iff₀ (by norm_num : (0:ℝ)<16)).mp hj.2
  have hij : i.val < j.val+1 := by exact_mod_cast (show (i.val:ℝ) < (j.val:ℝ)+1 by linarith)
  have hji : j.val < i.val+1 := by exact_mod_cast (show (j.val:ℝ) < (i.val:ℝ)+1 by linarith)
  apply Fin.ext
  omega

theorem openBand16_sum_le {ι : Type*} (S : Finset ι) (slot : ι→Fin 16)
    (v : ι→ℝ) (U : ℝ) (hU : 0≤U)
    (hband : ∀ j : Fin 16, (∑ i∈S, if slot i=j then v i else 0)≤U) (y : ℝ) :
    (∑ i∈S, if openBand16 (slot i) y then v i else 0)≤U := by
  classical
  have he : (∑ i∈S, if openBand16 (slot i) y then v i else 0) =
      ∑ j : Fin 16, if openBand16 j y then (∑ i∈S, if slot i=j then v i else 0) else 0 := by
    calc
      _ = ∑ i∈S, ∑ j : Fin 16,
          if openBand16 j y then (if slot i=j then v i else 0) else 0 := by
        apply Finset.sum_congr rfl
        intro i _
        symm
        rw [Finset.sum_eq_single (slot i)]
        · simp
        · intro j _ hj
          have hij : slot i≠j := Ne.symm hj
          simp [hij]
        · simp
      _ = ∑ j : Fin 16, ∑ i∈S,
          if openBand16 j y then (if slot i=j then v i else 0) else 0 := Finset.sum_comm
      _ = _ := by
        apply Finset.sum_congr rfl
        intro j _
        by_cases hj : openBand16 j y <;> simp [hj]
  rw [he]
  by_cases hex : ∃ j : Fin 16, openBand16 j y
  · obtain ⟨j,hj⟩ := hex
    rw [Finset.sum_eq_single j]
    · simpa [hj] using hband j
    · intro k _ hk
      have hn : ¬openBand16 k y := fun h=>hk (openBand16_unique k j y h hj)
      simp [hn]
    · simp
  · have hn : ∀ j : Fin 16, ¬openBand16 j y := by simpa only [not_exists] using hex
    calc
      _ = 0 := Finset.sum_eq_zero (fun j _=>by rw [if_neg (hn j)])
      _ ≤ U := hU

end NoThreeLine.CapacityAxis
#print axioms NoThreeLine.CapacityAxis.openBand16_sum_le
