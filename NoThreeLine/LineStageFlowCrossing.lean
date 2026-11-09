import NoThreeLine.LineStrictCut

/-! A strict upcrossing on an actual executed segment before a line birth.
The history selects the first possible flow cut. The original residual
race has no atom there, even when the cut depends on the entire prefix. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def lineRecycledElapsed {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  (augRecycledPair cfg ε M hn s k ω).1.val.2-(augRecycledPair cfg ε M hn s (k+1) ω).1.val.2

theorem lineRecycledElapsed_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    lineRecycledElapsed cfg ε M hn s k ω=birthElapsed cfg ε M
      ((augRecycledPair cfg ε M hn s k ω).1,WinnerMarkLaw.firstMarkedRace hn
        (augRecycledPair cfg ε M hn s k ω).2) := by
  let x := ((augRecycledPair cfg ε M hn s k ω).1,WinnerMarkLaw.firstMarkedRace hn
    (augRecycledPair cfg ε M hn s k ω).2)
  change x.1.val.2-(augTimedStep cfg ε M x).val.2=birthElapsed cfg ε M x
  exact (birthElapsed_eq_remaining_drop cfg ε M x).symm

def lineStageHistoryExceeds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (N : ℕ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (A : Set (LineCutHistory cfg k))
    (f : LineCutHistory cfg k×ℝ→ℝ) (b : ℝ) : Set (BoardClockPath n) :=
  {ω | let a := lineCutHistory cfg ε M hn s k ω
       let v := a (Fin.last k)
       a∈A ∧ occupancy v.val.1.physical.process L=N ∧ ¬birthDone cfg v ∧
       ∃ t : ℝ, 0<t ∧ t≤lineRecycledElapsed cfg ε M hn s k ω ∧ b<f (a,t)}

theorem lineStageHistoryExceeds_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (s : AugTimedState cfg) (k : ℕ)
    (A : Set (LineCutHistory cfg k)) (hA : MeasurableSet A)
    (f : LineCutHistory cfg k×ℝ→ℝ) (hf : Measurable f) (hfc : ∀ a,Continuous (fun t=>f (a,t))) (b : ℝ) :
    MeasurableSet[augRecycledStateFiltration cfg ε M hn s (k+1)]
      (lineStageHistoryExceeds cfg ε M L N hn s k A f b) := by
  let m := augRecycledStateFiltration cfg ε M hn s
  let H := lineCutHistory cfg ε M hn s k
  have hH : Measurable[m k] H := comap_measurable _
  have hH' := hH.mono (m.mono (Nat.le_succ k)) le_rfl
  let v := fun a : LineCutHistory cfg k=>a (Fin.last k)
  have hv : Measurable[m (k+1)] (v ∘ H) := (measurable_pi_apply _).comp hH'
  let G := fun a : LineCutHistory cfg k=>augGuardTime cfg ε M (augTimedInput cfg (v a))
  have hG : Measurable G := (augGuardTime_measurable cfg ε M).comp
    ((augTimedInput_measurable cfg).comp (measurable_pi_apply _))
  have hd : Measurable[m (k+1)] (lineRecycledElapsed cfg ε M hn s k) :=
    (measurable_subtype_coe.snd.comp hv).sub
      (measurable_subtype_coe.snd.comp (StateHistory.state_measurable
        (fun j ω=>(augRecycledPair cfg ε M hn s j ω).1)
        (fun j=>(augRecycledPair_measurable cfg ε M hn s j).fst) (k+1)))
  have he : lineStageHistoryExceeds cfg ε M L N hn s k A f b =
      {ω | H ω∈A ∧ occupancy (v (H ω)).val.1.physical.process L=N ∧ ¬birthDone cfg (v (H ω)) ∧
        strictCutTime G f b (H ω)<lineRecycledElapsed cfg ε M hn s k ω} := by
    ext ω
    have hl : lineRecycledElapsed cfg ε M hn s k ω≤G (H ω) := by
      rw [lineRecycledElapsed_eq]
      exact (birthElapsed_mem cfg ε M _).2
    exact and_congr_right (fun _=>and_congr_right (fun _=>and_congr_right (fun _=>
      (strictCutTime_lt_iff_exceedance G f b (H ω) _ hl (hfc (H ω))).symm)))
  rw [he]
  have hO : Measurable[m (k+1)] (fun ω=>occupancy (v (H ω)).val.1.physical.process L) :=
    (ExtendedState.measurable_occupancy n L).comp
    ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp hv))
  have hOcc : MeasurableSet[m (k+1)] {ω | occupancy (v (H ω)).val.1.physical.process L=N} :=
    measurableSet_eq_fun hO measurable_const
  have hDone : Measurable[m (k+1)] (fun ω=>birthDone cfg (v (H ω))) :=
    (birthDone_measurable cfg).comp hv
  have hDead : MeasurableSet[m (k+1)] {ω | birthDone cfg (v (H ω))} :=
    @Measurable.setOf (BoardClockPath n) (m (k+1)) _ hDone
  have hLive : MeasurableSet[m (k+1)] {ω | ¬birthDone cfg (v (H ω))} := hDead.compl
  exact (hH' hA).inter (hOcc.inter (hLive.inter
    (measurableSet_lt ((strictCutTime_measurable G hG f hf b).comp hH') hd)))

theorem phaseLineForbiddenLaw_history_exceeds_ge {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) (k : ℕ) (A : Set (LineCutHistory cfg k)) (hA : MeasurableSet A)
    (f : LineCutHistory cfg k×ℝ→ℝ) (hf : Measurable f) (hfc : ∀ a,Continuous (fun t=>f (a,t))) (b : ℝ) :
    (boardClockMeasure n (cfg.B/n)).real (lineStageHistoryExceeds cfg ε M L N hn s k A f b)≤
      (phaseLineForbiddenLaw cfg ε M K L N hn s).real (lineStageHistoryExceeds cfg ε M L N hn s k A f b) := by
  let μ := boardClockMeasure n (cfg.B/n)
  have hr0 : 0<cfg.B/n := div_pos hB (by exact_mod_cast hn)
  letI := boardClockMeasure_probability n (cfg.B/n) hr0
  let W := BoardClockPath n
  let H := lineCutHistory cfg ε M hn s k
  let r := fun ω=>(augRecycledPair cfg ε M hn s k ω).2
  have hH : Measurable H := StateHistory.history_measurable _
    (fun j=>(augRecycledPair_measurable cfg ε M hn s j).fst) k
  have hr : Measurable r := (augRecycledPair_measurable cfg ε M hn s k).snd
  letI : IsProbabilityMeasure (μ.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let v := fun a : LineCutHistory cfg k=>a (Fin.last k)
  have hv : Measurable v := measurable_pi_apply _
  let G := fun a : LineCutHistory cfg k=>augGuardTime cfg ε M (augTimedInput cfg (v a))
  have hG : Measurable G := (augGuardTime_measurable cfg ε M).comp ((augTimedInput_measurable cfg).comp hv)
  let u := strictCutTime G f b
  have hu : Measurable u := strictCutTime_measurable G hG f hf b
  let A' : Set (LineCutHistory cfg k) :=
    {a | a∈A ∧ occupancy (v a).val.1.physical.process L=N ∧ (v a).val.1.physical.clocks L≤K ∧
      1≤lineStageDensity cfg K L N s (v a) ∧ ¬birthDone cfg (v a) ∧ u a<G a}
  have hx := (AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp hv)
  have hO := (ExtendedState.measurable_occupancy n L).comp hx
  have hKx := ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp hx
  have hA' : MeasurableSet A' := hA.inter ((hO.eq_const N).setOf.inter
    ((hKx.le' measurable_const).setOf.inter
      ((measurable_const.le' ((lineStageDensity_measurable cfg K L N s).comp hv)).setOf.inter
        (((birthDone_measurable cfg).comp hv).not.setOf.inter (measurableSet_lt hu hG)))))
  have hb (a : LineCutHistory cfg k) : u a∈Icc (0:ℝ) (G a) :=
    strictCutTime_bounds G f b a (augGuardTime_mem cfg ε M _ (v a).property.1.1).1
  have hgood : ∀ a∈A', let w := a (Fin.last k)
      occupancy w.val.1.physical.process L=N ∧ w.val.1.physical.clocks L≤K ∧
        1≤lineStageDensity cfg K L N s w ∧ ¬birthDone cfg w ∧
        0≤u a ∧ u a≤augGuardTime cfg ε M (augTimedInput cfg w) :=
    fun a ha=>⟨ha.2.1,ha.2.2.1,ha.2.2.2.1,ha.2.2.2.2.1,(hb a).1,(hb a).2⟩
  have hp : μ.map (fun ω=>(H ω,r ω))=(μ.map H).prod μ :=
    RecycledBoardProcess.history_residual_product (augRestartStep cfg ε M hn)
      (augRestartStep_measurable cfg ε M hn) μ (augRestartStep_map cfg ε M hn (cfg.B/n) hr0) s k
  let T := fun w : W=>BoardFirstCandidate.firstTime hn w
  have ht : Measurable T := BoardFirstCandidate.firstTime_measurable hn
  have hreg : ∀ᵐω∂μ,0<T (r ω) ∧ T (r ω)≠u (H ω) :=
    residual_sections_ae μ (μ.map H) μ (fun ω=>(H ω,r ω)) (hH.prodMk hr) hp
      (fun x=>0<T x.2 ∧ T x.2≠u x.1)
      ((measurable_const.lt (ht.comp measurable_snd)).and
        (((ht.comp measurable_snd).eq (hu.comp measurable_fst)).not))
      (fun a=>(BoardFirstCandidate.firstTime_ae_positive hn (cfg.B/n) hr0).and
        (actualFirstTime_ne_ae hn (cfg.B/n) hr0 (u a)))
  let E := lineStageHistoryExceeds cfg ε M L N hn s k A f b
  let E' := lineHistoryCutReached cfg ε M hn s k A' u
  have hEq : E =ᵐ[μ] E' := by
    filter_upwards [hreg] with ω hω
    apply propext
    let a := H ω
    let d := lineRecycledElapsed cfg ε M hn s k ω
    have hdG : d≤G a := by
      dsimp only [d]
      rw [lineRecycledElapsed_eq]
      exact (birthElapsed_mem cfg ε M _).2
    have he := strictCutTime_lt_iff_exceedance G f b a d hdG (hfc a)
    change (a∈A ∧ occupancy (v a).val.1.physical.process L=N ∧ ¬birthDone cfg (v a) ∧
      ∃ t : ℝ, 0<t ∧ t≤d ∧ b<f (a,t)) ↔ a∈A' ∧ u a≤d
    constructor
    · rintro ⟨ha,ho',hnd,hcross⟩
      have hlt : u a<d := he.mpr hcross
      have hregion := lineStageRegion_recycled cfg ε M K hKcfg L hsp N hN hn s ⟨ho.ge,fun _=>hk⟩ k ω
      have hD := lineStageDensity_recycled_ge_one cfg ε M K hKcfg hK L hsp N hN hn s ho hk k ω ho'
      exact ⟨⟨ha,ho',hregion.2 ho',hD,hnd,hlt.trans_le hdG⟩,hlt.le⟩
    · rintro ⟨ha,hud⟩
      have hnd := ha.2.2.2.2.1
      have hGu := ha.2.2.2.2.2
      have hde : d=min (G a) (T (r ω)) := by
        dsimp only [d]
        rw [lineRecycledElapsed_eq]
        change birthElapsed cfg ε M (v a,WinnerMarkLaw.firstMarkedRace hn (r ω))=_
        simp only [birthElapsed,if_neg hnd,augAdvance,cappedAdvance]
        exact max_eq_right (le_min (augGuardTime_mem cfg ε M _ (v a).property.1.1).1 hω.1.le)
      have hdu : u a<d := by
        rw [hde] at hud ⊢
        exact lt_min hGu (lt_of_le_of_ne ((le_min_iff.mp hud).2) hω.2.symm)
      exact ⟨ha.1,ha.2.1,hnd,he.mp hdu⟩
  have hpEq := measure_congr hEq
  have hqEq := measure_congr ((phaseLineForbiddenLaw_absolutelyContinuous cfg ε M K L N hn s).ae_le hEq)
  change (μ E).toReal≤((phaseLineForbiddenLaw cfg ε M K L N hn s) E).toReal
  rw [hpEq,hqEq]
  exact phaseLineForbiddenLaw_history_cut_ge_on_region cfg ε M K hKcfg hK L hsp N hN hn hB hm
    s ho hk k A' hA' u hu hgood

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineStageHistoryExceeds_history
#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_history_exceeds_ge

