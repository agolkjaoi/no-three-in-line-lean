import NoThreeLine.ProtectedEntropyRunningMean
import NoThreeLine.ProtectedFirstSource

/-! Joint measurability of the signed entropy source, in particular for
random incoming protected states. No incoming-law integrability is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

theorem protectedEntropyLedgerCostRate_measurable {n : ℕ} (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) :
    Measurable (fun e : ExtendedState n=>protectedEntropyLedgerCostRate e Γ mask L p) := by
  have hs := ExtendedState.measurable_process n
  have ha (q : Grid n) := CreditAccount.measurable_status.comp ((ProcessState.measurable_account n q).comp hs)
  unfold protectedEntropyLedgerCostRate protectedEntropyPointCostRate ProcessState.activeEvents
  simp only [Finset.sum_filter]
  apply Measurable.ite (ha p |>.eq_const CreditStatus.active).setOf _ measurable_const
  apply Finset.measurable_sum
  intro q _
  apply Measurable.ite (ha q |>.eq_const CreditStatus.active).setOf _ measurable_const
  by_cases hq : q∈L.val
  · simp only [if_pos hq]
    exact measurable_const
  · simp only [if_neg hq]
    exact ((process_birthRate_measurable mask q).comp hs).mul
      ((specifiedLineWeight_measurable L p).mul
        ((measurable_of_countable (fun S : Finset (Grid n)=>protectedEntropyCost (birthMultiplier Γ S p q))).comp
          ((ProcessState.measurable_selected n).comp hs)))

theorem protectedEntropySource_measurable {n : ℕ} (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (p : Grid n) (B : ℝ) :
    Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>protectedEntropySource x.1 x.2 Γ mask L p B) := by
  unfold protectedEntropySource protectedEntropySlope
  exact (((measurable_const.div (protectedLineCredit_measurable L p)).log).mul
    ((protectedLinePositiveDrift_measurable mask L p).comp measurable_fst)).sub
      ((protectedEntropyLedgerCostRate_measurable Γ mask L p).comp measurable_fst)

attribute [local irreducible] protectedEntropySource

theorem selectedProtectedEntropySource_joint_measurable {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) :
    Measurable (fun z : (StateBall n cfg.box×(Grid n→ℝ))×ℝ=>
      protectedEntropySource (selectedTrajectory cfg (z.1.1,z.2)) z.1.2 cfg.directions cfg.mask L p cfg.B) :=
  (protectedEntropySource_measurable cfg.directions cfg.mask L p cfg.B).comp
    (((selectedTrajectory_measurable cfg).comp (measurable_fst.fst.prodMk measurable_snd)).prodMk measurable_fst.snd)

theorem protectedFirstEntropySource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) : Measurable (protectedFirstEntropySource cfg ε M L p) := by
  have hd : Measurable (fun s : ProtectedTimedState cfg=>s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true) :=
    ((measurable_subtype_coe.snd.comp measurable_fst).le' measurable_const).or
      (((ProcessState.measurable_stopped n).comp ((ExtendedState.measurable_process n).comp
        ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)))).eq_const true)
  have hi : Measurable (fun s : ProtectedTimedState cfg=>(augTimedInput cfg s.1).1.1) :=
    ((augTimedInput_measurable cfg).comp measurable_fst).fst.fst
  have hx : Measurable (fun z : ProtectedTimedState cfg×ℝ=>((augTimedInput cfg z.1.1).1.1,z.2)) :=
    (hi.comp measurable_fst).prodMk measurable_snd
  have hg : Measurable (fun z : ProtectedTimedState cfg×ℝ=>
      protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg z.1.1).1.1,z.2)) z.1.2 cfg.directions cfg.mask L p cfg.B) :=
    (selectedProtectedEntropySource_joint_measurable cfg L p).comp
      (((hi.comp measurable_fst).prodMk measurable_fst.snd).prodMk measurable_snd)
  have hf := ((by fun_prop : Measurable (fun z : ProtectedTimedState cfg×ℝ=>Real.exp (-(((n:ℝ)*cfg.B)*z.2)))).mul
    ((selectedLineLikelihood_joint_measurable cfg L).comp hx)).mul hg
  exact Measurable.ite hd.setOf measurable_const
    (variable_running_integral_measurable _ ((augGuardTime_measurable cfg ε M).comp
      ((augTimedInput_measurable cfg).comp measurable_fst))
      (fun s=>(augGuardTime_mem cfg ε M _ s.1.property.1.1).1) _ hf)

theorem protectedRunningEntropySource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) :
    Measurable (fun z : ProtectedTimedState cfg×CandidateData n=>protectedRunningEntropySource cfg ε M L p z.1 z.2) := by
  have hd : Measurable (fun z : ProtectedTimedState cfg×CandidateData n=>
      z.1.1.val.2≤0 ∨ z.1.1.val.1.physical.process.stopped=true) :=
    ((measurable_subtype_coe.snd.comp measurable_fst.fst).le' measurable_const).or
      (((ProcessState.measurable_stopped n).comp ((ExtendedState.measurable_process n).comp
        ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst.fst)))).eq_const true)
  have hi : Measurable (fun z : ProtectedTimedState cfg×CandidateData n=>(augTimedInput cfg z.1.1).1.1) :=
    ((augTimedInput_measurable cfg).comp measurable_fst.fst).fst.fst
  have hA : Measurable (fun z : ProtectedTimedState cfg×CandidateData n=>augAdvance cfg ε M (augTimedInput cfg z.1.1,z.2.1.1)) :=
    (augAdvance_measurable cfg ε M).comp (((augTimedInput_measurable cfg).comp measurable_fst.fst).prodMk measurable_snd.fst.fst)
  have hg : Measurable (fun z : (ProtectedTimedState cfg×CandidateData n)×ℝ=>
      protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg z.1.1.1).1.1,z.2)) z.1.1.2 cfg.directions cfg.mask L p cfg.B) :=
    (selectedProtectedEntropySource_joint_measurable cfg L p).comp
      (((hi.comp measurable_fst).prodMk measurable_fst.fst.snd).prodMk measurable_snd)
  exact Measurable.ite hd.setOf measurable_const
    (variable_running_integral_measurable _ hA
      (fun z=>(augAdvance_mem cfg ε M _ z.1.1.property.1.1 z.2.1.1).1) _ hg)

end NoThreeLine
#print axioms NoThreeLine.protectedFirstEntropySource_measurable
#print axioms NoThreeLine.protectedRunningEntropySource_joint_measurable
