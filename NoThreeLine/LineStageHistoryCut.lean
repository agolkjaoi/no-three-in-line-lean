import NoThreeLine.LineStageCutReached
import NoThreeLine.LineStageHistoryComparison
import NoThreeLine.WitnessCrossingIteration

/-! Compare the original and forbidden-line laws at a cut chosen from
the complete observed history. The cut may be the actual guard endpoint.
Only the incoming history must still belong to the original occupancy
stage. A line birth at a later time does not exclude the event. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

abbrev LineCutHistory {n : ℕ} (cfg : FlowConfig n) (k : ℕ) := Fin (k+1) → AugTimedState cfg

def lineCutHistory {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) : BoardClockPath n → LineCutHistory cfg k :=
  StateHistory.history (fun i ω=>(augRecycledPair cfg ε M hn s i ω).1) k

def lineHistoryCutReached {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (A : Set (LineCutHistory cfg k)) (u : LineCutHistory cfg k → ℝ) :
    Set (BoardClockPath n) :=
  {ω | lineCutHistory cfg ε M hn s k ω∈A ∧
    u (lineCutHistory cfg ε M hn s k ω)≤(augRecycledPair cfg ε M hn s k ω).1.val.2-
      (augRecycledPair cfg ε M hn s (k+1) ω).1.val.2}

theorem lineHistoryCutReached_history {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (A : Set (LineCutHistory cfg k)) (hA : MeasurableSet A)
    (u : LineCutHistory cfg k → ℝ) (hu : Measurable u) :
    MeasurableSet[augRecycledStateFiltration cfg ε M hn s (k+1)]
      (lineHistoryCutReached cfg ε M hn s k A u) := by
  let m := augRecycledStateFiltration cfg ε M hn s
  have hh : Measurable[m k] (lineCutHistory cfg ε M hn s k) := comap_measurable _
  have hh' := hh.mono (m.mono (Nat.le_succ k)) le_rfl
  have ht (i : ℕ) (hi : i≤k+1) :
      Measurable[m (k+1)] (fun ω=>(augRecycledPair cfg ε M hn s i ω).1.val.2) := by
    exact measurable_subtype_coe.snd.comp
      ((StateHistory.state_measurable (fun j ω=>(augRecycledPair cfg ε M hn s j ω).1)
        (fun j=>(augRecycledPair_measurable cfg ε M hn s j).fst) i).mono (m.mono hi) le_rfl)
  exact (hh' hA).inter (measurableSet_le (hu.comp hh') ((ht k (Nat.le_succ k)).sub (ht (k+1) le_rfl)))

theorem lineStageDensity_factor {n : ℕ} (cfg : FlowConfig n) (K : ℝ) (L : LineIndex n) (N : ℕ)
    (s v w : AugTimedState cfg) (ho : occupancy v.val.1.physical.process L=N)
    (hk : v.val.1.physical.clocks L≤K) :
    lineStageDensity cfg K L N s w =
      lineStageDensity cfg K L N s v * lineStageDensity cfg K L N v w := by
  let P := fun x : AugTimedState cfg => specifiedClockHazardPotential N (x.val.1.physical.clocks L)
  have hv : lineStageValue cfg K L N v=Real.exp (P v) := by simp [lineStageValue, P, ho, hk]
  have he : Real.exp (P v)*Real.exp (-P v)=1 := by rw [←Real.exp_add,add_neg_cancel,Real.exp_zero]
  calc
    _ = Real.exp (-P s) * ((Real.exp (P v)*Real.exp (-P v))*lineStageValue cfg K L N w) := by
      rw [he,one_mul]
      rfl
    _ = _ := by simp only [lineStageDensity,hv,P]; ring

theorem phaseLineForbiddenLaw_history_cut_ge_on_region {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) (k : ℕ)
    (A : Set (LineCutHistory cfg k)) (hA : MeasurableSet A)
    (u : LineCutHistory cfg k → ℝ) (hu : Measurable u)
    (hgood : ∀ a∈A, let v := a (Fin.last k)
      occupancy v.val.1.physical.process L=N ∧ v.val.1.physical.clocks L≤K ∧
        1≤lineStageDensity cfg K L N s v ∧ ¬birthDone cfg v ∧
        0≤u a ∧ u a≤augGuardTime cfg ε M (augTimedInput cfg v)) :
    (boardClockMeasure n (cfg.B/n)).real (lineHistoryCutReached cfg ε M hn s k A u)≤
      (phaseLineForbiddenLaw cfg ε M K L N hn s).real (lineHistoryCutReached cfg ε M hn s k A u) := by
  classical
  let μ := boardClockMeasure n (cfg.B/n)
  have hr0 : 0<cfg.B/n := div_pos hB (by exact_mod_cast hn)
  letI := boardClockMeasure_probability n (cfg.B/n) hr0
  let W := BoardClockPath n
  let H := lineCutHistory cfg ε M hn s k
  let r := fun ω=>(augRecycledPair cfg ε M hn s k ω).2
  have hH : Measurable H := StateHistory.history_measurable _
    (fun j=>(augRecycledPair_measurable cfg ε M hn s j).fst) k
  have hr : Measurable r := (augRecycledPair_measurable cfg ε M hn s k).snd
  have hp : μ.map (fun ω=>(H ω,r ω))=(μ.map H).prod μ :=
    RecycledBoardProcess.history_residual_product (augRestartStep cfg ε M hn)
      (augRestartStep_measurable cfg ε M hn) μ (augRestartStep_map cfg ε M hn (cfg.B/n) hr0) s k
  letI : IsProbabilityMeasure (μ.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let v := fun a : LineCutHistory cfg k => a (Fin.last k)
  let q := fun x : LineCutHistory cfg k × W => augTimedClockStep cfg ε M hn (v x.1,x.2)
  have hv : Measurable v := measurable_pi_apply _
  have hq : Measurable q := (augTimedClockStep_measurable cfg ε M hn).comp
    ((hv.comp measurable_fst).prodMk measurable_snd)
  let D := lineStageDensity cfg K L N s
  let U : Set (LineCutHistory cfg k × W) :=
    {x | x.1∈A ∧ u x.1≤(v x.1).val.2-(q x).val.2}
  have hU : MeasurableSet U := (measurable_fst hA).inter
    (measurableSet_le (hu.comp measurable_fst)
      ((measurable_subtype_coe.snd.comp (hv.comp measurable_fst)).sub
        (measurable_subtype_coe.snd.comp hq)))
  let f := U.indicator (fun _ => (1:ℝ))
  let g := U.indicator (fun x => D (q x))
  have hf : Measurable f := measurable_const.indicator hU
  have hg : Measurable g := ((lineStageDensity_measurable cfg K L N s).comp hq).indicator hU
  have hfI := GenericCreditIteration.bounded_nonnegative_integrable ((μ.map H).prod μ) f hf 1
    (fun x=>by by_cases hx : x∈U <;> simp [f,hx])
  have hgI := GenericCreditIteration.bounded_nonnegative_integrable ((μ.map H).prod μ) g hg ((2/(2-K))^2)
    (fun x=>by
      by_cases hx : x∈U
      · simpa [g,hx,D] using lineStageDensity_bounds cfg K hK L N hN s (q x) hk
      · simp [g,hx,sq_nonneg])
  have hsection (a : LineCutHistory cfg k) : (∫ w,f (a,w) ∂μ)≤∫ w,g (a,w) ∂μ := by
    by_cases ha : a∈A
    · obtain ⟨hvo,hvk,hD,hd,hu0,huT⟩ := hgood a ha
      let E := firstLineCutReached cfg ε M hn (v a) (u a)
      have hEh := firstLineCutReached_history cfg ε M hn (v a) (u a)
      have hE := (augRecycledStateFiltration cfg ε M hn (v a)).le 1 E hEh
      have htest (w : W) : (a,w)∈U ↔ w∈E := by
        change (a∈A ∧ u a≤(v a).val.2-(q (a,w)).val.2) ↔
          u a≤(v a).val.2-(augRecycledPair cfg ε M hn (v a) 1 w).1.val.2
        simp only [ha,true_and]
        rfl
      have hfe : (fun w => f (a,w)) = E.indicator (fun _ => (1:ℝ)) := by
        funext w
        by_cases hw : w∈E
        · simp [f,hw,(htest w).mpr hw]
        · simp [f,hw,mt (htest w).mp hw]
      have hge : (fun w => g (a,w)) =
          fun w=>D (v a)*E.indicator (fun w=>lineStageDensity cfg K L N (v a)
            (augRecycledPair cfg ε M hn (v a) 1 w).1) w := by
        funext w
        dsimp only [g]
        by_cases hw : w∈E
        · rw [indicator_of_mem ((htest w).mpr hw),indicator_of_mem hw]
          exact lineStageDensity_factor cfg K L N s (v a) (q (a,w)) hvo hvk
        · rw [indicator_of_notMem (mt (htest w).mp hw),indicator_of_notMem hw,mul_zero]
      rw [hfe,hge,integral_indicator hE,setIntegral_const,smul_eq_mul,mul_one,
        integral_const_mul,integral_indicator hE,
        ← phaseLineForbiddenLaw_history_event cfg ε M K hKcfg hK L hsp N hN hn hB hm
          (v a) hvo hvk 1 E hEh]
      exact (phaseLineForbiddenLaw_firstCutReached_ge cfg ε M K hKcfg hK L hsp N hN hn hB hm
        (v a) hvo hvk (u a) hd hu0 huT).trans (le_mul_of_one_le_left ENNReal.toReal_nonneg hD)
    · have hnU (w : W) : (a,w)∉U := fun hw=>ha hw.1
      simp only [f,g,indicator_of_notMem (hnU _),integral_zero,le_rfl]
  have hle := independent_pair_integral_le_fibers μ μ H r hH hr hp f g hf hg hfI hgI hsection
  let E := lineHistoryCutReached cfg ε M hn s k A u
  have hEh := lineHistoryCutReached_history cfg ε M hn s k A hA u hu
  have hE := (augRecycledStateFiltration cfg ε M hn s).le (k+1) E hEh
  have htest (ω : W) : (H ω,r ω)∈U ↔ ω∈E := Iff.rfl
  have hfe : (fun ω=>f (H ω,r ω))=E.indicator (fun _=>(1:ℝ)) := by
    funext ω
    by_cases hω : ω∈E
    · simp [f,hω,(htest ω).mpr hω]
    · simp [f,hω,mt (htest ω).mp hω]
  have hge : (fun ω=>g (H ω,r ω))=
      E.indicator (fun ω=>D (augRecycledPair cfg ε M hn s (k+1) ω).1) := by
    funext ω
    by_cases hω : ω∈E
    · simp only [g,indicator_of_mem ((htest ω).mpr hω),indicator_of_mem hω]
      rfl
    · simp [g,hω,mt (htest ω).mp hω]
  rw [hfe,hge,integral_indicator hE,integral_indicator hE,setIntegral_const,smul_eq_mul,mul_one] at hle
  rw [phaseLineForbiddenLaw_history_event cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk (k+1) E hEh]
  exact hle

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_history_cut_ge_on_region

