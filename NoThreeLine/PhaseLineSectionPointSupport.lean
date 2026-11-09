import NoThreeLine.PhaseLineSectionActiveSupport
import NoThreeLine.PhaseLineSectionProduct

/-! The original full-phase point law is supported on active additional
snapshots for an initially active root. The argument uses the actual tested
credit transport, not pathwise saved/current credit identification. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE
attribute [local instance] Classical.propDecidable

theorem initial_phaseSectionPoint_active_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) (hB : 1 ≤ B)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status = .active) (k : ℕ) :
    ∀ᵐ ω ∂phasePointMeasure cs ε M deadline start hn hB p k,
      ((phaseSectionRecycledState cs ε M deadline start L p E A hn
        (initialPhaseSection B hB p deadline start) k ω).val.2.2.physical.process.accounts p).status = .active := by
  let ν := phasePointMeasure cs ε M deadline start hn hB p k
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p k
  let V := phaseSectionRecycledState cs ε M deadline start L p E A hn (initialPhaseSection B hB p deadline start) k
  let F : AugmentedState n → ℝ := fun a => if (a.physical.process.accounts p).status = .active then 0 else 1
  have hFm : Measurable F := Measurable.ite
    ((CreditAccount.measurable_status.comp ((ProcessState.measurable_account n p).comp
      ((ExtendedState.measurable_process n).comp (AugmentedState.measurable_physical n)))).eq_const CreditStatus.active).setOf
      measurable_const measurable_const
  have hFb (a : AugmentedState n) : 0 ≤ F a ∧ F a ≤ 1 := by
    dsimp only [F]
    split_ifs <;> norm_num
  have hFD (a : AugmentedState n) (_ha : a.Valid B) : |F a| ≤ 1 := by
    simpa only [abs_of_nonneg (hFb a).1] using (hFb a).2
  have hv : Measurable V := (phaseSectionRecycledPair_measurable cs ε M deadline start L p E A hn
    (initialPhaseSection B hB p deadline start) k).fst.snd
  have hi : Integrable (fun ω => F (V ω).val.2.2) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      (hFm.comp hv.subtype_val.snd.snd) 1 (fun ω => hFb _)
  have hzero : (∫ ω, F (V ω).val.2.2 ∂ν) = 0 := by
    rw [initial_phaseSection_point_integral cs ε M deadline start L p E A F hFm 1 hFD hn hB k]
    apply integral_eq_zero_of_ae
    exact ae_of_all _ (fun ω => by
      change ((V ω).val.2.2.physical.process.accounts p).credit * F (V ω).val.2.2 = 0
      by_cases ha : ((V ω).val.2.2.physical.process.accounts p).status = .active
      · simp only [F,if_pos ha,mul_zero]
      · have hz := initial_phaseSection_inactive_credit_zero cs ε M deadline start L p E A hn hB hp k ω ha
        change ((V ω).val.2.2.physical.process.accounts p).credit = 0 at hz
        simp only [hz,zero_mul])
  have he := (integral_eq_zero_iff_of_nonneg_ae (ae_of_all ν (fun ω => (hFb (V ω).val.2.2).1)) hi).mp hzero
  filter_upwards [he] with ω hω
  change ((V ω).val.2.2.physical.process.accounts p).status = .active
  by_contra ha
  change F (V ω).val.2.2 = 0 at hω
  simp only [F,if_neg ha,one_ne_zero] at hω

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initial_phaseSectionPoint_active_ae
