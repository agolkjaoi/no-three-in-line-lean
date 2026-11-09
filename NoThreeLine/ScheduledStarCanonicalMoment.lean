import NoThreeLine.ScheduledStarPartition
import NoThreeLine.ScheduledStarLateScale

/-! The canonical elapsed cutoff n^(gamma-1), with the final 1/n
normalization. The integrated error is bounded independently of the phase
count by T^2 log n times a coefficient tending to zero. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteMomentIntegral

theorem starLatePrice_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (J : ℕ) (a b : Fin J→ℝ) (ha : ∀N,0≤a N) :
    0≤starLatePrice cs Γ p H J a b := by
  apply Finset.sum_nonneg
  intro N _
  apply integral_nonneg_of_ae
  filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
  exact Finset.sum_nonneg (fun s _=>mul_nonneg ((cs N).mask_nonneg s.1)
    (cutUnitPrice_nonneg cs N t ((ha N).trans ht.1.le) s.2))

theorem starLateScale_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (hn : 2≤n) (J : ℕ) (a b : Fin J→ℝ) (ha : ∀N,0≤a N) :
    0≤starLateScale cs start J a b := by
  apply Finset.sum_nonneg
  intro N _
  apply integral_nonneg_of_ae
  filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
  exact mul_nonneg (mul_nonneg (add_nonneg (phase_elapsed_nonneg cs start N) ((ha N).trans ht.1.le))
    (Nat.cast_nonneg n)) (FiniteWitnessMoments.log_nat_pos hn).le

attribute [local irreducible] scheduledStarPhasePath scheduledStarLatePath

theorem scheduledStarCanonicalLatePath_log_moment (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (J m : ℕ) (hm : 3≤m) (hT : phaseEndpoint cs start J-start≤T) :
    (∫ω,(scheduledStarCanonicalLatePath cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB Γ p H
      ((n:ℝ)^(γ-1)) J ω)^m
      ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J)≤
    (positiveMomentRoot m (starEtaMultiplier ζ m n)*
        (starLatePrice cs Γ p H J (fun N=>latePhaseStart cs ((n:ℝ)^(γ-1)) N) (fun N=>(cs N).horizon)/n)+
      positiveMomentRoot m (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n)*
        (T^2*Real.log n))^m := by
  let a := fun N : Fin J=>latePhaseStart cs ((n:ℝ)^(γ-1)) N
  let b := fun N : Fin J=>((cs N).horizon:ℝ)
  have ha (N) : 0≤a N := latePhaseStart_nonneg cs _ N
  have hb (N) : b N≤((cs N).horizon:ℝ) := le_rfl
  have hτγ (N : Fin J) : (n:ℝ)^(γ-1)≤phaseEndpoint cs start N-start+a N := latePhaseStart_elapsed cs _ start N
  have hτT (N : Fin J) : phaseEndpoint cs start N-start+b N≤T := (phase_end_elapsed_le cs start N J N.isLt).trans hT
  let A := positiveMomentRoot m (starEtaMultiplier ζ m n)
  let E := positiveMomentRoot m (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n)
  let P := starLatePrice cs Γ p H J a b
  let Q := starLateScale cs start J a b
  have hP : 0≤P := starLatePrice_nonneg cs Γ p H J a b ha
  have hQ : 0≤Q := starLateScale_nonneg cs start hn J a b ha
  have hs : Q≤T^2*(n:ℝ)*Real.log n := starLateScale_le cs start T hn J a b ha hb hT
  have hM := scheduledStarLatePath_log_moment ξ hξ cs M deadline start K ρ δ d γ ζ T p hn hB
    Γ H hH hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ J m hm a b ha hb hτγ hτT
  have hbase : 0≤A*P+E*Q := add_nonneg (mul_nonneg (positiveMomentRoot_nonneg _ _) hP)
    (mul_nonneg (positiveMomentRoot_nonneg _ _) hQ)
  have hbound := hM.trans (pow_le_pow_left₀ hbase
    (add_le_add le_rfl (mul_le_mul_of_nonneg_left hs (positiveMomentRoot_nonneg m _))) m)
  have hN : (n:ℝ)≠0 := by exact_mod_cast (show n≠0 by omega)
  calc
    _ = (∫ω,(scheduledStarLatePath cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB Γ p H J a b ω)^m
        ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J)/(n:ℝ)^m := by
      simp only [scheduledStarCanonicalLatePath,div_pow,integral_div,a,b]
    _ ≤ (A*P+E*(T^2*(n:ℝ)*Real.log n))^m/(n:ℝ)^m :=
      div_le_div_of_nonneg_right hbound (pow_nonneg (Nat.cast_nonneg n) m)
    _ = _ := by
      rw [←div_pow]
      congr 1
      change (A*P+E*(T^2*(n:ℝ)*Real.log n))/(n:ℝ)=A*(P/n)+E*(T^2*Real.log n)
      field_simp <;> ring

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarCanonicalLatePath_log_moment
