import NoThreeLine.RestartedCrossingRemainder
import NoThreeLine.ScheduledRemainderDensity

/-! Apply the fixed-stage comparison to the actual unfinished first
phase and its original successors, with the normalized remainder law. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem scheduledCrossingRemainder_weighted_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (J : ℕ) (hKcfg : ∀i,(cs i).K≤K) (hK : K<2) (hsp : ∀i,specified (cs i).directions L)
    (hN : N≤1) (a : ℕ×ProtectedPhaseState n B)
    (ho : occupancy a.2.1.val.physical.process L=N) (hk : a.2.1.val.physical.clocks L≤K) :
    let μ := boardClockMeasure n (B/n)
    let R := scheduledCrossingRemainderPair cs ε M deadline start L N E A hn b J
    let V := validLineStageValue (B:=B) K L N
    (∫ω,crossingFlagValue (V a.2.1) (R (a,ω)).1.2 ∂μ)≤
      ∫ω,crossingFlagValue (V (R (a,ω)).1.1.1) (R (a,ω)).1.2 ∂μ := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let V := validLineStageValue (B:=B) K L N
  let C := (2/(2-K))^2
  let j := a.1
  let cfg := (cs j).config
  let s := unpackProtectedTimed cfg a.2
  let k := J-(j+1)
  let F := fun w=>timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,w)
  let G := scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k
  by_cases hj : a.1<J
  · have hF : Measurable F := (timedCrossingPhasePair_measurable cs ε M deadline start L N E A hA hn b j).comp
      (measurable_const.prodMk measurable_id)
    have hG : Measurable G :=
      scheduledCrossingTail_measurable cs ε M deadline start L N E A hA hn b (j+1) k
    have hV : Measurable (fun v : ProtectedPhaseState n B=>V v.1) :=
      (validLineStageValue_measurable K L N).comp measurable_fst
    have hC (v : ProtectedPhaseState n B) : 0≤V v.1 ∧ V v.1≤C := validLineStageValue_bounds K hK L N hN v.1
    have hregion (w : BoardClockPath n) : validLineStageRegion K L N (F w).1.1.1 :=
      timedCrossingPhasePair_stage_region cs ε M K deadline start L N E A hn b j (hKcfg j) (hsp j) hN
        s ⟨ho.ge,fun _=>hk⟩ w
    have hlocal := timedCrossingPhasePair_flag_stageValue_le cs ε M K deadline start L N E A hA hn hB
      b j (hKcfg j) hK (hsp j) hN s ho hk
    have hmean (w : BoardClockPath n) : (∫v,V (G ((F w).1.1,v)).1.1.1 ∂μ)=V (F w).1.1.1 :=
      scheduledCrossingTail_stageValue_mean cs ε M K deadline start L N E A hn hB b
        (j+1) k hKcfg hK hsp hN (F w).1.1 (hregion w)
    have htail (w : BoardClockPath n) : (∫v,crossingFlagValue (V a.2.1) (G ((F w).1.1,v)).1.2 ∂μ)≤
        ∫v,crossingFlagValue (V (G ((F w).1.1,v)).1.1.1) (G ((F w).1.1,v)).1.2 ∂μ := by
      by_cases he : occupancy (F w).1.1.1.val.physical.process L=N
      · have hmono : V a.2.1≤V (F w).1.1.1 :=
          timedCrossingPhasePair_stageValue_ge_on_survival cs ε M K deadline start L N E A hn b j
            (hKcfg j) hK (hsp j) hN s ho hk w he
        have hT : Measurable (fun v=>(G ((F w).1.1,v)).1.2) :=
          hG.fst.snd.comp (measurable_const.prodMk measurable_id)
        exact (crossingFlagValue_const_integral_mono μ _ hT hmono).trans
          (scheduledCrossingTail_weighted_le cs ε M K deadline start L N E A hA hn hB b (j+1) k
            hKcfg hK hsp hN (F w).1.1 he ((hregion w).2 he))
      · have hlt := lt_of_le_of_ne (hregion w).1 (Ne.symm he)
        have hz (v : BoardClockPath n) : (G ((F w).1.1,v)).1.2=false :=
          scheduledCrossingTail_no_stage_flag cs ε M deadline start L N E A hn b (j+1) k
            ((F w).1.1,v) hlt
        simp [hz,crossingFlagValue]
    have h := crossingAppend_weighted_le μ F hF
      (timedCrossingPhasePair_map cs ε M deadline start L N E A hA hn hB b j s)
      G hG (fun v=>V v.1) hV (V a.2.1) C (hC a.2) hC hlocal hmean htail
    simpa only [scheduledCrossingRemainderPair,if_pos hj,F,G,j,k,s] using h
  · simp [scheduledCrossingRemainderPair,hj,crossingFlagValue]

theorem scheduledRemainderLaw_crossing_ge {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (J : ℕ) (hKcfg : ∀i,(cs i).K≤K) (hK : K<2) (hsp : ∀i,specified (cs i).directions L)
    (hN : N≤1) (a : ℕ×ProtectedPhaseState n B) :
    let μ := boardClockMeasure n (B/n)
    let R := scheduledCrossingRemainderPair cs ε M deadline start L N E A hn b J
    let U := {w | (R (a,w)).1.2=true}
    μ.real U≤(savedCreditMeasure μ (fun w=>scheduledRemainderDensity cs ε M K deadline start L N hn J
      (a,w))).real U := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let R := scheduledCrossingRemainderPair cs ε M deadline start L N E A hn b J
  let F := fun w=>R (a,w)
  have hF : Measurable F := (scheduledCrossingRemainderPair_measurable cs ε M deadline start L N E A hA hn b J).comp
    (measurable_const.prodMk measurable_id)
  by_cases hgood : occupancy a.2.1.val.physical.process L=N ∧ a.2.1.val.physical.clocks L≤K
  · let V := validLineStageValue (B:=B) K L N
    let v := fun w=>V (F w).1.1.1
    have hv : Measurable v := (validLineStageValue_measurable K L N).comp hF.fst.fst.fst
    have hb (w : BoardClockPath n) := validLineStageValue_bounds K hK L N hN (F w).1.1.1
    have hvi := GenericCreditIteration.bounded_nonnegative_integrable μ v hv ((2/(2-K))^2) hb
    let α := Real.exp (-specifiedClockHazardPotential N (a.2.1.val.physical.clocks L))
    have hα : α*V a.2.1=1 := validLineStageDensity_self K L N a.2.1 hgood.1 hgood.2
    have h := crossingFlagValue_measure_le μ (fun w=>(F w).1.2) hF.fst.snd v hvi
      (fun w=>(hb w).1) α (V a.2.1) (Real.exp_pos _).le hα
      (scheduledCrossingRemainder_weighted_le cs ε M K deadline start L N E A hA hn hB b J
        hKcfg hK hsp hN a hgood.1 hgood.2)
    have he : (fun w=>α*v w)=fun w=>scheduledRemainderDensity cs ε M K deadline start L N hn J (a,w) := by
      funext w
      simp only [scheduledRemainderDensity,if_pos hgood]
      change α*V (F w).1.1.1=α*V (scheduledLineRemainderState cs ε M deadline start hn J (a,w))
      rw [show (F w).1.1.1=scheduledLineRemainderState cs ε M deadline start hn J (a,w) from
        scheduledCrossingRemainderPair_physical cs ε M deadline start L N E A hn b J (a,w)]
    rw [he] at h
    exact h
  · simp [scheduledRemainderDensity,hgood,savedCreditMeasure,ENNReal.ofReal_one,withDensity_one]

end NoThreeLine

#print axioms NoThreeLine.scheduledCrossingRemainder_weighted_le
#print axioms NoThreeLine.scheduledRemainderLaw_crossing_ge

