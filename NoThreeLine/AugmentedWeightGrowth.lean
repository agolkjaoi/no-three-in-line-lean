import NoThreeLine.SelectedWeightGrowthIntegral
import NoThreeLine.WitnessInactiveRoots

/-! Candidate birth can only lower an existing root weight. Thus the
actual postgeometry/pre-resolution snapshot satisfies the same integrated
growth bound, including accepted candidates at the physical endpoint. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem ProcessState.birth_weight_le_self {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (q : Grid n) (positive : Grid n→Bool) (p : Grid n)
    (hw : 0≤(s.accounts p).weight) :
    ((s.birth Γ q positive).accounts p).weight≤(s.accounts p).weight := by
  unfold ProcessState.birth
  split_ifs
  · exact (birthAccount_weight_bounds Γ s.selected p q (s.accounts p) (positive p)
      (s.accounts p).weight ⟨hw,le_rfl⟩).2
  · exact le_rfl

theorem ExtendedState.candidateUpdate_weight_le_self {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (B : ℝ) (q : Grid n)
    (positive : Grid n→Bool) (mark : ℝ) (p : Grid n) (hw : 0≤(e.process.accounts p).weight) :
    ((e.candidateUpdate Γ mask B q positive mark).process.accounts p).weight≤(e.process.accounts p).weight := by
  rw [ExtendedState.candidateUpdate_eq]
  split_ifs
  · exact e.process.birth_weight_le_self Γ q positive p hw
  · exact le_rfl

theorem ExtendedState.candidateUpdate_clocks_eq {n : ℕ} (e : ExtendedState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (B : ℝ) (q : Grid n)
    (positive : Grid n→Bool) (mark : ℝ) :
    (e.candidateUpdate Γ mask B q positive mark).clocks=e.clocks := by
  rw [ExtendedState.candidateUpdate_eq]
  split_ifs <;> rfl

theorem augRawOutcome_weight_le_pre {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (z : (ℝ×Grid n)×ℝ) (p : Grid n) :
    ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).weight≤
      ((augPreState cfg ε M (x,z)).physical.process.accounts p).weight := by
  have ht := augAdvance_mem cfg ε M x he z.1.1
  have hv : (augPreState cfg ε M (x,z)).physical.Valid cfg.B :=
    selectedTrajectory_valid cfg x.1.1 he _ ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M x he).2⟩
  unfold augRawOutcome
  split_ifs
  · exact ExtendedState.candidateUpdate_weight_le_self _ _ _ _ _ _ _ p (hv.1.2.2 p)
  · exact le_rfl

theorem augRawOutcome_clocks_eq_pre {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ×Grid n)×ℝ) :
    (augRawOutcome cfg ε M (x,z)).physical.clocks=(augPreState cfg ε M (x,z)).physical.clocks := by
  unfold augRawOutcome
  split_ifs
  · exact ExtendedState.candidateUpdate_clocks_eq _ _ _ _ _ _ _
  · rfl

theorem augRawOutcome_log_growth_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (K ρ : ℝ)
    (hKcfg : cfg.K≤K) (hρcfg : ρ≤cfg.rho) (hK : K<2)
    (hg : ActiveLineGuardBounds cfg.directions K ρ x.1.1.val)
    (hf : x.1.1.val.process.ActiveWeightFloor cfg.directions)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hstop : x.1.1.val.process.stopped=false) (z : (ℝ×Grid n)×ℝ) (p : Grid n)
    (hp : ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).status=.active) :
    Real.log ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).weight-
      Real.log (x.1.1.val.process.accounts p).weight≤
      (cfg.B/n)*augAdvance cfg ε M (x,z.1.1)+
      selectedOutsideRiskIntegral cfg x.1.1 p (augAdvance cfg ε M (x,z.1.1))+
      (rootDesignatedClock cfg.directions p (augRawOutcome cfg ε M (x,z)).physical.clocks-
        rootDesignatedClock cfg.directions p x.1.1.val.clocks)/(2-K) := by
  have hpa : p∈x.1.1.val.process.activeEvents := BirthWitness.augRawOutcome_active_subset cfg ε M (x,z)
    ((ProcessState.mem_activeEvents _ p).mpr hp)
  have hp0 := (ProcessState.mem_activeEvents _ p).mp hpa
  have hfloor0 := x.1.1.val.process.activeWeightFloor_uniform cfg.directions hf p hp0
  have hw0 : 0<(x.1.1.val.process.accounts p).weight := (by positivity : (0:ℝ)<(1/2)^cfg.directions.card).trans_le hfloor0
  have hfloor := (augRawOutcome cfg ε M (x,z)).physical.process.activeWeightFloor_uniform
    cfg.directions (augRawOutcome_activeWeightFloor cfg ε M x he hf z) p hp
  have hw : 0<((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).weight :=
    (by positivity : (0:ℝ)<(1/2)^cfg.directions.card).trans_le hfloor
  have hlog := Real.log_le_log hw (augRawOutcome_weight_le_pre cfg ε M x he z p)
  have ht := augAdvance_mem cfg ε M x he z.1.1
  have hh := selectedCurve_log_growth_le cfg x.1.1 he K ρ hKcfg hρcfg hK hg hB hm p hstop hp0 hw0
    (augAdvance cfg ε M (x,z.1.1)) ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M x he).2⟩
  rw [augRawOutcome_clocks_eq_pre]
  change Real.log ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).weight-
    Real.log (x.1.1.val.process.accounts p).weight≤_
  exact (sub_le_sub_right hlog _).trans hh

end NoThreeLine

#print axioms NoThreeLine.ProcessState.birth_weight_le_self
#print axioms NoThreeLine.augRawOutcome_log_growth_le
