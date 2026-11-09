import NoThreeLine.ProtectedWholeGenerator
import NoThreeLine.ProtectedDeletionFlow

/-! Cost bounds for squares of actual whole-ledger jumps. The selected
endpoint corollaries derive future virtual bounds from the actual guard. -/
set_option autoImplicit false
noncomputable section
open Set
namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem protectedEntropyTotal_jumpSquare_cost_bound {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (saved : Grid n→ℝ) (positive : Grid n→Grid n→Bool) (L : LineIndex n) (E : Finset (Grid n)) (B K d γ : ℝ)
    (he : e.Valid B) (hm : ∀q,0≤mask q) (hn : 2≤n) (hB : 1≤B)
    (hd : 0≤d) (hdγ : d≤γ) (hBd : B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hvirtual : ∀q∈e.process.activeEvents,q∉L.val→virtualMass e.process Γ e.coordinates L q≤(n:ℝ)^γ) :
    (1-Real.log 2)*protectedObservableJumpSquareRate e saved Γ mask positive L (protectedEntropyTotal L E B)≤
      ((1+2*(Γ.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*
        protectedExternalEventRate e mask L (fun q=>protectedEventCost e Γ L E q) := by
  rw [protectedEntropyTotal_jumpSquare_eq_deletion e saved Γ mask positive L E B he.1 hs]
  exact protectedEntropy_event_square_rate e Γ mask L E B K d γ he hm hn hB hd hdγ hBd hE hs hsp hN hclock hK hvirtual

theorem protectedCreditTotal_jumpSquare_cost_bound {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (mask : Grid n→ℝ) (saved : Grid n→ℝ) (positive : Grid n→Grid n→Bool) (L : LineIndex n) (E : Finset (Grid n)) (B K d γ : ℝ)
    (he : e.Valid B) (hm : ∀q,0≤mask q) (hn : 1≤n) (hdγ : d≤γ) (hBd : B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hs : e.process.stopped=false) (hsp : specified Γ L)
    (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2)
    (hvirtual : ∀q∈e.process.activeEvents,q∉L.val→virtualMass e.process Γ e.coordinates L q≤(n:ℝ)^γ) :
    (1-Real.log 2)*protectedObservableJumpSquareRate e saved Γ mask positive L (protectedCreditTotal L E)≤
      ((1+2*(Γ.card:ℝ))*(n:ℝ)^γ)*
        protectedExternalEventRate e mask L (fun q=>protectedEventCost e Γ L E q) := by
  rw [protectedCreditTotal_jumpSquare_eq_deletion e saved Γ mask positive L E he.1 hs]
  exact protectedCredit_event_square_rate e Γ mask L E B K d γ he hm hn hdγ hBd hE hs hsp hN hclock hK hvirtual

theorem protectedWhole_augPre_square_cost_bounds {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B)
    (L : LineIndex n) (E : Finset (Grid n)) (saved : Grid n→ℝ) (positive : Grid n→Grid n→Bool)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hs : x.1.1.val.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy x.1.1.val.process L≤1) (hKcfg : cfg.K≤K) (hclock : x.1.1.val.clocks L≤K) (hK : K<2)
    (hinit : ∀q,virtualMass x.1.1.val.process cfg.directions x.1.1.val.coordinates L q≤(n:ℝ)^γ)
    (z : (ℝ×Grid n)×ℝ) :
    let e := (augPreState cfg ε ((n:ℝ)^γ) (x,z)).physical
    ((1-Real.log 2)*protectedObservableJumpSquareRate e saved cfg.directions cfg.mask positive L (protectedCreditTotal L E)≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*
        protectedExternalEventRate e cfg.mask L (fun q=>protectedEventCost e cfg.directions L E q)) ∧
    ((1-Real.log 2)*protectedObservableJumpSquareRate e saved cfg.directions cfg.mask positive L (protectedEntropyTotal L E cfg.B)≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*
        protectedExternalEventRate e cfg.mask L (fun q=>protectedEventCost e cfg.directions L E q)) := by
  let e := (augPreState cfg ε ((n:ℝ)^γ) (x,z)).physical
  have ht := augAdvance_mem cfg ε ((n:ℝ)^γ) x he z.1.1
  have htG : augAdvance cfg ε ((n:ℝ)^γ) (x,z.1.1)∈Icc (0:ℝ) (selectedGuardTime cfg x.1.1) :=
    ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε ((n:ℝ)^γ) x he).2⟩
  have hpre : e.Valid cfg.B := cappedPreState_valid cfg (augPhysicalInput cfg ε ((n:ℝ)^γ) x) he z
  have hcl : e.clocks L≤K :=
    selectedCurve_specifiedClock_le cfg x.1.1 he K hKcfg L hsp hN hclock _ htG
  have hv (q : Grid n) : virtualMass e.process cfg.directions e.coordinates L q≤(n:ℝ)^γ :=
    augPreState_virtual_upper cfg ε ((n:ℝ)^γ) x he L q (hinit q) z
  constructor
  · exact protectedCreditTotal_jumpSquare_cost_bound e cfg.directions cfg.mask saved positive L E cfg.B K d γ
      hpre cfg.mask_nonneg (by omega) hdγ hBd hE hs hsp hN hcl hK (fun q _ _=>hv q)
  · exact protectedEntropyTotal_jumpSquare_cost_bound e cfg.directions cfg.mask saved positive L E cfg.B K d γ
      hpre cfg.mask_nonneg hn hB hd hdγ hBd hE hs hsp hN hcl hK (fun q _ _=>hv q)

end NoThreeLine
#print axioms NoThreeLine.protectedEntropyTotal_jumpSquare_cost_bound
#print axioms NoThreeLine.protectedCreditTotal_jumpSquare_cost_bound
#print axioms NoThreeLine.protectedWhole_augPre_square_cost_bounds
