import NoThreeLine.SourceNestedCut

/-! Commuted-argument adapter for the original nested-cut theorem.
The algebra and declarations are owned by SourceNestedCut; this adapter
uses a distinct name and can be imported alongside the whole cut hierarchy. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.BirthWitness

theorem sourceCutTerminal_add_commuted {n : ℕ} (cfg : FlowConfig n) (ε M start a b : ℝ)
    (ha : 0≤a) (hb : 0≤b) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    sourceCutTerminal cfg ε M (start-b) a ha hn (sourceRestrictGood cfg b hb s) ω=
      sourceCutTerminal cfg ε M start (a+b) (add_nonneg ha hb) hn s ω := by
  simpa only [add_comm b a] using sourceCutTerminal_add cfg ε M start b a hb ha hn s ω

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_add_commuted
