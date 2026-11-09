import NoThreeLine.ExtendedState

/-! Finite discrete modes separate mode-dependent ODEs from their real
initial coordinates, allowing measurable selection of the constructed flows. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

abbrev ProcessMode (n : ℕ) := Finset (Grid n) ×
  ((Grid n → CreditStatus) × (Bool × Finset (LineIndex n)))

def ExtendedState.mode {n : ℕ} (e : ExtendedState n) : ProcessMode n :=
  (e.process.selected, (fun p => (e.process.accounts p).status, (e.process.stopped,e.handled)))

def modeSkeleton {n : ℕ} (m : ProcessMode n) : ProcessState n :=
  ⟨m.1,fun p => ⟨m.2.1 p,0⟩,m.2.2.1⟩

def stateFromMode {n : ℕ} (m : ProcessMode n) (z : Coordinates n) : ExtendedState n :=
  ⟨(modeSkeleton m).withWeights z.1,z.2.1,z.2.2,m.2.2.2⟩

theorem stateFromMode_mode {n : ℕ} (m : ProcessMode n) (z : Coordinates n) :
    (stateFromMode m z).mode = m := rfl

theorem stateFromMode_coordinates {n : ℕ} (m : ProcessMode n) (z : Coordinates n) :
    (stateFromMode m z).coordinates = z := by
  cases z
  rfl

theorem stateFromMode_self {n : ℕ} (e : ExtendedState n) :
    stateFromMode e.mode e.coordinates = e := by
  cases e with
  | mk s k r h =>
    have hs : (modeSkeleton (ExtendedState.mk s k r h).mode).withWeights
        (fun p => (s.accounts p).weight) = s := s.withWeights_self
    simp only [stateFromMode,ExtendedState.coordinates,hs]
    rfl

theorem ExtendedState.measurable_mode (n : ℕ) : Measurable (@ExtendedState.mode n) := by
  refine ((ProcessState.measurable_selected n).comp (measurable_process n)).prodMk
    (Measurable.prodMk ?_ (((ProcessState.measurable_stopped n).comp
      (measurable_process n)).prodMk (measurable_handled n)))
  apply measurable_pi_lambda
  intro p
  exact CreditAccount.measurable_status.comp
    ((ProcessState.measurable_account n p).comp (measurable_process n))

theorem stateFromMode_measurable_fixed {n : ℕ} (m : ProcessMode n) : Measurable (stateFromMode m) :=
  ExtendedState.measurable_mk _ _ _ _
    ((modeSkeleton m).measurable_withWeights.comp measurable_fst)
    measurable_snd.fst measurable_snd.snd measurable_const

theorem stateFromMode_measurable (n : ℕ) :
    Measurable (fun x : Coordinates n × ProcessMode n => stateFromMode x.2 x.1) :=
  measurable_from_prod_countable_left (fun m => stateFromMode_measurable_fixed m)

theorem vectorField_withWeights {n : ℕ} (s : ProcessState n) (w : Grid n → ℝ)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (z : Coordinates n) :
    vectorField (s.withWeights w) Γ mask z = vectorField s Γ mask z := rfl

theorem vectorField_mode {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (mask : Grid n → ℝ) (z : Coordinates n) :
    vectorField (modeSkeleton e.mode) Γ mask z = vectorField e.process Γ mask z := rfl

theorem pendingGuardSet_mode {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) :
    pendingGuardSet (modeSkeleton e.mode) Γ B K ρ e.mode.2.2.2 =
      pendingGuardSet e.process Γ B K ρ e.handled := rfl

end NoThreeLine

#print axioms NoThreeLine.stateFromMode_self
#print axioms NoThreeLine.stateFromMode_measurable
#print axioms NoThreeLine.vectorField_mode
