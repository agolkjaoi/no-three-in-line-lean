import NoThreeLine.ScheduledProxyMainExcess
import NoThreeLine.ScheduledStarPartition

/-! The unchanged actual outside risk is bounded by two main paths and
three explicit additive errors on every board path. No main-path moment
or saved-birth-record comparison is assumed in this decomposition. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines ShortStars

def scheduledRiskErrorPath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start ρ : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ℓ τ : ℝ) (ω : BoardClockPath n) : ℝ :=
  scheduledStarEarlyPath cs ε M deadline start hn hB Γ p (B*ℓ) τ J ω+
  scheduledLongExcessPath cs ε M deadline start hn hB Γ p J ℓ ω+
  scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω/ρ

theorem scheduledLongExcessPath_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ℓ : ℝ) (ω : BoardClockPath n) :
    0≤scheduledLongExcessPath cs ε M deadline start hn hB Γ p J ℓ ω := by
  apply Finset.sum_nonneg
  intro L _
  apply div_nonneg _ (Nat.cast_nonneg n)
  apply Finset.sum_nonneg
  intro z _
  apply Finset.sum_nonneg
  intro N _
  exact (scheduledLineExcessPath_bounds cs ε M deadline start hn hB (cs N).mask
    (fun q=>⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩) L.val p z N ω).1

theorem scheduledLongExcessPath_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ℓ : ℝ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledLongExcessPath cs ε M deadline start hn hB Γ p J ℓ) μ :=
  integrable_finsetSum _ (fun L _=>scheduledLineWitnessPath_integrable cs ε M deadline start hn hB L.val p J μ)

theorem scheduledRiskErrorPath_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start ρ : ℝ) (hn : 0<n) (hB : 1≤B) (hρ : 0≤ρ)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) (p : Grid n) (J : ℕ) (ℓ τ : ℝ) (ω : BoardClockPath n) :
    0≤scheduledRiskErrorPath cs ε M deadline start ρ hn hB Γ p J ℓ τ ω :=
  add_nonneg (add_nonneg (scheduledStarEarlyPath_nonneg cs ε M deadline start hn hB Γ p (B*ℓ) τ J ω)
    (scheduledLongExcessPath_nonneg cs ε M deadline start hn hB Γ p J ℓ ω))
    (div_nonneg (scheduledRootCreditLossPath_nonneg cs ε M deadline start hn hB Γ hΓ p J ω) hρ)

theorem scheduledRiskErrorPath_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start ρ : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) (p : Grid n) (J : ℕ) (ℓ τ : ℝ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledRiskErrorPath cs ε M deadline start ρ hn hB Γ p J ℓ τ) μ :=
  ((scheduledStarEarlyPath_integrable cs ε M deadline start hn hB Γ p (B*ℓ) τ J μ).add
    (scheduledLongExcessPath_integrable cs ε M deadline start hn hB Γ p J ℓ μ)).add
    ((scheduledRootCreditLossPath_integrable cs ε M deadline start hn hB Γ hΓ p J μ).div_const ρ)

theorem scheduledRiskErrorPath_integral {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start ρ : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) (p : Grid n) (J : ℕ) (ℓ τ : ℝ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    (∫ω,scheduledRiskErrorPath cs ε M deadline start ρ hn hB Γ p J ℓ τ ω ∂μ)=
      (∫ω,scheduledStarEarlyPath cs ε M deadline start hn hB Γ p (B*ℓ) τ J ω ∂μ)+
      (∫ω,scheduledLongExcessPath cs ε M deadline start hn hB Γ p J ℓ ω ∂μ)+
      (∫ω,scheduledRootCreditLossPath cs ε M deadline start hn hB Γ p J ω ∂μ)/ρ := by
  have hi := scheduledStarEarlyPath_integrable cs ε M deadline start hn hB Γ p (B*ℓ) τ J μ
  have hj := scheduledLongExcessPath_integrable cs ε M deadline start hn hB Γ p J ℓ μ
  have hk := scheduledRootCreditLossPath_integrable cs ε M deadline start hn hB Γ hΓ p J μ
  unfold scheduledRiskErrorPath
  have he := integral_add (hi.add hj) (hk.div_const ρ)
  simp only [Pi.add_apply] at he
  rw [he,integral_add hi hj,integral_div]

theorem scheduledOutsideRiskPath_le_main_error {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start ρ : ℝ)
    (hn : 0<n) (hB : 1≤B) (hρ : 0<ρ) (Γ : Finset ZPoint)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hρcfg : ∀j,ρ≤(cs j).rho)
    (p : Grid n) (J : ℕ) (ℓ τ : ℝ) (ω : BoardClockPath n) :
    scheduledOutsideRiskPath cs ε M deadline start hn hB Γ p J ω≤
      scheduledLongMainPath cs ε M deadline start hn hB Γ p J (B*ℓ) ω+
      scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p (B*ℓ) τ J ω+
      scheduledRiskErrorPath cs ε M deadline start ρ hn hB Γ p J ℓ τ ω := by
  have herror := (scheduledOutsideRiskPath_proxy_error cs ε M deadline start ρ hn hB hρ Γ hΓ hK hρcfg p J ω).2
  have hproxy := scheduledOutsideProxyPath_le_stars_main_excess cs ε M deadline start hn hB Γ p J ℓ ω
  have hstar : scheduledStarLatePath cs ε M deadline start hn hB Γ p (B*ℓ) J
      (fun _=>0) (fun N=>(cs N).horizon) ω/n=scheduledStarFullPath cs ε M deadline start hn hB Γ p (B*ℓ) J ω := by
    unfold scheduledStarLatePath scheduledStarFullPath
    dsimp only
    rw [Fin.sum_univ_eq_sum_range (fun N : ℕ=>scheduledStarPhasePath cs ε M deadline start hn hB Γ p (B*ℓ) N 0 (cs N).horizon ω)]
  rw [hstar,←scheduledStar_early_add_late_eq_full cs ε M deadline start hn hB Γ p (B*ℓ) τ J ω] at hproxy
  unfold scheduledRiskErrorPath
  linarith

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledRiskErrorPath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledOutsideRiskPath_le_main_error
