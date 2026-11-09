import NoThreeLine.StateWeightFlow
import NoThreeLine.CandidateCreditMean
import NoThreeLine.ExponentialFirstStep

/-! Connect an actual fixed-mode weight ODE to the actual mark update and
exponential first-step law. The interval must remain in the stated weight
region; existence up to a stopping boundary and iteration remain separate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem ProcessState.flow_candidateMean_continuousOn {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B T : ℝ)
    (hn : 0 < n) (hB : 0 < B) (hs : s.Valid)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (w : ℝ → Grid n → ℝ) (hw : ContinuousOn w (Icc 0 T))
    (hw0 : ∀ t ∈ Icc 0 T, ∀ q, 0 ≤ w t q)
    (hwB : ∀ t ∈ Icc 0 T, ∀ q, (s.accounts q).status = .active → w t q ≤ B)
    (positive : ℝ → Grid n → Grid n → Bool) (p : Grid n) :
    ContinuousOn (fun t => (s.withWeights (w t)).candidateCreditMean Γ mask B (positive t) p)
      (Icc 0 T) := by
  have hc := s.flow_credit_continuousOn w (Icc 0 T) hw p
  have hd := s.flow_drift_continuousOn Γ mask w (Icc 0 T) hw p
  have hrate : (n : ℝ)*B ≠ 0 := ne_of_gt (mul_pos (by exact_mod_cast hn) hB)
  apply (hc.sub (hd.div_const ((n : ℝ)*B))).congr
  intro t ht
  have hh := (s.withWeights (w t)).candidateCreditMean_compensation Γ mask B hn hB hm
    (fun q hq => ⟨hw0 t ht q,hwB t ht q hq⟩) (positive t) p
    (s.withWeights_valid (w t) hs (hw0 t ht))
  change (s.withWeights (w t)).candidateCreditMean Γ mask B (positive t) p =
    ((s.withWeights (w t)).accounts p).credit -
      (s.withWeights (w t)).continuousCreditDrift Γ ((s.withWeights (w t)).birthRate mask) p /
        ((n : ℝ)*B)
  field_simp
  nlinarith

/-- Expected credit after one genuine exponential waiting time, with the
actual uniform-mark birth operation averaged over all board labels, or at
the horizon if the wait exceeds it. No martingale/compensator is assumed. -/
theorem ProcessState.flow_first_candidate_credit {n : ℕ} (s : ProcessState n)
    (Γ : Finset (ℤ × ℤ)) (mask : Grid n → ℝ) (B T : ℝ)
    (hn : 0 < n) (hB : 0 < B) (hT : 0 ≤ T) (hs : s.Valid)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (w : ℝ → Grid n → ℝ) (hw : ContinuousOn w (Icc 0 T))
    (hw0 : ∀ t ∈ Icc 0 T, ∀ q, 0 ≤ w t q)
    (hwB : ∀ t ∈ Icc 0 T, ∀ q, (s.accounts q).status = .active → w t q ≤ B)
    (hwinit : w 0 = fun p => (s.accounts p).weight)
    (hd : ∀ t ∈ Ioo 0 T, HasDerivAt w (s.compensatedVectorField Γ mask (w t)) t)
    (positive : ℝ → Grid n → Grid n → Bool) (p : Grid n) :
    (∫ t, (if t ≤ T then (s.withWeights (w t)).candidateCreditMean Γ mask B (positive t) p
      else ((s.withWeights (w T)).accounts p).credit) ∂expMeasure ((n : ℝ)*B)) =
      (s.accounts p).credit := by
  have hz := s.flow_credit_continuousOn w (Icc 0 T) hw p
  have hJ := s.flow_candidateMean_continuousOn Γ mask B T hn hB hs hm w hw hw0 hwB positive p
  have hderiv : ∀ t ∈ Ioo 0 T,
      HasDerivAt (fun u => ((s.withWeights (w u)).accounts p).credit)
        (((n : ℝ)*B) * (((s.withWeights (w t)).accounts p).credit -
          (s.withWeights (w t)).candidateCreditMean Γ mask B (positive t) p)) t := by
    intro t ht
    have hti : t ∈ Icc (0 : ℝ) T := ⟨ht.1.le,ht.2.le⟩
    have hh := (s.withWeights (w t)).candidateCreditMean_compensation Γ mask B hn hB hm
      (fun q hq => ⟨hw0 t hti q,hwB t hti q hq⟩) (positive t) p
      (s.withWeights_valid (w t) hs (hw0 t hti))
    rw [← hh]
    exact s.flow_credit_hasDerivAt Γ mask w t p (hd t ht)
  have he := expMeasure_first_step_compensation ((n : ℝ)*B) T
    (mul_pos (by exact_mod_cast hn) hB) hT
    (fun t => ((s.withWeights (w t)).accounts p).credit)
    (fun t => (s.withWeights (w t)).candidateCreditMean Γ mask B (positive t) p)
    hz hJ hderiv
  simpa only [hwinit,s.withWeights_self] using he

end NoThreeLine

#print axioms NoThreeLine.ProcessState.flow_candidateMean_continuousOn
#print axioms NoThreeLine.ProcessState.flow_first_candidate_credit
