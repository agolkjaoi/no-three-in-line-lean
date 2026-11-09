import NoThreeLine.ScheduledProtectedPhaseChain

/-! A one-phase tail valid for every reachable low-credit entry controls
the fixed-stage scheduled law. The original residual product supplies
the conditioning, and the full law's density cap is paid once. -/
set_option autoImplicit false
set_option maxHeartbeats 2650000
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines RecycledBoardProcess

theorem protectedPhaseTotal_measurable {n : ℕ} {B : ℝ} (L : LineIndex n)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Measurable A) :
    Measurable (protectedPhaseTotal (B:=B) L E A) :=
  Finset.measurable_sum _ (fun p _=>hA.comp (protectedPhaseCredit_measurable L p))

theorem scheduledLineForbidden_crossing_le_finite_phase {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (L : LineIndex n) (N : ℕ) (hN : N≤1) (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A)
    (p : Grid n) (hn : 0<n) (hB : 0<B) (J : ℕ) (s : ProtectedPhaseState n B)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (hsp : ∀j,specified (cs j).directions L)
    (ho : occupancy s.1.val.physical.process L=N) (hk : s.1.val.physical.clocks L≤K)
    (hsv : ∀q∈L.val,0≤s.2.1 q ∧ s.2.1 q≤2*B) (hs : s.1.val.AuxReady Γ ε M)
    (base step tail : ℝ) (hstep : 0≤step) (htail : 0≤tail)
    (hbase : protectedPhaseTotal L E A s≤base)
    (hphase : ∀j<J,∀v : ProtectedTimedState (cs j).config,
      occupancy v.1.val.1.physical.process L=N → v.1.val.1.physical.clocks L≤K →
      v.1.val.1.AuxReady (cs j).directions ε M →
      (∀q∈L.val,0≤v.2 q ∧ v.2 q≤2*B) →
      protectedStateTotal (cs j).config L E A v≤base+(j:ℝ)*step →
      (phaseLineForbiddenLaw (cs j).config ε M K L N hn v.1).real
        (protectedActualExceedance (cs j).config ε M L N E A hn v (base+(j+1:ℕ)*step))≤tail) :
    (scheduledLineForbiddenLaw cs ε M K deadline start hn L N s.1 J).real
      (scheduledProtectedExceedance cs ε M deadline start L N E A hn (base+(J:ℝ)*step) J s)≤
      (2/(2-K))^2*(J:ℝ)*tail := by
  classical
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let ν := scheduledLineForbiddenLaw cs ε M K deadline start hn L N s.1 J
  letI : IsProbabilityMeasure ν := scheduledLineForbiddenLaw_probability cs ε M K deadline start hn hB
    hKcfg hK L hsp N hN s.1 ho hk J
  let r := fun j=>protectedScheduledIterate cs ε M deadline start L p hn J s j
  let U := fun j : ℕ=>base+(j:ℝ)*step
  let G (j : ℕ) (a : ℕ×ProtectedPhaseState n B) :=
    occupancy a.2.1.val.physical.process L=N ∧ protectedPhaseTotal L E A a.2≤U j
  let H (j : ℕ) (x : (ℕ×ProtectedPhaseState n B)×BoardClockPath n) : Bool :=
    if G j x.1 then decide (x.2∈protectedActualExceedance (cs j).config ε M L N E A hn
      (protectedPhaseStart (cs j).config ε M x.1.2) (U (j+1))) else false
  let D (j : Fin J) : Set (BoardClockPath n) := {ω | H j.val (r j.val ω)=true}
  have hr (j : ℕ) : Measurable (r j) := iterate_measurable _
    (protectedScheduledStep_measurable cs ε M deadline start L p hn J) _ j
  have hG (j : ℕ) : Measurable (G j) := by
    have ho' : Measurable (fun a : ℕ×ProtectedPhaseState n B=>occupancy a.2.1.val.physical.process L) :=
      (ExtendedState.measurable_occupancy n L).comp
        ((validAugPhysical_measurable (B:=B)).comp measurable_snd.fst)
    exact (ho'.eq_const N).and (((protectedPhaseTotal_measurable (B:=B) L E A hA.measurable).comp
      measurable_snd).le' measurable_const)
  have hH (j : ℕ) : Measurable (H j) := by
    unfold H
    apply Measurable.ite ((hG j).comp measurable_fst).setOf _ measurable_const
    apply Measurable.ite _ measurable_const measurable_const
    exact ((protectedActualExceedance_joint_measurable (cs j).config ε M L N E A hA hn (U (j+1))).comp
      (((protectedPhaseStart_measurable (cs j).config ε M).comp measurable_fst.snd).prodMk measurable_snd)).setOf
  have hD (j : Fin J) : MeasurableSet (D j) := measurableSet_eq_fun ((hH _).comp (hr _)) measurable_const
  have hlocal (j : Fin J) : μ.real (D j)≤tail := by
    let ρ := μ.map (fun ω=>(r j.val ω).1)
    letI : IsProbabilityMeasure ρ := Measure.isProbabilityMeasure_map (hr _).fst.aemeasurable
    let f := fun x=>crossingFlagValue 1 (H j.val x)
    have hf : Measurable f := crossingFlagValue_measurable.comp (measurable_const.prodMk (hH _))
    have hfb (x) : 0≤f x ∧ f x≤1 := crossingFlagValue_bounds (by norm_num) (H j.val x)
    have hfI := GenericCreditIteration.bounded_nonnegative_integrable (ρ.prod μ) f hf 1 hfb
    have hmap : μ.map (r j.val)=ρ.prod μ := by
      let S := protectedScheduledStep cs ε M deadline start L p hn J
      have hS := protectedScheduledStep_measurable cs ε M deadline start L p hn J
      have hp := protectedScheduledStep_map cs ε M deadline start L p hn hB J
      change μ.map (iterate S (0,s) j.val)=(μ.map (fun w=>(iterate S (0,s) j.val w).1)).prod μ
      rw [iterate_map S hS μ hp,iterate_state_map S hS μ hp]
    have hsec (ω : BoardClockPath n) : (∫w,f ((r j.val ω).1,w) ∂μ)≤tail := by
      let a := (r j.val ω).1
      let v := protectedPhaseStart (cs j.val).config ε M a.2
      by_cases ha : G j.val a
      · have hp := protectedScheduledIterate_projection cs ε M deadline start L p hn J s j.val j.isLt.le ω
        have he : a.2.1=recycledPhaseState cs ε M deadline start hn s.1 j.val ω :=
          congrArg (fun x=>x.1.2) hp
        have hv : occupancy v.1.val.1.physical.process L=N := ha.1
        have hk' : v.1.val.1.physical.clocks L≤K := by
          change a.2.1.val.physical.clocks L≤K
          rw [he]
          apply (recycledPhaseState_lineStageRegion cs ε M K deadline start hn hKcfg L hsp N hN
            s.1 ⟨ho.ge,fun _=>hk⟩ j.val ω).2
          exact he ▸ ha.1
        have hready : v.1.val.1.AuxReady (cs j.val).directions ε M := by
          change a.2.1.val.AuxReady (cs j.val).directions ε M
          rw [he,hΓ]
          exact recycledPhaseState_auxReady cs ε M deadline start hn Γ hΓ s.1 hs j.val ω
        have hsaved (q : Grid n) (hq : q∈L.val) : 0≤v.2 q ∧ v.2 q≤2*B :=
          protectedScheduled_saved_at cs ε M deadline start L p hn J s hsp q hq (hsv q hq) j.val j.isLt.le ω
        have hcross := phaseLineForbiddenLaw_protected_firstCrossing_ge (cs j.val).config ε M K
          (hKcfg _) hK L (hsp _) N hN hn hB (cs j.val).mask_le_one v hv hk' E A hA (U (j.val+1))
        have hflag : {w | H j.val (a,w)=true}=
            protectedActualExceedance (cs j.val).config ε M L N E A hn v (U (j.val+1)) := by
          ext w
          simp only [H,if_pos ha,mem_setOf_eq,decide_eq_true_eq,v]
        change (∫w,crossingFlagValue 1 (H j.val (a,w)) ∂μ)≤tail
        rw [←measureReal_flag_eq_integral μ (fun w=>H j.val (a,w))
          ((hH _).comp (measurable_const.prodMk measurable_id)),hflag]
        exact hcross.trans (hphase j.val j.isLt v hv hk' hready hsaved ha.2)
      · have hz (w : BoardClockPath n) : f (a,w)=0 := by simp [f,H,ha,crossingFlagValue]
        change (∫w,f (a,w) ∂μ)≤tail
        simp only [hz,integral_zero]
        exact htail
    change μ.real {ω | H j.val (r j.val ω)=true}≤tail
    rw [measureReal_flag_eq_integral μ (fun ω=>H j.val (r j.val ω)) ((hH _).comp (hr _))]
    change (∫ω,f (r j.val ω) ∂μ)≤tail
    rw [←integral_map_of_stronglyMeasurable (hr _) hf.stronglyMeasurable,hmap,integral_prod _ hfI,
      integral_map (hr _).fst.aemeasurable hfI.integral_prod_left.aestronglyMeasurable]
    have hb := integral_mono_of_nonneg (μ:=μ)
      (ae_of_all _ (fun ω=>integral_nonneg (fun w=>(hfb ((r j.val ω).1,w)).1)))
      (integrable_const tail) (ae_of_all _ hsec)
    simpa only [integral_const,probReal_univ,one_smul] using hb
  let F := scheduledProtectedExceedance cs ε M deadline start L N E A hn (U J) J s
  have hsub : ∀ᵐω∂ν,ω∈F → ω∈⋃j,D j := by
    filter_upwards [scheduledLineForbiddenLaw_occupancy cs ε M K deadline start hn L N s.1 J] with ω hω
    intro h
    have hocc (j : ℕ) (hj : j≤J) : occupancy (r j ω).1.2.1.val.physical.process L=N := by
      have hp := protectedScheduledIterate_projection cs ε M deadline start L p hn J s j hj ω
      rw [show (r j ω).1.2.1=recycledPhaseState cs ε M deadline start hn s.1 j ω from congrArg (fun x=>x.1.2) hp]
      exact recycledPhaseState_occupancy_prefix cs ε M deadline start hn L N s.1 ho J ω hω j hj
    obtain ⟨j,hj,hcredit,hcross⟩ := scheduledProtected_crossing_has_phase_with_small_entry
      cs ε M deadline start L N E A p hn J s base step hstep ω hbase hocc h
    refine mem_iUnion.mpr ⟨⟨j,hj⟩,?_⟩
    change H j (r j ω)=true
    simp only [H,if_pos (show G j (r j ω).1 from ⟨hocc j hj.le,hcredit⟩),decide_eq_true_eq]
    exact hcross
  have h1 : ν.real F≤ν.real (⋃j,D j) :=
    ENNReal.toReal_mono (measure_ne_top ν _) (measure_mono_ae hsub)
  calc
    _ ≤ ν.real (⋃j,D j) := h1
    _ ≤ (2/(2-K))^2*μ.real (⋃j,D j) := scheduledLineForbiddenLaw_event_le cs ε M K deadline start
      hn hB hK L N hN s.1 hk J _ (MeasurableSet.iUnion hD)
    _ ≤ (2/(2-K))^2*(∑j,μ.real (D j)) :=
      mul_le_mul_of_nonneg_left (measureReal_iUnion_fintype_le D) (sq_nonneg _)
    _ ≤ (2/(2-K))^2*(∑ _j : Fin J,tail) :=
      mul_le_mul_of_nonneg_left (Finset.sum_le_sum (fun j _=>hlocal j)) (sq_nonneg _)
    _ = _ := by simp [mul_assoc]

end NoThreeLine

#print axioms NoThreeLine.scheduledLineForbidden_crossing_le_finite_phase

