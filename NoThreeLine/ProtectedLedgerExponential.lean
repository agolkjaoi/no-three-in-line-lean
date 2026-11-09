import NoThreeLine.ProtectedLedgerRegularity
import NoThreeLine.ExponentialGeneratorIntegral

/-! Exact first-exponential expectation for the actual killed uniform
mark/label mean and the saved protected ledger on a selected segment.
All regularity and the generator are supplied by the physical process. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE

theorem selectedProtectedLedger_zero {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (L : LineIndex n) (saved : Grid n→ℝ) (p : Grid n) :
    protectedLineCredit L (selectedTrajectory cfg (x,0)) saved p=protectedLineCredit L x.val saved p := by
  have heq : selectedTrajectory cfg (x,0)=x.val := by
    simp only [selectedTrajectory,(selectedCurve_spec cfg x he.2.1).1,
      ExtendedState.withCoordinates,ExtendedState.coordinates,ProcessState.withWeights_self]
  rw [heq]

theorem selectedProtectedLedger_first_exponential_mean {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (p : Grid n) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hpL : p∈L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : ℝ→Grid n→Grid n→Bool) (T : ℝ) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    (∫t,(if t≤T then selectedLineLikelihood cfg x L t*
      protectedLedgerCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (positive t) p
      else selectedLineLikelihood cfg x L T*protectedLineCredit L (selectedTrajectory cfg (x,T)) saved p)
      ∂expMeasure ((n:ℝ)*cfg.B))=
      protectedLineCredit L x.val saved p+
        ∫t in (0:ℝ)..T,Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedLineLikelihood cfg x L t*
          protectedLinePositiveDrift (selectedTrajectory cfg (x,t)) cfg.mask L p := by
  let rate : ℝ := (n:ℝ)*cfg.B
  have hr : 0<rate := mul_pos (by exact_mod_cast hn) hB
  letI := isProbabilityMeasure_expMeasure hr
  let C := fun t=>protectedLineCredit L (selectedTrajectory cfg (x,t)) saved p
  let G := fun t=>protectedLinePositiveDrift (selectedTrajectory cfg (x,t)) cfg.mask L p
  let A := fun t=>protectedLedgerCandidateMean L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B (positive t) p
  let Z := selectedLineLikelihood cfg x L
  let z := fun t=>Z t*C t
  let J := fun t=>Z t*A t
  let v := fun t=>Z t*(G t-rate*(A t-C t))
  have hc : Continuous C := selectedProtectedLedger_continuous cfg x L saved p
  have hg : Continuous G := selectedProtectedSource_continuous cfg x L p
  have hA : ContinuousOn A (Icc 0 T) := (selectedProtectedCandidateMean_continuousOn cfg x he L p
    saved hn hB hm hs hsp hpL positive).mono (Icc_subset_Icc le_rfl hTg)
  have hZ : ContinuousOn Z (Icc 0 T) := (selectedLineLikelihood_continuousOn cfg x he K hKcfg hK L
    hsp hN hk).mono (Icc_subset_Icc le_rfl hTg)
  have hz : ContinuousOn z (Icc 0 T) := hZ.mul hc.continuousOn
  have hv : ContinuousOn v (Icc 0 T) :=
    hZ.mul (hg.continuousOn.sub ((hA.sub hc.continuousOn).const_mul rate))
  have hJ : ContinuousOn J (Icc 0 T) := hZ.mul hA
  have hJE : IntegrableOn J (Ioc 0 T) (expMeasure rate) :=
    hJ.integrableOn_Icc.mono_set Ioc_subset_Icc_self
  have hJW : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume 0 T := by
    apply ContinuousOn.intervalIntegrable
    rw [uIcc_of_le hT]
    exact (by fun_prop : Continuous (fun t : ℝ=>rate*Real.exp (-(rate*t)))).continuousOn.mul hJ
  have hd : ∀t∈Ioo 0 T,HasDerivAt z (v t) t := by
    intro t ht
    exact selectedProtectedLedger_likelihood_generator cfg x he K hKcfg hK L p saved hn hB hm hs
      hsp hpL hN hk (positive t) t ⟨ht.1,ht.2.trans_le hTg⟩
  change (∫t,(if t≤T then J t else z T) ∂expMeasure rate)=_
  rw [expMeasure_first_step_generator rate T hr hT z v J hz hv hd hJE hJW]
  have hz0 : z 0=protectedLineCredit L x.val saved p := by
    simp only [z,Z,C,selectedLineLikelihood_zero cfg x he L,one_mul,
      selectedProtectedLedger_zero cfg x he L saved p]
  rw [hz0]
  congr 1
  apply intervalIntegral.integral_congr
  intro t _
  dsimp only [v,J,z,Z,G,C,A,rate]
  ring

end NoThreeLine

#print axioms NoThreeLine.selectedProtectedLedger_first_exponential_mean
