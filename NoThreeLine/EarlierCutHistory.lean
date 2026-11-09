import NoThreeLine.CutCrossingPartition
import NoThreeLine.ObservedCutHistoryCrossing

/-! An earlier actual cut can be read from the complete finite history up
to the later crossing, with an interior probe when both cuts share the
same update interval. All earlier physical/eta/record data are retained. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine

theorem strict_remaining_crossing_unique (r : ℕ→ℝ) (hr : Antitone r) (δ : ℝ)
    (i j : ℕ) (hi : r (i+1)<δ ∧ δ<r i) (hj : r (j+1)<δ ∧ δ<r j) : i=j := by
  by_contra h
  rcases lt_or_gt_of_ne h with h | h
  · exact (not_lt_of_ge ((hr (Nat.succ_le_of_lt h)).trans hi.1.le)) hj.2
  · exact (not_lt_of_ge ((hr (Nat.succ_le_of_lt h)).trans hj.1.le)) hi.2

theorem finite_cut_probe_sum (r : ℕ→ℝ) (hr : Antitone r) (δ : ℝ) (i : ℕ)
    (hstart : δ<r 0) (hend : r (i+1)<δ) (hne : ∀j,δ≠r j)
    (v : ℕ→ℝ) (z : ℝ) (hv : ∀j,r (j+1)<δ ∧ δ<r j→v j=z) :
    (∑q : Fin i,if r (q.val+1)<δ ∧ δ<r q.val then v q.val else 0)+
      (if δ<r i then v i else 0)=z := by
  obtain ⟨j,hj,hcross⟩ := CalendarIntegral.exists_open_segment (fun k=> -r k) (i+1) (-δ)
    ⟨by linarith,by linarith⟩ (fun k _ he=>hne k (by linarith))
  have hc : r (j+1)<δ ∧ δ<r j := ⟨by linarith [hcross.2],by linarith [hcross.1]⟩
  by_cases hji : j < i
  · have hlast : ¬δ<r i := by
      have hle := hr (Nat.succ_le_of_lt hji)
      linarith [hc.1]
    rw [if_neg hlast,add_zero]
    have hs : (∑q : Fin i,if r (q.val+1)<δ ∧ δ<r q.val then v q.val else 0)=v j := by
      rw [Finset.sum_eq_single (⟨j,hji⟩ : Fin i)]
      · exact if_pos hc
      · intro q _ hq
        apply if_neg
        intro hqc
        exact hq (Fin.ext (strict_remaining_crossing_unique r hr δ q.val j hqc hc))
      · simp
    exact hs.trans (hv j hc)
  · have hji : j=i := by omega
    subst j
    have hs : (∑q : Fin i,if r (q.val+1)<δ ∧ δ<r q.val then v q.val else 0)=0 := by
      apply Finset.sum_eq_zero
      intro q _
      apply if_neg
      intro hqc
      have he := strict_remaining_crossing_unique r hr δ q.val i hqc hc
      exact (Nat.ne_of_lt q.isLt) he
    rw [hs,zero_add,if_pos hc.2]
    exact hv i hc

namespace BirthWitness

def earlierCutHistoryValue {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (i : ℕ) (F : TimedObservation cfg×TimedObservation cfg→ℝ)
    (x : (Fin (i+1)→TimedObservation cfg)×TimedObservation cfg) : ℝ :=
  (∑q : Fin i,if crossesCut cfg δ (x.1 q.castSucc) (x.1 q.succ) then
    F (interiorCutObservation cfg ε M start δ hδ hn (x.1 q.castSucc),x.2) else 0)+
  if δ<(x.1 (Fin.last i)).1.val.2 then
    F (interiorCutObservation cfg ε M start δ hδ hn (x.1 (Fin.last i)),x.2) else 0

theorem earlierCutHistoryValue_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (i : ℕ) (F : TimedObservation cfg×TimedObservation cfg→ℝ)
    (hF : Measurable F) : Measurable (earlierCutHistoryValue cfg ε M start δ hδ hn i F) := by
  have hs (q : Fin (i+1)) : Measurable
      (fun x : (Fin (i+1)→TimedObservation cfg)×TimedObservation cfg=>x.1 q) :=
    (measurable_pi_apply q).comp measurable_fst
  unfold earlierCutHistoryValue
  apply Measurable.add
  · apply Finset.measurable_sum
    intro q _
    apply Measurable.ite
    · exact (measurableSet_lt ((measurable_subtype_coe.comp (hs q.succ).fst).snd) measurable_const).inter
        (measurableSet_lt measurable_const ((measurable_subtype_coe.comp (hs q.castSucc).fst).snd))
    · exact hF.comp (((interiorCutObservation_measurable cfg ε M start δ hδ hn).comp
        ((measurable_pi_apply q.castSucc).comp measurable_fst)).prodMk measurable_snd)
    · exact measurable_const
  · apply Measurable.ite
    · exact measurableSet_lt measurable_const ((measurable_subtype_coe.comp
        ((measurable_pi_apply (Fin.last i)).comp measurable_fst).fst).snd)
    · exact hF.comp (((interiorCutObservation_measurable cfg ε M start δ hδ hn).comp
        ((measurable_pi_apply (Fin.last i)).comp measurable_fst)).prodMk measurable_snd)
    · exact measurable_const

theorem earlierCutHistoryValue_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (i : ℕ) (F : TimedObservation cfg×TimedObservation cfg→ℝ)
    (A : ℝ) (hFA : ∀x,0≤F x ∧ F x≤A)
    (x : (Fin (i+1)→TimedObservation cfg)×TimedObservation cfg) :
    0≤earlierCutHistoryValue cfg ε M start δ hδ hn i F x ∧
      earlierCutHistoryValue cfg ε M start δ hδ hn i F x≤(i+1)*A := by
  have hA : 0≤A := (hFA (x.2,x.2)).1.trans (hFA (x.2,x.2)).2
  have hv (q : Fin i) : 0≤(if crossesCut cfg δ (x.1 q.castSucc) (x.1 q.succ) then
      F (interiorCutObservation cfg ε M start δ hδ hn (x.1 q.castSucc),x.2) else 0) ∧
      (if crossesCut cfg δ (x.1 q.castSucc) (x.1 q.succ) then
      F (interiorCutObservation cfg ε M start δ hδ hn (x.1 q.castSucc),x.2) else 0)≤A := by
    split_ifs
    · exact hFA _
    · exact ⟨le_rfl,hA⟩
  have hl : 0≤(if δ<(x.1 (Fin.last i)).1.val.2 then
      F (interiorCutObservation cfg ε M start δ hδ hn (x.1 (Fin.last i)),x.2) else 0) ∧
      (if δ<(x.1 (Fin.last i)).1.val.2 then
      F (interiorCutObservation cfg ε M start δ hδ hn (x.1 (Fin.last i)),x.2) else 0)≤A := by
    split_ifs
    · exact hFA _
    · exact ⟨le_rfl,hA⟩
  refine ⟨add_nonneg (Finset.sum_nonneg (fun q _=>(hv q).1)) hl.1,?_⟩
  have hs := Finset.sum_le_sum (s:=Finset.univ) (fun q _=>(hv q).2)
  simp only [Finset.sum_const,Finset.card_univ,Fintype.card_fin,nsmul_eq_mul] at hs
  dsimp only [earlierCutHistoryValue]
  nlinarith [hl.2]

theorem earlierCutHistoryValue_actual {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (i : ℕ) (ω : BoardClockPath n)
    (hstart : δ<s.val.1.val.2)
    (hend : (observedRecycledPair cfg ε M start hn s.val (i+1) ω).1.1.val.2<δ)
    (hne : ∀j,δ≠(observedRecycledPair cfg ε M start hn s.val j ω).1.1.val.2)
    (F : TimedObservation cfg×TimedObservation cfg→ℝ) (v : TimedObservation cfg) :
    earlierCutHistoryValue cfg ε M start δ hδ hn i F (observedPast cfg ε M start hn s.val i ω,v)=
      F (sourceCutTerminal cfg ε M start δ hδ hn s ω,v) := by
  apply finite_cut_probe_sum
    (fun j=>(observedRecycledPair cfg ε M start hn s.val j ω).1.1.val.2)
    (observed_remaining_antitone cfg ε M start hn s ω) δ i hstart hend hne
    (fun j=>F (interiorCutObservation cfg ε M start δ hδ hn
      (observedRecycledPair cfg ε M start hn s.val j ω).1,v))
    (F (sourceCutTerminal cfg ε M start δ hδ hn s ω,v))
  intro j hj
  rw [sourceCutTerminal_eq_interiorCut_of_crossing cfg ε M start δ hδ hn s j ω hj]

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.finite_cut_probe_sum
#print axioms NoThreeLine.BirthWitness.earlierCutHistoryValue_actual
