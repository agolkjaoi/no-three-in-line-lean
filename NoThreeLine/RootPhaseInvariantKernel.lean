import NoThreeLine.GoodRootTerminalResidual
import NoThreeLine.RootPhaseAbsorption
import NoThreeLine.WitnessPhaseSource

/-! EmptyLineCredit is supplied to the actual root terminal kernel from
preserved physical invariants. The full saved-root phase state and residual
board satisfy the proved product law, including real deadline retirement. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open PrimitiveLines

abbrev GoodPhaseRootObservation (n : ℕ) (B : ℝ) (p : Grid n) :=
  {s : PhaseRootObservation n B // PhaseRootInvariant p s ∧ EmptyLineCredit s.1.1.val.physical}

def goodPhaseRootActual {n : ℕ} {B : ℝ} (p : Grid n)
    (s : GoodPhaseRootObservation n B p) : GoodPhaseObservation n B :=
  ⟨s.val.1,s.property.1.records,s.property.2⟩

theorem goodPhaseRootActual_measurable {n : ℕ} {B : ℝ} (p : Grid n) :
    Measurable (goodPhaseRootActual (B:=B) p) := measurable_subtype_coe.fst.subtype_mk

def goodPhaseRootStart {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : GoodPhaseRootObservation n cfg.B p) : GoodRootObservation cfg p :=
  ⟨phaseRootStart cfg ε M p s.val,phaseRootStart_invariant cfg ε M p s.val s.property.1,
    by rw [phaseRootStart_projection]; exact s.property.2⟩

theorem goodPhaseRootStart_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) :
    Measurable (goodPhaseRootStart cfg ε M p) :=
  ((phaseRootStart_measurable cfg ε M p).comp measurable_subtype_coe).subtype_mk

theorem goodPhaseRootStart_actual {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : GoodPhaseRootObservation n cfg.B p) :
    goodRootActual cfg p (goodPhaseRootStart cfg ε M p s)=
      goodPhaseStart cfg ε M (goodPhaseRootActual p s) := by
  apply Subtype.ext
  exact phaseRootStart_projection cfg ε M p s.val

def goodPhaseRootBoundary {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : GoodRootObservation cfg p) : GoodPhaseRootObservation n cfg.B p :=
  ⟨phaseRootBoundary cfg p deadline t s.val,phaseRootBoundary_invariant cfg p deadline t s.val s.property.1,
    by rw [phaseRootBoundary_projection]
       exact emptyLineCredit_augValidDeadlineRetirement deadline t (augTimedStateProjection cfg s.val.1.1) s.property.2⟩

theorem goodPhaseRootBoundary_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) : Measurable (goodPhaseRootBoundary cfg p deadline t) :=
  ((phaseRootBoundary_measurable cfg p deadline t).comp measurable_subtype_coe).subtype_mk

def goodPhaseRootScheduledPair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ)
    (x : GoodPhaseRootObservation n B p×BoardClockPath n) : GoodPhaseRootObservation n B p×BoardClockPath n :=
  let r := goodRootTerminalPair (cs j).config ε M (phaseEndpoint cs start j) p hn
    (goodPhaseRootStart (cs j).config ε M p x.1,x.2)
  (goodPhaseRootBoundary (cs j).config p deadline (phaseEndpoint cs start (j+1)) r.1,r.2)

theorem goodPhaseRootScheduledPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ) :
    Measurable (goodPhaseRootScheduledPair cs ε M deadline start p hn j) := by
  have hr := (goodRootTerminalPair_measurable (cs j).config ε M (phaseEndpoint cs start j) p hn).comp
    (((goodPhaseRootStart_measurable (cs j).config ε M p).comp measurable_fst).prodMk measurable_snd)
  exact ((goodPhaseRootBoundary_measurable (cs j).config p deadline _).comp hr.fst).prodMk hr.snd

theorem goodPhaseRootScheduledPair_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ)
    (x : GoodPhaseRootObservation n B p×BoardClockPath n) :
    ((goodPhaseRootScheduledPair cs ε M deadline start p hn j x).1.val,
      (goodPhaseRootScheduledPair cs ε M deadline start p hn j x).2)=
      phaseRootScheduledPair cs ε M deadline start p hn j (x.1.val,x.2) := by
  exact congrArg (fun r : RootObservation (cs j).config×BoardClockPath n=>
    (phaseRootBoundary (cs j).config p deadline (phaseEndpoint cs start (j+1)) r.1,r.2))
      (goodRootTerminalPair_projection (cs j).config ε M (phaseEndpoint cs start j) p hn
        (goodPhaseRootStart (cs j).config ε M p x.1,x.2))

theorem goodPhaseRootScheduledPair_residual_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B) (j : ℕ)
    (s : GoodPhaseRootObservation n B p) :
    (boardClockMeasure n (B/n)).map (fun ω=>goodPhaseRootScheduledPair cs ε M deadline start p hn j (s,ω))=
      ((boardClockMeasure n (B/n)).map
        (fun ω=>(goodPhaseRootScheduledPair cs ε M deadline start p hn j (s,ω)).1)).prod (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let a := goodPhaseRootStart (cs j).config ε M p s
  let d := goodPhaseRootBoundary (cs j).config p deadline (phaseEndpoint cs start (j+1))
  have hd : Measurable d := goodPhaseRootBoundary_measurable (cs j).config p deadline _
  have ht : Measurable (fun ω : BoardClockPath n=>goodRootTerminalPair (cs j).config ε M
      (phaseEndpoint cs start j) p hn (a,ω)) :=
    (goodRootTerminalPair_measurable (cs j).config ε M _ p hn).comp (measurable_const.prodMk measurable_id)
  have hp : Measurable (fun r : GoodRootObservation (cs j).config p×BoardClockPath n=>(d r.1,r.2)) :=
    (hd.comp measurable_fst).prodMk measurable_snd
  have h := congrArg (fun μ : Measure (GoodRootObservation (cs j).config p×BoardClockPath n)=>
    μ.map (fun r=>(d r.1,r.2)))
      (goodRootTerminal_residual_product (cs j).config ε M (phaseEndpoint cs start j) p hn hB a)
  rw [Measure.map_map hp ht,
    map_pair_with_fresh_right _ _ d hd,Measure.map_map hd ht.fst] at h
  exact h

def goodPhaseRootMixed {n : ℕ} {B : ℝ} (p : Grid n) (Γ : Finset ZPoint) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) : ℝ :=
  mixed Γ C D L (savedWitness e s.val.2.2)

theorem goodPhaseRootMixed_measurable {n : ℕ} {B : ℝ} (p : Grid n) (Γ : Finset ZPoint) (e : Retention n)
    (C D L : Finset (Grid n)) : Measurable (goodPhaseRootMixed (B:=B) p Γ e C D L) :=
  (mixed_measurable Γ C D L).comp ((savedWitness_measurable e).comp measurable_subtype_coe.snd.snd)

theorem goodPhaseRootMixed_bounds {n : ℕ} {B : ℝ} (p : Grid n) (Γ : Finset ZPoint) (e : Retention n)
    (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n B p) :
    0≤goodPhaseRootMixed p Γ e C D L s ∧ goodPhaseRootMixed p Γ e C D L s≤mixedCap C B := by
  have hv := savedWitness_valid B e s.val.2.2 s.property.1.saved
  exact ⟨mixed_nonneg _ Γ C D L B hv,mixed_le_cap _ Γ C D L B hv⟩

theorem goodPhaseRootStart_mixed {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (e : Retention n) (C D L : Finset (Grid n)) (s : GoodPhaseRootObservation n cfg.B p) :
    goodRootMixed cfg p e C D L (goodPhaseRootStart cfg ε M p s)=goodPhaseRootMixed p cfg.directions e C D L s := by
  change mixed cfg.directions C D L (savedWitness e (phaseRootStart cfg ε M p s.val).2.2)=_
  rw [phaseRootStart_saved cfg ε M p s.val s.property.1]
  rfl

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodPhaseRootStart_actual
#print axioms NoThreeLine.BirthWitness.goodPhaseRootScheduledPair_projection
#print axioms NoThreeLine.BirthWitness.goodPhaseRootScheduledPair_residual_product
