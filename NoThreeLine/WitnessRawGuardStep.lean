import NoThreeLine.WitnessRaceStep

/-! The first-event observable is exactly the existing timestamp observer
on the actual raw augmented outcome, at the actual physical/auxiliary/cap
minimum. Resolution and subsequent history iteration remain separate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaMixedGenerator

def witnessGuardHorizon {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) : ℝ≥0 :=
  ⟨augGuardTime cfg ε M x,(augGuardTime_mem cfg ε M x he).1⟩

theorem firstWitnessSnapshot_eq_raw {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (e : Retention n)
    (b : BirthRecords n) (z : CandidateData n) (hz : 0<z.1.1) :
    firstWitnessSnapshot cfg x.1 (recordedValue e b) e start (witnessGuardHorizon cfg ε M x he) z=
      rawObservedWitness cfg ε M (start+augAdvance cfg ε M (x,z.1.1)) e (x,z) b := by
  have hclip : timeClip (witnessGuardHorizon cfg ε M x he) z.1.1=augAdvance cfg ε M (x,z.1.1) := rfl
  have hpre : clippedWitnessCurve cfg x.1 (recordedValue e b) (witnessGuardHorizon cfg ε M x he) z.1.1=
      WitnessState.mk (augPreState cfg ε M (x,z)) (recordedValue e b) := rfl
  have hT : (witnessGuardHorizon cfg ε M x he:ℝ)=augGuardTime cfg ε M x := rfl
  by_cases ht : z.1.1≤augGuardTime cfg ε M x
  · have hadv : augAdvance cfg ε M (x,z.1.1)=z.1.1 := by
      change max 0 (min (augGuardTime cfg ε M x) z.1.1)=_
      rw [min_eq_right ht,max_eq_right hz.le]
    unfold firstWitnessSnapshot
    rw [hT,if_pos ht,hpre]
    unfold thinnedWitness
    by_cases hm : z.2≤(augPreState cfg ε M (x,z)).physical.process.acceptance cfg.mask cfg.B z.1.2
    · rw [if_pos hm,hadv]
      exact (rawObservedWitness_accepted cfg ε M (start+z.1.1) e (x,z) b ⟨hz,ht⟩ hm).symm
    · rw [if_neg hm]
      have hb : ¬segmentBirth cfg ε M (x,z) := fun h=>hm h.2.1
      simp only [rawObservedWitness,rawBirthRecords,if_neg hb,
        augRawOutcome_rejected_snapshot cfg ε M x z hm]
  · have hadv : augAdvance cfg ε M (x,z.1.1)=augGuardTime cfg ε M x := by
      change max 0 (min (augGuardTime cfg ε M x) z.1.1)=_
      rw [min_eq_left (le_of_not_ge ht),max_eq_right (augGuardTime_mem cfg ε M x he).1]
    have hw : ¬(0<z.1.1 ∧ z.1.1≤augGuardTime cfg ε M x) := fun h=>ht h.2
    have hb : ¬segmentBirth cfg ε M (x,z) := fun h=>hw h.1
    unfold firstWitnessSnapshot
    rw [hT,if_neg ht]
    simp only [rawObservedWitness,rawBirthRecords,if_neg hb,augRawOutcome,if_neg hw]
    rw [augPreState_selectedAugmentedCurve,hadv]
    rfl

theorem actual_raw_guard_source_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : AugmentedCappedInput cfg) (e : Retention n) (b : BirthRecords n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (ha : WitnessState.Valid ⟨⟨x.1.1.val,x.1.2⟩,recordedValue e b⟩ cfg.B)
    (hstop : x.1.1.val.process.stopped=false) (hC : C⊆x.1.1.val.process.activeEvents)
    (hCL : C⊆L) (hCD : Disjoint C D) (hE : EmptyLineCredit x.1.1.val) (hK : cfg.K<2) :
    (∫ω,mixed cfg.directions C D L
      (rawObservedWitness cfg ε M
        (start+augAdvance cfg ε M (x,(WinnerMarkLaw.firstMarkedRace hn ω).1.1)) e
        (x,WinnerMarkLaw.firstMarkedRace hn ω) b) ∂boardClockMeasure n (cfg.B/n))≤
      mixed cfg.directions C D L (selectedWitnessCurve cfg x.1 (recordedValue e b) 0)+
        ∫t in (0:ℝ)..augGuardTime cfg ε M x,Real.exp (-(((n:ℝ)*cfg.B)*t))*
          selectedSourceSum cfg x.1 (recordedValue e b) C D L e start t := by
  have hi := actual_first_witness_source_bound cfg x.1 (recordedValue e b) C D L e start
    (witnessGuardHorizon cfg ε M x ha.1.1) hn hB hm ha
    (augGuardTime_mem cfg ε M x ha.1.1).2 hstop hC hCL hCD hE hK
  convert hi using 1
  · apply integral_congr_ae
    filter_upwards [BoardFirstCandidate.firstTime_ae_positive hn (cfg.B/n)
      (div_pos hB (by exact_mod_cast hn))] with ω hω
    rw [firstWitnessSnapshot_eq_raw cfg ε M start x ha.1.1 e b (WinnerMarkLaw.firstMarkedRace hn ω) hω]
  · rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.firstWitnessSnapshot_eq_raw
#print axioms NoThreeLine.BirthWitness.actual_raw_guard_source_bound
