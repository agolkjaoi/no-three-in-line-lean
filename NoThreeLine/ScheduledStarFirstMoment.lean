import NoThreeLine.ShortStarFirstMoment
import NoThreeLine.ScheduledStarFutureTower
import NoThreeLine.ScheduledStarCoarseRow

/-! The true one-star mean under the full-J law. The bound uses elapsed
time across all earlier phases, and retains the actual current mask. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

theorem cutUnitPrice_le_elapsed {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (N : ℕ) (t : ℝ) (ht : 0≤t) (q : Grid n) :
    cutUnitPrice cs N t q≤(phaseEndpoint cs start N-start+t)/n := by
  unfold cutUnitPrice
  apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
  have hs := Finset.sum_le_sum (s:=Finset.range N) (fun j _=>
    mul_le_of_le_one_right (cs j).horizon.coe_nonneg ((cs j).mask_le_one q))
  have ht' := mul_le_of_le_one_right ht ((cs N).mask_le_one q)
  have he : phaseEndpoint cs start N-start+t=(∑j∈Finset.range N,((cs j).horizon:ℝ))+t := by
    simp [phaseEndpoint]
  rw [he]
  exact add_le_add hs ht'

theorem weightedCutStarPriceSum_le_elapsed {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (Γ : Finset ZPoint) (p : Grid n) (H start : ℝ)
    (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1)
    (hn : 0<n) (N : ℕ) (t : ℝ) (ht : 0≤t) :
    weightedCutStarPriceSum Γ p H w cs N t≤
      16*(phaseEndpoint cs start N-start+t)*(n:ℝ)*(1+Real.log n) := by
  classical
  have hN : 0<(n:ℝ) := by exact_mod_cast hn
  have hτ := scheduled_elapsed_nonneg cs start N t ht
  calc
    _ ≤ ∑_s : ↥(shortStars Γ p H),(phaseEndpoint cs start N-start+t)/n := by
      apply Finset.sum_le_sum
      intro s _
      exact (mul_le_of_le_one_left (cutUnitPrice_nonneg cs N t ht s.val.2) (hw s).2).trans
        (cutUnitPrice_le_elapsed cs start N t ht s.val.2)
    _ = ((shortStars Γ p H).card:ℝ)*((phaseEndpoint cs start N-start+t)/n) := by simp
    _ ≤ (16*(n:ℝ)^2*(1+Real.log n))*((phaseEndpoint cs start N-start+t)/n) :=
      mul_le_mul_of_nonneg_right (shortStars_card_le_log Γ p H) (div_nonneg hτ hN.le)
    _ = _ := by field_simp

attribute [local irreducible] weightedStarIntensity scheduledCutWitness

theorem scheduledStar_future_firstMoment_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (N J : ℕ) (hNJ : N<J) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo (0:ℝ) (cs N).horizon,
    (∫ω,weightedStarIntensity Γ p H (fun s=>(cs N).mask s.val.1)
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
      ∂phasePointMeasure cs ε M deadline start hn hB p J)≤
      16*(phaseEndpoint cs start N-start+t)*(n:ℝ)*(1+Real.log n)/(1-ε)^3 := by
  let w : ↥(shortStars Γ p H)→ℝ := fun s=>(cs N).mask s.val.1
  have hw (s) : 0≤w s ∧ w s≤1 := ⟨(cs N).mask_nonneg s.val.1,(cs N).mask_le_one s.val.1⟩
  have he := scheduledCutStarPower_terminal_mean_ae cs ε M deadline start hn hB Γ p H w hw 1 N J hNJ
  simp only [pow_one] at he
  filter_upwards [he] with t htower
  intro ht
  rw [htower ht]
  exact (initial_scheduledCutPoint_intensity_firstMoment Γ p H w (fun s=>(hw s).1)
    cs ε M deadline start hn hB hΓ hK hε0 hε N t ⟨ht.1.le,ht.2.le⟩).trans
      (div_le_div_of_nonneg_right
        (weightedCutStarPriceSum_le_elapsed cs Γ p H start w hw hn N t ht.1.le)
        (pow_nonneg (sub_nonneg.mpr hε.le) _))

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.cutUnitPrice_le_elapsed
#print axioms NoThreeLine.ShortStars.weightedCutStarPriceSum_le_elapsed
#print axioms NoThreeLine.ShortStars.scheduledStar_future_firstMoment_ae
