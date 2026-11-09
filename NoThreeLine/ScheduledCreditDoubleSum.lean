import NoThreeLine.ScheduledCreditPathRegularity
import NoThreeLine.ScheduledCreditComparisonIndices
import NoThreeLine.CalendarFiniteSum

/-! Sum every actual time triangle and earlier-phase rectangle under one
full terminal point probability. The complete time budget costs total
duration, not the number of phases, times the actual diagonal path sum. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines CalendarIntegral

def scheduledCreditDoublePath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑ N ∈ Finset.range J, ((∑ j ∈ Finset.range N,
    scheduledCreditRectanglePath cs ε M deadline start hn hB L p j N ω)+
    scheduledCreditTrianglePath cs ε M deadline start hn hB L p N ω)

theorem scheduledCreditDoublePath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (J : ℕ)
    (hL : ∀ N, ¬specified (cs N).directions L) (hpL : p ∈ L.val)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledCreditDoublePath cs ε M deadline start hn hB L p J) μ :=
  integrable_finsetSum _ (fun N _ => (integrable_finsetSum _ (fun j _ =>
    scheduledCreditRectanglePath_integrable cs ε M deadline start hn hB L p j N (hL N) hpL μ)).add
      (scheduledCreditTrianglePath_integrable cs ε M deadline start hn hB L p N (hL N) hpL μ))

theorem scheduledCreditDoublePath_terminal_bound {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2) (J : ℕ)
    (L : LineIndex n) (hL : ¬specified Γ L) (p : Grid n) (hpL : p ∈ L.val)
    (hε0 : 0 ≤ ε) (hε : ε < 1) :
    (∫ ω, scheduledCreditDoublePath cs ε M deadline start hn hB L p J ω
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ≤
    phaseEndpoint cs 0 J/(1-ε)*(∫ ω, (∑ j ∈ Finset.range J,
      scheduledCreditMassPath cs ε M deadline start hn hB L p j ω)
      ∂phasePointMeasure cs ε M deadline start hn hB p J) := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hLi (N : ℕ) : ¬specified (cs N).directions L := by simpa only [hΓ N] using hL
  let a := fun j => ∫ ω, scheduledCreditMassPath cs ε M deadline start hn hB L p j ω ∂μ
  have ha (j : ℕ) : 0 ≤ a j := integral_nonneg
    (fun ω => (scheduledCreditMassPath_bounds cs ε M deadline start hn hB L p j ω).1)
  have hrect (j N : ℕ) := scheduledCreditRectanglePath_integrable cs ε M deadline start hn hB L p j N (hLi N) hpL μ
  have htri (N : ℕ) := scheduledCreditTrianglePath_integrable cs ε M deadline start hn hB L p N (hLi N) hpL μ
  have hsum (N : ℕ) : Integrable (fun ω => (∑ j ∈ Finset.range N,
      scheduledCreditRectanglePath cs ε M deadline start hn hB L p j N ω)+
      scheduledCreditTrianglePath cs ε M deadline start hn hB L p N ω) μ :=
    (integrable_finsetSum _ (fun j _ => hrect j N)).add (htri N)
  calc
    _ = ∑ N ∈ Finset.range J, ((∑ j ∈ Finset.range N,
        ∫ ω, scheduledCreditRectanglePath cs ε M deadline start hn hB L p j N ω ∂μ)+
        ∫ ω, scheduledCreditTrianglePath cs ε M deadline start hn hB L p N ω ∂μ) := by
      simp only [scheduledCreditDoublePath]
      rw [integral_finsetSum _ (fun N _ => hsum N)]
      apply Finset.sum_congr rfl
      intro N _
      rw [integral_add (integrable_finsetSum _ (fun j _ => hrect j N)) (htri N),
        integral_finsetSum _ (fun j _ => hrect j N)]
    _ ≤ ∑ N ∈ Finset.range J, ((cs N).horizon/(1-ε))*((∑ j ∈ Finset.range N, a j)+a N) := by
      apply Finset.sum_le_sum
      intro N hN
      have hNJ := Finset.mem_range.mp hN
      have hs := Finset.sum_le_sum (s := Finset.range N) (fun j hj =>
        scheduled_cross_phase_creditRectangle_bound_of_lt cs ε M deadline start hn hB Γ hΓ hK j N J
          (Finset.mem_range.mp hj) hNJ L hL p hpL hε0 hε)
      have ht := scheduled_same_phase_creditTriangle_bound_of_lt cs ε M deadline start hn hB N J hNJ
        (hK N) L (hLi N) p hpL hε0 hε
      simpa only [Finset.mul_sum,mul_add] using add_le_add hs ht
    _ ≤ phaseEndpoint cs 0 J/(1-ε)*(∑ j ∈ Finset.range J, a j) := by
      simpa only [phaseEndpoint,zero_add,NNReal.coe_sum] using
        weighted_prefix_div_sum_le_total J (fun N => (cs N).horizon) a (1-ε) (sub_nonneg.mpr hε.le)
          (fun N _ => (cs N).horizon.coe_nonneg) (fun j _ => ha j)
    _ = _ := by rw [integral_finsetSum _ (fun j _ => scheduledCreditMassPath_integrable cs ε M deadline start hn hB L p j μ)]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCreditDoublePath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledCreditDoublePath_terminal_bound
