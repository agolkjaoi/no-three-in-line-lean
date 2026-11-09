import NoThreeLine.CrossingFlagPrepend

/-! First-crossing domination for any finite marked suffix of the actual
schedule in a fixed occupancy stage. There is no multiplier in the
number of phases or updates. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem crossingFlagValue_const_integral_mono {W : Type*} [MeasurableSpace W] (μ : Measure W)
    (F : W→Bool) (hF : Measurable F) {c d : ℝ} (h : c≤d) :
    (∫w,crossingFlagValue c (F w) ∂μ)≤∫w,crossingFlagValue d (F w) ∂μ := by
  rw [crossingFlagValue_integral μ _ hF,crossingFlagValue_integral μ _ hF,
    setIntegral_const,setIntegral_const,smul_eq_mul,smul_eq_mul]
  exact mul_le_mul_of_nonneg_left h ENNReal.toReal_nonneg

theorem scheduledCrossingTail_weighted_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (j k : ℕ) (hKcfg : ∀i,(cs i).K≤K) (hK : K<2) (hsp : ∀i,specified (cs i).directions L)
    (hN : N≤1) (s : ProtectedPhaseState n B)
    (ho : occupancy s.1.val.physical.process L=N) (hk : s.1.val.physical.clocks L≤K) :
    let μ := boardClockMeasure n (B/n)
    let G := scheduledCrossingTail cs ε M deadline start L N E A hn b j k
    let V := validLineStageValue (B:=B) K L N
    (∫ω,crossingFlagValue (V s.1) (G (s,ω)).1.2 ∂μ)≤
      ∫ω,crossingFlagValue (V (G (s,ω)).1.1.1) (G (s,ω)).1.2 ∂μ := by
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let W := BoardClockPath n
  let V := validLineStageValue (B:=B) K L N
  let C := (2/(2-K))^2
  have hV := validLineStageValue_measurable (B:=B) K L N
  have hVC (v : ValidAugmentedState n B) : 0≤V v ∧ V v≤C := validLineStageValue_bounds K hK L N hN v
  induction k generalizing j s with
  | zero => exact le_rfl
  | succ k ih =>
    let F := fun w : W=>scheduledCrossingPair cs ε M deadline start L N E A hn b j (s,w)
    let G := fun x : W×W=>scheduledCrossingTail cs ε M deadline start L N E A hn b (j+1) k
      ((F x.1).1.1,x.2)
    have hF : Measurable F := (scheduledCrossingPair_measurable cs ε M deadline start L N E A hA hn b j).comp
      (measurable_const.prodMk measurable_id)
    have hG : Measurable G :=
      (scheduledCrossingTail_measurable cs ε M deadline start L N E A hA hn b (j+1) k).comp
        ((hF.fst.fst.comp measurable_fst).prodMk measurable_snd)
    let f := fun w : W=>((F w).1.1.1,(F w).1.2)
    let g := fun x : W×W=>((G x).1.1.1,(G x).1.2)
    have hf : Measurable f := hF.fst.fst.fst.prodMk hF.fst.snd
    have hg : Measurable g := hG.fst.fst.fst.prodMk hG.fst.snd
    have hproj (w : W) : (F w).1.1.1=(recycledScheduledPair cs ε M deadline start hn j (s.1,w)).1 :=
      congrArg Prod.fst (scheduledCrossingPair_physical_projection cs ε M deadline start L N E A hn b j (s,w))
    have hr (w : W) : validLineStageRegion K L N (F w).1.1.1 := by
      rw [hproj w]
      exact recycledScheduledPair_lineStageRegion cs ε M K deadline start hn j (hKcfg j)
        L (hsp j) N hN s.1 ⟨ho.ge,fun _=>hk⟩ w
    have hlocal := scheduledCrossingPair_flag_stageValue_le cs ε M K deadline start L N E A hA hn hB b
      j (hKcfg j) hK (hsp j) hN s ho hk
    have hmean (w : W) : (∫v,V (g (w,v)).1 ∂μ)=V (f w).1 :=
      scheduledCrossingTail_stageValue_mean cs ε M K deadline start L N E A hn hB b
        (j+1) k hKcfg hK hsp hN (F w).1.1 (hr w)
    have ht (w : W) : (∫v,crossingFlagValue (V s.1) (g (w,v)).2 ∂μ)≤
        ∫v,crossingFlagValue (V (g (w,v)).1) (g (w,v)).2 ∂μ := by
      by_cases he : occupancy (F w).1.1.1.val.physical.process L=N
      · have hsurv : occupancy
            (recycledScheduledPair cs ε M deadline start hn j (s.1,w)).1.val.physical.process L=N := by
          rw [←hproj w]
          exact he
        have hmono : V s.1≤V (F w).1.1.1 := by
          rw [hproj w]
          exact recycledScheduledPair_lineStageValue_ge_on_survival cs ε M K deadline start hn
            j (hKcfg j) hK L (hsp j) N hN s.1 ho hk w hsurv
        have hT : Measurable (fun v=>(g (w,v)).2) := hg.snd.comp (measurable_const.prodMk measurable_id)
        exact (crossingFlagValue_const_integral_mono μ _ hT hmono).trans
          (ih (j+1) (F w).1.1 he ((hr w).2 he))
      · have hlt : N<occupancy (F w).1.1.1.val.physical.process L :=
          lt_of_le_of_ne (hr w).1 (Ne.symm he)
        have hz (v : W) : (g (w,v)).2=false :=
          scheduledCrossingTail_no_stage_flag cs ε M deadline start L N E A hn b (j+1) k
            ((F w).1.1,v) hlt
        simp [hz,crossingFlagValue]
    have hs := crossingFlagValue_prepend_sections_le μ f g hf hg V hV (V s.1) C
      (hVC s.1) hVC hlocal hmean ht
    have hfirst := scheduledCrossingTail_integral_sections cs ε M deadline start L N E A hA hn hB b j k s
      (fun x=>crossingFlagValue (V s.1) x.2)
      (crossingFlagValue_measurable.comp (measurable_const.prodMk measurable_snd)) C
      (fun x=>crossingFlagValue_bounds (hVC s.1) x.2)
    have hsecond := scheduledCrossingTail_integral_sections cs ε M deadline start L N E A hA hn hB b j k s
      (fun x=>crossingFlagValue (V x.1) x.2)
      (crossingFlagValue_measurable.comp ((hV.comp measurable_fst).prodMk measurable_snd)) C
      (fun x=>crossingFlagValue_bounds (hVC x.1) x.2)
    let Q := scheduledCrossingTail cs ε M deadline start L N E A hn b j (k+1)
    change (∫ω,crossingFlagValue (V s.1) (Q (s,ω)).1.2 ∂μ)≤
      ∫ω,crossingFlagValue (V (Q (s,ω)).1.1.1) (Q (s,ω)).1.2 ∂μ
    rw [hfirst,hsecond]
    exact hs

end NoThreeLine

#print axioms NoThreeLine.scheduledCrossingTail_weighted_le

