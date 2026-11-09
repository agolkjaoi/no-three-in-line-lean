import NoThreeLine.RecycledRawWeightCap

/-! A raw cap charges the initial growth potential, so the specified-clock
budget is paid only once even when the phase itself has many predecessors. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines LineDrift

theorem recycled_raw_weight_cap_requires_potential_risk {n : ℕ} (cfg : FlowConfig n) (ε M K ρ : ℝ) (hn : 0<n)
    (hKcfg : cfg.K≤K) (hρcfg : ρ≤cfg.rho) (hK0 : 0≤K) (hK : K<2)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hg : ActiveLineGuardBounds cfg.directions K ρ s.val.1.physical)
    (hf : s.val.1.physical.process.ActiveWeightFloor cfg.directions)
    (p : Grid n) (k : ℕ) (ω : BoardClockPath n) :
    let sk := (augRecycledPair cfg ε M hn s k ω).1
    let zk := WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2
    ¬(sk.val.2≤0 ∨ sk.val.1.physical.process.stopped=true) →
    ((augRawOutcome cfg ε M (augTimedInput cfg sk,zk)).physical.process.accounts p).status=.active →
    cfg.B≤((augRawOutcome cfg ε M (augTimedInput cfg sk,zk)).physical.process.accounts p).weight →
    Real.log cfg.B-weightGrowthPotential cfg.directions K p s.val.1.physical-
        (cfg.B/n)*s.val.2-(cfg.directions.card*K)/(2-K)≤
      recycledOutsideRiskCost cfg ε M hn p s (k+1) ω := by
  dsimp only
  intro hd hp hcap
  let sk := (augRecycledPair cfg ε M hn s k ω).1
  let zk := WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2
  let x := augTimedInput cfg sk
  let raw := (augRawOutcome cfg ε M (x,zk)).physical
  have hs : sk.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
  have hpa : p∈sk.val.1.physical.process.activeEvents :=
    BirthWitness.augRawOutcome_active_subset cfg ε M (x,zk) ((ProcessState.mem_activeEvents _ p).mpr hp)
  have hp0 := (ProcessState.mem_activeEvents _ p).mp hpa
  have hgk := augRecycledPair_activeLineGuardBounds cfg ε M K ρ hn hKcfg hρcfg s hg k ω
  have hfk := augRecycledPair_activeWeightFloor cfg ε M hn s hf k ω
  have hprev := recycled_growthPotential_le cfg ε M K ρ hn hKcfg hρcfg hK hB hm s hg hf p k ω hp0
  have hraw := augRawOutcome_log_growth_le cfg ε M x sk.property.1.1 K ρ hKcfg hρcfg hK hgk hfk hB hm hs zk p hp
  have hden : 0<2-K := by linarith
  have htime := augAdvance_mem cfg ε M x sk.property.1.1 zk.1.1
  have htime' := htime.2.trans (augGuardTime_le_remaining cfg ε M x sk.property.2.1)
  have hguards := selectedTrajectory_activeLineGuardBounds cfg x.1.1 sk.property.1.1 K ρ hKcfg hρcfg hgk
    (augAdvance cfg ε M (x,zk.1.1)) ⟨htime.1,htime.2.trans (augGuardTime_mem cfg ε M x sk.property.1.1).2⟩
  have hclock : rootDesignatedClock cfg.directions p raw.clocks≤cfg.directions.card*K := by
    apply rootDesignatedClock_le _ _ _ _ hK0
    intro L hL
    change (augRawOutcome cfg ε M (x,zk)).physical.clocks L≤K
    rw [augRawOutcome_clocks_eq_pre]
    exact (hguards p hpa L (root_mem_designated cfg.directions p L.val hL)).1
      (designated_specified cfg.directions p L hL)
  have hcaplog : Real.log cfg.B≤Real.log (raw.process.accounts p).weight := Real.log_le_log hB hcap
  have hclockdiv := div_le_div_of_nonneg_right hclock hden.le
  have hself := mul_le_mul_of_nonneg_left htime' (div_nonneg hB.le (Nat.cast_nonneg n))
  change (cfg.B/n)*augAdvance cfg ε M (x,zk.1.1)≤(cfg.B/n)*sk.val.2 at hself
  change weightGrowthPotential cfg.directions K p sk.val.1.physical≤
    weightGrowthPotential cfg.directions K p s.val.1.physical+
    (cfg.B/n)*(s.val.2-sk.val.2)+recycledOutsideRiskCost cfg ε M hn p s k ω at hprev
  change Real.log (raw.process.accounts p).weight-Real.log (sk.val.1.physical.process.accounts p).weight≤
    (cfg.B/n)*augAdvance cfg ε M (x,zk.1.1)+selectedOutsideRiskIntegral cfg x.1.1 p
      (augAdvance cfg ε M (x,zk.1.1))+
    (rootDesignatedClock cfg.directions p raw.clocks-rootDesignatedClock cfg.directions p sk.val.1.physical.clocks)/(2-K) at hraw
  have he : recycledOutsideRiskCost cfg ε M hn p s (k+1) ω=
      recycledOutsideRiskCost cfg ε M hn p s k ω+selectedOutsideRiskIntegral cfg x.1.1 p
        (augAdvance cfg ε M (x,zk.1.1)) := by
    rw [recycledOutsideRiskCost,Finset.sum_range_succ]
    rw [augTimedOutsideRiskCost,if_neg hd]
    rfl
  rw [he]
  rw [sub_div] at hraw
  unfold weightGrowthPotential at hprev ⊢
  nlinarith

end NoThreeLine

#print axioms NoThreeLine.recycled_raw_weight_cap_requires_potential_risk
