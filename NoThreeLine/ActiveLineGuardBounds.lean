import NoThreeLine.EmptyLineCreditInvariant
import NoThreeLine.MixedCauseGeometry
import NoThreeLine.SegmentProgress

/-! Bounds at actual resolved states, restricted to lines containing an
active label. No lower bound is asserted for lines whose labels have retired.
The lower credit bound on an empty line is supplied by EmptyLineCredit. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE MixedConnection

def ActiveLineGuardBounds {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (K ρ : ℝ) (e : ExtendedState n) : Prop :=
  ∀ p ∈ e.process.activeEvents, ∀ L : LineIndex n, p ∈ L.val →
    (specified Γ L → e.clocks L ≤ K) ∧
    (¬specified Γ L → occupancy e.process L = 1 → ρ ≤ e.lineCredits L)

theorem ActiveLineGuardBounds.mono {n : ℕ} {Γ : Finset PrimitiveLines.ZPoint}
    {K K' ρ ρ' : ℝ} {e : ExtendedState n} (he : ActiveLineGuardBounds Γ K ρ e)
    (hK : K ≤ K') (hρ : ρ' ≤ ρ) : ActiveLineGuardBounds Γ K' ρ' e := by
  intro p hp L hpL
  exact ⟨fun hsp => (he p hp L hpL).1 hsp |>.trans hK,
    fun hsp hN => hρ.trans ((he p hp L hpL).2 hsp hN)⟩

theorem activeLineGuardBounds_stop {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (K ρ : ℝ) :
    ActiveLineGuardBounds Γ K ρ e.stop := by
  intro p hp
  change p ∈ e.process.stop.activeEvents at hp
  simp [ProcessState.stop_activeEvents_empty] at hp

theorem activeLineGuardBounds_initial (n : ℕ) (Γ : Finset PrimitiveLines.ZPoint)
    (K ρ : ℝ) (hK : 0 ≤ K) : ActiveLineGuardBounds Γ K ρ (ExtendedState.initial n) := by
  intro p hp L hpL
  refine ⟨fun _ => hK,?_⟩
  intro _ hN
  simp [ExtendedState.initial,ProcessState.initial,occupancy] at hN

theorem activeLineGuardBounds_retire {n : ℕ} {e : ExtendedState n}
    {Γ : Finset PrimitiveLines.ZPoint} {K ρ : ℝ}
    (he : ActiveLineGuardBounds Γ K ρ e) (positive : Grid n → Bool) :
    ActiveLineGuardBounds Γ K ρ (e.retire positive) := by
  intro p hp L hpL
  exact he p (retire_activeEvents_subset e.process positive hp) L hpL

theorem activeLineGuardBounds_resolve {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (he : e.Valid B) :
    ActiveLineGuardBounds Γ K ρ (e.resolve Γ B K ρ) := by
  intro p hp L hpL
  have hev := e.resolve_valid Γ B K ρ he
  have hN := active_line_occupancy_le_one (e.resolve Γ B K ρ).process p hev.1 hp L hpL
  have hsel : (e.resolve Γ B K ρ).process.selected = e.process.selected :=
    resolveBoundary_selected e.process Γ B K ρ e.clocks e.lineCredits e.handled
  have hocc : occupancy (e.resolve Γ B K ρ).process L = occupancy e.process L := by
    simp only [occupancy,hsel]
  have hc : ¬clockTriggered e.process Γ K e.clocks := by
    intro hc
    have hempty : (e.resolve Γ B K ρ).process.activeEvents = ∅ := by
      simp only [ExtendedState.resolve,resolveBoundary,if_pos hc,ProcessState.stop_activeEvents_empty]
    simpa [hempty] using hp
  refine ⟨?_,?_⟩
  · intro hsp
    change e.clocks L ≤ K
    by_contra hk
    apply hc
    exact ⟨L,hsp,hocc ▸ hN,le_of_not_ge hk⟩
  · intro hsp hN1
    change ρ ≤ e.lineCredits L
    by_contra hr
    have ht : L ∈ triggeredTags e.process Γ e.lineCredits ρ := by
      simp only [triggeredTags,Finset.mem_filter,Finset.mem_univ,true_and]
      exact ⟨hsp,hocc ▸ hN1,le_of_not_ge hr⟩
    have hh : L ∈ handledAfter e.process Γ e.lineCredits ρ e.handled := by
      by_cases hh : L ∈ e.handled
      · exact Finset.mem_union_left _ hh
      · exact Finset.mem_union_right _ (Finset.mem_sdiff.mpr ⟨ht,hh⟩)
    exact hev.2.2 L hh p hpL (((e.resolve Γ B K ρ).process.mem_activeEvents p).mp hp)

theorem active_lineCredit_lower {n : ℕ} {e : ExtendedState n}
    {Γ : Finset PrimitiveLines.ZPoint} {B K ρ : ℝ} (he : e.Valid B)
    (hE : EmptyLineCredit e) (hg : ActiveLineGuardBounds Γ K ρ e) (hρ : ρ ≤ 1)
    (p : Grid n) (hp : p ∈ e.process.activeEvents) (L : LineIndex n)
    (hpL : p ∈ L.val) (hsp : ¬specified Γ L) : ρ ≤ e.lineCredits L := by
  have hN := active_line_occupancy_le_one e.process p he.1 hp L hpL
  by_cases h0 : occupancy e.process L = 0
  · rw [hE L h0]
    exact hρ
  · exact (hg p hp L hpL).2 hsp (by omega)

theorem active_inverse_protection_lower {n : ℕ} {e : ExtendedState n}
    {Γ : Finset PrimitiveLines.ZPoint} {B K ρ : ℝ} (he : e.Valid B)
    (hg : ActiveLineGuardBounds Γ K ρ e) (hK : K < 2)
    (p : Grid n) (hp : p ∈ e.process.activeEvents) (L : LineIndex n)
    (hpL : p ∈ L.val) (hsp : specified Γ L) :
    (2-K)/2 ≤ (protection (occupancy e.process L) (e.clocks L))⁻¹ := by
  have hN := active_line_occupancy_le_one e.process p he.1 hp L hpL
  have hk := (hg p hp L hpL).1 hsp
  have hcases : occupancy e.process L = 0 ∨ occupancy e.process L = 1 := by omega
  rcases hcases with h0 | h1
  · simp only [protection,h0,Nat.cast_zero,sub_zero,inv_div]
    linarith
  · simp only [protection,h1,Nat.cast_one,inv_div]
    norm_num
    linarith

end NoThreeLine

#print axioms NoThreeLine.activeLineGuardBounds_resolve
#print axioms NoThreeLine.active_lineCredit_lower
#print axioms NoThreeLine.active_inverse_protection_lower
