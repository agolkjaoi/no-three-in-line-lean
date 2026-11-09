import NoThreeLine.ProtectedCutPairExponential
import NoThreeLine.ProtectedIncomingCutMean
import NoThreeLine.ProtectedLedgerTerminal

/-! The reconstructed two-state cut has the actual first-forbidden mean,
including already completed incoming states. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedCutPairExponential_done {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (G F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ)
    (cut : ProtectedTimedState cfg→ℝ) (hn : 0<n) (s : ProtectedTimedState cfg)
    (hd : birthDone cfg s.1) (hu : 0≤cut s) (ω : BoardClockPath n) :
    protectedCutPairExponential cfg G F V θ cut (s,(protectedRestartStep cfg ε M L hn (s,ω)).1)=
      protectedPairExponential cfg (fun v=>G (v.1.val.1.physical,v.2)) F V θ
        (s,(protectedRestartStep cfg ε M L hn (s,ω)).1) := by
  have hs := protectedRestartStep_done cfg ε M L hn s ((birthDone_iff cfg s.1).mp hd) ω
  unfold protectedCutPairExponential
  rw [hs]
  simp only [sub_self,if_pos hu]

theorem protectedCutPairExponential_scalar_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (A : ℝ→ℝ)
    (F V : ExtendedState n×(Grid n→ℝ)→ℝ) (θ : ℝ) (cut : ProtectedTimedState cfg→ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) (hd : ¬birthDone cfg s.1)
    (hu : 0≤cut s) (hug : cut s≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (fun ω=>protectedCutPairExponential cfg (fun x=>protectedScalarTotal L E A x.1 x.2) F V θ cut
      (s,(protectedRestartStep cfg ε M L hn (s,ω)).1)) =ᵐ[firstLineForbiddenLaw cfg ε M L hn s.1]
    (fun ω=>protectedIncomingCutExponential cfg ε M L (fun x=>protectedScalarTotal L E A x.1 x.2)
      F V θ cut (s,WinnerMarkLaw.firstMarkedRace hn ω)) := by
  filter_upwards [(firstLineForbiddenLaw_absolutelyContinuous cfg ε M L hn s.1).ae_le
    (BoardFirstCandidate.firstTime_ae_positive hn (cfg.B/n)
      (div_pos hB (show (0:ℝ)<n by exact_mod_cast hn)))] with ω hpos
  exact protectedCutPairExponential_scalar_actual cfg ε M L E A F V θ cut s hd hu hug
    _ hpos _ _

theorem protectedCutPairCreditExponential_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (cut : ProtectedTimedState cfg→ℝ) (s : ProtectedTimedState cfg)
    (hN : occupancy s.1.val.1.physical.process L≤1) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (θ : ℝ) (hθ : 0≤θ)
    (hu : 0≤cut s) (hug : cut s≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (∫ω,protectedCutPairExponential cfg (fun x=>protectedCreditTotal L E x.1 x.2)
      (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ cut
      (s,(protectedRestartStep cfg ε M L hn (s,ω)).1) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤
      Real.exp (θ*protectedTimedCreditTotal cfg L E s) := by
  by_cases hd : birthDone cfg s.1
  · simp_rw [protectedCutPairExponential_done cfg ε M L _ _ _ θ cut hn s hd hu]
    exact protectedPairCreditExponential_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv θ hθ
  · have he := protectedCutPairExponential_scalar_ae cfg ε M L E id
      (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ cut hn hB s hd hu hug
    have hi := integral_congr_ae he
    change (∫ω,protectedCutPairExponential cfg (fun x=>protectedScalarTotal L E id x.1 x.2)
      (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ cut
      (s,(protectedRestartStep cfg ε M L hn (s,ω)).1) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤_
    rw [hi]
    exact protectedIncomingCreditCut_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm cut s hN hk hsv θ hθ hd hu hug

theorem protectedCutPairEntropyExponential_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (cut : ProtectedTimedState cfg→ℝ) (s : ProtectedTimedState cfg)
    (hN : occupancy s.1.val.1.physical.process L≤1) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (θ : ℝ) (hθ : 0≤θ)
    (hu : 0≤cut s) (hug : cut s≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (∫ω,protectedCutPairExponential cfg (fun x=>protectedEntropyTotal L E cfg.B x.1 x.2)
      (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ cut
      (s,(protectedRestartStep cfg ε M L hn (s,ω)).1) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤
      Real.exp (θ*protectedTimedEntropyTotal cfg L E s) := by
  by_cases hd : birthDone cfg s.1
  · simp_rw [protectedCutPairExponential_done cfg ε M L _ _ _ θ cut hn s hd hu]
    exact protectedPairEntropyExponential_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv θ hθ
  · have he := protectedCutPairExponential_scalar_ae cfg ε M L E (protectedEntropy cfg.B)
      (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ cut hn hB s hd hu hug
    have hi := integral_congr_ae he
    change (∫ω,protectedCutPairExponential cfg (fun x=>protectedScalarTotal L E (protectedEntropy cfg.B) x.1 x.2)
      (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ cut
      (s,(protectedRestartStep cfg ε M L hn (s,ω)).1) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤_
    rw [hi]
    exact protectedIncomingEntropyCut_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm cut s hN hk hsv θ hθ hd hu hug

end NoThreeLine
#print axioms NoThreeLine.protectedCutPairCreditExponential_first_mean
#print axioms NoThreeLine.protectedCutPairEntropyExponential_first_mean
