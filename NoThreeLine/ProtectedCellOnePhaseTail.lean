import NoThreeLine.ProtectedCellStopExponent
import NoThreeLine.ProtectedWholeStoppedCut

/-! The actual continuous exceedance in one phase is bounded by the
credit and entropy stopped-exponential maxima under the same law. -/
set_option autoImplicit false
set_option maxHeartbeats 3400000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness LineDrift

theorem protectedCell_onePhase_exponential_tail {n : ℕ}
    (cfg : FlowConfig n) (ε K d γ : ℝ) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hKcfg : cfg.K≤K) (hK : K<2) (hm : ∀q,cfg.mask q≤1) (hn0 : 0<n)
    (s : ProtectedTimedState cfg) (ho : occupancy s.1.val.1.physical.process L=N)
    (hk : s.1.val.1.physical.clocks L≤K) (hready : s.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ))
    (hsv : ∀q∈E,0≤s.2 q ∧ s.2 q≤2*cfg.B)
    (cap w rC rH vC vH θC θH : ℝ) (hcap : 0≤cap) (hw : 0≤w)
    (hθC : 0≤θC) (hθH : 0≤θH)
    (hC : protectedTimedCreditTotal cfg L E s+
      cfg.horizon*(((cfg.B/n)*(1-b N))*cap)+rC≤cap)
    (hH : protectedTimedEntropyTotal cfg L E s+
      cfg.horizon*(((cfg.B/n)*(1-b N))*((entropyLogConstant d*Real.log n)*max 1 cap))+rH≤w)
    (hVC : protectedCellCreditEnergyScale cfg γ*w≤(1-Real.log 2)*vC)
    (hVH : protectedCellEntropyEnergyScale cfg d γ*w≤(1-Real.log 2)*vH) :
    (phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn0 s.1).real
      (protectedActualExceedance cfg ε ((n:ℝ)^γ) L N E id hn0 s cap)≤
      Real.exp (-θC*rC+(θC^2/2)*vC)+Real.exp (-θH*rH+(θH^2/2)*vH) := by
  let M := (n:ℝ)^γ
  let Q := phaseLineForbiddenLaw cfg ε M K L N hn0 s.1
  have hB0 := zero_lt_one.trans_le hB
  letI : IsProbabilityMeasure Q := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn0 hB0 hm s.1 ho hk
  let cut := protectedCellStopCut cfg ε M L E cap
  let param := fun k ω=>w-cumulativeProtectedStateSource cfg ε M L (protectedWholeCostField cfg L E) hn0 s k ω
  have hp (k : ℕ) : @Measurable _ _ (protectedStateFiltration cfg ε M L hn0 s k) inferInstance (param k) :=
    measurable_const.sub (cumulativeProtectedStateSource_measurable_history cfg ε M L _
      ((protectedWholeCostRate_measurable cfg.directions cfg.mask L E).comp measurable_fst) hn0 s k)
  have hcut := protectedCellStopCut_measurable cfg ε M L E cap
  have hu (v : ProtectedTimedState cfg) (a : ℝ) : 0≤cut (v,a) :=
    (protectedCellStopCut_bounds cfg ε M L E cap (v,a)).1
  have hug (v : ProtectedTimedState cfg) (a : ℝ) : cut (v,a)≤augGuardTime cfg ε M (augTimedInput cfg v.1) :=
    (protectedCellStopCut_bounds cfg ε M L E cap (v,a)).2
  let GC := fun x : ExtendedState n×(Grid n→ℝ)=>protectedCreditTotal L E x.1 x.2
  let GH := fun x : ExtendedState n×(Grid n→ℝ)=>protectedEntropyTotal L E cfg.B x.1 x.2
  let FC := protectedCreditSourceField cfg L E
  let FH := protectedEntropySourceField cfg L E
  let VC := protectedCreditEnergyField cfg L E
  let VH := protectedEntropyEnergyField cfg L E
  let c0 := protectedTimedCreditTotal cfg L E s
  let h0 := protectedTimedEntropyTotal cfg L E s
  let c := Real.exp (θC*(c0+rC)-(θC^2/2)*vC)
  let h := Real.exp (θH*(h0+rH)-(θH^2/2)*vH)
  let U := {ω | ∃k,c≤protectedStoppedCutExponential cfg ε M L GC FC VC θC cut hn0 s param k ω}
  let V := {ω | ∃k,h≤protectedStoppedCutExponential cfg ε M L GH FH VH θH cut hn0 s param k ω}
  have hMC := protectedStoppedCreditCut_supermartingale cfg ε M K hKcfg hK L hsp N hN E hE hn0 hB0
    cut hcut hu hug θC hθC hm s ho hk hsv param hp
  have hMH := protectedStoppedEntropyCut_supermartingale cfg ε M K hKcfg hK L hsp N hN E hE hn0 hB0
    cut hcut hu hug θH hθH hm s ho hk hsv param hp
  have hPC := protectedStoppedCutExponential_maximal cfg ε M L GC FC VC θC cut hn0 s param Q hMC c (Real.exp_pos _)
  have hPH := protectedStoppedCutExponential_maximal cfg ε M L GH FH VH θH cut hn0 s param Q hMH h (Real.exp_pos _)
  have eq_exp (θ x r v : ℝ) : Real.exp (θ*x)/Real.exp (θ*(x+r)-(θ^2/2)*v)=
      Real.exp (-θ*r+(θ^2/2)*v) := by rw [←Real.exp_sub]; congr 1; ring
  have hUC : Q U≤ENNReal.ofReal (Real.exp (-θC*rC+(θC^2/2)*vC)) := by
    change Q U≤ENNReal.ofReal (Real.exp (θC*c0)/Real.exp (θC*(c0+rC)-(θC^2/2)*vC)) at hPC
    rwa [eq_exp] at hPC
  have hVH' : Q V≤ENNReal.ofReal (Real.exp (-θH*rH+(θH^2/2)*vH)) := by
    change Q V≤ENNReal.ofReal (Real.exp (θH*h0)/Real.exp (θH*(h0+rH)-(θH^2/2)*vH)) at hPH
    rwa [eq_exp] at hPH
  have hsub : ∀ᵐω∂Q, ω∈protectedActualExceedance cfg ε M L N E id hn0 s cap → ω∈U∪V := by
    filter_upwards [protectedCell_crossing_stopped_surplus_ae cfg ε K d γ L hsp N hN E hE hn hB hd
      hdγ hBd hKcfg hK hm hn0 s ho hk hready hsv cap w rC rH hcap hw hC hH] with ω hω
    intro hcross
    obtain ⟨k,t,hbefore,ht,hs⟩ := hω hcross
    have hpast (j : ℕ) (hj : j<k) : ω∉protectedCutReached cfg ε M L cut hn0 s param j :=
      not_lt_of_ge (hbefore j hj)
    have htime : t=0 ∨ (t=cut ((protectedRecycledPair cfg ε M L hn0 s k ω).1,param k ω) ∧
        ω∈protectedCutReached cfg ε M L cut hn0 s param k) := by
      rcases ht with hz | ⟨he,hl⟩
      · exact Or.inl hz
      · let v := (protectedRecycledPair cfg ε M L hn0 s k ω).1
        let d := v.1.val.2-(protectedRecycledPair cfg ε M L hn0 s (k+1) ω).1.1.val.2
        change t=cut (v,param k ω) at he
        change t<d at hl
        refine Or.inr ⟨he,?_⟩
        change cut (v,param k ω)<d
        rwa [←he]
    rcases hs with ⟨hs,hv⟩ | ⟨hs,hv⟩
    · exact Or.inl (protectedCellCut_level_le cfg ε M L E id FC VC θC hθC cut hn0 s param k ω t rC vC
        hpast htime hs ((mul_le_mul_iff_of_pos_left protectedEntropyCost_margin.1).mp (hv.trans hVC)))
    · exact Or.inr (protectedCellCut_level_le cfg ε M L E (protectedEntropy cfg.B) FH VH θH hθH cut hn0 s param
        k ω t rH vH hpast htime hs ((mul_le_mul_iff_of_pos_left protectedEntropyCost_margin.1).mp (hv.trans hVH)))
  have hmeas := (measure_mono_ae hsub).trans ((measure_union_le U V).trans (add_le_add hUC hVH'))
  rw [←ENNReal.ofReal_add (Real.exp_nonneg _) (Real.exp_nonneg _)] at hmeas
  exact (ENNReal.toReal_mono ENNReal.ofReal_ne_top hmeas).trans
    (ENNReal.toReal_ofReal (add_nonneg (Real.exp_nonneg _) (Real.exp_nonneg _))).le

end NoThreeLine

#print axioms NoThreeLine.protectedCell_onePhase_exponential_tail

