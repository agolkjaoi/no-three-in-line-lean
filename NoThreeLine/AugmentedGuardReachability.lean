import NoThreeLine.VirtualRetirement
import NoThreeLine.AugmentedInitialization

/-! A nonstopped resolved state avoids both auxiliary guards, including
after positive retirement. This property propagates along actual iterates. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem AugmentedState.resolve_not_auxBad {n : ℕ} (a : AugmentedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ) (ha : a.Valid B)
    (hs : (a.resolve Γ B K ρ ε M).physical.process.stopped ≠ true) :
    ¬(a.resolve Γ B K ρ ε M).auxBad Γ ε M := by
  have hbad : ¬a.auxBad Γ ε M := fun hb => hs (a.resolve_stops_aux Γ B K ρ ε M hb)
  have hout : (a.resolve Γ B K ρ ε M).physical = a.physical.resolve Γ B K ρ := by
    simp only [resolve,if_neg hbad]
  rintro (hη | hV)
  · exact (not_or.mp hbad).1 (by simpa only [resolve_eta] using hη)
  · have hsmall := (outside_virtualGuard _ _ _ _).mp (not_or.mp hbad).2
    have hsmall' : ∀ L q, virtualMass (a.resolve Γ B K ρ ε M).physical.process Γ
        (a.resolve Γ B K ρ ε M).physical.coordinates L q < M := by
      intro L q
      rw [hout]
      exact (a.physical.virtualMass_resolve_le Γ B K ρ ha.1 L q).trans_lt (hsmall L q)
    exact ((outside_virtualGuard _ _ _ _).mpr hsmall') hV

def AugmentedState.AuxReady {n : ℕ} (a : AugmentedState n) (Γ : Finset PrimitiveLines.ZPoint)
    (ε M : ℝ) : Prop := a.physical.process.stopped = true ∨ ¬a.auxBad Γ ε M

theorem augOutcome_auxReady {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (hη : ∀ a b, 0 ≤ x.1.2 a b ∧ x.1.2 a b ≤ 1) (z : (ℝ × Grid n) × ℝ) :
    (augOutcome cfg ε M (x,z)).AuxReady cfg.directions ε M := by
  by_cases hs : (augOutcome cfg ε M (x,z)).physical.process.stopped = true
  · exact Or.inl hs
  · exact Or.inr (AugmentedState.resolve_not_auxBad _ _ _ _ _ _ _
      (augRawOutcome_valid cfg ε M x he hη z) hs)

theorem augTimedStep_auxReady {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (z : (ℝ × Grid n) × ℝ)
    (hs : s.val.1.AuxReady cfg.directions ε M) :
    (augTimedStep cfg ε M (s,z)).val.1.AuxReady cfg.directions ε M := by
  change (augTimedStepPair cfg ε M (s,z)).1.AuxReady cfg.directions ε M
  unfold augTimedStepPair
  split_ifs
  · exact hs
  · exact augOutcome_auxReady cfg ε M _ s.property.1.1 s.property.1.2 z

theorem augTimedNoiseState_auxReady {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (hs : s.val.1.AuxReady cfg.directions ε M)
    (k : ℕ) (ω : ℕ → BoardClockPath n) :
    (augTimedNoiseState cfg ε M hn s k ω).val.1.AuxReady cfg.directions ε M := by
  induction k with
  | zero => exact hs
  | succ k ih => exact augTimedStep_auxReady cfg ε M _ _ ih

theorem augTimedTerminal_auxReady {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (hs : s.val.1.AuxReady cfg.directions ε M)
    (ω : ℕ → BoardClockPath n) : (augTimedTerminal cfg ε M hn s ω).val.1.AuxReady cfg.directions ε M :=
  augTimedNoiseState_auxReady cfg ε M hn s hs _ ω

theorem augInitialState_auxReady {n : ℕ} (B : ℝ) (hB : 1 ≤ B) (deadline : Grid n → ℝ)
    (start : ℝ) (Γ : Finset PrimitiveLines.ZPoint) (ε M : ℝ) (hε : 0 < ε) (hM : 0 < M) :
    (augInitialState B hB deadline start).val.AuxReady Γ ε M :=
  Or.inr (augInitialState_not_auxBad B hB deadline start Γ ε M hε hM)

theorem augValidDeadlineRetirement_virtual_le {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidAugmentedState n B) (Γ : Finset PrimitiveLines.ZPoint) (L : LineIndex n) (q : Grid n) :
    virtualMass (augValidDeadlineRetirement deadline t e).val.physical.process Γ
      (augValidDeadlineRetirement deadline t e).val.physical.coordinates L q ≤
        virtualMass e.val.physical.process Γ e.val.physical.coordinates L q := by
  unfold augValidDeadlineRetirement
  split_ifs
  · exact le_rfl
  · exact e.val.physical.virtualMass_deadline_le Γ B e.property.1 deadline t L q

theorem augValidDeadlineRetirement_auxReady {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (e : ValidAugmentedState n B) (Γ : Finset PrimitiveLines.ZPoint) (ε M : ℝ)
    (he : e.val.AuxReady Γ ε M) : (augValidDeadlineRetirement deadline t e).val.AuxReady Γ ε M := by
  rcases he with hs | hg
  · left
    simpa only [augValidDeadlineRetirement_stop_flag] using hs
  · right
    rintro (hη | hV)
    · exact (not_or.mp hg).1 (by simpa only [augValidDeadlineRetirement_eta] using hη)
    · have hsmall := (outside_virtualGuard _ _ _ _).mp (not_or.mp hg).2
      have hsmall' : ∀ L q, virtualMass (augValidDeadlineRetirement deadline t e).val.physical.process Γ
          (augValidDeadlineRetirement deadline t e).val.physical.coordinates L q < M := by
        intro L q
        exact (augValidDeadlineRetirement_virtual_le deadline t e Γ L q).trans_lt (hsmall L q)
      exact ((outside_virtualGuard _ _ _ _).mpr hsmall') hV

theorem augPhaseTerminal_auxReady {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n cfg.B) (he : e.val.AuxReady cfg.directions ε M) (ω : PhaseNoise n) :
    (augPhaseTerminal cfg ε M hn (e,ω)).val.AuxReady cfg.directions ε M :=
  augTimedTerminal_auxReady cfg ε M hn (augPhaseStart cfg ε M e) he ω

theorem augScheduledPhase_auxReady {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (Γ : Finset PrimitiveLines.ZPoint) (hΓ : (cs j).directions = Γ)
    (e : ValidAugmentedState n B) (he : e.val.AuxReady Γ ε M) (ω : PhaseNoise n) :
    (augScheduledPhase cs ε M deadline start hn j (e,ω)).val.AuxReady Γ ε M := by
  apply augValidDeadlineRetirement_auxReady
  subst Γ
  exact augPhaseTerminal_auxReady (cs j).config ε M hn e he ω

theorem augFinitePhaseState_auxReady {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (k : ℕ)
    (Γ : Finset PrimitiveLines.ZPoint) (hΓ : ∀ j, (cs j).directions = Γ)
    (e : ValidAugmentedState n B) (he : e.val.AuxReady Γ ε M) (v : Fin k → PhaseNoise n) :
    (augFinitePhaseState cs ε M deadline start hn k e v).val.AuxReady Γ ε M := by
  induction k with
  | zero => exact he
  | succ k ih =>
    rw [augFinitePhaseState_succ]
    exact augScheduledPhase_auxReady cs ε M deadline start hn k Γ (hΓ k) _ (ih _) _

end NoThreeLine

#print axioms NoThreeLine.AugmentedState.resolve_not_auxBad
#print axioms NoThreeLine.augTimedTerminal_auxReady
#print axioms NoThreeLine.augInitialState_auxReady
#print axioms NoThreeLine.augFinitePhaseState_auxReady
