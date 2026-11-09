import NoThreeLine.VirtualRawHitUnion
import NoThreeLine.PhaseContinuousVirtualHit

/-! The actual continuous-or-postgeometry virtual contact event. Positivity
of candidate waits and absence of ties are supplied by the original board
law, so the raw-hit union bound also applies without a time union factor. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.VirtualWitness
open AuxiliaryODE PrimitiveLines BirthWitness SpecifiedBoardCount

def anyActualVirtualHit {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃ (L : LineIndex n) (q : Grid n), ω ∈ phaseActualVirtualHitBefore cs ε M deadline start q hn
    (initialGoodPhaseRootObservation B hB q deadline start).val L J}

theorem anyActualVirtualHit_measurableSet {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (J : ℕ) :
    MeasurableSet (anyActualVirtualHit cs ε M deadline start hn hB J) := by
  simp only [anyActualVirtualHit, Set.setOf_exists]
  exact MeasurableSet.iUnion (fun L => MeasurableSet.iUnion (fun q =>
    phaseActualVirtualHitBefore_measurableSet cs ε M deadline start q hn _ L J))

theorem anyActualVirtualHit_raw_ae {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (J : ℕ) :
    anyActualVirtualHit cs ε M deadline start hn hB J ≤ᵐ[boardClockMeasure n (B/n)]
      anyRawVirtualHit cs ε M deadline start hn hB J := by
  have ha : ∀ᵐ ω ∂boardClockMeasure n (B/n), ∀ q : Grid n, ∀ L J,
      ω ∈ phaseActualVirtualHitBefore cs ε M deadline start q hn
        (initialGoodPhaseRootObservation B hB q deadline start).val L J →
      ω ∈ phaseVirtualHitBefore cs ε M deadline start q hn
        (initialGoodPhaseRootObservation B hB q deadline start).val L J :=
    ae_all_iff.mpr (fun q => phaseActualVirtualHitBefore_raw_ae cs ε M deadline start q hn
      (zero_lt_one.trans_le hB) (initialGoodPhaseRootObservation B hB q deadline start))
  filter_upwards [ha] with ω hω
  rintro ⟨L,q,hh⟩
  exact ⟨L,q,hω q L J hh⟩

theorem anyActualVirtualHit_C4_tail {n m : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ δ T ξ : ℝ)
    (hξ : 0<ξ) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (hm : 0<m) (hM : 0<M)
    (hΓ : ∀ j, (cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀ j, (cs j).K≤K) (hρ : ∀ j, ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε≤1/2) (J : ℕ) (hT : phaseEndpoint cs start J-start≤T) :
    (boardClockMeasure n (B/n)).real (anyActualVirtualHit cs ε M deadline start hn hB J) ≤
      (lineCountConstant Γ : ℝ)*(n:ℝ)^3 *
        (momentConstant Γ K δ T ξ hξ m *
          (∑ a ∈ Finset.Icc 1 m, B^(m-a)*(n:ℝ)^((a:ℝ)*ξ)) / M^m) := by
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  exact (ENNReal.toReal_mono (measure_ne_top (boardClockMeasure n (B/n)) _)
    (measure_mono_ae (anyActualVirtualHit_raw_ae cs ε M deadline start hn hB J))).trans
    (anyRawVirtualHit_C4_tail cs ε M deadline start K ρ δ T ξ hξ hn hB Γ hm hM
      hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε J hT)

end NoThreeLine.VirtualWitness

#print axioms NoThreeLine.VirtualWitness.anyActualVirtualHit_raw_ae
#print axioms NoThreeLine.VirtualWitness.anyActualVirtualHit_C4_tail
