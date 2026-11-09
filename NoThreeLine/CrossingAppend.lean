import NoThreeLine.CrossingFlagPrepend

/-! Append an actual marked suffix on an unchanged residual board.
The incoming marked payload and the residual law give the exact
section integral, which transports the weighted comparison. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine

def crossingAppend {S W : Type*} (G : S×W→(S×Bool)×W) (x : (S×Bool)×W) : (S×Bool)×W :=
  let q := G (x.1.1,x.2)
  ((q.1.1,x.1.2 || q.1.2),q.2)

theorem crossingAppend_measurable {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (G : S×W→(S×Bool)×W) (hG : Measurable G) : Measurable (crossingAppend G) := by
  have h : Measurable (fun x : (S×Bool)×W=>G (x.1.1,x.2)) :=
    hG.comp (measurable_fst.fst.prodMk measurable_snd)
  have hb : Measurable (fun x : Bool×Bool=>x.1 || x.2) := measurable_of_countable _
  exact (h.fst.fst.prodMk (hb.comp (measurable_fst.snd.prodMk h.fst.snd))).prodMk h.snd

theorem crossingAppend_weighted_le {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (μ : Measure W) [IsProbabilityMeasure μ]
    (F : W→(S×Bool)×W) (hF : Measurable F)
    (hp : μ.map F=(μ.map (fun w=>(F w).1)).prod μ)
    (G : S×W→(S×Bool)×W) (hG : Measurable G)
    (V : S→ℝ) (hV : Measurable V) (c C : ℝ) (hc : 0≤c ∧ c≤C)
    (hC : ∀s,0≤V s ∧ V s≤C)
    (hfirst : (∫w,crossingFlagValue c (F w).1.2 ∂μ)≤∫w,crossingFlagValue (V (F w).1.1) (F w).1.2 ∂μ)
    (hmean : ∀w,(∫v,V (G ((F w).1.1,v)).1.1 ∂μ)=V (F w).1.1)
    (htail : ∀w,(∫v,crossingFlagValue c (G ((F w).1.1,v)).1.2 ∂μ)≤
      ∫v,crossingFlagValue (V (G ((F w).1.1,v)).1.1) (G ((F w).1.1,v)).1.2 ∂μ) :
    (∫w,crossingFlagValue c (crossingAppend G (F w)).1.2 ∂μ)≤
      ∫w,crossingFlagValue (V (crossingAppend G (F w)).1.1) (crossingAppend G (F w)).1.2 ∂μ := by
  let H := fun w=>(F w).1
  let R := fun w=>(F w).2
  letI : IsProbabilityMeasure (μ.map H) := Measure.isProbabilityMeasure_map hF.fst.aemeasurable
  let g := fun x : W×W=>(G ((F x.1).1.1,x.2)).1
  have hg : Measurable g := hG.fst.comp ((hF.fst.fst.comp measurable_fst).prodMk measurable_snd)
  have h := crossingFlagValue_prepend_sections_le μ H g hF.fst hg V hV c C hc hC hfirst hmean htail
  have hsplit (U : S×Bool→ℝ) (hU : Measurable U) (hUC : ∀x,0≤U x ∧ U x≤C) :
      (∫w,U (crossingAppend G (F w)).1 ∂μ)=
        ∫w,∫v,U ((g (w,v)).1,(H w).2 || (g (w,v)).2) ∂μ ∂μ := by
    let p := fun x : (S×Bool)×W=>U (crossingAppend G x).1
    have hpm : Measurable p := hU.comp (crossingAppend_measurable G hG).fst
    let q := fun a=>∫v,p (a,v) ∂μ
    have hq : Measurable q := hpm.stronglyMeasurable.integral_prod_right'.measurable
    have hi := GenericCreditIteration.bounded_nonnegative_integrable ((μ.map H).prod μ)
      p hpm C (fun x=>hUC _)
    have he := independent_history_setIntegral μ μ H R hF.fst hF.snd (by simpa only [H,R,Prod.eta] using hp)
      p q hpm hq hi (fun _=>rfl) univ MeasurableSet.univ
    simpa only [preimage_univ,setIntegral_univ,p,q,H,R,g,crossingAppend,Prod.eta] using he
  have hleft := hsplit (fun x=>crossingFlagValue c x.2)
    (crossingFlagValue_measurable.comp (measurable_const.prodMk measurable_snd))
    (fun x=>crossingFlagValue_bounds hc x.2)
  have hright := hsplit (fun x=>crossingFlagValue (V x.1) x.2)
    (crossingFlagValue_measurable.comp ((hV.comp measurable_fst).prodMk measurable_snd))
    (fun x=>crossingFlagValue_bounds (hC x.1) x.2)
  rw [hleft,hright]
  exact h

end NoThreeLine

#print axioms NoThreeLine.crossingAppend_weighted_le

