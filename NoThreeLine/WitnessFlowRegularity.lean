import NoThreeLine.WitnessObservableBounds
import NoThreeLine.WitnessSourceDomain

/-! Regularity of the actual selected mixed observable and its actual
continuous drift. Inverses of protection are polynomial in the clock;
no positivity or nonzero assumption on the observable is required. -/
set_option autoImplicit false
noncomputable section
open Set MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct EtaMixedGenerator

theorem phi_coordinates_continuous {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) : Continuous (fun z : Coordinates n=>phi Γ C (e.withCoordinates z)) := by
  simp only [phi,withCoordinates_activeEvents]
  split_ifs
  · apply Continuous.mul
    · change Continuous (fun z : Coordinates n=>∏p∈C,z.1 p)
      fun_prop
    · apply continuous_finsetProd
      intro K _
      unfold lineConnection
      split_ifs
      · change Continuous (fun z : Coordinates n=>(protection (occupancy e.process K) (z.2.1 K))⁻¹ ^ _)
        simp only [protection,inv_div]
        fun_prop
      · change Continuous (fun z : Coordinates n=>(z.2.2 K)^_)
        fun_prop
  · exact continuous_const

theorem phiGrowth_coordinates_continuous {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (mask : Grid n→ℝ) : Continuous (phiGrowth s Γ C mask) := by
  unfold phiGrowth
  apply Continuous.add
  · exact continuous_finsetSum _ (fun p _=>(s.perCapitaGrowth_continuous Γ mask p).comp continuous_fst)
  · apply continuous_finsetSum
    intro K _
    apply Continuous.const_mul
    unfold connectionDamping
    split_ifs
    · exact clockDamping_continuous s Γ mask K
    · exact creditDamping_continuous s Γ mask K

theorem pairRateSum_coordinates_continuous {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (L : Finset (Grid n)) (mask : Grid n→ℝ) : Continuous (pairRateSum L s Γ mask) := by
  exact continuous_finsetSum _ (fun p _=>(pairRate_contDiff s Γ mask p.1 p.2).continuous)

theorem selected_coordinates_continuous {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box) :
    Continuous (fun t=>selectedCurve cfg (x,t)) := by
  change Continuous (fun t=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,t))
  exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)

theorem selectedMixed_continuous {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C D L : Finset (Grid n)) :
    Continuous (fun t=>mixed cfg.directions C D L (selectedWitnessCurve cfg x b t)) := by
  change Continuous (fun t=>(∏p∈D,b p)*
    (etaProduct L (selectedEtaCurve cfg (x,t))*phi cfg.directions C (x.1.val.withCoordinates (selectedCurve cfg (x.1,t)))))
  apply Continuous.const_mul
  apply Continuous.mul
  · apply continuous_finsetProd
    intro p _
    exact (continuous_apply p.2).comp ((continuous_apply p.1).comp (selectedEtaCurve_continuous cfg x))
  · exact (phi_coordinates_continuous x.1.val cfg.directions C).comp (selected_coordinates_continuous cfg x.1)

theorem selectedContinuousDrift_continuous {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C D L : Finset (Grid n)) :
    Continuous (fun t=>continuousDrift (selectedWitnessCurve cfg x b t) cfg.directions C D L cfg.mask) := by
  have hc := (phiGrowth_coordinates_continuous x.1.val.process cfg.directions C cfg.mask).sub
    (pairRateSum_coordinates_continuous x.1.val.process cfg.directions L cfg.mask)
  have h := (selectedMixed_continuous cfg x b C D L).mul (hc.comp (selected_coordinates_continuous cfg x.1))
  convert h using 1
  ext t
  dsimp only [continuousDrift,correctedContinuousDrift,mixed]
  exact (mul_assoc _ _ _).symm

theorem selectedWitnessCurve_measurable {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) : Measurable (selectedWitnessCurve cfg x b) :=
  WitnessState.measurable_mk _ _ (AugmentedState.measurable_mk _ _
    ((selectedTrajectory_measurable cfg).comp (measurable_const.prodMk measurable_id))
    ((selectedEtaCurve_measurable cfg).comp (measurable_const.prodMk measurable_id))) measurable_const

theorem WitnessState.birth_measurable {n : ℕ} (Γ : Finset ZPoint) (q : Grid n) :
    Measurable (fun x : WitnessState n×(Grid n→ℝ)=>x.1.birth Γ q x.2) := by
  have ha := (WitnessState.measurable_augmented n).comp (measurable_fst : Measurable (Prod.fst : WitnessState n×(Grid n→ℝ)→WitnessState n))
  have he := (AugmentedState.measurable_physical n).comp ha
  have hs := (ExtendedState.measurable_process n).comp he
  unfold WitnessState.birth
  apply Measurable.ite
  · simpa only [Function.comp_def,ProcessState.mem_activeEvents] using (((ProcessState.measurable_stopped n).comp hs).eq_const false |>.and
      ((CreditAccount.measurable_status.comp ((ProcessState.measurable_account n q).comp hs)).eq_const .active)).setOf
  · apply WitnessState.measurable_mk
    · exact AugmentedState.measurable_mk _ _
        ((ExtendedState.measurable_birth_fixed Γ q).comp (he.prodMk measurable_const))
        ((AugmentedState.measurable_eta n).comp ha)
    · exact measurable_update'.comp (((WitnessState.measurable_retained n).comp measurable_fst).prodMk
        ((measurable_pi_apply q).comp measurable_snd))
  · exact measurable_fst

theorem candidateMixedMean_measurable {n : ℕ} {X : Type*} [MeasurableSpace X]
    (a : X→WitnessState n) (ha : Measurable a) (ret : X→Grid n→ℝ) (hr : Measurable ret)
    (Γ : Finset ZPoint) (C D L : Finset (Grid n)) (mask : Grid n→ℝ) (B : ℝ)
    (hB : 0<B) (hv : ∀x,(a x).Valid B) (hm : ∀q,0≤mask q ∧ mask q≤1) :
    Measurable (fun x=>candidateMixedMean (a x) Γ C D L mask (ret x) B) := by
  have hα (q : Grid n) := (ProcessState.measurable_acceptance mask B q).comp
    ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
      ((WitnessState.measurable_augmented n).comp ha)))
  have he : (fun x=>candidateMixedMean (a x) Γ C D L mask (ret x) B)=
      fun x=>(∑q : Grid n,((a x).augmented.physical.process.acceptance mask B q*
        mixed Γ C D L ((a x).birth Γ q (ret x))+
        (1-(a x).augmented.physical.process.acceptance mask B q)*mixed Γ C D L (a x)))/(n:ℝ)^2 := by
    ext x
    simp only [candidateMixedMean,witness_mark_mean (a x) Γ C D L mask (ret x) B hB (hv x) hm]
  rw [he]
  apply Measurable.div_const
  apply Finset.measurable_sum
  intro q _
  exact ((hα q).mul ((mixed_measurable Γ C D L).comp
    ((WitnessState.birth_measurable Γ q).comp (ha.prodMk hr)))).add
      ((measurable_const.sub (hα q)).mul ((mixed_measurable Γ C D L).comp ha))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.selectedContinuousDrift_continuous
#print axioms NoThreeLine.BirthWitness.candidateMixedMean_measurable
