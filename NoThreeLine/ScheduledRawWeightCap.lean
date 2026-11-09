import NoThreeLine.InitialWeightGrowth
import NoThreeLine.RawWeightPotential

/-! Any actual raw active weight cap in a scheduled phase forces the
same accumulated physical outside hazard, with a single clock budget. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem initial_scheduled_raw_weight_cap_requires_risk {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K ρ : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hρcfg : ∀j,ρ≤(cs j).rho) (hK0 : 0≤K) (hK : K<2)
    (p : Grid n) (j k : ℕ) (ω : BoardClockPath n) :
    let e := augInitialState B hB deadline start
    let ej := recycledPhaseState cs ε M deadline start hn e j ω
    let ωj := (recycledPhases cs ε M deadline start hn e j ω).2
    let sj := augPhaseStart (cs j).config ε M ej
    let sk := (augRecycledPair (cs j).config ε M hn sj k ωj).1
    let zk := WinnerMarkLaw.firstMarkedRace hn (augRecycledPair (cs j).config ε M hn sj k ωj).2
    ¬(sk.val.2≤0 ∨ sk.val.1.physical.process.stopped=true) →
    ((augRawOutcome (cs j).config ε M (augTimedInput (cs j).config sk,zk)).physical.process.accounts p).status=.active →
    B≤((augRawOutcome (cs j).config ε M (augTimedInput (cs j).config sk,zk)).physical.process.accounts p).weight →
    Real.log B-(B/n)*phaseEndpoint cs 0 (j+1)-(Γ.card*K)/(2-K)≤
      scheduledOutsideRiskCost cs ε M deadline start hn p e j ω+
      recycledOutsideRiskCost (cs j).config ε M hn p sj (k+1) ωj := by
  dsimp only
  intro hd hp hcap
  let e := augInitialState B hB deadline start
  let ej := recycledPhaseState cs ε M deadline start hn e j ω
  let ωj := (recycledPhases cs ε M deadline start hn e j ω).2
  let sj := augPhaseStart (cs j).config ε M ej
  let sk := (augRecycledPair (cs j).config ε M hn sj k ωj).1
  let zk := WinnerMarkLaw.firstMarkedRace hn (augRecycledPair (cs j).config ε M hn sj k ωj).2
  have hpold : (ej.val.physical.process.accounts p).status=.active :=
    (ProcessState.mem_activeEvents _ p).mp (augRecycledPair_active_subset (cs j).config ε M hn sj k ωj
      (BirthWitness.augRawOutcome_active_subset (cs j).config ε M (augTimedInput (cs j).config sk,zk)
        ((ProcessState.mem_activeEvents _ p).mpr hp)))
  have hprev := initial_recycledPhaseState_growthPotential_le cs ε M K ρ deadline start hn hB
    Γ hΓ hKcfg hρcfg hK0 hK p j ω hpold
  have hg := recycledPhaseState_activeLineGuardBounds cs ε M K ρ deadline start hn Γ hΓ hKcfg hρcfg e
    (augInitialState_activeLineGuardBounds B hB deadline start Γ K ρ hK0) j ω
  have hf := recycledPhaseState_activeWeightFloor cs ε M deadline start hn Γ hΓ e
    (augInitialState_activeWeightFloor B hB deadline start Γ) j ω
  rw [← hΓ j] at hg hf
  have hraw := recycled_raw_weight_cap_requires_potential_risk (cs j).config ε M K ρ hn
    (hKcfg j) (hρcfg j) hK0 hK (lt_of_lt_of_le zero_lt_one hB) (cs j).mask_le_one
    sj hg hf p k ωj hd hp hcap
  change Real.log B-weightGrowthPotential (cs j).directions K p ej.val.physical-
    (B/n)*(cs j).horizon-((cs j).directions.card*K)/(2-K)≤
      recycledOutsideRiskCost (cs j).config ε M hn p sj (k+1) ωj at hraw
  rw [hΓ j] at hraw
  change weightGrowthPotential Γ K p ej.val.physical≤
    (B/n)*phaseEndpoint cs 0 j+scheduledOutsideRiskCost cs ε M deadline start hn p e j ω at hprev
  change Real.log B-(B/n)*phaseEndpoint cs 0 (j+1)-(Γ.card*K)/(2-K)≤
    scheduledOutsideRiskCost cs ε M deadline start hn p e j ω+
      recycledOutsideRiskCost (cs j).config ε M hn p sj (k+1) ωj
  rw [phaseEndpoint_succ]
  nlinarith

end NoThreeLine

#print axioms NoThreeLine.initial_scheduled_raw_weight_cap_requires_risk
