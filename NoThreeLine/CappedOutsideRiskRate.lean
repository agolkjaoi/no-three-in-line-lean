import NoThreeLine.TimedWeightGrowth
import NoThreeLine.OutsideRiskRegularity
import NoThreeLine.BirthRunningRate

/-! The actual outside hazard on the capped selected physical curve.
The root-active, occupancy-one, and stopped birth-rate gates are retained. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

def outsideRiskCap {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (B : ℝ) : ℝ :=
  ∑ L ∈ nonSpecifiedRootBoardLines Γ p, (L.val.val.card : ℝ)*(B/n)

theorem outsideRiskCap_nonneg {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (B : ℝ) (hB : 0 ≤ B) : 0 ≤ outsideRiskCap Γ p B :=
  Finset.sum_nonneg (fun L _ => mul_nonneg (Nat.cast_nonneg _) (div_nonneg hB (Nat.cast_nonneg n)))

theorem physicalOutsideRisk_measurable {n : ℕ} (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (p : Grid n) : Measurable (physicalOutsideRisk Γ mask p) :=
  Finset.measurable_sum _ (fun L _ => physicalOutsideLineRisk_measurable mask p L.val)

theorem physicalOutsideRisk_bounds {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (p : Grid n) (e : ExtendedState n)
    (B : ℝ) (hB : 0 < B) (he : e.Valid B) :
    0 ≤ physicalOutsideRisk Γ mask p e ∧ physicalOutsideRisk Γ mask p e ≤ outsideRiskCap Γ p B :=
  ⟨Finset.sum_nonneg (fun L _ => (physicalOutsideLineRisk_bounds mask hm p L.val e B hB he).1),
    Finset.sum_le_sum (fun L _ => (physicalOutsideLineRisk_bounds mask hm p L.val e B hB he).2)⟩

theorem physicalOutsideRisk_stopped {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (p : Grid n) (e : ExtendedState n) (hs : e.process.stopped = true) :
    physicalOutsideRisk Γ mask p e = 0 := by
  simp [physicalOutsideRisk,physicalOutsideLineRisk,ProcessState.birthRate,hs]

def cappedOutsideRiskRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (x : AugTimedState cfg × ℝ) : ℝ :=
  physicalOutsideRisk cfg.directions cfg.mask p
    (selectedTrajectory cfg ((augTimedInput cfg x.1).1.1,
      augAdvance cfg ε M (augTimedInput cfg x.1,x.2)))

theorem cappedOutsideRiskRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (cappedOutsideRiskRate cfg ε M p) :=
  (physicalOutsideRisk_measurable cfg.directions cfg.mask p).comp
    ((selectedTrajectory_measurable cfg).comp
      ((((augTimedInput_measurable cfg).comp measurable_fst).fst.fst).prodMk
        ((augAdvance_measurable cfg ε M).comp
          (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd))))

theorem cappedOutsideRiskRate_eq_flow {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : AugTimedState cfg) (t : ℝ)
    (ht : t ∈ Icc (0 : ℝ) (augGuardTime cfg ε M (augTimedInput cfg s))) :
    cappedOutsideRiskRate cfg ε M p (s,t) = physicalOutsideRisk cfg.directions cfg.mask p
      (selectedTrajectory cfg ((augTimedInput cfg s).1.1,t)) := by
  unfold cappedOutsideRiskRate
  have ha : augAdvance cfg ε M (augTimedInput cfg s,t) = t := by
    change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) t) = t
    rw [min_eq_right ht.2,max_eq_right ht.1]
  rw [ha]

theorem cappedOutsideRiskRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1) (x : AugTimedState cfg × ℝ) :
    0 ≤ cappedOutsideRiskRate cfg ε M p x ∧
      cappedOutsideRiskRate cfg ε M p x ≤ outsideRiskCap cfg.directions p cfg.B := by
  have ht := augAdvance_mem cfg ε M (augTimedInput cfg x.1) x.1.property.1.1 x.2
  exact physicalOutsideRisk_bounds cfg.directions cfg.mask (fun q => ⟨cfg.mask_nonneg q,hm q⟩) p _
    cfg.B hB (selectedTrajectory_valid cfg (augTimedInput cfg x.1).1.1 x.1.property.1.1 _
      ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M _ x.1.property.1.1).2⟩)

theorem augTimedOutsideRiskCost_capped_integral {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (s : AugTimedState cfg) (z : CandidateData n) :
    augTimedOutsideRiskCost cfg ε M p s z =
      ∫ u in (0 : ℝ)..birthElapsed cfg ε M (s,z), cappedOutsideRiskRate cfg ε M p (s,u) := by
  unfold augTimedOutsideRiskCost birthElapsed birthDone
  split_ifs
  · simp
  · unfold selectedOutsideRiskIntegral
    apply intervalIntegral.integral_congr
    intro u hu
    have ht := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    rw [uIcc_of_le ht.1] at hu
    exact (cappedOutsideRiskRate_eq_flow cfg ε M p s u ⟨hu.1,hu.2.trans ht.2⟩).symm

end NoThreeLine

#print axioms NoThreeLine.physicalOutsideRisk_measurable
#print axioms NoThreeLine.cappedOutsideRiskRate_bounds
#print axioms NoThreeLine.augTimedOutsideRiskCost_capped_integral
