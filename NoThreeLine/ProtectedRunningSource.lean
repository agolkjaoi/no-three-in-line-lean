import NoThreeLine.ProtectedFirstSource

/-! The real positive source accumulated up to the actual candidate or
physical/auxiliary cap. This pathwise quantity is distinct from its
first-step source mean; no change-of-law expectation identity is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem selectedProtectedSource_bounds {n : ℕ} (cfg : FlowConfig n) (x : StateBall n cfg.box)
    (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (p : Grid n) (hB : 0≤cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hN : occupancy x.val.process L≤1) (hk : x.val.clocks L≤K)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    0≤protectedLinePositiveDrift (selectedTrajectory cfg (x,t)) cfg.mask L p ∧
      protectedLinePositiveDrift (selectedTrajectory cfg (x,t)) cfg.mask L p≤(cfg.B/n)*cfg.B := by
  have hv := selectedTrajectory_valid cfg x he t ht
  have hclock := selectedCurve_specifiedClock_le cfg x he K hKcfg L hsp hN hk t ht
  have hc := specifiedLineWeight_bounds (selectedTrajectory cfg (x,t)) L p cfg.B K hv hN hclock hK
  have hg := protectedLinePositiveDrift_bounds (selectedTrajectory cfg (x,t)) cfg.mask L p cfg.B K hv
    (fun q=>⟨cfg.mask_nonneg q,hm q⟩) hN hclock hK
  refine ⟨hg.1,?_⟩
  calc
    _ ≤ ((cfg.B/n)/2)*(2*cfg.B) := hg.2.trans
      (mul_le_mul_of_nonneg_left hc.2 (div_nonneg (div_nonneg hB (Nat.cast_nonneg n)) (by norm_num)))
    _ = _ := by ring

def protectedRunningSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (x : AugTimedState cfg×CandidateData n) : ℝ :=
  if x.1.val.2≤0 ∨ x.1.val.1.physical.process.stopped=true then 0 else
    ∫t in (0:ℝ)..augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1),
      protectedLinePositiveDrift (selectedTrajectory cfg ((augTimedInput cfg x.1).1.1,t)) cfg.mask L p

theorem protectedRunningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) : Measurable (protectedRunningSource cfg ε M L p) := by
  have hd : Measurable (fun x : AugTimedState cfg×CandidateData n=>x.1.val.2≤0 ∨
      x.1.val.1.physical.process.stopped=true) :=
    ((measurable_subtype_coe.snd.comp measurable_fst).le' measurable_const).or
      (((ProcessState.measurable_stopped n).comp ((ExtendedState.measurable_process n).comp
        ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.fst.comp measurable_fst)))).eq_const true)
  have hA : Measurable (fun x : AugTimedState cfg×CandidateData n=>
      augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1)) :=
    (augAdvance_measurable cfg ε M).comp
      (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd.fst.fst)
  have hx : Measurable (fun z : (AugTimedState cfg×CandidateData n)×ℝ=>((augTimedInput cfg z.1.1).1.1,z.2)) :=
    (((augTimedInput_measurable cfg).comp measurable_fst.fst).fst.fst).prodMk measurable_snd
  have hf := (protectedLinePositiveDrift_measurable cfg.mask L p).comp ((selectedTrajectory_measurable cfg).comp hx)
  exact Measurable.ite hd.setOf measurable_const
    (variable_running_integral_measurable _ hA (fun x=>(augAdvance_mem cfg ε M _ x.1.property.1.1 x.2.1.1).1) _ hf)

theorem protectedRunningSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hB : 0≤cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg)
    (hN : occupancy s.val.1.physical.process L≤1) (hk : s.val.1.physical.clocks L≤K)
    (z : CandidateData n) :
    0≤protectedRunningSource cfg ε M L p (s,z) ∧
      protectedRunningSource cfg ε M L p (s,z)≤(cfg.horizon:ℝ)*((cfg.B/n)*cfg.B) := by
  have hcap : 0≤(cfg.B/n)*cfg.B := mul_nonneg (div_nonneg hB (Nat.cast_nonneg n)) hB
  unfold protectedRunningSource
  split_ifs
  · exact ⟨le_rfl,mul_nonneg cfg.horizon.coe_nonneg hcap⟩
  · have ha := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    have hT := augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1
    have hi := integral_initial_segment_bounds _ _ ha.1 ha.2
      (fun t=>protectedLinePositiveDrift (selectedTrajectory cfg ((augTimedInput cfg s).1.1,t)) cfg.mask L p)
      (selectedProtectedSource_continuous cfg (augTimedInput cfg s).1.1 L p).measurable
      ((cfg.B/n)*cfg.B) hcap (fun t ht=>
        selectedProtectedSource_bounds cfg (augTimedInput cfg s).1.1 s.property.1.1 K hKcfg hK L hsp p hB hm hN hk
          t ⟨ht.1.le,ht.2.le.trans hT.2⟩)
    exact ⟨hi.1,hi.2.trans (mul_le_mul_of_nonneg_right
      ((augGuardTime_le_remaining cfg ε M _ s.property.2.1).trans s.property.2.2) hcap)⟩

theorem protectedRunningSource_firstForbidden_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg)
    (hN : occupancy s.val.1.physical.process L≤1) (hk : s.val.1.physical.clocks L≤K) :
    Integrable (fun ω=>protectedRunningSource cfg ε M L p (s,WinnerMarkLaw.firstMarkedRace hn ω))
      (firstLineForbiddenLaw cfg ε M L hn s) := by
  letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm s hN hk
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((protectedRunningSource_measurable cfg ε M L p).comp
      (measurable_const.prodMk (WinnerMarkLaw.firstMarkedRace_measurable hn)))
    ((cfg.horizon:ℝ)*((cfg.B/n)*cfg.B))
    (fun ω=>protectedRunningSource_bounds cfg ε M K hKcfg hK L hsp p hB.le hm s hN hk _)

end NoThreeLine

#print axioms NoThreeLine.protectedRunningSource_measurable
#print axioms NoThreeLine.protectedRunningSource_firstForbidden_integrable
