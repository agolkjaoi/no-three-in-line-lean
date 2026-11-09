import NoThreeLine.ProtectedIncomingCutExponential
import NoThreeLine.ProtectedWholeEnergyHistory

/-! The actual first-cut means hold for any cut selected from the incoming
state. Joint measurability is supplied separately by IncomingCutExponential. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedIncomingCreditCut_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (cut : ProtectedTimedState cfg→ℝ) (s : ProtectedTimedState cfg)
    (hN : occupancy s.1.val.1.physical.process L≤1) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (θ : ℝ) (hθ : 0≤θ)
    (hd : ¬birthDone cfg s.1) (hu : 0≤cut s) (hug : cut s≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (∫ω,protectedIncomingCutExponential cfg ε M L (fun x=>protectedCreditTotal L E x.1 x.2)
      (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ cut
      (s,WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤
      Real.exp (θ*protectedTimedCreditTotal cfg L E s) := by
  change (∫ω,protectedIncomingCutExponential cfg ε M L (fun x=>protectedScalarTotal L E id x.1 x.2)
      (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ cut
      (s,WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤_
  simp_rw [protectedIncomingCutExponential_scalar_eq cfg ε M L E id
    (protectedCreditSourceField cfg L E) (protectedCreditEnergyField cfg L E) θ cut s hu]
  exact firstLineForbiddenLaw_protectedCreditExp_cut_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm
    s hN hk hsv θ hθ (cut s) hd hu hug

theorem protectedIncomingEntropyCut_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (cut : ProtectedTimedState cfg→ℝ) (s : ProtectedTimedState cfg)
    (hN : occupancy s.1.val.1.physical.process L≤1) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (θ : ℝ) (hθ : 0≤θ)
    (hd : ¬birthDone cfg s.1) (hu : 0≤cut s) (hug : cut s≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (∫ω,protectedIncomingCutExponential cfg ε M L (fun x=>protectedEntropyTotal L E cfg.B x.1 x.2)
      (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ cut
      (s,WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤
      Real.exp (θ*protectedTimedEntropyTotal cfg L E s) := by
  change (∫ω,protectedIncomingCutExponential cfg ε M L (fun x=>protectedScalarTotal L E (protectedEntropy cfg.B) x.1 x.2)
      (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ cut
      (s,WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤_
  simp_rw [protectedIncomingCutExponential_scalar_eq cfg ε M L E (protectedEntropy cfg.B)
    (protectedEntropySourceField cfg L E) (protectedEntropyEnergyField cfg L E) θ cut s hu]
  exact firstLineForbiddenLaw_protectedEntropyExp_cut_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm
    s hN hk hsv θ hθ (cut s) hd hu hug

end NoThreeLine
#print axioms NoThreeLine.protectedIncomingCreditCut_mean
#print axioms NoThreeLine.protectedIncomingEntropyCut_mean
