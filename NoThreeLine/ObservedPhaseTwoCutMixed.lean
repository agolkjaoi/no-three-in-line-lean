import NoThreeLine.WitnessCutWhole
import NoThreeLine.SourceNestedCut
import NoThreeLine.ObservedPhaseCutTower

/-! The actual source-free two-cut mixed inequality is integrated over
an arbitrary inherited phase-state law. No eta floor or moment estimate
is assumed: those enter only after this actual mixed comparison. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem phase_two_cut_mixed_le_ae_earlier {n : ℕ} (cfg : FlowConfig n)
    (ε M start v : ℝ) (hv : v∈Icc 0 (cfg.horizon:ℝ)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (e : Retention n) (C L : Finset (Grid n))
    (hCL : C⊆L) (hK : cfg.K<2)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ]
    (F : ℝ→TimedObservation cfg→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐu : ℝ ∂volume,u∈Ioo 0 v →
    (∫x,mixed cfg.directions C ∅ L (observedWitness cfg e
        (phaseCutObservation cfg ε M start hn ((x.1,v),x.2)))*
      F u (phaseCutObservation cfg ε M start hn ((x.1,u),x.2))
      ∂μ.prod (boardClockMeasure n (cfg.B/n)))≤
    ∫x,mixed cfg.directions C ∅ L (observedWitness cfg e
        (phaseCutObservation cfg ε M start hn ((x.1,u),x.2)))*
      F u (phaseCutObservation cfg ε M start hn ((x.1,u),x.2))
      ∂μ.prod (boardClockMeasure n (cfg.B/n)) := by
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let b : ℝ := cfg.horizon-v
  have hb : 0≤b := sub_nonneg.mpr hv.2
  let initial := fun s : GoodPhaseObservation n cfg.B=>sourceRestrictGood cfg b hb (goodPhaseStart cfg ε M s)
  have hi : Measurable initial := (sourceRestrictGood_measurable cfg b hb).comp (goodPhaseStart_measurable cfg ε M)
  have hRv (s : GoodPhaseObservation n cfg.B) : (initial s).val.1.val.2=v := by
    have hh := sourceRestrictState_remaining cfg b hb (goodPhaseStart cfg ε M s).val.1
      (by change (cfg.horizon:ℝ)-v≤cfg.horizon; linarith [hv.1])
    change (initial s).val.1.val.2=(cfg.horizon:ℝ)-b at hh
    dsimp only [b] at hh
    simpa using hh
  let a := fun i (x : GoodPhaseObservation n cfg.B×BoardClockPath n)=>v-
    (observedRecycledPair cfg ε M (start-b) hn (initial x.1).val i x.2).1.1.val.2
  have ha (i : ℕ) : Measurable (a i) := measurable_const.sub
    ((observedRecycledPair_joint_measurable cfg ε M (start-b) hn i).comp
      ((hi.comp measurable_fst).subtype_val.prodMk measurable_snd)).fst.fst.subtype_val.snd
  have he := ae_time_avoids_random_endpoints (μ.prod ν) a ha
  filter_upwards [he] with u hu huI
  have huH : u≤(cfg.horizon:ℝ) := huI.2.le.trans hv.2
  let U := fun x : GoodPhaseObservation n cfg.B×BoardClockPath n=>phaseCutObservation cfg ε M start hn ((x.1,u),x.2)
  let V := fun x : GoodPhaseObservation n cfg.B×BoardClockPath n=>phaseCutObservation cfg ε M start hn ((x.1,v),x.2)
  have hU : Measurable U := (phaseCutObservation_measurable cfg ε M start hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  have hV : Measurable V := (phaseCutObservation_measurable cfg ε M start hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  let f := fun x : GoodPhaseObservation n cfg.B×BoardClockPath n=>mixed cfg.directions C ∅ L (observedWitness cfg e (V x))*F u (U x)
  let g := fun x : GoodPhaseObservation n cfg.B×BoardClockPath n=>mixed cfg.directions C ∅ L (observedWitness cfg e (U x))*F u (U x)
  have hf : Measurable f := ((mixed_measurable cfg.directions C ∅ L).comp
    ((observedWitness_measurable cfg e).comp hV)).mul ((hF u).comp hU)
  have hg : Measurable g := ((mixed_measurable cfg.directions C ∅ L).comp
    ((observedWitness_measurable cfg e).comp hU)).mul ((hF u).comp hU)
  have hvalid (s : GoodPhaseObservation n cfg.B) (t : ℝ) (ω : BoardClockPath n) :
      (observedWitness cfg e (phaseCutObservation cfg ε M start hn ((s,t),ω))).Valid cfg.B :=
    observedWitness_valid cfg e _ (sourceCutTerminal_consistent cfg ε M start _ _ hn _ _)
  have hfi : Integrable f (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (mixedCap C cfg.B*A)
    (fun x=>⟨mul_nonneg (mixed_nonneg _ _ _ _ _ _ (hvalid x.1 v x.2)) (hFA u (U x)).1,
      mul_le_mul (mixed_le_cap _ _ _ _ _ _ (hvalid x.1 v x.2)) (hFA u (U x)).2
        (hFA u (U x)).1 (mixedCap_nonneg C cfg.B)⟩)
  have hgi : Integrable g (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (mixedCap C cfg.B*A)
    (fun x=>⟨mul_nonneg (mixed_nonneg _ _ _ _ _ _ (hvalid x.1 u x.2)) (hFA u (U x)).1,
      mul_le_mul (mixed_le_cap _ _ _ _ _ _ (hvalid x.1 u x.2)) (hFA u (U x)).2
        (hFA u (U x)).1 (mixedCap_nonneg C cfg.B)⟩)
  change (∫x,f x ∂μ.prod ν)≤∫x,g x ∂μ.prod ν
  rw [integral_prod _ hfi,integral_prod _ hgi]
  apply integral_mono_ae hfi.integral_prod_left hgi.integral_prod_left
  filter_upwards [Measure.ae_ae_of_ae_prod hu] with s hs
  have hu0 : 0≤v-u := sub_nonneg.mpr huI.2.le
  have hcut : v-u<(initial s).val.1.val.2 := by rw [hRv]; linarith [huI.1]
  have hh := source_free_terminal_actual_cut_le_of_ae_avoid cfg ε M (start-b) (v-u) hu0 hn hB hm
    e C L hCL hK (initial s) hcut (F u) (hF u) A (hFA u) (by
      filter_upwards [hs] with ω hω i
      intro h
      apply hω i
      dsimp only [a]
      linarith)
  have hlate (ω : BoardClockPath n) : observedRecycledTerminal cfg ε M (start-b) hn ((initial s).val,ω)=V (s,ω) := by
    simp only [V,phaseCutObservation,elapsedCutAmount_coe _ _ hv.2,b,initial,sourceCutTerminal]
  have hearly (ω : BoardClockPath n) : sourceCutTerminal cfg ε M (start-b) (v-u) hu0 hn (initial s) ω=U (s,ω) := by
    have hh := sourceCutTerminal_add cfg ε M start b (v-u) hb hu0 hn (goodPhaseStart cfg ε M s) ω
    have hsum : b+(v-u)=(cfg.horizon:ℝ)-u := by dsimp only [b]; ring
    simpa only [hsum,U,phaseCutObservation,elapsedCutAmount_coe _ _ huH] using hh
  simpa only [hlate,hearly,f,g] using hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phase_two_cut_mixed_le_ae_earlier
