import NoThreeLine.ScheduledStarIntegralMoment
import NoThreeLine.BoundedIntegralTail

/-! The actual current-mask intensity integrated over deterministic local
phase windows and summed on the original board path. Windows may be empty. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteMomentIntegral

def scheduledStarPhasePath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (N : ℕ) (a b : ℝ) (ω : BoardClockPath n) : ℝ :=
  ∫t in Ioo a b,weightedStarIntensity Γ p H (fun s=>(cs N).mask s.val.1)
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t))

def scheduledStarLatePath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (J : ℕ) (a b : Fin J→ℝ) (ω : BoardClockPath n) : ℝ :=
  ∑N : Fin J,scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N (a N) (b N) ω

def starLatePrice {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (J : ℕ) (a b : Fin J→ℝ) : ℝ :=
  ∑N : Fin J,∫t in Ioo (a N) (b N),maskedCutStarPriceSum Γ p H cs N t

def starLateScale {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (J : ℕ) (a b : Fin J→ℝ) : ℝ :=
  ∑N : Fin J,∫t in Ioo (a N) (b N),(phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem scheduledStarPhasePath_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (N : ℕ) (a b : ℝ) :
    Measurable (scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N a b) :=
  ((weightedStarIntensity_measurable Γ p H (fun s=>(cs N).mask s.val.1)).comp
    (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)).stronglyMeasurable.integral_prod_right'.measurable

theorem scheduledStarPhasePath_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (N : ℕ) (a b : ℝ) (ω : BoardClockPath n) :
    0≤scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N a b ω ∧
      scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N a b ω≤
        (volume.restrict (Ioo a b)).real univ*(((shortStars Γ p H).card:ℝ)*B) :=
  bounded_integral_bounds (volume.restrict (Ioo a b)) _
    ((weightedStarIntensity_measurable Γ p H (fun s=>(cs N).mask s.val.1)).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)) _
    (fun x=>weightedStarIntensity_bounds Γ p H _
      (fun s=>⟨(cs N).mask_nonneg s.val.1,(cs N).mask_le_one s.val.1⟩) _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N x)) ω

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarPhasePath_measurable
#print axioms NoThreeLine.ShortStars.scheduledStarPhasePath_bounds
