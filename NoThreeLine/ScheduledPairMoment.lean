import NoThreeLine.ScheduledPairIntegral
import NoThreeLine.ScheduledPairC2
import NoThreeLine.FinitePhaseMoment

/-! C2 integrated on the original board over all actual phase windows.
The only time factor is total horizon to the fixed moment degree. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines BirthWitness FiniteMomentIntegral

theorem initial_scheduledPairPath_moment (ξ : ℝ) (hξ : 0<ξ)
    (Γ : Finset ZPoint) (K δ T : ℝ) (hT : 0≤T) (m : ℕ) (hm : 2≤m) :
    ∃ Cm : ℝ,0<Cm ∧ ∀ (n : ℕ) (B : ℝ) (cs : ℕ→SharedPhase n B)
      (ε M : ℝ) (deadline : Grid n→ℝ) (start ρ : ℝ) (a b : Grid n)
      (hab : a≠b) (hn : 0<n) (hB : 1≤B),
      (∀j,(cs j).directions=Γ) → 0≤K → K<2 → (∀j,(cs j).K≤K) →
      (∀j,ρ≤(cs j).rho) → ρ≤1 → 0<δ → δ≤1 → δ≤ρ → δ≤(2-K)/2 →
      0≤ε → ε≤1/2 → ∀J, phaseEndpoint cs start J-start≤T →
      (∫ω,(scheduledPairPath cs ε M deadline start hn hB a b J ω)^m
        ∂boardClockMeasure n (B/n)) ≤ T^m*Cm*(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ)*B^(m-1) := by
  obtain ⟨Cm,hCm,hC2⟩ := initial_scheduledCutBoard_pairRate_C2 ξ hξ Γ K δ T hT m (by omega)
  refine ⟨Cm,hCm,?_⟩
  intro n B cs ε M deadline start ρ a b hab hn hB hΓ hK0 hK2 hK hρ hρ1
    hδ hδ1 hδρ hδK hε0 hε J htotal
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos (zero_lt_one.trans_le hB) (by exact_mod_cast hn))
  let D := Cm*(n:ℝ)^(-(m:ℝ)+2*(m:ℝ)*ξ)*B^(m-1)
  have hD : 0≤D := mul_nonneg (mul_nonneg hCm.le (Real.rpow_nonneg (Nat.cast_nonneg n) _))
    (pow_nonneg (zero_le_one.trans hB) _)
  let f := fun N : Fin J=>fun x : BoardClockPath n×ℝ=>
    initialCutPairRate cs ε M deadline start hn hB N x.2 a b x.1
  have hf (N : Fin J) : Measurable (f N) :=
    initialCutPairRate_joint_measurable cs ε M deadline start hn hB a b N
  have hfb (N : Fin J) (x) : 0≤f N x ∧ f N x≤pairRateCap n B :=
    initialCutPairRate_bounds cs ε M deadline start hn hB a b N x.2 x.1
  have hM (N : Fin J) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs N).horizon) :
      (∫ω,f N (ω,t)^m ∂μ)≤D := by
    have hphase := phaseEndpoint_mono cs start (Nat.succ_le_of_lt N.isLt)
    rw [phaseEndpoint_succ] at hphase
    have htime : phaseEndpoint cs start N-start+t≤T := by linarith [ht.2]
    exact hC2 n B cs ε M deadline start ρ a b hab hn hB hΓ hK0 hK2 hK hρ hρ1
      hδ hδ1 hδρ hδK hε0 hε N t ht htime
  have hi := finite_phase_constant_moment μ f hf (pairRateCap n B)
    (pairRateCap_nonneg n B (zero_le_one.trans hB)) hfb
    (fun N : Fin J=>((cs N).horizon:ℝ)) (fun N=>(cs N).horizon.coe_nonneg) D hD m hm hM
  have he : (∑N : Fin J,((cs N).horizon:ℝ))=phaseEndpoint cs start J-start := by
    simp only [phaseEndpoint,add_sub_cancel_left,NNReal.coe_sum]
    exact Fin.sum_univ_eq_sum_range (fun N=>((cs N).horizon:ℝ)) J
  have hzero : 0≤phaseEndpoint cs start J-start := by
    rw [←he]
    exact Finset.sum_nonneg (fun N _=>(cs N).horizon.coe_nonneg)
  have hi' : (∫ω,(scheduledPairPath cs ε M deadline start hn hB a b J ω)^m ∂μ)≤
      (phaseEndpoint cs start J-start)^m*D := by
    rw [he] at hi
    have hsum (ω : BoardClockPath n) : (∑N : Fin J, ∫t in (0:ℝ)..(cs N).horizon,f N (ω,t))=
        scheduledPairPath cs ε M deadline start hn hB a b J ω :=
      Fin.sum_univ_eq_sum_range (fun N=>∫t in (0:ℝ)..(cs N).horizon,
        initialCutPairRate cs ε M deadline start hn hB N t a b ω) J
    simpa only [hsum] using hi
  calc
    _ ≤ (phaseEndpoint cs start J-start)^m*D := hi'
    _ ≤ T^m*D := mul_le_mul_of_nonneg_right (pow_le_pow_left₀ hzero htotal m) hD
    _ = _ := by dsimp [D]; ring

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.initial_scheduledPairPath_moment
