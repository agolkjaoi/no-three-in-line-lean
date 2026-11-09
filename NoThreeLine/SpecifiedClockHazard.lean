import NoThreeLine.SelectedLineClockBound

/-! Within a real fixed-occupancy segment, the specified-line intensity
integrates exactly to a bounded function of the actual clock. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def specifiedClockHazardPotential (N : ℕ) (k : ℝ) : ℝ :=
  (2-(N:ℝ))*(Real.log 2-Real.log (2-k))

theorem specifiedClockHazardPotential_zero (N : ℕ) : specifiedClockHazardPotential N 0=0 := by
  simp [specifiedClockHazardPotential]

theorem specifiedClockHazardPotential_bounds (N : ℕ) (k K : ℝ)
    (hN : N≤1) (hk0 : 0≤k) (hkK : k≤K) (hK : K<2) :
    0≤specifiedClockHazardPotential N k ∧
      specifiedClockHazardPotential N k≤2*Real.log (2/(2-K)) := by
  have hNr : (N:ℝ)≤1 := by exact_mod_cast hN
  have hk2 : 0<2-k := by linarith
  have hK2 : 0<2-K := by linarith
  have hlow := Real.log_le_log hk2 (show 2-k≤(2:ℝ) by linarith)
  have hhigh := Real.log_le_log hK2 (show 2-K≤2-k by linarith)
  have hN0 : (0:ℝ)≤N := Nat.cast_nonneg N
  have hg : 0≤Real.log 2-Real.log (2-k) := sub_nonneg.mpr hlow
  constructor
  · exact mul_nonneg (by linarith) hg
  · rw [Real.log_div (by norm_num : (2:ℝ)≠0) hK2.ne']
    unfold specifiedClockHazardPotential
    nlinarith [mul_nonneg hN0 hg]

theorem specifiedClockHazardPotential_exp_le (N : ℕ) (k K : ℝ)
    (hN : N≤1) (hk0 : 0≤k) (hkK : k≤K) (hK : K<2) :
    Real.exp (specifiedClockHazardPotential N k)≤(2/(2-K))^2 := by
  have hr : 0<2/(2-K) := div_pos (by norm_num) (by linarith)
  calc
    _ ≤ Real.exp (2*Real.log (2/(2-K))) := Real.exp_le_exp.mpr
      (specifiedClockHazardPotential_bounds N k K hN hk0 hkK hK).2
    _ = (2/(2-K))^2 := by
      rw [show 2*Real.log (2/(2-K))=Real.log (2/(2-K))+Real.log (2/(2-K)) by ring,
        Real.exp_add,Real.exp_log hr]
      ring

theorem flow_specifiedClockHazard_hasDerivAt {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (z : ℝ→Coordinates n) (t : ℝ)
    (hs : s.stopped=false) (hsp : specified Γ L) (hN : occupancy s L≤1)
    (hk : (z t).2.1 L<2) (hd : HasDerivAt z (vectorField s Γ mask (z t)) t) :
    HasDerivAt (fun u=>specifiedClockHazardPotential (occupancy s L) ((z u).2.1 L))
      (lineIntensity s mask (z t) L) t := by
  have hk' := hasDerivAt_pi.mp hd.snd.fst L
  have hden : 2-(z t).2.1 L≠0 := by linarith
  have hN' : (occupancy s L:ℝ)≤1 := by exact_mod_cast hN
  have hNden : 2-(occupancy s L:ℝ)≠0 := by linarith
  have hh : HasDerivAt
      (fun u : ℝ=>(2-(occupancy s L:ℝ))*(Real.log 2-Real.log (2-(z u).2.1 L)))
      ((2-(occupancy s L:ℝ))*(0-(0-clockRHS s Γ mask (z t) L)/(2-(z t).2.1 L))) t :=
    ((hasDerivAt_const t (Real.log 2)).sub (((hasDerivAt_const t (2:ℝ)).sub hk').log hden)).const_mul _
  have he : (2-(occupancy s L:ℝ))*(0-(0-clockRHS s Γ mask (z t) L)/(2-(z t).2.1 L))=
      lineIntensity s mask (z t) L := by
    simp only [clockRHS,hs,hsp,hN,and_self,if_true]
    field_simp
    ring
  rw [he] at hh
  exact hh

theorem flow_specifiedLineIntensity_integral {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (mask : Grid n→ℝ) (L : LineIndex n) (T : ℝ) (z : ℝ→Coordinates n)
    (hs : s.stopped=false) (hsp : specified Γ L) (hN : occupancy s L≤1)
    (hz : ContinuousOn z (Icc 0 T))
    (hk : ∀u∈Icc (0:ℝ) T,(z u).2.1 L<2)
    (hd : ∀u∈Ioo (0:ℝ) T,HasDerivAt z (vectorField s Γ mask (z u)) u)
    (a b : ℝ) (ha : 0≤a) (hab : a≤b) (hb : b≤T) :
    (∫u in a..b,lineIntensity s mask (z u) L)=
      specifiedClockHazardPotential (occupancy s L) ((z b).2.1 L)-
      specifiedClockHazardPotential (occupancy s L) ((z a).2.1 L) := by
  have hsub : Icc a b⊆Icc (0:ℝ) T := Icc_subset_Icc ha hb
  have hlog : ContinuousOn (fun u : ℝ=>Real.log (2-(z u).2.1 L)) (Icc 0 T) :=
    (continuous_const.continuousOn.sub ((continuous_apply L).comp_continuousOn hz.snd.fst)).log
      (fun u hu=>by change 2-(z u).2.1 L≠0; have := hk u hu; linarith)
  have hc : ContinuousOn (fun u=>specifiedClockHazardPotential (occupancy s L) ((z u).2.1 L)) (Icc 0 T) :=
    (continuous_const.continuousOn.sub hlog).const_mul _
  have hi : IntervalIntegrable (fun u=>lineIntensity s mask (z u) L) volume a b := by
    apply ContinuousOn.intervalIntegrable
    simpa only [uIcc_of_le hab,Function.comp_def] using
      ((lineIntensity_contDiff s mask L).continuous.comp_continuousOn hz).mono hsub
  apply intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le hab (hc.mono hsub) _ hi
  intro u hu
  exact flow_specifiedClockHazard_hasDerivAt s Γ mask L z u hs hsp hN
    (hk u ⟨ha.trans hu.1.le,hu.2.le.trans hb⟩) (hd u ⟨ha.trans_lt hu.1,hu.2.trans_le hb⟩)

theorem selected_specifiedLineIntensity_integral {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hs : x.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.val.process L≤1) (hinit : x.val.clocks L≤K)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    (∫u in (0:ℝ)..t,lineIntensity x.val.process cfg.mask (selectedCurve cfg (x,u)) L)=
      specifiedClockHazardPotential (occupancy x.val.process L) ((selectedCurve cfg (x,t)).2.1 L)-
      specifiedClockHazardPotential (occupancy x.val.process L) (x.val.clocks L) := by
  have hspec := selectedCurve_spec cfg x he.2.1
  have hc : Continuous (fun u : ℝ=>selectedCurve cfg (x,u)) := by
    change Continuous (fun u : ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,u))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hh := flow_specifiedLineIntensity_integral x.val.process cfg.directions cfg.mask L
    (selectedGuardTime cfg x) (fun u=>selectedCurve cfg (x,u)) hs hsp hN hc.continuousOn
    (fun u hu=>(selectedCurve_specifiedClock_le cfg x he K hKcfg L hsp hN hinit u hu).trans_lt hK)
    (fun u hu=>(hspec.2.2.1 u ⟨hu.1.le,hu.2.le⟩).2.2.hasDerivAt (Icc_mem_nhds hu.1 hu.2))
    0 t le_rfl ht.1 ht.2
  simpa only [hspec.1,ExtendedState.coordinates] using hh

end NoThreeLine

#print axioms NoThreeLine.specifiedClockHazardPotential_exp_le
#print axioms NoThreeLine.flow_specifiedLineIntensity_integral
#print axioms NoThreeLine.selected_specifiedLineIntensity_integral
