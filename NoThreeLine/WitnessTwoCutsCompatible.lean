import NoThreeLine.WitnessCutAE
import NoThreeLine.SourceNestedCut

/-! The two-cut source-free estimate using the original nested-cut API.
This module avoids the duplicate names in the separately checked
SourceCutComposition branch and can be imported with SourceElapsedMean. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem source_free_nested_cuts_le_ae_earlier {n : ℕ} (cfg : FlowConfig n)
    (ε M start b : ℝ) (hb : 0≤b) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : cfg.K<2)
    (s : GoodObservation cfg) (hbR : b≤s.val.1.val.2)
    (F : ℝ→TimedObservation cfg→ℝ) (hF : ∀t,Measurable (F t))
    (A : ℝ) (hFA : ∀t v,0≤F t v ∧ F t v≤A) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo 0 (s.val.1.val.2-b),
    (∫ω,mixed cfg.directions C ∅ L (observedWitness cfg e (sourceCutTerminal cfg ε M start b hb hn s ω))*
      F t (sourceCutTerminal cfg ε M start (s.val.1.val.2-t)
        (sub_nonneg.mpr (ht.2.le.trans (sub_le_self _ hb))) hn s ω)
      ∂boardClockMeasure n (cfg.B/n))≤
    ∫ω,mixed cfg.directions C ∅ L (observedWitness cfg e
      (sourceCutTerminal cfg ε M start (s.val.1.val.2-t)
        (sub_nonneg.mpr (ht.2.le.trans (sub_le_self _ hb))) hn s ω))*
      F t (sourceCutTerminal cfg ε M start (s.val.1.val.2-t)
        (sub_nonneg.mpr (ht.2.le.trans (sub_le_self _ hb))) hn s ω)
      ∂boardClockMeasure n (cfg.B/n) := by
  let s₂ := sourceRestrictGood cfg b hb s
  have hR : s₂.val.1.val.2=s.val.1.val.2-b := sourceRestrictState_remaining cfg b hb s.val.1 hbR
  have he := source_free_terminal_actual_cut_le_ae_time cfg ε M (start-b) hn hB hm e C L hCL hK s₂ F hF A hFA
  filter_upwards [he] with t ht htI
  have ht₂ : t∈Ioo 0 s₂.val.1.val.2 := by rw [hR]; exact htI
  have hcut (ω : BoardClockPath n) : sourceCutTerminal cfg ε M (start-b) (s₂.val.1.val.2-t)
      (sub_nonneg.mpr ht₂.2.le) hn s₂ ω=
      sourceCutTerminal cfg ε M start (s.val.1.val.2-t)
        (sub_nonneg.mpr (htI.2.le.trans (sub_le_self _ hb))) hn s ω := by
    have h := sourceCutTerminal_add cfg ε M start b (s₂.val.1.val.2-t) hb (sub_nonneg.mpr ht₂.2.le) hn s ω
    have hsum : b+(s₂.val.1.val.2-t)=s.val.1.val.2-t := by rw [hR]; ring
    simpa only [hsum] using h
  have hh := ht ht₂
  simp only [hcut] at hh
  exact hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.source_free_nested_cuts_le_ae_earlier
