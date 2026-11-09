import NoThreeLine.WitnessSourceHierarchy

/-! Instantiate S7 on the actual selected augmented curve. The clock
domain k<2 is supplied by the actual pending-guard avoidance, with K<2.
The witness coordinates stay constant between births. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaPairProduct EtaMixedGenerator

def selectedWitnessCurve {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n → ℝ) (t : ℝ) : WitnessState n := ⟨selectedAugmentedCurve cfg x t,b⟩

theorem selectedWitnessCurve_valid {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n → ℝ) (ha : WitnessState.Valid ⟨⟨x.1.val,x.2⟩,b⟩ cfg.B)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x.1)) :
    (selectedWitnessCurve cfg x b t).Valid cfg.B :=
  ⟨selectedAugmentedCurve_valid cfg x ha.1.1 ha.1.2 t ht,ha.2.1,ha.2.2⟩

theorem selectedMixed_hasDerivAt {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n → ℝ) (C D L : Finset (Grid n)) (he : x.1.val.Valid cfg.B)
    (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x.1)) :
    HasDerivAt (fun u=>mixed cfg.directions C D L (selectedWitnessCurve cfg x b u))
      (continuousDrift (selectedWitnessCurve cfg x b t) cfg.directions C D L cfg.mask) t :=
  (selectedCorrectedPhi_hasDerivAt cfg x C L he t ht).const_mul (∏p∈D,b p)

theorem shared_clock_selected_lt {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (C : Finset (Grid n)) (q : Grid n) (he : x.val.Valid cfg.B) (hstop : x.val.process.stopped=false)
    (hC : C⊆x.val.process.activeEvents) (t : ℝ) (ht : t∈Ico (0:ℝ) (selectedGuardTime cfg x))
    (K : LineIndex n) (hK : sharedLine C q K) (hsp : specified cfg.directions K) :
    (selectedTrajectory cfg (x,t)).clocks K<cfg.K := by
  obtain ⟨p,hp⟩ := Finset.card_pos.mp hK.2
  obtain ⟨hpC,hpK⟩ := Finset.mem_inter.mp hp
  have hN := active_line_occupancy_le_one x.val.process p he.1 (hC hpC) K hpK
  have hno := (selectedCurve_spec cfg x he.2.1).2.2.2.1 t ht
  by_contra hn
  apply hno
  simp only [pendingGuardSet,if_pos hstop,mem_union]
  exact Or.inl (Or.inr (mem_iUnion.mpr ⟨K,hsp,hN,le_of_not_gt hn⟩))

theorem selectedGenerator_le_s7 {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n → ℝ) (C D L : Finset (Grid n)) (retention : Grid n → ℝ)
    (ha : WitnessState.Valid ⟨⟨x.1.val,x.2⟩,b⟩ cfg.B)
    (hstop : x.1.val.process.stopped=false) (hC : C⊆x.1.val.process.activeEvents)
    (hCL : C⊆L) (hCD : Disjoint C D) (hret : ∀q∈D,0≤retention q)
    (hE : EmptyLineCredit x.1.val) (hK : cfg.K<2)
    (t : ℝ) (ht : t∈Ioo (0:ℝ) (selectedGuardTime cfg x.1)) :
    generator (selectedWitnessCurve cfg x b t) cfg.directions C D L cfg.mask retention≤
      ∑q∈D,(cfg.mask q*retention q/n)*sourcePrice (selectedTrajectory cfg (x.1,t)) cfg.directions C q*
        mixed cfg.directions (insert q C) (D.erase q) L (selectedWitnessCurve cfg x b t) := by
  apply generator_le_s7 _ cfg.directions C D L cfg.mask retention cfg.B
    (selectedWitnessCurve_valid cfg x b ha t ⟨ht.1.le,ht.2.le⟩) hstop hC hCL hCD cfg.mask_nonneg hret
    (emptyLineCredit_selectedTrajectory cfg x.1 ha.1.1 hE t ⟨ht.1.le,ht.2.le⟩)
  intro q _ K hshared hsp
  exact (shared_clock_selected_lt cfg x.1 C q ha.1.1 hstop hC t ⟨ht.1.le,ht.2⟩ K hshared hsp).trans hK

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.shared_clock_selected_lt
#print axioms NoThreeLine.BirthWitness.selectedGenerator_le_s7
