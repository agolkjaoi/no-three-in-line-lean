import NoThreeLine.LongPrefixErrorControl
import NoThreeLine.LongShortMomentCoefficients

/-! The actual joint moment has a sharp common main coefficient and a
uniform vanishing remainder. All limits keep the moment degree fixed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Filter
open scoped BigOperators Topology

namespace NoThreeLine.FiniteDirections

theorem normalizedPairSum_nonneg {n : ℕ} (p : Grid n) (a : Grid n→ℝ)
    (ha : ∀q,0≤a q) : 0≤normalizedPairSum p a := by
  apply div_nonneg _ (by positivity)
  apply Finset.sum_nonneg
  intro q _
  apply Finset.sum_nonneg
  intro r _
  split_ifs
  · exact mul_nonneg (ha q) (ha r)
  · exact le_rfl

end NoThreeLine.FiniteDirections

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase FiniteDirections FiniteWitnessMoments ShortStars FiniteMomentIntegral

def jointLongShortErrorCoefficient (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ)
    (δ d γ ζ : ℝ) (m n : ℕ) : ℝ :=
  longRootErrorCoefficient Γ K T ξ hξ ζ m n+
    positiveMomentRoot (m+2)
      (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T (m+2) n)*T^2

theorem tendsto_jointLongShortErrorCoefficient (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ)
    (δ d γ ζ : ℝ) (m : ℕ) (hξ1 : ξ<1) (hd : d<γ) (hγ : γ<1) (hζ : 0<ζ) :
    Tendsto (jointLongShortErrorCoefficient Γ K T ξ hξ δ d γ ζ m) atTop (𝓝 0) := by
  have h := (tendsto_longRootErrorCoefficient Γ K T ξ hξ ζ m hξ1 hζ).add
    ((tendsto_starIntegral_errorCoefficient ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T (m+2)
      (by omega) hξ1 hd hγ hζ).mul_const (T^2))
  change Tendsto (fun n : ℕ=>longRootErrorCoefficient Γ K T ξ hξ ζ m n+
    positiveMomentRoot (m+2)
      (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T (m+2) n)*T^2) atTop (𝓝 0)
  simpa only [zero_mul,zero_add] using h

theorem longPrefixMomentError_uniform_small (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ)
    (ζ : ℝ) (m : ℕ) (hξ1 : ξ<1) (hζ : 0<ζ) (η : ℝ) (hη : 0<η) :
    ∃N : ℕ,∀n≥N,∀(J : ℕ) (s : Schedule J) (mask : Fin J→Grid n→ℝ)
      (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (B ρ : ℝ) (p : Grid n) (H : ℝ)
      (k : ℕ) (hk : k≤J),
      (s.prefix k hk).total=scheduleProcessDeadline s mask p→scheduleProcessDeadline s mask p≤T→
      positiveMomentRoot (m+2) (longPrefixMomentError s mask hm Γ B K ρ ((n:ℝ)^(-ζ)) p H k hk m)/Real.log n<η := by
  have he : ∀ᶠ n in atTop,longRootErrorCoefficient Γ K T ξ hξ ζ m n<η :=
    (tendsto_longRootErrorCoefficient Γ K T ξ hξ ζ m hξ1 hζ).eventually (gt_mem_nhds hη)
  obtain ⟨N,hN⟩ := eventually_atTop.mp he
  refine ⟨max N 2,?_⟩
  intro n hn J s mask hm B ρ p H k hk hdeadline hT
  exact (longPrefixMomentError_root_div_log_le s mask hm Γ B K ρ T ξ ζ hξ hζ p H k hk m
    ((le_max_right N 2).trans hn) hdeadline hT).trans_lt (hN n ((le_max_left N 2).trans hn))

theorem longSaved_add_prefixLate_moment_small_error (ξ : ℝ) (hξ : 0<ξ)
    {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hmask : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint)
    (B K ρ δ d γ ζ T M : ℝ) (p : Grid n) (H : ℝ)
    (hn : 2≤n) (hB : 1≤B) (hH : 0≤H) (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (k : ℕ) (hk : k≤J) (hdeadline : (s.prefix k hk).total=scheduleProcessDeadline s mask p)
    (hT : scheduleProcessDeadline s mask p≤T) (m : ℕ) (hm : 1≤m) :
    let cs := scheduleSharedPhases s mask hmask Γ B K ρ
    let e := longWitnessRetention (s.prefix k hk) (prefixMask hk mask) (prefixMask_bounds hk mask hmask) Γ p H
    let w := longWitnessWeight (s.prefix k hk) Γ p H
    let Q := normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p))
    (∫ω,(witnessSum w (initialRootPhaseWitness cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 p
        (by omega : 0<n) hB e J ω)+
      scheduledStarCanonicalLatePath cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0
        (by omega : 0<n) hB Γ p H ((n:ℝ)^(γ-1)) k ω)^(m+2)
      ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 (by omega : 0<n) hB p J)≤
    (jointLongShortCoefficient ζ m n*Q+
      jointLongShortErrorCoefficient Γ K T ξ hξ δ d γ ζ m n*Real.log n)^(m+2) := by
  let Q := normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p))
  let E := positiveMomentRoot (m+2) (longPrefixMomentError s mask hmask Γ B K ρ ((n:ℝ)^(-ζ)) p H k hk m)
  let S := positiveMomentRoot (m+2)
    (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T (m+2) n)
  have hQ : 0≤Q := normalizedPairSum_nonneg p _ (fun q=>
    (s.cumulative_bounds _ (fun j=>hmask j q) _ (s.deadline_nonneg (fun j=>mask j p))).1)
  have ha : 0≤jointLongShortCoefficient ζ m n :=
    (positiveMomentRoot_nonneg _ _).trans (le_max_left _ _)
  have he : E≤longRootErrorCoefficient Γ K T ξ hξ ζ m n*Real.log n :=
    (div_le_iff₀ (log_nat_pos hn)).mp
      (longPrefixMomentError_root_div_log_le s mask hmask Γ B K ρ T ξ ζ hξ hζ p H k hk m hn hdeadline hT)
  have hbase : 0≤jointLongShortCoefficient ζ m n*Q+E+S*(T^2*Real.log n) :=
    add_nonneg (add_nonneg (mul_nonneg ha hQ) (positiveMomentRoot_nonneg _ _))
      (mul_nonneg (positiveMomentRoot_nonneg _ _) (mul_nonneg (sq_nonneg _) (log_nat_pos hn).le))
  have hline : jointLongShortCoefficient ζ m n*Q+E+S*(T^2*Real.log n)≤
      jointLongShortCoefficient ζ m n*Q+jointLongShortErrorCoefficient Γ K T ξ hξ δ d γ ζ m n*Real.log n := by
    calc
      _ ≤ jointLongShortCoefficient ζ m n*Q+
          longRootErrorCoefficient Γ K T ξ hξ ζ m n*Real.log n+S*(T^2*Real.log n) :=
        add_le_add (add_le_add le_rfl he) le_rfl
      _ = _ := by unfold jointLongShortErrorCoefficient; dsimp only [S]; ring
  have hh := longSaved_add_prefixLate_moment ξ hξ s mask hmask Γ B K ρ δ d γ ζ T M p H
    hn hB hH hK0 hK2 hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ hp k hk hdeadline hT m hm
  exact hh.trans (pow_le_pow_left₀ hbase hline (m+2))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.tendsto_jointLongShortErrorCoefficient
#print axioms NoThreeLine.BirthWitness.longPrefixMomentError_uniform_small
#print axioms NoThreeLine.BirthWitness.longSaved_add_prefixLate_moment_small_error
