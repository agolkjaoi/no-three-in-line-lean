import NoThreeLine.ObservedActualCutInterval
import NoThreeLine.CalendarSegmentPartition

/-! Countable strict-cut intervals are disjoint. Away from their actual
endpoint values, absence of a crossing means every later remaining time
is still above the cut. A measure-theoretic lemma sums exact local towers. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Function
namespace NoThreeLine

theorem integral_eq_of_disjoint_pieces {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (E : ℕ→Set Ω) (hE : ∀i,MeasurableSet (E i)) (hdisj : Pairwise (Disjoint on E))
    (f g : Ω→ℝ) (hf : Integrable f μ) (hg : Integrable g μ)
    (hpiece : ∀i,(∫ω in E i,f ω ∂μ)=∫ω in E i,g ω ∂μ)
    (hrest : ∀ᵐω ∂μ,ω∉⋃i,E i→f ω=g ω) :
    (∫ω,f ω ∂μ)=∫ω,g ω ∂μ := by
  have hu : MeasurableSet (⋃i,E i) := MeasurableSet.iUnion hE
  have hi : (∫ω in ⋃i,E i,f ω ∂μ)=∫ω in ⋃i,E i,g ω ∂μ := by
    rw [integral_iUnion hE hdisj hf.integrableOn,integral_iUnion hE hdisj hg.integrableOn]
    exact tsum_congr hpiece
  have hc : (∫ω in (⋃i,E i)ᶜ,f ω ∂μ)=∫ω in (⋃i,E i)ᶜ,g ω ∂μ :=
    setIntegral_congr_ae hu.compl hrest
  linarith [integral_add_compl hu hf,integral_add_compl hu hg]

theorem remaining_above_cut_of_no_cross (r : ℕ→ℝ) (δ : ℝ) (hr : δ<r 0)
    (hne : ∀i,δ≠r i) (hcross : ∀i,¬(r (i+1)<δ ∧ δ<r i)) (N : ℕ) : δ<r N := by
  by_contra h
  have hN : r N<δ := lt_of_le_of_ne (le_of_not_gt h) (hne N).symm
  obtain ⟨i,hi,hlt⟩ := CalendarIntegral.exists_open_segment (fun i=> -r i) N (-δ)
    ⟨by linarith,by linarith⟩ (fun i _ he=>hne i (by linarith))
  exact hcross i ⟨by linarith [hlt.2],by linarith [hlt.1]⟩

namespace BirthWitness

def actualCutInterval {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hn : 0<n)
    (s : TimedObservation cfg) (i : ℕ) : Set (BoardClockPath n) :=
  {ω | crossesCut cfg δ (observedRecycledPair cfg ε M start hn s i ω).1
    (observedRecycledPair cfg ε M start hn s (i+1) ω).1}

theorem actualCutInterval_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hn : 0<n) (s : TimedObservation cfg) (i : ℕ) :
    MeasurableSet (actualCutInterval cfg ε M start δ hn s i) :=
  (measurableSet_lt ((measurable_subtype_coe.comp
    (observedRecycledPair_measurable cfg ε M start hn s (i+1)).fst.fst).snd) measurable_const).inter
      (measurableSet_lt measurable_const ((measurable_subtype_coe.comp
        (observedRecycledPair_measurable cfg ε M start hn s i).fst.fst).snd))

theorem observed_remaining_antitone {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    Antitone (fun i=>(observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2) := by
  intro i j hij
  have hh := elapsedTime_monotone cfg ε M start hn s ω hij
  dsimp only at hh
  rw [elapsedTime_eq_observed_remaining,elapsedTime_eq_observed_remaining] at hh
  linarith

theorem actualCutInterval_pairwise {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) :
    Pairwise (Disjoint on actualCutInterval cfg ε M start δ hn s.val) := by
  intro i j hij
  apply Set.disjoint_left.mpr
  intro ω hi hj
  have hm := observed_remaining_antitone cfg ε M start hn s ω
  rcases lt_or_gt_of_ne hij with h | h
  · have hh := hm (Nat.succ_le_of_lt h)
    exact (not_lt_of_ge (hh.trans hi.1.le)) hj.2
  · have hh := hm (Nat.succ_le_of_lt h)
    exact (not_lt_of_ge (hh.trans hj.1.le)) hi.2

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.integral_eq_of_disjoint_pieces
#print axioms NoThreeLine.BirthWitness.actualCutInterval_pairwise
