import NoThreeLine.ObservedCutSurvival
import NoThreeLine.WitnessRunningSource

/-! A strict cut crossing is read from two successive actual remaining
times. Its credit tower is valid for every current state, including done
states and cuts outside the current update interval. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def crossesCut {n : ℕ} (cfg : FlowConfig n) (δ : ℝ)
    (s v : TimedObservation cfg) : Prop := v.1.val.2<δ ∧ δ<s.1.val.2

instance {n : ℕ} (cfg : FlowConfig n) (δ : ℝ) (s v : TimedObservation cfg) :
    Decidable (crossesCut cfg δ s v) := inferInstanceAs (Decidable (v.1.val.2<δ ∧ δ<s.1.val.2))

theorem crossesCut_context {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (s : TimedObservation cfg) (z : CandidateData n)
    (hx : crossesCut cfg δ s (observedStep cfg ε M start (s,z))) :
    0<s.1.val.2-δ ∧ s.1.val.1.physical.process.stopped=false ∧
      s.1.val.2-δ<augGuardTime cfg ε M (augTimedInput cfg s.1) ∧ s.1.val.2-δ<z.1.1 := by
  have hc : 0<s.1.val.2-δ := sub_pos.mpr hx.2
  have ha : s.1.val.2-δ<observedAdvance cfg ε M (s,z) := by
    rw [observedAdvance_eq_remaining_drop cfg ε M start]
    linarith [hx.1]
  have hd : ¬observationDone cfg s := by
    intro hd
    simp only [observedAdvance,if_pos hd] at ha
    linarith
  have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (fun h=>hd (Or.inr h))
  refine ⟨hc,hs,ha.trans_le (observedAdvance_mem cfg ε M (s,z)).2,?_⟩
  simp only [observedAdvance,if_neg hd] at ha
  exact sourceCap_interior_time_lt cfg ε M _ hc.le _ z.1.1 ha

theorem crossesCut_iff_survival {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (s : TimedObservation cfg) (hc : 0<s.1.val.2-δ)
    (hs : s.1.val.1.physical.process.stopped=false)
    (hG : s.1.val.2-δ<augGuardTime cfg ε M (augTimedInput cfg s.1)) (z : CandidateData n) :
    crossesCut cfg δ s (observedStep cfg ε M start (s,z)) ↔ s.1.val.2-δ<z.1.1 := by
  constructor
  · exact fun h=>(crossesCut_context cfg ε M start δ s z h).2.2.2
  · intro hz
    have hd : ¬observationDone cfg s := by
      change ¬(s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true)
      simp only [hs,Bool.false_eq_true,or_false]
      have hG0 := (augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1).1
      have hR := augGuardTime_le_remaining cfg ε M (augTimedInput cfg s.1) s.1.property.2.1
      change _≤s.1.val.2 at hR
      linarith
    have ha : s.1.val.2-δ<observedAdvance cfg ε M (s,z) := by
      simp only [observedAdvance,if_neg hd]
      exact (lt_min hG hz).trans_le (le_max_right _ _)
    rw [observedAdvance_eq_remaining_drop cfg ε M start] at ha
    exact ⟨by linarith,by linarith⟩

theorem interiorCutObservation_measurable {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) :
    Measurable (interiorCutObservation cfg ε M start δ hδ hn) :=
  (observedStep_measurable cfg ε M (start-δ)).comp
    ((sourceRestrictObservation_measurable cfg δ hδ).prodMk measurable_const)

theorem observedCut_crossing_tower {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : TimedObservation cfg)
    (p : Grid n) (F : TimedObservation cfg→ℝ) :
    (∫ω,if crossesCut cfg δ s (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)) then
      augTimedCredit cfg p (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)).1*
        F (interiorCutObservation cfg ε M start δ hδ hn s) else 0
      ∂boardClockMeasure n (cfg.B/n))=
    ∫ω,if crossesCut cfg δ s (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)) then
      augTimedCredit cfg p (interiorCutObservation cfg ε M start δ hδ hn s).1*
        F (interiorCutObservation cfg ε M start δ hδ hn s) else 0
      ∂boardClockMeasure n (cfg.B/n) := by
  by_cases hc : 0<s.1.val.2-δ
  · by_cases hs : s.1.val.1.physical.process.stopped=false
    · by_cases hG : s.1.val.2-δ<augGuardTime cfg ε M (augTimedInput cfg s.1)
      · have he (ω : BoardClockPath n) :
            crossesCut cfg δ s (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)) ↔
              s.1.val.2-δ<BoardFirstCandidate.firstTime hn ω :=
          crossesCut_iff_survival cfg ε M start δ s hc hs hG _
        simp_rw [he]
        let E := {ω | s.1.val.2-δ<BoardFirstCandidate.firstTime hn ω}
        have hE : MeasurableSet E := measurableSet_lt measurable_const (BoardFirstCandidate.firstTime_measurable hn)
        have hz (ω : BoardClockPath n) (hω : ω∈E) :
            observedStep cfg ε M (start-δ) (sourceRestrictObservation cfg δ hδ s,WinnerMarkLaw.firstMarkedRace hn ω)=
              interiorCutObservation cfg ε M start δ hδ hn s :=
          sourceRestrict_observedStep_eq_interiorCut cfg ε M start δ hδ hn s hc hs hG _ hω
        change (∫ω,E.indicator (fun ω=>augTimedCredit cfg p
          (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)).1*
          F (interiorCutObservation cfg ε M start δ hδ hn s)) ω ∂boardClockMeasure n (cfg.B/n))=
          ∫ω,E.indicator (fun _=>augTimedCredit cfg p (interiorCutObservation cfg ε M start δ hδ hn s).1*
            F (interiorCutObservation cfg ε M start δ hδ hn s)) ω ∂boardClockMeasure n (cfg.B/n)
        rw [integral_indicator hE,integral_indicator hE]
        calc
          _ = ∫ω in E,augTimedCredit cfg p (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)).1*
              F (observedStep cfg ε M (start-δ) (sourceRestrictObservation cfg δ hδ s,WinnerMarkLaw.firstMarkedRace hn ω))
              ∂boardClockMeasure n (cfg.B/n) := setIntegral_congr_fun hE (fun ω hω=>by rw [hz ω hω])
          _ = _ := (observedCut_survival_tower cfg ε M start δ hδ hn hB hm s hc hs hG p F).trans
            (setIntegral_congr_fun hE (fun ω hω=>by rw [hz ω hω]))
      · have hfalse (ω : BoardClockPath n) :
            ¬crossesCut cfg δ s (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)) :=
          fun h=>hG (crossesCut_context cfg ε M start δ s _ h).2.2.1
        simp only [if_neg (hfalse _)]
    · have hfalse (ω : BoardClockPath n) :
          ¬crossesCut cfg δ s (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)) :=
        fun h=>hs (crossesCut_context cfg ε M start δ s _ h).2.1
      simp only [if_neg (hfalse _)]
  · have hfalse (ω : BoardClockPath n) :
        ¬crossesCut cfg δ s (observedStep cfg ε M start (s,WinnerMarkLaw.firstMarkedRace hn ω)) :=
      fun h=>hc (crossesCut_context cfg ε M start δ s _ h).1
    simp only [if_neg (hfalse _)]

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedCut_crossing_tower
