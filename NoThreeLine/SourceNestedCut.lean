import NoThreeLine.SourceObservedJoint

/-! Nested deterministic cuts are the same actual kernel as a single cut.
This uses the actual remaining-time and phase-start definitions; no flow
uniqueness or cross-horizon identification is assumed. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine

theorem sourceRestrictState_add {n : ℕ} (cfg : FlowConfig n) (a b : ℝ)
    (ha : 0≤a) (hb : 0≤b) (s : AugTimedState cfg) :
    sourceRestrictState cfg b hb (sourceRestrictState cfg a ha s)=
      sourceRestrictState cfg (a+b) (add_nonneg ha hb) s := by
  apply Subtype.ext
  apply Prod.ext
  · rfl
  · change max 0 (max 0 (s.val.2-a)-b)=max 0 (s.val.2-(a+b))
    by_cases h : s.val.2≤a
    · rw [max_eq_left (sub_nonpos.mpr h),zero_sub,max_eq_left (neg_nonpos.mpr hb),
        max_eq_left (by linarith)]
    · rw [max_eq_right (sub_nonneg.mpr (le_of_not_ge h))]
      congr 1
      ring

namespace BirthWitness

theorem sourceRestrictObservation_add {n : ℕ} (cfg : FlowConfig n) (a b : ℝ)
    (ha : 0≤a) (hb : 0≤b) (s : TimedObservation cfg) :
    sourceRestrictObservation cfg b hb (sourceRestrictObservation cfg a ha s)=
      sourceRestrictObservation cfg (a+b) (add_nonneg ha hb) s := by
  apply Prod.ext
  · exact sourceRestrictState_add cfg a b ha hb s.1
  · rfl

theorem sourceRestrictGood_add {n : ℕ} (cfg : FlowConfig n) (a b : ℝ)
    (ha : 0≤a) (hb : 0≤b) (s : GoodObservation cfg) :
    sourceRestrictGood cfg b hb (sourceRestrictGood cfg a ha s)=
      sourceRestrictGood cfg (a+b) (add_nonneg ha hb) s := by
  apply Subtype.ext
  exact sourceRestrictObservation_add cfg a b ha hb s.val

theorem sourceCutTerminal_add {n : ℕ} (cfg : FlowConfig n) (ε M start a b : ℝ)
    (ha : 0≤a) (hb : 0≤b) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    sourceCutTerminal cfg ε M (start-a) b hb hn (sourceRestrictGood cfg a ha s) ω=
      sourceCutTerminal cfg ε M start (a+b) (add_nonneg ha hb) hn s ω := by
  unfold sourceCutTerminal
  rw [sourceRestrictGood_add]
  have htime : start-a-b=start-(a+b) := by ring
  rw [htime]

theorem sourceCutTerminal_nested_at {n : ℕ} (cfg : FlowConfig n) (ε M start δ u : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hδR : δ≤s.val.1.val.2) (hu : u≤s.val.1.val.2-δ) :
    sourceCutTerminal cfg ε M (start-δ) (s.val.1.val.2-δ-u) (by linarith)
      hn (sourceRestrictGood cfg δ hδ s) ω=
      sourceCutTerminal cfg ε M start (s.val.1.val.2-u) (by linarith) hn s ω := by
  rw [sourceCutTerminal_add]
  congr 1
  ring

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.sourceRestrictState_add
#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_nested_at
