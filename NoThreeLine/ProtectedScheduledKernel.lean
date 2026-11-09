import NoThreeLine.ProtectedSourceTerminalPair
import NoThreeLine.ProtectedPhaseBoundary

/-! Carry the saved credit and actual cumulative source through the
original phase endpoint, keeping both physical and residual projections. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedPhaseStart {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : ProtectedPhaseState n cfg.B) : ProtectedTimedState cfg :=
  (augPhaseStart cfg ε M s.1,s.2.1)

theorem protectedPhaseStart_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (protectedPhaseStart cfg ε M) :=
  ((augPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd.fst

def protectedPhaseEnd {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (deadline : Grid n→ℝ) (t : ℝ) (x : (ProtectedTimedState cfg × ℝ) × ℝ) :
    ProtectedPhaseState n cfg.B :=
  protectedDeadlineBook L deadline t (augTimedStateProjection cfg x.1.1.1,(x.1.1.2,x.2+x.1.2))

theorem protectedPhaseEnd_measurable {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (deadline : Grid n→ℝ) (t : ℝ) : Measurable (protectedPhaseEnd cfg L deadline t) :=
  (protectedDeadlineBook_measurable L deadline t).comp
    (((augTimedStateProjection_measurable cfg).comp measurable_fst.fst.fst).prodMk
      (measurable_fst.fst.snd.prodMk (measurable_snd.add measurable_fst.snd)))

theorem protectedPhaseEnd_credit {n : ℕ} (cfg : FlowConfig n) (L : LineIndex n)
    (p : Grid n) (deadline : Grid n→ℝ) (t : ℝ) (x : (ProtectedTimedState cfg × ℝ) × ℝ) :
    protectedPhaseCredit L p (protectedPhaseEnd cfg L deadline t x)=
      protectedTimedCredit cfg L p x.1.1 := by
  unfold protectedPhaseEnd
  rw [protectedDeadlineBook_credit]
  rfl

def protectedScheduledPair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (j : ℕ) (x : ProtectedPhaseState n B × BoardClockPath n) :
    ProtectedPhaseState n B × BoardClockPath n :=
  let r := protectedSourceTerminalPair (cs j).config ε M L p hn
    (protectedPhaseStart (cs j).config ε M x.1,x.2)
  (protectedPhaseEnd (cs j).config L deadline (phaseEndpoint cs start (j+1)) (r.1,x.1.2.2),r.2)

theorem protectedScheduledPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (j : ℕ) : Measurable (protectedScheduledPair cs ε M deadline start L p hn j) := by
  have hr := (protectedSourceTerminalPair_measurable (cs j).config ε M L p hn).comp
    (((protectedPhaseStart_measurable (cs j).config ε M).comp measurable_fst).prodMk measurable_snd)
  exact ((protectedPhaseEnd_measurable (cs j).config L deadline _).comp
    (hr.fst.prodMk measurable_fst.snd.snd)).prodMk hr.snd

theorem protectedScheduledPair_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (j : ℕ) (x : ProtectedPhaseState n B × BoardClockPath n) :
    ((protectedScheduledPair cs ε M deadline start L p hn j x).1.1,
      (protectedScheduledPair cs ε M deadline start L p hn j x).2)=
      recycledScheduledPair cs ε M deadline start hn j (x.1.1,x.2) := by
  exact congrArg (fun r : AugTimedState (cs j).config × BoardClockPath n=>
    (augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1))
      (augTimedStateProjection (cs j).config r.1),r.2))
    (protectedRecycledTerminalPair_projection (cs j).config ε M L hn
      (protectedPhaseStart (cs j).config ε M x.1) x.2)

theorem protectedScheduledPair_map {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (hB : 0<B) (j : ℕ) (s : ProtectedPhaseState n B) :
    (boardClockMeasure n (B/n)).map (fun ω=>protectedScheduledPair cs ε M deadline start L p hn j (s,ω))=
      ((boardClockMeasure n (B/n)).map (fun ω=>(protectedScheduledPair cs ε M deadline start L p hn j (s,ω)).1)).prod
        (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let cfg := (cs j).config
  let a := protectedPhaseStart cfg ε M s
  let d : ProtectedTimedState cfg × ℝ → ProtectedPhaseState n B := fun r=>
    protectedPhaseEnd cfg L deadline (phaseEndpoint cs start (j+1)) (r,s.2.2)
  have hd : Measurable d := (protectedPhaseEnd_measurable cfg L deadline _).comp
    (measurable_id.prodMk measurable_const)
  have hr : Measurable (fun ω=>protectedSourceTerminalPair cfg ε M L p hn (a,ω)) :=
    (protectedSourceTerminalPair_measurable cfg ε M L p hn).comp (measurable_const.prodMk measurable_id)
  have hp : Measurable (fun r : (ProtectedTimedState cfg × ℝ) × BoardClockPath n=>(d r.1,r.2)) :=
    (hd.comp measurable_fst).prodMk measurable_snd
  have h := congrArg (fun μ : Measure ((ProtectedTimedState cfg × ℝ) × BoardClockPath n)=>
    μ.map (fun r=>(d r.1,r.2))) (protectedSourceTerminalPair_map cfg ε M L p hn hB a)
  rw [Measure.map_map hp hr,map_pair_with_fresh_right _ _ d hd,Measure.map_map hd hr.fst] at h
  exact h

theorem protectedScheduledPair_saved_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hpL : p∈L.val) (hn : 0<n) (j : ℕ) (hsp : specified (cs j).directions L)
    (x : ProtectedPhaseState n B × BoardClockPath n) (hs : 0≤x.1.2.1 p ∧ x.1.2.1 p≤2*B) :
    0≤(protectedScheduledPair cs ε M deadline start L p hn j x).1.2.1 p ∧
      (protectedScheduledPair cs ε M deadline start L p hn j x).1.2.1 p≤2*B :=
  protectedDeadlineBook_saved_bounds L (cs j).directions hsp p hpL deadline _ _
    (protectedRecycledPair_saved_bounds_all (cs j).config ε M L hsp p hpL hn
      (protectedPhaseStart (cs j).config ε M x.1) hs _ x.2)

theorem protectedScheduledPair_source_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hpL : p∈L.val) (hn : 0<n) (j : ℕ) (hsp : specified (cs j).directions L)
    (hB : 0≤B) (x : ProtectedPhaseState n B × BoardClockPath n) :
    x.1.2.2≤(protectedScheduledPair cs ε M deadline start L p hn j x).1.2.2 ∧
      (protectedScheduledPair cs ε M deadline start L p hn j x).1.2.2≤
        x.1.2.2+((cs j).config.horizon:ℝ)*((B/n)*B) := by
  have hb := cumulativeProtectedSource_bounds (cs j).config ε M L hsp p hpL hn hB
    (cs j).mask_le_one (protectedPhaseStart (cs j).config ε M x.1)
    (augRecycledCompletionIndex (cs j).config ε M hn (augPhaseStart (cs j).config ε M x.1.1) x.2) x.2
  exact ⟨le_add_of_nonneg_right hb.1,add_le_add le_rfl hb.2⟩

end NoThreeLine

#print axioms NoThreeLine.protectedScheduledPair_projection
#print axioms NoThreeLine.protectedScheduledPair_map
#print axioms NoThreeLine.protectedScheduledPair_saved_bounds
#print axioms NoThreeLine.protectedScheduledPair_source_bounds
