import NoThreeLine.ProtectedLedgerFirstMean
import NoThreeLine.RunningIntegralRegularity

/-! The actual one-step protected source is measurable in the incoming
state and bounded on the fixed-occupancy region. This is the analytic
source mean; its identification with a forbidden-law running cost is
separate from these regularity statements. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness LineDrift

theorem specifiedLineWeight_measurable {n : ℕ} (L : LineIndex n) (p : Grid n) :
    Measurable (fun e : ExtendedState n=>specifiedLineWeight e L p) := by
  have hw := CreditAccount.measurable_weight.comp ((ProcessState.measurable_account n p).comp (ExtendedState.measurable_process n))
  have hk := (measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)
  have ho := (measurable_of_countable (fun j : ℕ=>(j:ℝ))).comp (ExtendedState.measurable_occupancy n L)
  simp only [specifiedLineWeight_formula]
  exact (hw.mul (measurable_const.sub hk)).div (measurable_const.sub ho)

theorem protectedLinePositiveDrift_measurable {n : ℕ} (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) :
    Measurable (fun e : ExtendedState n=>protectedLinePositiveDrift e mask L p) := by
  have hr := (process_birthRate_measurable mask p).comp (ExtendedState.measurable_process n)
  have hb := (measurable_of_countable b).comp (ExtendedState.measurable_occupancy n L)
  exact (hr.mul (measurable_const.sub hb)).mul (specifiedLineWeight_measurable L p)

theorem selectedLineLikelihood_joint_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) :
    Measurable (fun z : StateBall n cfg.box×ℝ=>selectedLineLikelihood cfg z.1 L z.2) := by
  have ho : Measurable (fun z : StateBall n cfg.box×ℝ=>(occupancy z.1.val.process L:ℝ)) :=
    ((measurable_of_countable (fun j : ℕ=>(j:ℝ))).comp
    ((ExtendedState.measurable_occupancy n L).comp measurable_subtype_coe)).comp measurable_fst
  have hk : Measurable (fun z : StateBall n cfg.box×ℝ=>z.1.val.clocks L) :=
    ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp
    (measurable_subtype_coe.comp measurable_fst)
  have hf : Measurable (fun z : StateBall n cfg.box×ℝ=>(selectedCurve cfg z).2.1 L) :=
    (measurable_pi_apply L).comp (selectedCurve_measurable cfg).snd.fst
  unfold selectedLineLikelihood specifiedClockHazardPotential
  exact (((measurable_const.sub ho).mul (measurable_const.sub (measurable_const.sub hf).log)).sub
    ((measurable_const.sub ho).mul (measurable_const.sub (measurable_const.sub hk).log))).exp

theorem protectedFirstSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) : Measurable (protectedFirstSource cfg ε M L p) := by
  have hd : Measurable (fun s : AugTimedState cfg=>s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) :=
    (measurable_subtype_coe.snd.le' measurable_const).or
      (((ProcessState.measurable_stopped n).comp ((ExtendedState.measurable_process n).comp
        ((AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst))).eq_const true)
  have hx : Measurable (fun z : AugTimedState cfg×ℝ=>((augTimedInput cfg z.1).1.1,z.2)) :=
    (((augTimedInput_measurable cfg).comp measurable_fst).fst.fst).prodMk measurable_snd
  have hf : Measurable (fun z : AugTimedState cfg×ℝ=>
      Real.exp (-(((n:ℝ)*cfg.B)*z.2))*selectedLineLikelihood cfg (augTimedInput cfg z.1).1.1 L z.2*
        protectedLinePositiveDrift (selectedTrajectory cfg ((augTimedInput cfg z.1).1.1,z.2)) cfg.mask L p) :=
    ((by fun_prop : Measurable (fun z : AugTimedState cfg×ℝ=>Real.exp (-(((n:ℝ)*cfg.B)*z.2)))).mul
      ((selectedLineLikelihood_joint_measurable cfg L).comp hx)).mul
        ((protectedLinePositiveDrift_measurable cfg.mask L p).comp ((selectedTrajectory_measurable cfg).comp hx))
  exact Measurable.ite hd.setOf measurable_const
    (variable_running_integral_measurable _ ((augGuardTime_measurable cfg ε M).comp (augTimedInput_measurable cfg))
      (fun s=>(augGuardTime_mem cfg ε M _ s.property.1.1).1) _ hf)

theorem protectedFirstSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg)
    (hN : occupancy s.val.1.physical.process L≤1) (hk : s.val.1.physical.clocks L≤K) :
    0≤protectedFirstSource cfg ε M L p s ∧ protectedFirstSource cfg ε M L p s≤
      (cfg.horizon:ℝ)*((2/(2-K))^2*((cfg.B/n)*cfg.B)) := by
  let cap : ℝ := (2/(2-K))^2*((cfg.B/n)*cfg.B)
  have hcap : 0≤cap := mul_nonneg (sq_nonneg _) (mul_nonneg (div_nonneg hB (Nat.cast_nonneg n)) hB)
  unfold protectedFirstSource
  split_ifs
  · exact ⟨le_rfl,mul_nonneg cfg.horizon.coe_nonneg hcap⟩
  · let x := (augTimedInput cfg s).1.1
    let T := augGuardTime cfg ε M (augTimedInput cfg s)
    let S := fun t=>Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedLineLikelihood cfg x L t*
      protectedLinePositiveDrift (selectedTrajectory cfg (x,t)) cfg.mask L p
    have hSm : Measurable S := ((by fun_prop : Measurable (fun t : ℝ=>Real.exp (-(((n:ℝ)*cfg.B)*t)))).mul
      (selectedLineLikelihood_measurable cfg x L)).mul
        ((selectedProtectedSource_continuous cfg x L p).measurable)
    have hT := augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1
    have hb (t : ℝ) (ht : t∈Ioo (0:ℝ) T) : 0≤S t ∧ S t≤cap := by
      have htg : t∈Icc (0:ℝ) (selectedGuardTime cfg x) := ⟨ht.1.le,ht.2.le.trans hT.2⟩
      have hv := selectedTrajectory_valid cfg x s.property.1.1 t htg
      have hclock := selectedCurve_specifiedClock_le cfg x s.property.1.1 K hKcfg L hsp hN hk t htg
      have hc := specifiedLineWeight_bounds (selectedTrajectory cfg (x,t)) L p cfg.B K hv hN hclock hK
      have hg := protectedLinePositiveDrift_bounds (selectedTrajectory cfg (x,t)) cfg.mask L p cfg.B K hv
        (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hN hclock hK
      have hgB : protectedLinePositiveDrift (selectedTrajectory cfg (x,t)) cfg.mask L p≤(cfg.B/n)*cfg.B := by
        calc
          _ ≤ ((cfg.B/n)/2)*(2*cfg.B) := hg.2.trans
            (mul_le_mul_of_nonneg_left hc.2 (div_nonneg (div_nonneg hB (Nat.cast_nonneg n)) (by norm_num)))
          _ = _ := by ring
      have hz := selectedLineLikelihood_bounds cfg x s.property.1.1 K hKcfg hK L hsp hN hk t htg
      have he : Real.exp (-(((n:ℝ)*cfg.B)*t))≤1 := Real.exp_le_one_iff.mpr
        (neg_nonpos.mpr (mul_nonneg (mul_nonneg (Nat.cast_nonneg n) hB) ht.1.le))
      refine ⟨mul_nonneg (mul_nonneg (Real.exp_pos _).le hz.1.le) hg.1,?_⟩
      exact mul_le_mul ((mul_le_of_le_one_left hz.1.le he).trans hz.2) hgB hg.1 (sq_nonneg _)
    have hi := integral_initial_segment_bounds T T hT.1 le_rfl S hSm cap hcap hb
    exact ⟨hi.1,hi.2.trans (mul_le_mul_of_nonneg_right
      ((augGuardTime_le_remaining cfg ε M _ s.property.2.1).trans s.property.2.2) hcap)⟩

end NoThreeLine

#print axioms NoThreeLine.protectedFirstSource_measurable
#print axioms NoThreeLine.protectedFirstSource_bounds
