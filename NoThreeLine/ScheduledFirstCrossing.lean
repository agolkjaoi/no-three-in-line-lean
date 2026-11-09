import NoThreeLine.ScheduledCrossingWeighted
import NoThreeLine.ScheduledLineForbiddenLaw

/-! The weighted comparison is the first-crossing event inequality on the
existing fixed-stage forbidden law of the full original schedule. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem crossingFlagValue_measure_le {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (hit : Ω→Bool) (hh : Measurable hit)
    (V : Ω→ℝ) (hVi : Integrable V μ) (hV : ∀w,0≤V w)
    (α c : ℝ) (hα : 0≤α) (hc : α*c=1)
    (h : (∫w,crossingFlagValue c (hit w) ∂μ)≤∫w,crossingFlagValue (V w) (hit w) ∂μ) :
    μ.real {w | hit w=true}≤(savedCreditMeasure μ (fun w=>α*V w)).real {w | hit w=true} := by
  let E := {w | hit w=true}
  have hE : MeasurableSet E := measurableSet_eq_fun hh measurable_const
  have hD : Integrable (fun w=>α*V w) μ := hVi.const_mul α
  rw [crossingFlagValue_integral μ _ hh,crossingFlagValue_integral μ _ hh,
    setIntegral_const,smul_eq_mul,mul_comm] at h
  rw [savedCreditMeasure_real_apply μ _ hD (fun w=>mul_nonneg hα (hV w)) _ hE,integral_const_mul]
  have hl := mul_le_mul_of_nonneg_left h hα
  rw [←mul_assoc,hc,one_mul] at hl
  exact hl

def scheduledProtectedExceedance {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (J : ℕ)
    (s : ProtectedPhaseState n B) : Set (BoardClockPath n) :=
  {ω | (scheduledCrossingTail cs ε M deadline start L N E A hn b 0 J (s,ω)).1.2=true}

theorem scheduledLineForbiddenLaw_protected_firstCrossing_ge {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (J : ℕ) (hKcfg : ∀i,(cs i).K≤K) (hK : K<2) (hsp : ∀i,specified (cs i).directions L)
    (hN : N≤1) (s : ProtectedPhaseState n B)
    (ho : occupancy s.1.val.physical.process L=N) (hk : s.1.val.physical.clocks L≤K) :
    (boardClockMeasure n (B/n)).real (scheduledProtectedExceedance cs ε M deadline start L N E A hn b J s)≤
      (scheduledLineForbiddenLaw cs ε M K deadline start hn L N s.1 J).real
        (scheduledProtectedExceedance cs ε M deadline start L N E A hn b J s) := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let F := fun w=>scheduledCrossingTail cs ε M deadline start L N E A hn b 0 J (s,w)
  have hF : Measurable F :=
    (scheduledCrossingTail_measurable cs ε M deadline start L N E A hA hn b 0 J).comp
      (measurable_const.prodMk measurable_id)
  let V := validLineStageValue (B:=B) K L N
  let v := fun w=>V (F w).1.1.1
  have hv : Measurable v := (validLineStageValue_measurable K L N).comp hF.fst.fst.fst
  have hb (w : BoardClockPath n) := validLineStageValue_bounds K hK L N hN (F w).1.1.1
  have hvi := GenericCreditIteration.bounded_nonnegative_integrable μ v hv ((2/(2-K))^2) hb
  let α := Real.exp (-specifiedClockHazardPotential N (s.1.val.physical.clocks L))
  have hα : α*V s.1=1 := validLineStageDensity_self K L N s.1 ho hk
  have h := crossingFlagValue_measure_le μ (fun w=>(F w).1.2) hF.fst.snd v hvi
    (fun w=>(hb w).1) α (V s.1) (Real.exp_pos _).le hα
    (scheduledCrossingTail_weighted_le cs ε M K deadline start L N E A hA hn hB b
      0 J hKcfg hK hsp hN s ho hk)
  have he : (fun w=>α*v w)=scheduledLineStageDensity cs ε M K deadline start hn L N s.1 J := by
    funext w
    have hp := congrArg (fun x : (ℕ×ValidAugmentedState n B)×BoardClockPath n=>x.1.2)
      (scheduledCrossingTail_physical_projection cs ε M deadline start L N E A hn b 0 J (s,w))
    change α * V (F w).1.1.1=α*V (recycledPhaseState cs ε M deadline start hn s.1 J w)
    rw [show (F w).1.1.1=recycledPhaseState cs ε M deadline start hn s.1 J w from hp]
  rw [he] at h
  exact h

end NoThreeLine

#print axioms NoThreeLine.scheduledLineForbiddenLaw_protected_firstCrossing_ge

