import NoThreeLine.EtaMixedActualSegment
import NoThreeLine.ExtendedRetirement

/-! An initially unoccupied physical line keeps its actual r value one.
The invariant is derived through the actual ODE, births and retirements,
and then instantiated on the actual capped augmented segment. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def EmptyLineCredit {n : ℕ} (e : ExtendedState n) : Prop :=
  ∀ L : LineIndex n,occupancy e.process L=0→e.lineCredits L=1

theorem emptyLineCredit_initial (n : ℕ) : EmptyLineCredit (ExtendedState.initial n) := by
  intro L _
  rfl

theorem emptyLineCredit_of_selected_subset {n : ℕ} (e e' : ExtendedState n)
    (he : EmptyLineCredit e) (hS : e.process.selected⊆e'.process.selected)
    (hr : e'.lineCredits=e.lineCredits) : EmptyLineCredit e' := by
  intro L hL
  rw [hr]
  apply he L
  have hsub : e.process.selected∩L.val⊆e'.process.selected∩L.val := by
    intro p hp
    exact Finset.mem_inter.mpr ⟨hS (Finset.mem_inter.mp hp).1,(Finset.mem_inter.mp hp).2⟩
  have hle := Finset.card_le_card hsub
  change occupancy e.process L≤occupancy e'.process L at hle
  omega

theorem emptyLineCredit_birth {n : ℕ} (e : ExtendedState n) (he : EmptyLineCredit e)
    (Γ : Finset ZPoint) (q : Grid n) (positive : Grid n → Bool) : EmptyLineCredit (e.birth Γ q positive) := by
  apply emptyLineCredit_of_selected_subset e (e.birth Γ q positive) he _ rfl
  unfold ExtendedState.birth ProcessState.birth
  split_ifs
  · exact Finset.subset_insert _ _
  · exact Finset.Subset.refl _

theorem emptyLineCredit_retire {n : ℕ} (e : ExtendedState n) (he : EmptyLineCredit e)
    (positive : Grid n → Bool) : EmptyLineCredit (e.retire positive) :=
  emptyLineCredit_of_selected_subset e _ he (Finset.Subset.refl _) rfl

theorem emptyLineCredit_stop {n : ℕ} (e : ExtendedState n) (he : EmptyLineCredit e) :
    EmptyLineCredit e.stop := emptyLineCredit_of_selected_subset e _ he (Finset.Subset.refl _) rfl

theorem emptyLineCredit_resolve {n : ℕ} (e : ExtendedState n) (he : EmptyLineCredit e)
    (Γ : Finset ZPoint) (B K ρ : ℝ) : EmptyLineCredit (e.resolve Γ B K ρ) := by
  apply emptyLineCredit_of_selected_subset e (e.resolve Γ B K ρ) he _ rfl
  unfold ExtendedState.resolve resolveBoundary
  split_ifs <;> exact Finset.Subset.refl _

theorem emptyLineCredit_candidateUpdate {n : ℕ} (e : ExtendedState n) (he : EmptyLineCredit e)
    (Γ : Finset ZPoint) (mask : Grid n → ℝ) (B : ℝ) (q : Grid n)
    (positive : Grid n → Bool) (mark : ℝ) : EmptyLineCredit (e.candidateUpdate Γ mask B q positive mark) := by
  rw [ExtendedState.candidateUpdate_eq]
  split_ifs
  · exact emptyLineCredit_birth e he Γ q positive
  · exact he

theorem emptyLineCredit_flow {n : ℕ} (e : ExtendedState n) (he : EmptyLineCredit e)
    (Γ : Finset ZPoint) (mask : Grid n → ℝ) (T : ℝ) (hT : 0≤T)
    (z : ℝ → Coordinates n) (hz : ContinuousOn z (Icc 0 T))
    (hd : ∀t∈Ioo 0 T,HasDerivAt z (vectorField e.process Γ mask (z t)) t)
    (h0 : z 0=e.coordinates) (t : ℝ) (ht : t∈Icc 0 T) : EmptyLineCredit (e.withCoordinates (z t)) := by
  intro L hL
  change occupancy e.process L=0 at hL
  have hf := flow_lineCredit_inactive_constant e.process Γ mask T hT z hz hd L
    (by simp [hL]) t ht
  change (z t).2.2 L=1
  rw [hf,h0]
  exact he L hL

theorem emptyLineCredit_selectedTrajectory {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (hE : EmptyLineCredit x.val)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    EmptyLineCredit (selectedTrajectory cfg (x,t)) := by
  have hspec := selectedCurve_spec cfg x he.2.1
  have hc : Continuous (fun u=>selectedCurve cfg (x,u)) := by
    change Continuous (fun u:ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,u))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp
      (continuous_const.prodMk continuous_id)
  apply emptyLineCredit_flow x.val hE cfg.directions cfg.mask (selectedGuardTime cfg x)
    hspec.2.1.1 (fun u=>selectedCurve cfg (x,u)) hc.continuousOn _ hspec.1 t ht
  intro u hu
  exact (hspec.2.2.1 u ⟨hu.1.le,hu.2.le⟩).2.2.hasDerivAt (Icc_mem_nhds hu.1 hu.2)

theorem emptyLineCredit_augPreState {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (hE : EmptyLineCredit x.1.1.val)
    (z : (ℝ × Grid n) × ℝ) : EmptyLineCredit (augPreState cfg ε M (x,z)).physical := by
  have ht := augAdvance_mem cfg ε M x he z.1.1
  exact emptyLineCredit_selectedTrajectory cfg x.1.1 he hE _
    ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M x he).2⟩

theorem emptyLineCredit_augResolve {n : ℕ} (a : AugmentedState n) (hE : EmptyLineCredit a.physical)
    (Γ : Finset ZPoint) (B K ρ ε M : ℝ) : EmptyLineCredit (a.resolve Γ B K ρ ε M).physical := by
  unfold AugmentedState.resolve
  split_ifs
  · exact emptyLineCredit_stop a.physical hE
  · exact emptyLineCredit_resolve a.physical hE Γ B K ρ

theorem emptyLineCredit_augOutcome {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (hE : EmptyLineCredit x.1.1.val)
    (z : (ℝ × Grid n) × ℝ) : EmptyLineCredit (augOutcome cfg ε M (x,z)).physical := by
  apply emptyLineCredit_augResolve
  have hp := emptyLineCredit_augPreState cfg ε M x he hE z
  unfold augRawOutcome
  split_ifs
  · exact emptyLineCredit_candidateUpdate _ hp _ _ _ _ _ _
  · exact hp

end NoThreeLine

#print axioms NoThreeLine.emptyLineCredit_flow
#print axioms NoThreeLine.emptyLineCredit_augOutcome
