import NoThreeLine.ProtectedEntropySource
import NoThreeLine.ProtectedLedgerExponential

/-! Actual selected-flow entropy compensation and its exact first
exponential integral, including initially zero and saved credits. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE

theorem selectedProtectedEntropy_likelihood_generator {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (p : Grid n) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hpL : p∈L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : Grid n→Grid n→Bool) (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x)) :
    HasDerivAt (fun u=>selectedLineLikelihood cfg x L u*protectedLineEntropy L (selectedTrajectory cfg (x,u)) saved cfg.B p)
      (selectedLineLikelihood cfg x L t*
        (protectedEntropySource (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L p cfg.B-
          ((n:ℝ)*cfg.B)*(protectedEntropyCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B positive p-
            protectedLineEntropy L (selectedTrajectory cfg (x,t)) saved cfg.B p))) t := by
  have hl := selectedLineLikelihood_hasDerivAt cfg x he K hKcfg hK L hs hsp hN hk t ht
  have hc := selected_protectedLedgerEntropy_hasDerivAt cfg x he L p saved K hKcfg hK hs hsp hN hk hB t ht
  have hg := protectedEntropyCandidateMean_compensation_all L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B hn hB (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
    (selectedTrajectory_valid cfg x he t ⟨ht.1.le,ht.2.le⟩) positive p hs hpL hsp
  apply (hl.mul hc).congr_deriv
  change (lineIntensity (selectedTrajectory cfg (x,t)).process cfg.mask (selectedTrajectory cfg (x,t)).coordinates L*
    selectedLineLikelihood cfg x L t)*protectedLineEntropy L (selectedTrajectory cfg (x,t)) saved cfg.B p+
    selectedLineLikelihood cfg x L t*(protectedEntropySlope cfg.B (protectedLineCredit L (selectedTrajectory cfg (x,t)) saved p)*
      protectedLedgerContinuousDrift (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L p)=_
  unfold protectedEntropySource
  have hgm := congrArg (fun v : ℝ=>selectedLineLikelihood cfg x L t*v) hg
  nlinarith only [hgm]

theorem selectedProtectedEntropy_first_exponential_mean {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (p : Grid n) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hpL : p∈L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : ℝ→Grid n→Grid n→Bool) (T : ℝ) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    (∫t,(if t≤T then selectedLineLikelihood cfg x L t*
      protectedEntropyCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (positive t) p
      else selectedLineLikelihood cfg x L T*protectedLineEntropy L (selectedTrajectory cfg (x,T)) saved cfg.B p)
      ∂expMeasure ((n:ℝ)*cfg.B))=
      protectedLineEntropy L x.val saved cfg.B p+
        ∫t in (0:ℝ)..T,Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedLineLikelihood cfg x L t*
          protectedEntropySource (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L p cfg.B := by
  let rate : ℝ := (n:ℝ)*cfg.B
  have hr : 0<rate := mul_pos (by exact_mod_cast hn) hB
  letI := isProbabilityMeasure_expMeasure hr
  let C := fun t=>protectedLineEntropy L (selectedTrajectory cfg (x,t)) saved cfg.B p
  let G := fun t=>protectedEntropySource (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L p cfg.B
  let A := fun t=>protectedEntropyCandidateMean L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B (positive t) p
  let Z := selectedLineLikelihood cfg x L
  let z := fun t=>Z t*C t
  let J := fun t=>Z t*A t
  let v := fun t=>Z t*(G t-rate*(A t-C t))
  have hc : Continuous C := selectedProtectedEntropy_continuous cfg x L saved cfg.B p
  have hg : Continuous G := selectedProtectedEntropySource_continuous cfg x L saved p hB
  have hA : ContinuousOn A (Icc 0 T) := (selectedProtectedEntropyCandidateMean_continuousOn cfg x he L p
    saved hn hB hm hs positive).mono (Icc_subset_Icc le_rfl hTg)
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
    exact selectedProtectedEntropy_likelihood_generator cfg x he K hKcfg hK L p saved hn hB hm hs
      hsp hpL hN hk (positive t) t ⟨ht.1,ht.2.trans_le hTg⟩
  change (∫t,(if t≤T then J t else z T) ∂expMeasure rate)=_
  rw [expMeasure_first_step_generator rate T hr hT z v J hz hv hd hJE hJW]
  have hz0 : z 0=protectedLineEntropy L x.val saved cfg.B p := by
    simp only [z,Z,C,selectedLineLikelihood_zero cfg x he L,one_mul,
      protectedLineEntropy,selectedProtectedLedger_zero cfg x he L saved p]
  rw [hz0]
  congr 1
  apply intervalIntegral.integral_congr
  intro t _
  dsimp only [v,J,z,Z,G,C,A,rate]
  ring

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedEntropy_likelihood_generator
#print axioms NoThreeLine.selectedProtectedEntropy_first_exponential_mean
