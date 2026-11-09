import NoThreeLine.ProtectedLedgerTerminal
import NoThreeLine.PhaseLineForbiddenLaw

/-! Actual protected saved and moving credits are bounded throughout
the forbidden-line stage, including its real terminal selector. The
stage condition is supplied by the constructed law's no-line-birth result. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedTimedCredit {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) (p : Grid n)
    (s : ProtectedTimedState cfg) : ℝ := protectedLineCredit L s.1.val.1.physical s.2 p

theorem protectedTimedCredit_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n) (p : Grid n) :
    Measurable (protectedTimedCredit cfg L p) :=
  (protectedLineCredit_measurable L p).comp
    (((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)).prodMk measurable_snd)

theorem phaseLineForbiddenLaw_all_occupancy {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (s : AugTimedState cfg)
    (ho : occupancy s.val.1.physical.process L=N) (hk : s.val.1.physical.clocks L≤K) :
    ∀ᵐω∂phaseLineForbiddenLaw cfg ε M K L N hn s,∀k,
      occupancy (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process L=N := by
  filter_upwards [phaseLineForbiddenLaw_no_line_birth cfg ε M K hKcfg L hsp N hN hn hB s ho hk] with ω hω
  intro k
  induction k with
  | zero => exact ho
  | succ k ih =>
    have hh := augTimedStep_occupancy cfg ε M L (augRecycledPair cfg ε M hn s k ω).1
      (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2)
    change occupancy (augRecycledPair cfg ε M hn s (k+1) ω).1.val.1.physical.process L=_ at hh
    rw [if_neg (hω k),ih,Nat.add_zero] at hh
    exact hh

theorem protectedRecycledPair_saved_bounds_on_stage {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p,0≤s.2 p ∧ s.2 p≤2*cfg.B) (ω : BoardClockPath n)
    (hstage : ∀k,occupancy (augRecycledPair cfg ε M hn s.1 k ω).1.val.1.physical.process L=N)
    (k : ℕ) (p : Grid n) :
    0≤(protectedRecycledPair cfg ε M L hn s k ω).1.2 p ∧
      (protectedRecycledPair cfg ε M L hn s k ω).1.2 p≤2*cfg.B := by
  induction k with
  | zero => exact hsv p
  | succ k ih =>
    have he := congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s (k+1) ω)
    have hr := lineStageRegion_recycled cfg ε M K hKcfg L hsp N hN hn s.1 ⟨ho.ge,fun _=>hk⟩ (k+1) ω
    have hocc : occupancy (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1.val.1.physical.process L≤1 := by
      rw [he,hstage (k+1)]
      exact hN
    have hclock : (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1.val.1.physical.clocks L≤K := by
      rw [he]
      exact hr.2 (hstage (k+1))
    change 0≤protectedLineSave L (protectedRecycledPair cfg ε M L hn s k ω).1.1.val.1.physical
        (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1.val.1.physical
        (protectedRecycledPair cfg ε M L hn s k ω).1.2 p ∧ _
    exact protectedLineSave_bounds L _ _ _ p cfg.B K
      (protectedRecycledPair cfg ε M L hn s (k+1) ω).1.1.property.1.1 hocc hclock hK ih

theorem protectedRecycledPair_credit_bounds_on_stage {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p,0≤s.2 p ∧ s.2 p≤2*cfg.B) (ω : BoardClockPath n)
    (hstage : ∀k,occupancy (augRecycledPair cfg ε M hn s.1 k ω).1.val.1.physical.process L=N)
    (k : ℕ) (p : Grid n) :
    0≤protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1 ∧
      protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1≤2*cfg.B := by
  have he := congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s k ω)
  have hr := lineStageRegion_recycled cfg ε M K hKcfg L hsp N hN hn s.1 ⟨ho.ge,fun _=>hk⟩ k ω
  apply protectedLineCredit_bounds L _ _ p cfg.B K
    (protectedRecycledPair cfg ε M L hn s k ω).1.1.property.1.1
  · rw [he,hstage k]
    exact hN
  · rw [he]
    exact hr.2 (hstage k)
  · exact hK
  · exact protectedRecycledPair_saved_bounds_on_stage cfg ε M K hKcfg hK L hsp N hN hn s ho hk hsv ω hstage k p

theorem protectedLedger_stage_bounds_ae {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    ∀ᵐω∂phaseLineForbiddenLaw cfg ε M K L N hn s.1,∀k p,
      (0≤(protectedRecycledPair cfg ε M L hn s k ω).1.2 p ∧
        (protectedRecycledPair cfg ε M L hn s k ω).1.2 p≤2*cfg.B) ∧
      (0≤protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1 ∧
        protectedTimedCredit cfg L p (protectedRecycledPair cfg ε M L hn s k ω).1≤2*cfg.B) := by
  filter_upwards [phaseLineForbiddenLaw_all_occupancy cfg ε M K hKcfg L hsp N hN hn hB s.1 ho hk] with ω hω
  intro k p
  exact ⟨protectedRecycledPair_saved_bounds_on_stage cfg ε M K hKcfg hK L hsp N hN hn s ho hk hsv ω hω k p,
    protectedRecycledPair_credit_bounds_on_stage cfg ε M K hKcfg hK L hsp N hN hn s ho hk hsv ω hω k p⟩

theorem protectedLedger_terminal_bounds_ae {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    ∀ᵐω∂phaseLineForbiddenLaw cfg ε M K L N hn s.1,∀p,
      0≤protectedTimedCredit cfg L p (protectedRecycledTerminalPair cfg ε M L hn s ω).1 ∧
        protectedTimedCredit cfg L p (protectedRecycledTerminalPair cfg ε M L hn s ω).1≤2*cfg.B := by
  filter_upwards [protectedLedger_stage_bounds_ae cfg ε M K hKcfg hK L hsp N hN hn hB s ho hk hsv] with ω hω
  intro p
  exact (hω (augRecycledCompletionIndex cfg ε M hn s.1 ω) p).2

end NoThreeLine

#print axioms NoThreeLine.phaseLineForbiddenLaw_all_occupancy
#print axioms NoThreeLine.protectedLedger_stage_bounds_ae
#print axioms NoThreeLine.protectedLedger_terminal_bounds_ae
