import NoThreeLine.ProtectedWholeSquareRunningMean
import NoThreeLine.ProtectedEntropyMeasurable

/-! Joint measurable whole-square sources for the actual physical state
and old saved ledger, including the real remaining-time capped integral. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

theorem protectedWholeDeletion_measurable {n : ℕ} (Γ : Finset ZPoint)
    (L : LineIndex n) (E : Finset (Grid n)) (q : Grid n) (B : ℝ) :
    Measurable (fun e : ExtendedState n=>protectedExternalDeletion e Γ L E q) ∧
      Measurable (fun e : ExtendedState n=>protectedEntropyDeletion e Γ L E q B) := by
  have hs := ExtendedState.measurable_process n
  have ha (p : Grid n) := CreditAccount.measurable_status.comp ((ProcessState.measurable_account n p).comp hs)
  have hJ (p : Grid n) : Measurable (fun e : ExtendedState n=>birthMultiplier Γ e.process.selected p q) :=
    (measurable_of_countable (fun S : Finset (Grid n)=>birthMultiplier Γ S p q)).comp ((ProcessState.measurable_selected n).comp hs)
  constructor
  · unfold protectedExternalDeletion
    simp only [Finset.sum_filter]
    apply Finset.measurable_sum
    intro p _
    exact Measurable.ite (ha p |>.eq_const CreditStatus.active).setOf
      ((measurable_const.sub (hJ p)).mul (specifiedLineWeight_measurable L p)) measurable_const
  · unfold protectedEntropyDeletion
    simp only [Finset.sum_filter]
    apply Finset.measurable_sum
    intro p _
    exact Measurable.ite (ha p |>.eq_const CreditStatus.active).setOf
      (((protectedEntropy_measurable B).comp (specifiedLineWeight_measurable L p)).sub
        ((protectedEntropy_measurable B).comp ((hJ p).mul (specifiedLineWeight_measurable L p)))) measurable_const

theorem protectedExternalEventRate_measurable {n : ℕ} (mask : Grid n→ℝ) (L : LineIndex n)
    (G : ExtendedState n→Grid n→ℝ) (hG : ∀q,Measurable (fun e=>G e q)) :
    Measurable (fun e : ExtendedState n=>protectedExternalEventRate e mask L (G e)) := by
  have hs := ExtendedState.measurable_process n
  have ha (q : Grid n) := CreditAccount.measurable_status.comp ((ProcessState.measurable_account n q).comp hs)
  unfold protectedExternalEventRate ProcessState.activeEvents
  simp only [Finset.sum_filter]
  apply Finset.measurable_sum
  intro q _
  apply Measurable.ite (ha q |>.eq_const CreditStatus.active).setOf _ measurable_const
  by_cases hq : q∈L.val
  · simp only [if_pos hq]
    exact measurable_const
  · simp only [if_neg hq]
    exact ((process_birthRate_measurable mask q).comp hs).mul (hG q)

theorem protectedCreditSquareSource_measurable {n : ℕ} (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) :
    Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>protectedCreditSquareSource x.1 x.2 Γ mask L E) := by
  have hC : Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>protectedCreditTotal L E x.1 x.2) :=
    Finset.measurable_sum _ (fun p _=>protectedLineCredit_measurable L p)
  have hS : Measurable (fun e : ExtendedState n=>protectedCreditTotalSource e mask L E) :=
    Finset.measurable_sum _ (fun p _=>protectedLinePositiveDrift_measurable mask L p)
  have hV := protectedExternalEventRate_measurable mask L
    (fun e q=>(protectedExternalDeletion e Γ L E q)^2)
    (fun q=>((protectedWholeDeletion_measurable Γ L E q 0).1).pow_const 2)
  exact ((hC.const_mul 2).mul (hS.comp measurable_fst)).add (hV.comp measurable_fst)

theorem protectedEntropySquareSource_measurable {n : ℕ} (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (L : LineIndex n) (E : Finset (Grid n)) (B : ℝ) :
    Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>protectedEntropySquareSource x.1 x.2 Γ mask L E B) := by
  have hC : Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>protectedEntropyTotal L E B x.1 x.2) :=
    Finset.measurable_sum _ (fun p _=>protectedLineEntropy_measurable L B p)
  have hS : Measurable (fun x : ExtendedState n×(Grid n→ℝ)=>protectedEntropyTotalSource x.1 x.2 Γ mask L E B) :=
    Finset.measurable_sum _ (fun p _=>protectedEntropySource_measurable Γ mask L p B)
  have hV := protectedExternalEventRate_measurable mask L
    (fun e q=>(protectedEntropyDeletion e Γ L E q B)^2)
    (fun q=>((protectedWholeDeletion_measurable Γ L E q B).2).pow_const 2)
  exact ((hC.const_mul 2).mul hS).add (hV.comp measurable_fst)

theorem protectedRunningStateSource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hF : Measurable F) :
    Measurable (fun z : ProtectedTimedState cfg×CandidateData n=>protectedRunningScalarSource cfg ε M z.1.1
      (fun t=>F (selectedTrajectory cfg ((augTimedInput cfg z.1.1).1.1,t),z.1.2)) z.2) := by
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
      F (selectedTrajectory cfg ((augTimedInput cfg z.1.1.1).1.1,z.2),z.1.1.2)) :=
    hF.comp (((selectedTrajectory_measurable cfg).comp
      ((hi.comp measurable_fst).prodMk measurable_snd)).prodMk measurable_fst.fst.snd)
  exact Measurable.ite hd.setOf measurable_const
    (variable_running_integral_measurable _ hA
      (fun z=>(augAdvance_mem cfg ε M _ z.1.1.property.1.1 z.2.1.1).1) _ hg)

theorem protectedRunningCreditSquareSource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) :
    Measurable (fun z : ProtectedTimedState cfg×CandidateData n=>protectedRunningCreditSquareSource cfg ε M L E z.1 z.2) :=
  protectedRunningStateSource_joint_measurable cfg ε M _ (protectedCreditSquareSource_measurable cfg.directions cfg.mask L E)

theorem protectedRunningEntropySquareSource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) :
    Measurable (fun z : ProtectedTimedState cfg×CandidateData n=>protectedRunningEntropySquareSource cfg ε M L E z.1 z.2) :=
  protectedRunningStateSource_joint_measurable cfg ε M _ (protectedEntropySquareSource_measurable cfg.directions cfg.mask L E cfg.B)

end NoThreeLine
#print axioms NoThreeLine.protectedRunningCreditSquareSource_joint_measurable
#print axioms NoThreeLine.protectedRunningEntropySquareSource_joint_measurable
