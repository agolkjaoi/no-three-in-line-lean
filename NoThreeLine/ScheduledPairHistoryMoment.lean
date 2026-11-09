import NoThreeLine.PairHistoryMoment

/-! Integrate the fixed history cover under the original board law at an
actual scheduled cut. Each distinct selected witness is priced once by
the actual C1 theorem. There is no assumed pair-rate moment or graph count. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness MixedConnection FiniteWitnessMoments

def initialCutPairRate {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (k : ℕ) (t : ℝ) (a b : Grid n) (ω : BoardClockPath n) : ℝ :=
  let e := (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
  pairRate e.process (cs k).directions (cs k).mask e.coordinates a b

theorem initial_scheduledCutBoard_pairRate_history_bound {n m : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ T : ℝ)
    (a b : Grid n) (hab : a≠b) (hn : 0<n) (hB : 1≤B) (hm : 0<m) (Γ : Finset ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε≤1/2) (k : ℕ) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (cs k).horizon) (hτT : phaseEndpoint cs start k-start+t≤T) :
    (∫ω,(initialCutPairRate cs ε M deadline start hn hB k t a b ω)^m
      ∂boardClockMeasure n (B/n)) ≤
      B^(m-1)/(n:ℝ)^m*(causePriceCap Γ K δ m*
        ∑l∈histories Γ a b m,(T/n)^((historyLabels l).card)) := by
  let W := fun ω : BoardClockPath n=>
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
  let ν := boardClockMeasure n (B/n)
  let c := B^(m-1)/(n:ℝ)^m
  have hc : 0≤c := div_nonneg (pow_nonneg (zero_le_one.trans hB) _) (by positivity)
  have hW : Measurable W := (AugmentedState.measurable_physical n).comp
    ((WitnessState.measurable_augmented n).comp
      ((scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ k).comp
        (measurable_id.prodMk measurable_const)))
  have hv (ω) : (W ω).Valid B :=
    (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ k (ω,t)).1.1
  letI := boardClockMeasure_probability n (B/n)
    (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  have hmask : ∀q,0≤(cs k).mask q ∧ (cs k).mask q≤1 :=
    fun q=>⟨(cs k).mask_nonneg q,(cs k).mask_le_one q⟩
  have hi := pairRate_pow_integrable ν W hW Γ (cs k).mask a b B hB hv hmask hm
  have hj (l : List (Edge n)) := historyObservable_integrable ν W hW a b l B hv
  have hτ : 0≤phaseEndpoint cs start k-start+t := by
    have hh : 0≤∑j∈Finset.range k,((cs j).horizon:ℝ) :=
      Finset.sum_nonneg (fun j _=>(cs j).horizon.coe_nonneg)
    unfold phaseEndpoint
    push_cast
    linarith [ht.1]
  have hstep : (∫ω,pairRate (W ω).process Γ (cs k).mask (W ω).coordinates a b^m ∂ν) ≤
      c*(∑l∈histories Γ a b m,∫ω,historyObservable a b l (W ω) ∂ν) := by
    rw [←integral_finsetSum _ (fun l _=>hj l),←integral_const_mul]
    exact integral_mono hi ((integrable_finsetSum _ (fun l _=>hj l)).const_mul c)
      (fun ω=>pairRate_pow_history_coarse (W ω) Γ (cs k).mask a b B hB (hv ω) hmask hm)
  have hpoint (l : List (Edge n)) (hl : l∈histories Γ a b m) :
      (∫ω,historyObservable a b l (W ω) ∂ν) ≤
        causePriceCap Γ K δ m*(T/n)^((historyLabels l).card) := by
    have hx := historyCauses_exclude_roots Γ a b m l hl
    have hlen := (mem_histories Γ a b m l).mp hl |>.1
    have hbase := initial_scheduledCutBoard_causeProduct_bound cs ε M deadline start K ρ δ a b
      (historyCauses l) (historyLabels l) hab hx.1 hx.2 hn hB Γ hΓ hK0 hK2 hK hρ hρ1
      hδ hδ1 hδρ hδK hε0 hε k t ht
    apply hbase.trans
    have hcap := causePriceConstant_le_cap Γ K δ m (historyCauses l).card (historyLabels l).card
      ((historyCauses_card_le l).trans_eq hlen) ((historyLabels_card_le l).trans_eq (by rw [hlen]))
    calc
      _ ≤ causePriceCap Γ K δ m*((phaseEndpoint cs start k-start+t)/n)^((historyLabels l).card) :=
        mul_le_mul_of_nonneg_right hcap (pow_nonneg (div_nonneg hτ (Nat.cast_nonneg n)) _)
      _ ≤ _ := mul_le_mul_of_nonneg_left (pow_le_pow_left₀ (div_nonneg hτ (Nat.cast_nonneg n))
        (div_le_div_of_nonneg_right hτT (Nat.cast_nonneg n)) _) (causePriceCap_pos Γ K δ m).le
  change (∫ω,pairRate (W ω).process (cs k).directions (cs k).mask (W ω).coordinates a b^m ∂ν)≤_
  rw [hΓ k]
  apply hstep.trans
  simpa only [←Finset.mul_sum] using mul_le_mul_of_nonneg_left (Finset.sum_le_sum hpoint) hc

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.initial_scheduledCutBoard_pairRate_history_bound
