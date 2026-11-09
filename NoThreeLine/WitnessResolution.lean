import NoThreeLine.WitnessRawGuardStep

/-! Actual auxiliary-stop/physical-resolution comparison for S7. Birth
records and eta are retained; positive retirement can only remove active
roots and therefore cannot increase the nonnegative mixed observable. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator EtaPairProduct

def WitnessState.resolve {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (B K ρ ε M : ℝ) : WitnessState n := ⟨a.augmented.resolve Γ B K ρ ε M,a.retained⟩

theorem WitnessState.resolve_valid {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (B K ρ ε M : ℝ) (ha : a.Valid B) : (a.resolve Γ B K ρ ε M).Valid B := by
  refine ⟨a.augmented.resolve_valid Γ B K ρ ε M ha.1,ha.2.1,?_⟩
  intro p hp
  exact ha.2.2 p (by simpa only [resolve,augmented_resolve_selected] using hp)

theorem WitnessState.resolve_measurable {n : ℕ} (Γ : Finset ZPoint) (B K ρ ε M : ℝ) :
    Measurable (fun a : WitnessState n=>a.resolve Γ B K ρ ε M) :=
  WitnessState.measurable_mk _ _ ((AugmentedState.resolve_measurable Γ B K ρ ε M).comp
    (WitnessState.measurable_augmented n)) (WitnessState.measurable_retained n)

theorem phi_le_of_active_reduction {n : ℕ} (e f : ExtendedState n) (Γ : Finset ZPoint)
    (C : Finset (Grid n)) (B : ℝ) (he : e.Valid B)
    (hsel : f.process.selected=e.process.selected) (hcoord : f.coordinates=e.coordinates)
    (hact : f.process.activeEvents⊆e.process.activeEvents) : phi Γ C f≤phi Γ C e := by
  have hw (p : Grid n) : (f.process.accounts p).weight=(e.process.accounts p).weight :=
    congrFun (congrArg Prod.fst hcoord) p
  have hk : f.clocks=e.clocks := congrArg (fun z : Coordinates n=>z.2.1) hcoord
  have hr : f.lineCredits=e.lineCredits := congrArg (fun z : Coordinates n=>z.2.2) hcoord
  have hN (J : LineIndex n) : occupancy f.process J=occupancy e.process J := by simp only [occupancy,hsel]
  by_cases hC : C⊆f.process.activeEvents
  · have hCe := hC.trans hact
    simp only [phi,if_pos hC,if_pos hCe,rootWeightProduct,connectionProduct,lineConnection,hN,hk,hr,hw]
    exact le_rfl
  · rw [phi,if_neg hC]
    exact phi_nonneg e Γ C B he

theorem augmented_resolve_coordinates {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (B K ρ ε M : ℝ) : (a.resolve Γ B K ρ ε M).physical.coordinates=a.physical.coordinates := by
  unfold AugmentedState.resolve ExtendedState.resolve resolveBoundary
  split_ifs
  · exact a.physical.stop_coordinates
  · exact a.physical.stop_coordinates
  · unfold ExtendedState.coordinates
    congr 2
    funext p
    exact CreditAccount.retire_weight _ _

theorem augmented_resolve_active_subset {n : ℕ} (a : AugmentedState n) (Γ : Finset ZPoint)
    (B K ρ ε M : ℝ) : (a.resolve Γ B K ρ ε M).physical.process.activeEvents⊆a.physical.process.activeEvents := by
  unfold AugmentedState.resolve
  split_ifs
  · change a.physical.process.stop.activeEvents⊆_
    rw [ProcessState.stop_activeEvents_empty]
    exact Finset.empty_subset _
  · exact resolve_activeEvents_subset a.physical.process Γ B K ρ a.physical.clocks a.physical.lineCredits a.physical.handled

theorem mixed_resolve_le {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (B K ρ ε M : ℝ) (ha : a.Valid B) :
    mixed Γ C D L (a.resolve Γ B K ρ ε M)≤mixed Γ C D L a := by
  have hp := phi_le_of_active_reduction a.augmented.physical (a.augmented.resolve Γ B K ρ ε M).physical
    Γ C B ha.1.1 (augmented_resolve_selected _ Γ B K ρ ε M)
    (augmented_resolve_coordinates _ Γ B K ρ ε M) (augmented_resolve_active_subset _ Γ B K ρ ε M)
  unfold mixed correctedPhi
  change witnessProduct D a*(etaProduct L (a.augmented.resolve Γ B K ρ ε M).eta*_)≤_
  rw [AugmentedState.resolve_eta]
  exact mul_le_mul_of_nonneg_left
    (mul_le_mul_of_nonneg_left hp (etaProduct_nonneg L a.augmented.eta (fun p q=>(ha.1.2 p q).1)))
    (witnessProduct_nonneg a D B ha)

theorem actual_resolved_first_source_bound {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (ε M : ℝ) (b : Grid n→ℝ) (C D L : Finset (Grid n)) (e : Retention n) (start : ℝ) (T : ℝ≥0)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (ha : WitnessState.Valid ⟨⟨x.1.val,x.2⟩,b⟩ cfg.B)
    (hT : (T:ℝ)≤selectedGuardTime cfg x.1)
    (hstop : x.1.val.process.stopped=false) (hC : C⊆x.1.val.process.activeEvents)
    (hCL : C⊆L) (hCD : Disjoint C D) (hE : EmptyLineCredit x.1.val) (hK : cfg.K<2) :
    (∫ω,mixed cfg.directions C D L
      ((firstWitnessSnapshot cfg x b e start T (WinnerMarkLaw.firstMarkedRace hn ω)).resolve
        cfg.directions cfg.B cfg.K cfg.rho ε M) ∂boardClockMeasure n (cfg.B/n))≤
      mixed cfg.directions C D L (selectedWitnessCurve cfg x b 0)+
        ∫t in (0:ℝ)..T,Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedSourceSum cfg x b C D L e start t := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hf := (firstWitnessSnapshot_measurable cfg x b e start T).comp (WinnerMarkLaw.firstMarkedRace_measurable hn)
  have hv (ω : BoardClockPath n) := firstWitnessSnapshot_valid cfg x b e start T ha hT (WinnerMarkLaw.firstMarkedRace hn ω)
  apply le_trans _ (actual_first_witness_source_bound cfg x b C D L e start T hn hB hm ha hT hstop hC hCL hCD hE hK)
  apply integral_mono
  · exact mixed_integrable _ _ ((WitnessState.resolve_measurable cfg.directions cfg.B cfg.K cfg.rho ε M).comp hf)
      cfg.directions C D L cfg.B (fun ω=>WitnessState.resolve_valid _ cfg.directions _ _ _ _ _ (hv ω))
  · exact mixed_integrable _ _ hf cfg.directions C D L cfg.B hv
  · intro ω
    exact mixed_resolve_le _ cfg.directions C D L cfg.B cfg.K cfg.rho ε M (hv ω)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.mixed_resolve_le
#print axioms NoThreeLine.BirthWitness.actual_resolved_first_source_bound
