import NoThreeLine.RootFreezeKernel
import NoThreeLine.WitnessRunningHistory

/-! The source integrated over actual elapsed time, suppressed after the
main-root snapshot freezes. Its conditional first-board mean is the
proved rootStepSource, and it is bounded by the original physical source. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def goodRootRunningSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (x : GoodRootObservation cfg p × BoardClockPath n) : ℝ :=
  if x.1.val.2.1=true then 0 else clockRunningSource cfg ε M start e C D L hn (x.1.val.1,x.2)

theorem goodRootRunningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) :
    Measurable (goodRootRunningSource cfg ε M start p e C D L hn) :=
  Measurable.ite (((measurable_subtype_coe.comp measurable_fst).snd.fst).eq measurable_const).setOf
    measurable_const ((clockRunningSource_measurable cfg ε M start e C D L hn).comp
      ((measurable_subtype_coe.fst.comp measurable_fst).prodMk measurable_snd))

theorem goodRootRunningSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (x : GoodRootObservation cfg p × BoardClockPath n) :
    0≤goodRootRunningSource cfg ε M start p e C D L hn x ∧
      goodRootRunningSource cfg ε M start p e C D L hn x≤
        (cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K := by
  unfold goodRootRunningSource
  split_ifs
  · exact ⟨le_rfl,mul_nonneg cfg.horizon.coe_nonneg (sourceCap_nonneg _ _ _ _ _)⟩
  · exact runningSource_bounds cfg ε M start e C D L _ x.1.property.1.records hm hK

theorem goodRootRunningSource_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (s : GoodRootObservation cfg p) :
    (∫ω,goodRootRunningSource cfg ε M start p e C D L hn (s,ω) ∂boardClockMeasure n (cfg.B/n))=
      rootStepSource cfg ε M start e C D L s.val := by
  by_cases hf : s.val.2.1=true
  · simp only [goodRootRunningSource,rootStepSource,if_pos hf,integral_zero]
  · simp only [goodRootRunningSource,rootStepSource,if_neg hf]
    exact clockRunningSource_mean cfg ε M start e C D L hn hB hm hK s.val.1 s.property.1.records

theorem goodRootRunningSource_le_actual {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (x : GoodRootObservation cfg p × BoardClockPath n) :
    goodRootRunningSource cfg ε M start p e C D L hn x≤
      goodRunningSource cfg ε M start e C D L hn (goodRootActual cfg p x.1,x.2) := by
  unfold goodRootRunningSource
  split_ifs
  · exact (goodRunningSource_bounds cfg ε M start e C D L hn hm hK _).1
  · exact le_rfl

theorem goodRootRunningSource_frozen {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (x : GoodRootObservation cfg p × BoardClockPath n) (hx : x.1.val.2.1=true) :
    goodRootRunningSource cfg ε M start p e C D L hn x=0 := by
  simp only [goodRootRunningSource,if_pos hx]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.goodRootRunningSource_mean
#print axioms NoThreeLine.BirthWitness.goodRootRunningSource_le_actual
