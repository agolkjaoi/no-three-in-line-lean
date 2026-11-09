import NoThreeLine.ScheduledStarExceptionDecay
import NoThreeLine.ShortStarMaskedPower

/-! Fixed high-degree short-star cut moment with explicit decaying errors.
The exact current-mask main row is preserved. This is a cut-law theorem,
not a future-density or time-integrated stopping theorem. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Filter
open scoped BigOperators Topology

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness AuxiliaryODE MixedConnection

def starErrorEnvelope (ξ : ℝ) (hξ : 0<ξ) (g : ℕ) (δ C d γ ζ T : ℝ) (m n : ℕ) : ℝ :=
  repeatDecayEnvelope δ (16*C) d γ ζ m n+exceptionDecayEnvelope ξ hξ g δ C d γ ζ T m n

def starEtaMultiplier (ζ : ℝ) (m n : ℕ) : ℝ :=
  1/(1-(n:ℝ)^(-ζ))^(2*m+1).choose 2

theorem tendsto_starErrorEnvelope (ξ : ℝ) (hξ : 0<ξ) (g : ℕ)
    (δ C d γ ζ T : ℝ) (m : ℕ) (hξ1 : ξ<1) (hd : d<γ) (hγ : γ<1) (hζ : 0<ζ) :
    Tendsto (starErrorEnvelope ξ hξ g δ C d γ ζ T m) atTop (𝓝 0) := by
  unfold starErrorEnvelope
  simpa only [zero_add] using (tendsto_repeatDecayEnvelope δ (16*C) d γ ζ m hd hζ).add
    (tendsto_exceptionDecayEnvelope ξ hξ g δ C d γ ζ T m hξ1 hd hγ hζ)

theorem tendsto_starEtaMultiplier (ζ : ℝ) (hζ : 0<ζ) (m : ℕ) :
    Tendsto (starEtaMultiplier ζ m) atTop (𝓝 1) := by
  have he := FiniteWitnessMoments.tendsto_nat_rpow_negative ζ hζ
  have hd := ((tendsto_const_nhds (x:=(1:ℝ))).sub he).pow ((2*m+1).choose 2)
  have h := (tendsto_const_nhds (x:=(1:ℝ))).div hd (by simp)
  convert h using 1 <;> first | rfl | simp

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem initial_scheduledCutPoint_maskedIntensity_asymptotic_bound (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (hτγ : (n:ℝ)^(γ-1)≤phaseEndpoint cs start k-start+t)
    (hτT : phaseEndpoint cs start k-start+t≤T) (m : ℕ) (hm : 3≤m) :
    (∫ω,(weightedStarIntensity Γ p H (fun s=>(cs k).mask s.val.1)
      (scheduledCutWitness cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n)
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))^m
      ∂scheduledCutPointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p k t)≤
      starEtaMultiplier ζ m n*(maskedCutStarPriceSum Γ p H cs k t)^m+
      starErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n*
        ((phaseEndpoint cs start k-start+t)*(n:ℝ)*(1+Real.log n))^m := by
  classical
  have hn0 : 0<n := by omega
  have hN : 0<(n:ℝ) := by exact_mod_cast hn0
  have hτ : 0<phaseEndpoint cs start k-start+t := (Real.rpow_pos_of_pos hN (γ-1)).trans_le hτγ
  have hL : 0<1+Real.log (n:ℝ) := by linarith [FiniteWitnessMoments.log_nat_pos hn]
  have hQ : 0<((phaseEndpoint cs start k-start+t)*(n:ℝ)*(1+Real.log n))^m :=
    pow_pos (mul_pos (mul_pos hτ hN) hL) m
  have he0 : 0≤(n:ℝ)^(-ζ) := Real.rpow_nonneg hN.le _
  have he1 : (n:ℝ)^(-ζ)<1 := Real.rpow_lt_one_of_one_lt_of_neg (by exact_mod_cast (show 1<n by omega)) (neg_neg_of_pos hζ)
  have hmain := initial_scheduledCutPoint_maskedIntensity_moment ξ hξ cs ((n:ℝ)^(-ζ)) M deadline
    start K ρ δ p hn0 hB Γ H ((n:ℝ)^γ) hH (Real.rpow_pos_of_pos hN γ)
    hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK he0 he1 k t ht m (by omega)
  have hr := (div_le_iff₀ hQ).mp (actual_repeatBudget_div_le_decay cs Γ p H K start δ d γ ζ k t
    hn (zero_le_one.trans hB) hH hδ.le ht.1 hΓ hK hK2 hHlog hBd hτγ hd hζ m)
  have hx := (div_le_iff₀ hQ).mp (actual_exceptionBudgets_div_le_decay ξ hξ cs Γ p H K start δ d γ ζ T k t
    hn hH hδ.le ht.1 hΓ hK hK2 hHlog hBd hτ hτT hζ m hm)
  unfold shortStarMomentBudget at hmain
  unfold starErrorEnvelope starEtaMultiplier
  simp only [div_eq_mul_inv,one_mul] at hmain ⊢
  nlinarith only [hmain,hr,hx]

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.tendsto_starErrorEnvelope
#print axioms NoThreeLine.ShortStars.tendsto_starEtaMultiplier
#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_maskedIntensity_asymptotic_bound
