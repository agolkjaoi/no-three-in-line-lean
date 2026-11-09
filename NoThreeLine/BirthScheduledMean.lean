import NoThreeLine.BirthPhaseKernel
import NoThreeLine.RecycledPhaseComposition

/-! Integrate the actual phase birth identity against the state and residual
law of the same original board. Bounds are local to the fixed phase. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem independent_pair_equal_integrals {Ω S W : Type*}
    [MeasurableSpace Ω] [MeasurableSpace S] [MeasurableSpace W]
    (μ : Measure Ω) (ν : Measure W) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (s : Ω → S) (r : Ω → W) (hs : Measurable s) (hr : Measurable r)
    (hp : μ.map (fun ω=>(s ω,r ω))=(μ.map s).prod ν)
    (f g : S × W → ℝ) (hf : Measurable f) (hg : Measurable g)
    (B C : ℝ) (hb : ∀x,0≤f x ∧ f x≤B) (hc : ∀x,0≤g x ∧ g x≤C)
    (hm : ∀a,(∫w,f (a,w) ∂ν)=∫w,g (a,w) ∂ν) :
    (∫ω,f (s ω,r ω) ∂μ)=∫ω,g (s ω,r ω) ∂μ := by
  letI : IsProbabilityMeasure (μ.map s) := Measure.isProbabilityMeasure_map hs.aemeasurable
  let q : S → ℝ := fun a=>∫w,f (a,w) ∂ν
  have hq : Measurable q := hf.stronglyMeasurable.integral_prod_right'.measurable
  have hfi := GenericCreditIteration.bounded_nonnegative_integrable ((μ.map s).prod ν) f hf B hb
  have hgi := GenericCreditIteration.bounded_nonnegative_integrable ((μ.map s).prod ν) g hg C hc
  have h1 := independent_history_setIntegral μ ν s r hs hr hp f q hf hq hfi
    (fun _=>rfl) univ MeasurableSet.univ
  have h2 := independent_history_setIntegral μ ν s r hs hr hp g q hg hq hgi
    (fun a=>(hm a).symm) univ MeasurableSet.univ
  simpa only [preimage_univ,Measure.restrict_univ] using h1.trans h2.symm

namespace BirthWitness

theorem scheduled_selectedIndicator_mean {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) (k : ℕ) :
    (∫ω,validSelectedIndicator B p (recycledPhaseState cs ε M deadline start hn e (k+1) ω)
      ∂boardClockMeasure n (B/n))=
    ∫ω,validSelectedIndicator B p (recycledPhaseState cs ε M deadline start hn e k ω)+
      phaseBirthRate (cs k).config ε M p hn
        (recycledPhaseState cs ε M deadline start hn e k ω,
          (recycledPhases cs ε M deadline start hn e k ω).2) ∂boardClockMeasure n (B/n) := by
  let μ := boardClockMeasure n (B/n)
  letI : IsProbabilityMeasure μ := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let s := recycledPhaseState cs ε M deadline start hn e k
  let r := fun ω=>(recycledPhases cs ε M deadline start hn e k ω).2
  have hs : Measurable s := recycledPhaseState_measurable cs ε M deadline start hn e k
  have hr : Measurable r := (recycledPhases_measurable cs ε M deadline start hn e k).snd
  have hp : μ.map (fun ω=>(s ω,r ω))=(μ.map s).prod μ := by
    rw [recycledPhaseState_map cs ε M deadline start hn hB e k]
    exact recycledPhases_state_residual_map cs ε M deadline start hn hB e k
  let f : ValidAugmentedState n B × BoardClockPath n → ℝ := fun x=>
    validSelectedIndicator B p (recycledScheduledPair cs ε M deadline start hn k x).1
  let g : ValidAugmentedState n B × BoardClockPath n → ℝ := fun x=>
    validSelectedIndicator B p x.1+phaseBirthRate (cs k).config ε M p hn x
  have hf : Measurable f := (validSelectedIndicator_measurable B p).comp
    (recycledScheduledPair_measurable cs ε M deadline start hn k).fst
  have hg : Measurable g := ((validSelectedIndicator_measurable B p).comp measurable_fst).add
    (phaseBirthRate_measurable (cs k).config ε M p hn)
  have hb (x) : 0≤f x ∧ f x≤1 := validSelectedIndicator_bounds B p _
  have hc (x) : 0≤g x ∧ g x≤1+((cs k).config.horizon:ℝ)*(B/n) := by
    have h1 := validSelectedIndicator_bounds B p x.1
    have h2 := phaseBirthRate_bounds (cs k).config ε M p hn hB (cs k).mask_le_one x
    exact ⟨add_nonneg h1.1 h2.1,add_le_add h1.2 h2.2⟩
  have hm (a : ValidAugmentedState n B) : (∫w,f (a,w) ∂μ)=∫w,g (a,w) ∂μ := by
    have hi : Integrable (fun w=>phaseBirthRate (cs k).config ε M p hn (a,w)) μ :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        ((phaseBirthRate_measurable (cs k).config ε M p hn).comp (measurable_const.prodMk measurable_id))
        (((cs k).config.horizon:ℝ)*(B/n))
        (fun w=>phaseBirthRate_bounds (cs k).config ε M p hn hB (cs k).mask_le_one (a,w))
    change _=∫w,validSelectedIndicator B p a+phaseBirthRate (cs k).config ε M p hn (a,w) ∂μ
    rw [integral_add (integrable_const _) hi,integral_const]
    simpa only [probReal_univ,one_smul] using scheduled_birth_compensation cs ε M deadline start p hn hB k a
  have h := independent_pair_equal_integrals μ μ s r hs hr hp f g hf hg 1
    (1+((cs k).config.horizon:ℝ)*(B/n)) hb hc hm
  have heq (ω) : f (s ω,r ω)=validSelectedIndicator B p
      (recycledPhaseState cs ε M deadline start hn e (k+1) ω) := by
    simp only [recycledPhaseState,recycledPhases_succ]
    rfl
  simpa only [heq] using h

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.BirthWitness.scheduled_selectedIndicator_mean
