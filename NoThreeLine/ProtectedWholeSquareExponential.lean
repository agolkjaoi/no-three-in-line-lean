import NoThreeLine.ProtectedWholeSquareMeanRegularity
import NoThreeLine.ProtectedLedgerExponential

/-! Exact first-exponential averages of the actual whole-square killed
candidate means, with the real whole-event square source. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE

theorem selectedProtectedCreditSquare_first_exponential_mean {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : ℝ→Grid n→Grid n→Bool) (T : ℝ) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    (∫t,(if t≤T then selectedLineLikelihood cfg x L t*
      protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (positive t)
        (fun v a=>(protectedCreditTotal L E v a)^2)
      else selectedLineLikelihood cfg x L T*(protectedCreditTotal L E (selectedTrajectory cfg (x,T)) saved)^2)
      ∂expMeasure ((n:ℝ)*cfg.B))=
      (protectedCreditTotal L E x.val saved)^2+
        ∫t in (0:ℝ)..T,Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedLineLikelihood cfg x L t*
          protectedCreditSquareSource (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L E := by
  let rate : ℝ := (n:ℝ)*cfg.B
  have hr : 0<rate := mul_pos (by exact_mod_cast hn) hB
  letI := isProbabilityMeasure_expMeasure hr
  let C := fun t=>(protectedCreditTotal L E (selectedTrajectory cfg (x,t)) saved)^2
  let G := fun t=>protectedCreditSquareSource (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L E
  let A := fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B (positive t) (fun v a=>(protectedCreditTotal L E v a)^2)
  let Z := selectedLineLikelihood cfg x L
  let z := fun t=>Z t*C t
  let J := fun t=>Z t*A t
  let v := fun t=>Z t*(G t-rate*(A t-C t))
  have hc : Continuous C := (selectedProtectedCreditTotal_continuous cfg x L E saved).pow 2
  have hg : Continuous G := (protectedCreditSquareSource_withCoordinates_continuous x.val saved cfg.directions cfg.mask L E).comp (selectedLedgerCurve_continuous cfg x)
  have hA : ContinuousOn A (Icc 0 T) := (selectedProtectedCreditSquareCandidate_continuousOn cfg x he L E
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
    exact selectedProtectedCreditSquare_likelihood_generator cfg x he K hKcfg hK L E saved hn hB hm hs
      hsp hE hN hk (positive t) t ⟨ht.1,ht.2.trans_le hTg⟩
  change (∫t,(if t≤T then J t else z T) ∂expMeasure rate)=_
  rw [expMeasure_first_step_generator rate T hr hT z v J hz hv hd hJE hJW]
  have hz0 : z 0=(protectedCreditTotal L E x.val saved)^2 := by
    simp only [z,Z,C,selectedLineLikelihood_zero cfg x he L,one_mul,protectedCreditTotal,
      selectedProtectedLedger_zero cfg x he L saved]
  rw [hz0]
  congr 1
  apply intervalIntegral.integral_congr
  intro t _
  dsimp only [v,J,z,Z,G,C,A,rate]
  ring

theorem selectedProtectedEntropySquare_first_exponential_mean {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hE : E⊆L.val) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (positive : ℝ→Grid n→Grid n→Bool) (T : ℝ) (hT : 0≤T) (hTg : T≤selectedGuardTime cfg x) :
    (∫t,(if t≤T then selectedLineLikelihood cfg x L t*
      protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask cfg.B (positive t)
        (fun v a=>(protectedEntropyTotal L E cfg.B v a)^2)
      else selectedLineLikelihood cfg x L T*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,T)) saved)^2)
      ∂expMeasure ((n:ℝ)*cfg.B))=
      (protectedEntropyTotal L E cfg.B x.val saved)^2+
        ∫t in (0:ℝ)..T,Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedLineLikelihood cfg x L t*
          protectedEntropySquareSource (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L E cfg.B := by
  let rate : ℝ := (n:ℝ)*cfg.B
  have hr : 0<rate := mul_pos (by exact_mod_cast hn) hB
  letI := isProbabilityMeasure_expMeasure hr
  let C := fun t=>(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg (x,t)) saved)^2
  let G := fun t=>protectedEntropySquareSource (selectedTrajectory cfg (x,t)) saved cfg.directions cfg.mask L E cfg.B
  let A := fun t=>protectedObservableCandidateMean L (selectedTrajectory cfg (x,t)) saved
    cfg.directions cfg.mask cfg.B (positive t) (fun v a=>(protectedEntropyTotal L E cfg.B v a)^2)
  let Z := selectedLineLikelihood cfg x L
  let z := fun t=>Z t*C t
  let J := fun t=>Z t*A t
  let v := fun t=>Z t*(G t-rate*(A t-C t))
  have hc : Continuous C := (selectedProtectedEntropyTotal_continuous cfg x L E saved cfg.B).pow 2
  have hg : Continuous G := (protectedEntropySquareSource_withCoordinates_continuous x.val saved cfg.directions cfg.mask L E cfg.B hB).comp (selectedLedgerCurve_continuous cfg x)
  have hA : ContinuousOn A (Icc 0 T) := (selectedProtectedEntropySquareCandidate_continuousOn cfg x he L E
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
    exact selectedProtectedEntropySquare_likelihood_generator cfg x he K hKcfg hK L E saved hn hB hm hs
      hsp hE hN hk (positive t) t ⟨ht.1,ht.2.trans_le hTg⟩
  change (∫t,(if t≤T then J t else z T) ∂expMeasure rate)=_
  rw [expMeasure_first_step_generator rate T hr hT z v J hz hv hd hJE hJW]
  have hz0 : z 0=(protectedEntropyTotal L E cfg.B x.val saved)^2 := by
    simp only [z,Z,C,selectedLineLikelihood_zero cfg x he L,one_mul,protectedEntropyTotal,protectedLineEntropy,
      selectedProtectedLedger_zero cfg x he L saved]
  rw [hz0]
  congr 1
  apply intervalIntegral.integral_congr
  intro t _
  dsimp only [v,J,z,Z,G,C,A,rate]
  ring

end NoThreeLine
#print axioms NoThreeLine.selectedProtectedCreditSquare_first_exponential_mean
#print axioms NoThreeLine.selectedProtectedEntropySquare_first_exponential_mean
