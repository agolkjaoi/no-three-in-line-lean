import NoThreeLine.CappedCreditSurvival
import NoThreeLine.SourceInteriorCut

/-! Inside a real update interval the cut observation (including records)
is fixed on the survival event. The original post-event and cut credits
give exactly the same weighted integral of any such cut observable. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

def cutProbe {n : ℕ} (cfg : FlowConfig n) (hn : 0<n) : CandidateData n :=
  ((cfg.horizon+1,(⟨0,hn⟩,⟨0,hn⟩)),0)

def interiorCutObservation {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : TimedObservation cfg) : TimedObservation cfg :=
  observedStep cfg ε M (start-δ) (sourceRestrictObservation cfg δ hδ s,cutProbe cfg hn)

theorem interiorCutObservation_eq {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : TimedObservation cfg) (hc : 0<s.1.val.2-δ)
    (hs : s.1.val.1.physical.process.stopped=false)
    (hG : s.1.val.2-δ<augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (interiorCutObservation cfg ε M start δ hδ hn s).1.val=
      (selectedAugmentedCurve cfg (augTimedInput cfg s.1).1 (s.1.val.2-δ),0) ∧
    (interiorCutObservation cfg ε M start δ hδ hn s).2=s.2 := by
  apply sourceRestrict_interior_observation cfg ε M start δ hδ s (cutProbe cfg hn) hc hs
  have htime : s.1.val.2-δ<(cutProbe cfg hn).1.1 := by
    change s.1.val.2-δ<cfg.horizon+1
    linarith [s.1.property.2.2]
  change s.1.val.2-δ<max 0 (min _ _)
  exact (lt_min hG htime).trans_le (le_max_right _ _)

theorem sourceRestrict_observedStep_eq_interiorCut {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (s : TimedObservation cfg)
    (hc : 0<s.1.val.2-δ) (hs : s.1.val.1.physical.process.stopped=false)
    (hG : s.1.val.2-δ<augGuardTime cfg ε M (augTimedInput cfg s.1))
    (z : CandidateData n) (hz : s.1.val.2-δ<z.1.1) :
    observedStep cfg ε M (start-δ) (sourceRestrictObservation cfg δ hδ s,z)=
      interiorCutObservation cfg ε M start δ hδ hn s := by
  have hcut : s.1.val.2-δ<augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1) :=
    (lt_min hG hz).trans_le (le_max_right _ _)
  have h1 := sourceRestrict_interior_observation cfg ε M start δ hδ s z hc hs hcut
  have h2 := interiorCutObservation_eq cfg ε M start δ hδ hn s hc hs hG
  exact Prod.ext (Subtype.ext (h1.1.trans h2.1.symm)) (h1.2.trans h2.2.symm)

theorem observedStep_survival_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : TimedObservation cfg)
    (hd : ¬observationDone cfg s) (p : Grid n) (u : ℝ)
    (hu : u∈Icc (0:ℝ) (augGuardTime cfg ε M (augTimedInput cfg s.1))) :
    (∫ω in {ω | u<BoardFirstCandidate.firstTime hn ω},
      augTimedCredit cfg p (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)).1
      ∂boardClockMeasure n (cfg.B/n))=
      Real.exp (-(n*cfg.B*u))*
        ((selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)).process.accounts p).credit := by
  change ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true) at hd
  simp only [observedStep_base,augTimedCredit,augTimedStep,augTimedStepPair,if_neg hd]
  exact augOutcome_survival_credit cfg ε M (augTimedInput cfg s.1) hn hB hm s.1.property.1.1 p u hu

theorem observedCut_survival_tower {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : TimedObservation cfg)
    (hc : 0<s.1.val.2-δ) (hs : s.1.val.1.physical.process.stopped=false)
    (hG : s.1.val.2-δ<augGuardTime cfg ε M (augTimedInput cfg s.1))
    (p : Grid n) (F : TimedObservation cfg→ℝ) :
    (∫ω in {ω | s.1.val.2-δ<BoardFirstCandidate.firstTime hn ω},
      augTimedCredit cfg p (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)).1*
        F (observedStep cfg ε M (start-δ)
          (sourceRestrictObservation cfg δ hδ s,WinnerMarkLaw.firstMarkedRace hn ω))
      ∂boardClockMeasure n (cfg.B/n))=
    ∫ω in {ω | s.1.val.2-δ<BoardFirstCandidate.firstTime hn ω},
      augTimedCredit cfg p (observedStep cfg ε M (start-δ)
        (sourceRestrictObservation cfg δ hδ s,WinnerMarkLaw.firstMarkedRace hn ω)).1*
        F (observedStep cfg ε M (start-δ)
          (sourceRestrictObservation cfg δ hδ s,WinnerMarkLaw.firstMarkedRace hn ω))
      ∂boardClockMeasure n (cfg.B/n) := by
  let a := interiorCutObservation cfg ε M start δ hδ hn s
  let u := s.1.val.2-δ
  have hE : MeasurableSet {ω | u<BoardFirstCandidate.firstTime hn ω} :=
    measurableSet_lt measurable_const (BoardFirstCandidate.firstTime_measurable hn)
  have hd : ¬observationDone cfg s := by
    change ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true)
    simp only [hs,Bool.false_eq_true,or_false]
    linarith
  have he (ω : BoardClockPath n) (hω : u<BoardFirstCandidate.firstTime hn ω) :
      observedStep cfg ε M (start-δ)
        (sourceRestrictObservation cfg δ hδ s,WinnerMarkLaw.firstMarkedRace hn ω)=a :=
    sourceRestrict_observedStep_eq_interiorCut cfg ε M start δ hδ hn s hc hs hG _ hω
  have hcredit : augTimedCredit cfg p a.1=
      ((selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)).process.accounts p).credit := by
    have ha := (interiorCutObservation_eq cfg ε M start δ hδ hn s hc hs hG).1
    exact congrArg (fun r : AugmentedState n×ℝ=>(r.1.physical.process.accounts p).credit) ha
  calc
    _ = ∫ω in {ω | u<BoardFirstCandidate.firstTime hn ω},
        F a*augTimedCredit cfg p (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)).1
          ∂boardClockMeasure n (cfg.B/n) :=
      setIntegral_congr_fun hE (fun ω hω=>by rw [he ω hω]; ring)
    _ = F a*(Real.exp (-(n*cfg.B*u))*augTimedCredit cfg p a.1) := by
      rw [integral_const_mul,observedStep_survival_credit cfg ε M start hn hB hm s hd p u ⟨hc.le,hG.le⟩,
        ←hcredit]
    _ = ∫_ω in {ω | u<BoardFirstCandidate.firstTime hn ω},augTimedCredit cfg p a.1*F a
          ∂boardClockMeasure n (cfg.B/n) := by
      rw [setIntegral_const,smul_eq_mul,BoardFirstCandidate.candidate_firstTime_survival hn cfg.B u hB hc.le]
      ring
    _ = _ := setIntegral_congr_fun hE (fun ω hω=>by rw [he ω hω])

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedCut_survival_tower
