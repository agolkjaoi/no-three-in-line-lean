import NoThreeLine.ProtectedCenteredRunningMean

/-! Linear first means for the same actual whole-source centered value.
This is the linear input for the exact one-step energy variance identity. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedTimedCenteredValue {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A S : ℝ→ℝ) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  protectedScalarTotal L E A (augTimedStep cfg ε M (s.1,z)).val.1.physical
    (protectedRemember cfg L s (augTimedStep cfg ε M (s.1,z))).2-
      protectedRunningScalarSource cfg ε M s.1 S z

theorem protectedTimedCenteredSquare_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (A S : ℝ→ℝ) (s : ProtectedTimedState cfg) (z : CandidateData n) :
    protectedTimedCenteredSquare cfg ε M L E A S s z=(protectedTimedCenteredValue cfg ε M L E A S s z)^2 := rfl

theorem protectedRunningScalarSource_sum {n : ℕ} {ι : Type*} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (I : Finset ι) (S : ι→ℝ→ℝ) (hS : ∀i∈I,Continuous (S i)) (z : CandidateData n) :
    protectedRunningScalarSource cfg ε M s (fun t=>∑i∈I,S i t) z=
      ∑i∈I,protectedRunningScalarSource cfg ε M s (S i) z := by
  simp only [protectedRunningScalarSource_eq_elapsed]
  exact intervalIntegral.integral_finset_sum (fun i hi=>(hS i hi).intervalIntegrable _ _)

theorem protectedCreditCenteredValue_sum {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (s : ProtectedTimedState cfg) (hn : 0<n) (ω : BoardClockPath n) :
    protectedTimedCenteredValue cfg ε M L E id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      s (WinnerMarkLaw.firstMarkedRace hn ω)=
      ∑p∈E,(protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1-
        protectedRunningSource cfg ε M L p (s.1,WinnerMarkLaw.firstMarkedRace hn ω)) := by
  unfold protectedTimedCenteredValue protectedCreditTotalSource
  rw [protectedRunningScalarSource_sum cfg ε M s.1 E _
    (fun p _=>selectedProtectedSource_continuous cfg (augTimedInput cfg s.1).1.1 L p)]
  rw [Finset.sum_sub_distrib]
  rfl

theorem protectedEntropyCenteredValue_sum {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (s : ProtectedTimedState cfg) (hn : 0<n) (hB : 0<cfg.B) (ω : BoardClockPath n) :
    protectedTimedCenteredValue cfg ε M L E (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      s (WinnerMarkLaw.firstMarkedRace hn ω)=
      ∑p∈E,(protectedEntropy cfg.B (protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1)-
        protectedRunningEntropySource cfg ε M L p s (WinnerMarkLaw.firstMarkedRace hn ω)) := by
  unfold protectedTimedCenteredValue protectedEntropyTotalSource
  rw [protectedRunningScalarSource_sum cfg ε M s.1 E
    (fun p t=>protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L p cfg.B)
    (fun p _=>(protectedEntropySource_withCoordinates_continuous s.1.val.1.physical s.2 cfg.directions cfg.mask L p cfg.B hB).comp
      (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1))]
  rw [Finset.sum_sub_distrib]
  rfl

theorem protectedCreditCenteredValue_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Integrable (fun ω=>protectedTimedCenteredValue cfg ε M L E id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      s (WinnerMarkLaw.firstMarkedRace hn ω)) (firstLineForbiddenLaw cfg ε M L hn s.1) ∧
    (∫ω,protectedTimedCenteredValue cfg ε M L E id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      s (WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      protectedCreditTotal L E s.1.val.1.physical s.2 := by
  have hi (p : Grid n) (hp : p∈E) : Integrable
      (fun ω=>protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1-
        protectedRunningSource cfg ε M L p (s.1,WinnerMarkLaw.firstMarkedRace hn ω))
      (firstLineForbiddenLaw cfg ε M L hn s.1) :=
    (protectedCredit_firstForbidden_integrable cfg ε M K hKcfg hK L hsp p hn hB hm s hN hk (hsv p hp)).sub
      (protectedRunningSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp p hn hB hm s.1 hN hk)
  simp_rw [protectedCreditCenteredValue_sum cfg ε M L E s hn]
  constructor
  · exact integrable_finset_sum E hi
  · rw [integral_finset_sum E hi]
    apply Finset.sum_congr rfl
    intro p hp
    exact protected_first_compensation cfg ε M K hKcfg hK L hsp p (hE hp) hn hB hm s hN hk (hsv p hp)

theorem protectedEntropyCenteredValue_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Integrable (fun ω=>protectedTimedCenteredValue cfg ε M L E (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      s (WinnerMarkLaw.firstMarkedRace hn ω)) (firstLineForbiddenLaw cfg ε M L hn s.1) ∧
    (∫ω,protectedTimedCenteredValue cfg ε M L E (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      s (WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      protectedEntropyTotal L E cfg.B s.1.val.1.physical s.2 := by
  have hi (p : Grid n) (hp : p∈E) : Integrable
      (fun ω=>protectedEntropy cfg.B (protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1)-
        protectedRunningEntropySource cfg ε M L p s (WinnerMarkLaw.firstMarkedRace hn ω))
      (firstLineForbiddenLaw cfg ε M L hn s.1) :=
    (protectedEntropy_firstForbidden_integrable cfg ε M K hKcfg hK L hsp p hn hB hm s hN hk (hsv p hp)).sub
      (protectedRunningEntropySource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp p hn hB hm s hN hk)
  simp_rw [protectedEntropyCenteredValue_sum cfg ε M L E s hn hB]
  constructor
  · exact integrable_finset_sum E hi
  · rw [integral_finset_sum E hi]
    apply Finset.sum_congr rfl
    intro p hp
    exact protected_entropy_first_compensation cfg ε M K hKcfg hK L hsp p (hE hp) hn hB hm s hN hk (hsv p hp)

end NoThreeLine
#print axioms NoThreeLine.protectedCreditCenteredValue_first_mean
#print axioms NoThreeLine.protectedEntropyCenteredValue_first_mean
