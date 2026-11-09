import NoThreeLine.FinitePairPointRestriction
import NoThreeLine.ScheduledCutStarExceptions

/-! Exception (iii) candidates are actual board points outside every
tuple label, on an actual short connecting leaf line. Selection is separate. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines FiniteTuplePattern

def extraCandidates {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) (m : ℕ) :
    Finset ((Fin m→↥(shortStars Γ p H))×Grid n) := by
  classical
  exact Finset.univ.filter (fun fv=>RootLinePairwise fv.1 ∧
    fv.2∉insert p (leafLabels fv.1∪witnessLabels fv.1) ∧
    ∃i j : Fin m,i≠j ∧ (((fv.1 i).val,(fv.1 j).val),fv.2)∈freshExtraPointTriples Γ p H R)

theorem extraCandidates_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (hR : 0≤R) (m : ℕ) :
    ((extraCandidates Γ p H R m).card : ℝ)≤
      ((m*(m-1) : ℕ) : ℝ)*(((shortStars Γ p H).card : ℝ)^2*R*
        ((shortStars Γ p H).card : ℝ)^(m-2)) := by
  classical
  have hs : extraCandidates Γ p H R m⊆somePairPointRestricted m
      (Subtype.val : ↥(shortStars Γ p H)→Grid n×Grid n) (freshExtraPointTriples Γ p H R) := by
    intro fv hfv
    exact (mem_somePairPointRestricted m _ _ fv).mpr (Finset.mem_filter.mp hfv).2.2.2
  have hnat : (extraCandidates Γ p H R m).card≤
      m*(m-1)*((freshExtraPointTriples Γ p H R).card*(shortStars Γ p H).card^(m-2)) :=
    (Finset.card_le_card hs).trans (by
      simpa only [Fintype.card_coe] using somePairPointRestricted_card_le m
        (Subtype.val : ↥(shortStars Γ p H)→Grid n×Grid n) Subtype.val_injective (freshExtraPointTriples Γ p H R))
  have hc : ((extraCandidates Γ p H R m).card : ℝ)≤
      ((m*(m-1) : ℕ) : ℝ)*((freshExtraPointTriples Γ p H R).card*((shortStars Γ p H).card : ℝ)^(m-2)) := by
    exact_mod_cast hnat
  exact hc.trans (mul_le_mul_of_nonneg_left
    (mul_le_mul_of_nonneg_right (freshExtraPointTriples_card_le Γ p H R hR) (by positivity))
    (Nat.cast_nonneg _))

theorem not_noExtraSelected_iff_candidate {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (R : ℝ) (s : ProcessState n) :
    ¬NoExtraSelectedException f s R ↔ ∃v : Grid n,(f,v)∈extraCandidates Γ p H R m ∧ v∈s.selected := by
  classical
  constructor
  · intro h
    simp only [NoExtraSelectedException,not_forall,_root_.not_imp,not_not] at h
    obtain ⟨i,j,hij,v,hv,hout,hbad⟩ := h
    exact ⟨v,Finset.mem_filter.mpr ⟨Finset.mem_univ _,hD,hout,i,j,hij,hbad⟩,hv⟩
  · rintro ⟨v,hv,hsel⟩ hno
    obtain ⟨_,hout,i,j,hij,hbad⟩ := (Finset.mem_filter.mp hv).2
    exact hno i j hij v hsel hout hbad

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.extraCandidates_card_le
#print axioms NoThreeLine.ShortStars.not_noExtraSelected_iff_candidate
