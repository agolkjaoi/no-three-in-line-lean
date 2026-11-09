import NoThreeLine.ActualFirstCredit
import NoThreeLine.GuardStoppedFlow

/-! The actual first-event credit formula for a bounded finite flow segment,
including the first true guard supplied by GuardStoppedFlow. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped NNReal Topology

namespace NoThreeLine

theorem ProcessState.actual_first_candidate_credit_on {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B : ℝ) (T : ℝ≥0)
    (hn : 0 < n) (hB : 0 < B) (hs : s.Valid)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (w : ℝ → Grid n → ℝ) (hw : ContinuousOn w (Icc (0 : ℝ) T))
    (hwB : ∀ t ∈ Icc (0 : ℝ) T, ∀ q, 0 ≤ w t q ∧ w t q ≤ B)
    (hwinit : w 0 = fun p => (s.accounts p).weight)
    (hd : ∀ t ∈ Ioo (0 : ℝ) T, HasDerivAt w (s.compensatedVectorField Γ mask (w t)) t)
    (p : Grid n) :
    (∫ ω, s.firstCreditObservable Γ mask B T w p (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂boardClockMeasure n (B/n)) = (s.accounts p).credit := by
  let v : ℝ → Grid n → ℝ := fun t => w (AuxiliaryODE.timeClip T t)
  have he (t : ℝ) (ht : t ∈ Icc (0 : ℝ) T) : v t = w t := by
    simp only [v, AuxiliaryODE.timeClip_eq T t ht]
  have hv : Continuous v := hw.comp_continuous (AuxiliaryODE.timeClip_continuous T)
    (AuxiliaryODE.timeClip_mem T)
  have hvB (t : ℝ) (q : Grid n) : 0 ≤ v t q ∧ v t q ≤ B :=
    hwB _ (AuxiliaryODE.timeClip_mem T t) q
  have hvinit : v 0 = fun p => (s.accounts p).weight :=
    (he 0 ⟨le_rfl,T.coe_nonneg⟩).trans hwinit
  have hvd : ∀ t ∈ Ioo (0 : ℝ) T, HasDerivAt v (s.compensatedVectorField Γ mask (v t)) t := by
    intro t ht
    rw [he t ⟨ht.1.le,ht.2.le⟩]
    apply (hd t ht).congr_of_eventuallyEq
    filter_upwards [Icc_mem_nhds ht.1 ht.2] with u hu
    exact he u hu
  rw [← s.actual_first_candidate_credit Γ mask B T hn hB T.coe_nonneg hs hm v hv hvB hvinit hvd p]
  apply integral_congr_ae
  filter_upwards [BoardFirstCandidate.firstTime_ae_positive hn (B/n)
    (div_pos hB (by exact_mod_cast hn))] with ω ht
  have htime : (WinnerMarkLaw.firstMarkedRace hn ω).1.1 = BoardFirstCandidate.firstTime hn ω := rfl
  unfold firstCreditObservable
  rw [htime]
  split_ifs with h
  · rw [he _ ⟨ht.le,h⟩]
  · rw [he T ⟨T.coe_nonneg,le_rfl⟩]

namespace AuxiliaryODE

theorem coordinate_flow_first_candidate_credit {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (B : ℝ) (T : ℝ≥0)
    (hn : 0 < n) (hB : 0 < B) (hs : s.Valid)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (z : ℝ → Coordinates n) (hz : ContinuousOn z (Icc (0 : ℝ) T))
    (hzB : ∀ t ∈ Icc (0 : ℝ) T, CoordinateBounds B (z t))
    (hzinit : (z 0).1 = fun p => (s.accounts p).weight)
    (hd : ∀ t ∈ Ioo (0 : ℝ) T, HasDerivAt z (vectorField s Γ mask (z t)) t)
    (p : Grid n) :
    (∫ ω, s.firstCreditObservable Γ mask B T (fun t => (z t).1) p
      (WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (B/n)) =
      (s.accounts p).credit :=
  s.actual_first_candidate_credit_on Γ mask B T hn hB hs hm _ hz.fst
    (fun t ht => (hzB t ht).1) hzinit (fun t ht => (hd t ht).fst) p

end AuxiliaryODE
end NoThreeLine

#print axioms NoThreeLine.ProcessState.actual_first_candidate_credit_on
#print axioms NoThreeLine.AuxiliaryODE.coordinate_flow_first_candidate_credit
