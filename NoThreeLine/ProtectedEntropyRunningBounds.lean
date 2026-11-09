import NoThreeLine.ProtectedEntropyUniformBounds
import NoThreeLine.ProtectedEntropyMeasurable

/-! A single finite bound for the actual running entropy source, uniform
over incoming protected states and their saved ledgers. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedRunningEntropySource_bounds_all {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg) (z : CandidateData n) :
    ‖protectedRunningEntropySource cfg ε M L p s z‖≤
      (cfg.horizon:ℝ)*protectedEntropySourceCap n cfg.B := by
  have hcap := protectedEntropySourceCap_nonneg n cfg.B hB.le
  unfold protectedRunningEntropySource
  split_ifs
  · simpa only [norm_zero] using mul_nonneg cfg.horizon.coe_nonneg hcap
  · have ha := augAdvance_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1 z.1.1
    have hg := augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1
    have hb := intervalIntegral.norm_integral_le_of_norm_le_const
      (f:=fun t=>protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2
        cfg.directions cfg.mask L p cfg.B) (a:=0) (b:=augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1))
      (fun t ht=>by
        rw [uIoc_of_le ha.1] at ht
        exact protectedEntropySource_bounds_all _ s.2 cfg.directions cfg.mask L hsp p hpL cfg.B hB
          (selectedTrajectory_valid cfg (augTimedInput cfg s.1).1.1 s.1.property.1.1 t
            ⟨ht.1.le,ht.2.trans (ha.2.trans hg.2)⟩) (fun q=>⟨cfg.mask_nonneg q,hm q⟩))
    simp only [sub_zero,abs_of_nonneg ha.1] at hb
    calc
      _ ≤ protectedEntropySourceCap n cfg.B*augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1) := hb
      _ ≤ protectedEntropySourceCap n cfg.B*(cfg.horizon:ℝ) := mul_le_mul_of_nonneg_left
        (ha.2.trans ((augGuardTime_le_remaining cfg ε M _ s.1.property.2.1).trans s.1.property.2.2)) hcap
      _ = _ := by ring

theorem protectedRunningEntropySource_integrable_all {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hpL : p∈L.val)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (μ : Measure (ProtectedTimedState cfg×CandidateData n)) [IsFiniteMeasure μ] :
    Integrable (fun z=>protectedRunningEntropySource cfg ε M L p z.1 z.2) μ := by
  apply (integrable_const ((cfg.horizon:ℝ)*protectedEntropySourceCap n cfg.B)).mono'
    (protectedRunningEntropySource_joint_measurable cfg ε M L p).aestronglyMeasurable
  exact ae_of_all _ (fun z=>protectedRunningEntropySource_bounds_all cfg ε M L hsp p hpL hB hm z.1 z.2)

end NoThreeLine
#print axioms NoThreeLine.protectedRunningEntropySource_bounds_all
#print axioms NoThreeLine.protectedRunningEntropySource_integrable_all
