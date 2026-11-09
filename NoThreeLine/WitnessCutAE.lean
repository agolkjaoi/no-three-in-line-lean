import NoThreeLine.WitnessCutWhole
import NoThreeLine.ObservedCutAETower

/-! For almost every real cut time, actual terminal source-free mixed is
bounded by actual cut mixed against any bounded nonnegative cut test. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem source_free_terminal_actual_cut_le_ae_time {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : cfg.K<2)
    (s : GoodObservation cfg) (F : ℝ→TimedObservation cfg→ℝ) (hF : ∀t,Measurable (F t))
    (A : ℝ) (hFA : ∀t v,0≤F t v ∧ F t v≤A) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo 0 s.val.1.val.2,
    (∫ω,mixed cfg.directions C ∅ L (observedWitness cfg e (observedRecycledTerminal cfg ε M start hn (s.val,ω)))*
      F t (sourceCutTerminal cfg ε M start (s.val.1.val.2-t) (sub_nonneg.mpr ht.2.le) hn s ω)
      ∂boardClockMeasure n (cfg.B/n))≤
    ∫ω,mixed cfg.directions C ∅ L (observedWitness cfg e
      (sourceCutTerminal cfg ε M start (s.val.1.val.2-t) (sub_nonneg.mpr ht.2.le) hn s ω))*
      F t (sourceCutTerminal cfg ε M start (s.val.1.val.2-t) (sub_nonneg.mpr ht.2.le) hn s ω)
      ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have havoid := ae_time_avoids_random_endpoints (boardClockMeasure n (cfg.B/n))
    (fun i ω=>s.val.1.val.2-(observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2)
    (fun i=>measurable_const.sub (observedRecycledPair_measurable cfg ε M start hn s.val i).fst.fst.subtype_val.snd)
  filter_upwards [havoid] with t ht htI
  apply source_free_terminal_actual_cut_le_of_ae_avoid cfg ε M start (s.val.1.val.2-t)
    (sub_nonneg.mpr htI.2.le) hn hB hm e C L hCL hK s (by linarith [htI.1]) (F t) (hF t) A (hFA t)
  filter_upwards [ht] with ω hω i
  intro he
  exact hω i (by linarith)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.source_free_terminal_actual_cut_le_ae_time
