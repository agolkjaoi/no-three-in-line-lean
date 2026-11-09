import NoThreeLine.ProtectedStateSourceStage

/-! Actual-law equal integrals for an observable of both before and after
states. Bounds are required only along the real step from the invariant
region, not on arbitrary unrelated pairs of states. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedTwoStateStage_history_equal_integrals {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (S : Finset (Grid n)) (hS : S⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (f g : ProtectedTimedState cfg×ProtectedTimedState cfg→ℝ)
    (hfm : Measurable f) (hgm : Measurable g) (D C : ℝ)
    (hfD : ∀v : ProtectedTimedState cfg,lineStageRegion cfg K L N v.1→
      (∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B)→∀ω,
      ‖f (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)‖≤D)
    (hgC : ∀v : ProtectedTimedState cfg,lineStageRegion cfg K L N v.1→
      (∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B)→∀ω,
      ‖g (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)‖≤C)
    (hfirst : ∀v : ProtectedTimedState cfg,occupancy v.1.val.1.physical.process L≤1→
      v.1.val.1.physical.clocks L≤K→(∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B)→
      (∫ω,f (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)
        ∂firstLineForbiddenLaw cfg ε M L hn v.1)=
      ∫ω,g (v,(protectedRestartStep cfg ε M L hn (v,ω)).1)
        ∂firstLineForbiddenLaw cfg ε M L hn v.1)
    (s : ProtectedTimedState cfg) (hs : lineStageRegion cfg K L N s.1)
    (hsv : ∀p∈S,0≤s.2 p ∧ s.2 p≤2*cfg.B) (k : ℕ) (A : Set (BoardClockPath n))
    (hA : MeasurableSet[protectedStateFiltration cfg ε M L hn s k] A) :
    (∫ω in A,lineStageValue cfg K L N (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1*
      f ((protectedRecycledPair cfg ε M L hn s k ω).1,
        (protectedRecycledPair cfg ε M L hn s (k+1) ω).1) ∂boardClockMeasure n (cfg.B/n))=
    ∫ω in A,lineStageValue cfg K L N (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1*
      g ((protectedRecycledPair cfg ε M L hn s k ω).1,
        (protectedRecycledPair cfg ε M L hn s (k+1) ω).1) ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let step := protectedRestartStep cfg ε M L hn
  have hstep := protectedRestartStep_measurable cfg ε M L hn
  let R : ProtectedTimedState cfg→Prop := fun v=>lineStageRegion cfg K L N v.1 ∧
    ∀p∈S,0≤v.2 p ∧ v.2 p≤2*cfg.B
  have hRm : Measurable R := by
    apply ((lineStageRegion_measurable cfg K L N).comp measurable_fst).and
    apply Measurable.forall
    intro p
    by_cases hp : p∈S
    · simp only [hp,true_implies]
      exact (measurable_const.le' ((measurable_pi_apply p).comp measurable_snd)).and
        (((measurable_pi_apply p).comp measurable_snd).le' measurable_const)
    · simp only [hp,false_implies]
      exact measurable_const
  have hR (v : ProtectedTimedState cfg) (hv : R v) (ω : BoardClockPath n) : R (step (v,ω)).1 :=
    ⟨lineStageRegion_step cfg ε M K hKcfg L hsp N hN v.1 hv.1 _,
      fun p hp=>protectedLineSave_timed_bounds_all cfg ε M L hsp p (hS hp) v (hv.2 p hp) _⟩
  let a : ProtectedTimedState cfg×BoardClockPath n→ℝ := fun x=>
    lineStageValue cfg K L N (step x).1.1*f (x.1,(step x).1)
  let b : ProtectedTimedState cfg×BoardClockPath n→ℝ := fun x=>
    lineStageValue cfg K L N (step x).1.1*g (x.1,(step x).1)
  have ha : Measurable a := ((lineStageValue_measurable cfg K L N).comp hstep.fst.fst).mul
    (hfm.comp (measurable_fst.prodMk hstep.fst))
  have hb : Measurable b := ((lineStageValue_measurable cfg K L N).comp hstep.fst.fst).mul
    (hgm.comp (measurable_fst.prodMk hstep.fst))
  have haD (x : ProtectedTimedState cfg×BoardClockPath n) (hx : R x.1) :
      ‖a x‖≤(2/(2-K))^2*D := by
    have hl := lineStageValue_bounds cfg K hK L N hN (step x).1.1
    change ‖lineStageValue cfg K L N (step x).1.1*f (x.1,(step x).1)‖≤_
    rw [norm_mul,Real.norm_eq_abs,abs_of_nonneg hl.1]
    exact mul_le_mul hl.2 (hfD x.1 hx.1 hx.2 x.2) (norm_nonneg _) (sq_nonneg _)
  have hbC (x : ProtectedTimedState cfg×BoardClockPath n) (hx : R x.1) :
      ‖b x‖≤(2/(2-K))^2*C := by
    have hl := lineStageValue_bounds cfg K hK L N hN (step x).1.1
    change ‖lineStageValue cfg K L N (step x).1.1*g (x.1,(step x).1)‖≤_
    rw [norm_mul,Real.norm_eq_abs,abs_of_nonneg hl.1]
    exact mul_le_mul hl.2 (hgC x.1 hx.1 hx.2 x.2) (norm_nonneg _) (sq_nonneg _)
  have hmean (v : ProtectedTimedState cfg) (hv : R v) :
      (∫ω,a (v,ω) ∂boardClockMeasure n (cfg.B/n))=
        ∫ω,b (v,ω) ∂boardClockMeasure n (cfg.B/n) := by
    by_cases ho : occupancy v.1.val.1.physical.process L=N
    · have hcurrent : occupancy v.1.val.1.physical.process L≤1 := ho ▸ hN
      have hh := hfirst v hcurrent (hv.1.2 ho) hv.2
      rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
        (firstLineLikelihood_measurable cfg ε M L hn v.1)
        (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp v.1 hcurrent (hv.1.2 ho) _).1),
        savedCreditMeasure_integral _ _ (firstLineLikelihood_measurable cfg ε M L hn v.1)
        (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp v.1 hcurrent (hv.1.2 ho) _).1)] at hh
      have hfactor (ω : BoardClockPath n) : lineStageValue cfg K L N (step (v,ω)).1.1=
          lineStageValue cfg K L N v.1*augTimedLineLikelihood cfg ε M L (v.1,WinnerMarkLaw.firstMarkedRace hn ω) :=
        lineStageValue_step_factor cfg ε M K hKcfg L hsp N hN v.1 ho (hv.1.2 ho) _
      dsimp only [a,b]
      simp_rw [hfactor,mul_assoc]
      rw [integral_const_mul,integral_const_mul,hh]
    · have hz (ω : BoardClockPath n) : lineStageValue cfg K L N (step (v,ω)).1.1=0 := by
        have hm := augTimedStep_occupancy_le cfg ε M L v.1 (WinnerMarkLaw.firstMarkedRace hn ω)
        have hmin := hv.1.1
        have hne : occupancy (step (v,ω)).1.1.val.1.physical.process L≠N := by
          change occupancy (augTimedStep cfg ε M (v.1,WinnerMarkLaw.firstMarkedRace hn ω)).val.1.physical.process L≠N
          omega
        exact if_neg (fun h=>hne h.1)
      simp only [a,b,hz,zero_mul,integral_zero]
  exact RecycledBoardProcess.history_equal_integrals_of_invariant_signed step hstep _
    (protectedRestartStep_map cfg ε M L hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    R hRm hR a b ha hb _ _ haD hbC hmean s ⟨hs,hsv⟩ k A hA

end NoThreeLine
#print axioms NoThreeLine.protectedTwoStateStage_history_equal_integrals
