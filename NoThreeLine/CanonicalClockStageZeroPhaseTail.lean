import NoThreeLine.ScheduledProtectedPhaseTail

/-! The stage-zero half of the fixed clock slack is divided over the
actual finite phases. The canonical saved cell begins with one per point. -/
set_option autoImplicit false
set_option maxHeartbeats 1850000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine
open AuxiliaryODE BirthWitness PrimitiveLines

theorem protectedScheduleInitial_total_credit {n : ℕ} (B : ℝ) (hB : 1≤B) (L : LineIndex n)
    (E : Finset (Grid n)) (deadline : Grid n→ℝ) (start : ℝ) :
    protectedPhaseTotal L E id (protectedScheduleInitial B hB L deadline start)=(E.card:ℝ) := by
  simp only [protectedPhaseTotal,id_eq,protectedScheduleInitial_credit,Finset.sum_const,nsmul_eq_mul,mul_one]

theorem canonicalClockCell_stageZero_le_of_phase {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (p : Grid n)
    (hn : 0<n) (hB : 1≤B) (J : ℕ) (hJ : 0<J) (i : Fin J)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (hK0 : 0≤K)
    (hsp : ∀j,specified (cs j).directions L) (hε : 0<ε) (hM : 0<M)
    (δ tail : ℝ) (hδ : 0≤δ) (htail : 0≤tail) :
    let E := L.val∩clockMaskCells cs J i
    let step := (δ/2)*n/J
    (∀ j<J,∀v : ProtectedTimedState (cs j).config,
      occupancy v.1.val.1.physical.process L=0 → v.1.val.1.physical.clocks L≤K →
      v.1.val.1.AuxReady (cs j).directions ε M →
      (∀q∈L.val,0≤v.2 q ∧ v.2 q≤2*B) →
      protectedStateTotal (cs j).config L E id v≤(E.card:ℝ)+(j:ℝ)*step →
      (phaseLineForbiddenLaw (cs j).config ε M K L 0 hn v.1).real
        (protectedActualExceedance (cs j).config ε M L 0 E id hn v ((E.card:ℝ)+(j+1:ℕ)*step))≤tail) →
    (scheduledLineForbiddenLaw cs ε M K deadline start hn L 0 (augInitialState B hB deadline start) J).real
      (scheduledProtectedExceedance cs ε M deadline start L 0 E id hn
        (clockMaskCellCap cs L (δ/2) J i) J (protectedScheduleInitial B hB L deadline start))≤
      (2/(2-K))^2*(J:ℝ)*tail := by
  intro E step hphase
  let s := protectedScheduleInitial B hB L deadline start
  have hB0 : 0<B := zero_lt_one.trans_le hB
  have hphys : s.1=augInitialState B hB deadline start := rfl
  have ho : occupancy s.1.val.physical.process L=0 := by
    rw [hphys]
    simp only [occupancy,augInitialState_selected,Finset.empty_inter,Finset.card_empty]
  have hk : s.1.val.physical.clocks L≤K := by
    rw [hphys,augInitialState,augValidDeadlineRetirement_clocks]
    exact hK0
  have hs : s.1.val.AuxReady Γ ε M := augInitialState_auxReady B hB deadline start Γ ε M hε hM
  have hsv (q : Grid n) (hq : q∈L.val) : 0≤s.2.1 q ∧ s.2.1 q≤2*B :=
    protectedDeadlineBook_saved_bounds L (cs 0).directions (hsp 0) q hq deadline start _
      ⟨le_rfl,mul_nonneg (by norm_num) hB0.le⟩
  have hJ' : (0:ℝ)<J := by exact_mod_cast hJ
  have hstep : 0≤step := div_nonneg (mul_nonneg (by linarith) (Nat.cast_nonneg n)) hJ'.le
  have he : (E.card:ℝ)+(J:ℝ)*step=clockMaskCellCap cs L (δ/2) J i := by
    change (E.card:ℝ)+(J:ℝ)*((δ/2)*(n:ℝ)/(J:ℝ))=(E.card:ℝ)+(δ/2)*(n:ℝ)
    field_simp
  have h := scheduledLineForbidden_crossing_le_finite_phase cs ε M K deadline start L 0 (by omega)
    E id continuous_id p hn hB0 J s Γ hΓ hKcfg hK hsp ho hk hsv hs (E.card:ℝ) step tail hstep htail
    (protectedScheduleInitial_total_credit B hB L E deadline start).le hphase
  rw [he] at h
  exact h

end NoThreeLine

#print axioms NoThreeLine.canonicalClockCell_stageZero_le_of_phase

