import NoThreeLine.ScheduledBoardLabels

/-! The actual board-label estimate has a fixed-degree constant times
(elapsed/n)^|D| when eta is stopped above one half. No board-size factor is
hidden in that constant, and elapsed includes the entire schedule prefix. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines

def boardLabelConstant (Γ : Finset ZPoint) (K δ : ℝ) (c d l : ℕ) : ℝ :=
  ((2:ℝ)^Γ.card)^c * (δ^(c^3))⁻¹ * (2:ℝ)^(l.choose 2) * (starPriceMultiplier Γ K)^d

theorem boardLabelConstant_pos (Γ : Finset ZPoint) (K δ : ℝ) (hδ : 0<δ)
    (c d l : ℕ) : 0<boardLabelConstant Γ K δ c d l := by
  unfold boardLabelConstant starPriceMultiplier
  have hh : 0<max 1 (AuxiliaryODE.protection 1 K) := lt_of_lt_of_le zero_lt_one (le_max_left _ _)
  positivity

theorem cutSelectedCoarsePrice_prod_le_time {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (Γ : Finset ZPoint) (K start : ℝ) (k : ℕ) (t : ℝ)
    (ht : 0≤t) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K≤K) (hK2 : K<2)
    (D : Finset (Grid n)) :
    (∏q∈D,cutSelectedCoarsePrice cs start k t q) ≤
      ((phaseEndpoint cs start k-start+t)/n * starPriceMultiplier Γ K)^D.card := by
  calc
    _ ≤ ∏_q∈D,((phaseEndpoint cs start k-start+t)/n * starPriceMultiplier Γ K) :=
      Finset.prod_le_prod (fun q _=>cutSelectedCoarsePrice_nonneg cs start k t ht q)
        (fun q _=>(cutSelectedCoarsePrice_le_cap cs start k t ht q).trans
          (coarseCutPriceCap_le_common cs Γ K start k t ht hΓ hK hK2))
    _ = _ := by simp

theorem div_eta_pow_le_half (a ε : ℝ) (ha : 0≤a) (hε : ε≤1/2) (d : ℕ) :
    a/(1-ε)^d ≤ a*(2:ℝ)^d := by
  have hh : (1/2:ℝ)≤1-ε := by linarith
  have hd : (1/2:ℝ)^d≤(1-ε)^d := pow_le_pow_left₀ (by norm_num) hh d
  calc
    _ ≤ a/(1/2:ℝ)^d := div_le_div_of_nonneg_left ha (by positivity) hd
    _ = _ := by rw [div_eq_mul_inv, ←inv_pow]; norm_num

theorem initial_scheduledCutBoard_activeSelected_time_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (hCDL : C∪D⊆L)
    (hΓ : ∀j,(cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε≤1/2) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫ω,activeSelectedIndicator C D
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
      ∂boardClockMeasure n (B/n)) ≤
      boardLabelConstant Γ K δ C.card D.card L.card *
        ((phaseEndpoint cs start k-start+t)/n)^D.card := by
  have hb := initial_scheduledCutBoard_activeSelected_coarse_product cs ε M deadline start K ρ δ
    p hn hB Γ C D L hp hCDL hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 (by linarith) k t ht
  have hprod0 : 0≤∏q∈D,cutSelectedCoarsePrice cs start k t q :=
    Finset.prod_nonneg (fun q _=>cutSelectedCoarsePrice_nonneg cs start k t ht.1 q)
  have hprod := cutSelectedCoarsePrice_prod_le_time cs Γ K start k t ht.1 hΓ hK hK2 D
  have hratio := (div_eta_pow_le_half _ ε hprod0 hε (L.card.choose 2)).trans
    (mul_le_mul_of_nonneg_right hprod (by positivity : 0≤(2:ℝ)^(L.card.choose 2)))
  apply hb.trans
  calc
    _ ≤ ((2:ℝ)^Γ.card)^C.card * ((δ^(C.card^3))⁻¹ *
        ((((phaseEndpoint cs start k-start+t)/n) * starPriceMultiplier Γ K)^D.card *
          (2:ℝ)^(L.card.choose 2))) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hratio (by positivity)) (by positivity)
    _ = _ := by unfold boardLabelConstant; rw [mul_pow]; ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCutBoard_activeSelected_time_bound
