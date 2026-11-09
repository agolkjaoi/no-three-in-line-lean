import NoThreeLine.ObservedTerminalLaw

/-! A full-state residual product law passes to an actual terminal pair
when the pair stabilizes almost surely. No topology, stopping-time axiom,
or fresh terminal-law assumption is required. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Filter
namespace NoThreeLine

theorem residual_product_of_eventually_stable {Ω S W : Type*}
    [MeasurableSpace Ω] [MeasurableSpace S] [MeasurableSpace W]
    (μ : Measure Ω) (ν : Measure W) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (f : ℕ→Ω→S×W) (F : Ω→S×W) (hf : ∀k,Measurable (f k)) (hF : Measurable F)
    (hprod : ∀k,μ.map (f k)=(μ.map (fun ω=>(f k ω).1)).prod ν)
    (hstable : ∀ᵐω∂μ,∀ᶠk in atTop,f k ω=F ω) :
    μ.map F=(μ.map (fun ω=>(F ω).1)).prod ν := by
  let g := fun (k : ℕ) (z : Ω×W)=>((f k z.1).1,z.2)
  let G := fun z : Ω×W=>((F z.1).1,z.2)
  have hg (k : ℕ) : Measurable (g k) := ((hf k).fst.comp measurable_fst).prodMk measurable_snd
  have hG : Measurable G := (hF.fst.comp measurable_fst).prodMk measurable_snd
  have he (k : ℕ) : μ.map (f k)=(μ.prod ν).map (g k) := by
    rw [map_pair_with_fresh_right μ ν _ (hf k).fst]
    exact hprod k
  have hs : ∀ᵐz : Ω×W∂μ.prod ν,∀ᶠk in atTop,g k z=G z := by
    have hp : ∀ᵐz : Ω×W∂μ.prod ν,∀ᶠk in atTop,f k z.1=F z.1 :=
      Measure.quasiMeasurePreserving_fst.ae hstable
    filter_upwards [hp] with z hz
    filter_upwards [hz] with k hk
    dsimp only [g,G]
    rw [hk]
  have hh := map_eq_of_eventually_stable_marginals μ (μ.prod ν) f g F G hf hg hF hG he hstable hs
  rw [map_pair_with_fresh_right μ ν _ hF.fst] at hh
  exact hh

end NoThreeLine
#print axioms NoThreeLine.residual_product_of_eventually_stable
