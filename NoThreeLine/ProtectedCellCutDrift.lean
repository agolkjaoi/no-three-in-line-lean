import NoThreeLine.ProtectedCellPrefixSourceCap
import NoThreeLine.ProtectedIncomingCutExponential

/-! The elapsed prefix and a real cut of its current segment share one
source budget. The signed entropy source retains the actual cost. -/
set_option autoImplicit false
set_option maxHeartbeats 2000000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness LineDrift

def cumulativeProtectedCutSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hn : 0<n)
    (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) (t : ℝ) : ℝ :=
  cumulativeProtectedStateSource cfg ε M L F hn s k ω+
    protectedLocalStateSource cfg F ((protectedRecycledPair cfg ε M L hn s k ω).1,t)

theorem protectedCellPrefixCut_sources_le {n : ℕ} (cfg : FlowConfig n) (ε M d : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (hE : E⊆L.val) (hsp : specified cfg.directions L)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hBd : cfg.B≤(n:ℝ)^d) (hm : ∀q,cfg.mask q≤1)
    (hn0 : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n)
    (N : ℕ) (hN : N≤1) (hsv : ∀q∈E,0≤s.2 q ∧ s.2 q≤2*cfg.B) (cap : ℝ) (k : ℕ)
    (ho : ∀j≤k,occupancy (protectedRecycledPair cfg ε M L hn0 s j ω).1.1.val.1.physical.process L=N)
    (hcap : ∀j<k,let v := (protectedRecycledPair cfg ε M L hn0 s j ω).1
      let w := (protectedRecycledPair cfg ε M L hn0 s (j+1) ω).1
      ∀u∈Ioo (0:ℝ) (v.1.val.2-w.1.val.2),protectedStateFlowTotal cfg L E id (v,u)≤cap)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (augGuardTime cfg ε M
      (augTimedInput cfg (protectedRecycledPair cfg ε M L hn0 s k ω).1.1)))
    (hcut : ∀u∈Ioo (0:ℝ) t,protectedStateFlowTotal cfg L E id
      ((protectedRecycledPair cfg ε M L hn0 s k ω).1,u)≤cap) :
    let elapsed := s.1.val.2-(protectedRecycledPair cfg ε M L hn0 s k ω).1.1.val.2+t
    let β := (cfg.B/n)*(1-b N)
    cumulativeProtectedCutSource cfg ε M L (protectedCreditSourceField cfg L E) hn0 s k ω t≤
      elapsed*(β*cap) ∧
    cumulativeProtectedCutSource cfg ε M L (protectedEntropySourceField cfg L E) hn0 s k ω t+
      cumulativeProtectedCutSource cfg ε M L (protectedWholeCostField cfg L E) hn0 s k ω t≤
        elapsed*(β*((entropyLogConstant d*Real.log n)*max 1 cap)) := by
  let v := (protectedRecycledPair cfg ε M L hn0 s k ω).1
  let elapsed := s.1.val.2-v.1.val.2
  let β := (cfg.B/n)*(1-b N)
  let C := protectedCreditSourceField cfg L E
  let H := protectedEntropySourceField cfg L E
  let V := protectedWholeCostField cfg L E
  let S := fun F=>cumulativeProtectedStateSource cfg ε M L F hn0 s k ω
  let U := fun F=>protectedLocalStateSource cfg F (v,t)
  have hp := protectedCellPrefix_sources_le cfg ε M d L E hE hsp hn hB hd hBd hm hn0 s ω N hN hsv cap k
    (fun j hj=>ho j hj.le) hcap
  change S C≤elapsed*(β*cap) ∧ S H+S V≤elapsed*(β*((entropyLogConstant d*Real.log n)*max 1 cap)) at hp
  have hsaved (q : Grid n) (hq : q∈E) : 0≤v.2 q ∧ v.2 q≤2*cfg.B :=
    protectedRecycledPair_saved_bounds_all cfg ε M L hsp q (hE hq) hn0 s (hsv q hq) k ω
  have hu := protectedCellSegment_sources_le cfg ε M d L E hE hsp hn hB hd hBd hm v N hN (ho k le_rfl)
    hsaved cap t ht hcut
  have hlocal : U C≤t*(β*cap) ∧ U H+U V≤t*(β*((entropyLogConstant d*Real.log n)*max 1 cap)) := by
    simpa only [U,protectedLocalStateSource,max_eq_right ht.1,C,H,V,β] using hu
  change S C+U C≤(elapsed+t)*(β*cap) ∧
    (S H+U H)+(S V+U V)≤(elapsed+t)*(β*((entropyLogConstant d*Real.log n)*max 1 cap))
  constructor
  · rw [add_mul]
    exact add_le_add hp.1 hlocal.1
  · rw [add_mul]
    linarith only [hp.2,hlocal.2]

theorem protectedCrossingDrift_surplus_or_cost
    (C0 C H0 H SC SH W c h gap w r : ℝ)
    (hC0 : C0≤c) (hC : c+gap≤C) (hH0 : H0≤h) (hH : 0≤H)
    (hSC : SC≤gap-r) (hSH : SH+W≤w-h-r) :
    (r≤C-SC-C0 ∧ W≤w) ∨ (r≤H-SH-H0 ∧ w<W) := by
  by_cases hw : W≤w
  · exact Or.inl ⟨by linarith,hw⟩
  · exact Or.inr ⟨by linarith [lt_of_not_ge hw],lt_of_not_ge hw⟩

end NoThreeLine

#print axioms NoThreeLine.protectedCellPrefixCut_sources_le
#print axioms NoThreeLine.protectedCrossingDrift_surplus_or_cost

