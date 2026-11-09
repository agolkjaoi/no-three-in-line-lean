import NoThreeLine.LineStageFlowCrossing

/-! The first exceedance in a real phase, allowing both an observed
update-boundary exceedance and a continuous exceedance on its subsequent
segment. The disjoint first occurrences preserve the comparison without
any count of candidate updates or continuous observation times. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def lineStageBoundaryExceeds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (s : AugTimedState cfg) (k : ℕ)
    (g : LineCutHistory cfg k→ℝ) (b : ℝ) : Set (BoardClockPath n) :=
  {ω | occupancy (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process L=N ∧
    b<g (lineCutHistory cfg ε M hn s k ω)}

theorem lineStageBoundaryExceeds_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (s : AugTimedState cfg) (k : ℕ)
    (g : LineCutHistory cfg k→ℝ) (hg : Measurable g) (b : ℝ) :
    MeasurableSet[augRecycledStateFiltration cfg ε M hn s k]
      (lineStageBoundaryExceeds cfg ε M L N hn s k g b) := by
  have hv := StateHistory.state_measurable (fun i ω=>(augRecycledPair cfg ε M hn s i ω).1)
    (fun j=>(augRecycledPair_measurable cfg ε M hn s j).fst) k
  have ho := (ExtendedState.measurable_occupancy n L).comp
    ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp hv))
  have hh : Measurable[augRecycledStateFiltration cfg ε M hn s k]
      (lineCutHistory cfg ε M hn s k) := comap_measurable _
  exact (measurableSet_eq_fun ho measurable_const).inter
    (measurableSet_lt measurable_const (hg.comp hh))

def lineStageExceedance {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (N : ℕ) (hn : 0<n) (s : AugTimedState cfg)
    (g : ∀k,LineCutHistory cfg k→ℝ) (f : ∀k,LineCutHistory cfg k×ℝ→ℝ) (b : ℝ) :
    Set (BoardClockPath n) :=
  ⋃k,lineStageBoundaryExceeds cfg ε M L N hn s k (g k) b ∪
    lineStageHistoryExceeds cfg ε M L N hn s k univ (f k) b

theorem phaseLineForbiddenLaw_firstCrossing_ge {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K)
    (g : ∀k,LineCutHistory cfg k→ℝ) (hg : ∀k,Measurable (g k))
    (f : ∀k,LineCutHistory cfg k×ℝ→ℝ) (hf : ∀k,Measurable (f k))
    (hfc : ∀ k a,Continuous (fun t=>f k (a,t))) (b : ℝ) :
    (boardClockMeasure n (cfg.B/n)).real (lineStageExceedance cfg ε M L N hn s g f b)≤
      (phaseLineForbiddenLaw cfg ε M K L N hn s).real (lineStageExceedance cfg ε M L N hn s g f b) := by
  let μ := boardClockMeasure n (cfg.B/n)
  let ν := phaseLineForbiddenLaw cfg ε M K L N hn s
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure ν := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp
    N hN hn hB hm s ho hk
  let m := augRecycledStateFiltration cfg ε M hn s
  let B := fun k=>lineStageBoundaryExceeds cfg ε M L N hn s k (g k) b
  let F := fun k=>lineStageHistoryExceeds cfg ε M L N hn s k univ (f k) b
  let R := fun k=>B k∪F k
  have hBm (k : ℕ) : MeasurableSet[m k] (B k) :=
    lineStageBoundaryExceeds_history cfg ε M L N hn s k (g k) (hg k) b
  have hFm (k : ℕ) : MeasurableSet[m (k+1)] (F k) :=
    lineStageHistoryExceeds_history cfg ε M L N hn s k univ MeasurableSet.univ (f k) (hf k) (hfc k) b
  have hRm (k : ℕ) : MeasurableSet[m (k+1)] (R k) :=
    ((m.mono (Nat.le_succ k)) _ (hBm k)).union (hFm k)
  let S := fun k=>⋂ i,⋂ _ : i<k,(R i)ᶜ
  have hSm (k : ℕ) : MeasurableSet[m k] (S k) :=
    MeasurableSet.iInter (fun i=>MeasurableSet.iInter (fun hi : i<k=>
      ((m.mono (Nat.succ_le_of_lt hi)) _ (hRm i)).compl))
  have hdm (k : ℕ) : MeasurableSet (disjointed R k) := by
    rw [disjointed_eq_inter_compl]
    exact (m.le (k+1)) _ ((hRm k).inter ((m.mono (Nat.le_succ k)) _ (hSm k)))
  have hpiece (k : ℕ) : μ (disjointed R k)≤ν (disjointed R k) := by
    let A := B k∩S k
    let C := S k∩(B k)ᶜ
    have hAm : MeasurableSet[m k] A := (hBm k).inter (hSm k)
    have hCm : MeasurableSet[m k] C := (hSm k).inter (hBm k).compl
    have hA : μ A≤ν A := by
      apply (ENNReal.toReal_le_toReal (measure_ne_top μ A) (measure_ne_top ν A)).mp
      exact phaseLineForbiddenLaw_history_event_ge cfg ε M K hKcfg hK L hsp N hN hn hB hm
        s ho hk k A hAm (fun ω hw=>hw.1.1)
    change MeasurableSet[MeasurableSpace.comap (lineCutHistory cfg ε M hn s k) inferInstance] C at hCm
    obtain ⟨D,hD,hCD⟩ := hCm
    have hE : lineStageHistoryExceeds cfg ε M L N hn s k D (f k) b=F k∩C := by
      rw [←hCD]
      ext ω
      simp [lineStageHistoryExceeds,F,and_assoc,and_comm,and_left_comm]
    have hFC : μ (F k∩C)≤ν (F k∩C) := by
      apply (ENNReal.toReal_le_toReal (measure_ne_top μ _) (measure_ne_top ν _)).mp
      rw [←hE]
      exact phaseLineForbiddenLaw_history_exceeds_ge cfg ε M K hKcfg hK L hsp N hN hn hB hm
        s ho hk k D hD (f k) (hf k) (hfc k) b
    have hFCm : MeasurableSet (F k∩C) := by
      rw [←hE]
      exact (m.le (k+1)) _ (lineStageHistoryExceeds_history cfg ε M L N hn s k D hD (f k) (hf k) (hfc k) b)
    have hd : Disjoint A (F k∩C) :=
      Set.disjoint_left.mpr (fun ω hω hω' => hω'.2.2 hω.1)
    have hde : disjointed R k=A∪(F k∩C) := by
      rw [disjointed_eq_inter_compl]
      ext ω
      change ((ω∈B k ∨ ω∈F k) ∧ ω∈S k) ↔
        (ω∈B k ∧ ω∈S k) ∨ (ω∈F k ∧ ω∈S k ∧ ω∉B k)
      tauto
    rw [hde,measure_union hd hFCm,measure_union hd hFCm]
    exact add_le_add hA hFC
  apply ENNReal.toReal_mono (measure_ne_top ν _)
  change μ (⋃ k,R k)≤ν (⋃ k,R k)
  rw [←iUnion_disjointed,measure_iUnion (disjoint_disjointed R) hdm,
    measure_iUnion (disjoint_disjointed R) hdm]
  exact ENNReal.tsum_le_tsum hpiece

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_firstCrossing_ge

