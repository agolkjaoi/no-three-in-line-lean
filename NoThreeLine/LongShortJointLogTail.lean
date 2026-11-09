import NoThreeLine.LongShortJointDecay
import NoThreeLine.LongShortSavedTail

/-! Log-scale tail of the actual saved-long plus deadline-prefix late sum.
The geometric main budget remains the actual normalizedPairSum at tau_p. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase FiniteDirections FiniteWitnessMoments ShortStars FiniteMomentIntegral

theorem longSaved_add_prefixLate_log_tail (ξ : ℝ) (hξ : 0<ξ)
    {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hmask : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint)
    (B K ρ δ d γ ζ T M : ℝ) (p : Grid n) (H : ℝ)
    (hn : 2≤n) (hB : 1≤B) (hH : 0≤H) (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (k : ℕ) (hk : k≤J) (hdeadline : (s.prefix k hk).total=scheduleProcessDeadline s mask p)
    (hT : scheduleProcessDeadline s mask p≤T) (m : ℕ) (hm : 1≤m) (r : ℝ) (hr : 0<r) :
    let cs := scheduleSharedPhases s mask hmask Γ B K ρ
    let e := longWitnessRetention (s.prefix k hk) (prefixMask hk mask) (prefixMask_bounds hk mask hmask) Γ p H
    let w := longWitnessWeight (s.prefix k hk) Γ p H
    let Q := normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p))
    (phasePointMeasure cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 (by omega : 0<n) hB p J).real
      {ω | r*Real.log n≤witnessSum w (initialRootPhaseWitness cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 p
          (by omega : 0<n) hB e J ω)+
        scheduledStarCanonicalLatePath cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0
          (by omega : 0<n) hB Γ p H ((n:ℝ)^(γ-1)) k ω}≤
    (jointLongShortCoefficient ζ m n*(Q/Real.log n)+
      jointLongShortErrorCoefficient Γ K T ξ hξ δ d γ ζ m n)^(m+2)/r^(m+2) := by
  let Q := normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p))
  let a := jointLongShortCoefficient ζ m n
  let e := jointLongShortErrorCoefficient Γ K T ξ hξ δ d γ ζ m n
  have hL : 0<Real.log (n:ℝ) := log_nat_pos hn
  have hM := longSaved_add_prefixLate_moment_small_error ξ hξ s mask hmask Γ B K ρ δ d γ ζ T M p H
    hn hB hH hK0 hK2 hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ hp k hk hdeadline hT m hm
  have htail := saved_add_late_tail_le_moment (scheduleSharedPhases s mask hmask Γ B K ρ)
    ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 p (by omega : 0<n) hB
    (longWitnessRetention (s.prefix k hk) (prefixMask hk mask) (prefixMask_bounds hk mask hmask) Γ p H)
    (longWitnessWeight (s.prefix k hk) Γ p H)
    (fun q=>(longWitnessWeight_bounds (s.prefix k hk) Γ p H q).1) Γ H ((n:ℝ)^(γ-1)) k J (m+2)
    (r*Real.log n) (mul_pos hr hL)
  have hh := htail.trans (div_le_div_of_nonneg_right hM (pow_nonneg (mul_pos hr hL).le (m+2)))
  have he : (a*Q+e*Real.log n)^(m+2)/(r*Real.log n)^(m+2)=
      (a*(Q/Real.log n)+e)^(m+2)/r^(m+2) := by
    rw [mul_comm r (Real.log n),mul_pow,div_mul_eq_div_div,←div_pow]
    congr 2
    field_simp [ne_of_gt hL] <;> ring
  exact hh.trans_eq he

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.longSaved_add_prefixLate_log_tail
