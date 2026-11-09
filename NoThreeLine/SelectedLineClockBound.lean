import NoThreeLine.RawLineGuardBounds

/-! The real selected flow respects a specified-line clock cap even when
there is no active root on that line. Initial and stopped cases are explicit. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem selectedCurve_specifiedClock_le {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (he : x.val.Valid cfg.B) (K : ℝ) (hKcfg : cfg.K≤K)
    (L : LineIndex n) (hsp : specified cfg.directions L) (hN : occupancy x.val.process L≤1)
    (hinit : x.val.clocks L≤K) (t : ℝ) (ht : t∈Icc (0:ℝ) (selectedGuardTime cfg x)) :
    (selectedCurve cfg (x,t)).2.1 L≤K := by
  have hs := selectedCurve_spec cfg x he.2.1
  have hc : Continuous (fun u : ℝ=>selectedCurve cfg (x,u)) := by
    change Continuous (fun u : ℝ=>(selectedModeFlow cfg x.val.mode).curve (stateInitialBall x,u))
    exact (selectedModeFlow cfg x.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  by_cases hstop : x.val.process.stopped=false
  · by_cases hT : selectedGuardTime cfg x=0
    · have ht0 : t=0 := by rw [hT] at ht; exact le_antisymm ht.2 ht.1
      simpa only [ht0,hs.1,ExtendedState.coordinates] using hinit
    have hcl : closure (Ico (0:ℝ) (selectedGuardTime cfg x))=Icc 0 (selectedGuardTime cfg x) :=
      closure_Ico (Ne.symm hT)
    have hbefore : ∀u∈Ico (0:ℝ) (selectedGuardTime cfg x),(selectedCurve cfg (x,u)).2.1 L≤K := by
      intro u hu
      have hh : (selectedCurve cfg (x,u)).2.1 L<cfg.K := by
        by_contra hn
        apply hs.2.2.2.1 u hu
        simp only [pendingGuardSet,if_pos hstop,mem_union]
        exact Or.inl (Or.inr (mem_iUnion.mpr ⟨L,hsp,hN,le_of_not_gt hn⟩))
      exact hh.le.trans hKcfg
    exact le_on_closure hbefore ((continuous_apply L).comp hc.snd.fst).continuousOn
      continuous_const.continuousOn (by simpa only [hcl] using ht)
  · have hd : ∀u∈Ioo (0:ℝ) (selectedGuardTime cfg x),
        HasDerivAt (fun v=>selectedCurve cfg (x,v))
          (vectorField x.val.process cfg.directions cfg.mask (selectedCurve cfg (x,u))) u := by
      intro u hu
      exact (hs.2.2.1 u ⟨hu.1.le,hu.2.le⟩).2.2.hasDerivAt (Icc_mem_nhds hu.1 hu.2)
    rw [flow_clock_inactive_constant x.val.process cfg.directions cfg.mask _ hs.2.1.1 _
      hc.continuousOn hd L (fun h=>hstop h.1) t ht,hs.1]
    exact hinit

end NoThreeLine

#print axioms NoThreeLine.selectedCurve_specifiedClock_le
