import NoThreeLine.WitnessInactiveRoots

/-! The actual state-dependent S7 source integral is jointly measurable.
The source incurred by a completed/frozen step is zero. This step source
has a common finite bound without an active-C premise on the state. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaMixedGenerator

def observationDone {n : ℕ} (cfg : FlowConfig n) (s : TimedObservation cfg) : Prop :=
  s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true

instance {n : ℕ} (cfg : FlowConfig n) (s : TimedObservation cfg) : Decidable (observationDone cfg s) :=
  inferInstanceAs (Decidable (_∨_))

def stepSourceIntegral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (s : TimedObservation cfg) : ℝ :=
  if observationDone cfg s then 0 else observedSourceIntegral cfg ε M start e s C D L

theorem observationDone_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (observationDone cfg) :=
  ((measurable_subtype_coe.snd.comp measurable_fst).le' measurable_const).or
    (((ProcessState.measurable_stopped n).comp ((ExtendedState.measurable_process n).comp
      ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)))).eq_const true)

theorem selectedObservedWitness_joint_measurable {n : ℕ} (cfg : FlowConfig n) (e : Retention n) :
    Measurable (fun z : TimedObservation cfg×ℝ=>
      selectedWitnessCurve cfg (augTimedInput cfg z.1.1).1 (recordedValue e z.1.2) z.2) := by
  have hx : Measurable (fun z : TimedObservation cfg×ℝ=>(augTimedInput cfg z.1.1).1) :=
    ((augTimedInput_measurable cfg).comp measurable_fst.fst).fst
  apply WitnessState.measurable_mk
  · exact AugmentedState.measurable_mk _ _
      ((selectedTrajectory_measurable cfg).comp (hx.fst.prodMk measurable_snd))
      ((selectedEtaCurve_measurable cfg).comp (hx.prodMk measurable_snd))
  · exact (recordedValue_measurable e).comp measurable_fst.snd

theorem selectedSourceSum_joint_measurable {n : ℕ} (cfg : FlowConfig n) (e : Retention n)
    (start : ℝ) (C D L : Finset (Grid n)) :
    Measurable (fun z : TimedObservation cfg×ℝ=>selectedSourceSum cfg (augTimedInput cfg z.1.1).1
      (recordedValue e z.1.2) C D L e (observationTime cfg start z.1.1) z.2) := by
  apply sourceSum_measurable _ (selectedObservedWitness_joint_measurable cfg e)
  apply measurable_pi_lambda
  intro q
  exact (e.measurable_value q).comp
    ((measurable_const.sub (measurable_subtype_coe.snd.comp measurable_fst.fst)).add measurable_snd)

theorem observedSourceIntegral_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) :
    Measurable (fun s=>observedSourceIntegral cfg ε M start e s C D L) := by
  let f : TimedObservation cfg×ℝ→ℝ := fun z=>
    if 0<z.2 ∧ z.2≤augGuardTime cfg ε M (augTimedInput cfg z.1.1) then
      Real.exp (-(((n:ℝ)*cfg.B)*z.2))*selectedSourceSum cfg (augTimedInput cfg z.1.1).1
        (recordedValue e z.1.2) C D L e (observationTime cfg start z.1.1) z.2 else 0
  have hf : Measurable f := by
    apply Measurable.ite
    · exact (measurableSet_lt measurable_const measurable_snd).inter
        (measurableSet_le measurable_snd ((augGuardTime_measurable cfg ε M).comp
          ((augTimedInput_measurable cfg).comp measurable_fst.fst)))
    · exact (by fun_prop : Measurable (fun z : TimedObservation cfg×ℝ=>Real.exp (-(((n:ℝ)*cfg.B)*z.2)))).mul
        (selectedSourceSum_joint_measurable cfg e start C D L)
    · exact measurable_const
  have hi : Measurable (fun s=>∫t,f (s,t)) := hf.stronglyMeasurable.integral_prod_right'.measurable
  convert hi using 1
  funext s
  rw [observedSourceIntegral,intervalIntegral.integral_of_le
    (augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1).1]
  simpa only [f,Set.indicator,Set.mem_Ioc] using (integral_indicator (μ := volume)
    (s := Ioc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg s.1)))
    (f := fun t=>Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedSourceSum cfg (augTimedInput cfg s.1).1
      (recordedValue e s.2) C D L e (observationTime cfg start s.1) t) measurableSet_Ioc).symm

theorem stepSourceIntegral_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) :
    Measurable (stepSourceIntegral cfg ε M start e C D L) :=
  Measurable.ite (observationDone_measurable cfg).setOf measurable_const
    (observedSourceIntegral_measurable cfg ε M start e C D L)

theorem sourceCap_nonneg {n : ℕ} (Γ : Finset ZPoint) (C D : Finset (Grid n)) (B K : ℝ) :
    0≤sourceCap Γ C D B K := by
  exact Finset.sum_nonneg (fun q _=>mul_nonneg
    (mul_nonneg (div_nonneg zero_le_one (Nat.cast_nonneg n))
      (pow_nonneg (le_trans zero_le_one (le_max_left _ _)) _)) (mixedCap_nonneg (insert q C) B))

theorem observedSourceIntegral_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (s : TimedObservation cfg) (C D L : Finset (Grid n))
    (hs : RecordsConsistent cfg s) (hx : ¬observationDone cfg s)
    (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) :
    0≤observedSourceIntegral cfg ε M start e s C D L ∧
      observedSourceIntegral cfg ε M start e s C D L≤
        (cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K := by
  by_cases hC : C⊆s.1.val.1.physical.process.activeEvents
  swap
  · rw [observedSourceIntegral_zero_of_not_active cfg ε M start e s C D L hC]
    exact ⟨le_rfl,mul_nonneg cfg.horizon.coe_nonneg (sourceCap_nonneg _ _ _ _ _)⟩
  have hstop : s.1.val.1.physical.process.stopped=false := by
    cases hh : s.1.val.1.physical.process.stopped
    · rfl
    · exact False.elim (hx (Or.inr hh))
  let x := augTimedInput cfg s.1
  let T := augGuardTime cfg ε M x
  let Q := sourceCap cfg.directions C D cfg.B cfg.K
  let f := fun t=>Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedSourceSum cfg x.1 (recordedValue e s.2)
    C D L e (observationTime cfg start s.1) t
  have hT := augGuardTime_mem cfg ε M x s.1.property.1.1
  have hbound (t : ℝ) (ht : t∈Ioo 0 T) : 0≤f t ∧ f t≤Q := by
    have hv := selectedWitnessCurve_valid cfg x.1 (recordedValue e s.2) (observedWitness_valid cfg e s hs)
      t ⟨ht.1.le,ht.2.le.trans hT.2⟩
    have hb := sourceSum_bounds _ cfg.directions C D L cfg.mask
      (fun q=>e.value q (observationTime cfg start s.1+t)) cfg.B cfg.K hv
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩) (fun q=>e.bounds q (observationTime cfg start s.1+t)) hK
      (fun q _ J hj hsp=>(shared_clock_selected_lt cfg x.1.1 C q s.1.property.1.1 hstop hC t
        ⟨ht.1.le,ht.2.trans_le hT.2⟩ J hj hsp).le)
    have hexp : Real.exp (-(((n:ℝ)*cfg.B)*t))≤1 := Real.exp_le_one_iff.mpr
      (neg_nonpos.mpr (mul_nonneg (mul_nonneg (Nat.cast_nonneg n) hB) ht.1.le))
    exact ⟨mul_nonneg (Real.exp_pos _).le hb.1,
      (mul_le_mul_of_nonneg_right hexp hb.1).trans (by simpa only [one_mul] using hb.2)⟩
  have hfm : Measurable f := (by fun_prop : Measurable (fun t : ℝ=>Real.exp (-(((n:ℝ)*cfg.B)*t)))).mul
    (selectedSourceSum_measurable cfg x.1 _ C D L e _)
  have hfi : IntervalIntegrable f volume 0 T :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le hT.1).mpr
      (integrableOn_of_nonneg_bound volume (Ioo 0 T) measurableSet_Ioo f hfm Q hbound)
  change 0≤∫t in (0:ℝ)..T,f t ∧ (∫t in (0:ℝ)..T,f t)≤(cfg.horizon:ℝ)*Q
  constructor
  · rw [intervalIntegral.integral_of_le hT.1,integral_Ioc_eq_integral_Ioo]
    exact setIntegral_nonneg measurableSet_Ioo (fun t ht=>(hbound t ht).1)
  · calc
      _ ≤ ∫_t in (0:ℝ)..T,Q := intervalIntegral.integral_mono_on_of_le_Ioo hT.1 hfi intervalIntegrable_const
        (fun t ht=>(hbound t ht).2)
      _ = T*Q := by simp
      _ ≤ _ := mul_le_mul_of_nonneg_right
        ((augGuardTime_le_remaining cfg ε M x s.1.property.2.1).trans s.1.property.2.2)
        (sourceCap_nonneg _ _ _ _ _)

theorem stepSourceIntegral_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (s : TimedObservation cfg) (C D L : Finset (Grid n))
    (hs : RecordsConsistent cfg s) (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) :
    0≤stepSourceIntegral cfg ε M start e C D L s ∧
      stepSourceIntegral cfg ε M start e C D L s≤(cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K := by
  unfold stepSourceIntegral
  split_ifs with hx
  · exact ⟨le_rfl,mul_nonneg cfg.horizon.coe_nonneg (sourceCap_nonneg _ _ _ _ _)⟩
  · exact observedSourceIntegral_bounds cfg ε M start e s C D L hs hx hB hm hK

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedSourceIntegral_measurable
#print axioms NoThreeLine.BirthWitness.stepSourceIntegral_bounds
