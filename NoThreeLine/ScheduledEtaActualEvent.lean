import NoThreeLine.EtaContinuousContact
import NoThreeLine.ScheduledPairIntegral

/-! Actual continuous-or-raw eta contact on all executed phases of the
original board. No active-root observation gate is imposed on this event. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.PairWitness
open AuxiliaryODE BirthWitness

def scheduledEtaStep {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (N k : ℕ) (ω : BoardClockPath n) :
    AugTimedState (cs N).config×CandidateData n :=
  let x := augRecycledPair (cs N).config ε M hn
    (augPhaseStart (cs N).config ε M (recycledPhaseState cs ε M deadline start hn e N ω))
    k (recycledPhases cs ε M deadline start hn e N ω).2
  (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem scheduledEtaStep_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (N k : ℕ) :
    Measurable (scheduledEtaStep cs ε M deadline start hn e N k) := by
  have hs := ((augPhaseStart_measurable (cs N).config ε M).comp
    (recycledPhaseState_measurable cs ε M deadline start hn e N)).prodMk
      (recycledPhases_measurable cs ε M deadline start hn e N).snd
  have hi := (augRecycledPair_joint_measurable (cs N).config ε M hn k).comp hs
  exact hi.fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp hi.snd)

def anyActualEtaHit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ) : Set (BoardClockPath n) :=
  {ω | ∃N,N<J ∧ ∃k,∃a b : Grid n,a≠b ∧
    (etaRawPairHit (cs N).config ε M a b
      (scheduledEtaStep cs ε M deadline start hn (augInitialState B hB deadline start) N k ω) ∨
     etaSegmentContact (cs N).config ε M a b
      (scheduledEtaStep cs ε M deadline start hn (augInitialState B hB deadline start) N k ω))}

theorem anyActualEtaHit_iff_raw {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ) (ω : BoardClockPath n) :
    ω∈anyActualEtaHit cs ε M deadline start hn hB J ↔
      ∃N,N<J ∧ ∃k,∃a b : Grid n,a≠b ∧ etaRawPairHit (cs N).config ε M a b
        (scheduledEtaStep cs ε M deadline start hn (augInitialState B hB deadline start) N k ω) := by
  constructor
  · rintro ⟨N,hN,k,a,b,hab,hh⟩
    exact ⟨N,hN,k,a,b,hab,hh.elim id ((etaSegmentContact_iff_raw (cs N).config ε M a b hab _).mp)⟩
  · rintro ⟨N,hN,k,a,b,hab,hh⟩
    exact ⟨N,hN,k,a,b,hab,Or.inl hh⟩

theorem anyActualEtaHit_measurableSet {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ) :
    MeasurableSet (anyActualEtaHit cs ε M deadline start hn hB J) := by
  have he : anyActualEtaHit cs ε M deadline start hn hB J=
      {ω | ∃N,N<J ∧ ∃k,∃a b : Grid n,a≠b ∧ etaRawPairHit (cs N).config ε M a b
        (scheduledEtaStep cs ε M deadline start hn (augInitialState B hB deadline start) N k ω)} :=
    Set.ext (anyActualEtaHit_iff_raw cs ε M deadline start hn hB J)
  rw [he]
  exact (Measurable.exists (fun N=>measurable_const.and (Measurable.exists (fun k=>
    Measurable.exists (fun a=>Measurable.exists (fun b=>measurable_const.and
      ((etaRawPairHit_measurable (cs N).config ε M a b).comp
        (scheduledEtaStep_measurable cs ε M deadline start hn (augInitialState B hB deadline start) N k)))))))).setOf

theorem anyActualEtaHit_cost {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ)
    (ω : BoardClockPath n) (hh : ω∈anyActualEtaHit cs ε M deadline start hn hB J) :
    ∃a b : Grid n,a≠b ∧ ε≤scheduledPairCost cs ε M deadline start hn a b
      (augInitialState B hB deadline start) J ω := by
  obtain ⟨N,hN,k,a,b,hab,hd,hhit⟩ := (anyActualEtaHit_iff_raw cs ε M deadline start hn hB J ω).mp hh
  let e := augInitialState B hB deadline start
  let eN := recycledPhaseState cs ε M deadline start hn e N ω
  let ωN := (recycledPhases cs ε M deadline start hn e N ω).2
  have hf := (raw_eta_hit_terminal_floor (cs N).config ε M hn a b hab
    (augPhaseStart (cs N).config ε M eN) k ωN hd hhit).2
  have he : (recycledPhaseState cs ε M deadline start hn e (N+1) ω).val.eta a b≤1-ε := by
    rw [recycledPhaseState_succ_eq,recycledScheduledPair_eta_eq]
    exact hf
  have hc := scheduled_eta_loss_le cs ε M deadline start hn a b e (N+1) ω
  have hi : e.val.eta a b=1 := augInitialState_eta B hB deadline start a b
  rw [hi] at hc
  exact ⟨a,b,hab,(show ε≤scheduledPairCost cs ε M deadline start hn a b e (N+1) ω by linarith).trans
    (scheduledPairCost_monotone cs ε M deadline start hn a b e ω hN)⟩

theorem anyActualEtaHit_path_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (J : ℕ) :
    ∀ᵐω ∂boardClockMeasure n (B/n),ω∈anyActualEtaHit cs ε M deadline start hn hB J →
      ∃a b : Grid n,a≠b ∧ ε≤scheduledPairPath cs ε M deadline start hn hB a b J ω := by
  have he := ae_all_iff.mpr (fun a=>ae_all_iff.mpr (fun b=>
    initial_scheduledPairCost_eq_path_ae cs ε M deadline start hn hB a b J))
  filter_upwards [he] with ω hω hh
  obtain ⟨a,b,hab,hc⟩ := anyActualEtaHit_cost cs ε M deadline start hn hB J ω hh
  exact ⟨a,b,hab,(hω a b) ▸ hc⟩

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.anyActualEtaHit_measurableSet
#print axioms NoThreeLine.PairWitness.anyActualEtaHit_cost
#print axioms NoThreeLine.PairWitness.anyActualEtaHit_path_ae
