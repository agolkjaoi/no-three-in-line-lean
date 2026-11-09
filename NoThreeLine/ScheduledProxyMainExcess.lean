import NoThreeLine.ScheduledProxyPartition
import NoThreeLine.ScheduledLineMainPath

/-! Actual scheduled proxy bounded by actual short-star time mass,
actual long-line selected-witness main mass, and the already bounded
long-line excess. Original board, deadlines, masks, and gates are retained. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections ShortStars

def scheduledLongMainPath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (H : ℝ) (ω : BoardClockPath n) : ℝ :=
  ∑L∈longRootBoardLines Γ p H,
    (∑z∈L.val.val.erase p,∑N∈Finset.range J,
      scheduledLineMainPath cs ε M deadline start hn hB (cs N).mask L.val p z N ω)/n

theorem scheduledLongMainPath_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (H : ℝ)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledLongMainPath cs ε M deadline start hn hB Γ p J H) μ := by
  apply integrable_finsetSum
  intro L _
  apply Integrable.div_const
  exact integrable_finsetSum _ (fun z _=>integrable_finsetSum _ (fun N _=>
    scheduledLineMainPath_integrable cs ε M deadline start hn hB (cs N).mask
      (cs N).mask_nonneg L.val p z N μ))

theorem scheduledOutsideLongProxyPath_le_main_excess {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (ℓ : ℝ) (ω : BoardClockPath n) :
    scheduledOutsideLongProxyPath cs ε M deadline start hn hB Γ p J (B*ℓ) ω ≤
      scheduledLongMainPath cs ε M deadline start hn hB Γ p J (B*ℓ) ω +
      scheduledLongExcessPath cs ε M deadline start hn hB Γ p J ℓ ω := by
  unfold scheduledOutsideLongProxyPath scheduledLongMainPath scheduledLongExcessPath scheduledLineWitnessPath
  rw [←Finset.sum_add_distrib]
  apply Finset.sum_le_sum
  intro L _
  calc
    _ ≤ ∑N∈Finset.range J,
        (∑z∈L.val.val.erase p,
          (scheduledLineMainPath cs ε M deadline start hn hB (cs N).mask L.val p z N ω+
           scheduledLineExcessPath cs ε M deadline start hn hB (cs N).mask L.val p z N ω))/n :=
      Finset.sum_le_sum (fun N _=>scheduledOutsideLineProxyPath_le_main_excess cs ε M deadline start hn hB L.val p N ω)
    _ = _ := by
      rw [←Finset.sum_div,Finset.sum_comm]
      simp only [Finset.sum_add_distrib,add_div]

theorem scheduledOutsideProxyPath_le_stars_main_excess {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (J : ℕ)
    (ℓ : ℝ) (ω : BoardClockPath n) :
    scheduledOutsideProxyPath cs ε M deadline start hn hB Γ p J ω ≤
      scheduledStarLatePath cs ε M deadline start hn hB Γ p (B*ℓ) J
        (fun _=>0) (fun N=>(cs N).horizon) ω/n +
      scheduledLongMainPath cs ε M deadline start hn hB Γ p J (B*ℓ) ω +
      scheduledLongExcessPath cs ε M deadline start hn hB Γ p J ℓ ω := by
  rw [scheduledOutsideProxyPath_partition cs ε M deadline start hn hB Γ p J (B*ℓ) ω]
  exact (add_le_add (scheduledOutsideShortProxyPath_le_stars cs ε M deadline start hn hB Γ p J (B*ℓ) ω)
    (scheduledOutsideLongProxyPath_le_main_excess cs ε M deadline start hn hB Γ p J ℓ ω)).trans_eq (add_assoc _ _ _).symm

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledLongMainPath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledOutsideLongProxyPath_le_main_excess
#print axioms NoThreeLine.BirthWitness.scheduledOutsideProxyPath_le_stars_main_excess
