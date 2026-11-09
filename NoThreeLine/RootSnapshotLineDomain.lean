import NoThreeLine.RawLineGuardBounds
import NoThreeLine.ActiveConnectionFloor
import NoThreeLine.RootFreezeTerminal

/-! The physical state and the simultaneously saved root snapshot retain
both empty-line credit and the physical active-line guard bounds. In
particular, a raw snapshot is handled before positive retirement. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine
open AuxiliaryODE

def LineConnectionDomain {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (K ρ : ℝ)
    (e : ExtendedState n) : Prop := EmptyLineCredit e ∧ ActiveLineGuardBounds Γ K ρ e

namespace BirthWitness

def RootObserverLineDomain {n : ℕ} (cfg : FlowConfig n) (K ρ : ℝ)
    (s : RootObservation cfg) : Prop :=
  LineConnectionDomain cfg.directions K ρ s.1.1.val.1.physical ∧
    LineConnectionDomain cfg.directions K ρ s.2.2.1.physical

theorem rawStepSaved_lineDomain {n : ℕ} (cfg : FlowConfig n) (ε M start K ρ : ℝ)
    (hK : cfg.K≤K) (hρ : ρ≤cfg.rho) (hρ1 : ρ≤1) (s : TimedObservation cfg)
    (hs : LineConnectionDomain cfg.directions K ρ s.1.val.1.physical) (z : CandidateData n) :
    LineConnectionDomain cfg.directions K ρ (rawStepSaved cfg ε M start (s,z)).1.physical := by
  unfold rawStepSaved
  split_ifs
  · exact hs
  · exact ⟨emptyLineCredit_augRawOutcome cfg ε M (augTimedInput cfg s.1) s.1.property.1.1 hs.1 z,
      augRawOutcome_activeLineGuardBounds cfg ε M K ρ (augTimedInput cfg s.1)
        s.1.property.1.1 hK hρ hρ1 hs.2 hs.1 z⟩

theorem observedStep_lineDomain {n : ℕ} (cfg : FlowConfig n) (ε M start K ρ : ℝ)
    (hK : cfg.K≤K) (hρ : ρ≤cfg.rho) (s : TimedObservation cfg)
    (hs : LineConnectionDomain cfg.directions K ρ s.1.val.1.physical) (z : CandidateData n) :
    LineConnectionDomain cfg.directions K ρ (observedStep cfg ε M start (s,z)).1.val.1.physical :=
  ⟨emptyLineCredit_augTimedStep cfg ε M s.1 z hs.1,
    augTimedStep_activeLineGuardBounds cfg ε M K ρ hK hρ s.1 hs.2 z⟩

theorem rootObserverInitial_lineDomain {n : ℕ} (cfg : FlowConfig n) (K ρ : ℝ)
    (p : Grid n) (s : TimedObservation cfg)
    (hs : LineConnectionDomain cfg.directions K ρ s.1.val.1.physical) :
    RootObserverLineDomain cfg K ρ (rootObserverInitial cfg p s) := ⟨hs,hs⟩

theorem rootObserverStep_lineDomain {n : ℕ} (cfg : FlowConfig n) (ε M start K ρ : ℝ)
    (hK : cfg.K≤K) (hρ : ρ≤cfg.rho) (hρ1 : ρ≤1)
    (p : Grid n) (s : RootObservation cfg) (hs : RootObserverLineDomain cfg K ρ s)
    (z : CandidateData n) : RootObserverLineDomain cfg K ρ (rootObserverStep cfg ε M start p (s,z)) := by
  have hc := observedStep_lineDomain cfg ε M start K ρ hK hρ s.1 hs.1 z
  constructor
  · rw [rootObserverStep_projection]
    exact hc
  · by_cases hf : s.2.1=true
    · simpa only [rootObserverStep,if_pos hf] using hs.2
    · by_cases hclose : rootClosed cfg p (observedStep cfg ε M start (s.1,z))
      · simpa only [rootObserverStep,if_neg hf,if_pos hclose] using
          rawStepSaved_lineDomain cfg ε M start K ρ hK hρ hρ1 s.1 hs.1 z
      · simpa only [rootObserverStep,if_neg hf,if_neg hclose,savedObservation] using hc

theorem rootObserverRecycledPair_lineDomain {n : ℕ} (cfg : FlowConfig n) (ε M start K ρ : ℝ)
    (hK : cfg.K≤K) (hρ : ρ≤cfg.rho) (hρ1 : ρ≤1)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverLineDomain cfg K ρ s)
    (k : ℕ) (ω : BoardClockPath n) :
    RootObserverLineDomain cfg K ρ (rootObserverRecycledPair cfg ε M start p hn s k ω).1 := by
  induction k with
  | zero => exact hs
  | succ k ih => exact rootObserverStep_lineDomain cfg ε M start K ρ hK hρ hρ1 p _ ih _

theorem rootObserverTerminal_lineDomain {n : ℕ} (cfg : FlowConfig n) (ε M start K ρ : ℝ)
    (hK : cfg.K≤K) (hρ : ρ≤cfg.rho) (hρ1 : ρ≤1)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverLineDomain cfg K ρ s)
    (ω : BoardClockPath n) :
    RootObserverLineDomain cfg K ρ (rootObserverTerminalPair cfg ε M start p hn (s,ω)).1 :=
  rootObserverRecycledPair_lineDomain cfg ε M start K ρ hK hρ hρ1 p hn s hs _ ω

theorem rootObserverTerminal_connection_lower {n : ℕ} (cfg : FlowConfig n) (ε M start K ρ δ : ℝ)
    (hK : cfg.K≤K) (hρ : ρ≤cfg.rho) (hρ1 : ρ≤1) (hK2 : K<2)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s)
    (hg : RootObserverLineDomain cfg K ρ s) (ω : BoardClockPath n) (C : Finset (Grid n))
    (hC : C⊆(rootObserverTerminal cfg ε M start p hn (s,ω)).2.2.1.physical.process.activeEvents)
    (hδ0 : 0≤δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2) :
    δ^(C.card^3)≤MixedConnection.connectionProduct cfg.directions C
      (rootObserverTerminal cfg ε M start p hn (s,ω)).2.2.1.physical := by
  have hd := (rootObserverTerminal_lineDomain cfg ε M start K ρ hK hρ hρ1 p hn s hg ω).2
  exact MixedConnection.active_connectionProduct_lower cfg.directions C _ cfg.B K ρ δ
    (rootObserverTerminal_invariant cfg ε M start p hn (s,ω) hs).saved.1.1
    hd.1 hd.2 hC hK2 hρ1 hδ0 hδ1 hδρ hδK

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.BirthWitness.rawStepSaved_lineDomain
#print axioms NoThreeLine.BirthWitness.rootObserverTerminal_connection_lower
