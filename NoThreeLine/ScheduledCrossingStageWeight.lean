import NoThreeLine.ScheduledCrossingSections

/-! Weight a recorded crossing by the physical line-stage value. The
local estimate and the mean of a later physical stage value use the same
original-board law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def crossingFlagValue (c : ℝ) (hit : Bool) : ℝ := if hit then c else 0

theorem crossingFlagValue_measurable : Measurable (fun x : ℝ×Bool=>crossingFlagValue x.1 x.2) :=
  Measurable.ite (measurableSet_eq_fun measurable_snd measurable_const) measurable_fst measurable_const

theorem crossingFlagValue_bounds {c C : ℝ} (h : 0≤c ∧ c≤C) (hit : Bool) :
    0≤crossingFlagValue c hit ∧ crossingFlagValue c hit≤C := by
  cases hit
  · exact ⟨le_rfl,h.1.trans h.2⟩
  · exact h

theorem crossingFlagValue_mono {c d : ℝ} (h : c≤d) (hit : Bool) :
    crossingFlagValue c hit≤crossingFlagValue d hit := by
  cases hit
  · exact le_rfl
  · exact h

theorem crossingFlagValue_integral {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (hit : Ω→Bool) (hh : Measurable hit) (f : Ω→ℝ) :
    (∫ω,crossingFlagValue (f ω) (hit ω) ∂μ)=∫ω in {ω | hit ω=true},f ω ∂μ := by
  classical
  let E := {ω | hit ω=true}
  have hE : MeasurableSet E := measurableSet_eq_fun hh measurable_const
  have he : (fun ω=>crossingFlagValue (f ω) (hit ω))=E.indicator f := by
    funext ω
    by_cases h : hit ω=true <;> simp [crossingFlagValue,E,h]
  rw [he,integral_indicator hE]

theorem scheduledCrossingPair_flag_stageValue_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (j : ℕ) (hKcfg : (cs j).K≤K) (hK : K<2) (hsp : specified (cs j).directions L)
    (hN : N≤1) (s : ProtectedPhaseState n B)
    (ho : occupancy s.1.val.physical.process L=N) (hk : s.1.val.physical.clocks L≤K) :
    let μ := boardClockMeasure n (B/n)
    let F := scheduledCrossingPair cs ε M deadline start L N E A hn b j
    let V := validLineStageValue (B:=B) K L N
    (∫ω,crossingFlagValue (V s.1) (F (s,ω)).1.2 ∂μ)≤
      ∫ω,crossingFlagValue (V (F (s,ω)).1.1.1) (F (s,ω)).1.2 ∂μ := by
  let μ := boardClockMeasure n (B/n)
  let F := scheduledCrossingPair cs ε M deadline start L N E A hn b j
  let U := {ω | (F (s,ω)).1.2=true}
  let V := validLineStageValue (B:=B) K L N
  have hm : Measurable (fun ω=>(F (s,ω)).1.2) :=
    (scheduledCrossingPair_measurable cs ε M deadline start L N E A hA hn b j).fst.snd.comp
      (measurable_const.prodMk measurable_id)
  change (∫ω,crossingFlagValue (V s.1) (F (s,ω)).1.2 ∂μ)≤
    ∫ω,crossingFlagValue (V (F (s,ω)).1.1.1) (F (s,ω)).1.2 ∂μ
  rw [crossingFlagValue_integral μ _ hm,crossingFlagValue_integral μ _ hm,
    setIntegral_const,smul_eq_mul,mul_comm]
  have hl := scheduledCrossingPair_flag_terminal_lower cs ε M K deadline start L N E A hA hn hB b j
    hKcfg hK hsp hN s ho hk
  calc
    V s.1 * μ.real U ≤ V s.1 * (∫ω in U,validLineStageDensity K L N s.1 (F (s,ω)).1.1.1 ∂μ) :=
      mul_le_mul_of_nonneg_left hl (validLineStageValue_bounds K hK L N hN s.1).1
    _ = ∫ω in U,V (F (s,ω)).1.1.1 ∂μ := by
      rw [←integral_const_mul]
      apply integral_congr_ae
      exact ae_of_all _ (fun ω=>by
        change V s.1 * (Real.exp (-specifiedClockHazardPotential N (s.1.val.physical.clocks L)) *
          V (F (s,ω)).1.1.1)=_
        rw [←mul_assoc]
        have he : V s.1 * Real.exp (-specifiedClockHazardPotential N (s.1.val.physical.clocks L))=1 := by
          rw [mul_comm]
          exact validLineStageDensity_self K L N s.1 ho hk
        rw [he,one_mul])

theorem scheduledCrossingTail_stageValue_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (j k : ℕ) (hKcfg : ∀i,(cs i).K≤K) (hK : K<2) (hsp : ∀i,specified (cs i).directions L)
    (hN : N≤1) (s : ProtectedPhaseState n B) (hs : validLineStageRegion K L N s.1) :
    (∫ω,validLineStageValue K L N
      (scheduledCrossingTail cs ε M deadline start L N E A hn b j k (s,ω)).1.1.1
      ∂boardClockMeasure n (B/n))=validLineStageValue K L N s.1 := by
  let μ := boardClockMeasure n (B/n)
  let F := RecycledBoardProcess.iterate (recycledPhaseStep cs ε M deadline start hn) (j,s.1) k
  calc
    _ = ∫ω,validLineStageValue K L N (F ω).1.2 ∂μ := by
      apply integral_congr_ae
      exact ae_of_all _ (fun ω=>congrArg (fun v : (ℕ×ValidAugmentedState n B)×BoardClockPath n=>
        validLineStageValue K L N v.1.2)
        (scheduledCrossingTail_physical_projection cs ε M deadline start L N E A hn b j k (s,ω)))
    _ = _ := indexedLineStageValue_expected cs ε M K deadline start hn hB hKcfg hK L hsp N hN (j,s.1) hs k

end NoThreeLine

#print axioms NoThreeLine.scheduledCrossingPair_flag_stageValue_le
#print axioms NoThreeLine.scheduledCrossingTail_stageValue_mean

