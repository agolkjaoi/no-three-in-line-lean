import NoThreeLine.AcceptedSectionMasks
import NoThreeLine.ScheduledSectionAllTime
import NoThreeLine.AugmentedLineCreditLoss

/-! Integrate the actual binary-mask rate bound over an executed segment.
The complement of the actual section maximum supplies the pointwise mass
bound; candidate/physical/auxiliary/remaining caps are unchanged. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaMixedGenerator

def binaryLineInputRate {n : ℕ} (mask : Grid n → ℝ) (L : LineIndex n) (p : Grid n) : ℝ :=
  (∑q∈L.val.erase p,mask q)/n

theorem binaryLineInputRate_nonneg {n : ℕ} (mask : Grid n → ℝ)
    (hm : ∀q,0≤mask q) (L : LineIndex n) (p : Grid n) :
    0≤binaryLineInputRate mask L p :=
  div_nonneg (Finset.sum_nonneg (fun q _=>hm q)) (Nat.cast_nonneg n)

theorem selectedLineCredit_binary_integral_bound {n : ℕ} (cfg : FlowConfig n)
    (hn : 0<n) (hB : 0≤cfg.B) (hmask : ∀q,cfg.mask q=0 ∨ cfg.mask q=1)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val) (δ : ℝ)
    (x : EtaFlowInput cfg) (he : x.1.val.Valid cfg.B)
    (hη : ∀q r,0≤x.2 q r ∧ x.2 q r≤1) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x.1))
    (hsec : ∀u∈Icc (0:ℝ) t,
      actualLineSectionMass L p (binaryMaskSupport cfg.mask) (selectedAugmentedCurve cfg x u) ≤
        (((L.val∩binaryMaskSupport cfg.mask).erase p).card:ℝ)+δ*(n:ℝ)) :
    (∫u in (0:ℝ)..t,selectedLineCreditRate cfg x.1 L u) ≤
      t*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n) := by
  have hb (u : ℝ) (hu : u∈Icc (0:ℝ) t) : selectedLineCreditRate cfg x.1 L u ≤
      binaryLineInputRate cfg.mask L p+δ+cfg.B/n := by
    exact physicalLineCreditRate_binary_budget hn cfg.directions cfg.mask hmask L p hpL
      (selectedAugmentedCurve cfg x u) cfg.B δ hB
      (selectedAugmentedCurve_valid cfg x he hη u ⟨hu.1,hu.2.trans ht.2⟩) (hsec u hu)
  calc
    _ ≤ ∫u in (0:ℝ)..t,(binaryLineInputRate cfg.mask L p+δ+cfg.B/n) :=
      intervalIntegral.integral_mono_on ht.1
        ((selectedLineCreditRate_continuous cfg x.1 L).intervalIntegrable 0 t) intervalIntegrable_const hb
    _ = _ := by simp only [intervalIntegral.integral_const,sub_zero,smul_eq_mul]

theorem augTimedLineLoss_binary_budget {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (hB : 0≤cfg.B) (hmask : ∀q,cfg.mask q=0 ∨ cfg.mask q=1)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val) (δ : ℝ)
    (s : AugTimedState cfg) (z : CandidateData n)
    (hsec : ∀u∈Icc (0:ℝ) (augAdvance cfg ε M (augTimedInput cfg s,z.1.1)),
      actualLineSectionMass L p (binaryMaskSupport cfg.mask)
        (selectedAugmentedCurve cfg (augTimedInput cfg s).1 u) ≤
        (((L.val∩binaryMaskSupport cfg.mask).erase p).card:ℝ)+δ*(n:ℝ)) :
    augTimedLineLoss cfg ε M L (s,z) ≤
      birthElapsed cfg ε M (s,z)*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n) := by
  by_cases hd : AugTimedDone cfg s
  · have hd' : s.val.2≤0 ∨ s.val.1.physical.process.stopped=true := (birthDone_iff cfg s).mpr hd
    simp only [augTimedLineLoss,birthElapsed,birthDone,hd',if_true,zero_mul,le_refl]
  · have hd' : ¬(s.val.2≤0 ∨ s.val.1.physical.process.stopped=true) := (birthDone_iff cfg s).not.mpr hd
    simp only [augTimedLineLoss,birthElapsed,birthDone,hd',if_false]
    have ht := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    exact selectedLineCredit_binary_integral_bound cfg hn hB hmask L p hpL δ
      (augTimedInput cfg s).1 s.property.1.1 s.property.1.2 _
        ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M _ s.property.1.1).2⟩ hsec

theorem observed_step_no_section_exceedance_credit_budget {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (hB : 0≤cfg.B) (hmask : ∀q,cfg.mask q=0 ∨ cfg.mask q=1)
    (L : LineIndex n) (p : Grid n) (hpL : p∈L.val) (δ : ℝ)
    (x : TimedObservation cfg × CandidateData n)
    (hopen : ¬phaseRootClosed p (observedTimedProjection cfg x.1))
    (hgood : ¬lineSectionAllTimeExceedance cfg ε M L p (binaryMaskSupport cfg.mask)
      ((((L.val∩binaryMaskSupport cfg.mask).erase p).card:ℝ)+δ*(n:ℝ)) x) :
    augTimedLineLoss cfg ε M L (x.1.1,x.2) ≤
      birthElapsed cfg ε M (x.1.1,x.2)*(binaryLineInputRate cfg.mask L p+δ+cfg.B/n) := by
  apply augTimedLineLoss_binary_budget cfg ε M hn hB hmask L p hpL δ x.1.1 x.2
  intro u hu
  apply le_of_not_gt
  intro hm
  exact hgood ((lineSectionAllTimeExceedance_iff cfg ε M L p (binaryMaskSupport cfg.mask) _ x).mpr
    ⟨hopen,u,hu.1,hu.2,hm⟩)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.selectedLineCredit_binary_integral_bound
#print axioms NoThreeLine.BirthWitness.observed_step_no_section_exceedance_credit_budget
