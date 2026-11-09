import NoThreeLine.RecycledPhaseKernel
import NoThreeLine.RecycledCreditMartingale

/-! A running sum of observables of successive states preserves the
actual residual product, since the new value uses only the old and new
states. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine.RecycledBoardProcess

def sourceRestart {S W : Type*} (F : S × W → S × W) (g : S × S → ℝ)
    (x : (S × ℝ) × W) : (S × ℝ) × W :=
  let r := F (x.1.1,x.2)
  ((r.1,x.1.2+g (x.1.1,r.1)),r.2)

theorem sourceRestart_measurable {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (g : S × S → ℝ) (hg : Measurable g) :
    Measurable (sourceRestart F g) := by
  have hr : Measurable (fun x : (S × ℝ) × W => F (x.1.1,x.2)) :=
    hF.comp (measurable_fst.fst.prodMk measurable_snd)
  exact (hr.fst.prodMk (measurable_fst.snd.add
    (hg.comp (measurable_fst.fst.prodMk hr.fst)))).prodMk hr.snd

theorem sourceRestart_map {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (g : S × S → ℝ) (hg : Measurable g)
    (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ a, ν.map (fun w=>F (a,w))=((ν.map (fun w=>(F (a,w)).1)).prod ν))
    (a : S × ℝ) :
    ν.map (fun w=>sourceRestart F g (a,w))=
      (ν.map (fun w=>(sourceRestart F g (a,w)).1)).prod ν := by
  let d : S → S × ℝ := fun b=>(b,a.2+g (a.1,b))
  have hd : Measurable d := measurable_id.prodMk
    (measurable_const.add (hg.comp (measurable_const.prodMk measurable_id)))
  have hr : Measurable (fun w=>F (a.1,w)) := hF.comp (measurable_const.prodMk measurable_id)
  have hp : Measurable (fun r : S × W=>(d r.1,r.2)) :=
    (hd.comp measurable_fst).prodMk measurable_snd
  have h := congrArg (fun μ : Measure (S × W)=>μ.map (fun r=>(d r.1,r.2))) (hsection a.1)
  rw [Measure.map_map hp hr,
    map_pair_with_fresh_right _ _ d hd,Measure.map_map hd hr.fst] at h
  exact h

theorem sourceRestart_iterate_projection {S W : Type*}
    (F : S × W → S × W) (g : S × S → ℝ) (a : S × ℝ) (k : ℕ) (w : W) :
    ((iterate (sourceRestart F g) a k w).1.1,(iterate (sourceRestart F g) a k w).2)=
      iterate F a.1 k w := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change F ((iterate (sourceRestart F g) a k w).1.1,(iterate (sourceRestart F g) a k w).2)=_
    rw [ih]
    rfl

end NoThreeLine.RecycledBoardProcess

#print axioms NoThreeLine.RecycledBoardProcess.sourceRestart_map
#print axioms NoThreeLine.RecycledBoardProcess.sourceRestart_iterate_projection
