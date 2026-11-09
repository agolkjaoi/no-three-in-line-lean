import NoThreeLine.ScheduledCutPointLaw
import NoThreeLine.RootPhaseEta

/-! Actual eta floors at inherited deterministic phase cuts. The root
observer is used only for its already proved physical projection and eta
invariant; the cut observable remains the original non-frozen cut state. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section

namespace NoThreeLine.BirthWitness

theorem initial_scheduledCutWitness_eta_lower {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (hε : 0≤ε)
    (a b : Grid n) (hab : a≠b) (k : ℕ) (x : BoardClockPath n×ℝ) :
    1-ε≤(scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k x).augmented.eta a b := by
  let s := initialGoodPhaseObservation B hB deadline start
  let sr := initialGoodPhaseRootObservation B hB p deadline start
  have hinit : PhaseRootEtaLower ε a b sr.val := by
    have hh : 1-ε≤(augInitialState B hB deadline start).val.eta a b := by
      rw [augInitialState_eta]
      linarith
    exact ⟨hh,hh⟩
  have hcur := (phaseRootPhases_eta_lower cs ε M deadline start p hn sr.val sr.property.1 a b hab hinit k x.1).1
  have he := congrArg Prod.fst (phaseRootPhases_projection cs ε M deadline start p hn sr.val k x.1)
  change (phaseRootPhases cs ε M deadline start p hn sr.val k x.1).1.1=
    observedRecycledPhaseState cs ε M deadline start hn s.val k x.1 at he
  change 1-ε≤((phaseRootPhases cs ε M deadline start p hn sr.val k x.1).1.1).1.val.eta a b at hcur
  rw [he] at hcur
  have hg : 1-ε≤(goodPhases cs ε M deadline start hn s k x.1).1.val.1.val.eta a b := by
    rw [goodPhases_state_projection]
    exact hcur
  let y := goodPhases cs ε M deadline start hn s k x.1
  exact sourceCutTerminal_eta_lower (cs k).config ε M (phaseEndpoint cs start k) hn
    (goodPhaseStart (cs k).config ε M y.1) (elapsedCutAmount (cs k).config.horizon x.2) a b hab hg y.2

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCutWitness_eta_lower
